@implementation HKSeparatorLineView

+ (id)_hkecg_separatorView
{
  HKSeparatorLineView *v2;
  void *v3;

  v2 = objc_alloc_init(HKSeparatorLineView);
  -[HKSeparatorLineView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSeparatorLineView setColor:](v2, "setColor:", v3);

  -[HKSeparatorLineView setSeparatorThickness:](v2, "setSeparatorThickness:", HKUIFloorToScreenScale(0.5));
  -[HKSeparatorLineView setDashStyle:](v2, "setDashStyle:", 2);
  return v2;
}

- (HKSeparatorLineView)initWithFrame:(CGRect)a3
{
  HKSeparatorLineView *v3;
  uint64_t v4;
  UIColor *color;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKSeparatorLineView;
  v3 = -[HKSeparatorLineView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = objc_claimAutoreleasedReturnValue();
    color = v3->_color;
    v3->_color = (UIColor *)v4;

    v3->_separatorThickness = 1.0;
    v3->_dashStyle = 0;
    v3->_leadingMargin = 0.0;
    v3->_trailingMargin = 0.0;
  }
  return v3;
}

- (HKSeparatorLineView)init
{
  return -[HKSeparatorLineView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (CGSize)intrinsicContentSize
{
  _BOOL4 v3;
  double separatorThickness;
  double v5;
  CGSize result;

  v3 = -[HKSeparatorLineView _isVertical](self, "_isVertical");
  separatorThickness = self->_separatorThickness;
  if (v3)
    v5 = self->_separatorThickness;
  else
    v5 = 0.0;
  if (v3)
    separatorThickness = 0.0;
  result.height = separatorThickness;
  result.width = v5;
  return result;
}

- (void)setDashStyle:(int64_t)a3
{
  self->_dashStyle = a3;
  -[HKSeparatorLineView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
  -[HKSeparatorLineView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
  -[HKSeparatorLineView setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)_isVertical
{
  double v2;
  double v3;

  -[HKSeparatorLineView frame](self, "frame");
  return v2 < v3;
}

- (BOOL)isOpaque
{
  return 1;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  -[HKSeparatorLineView backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  v19 = objc_retainAutorelease(v12);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v19, "CGColor"));
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  CGContextFillRect(CurrentContext, v20);
  -[HKSeparatorLineView _applyStyleToContext:](self, "_applyStyleToContext:", CurrentContext);
  -[HKSeparatorLineView frame](self, "frame");
  v14 = v13;
  v16 = v15;
  if (-[HKSeparatorLineView _isVertical](self, "_isVertical"))
  {
    v17 = v14 * 0.5;
    CGContextMoveToPoint(CurrentContext, v17, self->_leadingMargin);
    v18 = v16 - self->_leadingMargin - self->_trailingMargin;
  }
  else
  {
    v18 = v16 * 0.5;
    CGContextMoveToPoint(CurrentContext, self->_leadingMargin, v18);
    v17 = v14 - self->_leadingMargin - self->_trailingMargin;
  }
  CGContextAddLineToPoint(CurrentContext, v17, v18);
  CGContextStrokePath(CurrentContext);

}

- (void)_applyStyleToContext:(CGContext *)a3
{
  unint64_t v5;

  CGContextSetStrokeColorWithColor(a3, -[UIColor CGColor](self->_color, "CGColor"));
  CGContextSetLineWidth(a3, self->_separatorThickness);
  v5 = self->_dashStyle - 1;
  if (v5 <= 3)
    CGContextSetLineDash(a3, 0.0, (const CGFloat *)*(&off_1E9C41258 + v5), 2uLL);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (double)separatorThickness
{
  return self->_separatorThickness;
}

- (void)setSeparatorThickness:(double)a3
{
  self->_separatorThickness = a3;
}

- (int64_t)dashStyle
{
  return self->_dashStyle;
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
