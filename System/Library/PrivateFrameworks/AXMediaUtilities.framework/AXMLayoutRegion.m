@implementation AXMLayoutRegion

+ (id)region:(id)a3
{
  id v3;
  AXMLayoutRegion *v4;
  uint64_t v5;
  NSMutableArray *lines;

  v3 = a3;
  v4 = objc_alloc_init(AXMLayoutRegion);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
  v5 = objc_claimAutoreleasedReturnValue();

  lines = v4->_lines;
  v4->_lines = (NSMutableArray *)v5;

  return v4;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend((id)objc_opt_class(), "boundingFrameForItems:", self->_lines);
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

  objc_msgSend((id)objc_opt_class(), "normalizedBoundingFrameForItems:", self->_lines);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)addLine:(id)a3
{
  -[NSMutableArray addObject:](self->_lines, "addObject:", a3);
}

- (id)firstLine
{
  return (id)-[NSMutableArray firstObject](self->_lines, "firstObject");
}

- (id)lines
{
  return self->_lines;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
}

@end
