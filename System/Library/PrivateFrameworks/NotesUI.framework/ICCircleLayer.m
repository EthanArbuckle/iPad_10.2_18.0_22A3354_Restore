@implementation ICCircleLayer

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v21;
  CGFloat v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  -[ICCircleLayer bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[ICCircleLayer strokeWidth](self, "strokeWidth");
  v14 = v13;
  -[ICCircleLayer strokeWidth](self, "strokeWidth");
  v16 = v15;
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  v24 = CGRectInset(v23, v14, v16);
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  -[ICCircleLayer strokeWidth](self, "strokeWidth");
  if (v21 > 0.0 && -[ICCircleLayer strokeColor](self, "strokeColor"))
  {
    -[ICCircleLayer strokeWidth](self, "strokeWidth");
    CGContextSetLineWidth(a3, v22);
    CGContextSetStrokeColorWithColor(a3, -[ICCircleLayer strokeColor](self, "strokeColor"));
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    CGContextStrokeEllipseInRect(a3, v25);
  }
  if (-[ICCircleLayer fillColor](self, "fillColor"))
  {
    CGContextSetFillColorWithColor(a3, -[ICCircleLayer fillColor](self, "fillColor"));
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    CGContextFillEllipseInRect(a3, v26);
  }
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (CGColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(CGColor *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CGColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(CGColor *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
