@implementation SUUIRedeemResultSimpleTableViewCell

- (void)setChildContentInsets:(UIEdgeInsets)a3
{
  self->_childContentInsets = a3;
  -[SUUIRedeemResultSimpleTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setChildContentView:(id)a3
{
  UIView *v5;
  UIView **p_childContentView;
  UIView *childContentView;
  BOOL v8;
  void *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_childContentView = &self->_childContentView;
  childContentView = self->_childContentView;
  v10 = v5;
  if (childContentView == v5)
  {
    if (!v5)
      goto LABEL_9;
    v8 = -[UIView isDescendantOfView:](v5, "isDescendantOfView:", self);
    v5 = v10;
    if (v8)
      goto LABEL_9;
LABEL_8:
    -[SUUIRedeemResultSimpleTableViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", *p_childContentView);

    -[SUUIRedeemResultSimpleTableViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
    goto LABEL_9;
  }
  if (-[UIView isDescendantOfView:](childContentView, "isDescendantOfView:", self))
    -[UIView removeFromSuperview](*p_childContentView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_childContentView, a3);
  v5 = v10;
  if (v10)
    goto LABEL_8;
LABEL_9:

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIRedeemResultSimpleTableViewCell;
  -[SUUIRedeemResultSimpleTableViewCell layoutSubviews](&v10, sel_layoutSubviews);
  -[UIView frame](self->_childContentView, "frame");
  v4 = v3;
  v6 = v5;
  -[SUUIRedeemResultSimpleTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = (v8 - v4) * 0.5;

  -[UIView setFrame:](self->_childContentView, "setFrame:", v9, self->_childContentInsets.top, v4, v6);
}

- (UIEdgeInsets)childContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_childContentInsets.top;
  left = self->_childContentInsets.left;
  bottom = self->_childContentInsets.bottom;
  right = self->_childContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIView)childContentView
{
  return self->_childContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childContentView, 0);
}

@end
