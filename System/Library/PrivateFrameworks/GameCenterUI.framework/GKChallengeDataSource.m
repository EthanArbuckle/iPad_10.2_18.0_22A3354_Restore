@implementation GKChallengeDataSource

- (void)setupCollectionView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKChallengeDataSource;
  v4 = a3;
  -[GKDashboardChallengeDataSource setupCollectionView:](&v6, sel_setupCollectionView_, v4);
  +[NSObject _gkNib](GKChallengeListViewSectionHeader, "_gkNib", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerNib:forSupplementaryViewOfKind:withReuseIdentifier:", v5, *MEMORY[0x1E0DC48A8], CFSTR("GKCollectionDataSourceHeader"));
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setDelegate:", self);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)GKChallengeDataSource;
  v6 = a4;
  -[GKDashboardChallengeDataSource collectionView:cellForItemAtIndexPath:](&v21, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClipsToBounds:", 1, v21.receiver, v21.super_class);
  v8 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerCurve:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0700000003);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  objc_msgSend(v7, "setDefaultContentBackgroundColor:", v10);
  if (objc_msgSend(v6, "item"))
    v12 = 0;
  else
    v12 = 3;
  v13 = objc_msgSend(v6, "item");
  if (v13 == -[GKDashboardChallengeDataSource itemCount](self, "itemCount") - 1)
    v14 = v12 | 0xC;
  else
    v14 = v12;
  objc_msgSend(v7, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaskedCorners:", v14);

  if (v14)
    v16 = 10.0;
  else
    v16 = 0.0;
  objc_msgSend(v7, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", v16);

  v18 = objc_msgSend(v6, "row");
  if (v18 == -[GKDashboardChallengeDataSource itemCount](self, "itemCount") - 1)
  {
    objc_msgSend(v7, "seperatorLine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 1);

  }
  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x1E0DC48A8];
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("GKCollectionDataSourceHeader"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionDataSource headerTextForSection:](self, "headerTextForSection:", objc_msgSend(v9, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    objc_msgSend(v11, "secondaryLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v15);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v5;
  double v6;
  double v7;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
  double v11;
  double v12;
  CGSize result;

  v5 = a3;
  +[GKDashboardPlayerCell defaultSize](GKDashboardPlayerCell, "defaultSize");
  v7 = v6;
  objc_msgSend(v5, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (IsAccessibilityCategory)
    v11 = v7 + v7;
  else
    v11 = v7;
  v12 = 0.0;
  result.height = v11;
  result.width = v12;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

@end
