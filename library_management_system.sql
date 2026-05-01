CREATE DATABASE library_db;
USE library_db;

CREATE TABLE Students (
student_id INT PRIMARY KEY,
name VARCHAR(50),
course VARCHAR(50)
);

CREATE TABLE Books ( 
book_id INT PRIMARY KEY,
title VARCHAR(100),
author VARCHAR(50),
available_copies int
);

CREATE TABLE Librarian (
librarian_id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE Issue (
issue_id INT PRIMARY KEY,
student_id INT,
book_id INT,
librarian_id INT,
issue_date DATE,
return_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id),
FOREIGN KEY (librarian_id) REFERENCES Librarian(librarian_id)
);

INSERT INTO Students VALUES
(1, 'Amit Sharma', 'MCA'),
(2, 'Neha Patil', 'BCA'),
(3, 'Rahul Verma', 'BBA'),
(4, 'Sneha Joshi', 'MBA'),
(5, 'Priya Singh', 'MCA');

INSERT INTO Books VALUES
(101, 'DBMS', 'Korth', 7),
(102, 'JAVA', 'James Gosling', 5),
(103, 'Python', 'Guide',  7),
(104, 'C++', 'Bjarne Stroustrup', 3),
(105, 'Data Structures', 'Mark Allen Weiss',  5),
(106, 'Operating System', 'Galvin', 4),
(107, 'Software Engineering', 'Perssman', 3);

INSERT INTO Librarian VALUES
(11, 'Mr. Sharma'),
(12, 'Mr. Patil'),
(13, 'Mr. Varma');

INSERT INTO Issue VALUES
(1, 1, 101, 11, '2026-04-01', '2026-04-10'),
(2, 2, 102, 11, '2026-04-02', NULL),
(3, 3, 103, 12, '2026-04-03', '2026-04-12'),
(4, 4, 104, 12, '2026-04-04', NULL),
(5, 5, 105, 11, '2026-04-05', '2026-04-15'),
(6, 1, 106, 12, '2026-04-06', NULL),
(7, 2, 107, 11, '2026-04-07', '2026-04-16'),
(8, 3, 101, 12, '2026-04-08', NULL),
(9, 4, 102, 11, '2026-04-09', '2026-04-18'),
(10, 5, 103, 12, '2026-04-10', NULL);

UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = 101;

UPDATE Issue
SET return_date = '2026-04-10'
WHERE issue_id = 1;

UPDATE Books
SET available_copies = available_copies + 1
WHERE book_id = 101;

SELECT s.name AS student, 
b.title AS book, 
l.name AS librarian, 
i.issue_date, 
i.return_date 
FROM Issue i 
JOIN Students s ON i.student_id = s.student_id
JOIN Books b ON i.book_id = b.book_id
JOIN Librarian l ON i.librarian_id = l.librarian_id;

SELECT * FROM Books
WHERE available_copies > 0;

SELECT student_id, COUNT(*) AS total_books
FROM Issue
GROUP BY student_id;