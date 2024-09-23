@implementation AVTFunCamAvatarPickerCollectionViewLayout

- (UIEdgeInsets)engagementInsetsForCollectionViewBounds:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double (**v11)(double);
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultCellSize");
  v6 = v5;
  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "engagedCellSize");
  v9 = v8 + v6 * 2.0;
  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "interItemSpacingProvider");
  v11 = (double (**)(double))objc_claimAutoreleasedReturnValue();
  v12 = v9 + v11[2](1.0) * 2.0;

  -[AVTFunCamAvatarPickerCollectionViewLayout collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = (v14 - v12) * 0.5;

  v16 = 0.0;
  v17 = 0.0;
  v18 = v15;
  v19 = v15;
  result.right = v19;
  result.bottom = v17;
  result.left = v18;
  result.top = v16;
  return result;
}

@end
