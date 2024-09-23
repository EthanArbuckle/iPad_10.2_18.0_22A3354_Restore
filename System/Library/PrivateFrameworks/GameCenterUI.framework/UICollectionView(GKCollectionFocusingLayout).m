@implementation UICollectionView(GKCollectionFocusingLayout)

- (id)_gkFocusingLayout
{
  void *v1;

  objc_msgSend(a1, "collectionViewLayout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

@end
