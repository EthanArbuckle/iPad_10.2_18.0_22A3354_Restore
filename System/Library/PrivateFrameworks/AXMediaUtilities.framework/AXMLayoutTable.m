@implementation AXMLayoutTable

+ (id)region:(id)a3 row:(id)a4
{
  AXMLayoutHeader *v5;
  id v6;
  AXMLayoutTable *v7;
  AXMLayoutHeader *header;
  AXMLayoutHeader *v9;
  uint64_t v10;
  NSMutableArray *rows;
  uint64_t v12;
  NSMutableArray *columns;

  v5 = (AXMLayoutHeader *)a3;
  v6 = a4;
  v7 = objc_alloc_init(AXMLayoutTable);
  header = v7->_header;
  v7->_header = v5;
  v9 = v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
  v10 = objc_claimAutoreleasedReturnValue();

  rows = v7->_rows;
  v7->_rows = (NSMutableArray *)v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = objc_claimAutoreleasedReturnValue();
  columns = v7->_columns;
  v7->_columns = (NSMutableArray *)v12;

  return v7;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend((id)objc_opt_class(), "boundingFrameForItems:", self->_rows);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)normalizedFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend((id)objc_opt_class(), "normalizedBoundingFrameForItems:", self->_rows);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)addRow:(id)a3
{
  -[NSMutableArray addObject:](self->_rows, "addObject:", a3);
}

- (id)firstLine
{
  return (id)-[NSMutableArray firstObject](self->_rows, "firstObject");
}

- (id)header
{
  return self->_header;
}

- (void)addColumn:(id)a3
{
  -[NSMutableArray addObject:](self->_columns, "addObject:", a3);
}

- (id)firstColumn
{
  return (id)-[NSMutableArray firstObject](self->_columns, "firstObject");
}

- (id)rows
{
  return self->_rows;
}

- (id)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
