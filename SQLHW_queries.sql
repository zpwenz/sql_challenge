Select first_name, last_name, gender, salary, "Employees".emp_no
FROM "Employees" INNER JOIN "Salaries"
ON "Employees".emp_no = "Salaries".emp_no;

Select first_name, last_name, hire_date
FROM "Employees"
WHERE "Employees".hire_date >= '1986-01-01' AND "Employees".hire_date < '1987-01-01';

Select dept_no, "Manager".emp_no, "Manager".from_date, "Manager".to_date, first_name, last_name
From "Manager" INNER JOIN "Employees"
ON "Manager".emp_no = "Employees".emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
Select "Employees".emp_no, last_name, first_name, dept_name
FROM "Employees", "Department_Employee", "Departments"
WHERE "Employees".emp_no = "Department_Employee".emp_no AND "Department_Employee".dept_no = "Departments".dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
Select first_name, last_name
FROM "Employees"
WHERE "Employees".first_name LIKE 'Hercules' AND "Employees".last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select first_name, last_name, "Employees".emp_no, dept_name
FROM "Employees", "Departments", "Department_Employee"
WHERE "Employees".emp_no = "Department_Employee".emp_no AND "Department_Employee".dept_no = "Departments".dept_no AND "Departments".dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select first_name, last_name, "Employees".emp_no, dept_name
FROM "Employees", "Departments", "Department_Employee"
WHERE "Employees".emp_no = "Department_Employee".emp_no AND "Department_Employee".dept_no = "Departments".dept_no AND ("Departments".dept_name = 'Sales' OR "Departments".dept_name ='Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select last_name, count(last_name)
FROM "Employees"
Group By last_name
ORDER BY count DESC