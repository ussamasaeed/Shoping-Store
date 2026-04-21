-- Create all Tables and database

CREATE TABLE customer_tb(
	cus_id SERIAL PRIMARY KEY,
	cus_name VARCHAR(50) NOT NULL);

CREATE TABLE order_tb(
	ord_id SERIAL PRIMARY KEY,
	ord_date DATE NOT NULL,
	cus_id INTEGER NOT NULL,
	FOREIGN KEY (cus_id) REFERENCES customer_tb(cus_id));

CREATE TABLE product_tb(
	pro_id SERIAL PRIMARY KEY,
	pro_name VARCHAR(100) NOT NULL,
	pro_price NUMERIC NOT NULL);

CREATE TABLE order_item(
	item_id SERIAL PRIMARY KEY,
	ord_id INTEGER NOT NULL,
	pro_id INTEGER NOT NULL,
	quntity INTEGER NOT NULL,
	FOREIGN KEY (ord_id) REFERENCES order_tb(ord_id),
	FOREIGN KEY (pro_id) REFERENCES product_tb(pro_id));


-- 2. Insert 5 Pakistani Customers 
-- (Bilal and Ayesha will have no orders)
INSERT INTO customer_tb (cus_name) VALUES 
('Zubair Ahmed'),      
('Sana Khan'),         
('Haris Mahmood'),     
('Bilal Siddiqui'),    
('Ayesha Malik');      

-- 3. Insert 6 Hardware Products 
-- (Ladder and Toolbox will not be ordered)
INSERT INTO product_tb (pro_name, pro_price) VALUES 
('Power Drill', 8500.00),
('Screwdriver Set', 1200.00),
('Steel Hammer', 950.00),
('Measuring Tape', 450.00),
('Folding Ladder', 15000.00),
('Metal Toolbox', 3500.00);

-- 4. Insert Orders 
INSERT INTO order_tb (ord_date, cus_id) VALUES 
('2024-03-01', 11), -- Zubair's Order
('2024-03-05', 12), -- Sana's Order
('2024-03-10', 13); -- Haris's Order

-- 5. Insert Order Items (Linking Customers to Products)
INSERT INTO order_item (ord_id, pro_id, quntity) VALUES 
(13, 7, 1), -- Zubair: Single Product (Power Drill)
(14, 8, 2), -- Sana: Multiple Product Part 1 (Screwdriver Set)
(14, 9, 1), -- Sana: Multiple Product Part 2 (Hammer)
(15, 7, 1), -- Haris: Multiple Product Part 1 (Power Drill)
(15, 10, 3); -- Haris: Multiple Product Part 2 (Measuring Tape)
