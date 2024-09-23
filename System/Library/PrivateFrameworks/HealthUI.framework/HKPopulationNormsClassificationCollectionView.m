@implementation HKPopulationNormsClassificationCollectionView

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPopulationNormsClassificationCollectionView dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView:cellForItemAtIndexPath:", self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "systemLayoutSizeFittingSize:", 1.79769313e308, 28.0);
    v7 = v6;
  }
  else
  {
    v7 = 28.0;
  }
  v8 = *MEMORY[0x1E0DC55F0];

  v9 = v8;
  v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKPopulationNormsClassificationCollectionView;
  -[HKPopulationNormsClassificationCollectionView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKPopulationNormsClassificationCollectionView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[HKPopulationNormsClassificationCollectionView collectionViewLayout](self, "collectionViewLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidateLayout");

      -[HKPopulationNormsClassificationCollectionView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }

}

@end
