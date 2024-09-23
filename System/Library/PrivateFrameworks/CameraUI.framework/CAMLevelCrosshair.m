@implementation CAMLevelCrosshair

+ (void)_drawCrosshairInContext:(CGContext *)a3 withBounds:(CGRect)a4 strokeWidth:(double)a5 color:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat MinY;
  CGFloat MaxY;
  CGFloat MinX;
  CGFloat MaxX;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a6, "setStroke", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
  UIRectGetCenter();
  v12 = v11;
  v14 = v13;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MinY = CGRectGetMinY(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MaxY = CGRectGetMaxY(v20);
  CGContextMoveToPoint(a3, v12, MinY);
  CGContextAddLineToPoint(a3, v12, MaxY);
  CGContextDrawPath(a3, kCGPathStroke);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MinX = CGRectGetMinX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MaxX = CGRectGetMaxX(v22);
  CGContextMoveToPoint(a3, MinX, v14);
  CGContextAddLineToPoint(a3, MaxX, v14);
  CGContextDrawPath(a3, kCGPathStroke);
}

- (CAMLevelCrosshair)initWithFrame:(CGRect)a3
{
  CAMLevelCrosshair *v3;
  CAMLevelCrosshair *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMLevelCrosshair;
  v3 = -[CAMLevelCrosshair initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CAMLevelCrosshair _commonCAMLevelCrosshairInitialization](v3, "_commonCAMLevelCrosshairInitialization");
  return v4;
}

- (CAMLevelCrosshair)initWithCoder:(id)a3
{
  CAMLevelCrosshair *v3;
  CAMLevelCrosshair *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMLevelCrosshair;
  v3 = -[CAMLevelCrosshair initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[CAMLevelCrosshair _commonCAMLevelCrosshairInitialization](v3, "_commonCAMLevelCrosshairInitialization");
  return v4;
}

- (void)_commonCAMLevelCrosshairInitialization
{
  -[CAMLevelCrosshair setOpaque:](self, "setOpaque:", 0);
  -[CAMLevelCrosshair setContentMode:](self, "setContentMode:", 3);
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[CAMLevelCrosshair setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  void *v14;
  CGContextRef CurrentContext;
  id v16;

  -[CAMLevelCrosshair bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[CAMLevelCrosshair isHighlighted](self, "isHighlighted");
  v13 = CAMPixelWidthForView(self);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend((id)objc_opt_class(), "_drawCrosshairInContext:withBounds:strokeWidth:color:", CurrentContext, v16, v5, v7, v9, v11, v13 * 2.0 + 1.0);
  objc_msgSend((id)objc_opt_class(), "_drawCrosshairInContext:withBounds:strokeWidth:color:", CurrentContext, v14, v5, v7, v9, v11, 1.0);

}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

@end
