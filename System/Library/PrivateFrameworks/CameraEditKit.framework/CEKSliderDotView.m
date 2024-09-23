@implementation CEKSliderDotView

- (CEKSliderDotView)initWithFrame:(CGRect)a3
{
  CEKSliderDotView *v3;
  CEKSliderDotView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CEKSliderDotView;
  v3 = -[CEKSliderDotView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CEKSliderDotView setContentMode:](v3, "setContentMode:", 3);
  return v4;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)setUseLegibilityShadow:(BOOL)a3
{
  if (self->_useLegibilityShadow != a3)
  {
    self->_useLegibilityShadow = a3;
    -[CEKSliderDotView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  -[CEKSliderDotView bounds](self, "bounds");
  CGContextClearRect(CurrentContext, v20);
  v9 = CEKPixelWidthForView(self);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v22 = CGRectInset(v21, 1.0, 1.0);
  v10 = v22.origin.x;
  v11 = v22.origin.y;
  v12 = v22.size.width;
  v13 = v22.size.height;
  if (-[CEKSliderDotView useLegibilityShadow](self, "useLegibilityShadow"))
  {
    v23.origin.x = v10;
    v23.origin.y = v11;
    v23.size.width = v12;
    v23.size.height = v13;
    v24 = CGRectInset(v23, -v9, -v9);
    v14 = v24.origin.x;
    v15 = v24.origin.y;
    v16 = v24.size.width;
    v17 = v24.size.height;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "set");
    v25.origin.x = v14;
    v25.origin.y = v15;
    v25.size.width = v16;
    v25.size.height = v17;
    CGContextFillEllipseInRect(CurrentContext, v25);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.400000006, 1.0);
  }
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "set");
  v26.origin.x = v10;
  v26.origin.y = v11;
  v26.size.width = v12;
  v26.size.height = v13;
  CGContextFillEllipseInRect(CurrentContext, v26);

}

- (BOOL)useLegibilityShadow
{
  return self->_useLegibilityShadow;
}

@end
