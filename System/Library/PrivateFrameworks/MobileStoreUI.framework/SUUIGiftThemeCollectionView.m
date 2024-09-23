@implementation SUUIGiftThemeCollectionView

- (CGRect)_visibleBounds
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect result;

  v13.receiver = self;
  v13.super_class = (Class)SUUIGiftThemeCollectionView;
  -[SUUIGiftThemeCollectionView _visibleBounds](&v13, sel__visibleBounds);
  top = self->_visibleBoundsInsets.top;
  left = self->_visibleBoundsInsets.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_visibleBoundsInsets.right);
  v12 = v11 - (top + self->_visibleBoundsInsets.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[SUUIGiftThemeCollectionView superview](self, "superview", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftThemeCollectionView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[SUUIGiftThemeCollectionView superview](self, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14.x = v9;
  v14.y = v11;
  LOBYTE(v7) = CGRectContainsPoint(v15, v14);

  return (char)v7;
}

- (UIEdgeInsets)visibleBoundsInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_visibleBoundsInsets.top;
  left = self->_visibleBoundsInsets.left;
  bottom = self->_visibleBoundsInsets.bottom;
  right = self->_visibleBoundsInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setVisibleBoundsInsets:(UIEdgeInsets)a3
{
  self->_visibleBoundsInsets = a3;
}

@end
