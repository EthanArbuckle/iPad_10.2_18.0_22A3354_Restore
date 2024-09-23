@implementation HKPopulationNormsClassificationCollectionViewLayout

- (HKPopulationNormsClassificationCollectionViewLayout)init
{
  HKPopulationNormsClassificationCollectionViewLayout *v2;
  HKPopulationNormsClassificationCollectionViewLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKPopulationNormsClassificationCollectionViewLayout;
  v2 = -[UICollectionViewFlowLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UICollectionViewFlowLayout setScrollDirection:](v2, "setScrollDirection:", 1);
    -[UICollectionViewFlowLayout setSectionInset:](v3, "setSectionInset:", 0.0, 6.0, 0.0, 6.0);
    -[UICollectionViewFlowLayout setEstimatedItemSize:](v3, "setEstimatedItemSize:", 0.0, 28.0);
  }
  return v3;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

@end
