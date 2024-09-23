@implementation EKUIViewWithCornerRadius

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[EKUIViewWithCornerRadius setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double cornerRadius;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKUIViewWithCornerRadius;
  -[EKUIViewWithCornerRadius layoutSubviews](&v6, sel_layoutSubviews);
  cornerRadius = self->_cornerRadius;
  if (cornerRadius == 0.0)
  {
    -[EKUIViewWithCornerRadius bounds](self, "bounds");
    cornerRadius = v4 * 0.5;
  }
  -[EKUIViewWithCornerRadius layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", cornerRadius);

}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end
