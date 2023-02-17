--CTE(Common Tbale Expression)

WITH CTE_Employees as
(SELECT FirstName, LastName, Gender, Salary
,COUNT(gender) OVER(PARTITION by Gender) as ToralGender
,AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
FROM SQLTutorial.EmplyeeDemographics emp
JOIN SQLTutorial.EmployeeSalary sal
    ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > '45000'
)
SELECT FirstName, AvgSalary
FROM CTE_Employee
