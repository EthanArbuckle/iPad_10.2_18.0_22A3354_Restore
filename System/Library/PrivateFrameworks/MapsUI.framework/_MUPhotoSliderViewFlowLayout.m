@implementation _MUPhotoSliderViewFlowLayout

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  BOOL v8;

  height = a3.size.height;
  width = a3.size.width;
  -[_MUPhotoSliderViewFlowLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v8 = height != v7 || width != v6;

  return v8;
}

@end
