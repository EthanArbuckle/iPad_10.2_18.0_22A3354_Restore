@implementation ICArcLayer

- (void)drawInContext:(CGContext *)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat MidX;
  CGFloat MidY;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[ICArcLayer bounds](self, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v9 = CGRectGetWidth(v20) * 0.5;
  -[ICCircleLayer strokeWidth](self, "strokeWidth");
  v11 = v9 - v10;
  CGContextGetCTM(&v19, a3);
  CGContextScaleCTM(a3, 1.0, -1.0);
  -[ICArcLayer bounds](self, "bounds");
  CGContextTranslateCTM(a3, 0.0, -v12);
  CGContextSetLineCap(a3, kCGLineCapRound);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MidY = CGRectGetMidY(v22);
  -[ICArcLayer startAngle](self, "startAngle");
  v16 = v15;
  -[ICArcLayer endAngle](self, "endAngle");
  CGContextAddArc(a3, MidX, MidY, v11, v16, v17, -[ICArcLayer drawClockwise](self, "drawClockwise"));
  -[ICCircleLayer strokeWidth](self, "strokeWidth");
  CGContextSetLineWidth(a3, v18);
  CGContextSetStrokeColorWithColor(a3, -[ICCircleLayer strokeColor](self, "strokeColor"));
  CGContextStrokePath(a3);
}

- (double)startAngle
{
  return self->_startAngle;
}

- (void)setStartAngle:(double)a3
{
  self->_startAngle = a3;
}

- (double)endAngle
{
  return self->_endAngle;
}

- (void)setEndAngle:(double)a3
{
  self->_endAngle = a3;
}

- (BOOL)drawClockwise
{
  return self->_drawClockwise;
}

- (void)setDrawClockwise:(BOOL)a3
{
  self->_drawClockwise = a3;
}

@end
