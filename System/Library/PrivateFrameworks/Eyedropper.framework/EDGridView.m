@implementation EDGridView

- (EDGridView)initWithWithCellCount:(int64_t)a3
{
  EDGridView *v4;
  EDGridView *v5;
  uint64_t v6;
  UIColor *strokeColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EDGridView;
  v4 = -[EDGridView init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_cellCount = a3;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v6 = objc_claimAutoreleasedReturnValue();
    strokeColor = v5->_strokeColor;
    v5->_strokeColor = (UIColor *)v6;

  }
  return v5;
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
  -[EDGridView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  double v5;
  double v6;
  double v7;
  double cellCount;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint points;
  double v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetStrokeColorWithColor(CurrentContext, -[UIColor CGColor](self->_strokeColor, "CGColor"));
  -[EDGridView bounds](self, "bounds");
  v7 = v6;
  cellCount = (double)self->_cellCount;
  v9 = v5 / cellCount;
  if (v5 / cellCount < v5)
  {
    v10 = v5;
    v11 = v5 / cellCount;
    do
    {
      points.x = v11;
      points.y = 0.0;
      v14 = v11;
      v15 = v7;
      CGContextStrokeLineSegments(CurrentContext, &points, 2uLL);
      v11 = v9 + v11;
    }
    while (v11 < v10);
  }
  if (v9 < v7)
  {
    v12 = v9;
    do
    {
      points.x = 0.0;
      points.y = v12;
      v14 = v7;
      v15 = v12;
      CGContextStrokeLineSegments(CurrentContext, &points, 2uLL);
      v12 = v9 + v12;
    }
    while (v12 < v7);
  }
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
