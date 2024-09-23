@implementation HKHorizontalFlowLayout

- (HKHorizontalFlowLayout)init
{
  HKHorizontalFlowLayout *v2;
  HKHorizontalFlowLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKHorizontalFlowLayout;
  v2 = -[UICollectionViewFlowLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UICollectionViewFlowLayout setScrollDirection:](v2, "setScrollDirection:", 1);
    -[UICollectionViewFlowLayout setSectionInset:](v3, "setSectionInset:", 0.0, 8.0, 0.0, 8.0);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", 8.0);
  }
  return v3;
}

+ (double)snapToBoundariesDecelerationRate
{
  return 0.9;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGPoint result;

  x = a4.x;
  v31.receiver = self;
  v31.super_class = (Class)HKHorizontalFlowLayout;
  -[HKHorizontalFlowLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v31, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, a4.x, a4.y);
  v7 = v6;
  v9 = v8;
  if (*(_WORD *)&self->_snapsToItemBoundaries)
  {
    -[HKHorizontalFlowLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
      v14 = v13;
      objc_msgSend(v10, "frame");
      v16 = v15 + v15;
      if (objc_msgSend(v10, "numberOfSections") >= 1)
      {
        v17 = 0;
        v18 = 0.0;
        do
        {
          v19 = objc_msgSend(v11, "collectionView:numberOfItemsInSection:", v10, v17);
          if (v19 >= 1)
          {
            v20 = v19;
            v21 = 0;
            while (1)
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21, v17);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "collectionView:layout:sizeForItemAtIndexPath:", v10, self, v22);
              v16 = v23;

              v24 = v18 + v16;
              if (v7 > v18 && v7 < v24)
                break;
              v18 = v18 + v14 + v16;
              if (v20 == ++v21)
                goto LABEL_18;
            }
            if (x > 0.0 || x >= 0.0 && v7 - v18 >= v16 * 0.5)
              v7 = v14 + v24;
            else
              v7 = v18;
          }
LABEL_18:
          ++v17;
        }
        while (v17 < objc_msgSend(v10, "numberOfSections"));
      }
      if (self->_snapsToItemCenters)
      {
        objc_msgSend(v10, "frame");
        v7 = v7 + (v26 - v16) * -0.5;
        objc_msgSend(v10, "contentInset");
        if (v7 < -v27)
        {
          objc_msgSend(v10, "contentInset");
          v7 = -v28;
        }
      }
    }

  }
  v29 = v7;
  v30 = v9;
  result.y = v30;
  result.x = v29;
  return result;
}

- (double)leadingInset
{
  double v2;

  -[UICollectionViewFlowLayout sectionInset](self, "sectionInset");
  return v2;
}

- (void)setLeadingInset:(double)a3
{
  -[UICollectionViewFlowLayout sectionInset](self, "sectionInset");
  -[UICollectionViewFlowLayout setSectionInset:](self, "setSectionInset:");
}

- (double)trailingInset
{
  double v2;

  -[UICollectionViewFlowLayout sectionInset](self, "sectionInset");
  return v2;
}

- (void)setTrailingInset:(double)a3
{
  -[UICollectionViewFlowLayout sectionInset](self, "sectionInset");
  -[UICollectionViewFlowLayout setSectionInset:](self, "setSectionInset:");
}

- (BOOL)snapsToItemBoundaries
{
  return self->_snapsToItemBoundaries;
}

- (void)setSnapsToItemBoundaries:(BOOL)a3
{
  self->_snapsToItemBoundaries = a3;
}

- (BOOL)snapsToItemCenters
{
  return self->_snapsToItemCenters;
}

- (void)setSnapsToItemCenters:(BOOL)a3
{
  self->_snapsToItemCenters = a3;
}

@end
