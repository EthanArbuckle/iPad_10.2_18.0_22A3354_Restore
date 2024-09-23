@implementation _SFHairlineBorderView

- (void)layoutSubviews
{
  CGColor *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFHairlineBorderView;
  -[_SFHairlineBorderView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = -[UIColor CGColor](self->_borderColor, "CGColor");
  -[_SFHairlineBorderView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderColor:", v3);

}

- (void)setBorderColor:(id)a3
{
  UIColor *v5;
  UIColor *borderColor;
  char v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  borderColor = self->_borderColor;
  if (borderColor != v5)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](borderColor, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_borderColor, a3);
      -[_SFHairlineBorderView setNeedsLayout](self, "setNeedsLayout");
      v5 = v8;
    }
  }

}

- (_SFHairlineBorderView)initWithFrame:(CGRect)a3
{
  _SFHairlineBorderView *v3;
  double v4;
  void *v5;
  _SFHairlineBorderView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFHairlineBorderView;
  v3 = -[_SFHairlineBorderView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[_SFSiteIcon cornerRadius](_SFSiteIcon, "cornerRadius");
    -[_SFHairlineBorderView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:");
    v4 = _SFOnePixel();
    -[_SFHairlineBorderView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderWidth:", v4);

    v6 = v3;
  }

  return v3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
