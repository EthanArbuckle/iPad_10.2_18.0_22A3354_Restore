@implementation FIUIChartBackgroundView

- (FIUIChartBackgroundView)initWithFrame:(CGRect)a3
{
  FIUIChartBackgroundView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FIUIChartBackgroundView;
  v3 = -[FIUIChartBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIChartBackgroundView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[FIUIChartBackgroundView setOpaque:](v3, "setOpaque:", 0);
  }
  return v3;
}

- (UIEdgeInsets)lineInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_lineInsets.top;
  left = self->_lineInsets.left;
  bottom = self->_lineInsets.bottom;
  right = self->_lineInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLineInsets:(UIEdgeInsets)a3
{
  self->_lineInsets = a3;
}

@end
