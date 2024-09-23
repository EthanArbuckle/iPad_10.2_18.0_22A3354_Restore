@implementation SUUIShelfCollectionViewCell

- (void)setCollectionView:(id)a3
{
  UICollectionView *v5;
  UICollectionView **p_collectionView;
  UICollectionView *collectionView;
  void *v8;
  UICollectionView *v9;
  void *v10;
  UICollectionView *v11;

  v5 = (UICollectionView *)a3;
  p_collectionView = &self->_collectionView;
  collectionView = self->_collectionView;
  v11 = v5;
  if (collectionView != v5)
  {
    if (-[UICollectionView isDescendantOfView:](collectionView, "isDescendantOfView:", self))
      -[UICollectionView removeFromSuperview](*p_collectionView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_collectionView, a3);
    -[UICollectionView setSemanticContentAttribute:](*p_collectionView, "setSemanticContentAttribute:", -[SUUIShelfCollectionViewCell semanticContentAttribute](self, "semanticContentAttribute"));
    -[SUUIShelfCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = *p_collectionView;
  }
  if (v5 && (-[UICollectionView isDescendantOfView:](v5, "isDescendantOfView:", self) & 1) == 0)
  {
    -[SUUIShelfCollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *p_collectionView;
    -[SUUIShelfCollectionViewCell backgroundColor](self, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    objc_msgSend(v8, "addSubview:", *p_collectionView);
    -[SUUIShelfCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIShelfCollectionViewCell;
  -[SUUIShelfCollectionViewCell setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[UICollectionView setSemanticContentAttribute:](self->_collectionView, "setSemanticContentAttribute:", a3);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIShelfCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  if (self->_rendersWithPerspective != a3)
  {
    self->_rendersWithPerspective = a3;
    -[SUUIShelfCollectionViewCell updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
  }
}

- (void)setRendersWithParallax:(BOOL)a3
{
  if (self->_rendersWithParallax != a3)
  {
    self->_rendersWithParallax = a3;
    -[SUUIShelfCollectionViewCell updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
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
  -[SUUIShelfCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  v6.receiver = self;
  v6.super_class = (Class)SUUIShelfCollectionViewCell;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v6, sel_applyLayoutAttributes_, v4);

}

- (void)layoutSubviews
{
  void *v3;
  double top;
  double left;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)SUUIShelfCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v23, sel_layoutSubviews);
  -[SUUIShelfCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  top = self->_contentInset.top;
  left = self->_contentInset.left;
  v7 = v6 + left;
  v9 = v8 + top;
  v11 = v10 - (left + self->_contentInset.right);
  v13 = v12 - (top + self->_contentInset.bottom);

  -[UICollectionView frame](self->_collectionView, "frame");
  v25.origin.x = v14;
  v25.origin.y = v15;
  v17 = v16;
  v25.size.height = v18;
  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.width = v11;
  v24.size.height = v13;
  v25.size.width = v17;
  if (!CGRectEqualToRect(v24, v25))
  {
    -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
    v20 = v19;
    v22 = v21;
    -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v7, v9, v11, v13);
    if (v11 == v17)
      -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", v20, v22);
  }
}

- (void)setBackgroundColor:(id)a3
{
  UICollectionView *collectionView;
  id v5;
  objc_super v6;

  collectionView = self->_collectionView;
  v5 = a3;
  -[UICollectionView setBackgroundColor:](collectionView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIShelfCollectionViewCell;
  -[SUUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  return 0.0;
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  if (self->_rendersWithParallax)
    SUUICollectionViewUpdatePerspectiveCells(self->_collectionView, 0);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
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

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (BOOL)rendersWithParallax
{
  return self->_rendersWithParallax;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
