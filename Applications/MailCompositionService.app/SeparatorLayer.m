@implementation SeparatorLayer

+ (double)separatorHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "scale");
  v4 = 1.0 / v3;

  return v4;
}

- (SeparatorLayer)initWithFrame:(CGRect)a3
{
  SeparatorLayer *v3;
  SeparatorLayer *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SeparatorLayer;
  v3 = -[SeparatorLayer initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SeparatorLayer setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
    -[SeparatorLayer setAxis:](v4, "setAxis:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailHeaderSeparatorLayerColor](UIColor, "mailHeaderSeparatorLayerColor"));
    -[SeparatorLayer setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (void)setAxis:(unint64_t)a3
{
  double v3;
  _BOOL8 v5;
  _BOOL8 v6;
  double v7;
  double v8;
  double v9;

  self->_axis = a3;
  v5 = a3 != 0;
  v6 = a3 == 0;
  LODWORD(v3) = 1148846080;
  -[SeparatorLayer setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", v6, v3);
  LODWORD(v7) = 1148846080;
  -[SeparatorLayer setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", v6, v7);
  LODWORD(v8) = 1132068864;
  -[SeparatorLayer setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", v5, v8);
  LODWORD(v9) = 1132068864;
  -[SeparatorLayer setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", v5, v9);
  -[SeparatorLayer invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  double v6;
  double v7;
  unint64_t axis;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[SeparatorLayer separatorHeight](SeparatorLayer, "separatorHeight");
  v7 = v6;
  axis = self->_axis;
  if (axis == 1)
  {
    width = v6;
LABEL_5:
    v7 = height;
    goto LABEL_6;
  }
  if (axis)
    goto LABEL_5;
LABEL_6:
  v9 = width;
  result.height = v7;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SeparatorLayer sizeThatFits:](self, "sizeThatFits:", UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric);
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
