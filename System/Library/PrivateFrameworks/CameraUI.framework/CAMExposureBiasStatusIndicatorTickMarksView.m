@implementation CAMExposureBiasStatusIndicatorTickMarksView

- (CAMExposureBiasStatusIndicatorTickMarksView)initWithFrame:(CGRect)a3
{
  CAMExposureBiasStatusIndicatorTickMarksView *v3;
  CAMExposureBiasStatusIndicatorTickMarksView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMExposureBiasStatusIndicatorTickMarksView;
  v3 = -[CAMExposureBiasStatusIndicatorTickMarksView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CAMExposureBiasStatusIndicatorTickMarksView setOpaque:](v3, "setOpaque:", 0);
  return v4;
}

- (void)setSelectedRange:(_NSRange)a3
{
  if (self->_selectedRange.location != a3.location || self->_selectedRange.length != a3.length)
  {
    self->_selectedRange = a3;
    -[CAMExposureBiasStatusIndicatorTickMarksView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 37.0;
  v3 = 6.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  CGContext *CurrentContext;
  void *v7;
  uint64_t i;
  double v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  void *v13;
  id v14;
  CGRect v15;

  -[CAMExposureBiasStatusIndicatorTickMarksView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  CAMYellowColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 13; ++i)
  {
    if (-1431655765 * i >= 0x55555556)
      v9 = 3.0;
    else
      v9 = 6.0;
    v10 = -[CAMExposureBiasStatusIndicatorTickMarksView selectedRange](self, "selectedRange");
    v12 = i - v10 < v11 && i >= v10;
    v13 = v14;
    if (v12)
      v13 = v7;
    objc_msgSend(v13, "set");
    v15.size.width = 1.0;
    v15.origin.x = (double)i * 3.0;
    v15.origin.y = v5 - v9;
    v15.size.height = v9;
    CGContextFillRect(CurrentContext, v15);
  }

}

- (_NSRange)selectedRange
{
  _NSRange *p_selectedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_selectedRange = &self->_selectedRange;
  location = self->_selectedRange.location;
  length = p_selectedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

@end
