@implementation SUUIFloatingOverlayView

- (SUUIFloatingOverlayView)initWithFrame:(CGRect)a3
{
  SUUIFloatingOverlayView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUIFloatingOverlayView;
  v3 = -[SUUIFloatingOverlayView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIFloatingOverlayView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[SUUIFloatingOverlayView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[SUUIFloatingOverlayView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 10.0);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithPrivateStyle:", 2020);
    objc_msgSend(v6, "inputSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setColorTint:", v9);

    objc_msgSend(v6, "setAutoresizingMask:", 18);
    -[SUUIFloatingOverlayView bounds](v3, "bounds");
    objc_msgSend(v6, "setFrame:");
    -[SUUIFloatingOverlayView addSubview:](v3, "addSubview:", v6);

  }
  return v3;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIFloatingOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  UIView *v8;
  void *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  v10 = v5;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    v8 = *p_contentView;
    if (*p_contentView)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[SUUIFloatingOverlayView addSubview:](self, "addSubview:", *p_contentView);
    }
  }

}

- (void)layoutSubviews
{
  UIView *contentView;
  double v4;
  double v5;
  double v6;
  double v7;

  contentView = self->_contentView;
  -[SUUIFloatingOverlayView bounds](self, "bounds");
  -[UIView setFrame:](contentView, "setFrame:", v4 + self->_contentInset.left, v5 + self->_contentInset.top, v6 - (self->_contentInset.left + self->_contentInset.right), v7 - (self->_contentInset.top + self->_contentInset.bottom));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  v6 = v5 + self->_contentInset.top + self->_contentInset.bottom;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
