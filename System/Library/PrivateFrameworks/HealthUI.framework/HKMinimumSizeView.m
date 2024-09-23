@implementation HKMinimumSizeView

- (HKMinimumSizeView)initWithFrame:(CGRect)a3
{
  HKMinimumSizeView *result;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMinimumSizeView;
  result = -[HKMinimumSizeView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    v4 = *MEMORY[0x1E0DC55F0];
    result->_minimumWidth = *(double *)MEMORY[0x1E0DC55F0];
    result->_minimumHeight = v4;
  }
  return result;
}

- (void)setMinimumWidth:(double)a3
{
  self->_minimumWidth = a3;
  -[HKMinimumSizeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
  -[HKMinimumSizeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)intrinsicContentSize
{
  double minimumWidth;
  double minimumHeight;
  CGSize result;

  minimumWidth = self->_minimumWidth;
  minimumHeight = self->_minimumHeight;
  result.height = minimumHeight;
  result.width = minimumWidth;
  return result;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (double)minimumWidth
{
  return self->_minimumWidth;
}

@end
