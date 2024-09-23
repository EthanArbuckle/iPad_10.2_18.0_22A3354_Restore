@implementation SRBigButtonView

- (SRBigButtonView)initWithFrame:(CGRect)a3
{
  SRBigButtonView *v3;
  uint64_t v4;
  SiriUIContentButton *button;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SRBigButtonView;
  v3 = -[SRBigButtonView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[SiriUIContentButton buttonWithMediumWeightFont](SiriUIContentButton, "buttonWithMediumWeightFont"));
    button = v3->_button;
    v3->_button = (SiriUIContentButton *)v4;

    *(_OWORD *)&v3->_edgeInsets.top = 0u;
    *(_OWORD *)&v3->_edgeInsets.bottom = 0u;
    -[SRBigButtonView addSubview:](v3, "addSubview:", v3->_button);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SRBigButtonView;
  -[SRBigButtonView layoutSubviews](&v13, "layoutSubviews");
  -[SRBigButtonView bounds](self, "bounds");
  top = self->_edgeInsets.top;
  if (top == 0.0)
  {
    *(CGRect *)&v9 = CGRectInset(*(CGRect *)&v3, 16.0, 16.0);
  }
  else
  {
    left = self->_edgeInsets.left;
    v9 = v3 + left;
    v10 = v4 + top;
    v11 = v5 - (left + self->_edgeInsets.right);
    v12 = v6 - (top + self->_edgeInsets.bottom);
  }
  -[SiriUIContentButton setFrame:](self->_button, "setFrame:", v9, v10, v11, v12);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  double v6;
  double top;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonView traitCollection](self, "traitCollection", a3.width, a3.height));
  if (objc_msgSend(v5, "isAmbientPresented"))
    v6 = 64.0;
  else
    v6 = 79.0;

  top = self->_edgeInsets.top;
  if (top != 0.0)
    v6 = v6 - (top + self->_edgeInsets.bottom);
  v8 = width;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)suppressVibrantBackground
{
  return 1;
}

- (void)viewInsetsInConversationView:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (SiriUIContentButton)button
{
  return self->_button;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
