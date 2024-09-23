@implementation _SLSheetMaskLayer

- (void)drawInContext:(CGContext *)a3
{
  double x;
  double y;
  double width;
  double height;
  void *v9;
  double v10;
  id v11;
  id v12;
  CGRect v13;
  CGRect v14;

  CGContextSaveGState(a3);
  -[_SLSheetMaskLayer bounds](self, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  CGContextAddRect(a3, v13);
  v9 = (void *)MEMORY[0x1E0CEA390];
  -[_SLSheetMaskLayer clipCornerRadius](self, "clipCornerRadius");
  objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextAddPath(a3, (CGPathRef)objc_msgSend(v11, "CGPath"));

  CGContextEOClip(a3);
  -[_SLSheetMaskLayer clipBackgroundColor](self, "clipBackgroundColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v12, "CGColor"));

  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  CGContextFillRect(a3, v14);
  CGContextRestoreGState(a3);
}

- (double)clipCornerRadius
{
  return self->_clipCornerRadius;
}

- (void)setClipCornerRadius:(double)a3
{
  self->_clipCornerRadius = a3;
}

- (UIColor)clipBackgroundColor
{
  return self->_clipBackgroundColor;
}

- (void)setClipBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_clipBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipBackgroundColor, 0);
}

@end
