@implementation SUUISimpleCollectionViewCell

- (void)setContentChildView:(id)a3
{
  UIView *v5;
  UIView **p_contentChildView;
  UIView *contentChildView;
  void *v8;
  UIView *v9;
  void *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  p_contentChildView = &self->_contentChildView;
  contentChildView = self->_contentChildView;
  v11 = v5;
  if (contentChildView != v5)
  {
    if (-[UIView isDescendantOfView:](contentChildView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](*p_contentChildView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentChildView, a3);
    -[SUUISimpleCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = *p_contentChildView;
  }
  if (v5 && !-[UIView isDescendantOfView:](v5, "isDescendantOfView:", self))
  {
    -[SUUISimpleCollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *p_contentChildView;
    -[SUUISimpleCollectionViewCell backgroundColor](self, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    objc_msgSend(v8, "addSubview:", *p_contentChildView);
    -[SUUISimpleCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[SUUISimpleCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISimpleCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  v6.receiver = self;
  v6.super_class = (Class)SUUISimpleCollectionViewCell;
  -[SUUISimpleCollectionViewCell applyLayoutAttributes:](&v6, sel_applyLayoutAttributes_, v4);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUISimpleCollectionViewCell;
  -[SUUISimpleCollectionViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[SUUISimpleCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView setFrame:](self->_contentChildView, "setFrame:", v5 + self->_contentInsets.left, v7 + self->_contentInsets.top, v9 - (self->_contentInsets.left + self->_contentInsets.right), v11 - (self->_contentInsets.top + self->_contentInsets.bottom));
}

- (void)setBackgroundColor:(id)a3
{
  UIView *contentChildView;
  id v5;
  objc_super v6;

  contentChildView = self->_contentChildView;
  v5 = a3;
  -[UIView setBackgroundColor:](contentChildView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUISimpleCollectionViewCell;
  -[SUUISimpleCollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (UIView)contentChildView
{
  return self->_contentChildView;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentChildView, 0);
}

@end
