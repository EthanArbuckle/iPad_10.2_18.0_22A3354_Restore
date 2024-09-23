@implementation AXMLayoutHeader

+ (id)header:(id)a3
{
  id v3;
  AXMLayoutHeader *v4;
  uint64_t v5;
  NSMutableArray *cells;

  v3 = a3;
  v4 = objc_alloc_init(AXMLayoutHeader);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
  v5 = objc_claimAutoreleasedReturnValue();

  cells = v4->_cells;
  v4->_cells = (NSMutableArray *)v5;

  return v4;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend((id)objc_opt_class(), "boundingFrameForItems:", self->_cells);
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

  objc_msgSend((id)objc_opt_class(), "normalizedBoundingFrameForItems:", self->_cells);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)addCell:(id)a3
{
  -[NSMutableArray addObject:](self->_cells, "addObject:", a3);
}

- (id)cells
{
  return self->_cells;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cells, 0);
}

@end
