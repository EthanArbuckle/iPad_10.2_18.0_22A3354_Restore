@implementation JTCollectionViewFlowLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[UICollectionViewFlowLayout sectionHeadersPinToVisibleBounds](self, "sectionHeadersPinToVisibleBounds")
    || -[UICollectionViewFlowLayout sectionFootersPinToVisibleBounds](self, "sectionFootersPinToVisibleBounds"))
  {
    v13.receiver = self;
    v13.super_class = (Class)JTCollectionViewFlowLayout;
    if (-[UICollectionViewFlowLayout shouldInvalidateLayoutForBoundsChange:](&v13, sel_shouldInvalidateLayoutForBoundsChange_, x, y, width, height))
    {
      return 1;
    }
  }
  -[JTCollectionViewFlowLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v8 = height != v11 || width != v10;

  return v8;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JTCollectionViewFlowLayout;
  -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v5, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setInvalidateFlowLayoutDelegateMetrics:", 1);
  return v3;
}

@end
