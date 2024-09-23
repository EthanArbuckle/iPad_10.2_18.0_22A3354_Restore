@implementation AXMLayoutReceipt

+ (id)region:(id)a3
{
  id v3;
  AXMLayoutReceipt *v4;
  uint64_t v5;
  NSMutableArray *rows;

  v3 = a3;
  v4 = objc_alloc_init(AXMLayoutReceipt);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
  v5 = objc_claimAutoreleasedReturnValue();

  rows = v4->_rows;
  v4->_rows = (NSMutableArray *)v5;

  return v4;
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

- (id)rows
{
  return self->_rows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
