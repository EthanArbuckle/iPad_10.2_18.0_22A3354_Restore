@implementation FMFRefreshWrapperButton

- (FMFRefreshWrapperButton)initWithFrame:(CGRect)a3
{
  FMFRefreshWrapperButton *v3;
  FMFRefreshWrapperButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMFRefreshWrapperButton;
  v3 = -[FMFRefreshWrapperButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[FMFRefreshWrapperButton setWrapperInsets:](v3, "setWrapperInsets:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  return v4;
}

- (UIEdgeInsets)wrapperInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_wrapperInsets.top;
  left = self->_wrapperInsets.left;
  bottom = self->_wrapperInsets.bottom;
  right = self->_wrapperInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setWrapperInsets:(UIEdgeInsets)a3
{
  self->_wrapperInsets = a3;
}

@end
