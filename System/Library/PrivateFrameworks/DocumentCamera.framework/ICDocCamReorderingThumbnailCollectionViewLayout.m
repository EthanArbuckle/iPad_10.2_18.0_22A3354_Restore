@implementation ICDocCamReorderingThumbnailCollectionViewLayout

- (ICDocCamReorderingThumbnailCollectionViewLayout)initWithDelegate:(id)a3
{
  id v4;
  ICDocCamReorderingThumbnailCollectionViewLayout *v5;
  ICDocCamReorderingThumbnailCollectionViewLayout *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICDocCamReorderingThumbnailCollectionViewLayout;
  v5 = -[ICDocCamReorderingThumbnailCollectionViewLayout init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_itemHeight = 40.0;
    v6->_itemSpacing = 1.0;
    v6->_topBottomMargins = 2.0;
    v6->_leftMargin = 0.0;
    v6->_rightMargin = 0.0;
    v6->_currentItem = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (double)effectiveAspectRatioForSize:(CGSize)a3
{
  BOOL v3;
  double result;

  v3 = a3.height > a3.width || a3.height == 0.0;
  result = 1.3;
  if (v3)
    return 0.769230769;
  return result;
}

- (CGSize)itemSizeForImageSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ICDocCamReorderingThumbnailCollectionViewLayout updateLayoutCacheIfNecessary](self, "updateLayoutCacheIfNecessary");
  objc_msgSend((id)objc_opt_class(), "effectiveAspectRatioForSize:", width, height);
  v7 = v6;
  -[ICDocCamReorderingThumbnailCollectionViewLayout itemHeight](self, "itemHeight");
  v9 = v8;
  v10 = round(v7 * v8);
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)setIsScrollingBetweenPages:(BOOL)a3
{
  if (self->_isScrollingBetweenPages != a3)
  {
    self->_isScrollingBetweenPages = a3;
    -[ICDocCamReorderingThumbnailCollectionViewLayout setCurrentInterPageScrollPosition:](self, "setCurrentInterPageScrollPosition:", 0.0);
    -[ICDocCamReorderingThumbnailCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setIsScrubbing:(BOOL)a3
{
  _QWORD v4[5];

  if (self->_isScrubbing != a3)
  {
    self->_isScrubbing = a3;
    -[ICDocCamReorderingThumbnailCollectionViewLayout invalidateLayout](self, "invalidateLayout");
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __66__ICDocCamReorderingThumbnailCollectionViewLayout_setIsScrubbing___block_invoke;
    v4[3] = &unk_24C5B7AE0;
    v4[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v4, 0.2);
  }
}

void __66__ICDocCamReorderingThumbnailCollectionViewLayout_setIsScrubbing___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setContentOffsetForItem:animated:", objc_msgSend(*(id *)(a1 + 32), "currentItem"), 0);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (double)extraSpacingForCurrentItem
{
  double v3;
  void *v4;

  v3 = 0.0;
  if (!-[ICDocCamReorderingThumbnailCollectionViewLayout isScrubbing](self, "isScrubbing"))
  {
    -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "count") >= 3)
      v3 = 8.0;
    else
      v3 = 0.0;

  }
  return v3;
}

- (void)setInterPageScrollPosition:(double)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  id v42;

  -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (-[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem") < v6)
  {
    -[ICDocCamReorderingThumbnailCollectionViewLayout setCurrentInterPageScrollPosition:](self, "setCurrentInterPageScrollPosition:", a3);
    -[ICDocCamReorderingThumbnailCollectionViewLayout collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentOffset");
    v9 = v8;

    -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", -[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem"));
    v42 = (id)objc_claimAutoreleasedReturnValue();

    -[ICDocCamReorderingThumbnailCollectionViewLayout horizontalContentOffsetAdjustmentForItem:](self, "horizontalContentOffsetAdjustmentForItem:", -[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem"));
    v12 = v11;
    if (a3 <= 0.0 || -[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem") >= v6 - 1)
    {
      if (a3 < 0.0 && -[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem"))
      {
        -[ICDocCamReorderingThumbnailCollectionViewLayout horizontalContentOffsetAdjustmentForItem:](self, "horizontalContentOffsetAdjustmentForItem:", -[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem") - 1);
        v28 = v27;
        -[ICDocCamReorderingThumbnailCollectionViewLayout itemSpacing](self, "itemSpacing");
        v30 = v29;
        -[ICDocCamReorderingThumbnailCollectionViewLayout extraSpacingForCurrentItem](self, "extraSpacingForCurrentItem");
        v32 = v30 + v31;
        -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", -[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem") - 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "frame");
        v36 = v35;
        -[ICDocCamReorderingThumbnailCollectionViewLayout leftMargin](self, "leftMargin");
        v38 = v36 - v37;
        objc_msgSend(v34, "size");
        v40 = v38 + (v32 + v39 - v28) * a3 + v12 * (a3 + 1.0);
        -[ICDocCamReorderingThumbnailCollectionViewLayout collectionView](self, "collectionView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setContentOffset:animated:", 0, v40, v9);

        -[ICDocCamReorderingThumbnailCollectionViewLayout invalidateLayout](self, "invalidateLayout");
      }
    }
    else
    {
      -[ICDocCamReorderingThumbnailCollectionViewLayout horizontalContentOffsetAdjustmentForItem:](self, "horizontalContentOffsetAdjustmentForItem:", -[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem") + 1);
      v14 = v13;
      -[ICDocCamReorderingThumbnailCollectionViewLayout itemSpacing](self, "itemSpacing");
      v16 = v15;
      -[ICDocCamReorderingThumbnailCollectionViewLayout extraSpacingForCurrentItem](self, "extraSpacingForCurrentItem");
      v18 = v16 + v17;
      if (-[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem") == v6 - 2)
      {
        -[ICDocCamReorderingThumbnailCollectionViewLayout extraSpacingForCurrentItem](self, "extraSpacingForCurrentItem");
        v18 = v18 + v19;
      }
      objc_msgSend(v42, "frame");
      v21 = v20;
      -[ICDocCamReorderingThumbnailCollectionViewLayout leftMargin](self, "leftMargin");
      v23 = v21 - v22;
      objc_msgSend(v42, "size");
      v25 = v23 + (v14 + v18 + v24) * a3 + v12 * (1.0 - a3);
      -[ICDocCamReorderingThumbnailCollectionViewLayout collectionView](self, "collectionView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setContentOffset:animated:", 0, v25, v9);

      -[ICDocCamReorderingThumbnailCollectionViewLayout invalidateLayout](self, "invalidateLayout");
    }

  }
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  if (-[ICDocCamReorderingThumbnailCollectionViewLayout isScrubbing](self, "isScrubbing"))
    v5 = 0;
  else
    v5 = !-[ICDocCamReorderingThumbnailCollectionViewLayout isScrollingBetweenPages](self, "isScrollingBetweenPages");
  -[ICDocCamReorderingThumbnailCollectionViewLayout imageSizeCache](self, "imageSizeCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || !-[ICDocCamReorderingThumbnailCollectionViewLayout movingItem](self, "movingItem"))
    goto LABEL_11;
  objc_msgSend(v4, "previousIndexPathsForInteractivelyMovingItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") != 1)
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  objc_msgSend(v4, "targetIndexPathsForInteractivelyMovingItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") != 1 || objc_msgSend(v4, "invalidateEverything"))
  {

    goto LABEL_10;
  }
  v9 = objc_msgSend(v4, "invalidateDataSourceCounts");

  if ((v9 & 1) != 0)
  {
LABEL_12:
    -[ICDocCamReorderingThumbnailCollectionViewLayout setLayoutCacheIsValid:](self, "setLayoutCacheIsValid:", 0);
    -[ICDocCamReorderingThumbnailCollectionViewLayout setCachedContentSize:](self, "setCachedContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    if (v5)
      -[ICDocCamReorderingThumbnailCollectionViewLayout setImageSizeCache:](self, "setImageSizeCache:", 0);
    goto LABEL_14;
  }
  objc_msgSend(v4, "previousIndexPathsForInteractivelyMovingItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "item");

  objc_msgSend(v4, "targetIndexPathsForInteractivelyMovingItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "item");

  if (v12 != v15)
  {
    -[ICDocCamReorderingThumbnailCollectionViewLayout imageSizeCache](self, "imageSizeCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamReorderingThumbnailCollectionViewLayout imageSizeCache](self, "imageSizeCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectAtIndex:", v12);

    -[ICDocCamReorderingThumbnailCollectionViewLayout imageSizeCache](self, "imageSizeCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertObject:atIndex:", v17, v15);

  }
  -[ICDocCamReorderingThumbnailCollectionViewLayout setLayoutCacheIsValid:](self, "setLayoutCacheIsValid:", 0);
  -[ICDocCamReorderingThumbnailCollectionViewLayout setCachedContentSize:](self, "setCachedContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
LABEL_14:
  v20.receiver = self;
  v20.super_class = (Class)ICDocCamReorderingThumbnailCollectionViewLayout;
  -[ICDocCamReorderingThumbnailCollectionViewLayout invalidateLayoutWithContext:](&v20, sel_invalidateLayoutWithContext_, v4);

}

- (double)horizontalContentOffsetAdjustmentForItem:(unint64_t)a3
{
  double v3;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  v3 = 0.0;
  if (a3)
  {
    -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 > a3)
    {
      -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "frame");
      v13 = v12 * 0.5;
      objc_msgSend(v9, "frame");
      v3 = v13 - v14 * 0.5;

    }
  }
  return v3;
}

- (double)horizontalContentOffsetForItem:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = 0.0;
  if (v6 > a3)
  {
    -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "frame");
    v11 = v10;
    -[ICDocCamReorderingThumbnailCollectionViewLayout leftMargin](self, "leftMargin");
    v13 = v11 - v12;
    -[ICDocCamReorderingThumbnailCollectionViewLayout horizontalContentOffsetAdjustmentForItem:](self, "horizontalContentOffsetAdjustmentForItem:", a3);
    v7 = v14 + v13;

  }
  return v7;
}

- (void)setContentOffsetForItem:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v4 = a4;
  -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > a3)
  {
    -[ICDocCamReorderingThumbnailCollectionViewLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentOffset");
    v11 = v10;

    -[ICDocCamReorderingThumbnailCollectionViewLayout horizontalContentOffsetForItem:](self, "horizontalContentOffsetForItem:", a3);
    v13 = v12;
    -[ICDocCamReorderingThumbnailCollectionViewLayout collectionView](self, "collectionView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentOffset:animated:", v4, v13, v11);

  }
}

- (void)setCurrentItem:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unint64_t v8;
  void *v9;
  ICDocCamReorderingThumbnailCollectionViewLayout *v10;
  unint64_t v11;
  _BOOL8 v12;
  _QWORD v13[6];

  v4 = a4;
  -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > a3)
  {
    if (self->_currentItem != a3
      || -[ICDocCamReorderingThumbnailCollectionViewLayout isScrubbing](self, "isScrubbing")
      || -[ICDocCamReorderingThumbnailCollectionViewLayout isUndergoingOrientationChange](self, "isUndergoingOrientationChange"))
    {
      self->_isScrubbing = 0;
      self->_currentItem = a3;
      -[ICDocCamReorderingThumbnailCollectionViewLayout invalidateLayout](self, "invalidateLayout");
      if (v4)
      {
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __75__ICDocCamReorderingThumbnailCollectionViewLayout_setCurrentItem_animated___block_invoke;
        v13[3] = &unk_24C5B7B28;
        v13[4] = self;
        v13[5] = a3;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v13, 0.25);
        return;
      }
      -[ICDocCamReorderingThumbnailCollectionViewLayout collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layoutIfNeeded");

      v10 = self;
      v11 = a3;
      v12 = 0;
    }
    else
    {
      v10 = self;
      v11 = a3;
      v12 = v4;
    }
    -[ICDocCamReorderingThumbnailCollectionViewLayout setContentOffsetForItem:animated:](v10, "setContentOffsetForItem:animated:", v11, v12);
  }
}

uint64_t __75__ICDocCamReorderingThumbnailCollectionViewLayout_setCurrentItem_animated___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  return objc_msgSend(*(id *)(a1 + 32), "setContentOffsetForItem:animated:", *(_QWORD *)(a1 + 40), 0);
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  CGFloat y;
  double x;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat width;
  CGFloat height;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGPoint result;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  y = a3.y;
  x = a3.x;
  if (!-[ICDocCamReorderingThumbnailCollectionViewLayout movingItem](self, "movingItem", a3.x, a3.y, a4.x, a4.y))
  {
    -[ICDocCamReorderingThumbnailCollectionViewLayout leftMargin](self, "leftMargin");
    v8 = v7;
    -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v34 = y;
      v11 = 0;
      v12 = x + v8;
      while (1)
      {
        -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "frame");
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        -[ICDocCamReorderingThumbnailCollectionViewLayout itemSpacing](self, "itemSpacing");
        v24 = -v23;
        v36.origin.x = v16;
        v36.origin.y = v18;
        v36.size.width = v20;
        v36.size.height = v22;
        v37 = CGRectInset(v36, v24, 0.0);
        v25 = v37.origin.x;
        v26 = v37.origin.y;
        width = v37.size.width;
        height = v37.size.height;
        objc_msgSend(v14, "size");
        v30 = v12 + v29 * 0.5;
        v38.origin.x = v25;
        v38.origin.y = v26;
        v38.size.width = width;
        v38.size.height = height;
        if (v30 >= CGRectGetMinX(v38))
        {
          v39.origin.x = v25;
          v39.origin.y = v26;
          v39.size.width = width;
          v39.size.height = height;
          if (v30 < CGRectGetMaxX(v39))
            break;
        }

        if (v10 == ++v11)
          goto LABEL_9;
      }
      -[ICDocCamReorderingThumbnailCollectionViewLayout horizontalContentOffsetForItem:](self, "horizontalContentOffsetForItem:", v11);
      x = v31;

LABEL_9:
      y = v34;
    }
  }
  v32 = x;
  v33 = y;
  result.y = v33;
  result.x = v32;
  return result;
}

- (void)updateLayoutCacheIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double MaxX;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  double v64;
  id v65;
  CGRect v66;

  if (-[ICDocCamReorderingThumbnailCollectionViewLayout layoutCacheIsValid](self, "layoutCacheIsValid"))
    return;
  -[ICDocCamReorderingThumbnailCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v64 = v4;
  v6 = v5;

  -[ICDocCamReorderingThumbnailCollectionViewLayout topBottomMargins](self, "topBottomMargins");
  -[ICDocCamReorderingThumbnailCollectionViewLayout setItemHeight:](self, "setItemHeight:", v6 + v7 * -2.0);
  -[ICDocCamReorderingThumbnailCollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfItemsInSection:", 0);

  -[ICDocCamReorderingThumbnailCollectionViewLayout imageSizeCache](self, "imageSizeCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "count") == v9)
  {
    v65 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v9);
    v65 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        -[ICDocCamReorderingThumbnailCollectionViewLayout delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamReorderingThumbnailCollectionViewLayout collectionView](self, "collectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "collectionView:imageSizeAtIndex:", v14, i);
        v16 = v15;
        v18 = v17;

        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", v16, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "addObject:", v19);

      }
    }
    -[ICDocCamReorderingThumbnailCollectionViewLayout setImageSizeCache:](self, "setImageSizeCache:", v65);
  }
  if (v9 < 3)
  {
    v26 = 0;
    v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v20 = -[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem");
    -[ICDocCamReorderingThumbnailCollectionViewLayout currentInterPageScrollPosition](self, "currentInterPageScrollPosition");
    if (v21 != 0.0)
    {
      -[ICDocCamReorderingThumbnailCollectionViewLayout currentInterPageScrollPosition](self, "currentInterPageScrollPosition");
      v23 = v22;
      v24 = -[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem");
      if (v23 >= 0.0)
        v25 = v24 + 1;
      else
        v25 = v24 - 1;
      v63 = v25;
      v26 = 1;
      goto LABEL_18;
    }
    v26 = 0;
  }
  v63 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:
  -[ICDocCamReorderingThumbnailCollectionViewLayout currentInterPageScrollPosition](self, "currentInterPageScrollPosition");
  if (v27 >= 0.0)
    v28 = v27;
  else
    v28 = -v27;
  if (v26)
    v29 = 1.0 - v28;
  else
    v29 = 1.0;
  -[ICDocCamReorderingThumbnailCollectionViewLayout topBottomMargins](self, "topBottomMargins");
  v31 = v30;
  -[ICDocCamReorderingThumbnailCollectionViewLayout itemHeight](self, "itemHeight");
  v33 = v32;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v35 = 0;
    v36 = v9 - 1;
    v37 = 0.0;
    do
    {
      v38 = (void *)MEMORY[0x24BDF6920];
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v35, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "layoutAttributesForCellWithIndexPath:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v65, "objectAtIndexedSubscript:", v35);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "CGSizeValue");
      v43 = v42;
      v45 = v44;

      objc_msgSend((id)objc_opt_class(), "effectiveAspectRatioForSize:", v43, v45);
      v47 = v46;
      -[ICDocCamReorderingThumbnailCollectionViewLayout itemHeight](self, "itemHeight");
      v33 = v48;
      v49 = round(v47 * v48);
      if (v35)
      {
        -[ICDocCamReorderingThumbnailCollectionViewLayout itemSpacing](self, "itemSpacing");
        v37 = v37 + v50;
        if (v20 == v35)
        {
          -[ICDocCamReorderingThumbnailCollectionViewLayout extraSpacingForCurrentItem](self, "extraSpacingForCurrentItem");
          v37 = v37 + v29 * v51;
        }
        else if (v63 == v35)
        {
          -[ICDocCamReorderingThumbnailCollectionViewLayout extraSpacingForCurrentItem](self, "extraSpacingForCurrentItem");
          v37 = v37 + v28 * v53;
        }
      }
      else
      {
        -[ICDocCamReorderingThumbnailCollectionViewLayout setLeftMargin:](self, "setLeftMargin:", round((v64 - v49) * 0.5));
        -[ICDocCamReorderingThumbnailCollectionViewLayout leftMargin](self, "leftMargin");
        v37 = v52;
      }
      if (v36 == v35)
        -[ICDocCamReorderingThumbnailCollectionViewLayout setRightMargin:](self, "setRightMargin:", round((v64 - v49) * 0.5));
      -[ICDocCamReorderingThumbnailCollectionViewLayout topBottomMargins](self, "topBottomMargins");
      v31 = v54;
      objc_msgSend(v40, "setFrame:", v37, v54, v49, v33);
      objc_msgSend(v40, "setSize:", v49, v33);
      if (v35 < v36)
      {
        v37 = v49 + v37;
        v55 = v29;
        if (v20 == v35 || (v55 = v28, v63 == v35))
        {
          -[ICDocCamReorderingThumbnailCollectionViewLayout extraSpacingForCurrentItem](self, "extraSpacingForCurrentItem");
          v37 = v37 + v56 * v55;
        }
      }
      objc_msgSend(v34, "addObject:", v40);

      ++v35;
    }
    while (v9 != v35);
  }
  else
  {
    v49 = 0.0;
    v37 = 0.0;
  }
  -[ICDocCamReorderingThumbnailCollectionViewLayout setItemAttributes:](self, "setItemAttributes:", v34);
  v66.origin.x = v37;
  v66.origin.y = v31;
  v66.size.width = v49;
  v66.size.height = v33;
  MaxX = CGRectGetMaxX(v66);
  -[ICDocCamReorderingThumbnailCollectionViewLayout rightMargin](self, "rightMargin");
  v59 = MaxX + v58;
  -[ICDocCamReorderingThumbnailCollectionViewLayout itemHeight](self, "itemHeight");
  v61 = v60;
  -[ICDocCamReorderingThumbnailCollectionViewLayout topBottomMargins](self, "topBottomMargins");
  -[ICDocCamReorderingThumbnailCollectionViewLayout setCachedContentSize:](self, "setCachedContentSize:", v59, v61 + v62 * 2.0);
  -[ICDocCamReorderingThumbnailCollectionViewLayout setLayoutCacheIsValid:](self, "setLayoutCacheIsValid:", 1);

}

- (CGSize)collectionViewContentSize
{
  double v3;
  double v4;
  CGSize result;

  -[ICDocCamReorderingThumbnailCollectionViewLayout updateLayoutCacheIfNecessary](self, "updateLayoutCacheIfNecessary");
  -[ICDocCamReorderingThumbnailCollectionViewLayout cachedContentSize](self, "cachedContentSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  _QWORD v10[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__ICDocCamReorderingThumbnailCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v10[3] = &__block_descriptor_64_e49_B32__0__UICollectionViewLayoutAttributes_8Q16_B24l;
  *(CGFloat *)&v10[4] = x;
  *(CGFloat *)&v10[5] = y;
  *(CGFloat *)&v10[6] = width;
  *(CGFloat *)&v10[7] = height;
  objc_msgSend(v7, "dc_objectsPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __85__ICDocCamReorderingThumbnailCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(CGRect *a1, void *a2)
{
  CGRect v4;

  objc_msgSend(a2, "frame");
  return CGRectIntersectsRect(v4, a1[1]);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    v10 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICDocCamReorderingThumbnailCollectionViewLayout layoutAttributesForItemAtIndexPath:].cold.1((uint64_t)v4, self, v10);

    v9 = 0;
  }
  else
  {
    -[ICDocCamReorderingThumbnailCollectionViewLayout itemAttributes](self, "itemAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 0;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICDocCamReorderingThumbnailCollectionViewLayout;
  -[ICDocCamReorderingThumbnailCollectionViewLayout prepareForCollectionViewUpdates:](&v20, sel_prepareForCollectionViewUpdates_, v4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamReorderingThumbnailCollectionViewLayout setDeleteIndexPaths:](self, "setDeleteIndexPaths:", v5);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamReorderingThumbnailCollectionViewLayout setInsertIndexPaths:](self, "setInsertIndexPaths:", v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "updateAction", (_QWORD)v16) == 1)
        {
          -[ICDocCamReorderingThumbnailCollectionViewLayout deleteIndexPaths](self, "deleteIndexPaths");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "indexPathBeforeUpdate");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend(v12, "updateAction"))
            continue;
          -[ICDocCamReorderingThumbnailCollectionViewLayout insertIndexPaths](self, "insertIndexPaths");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "indexPathAfterUpdate");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        v15 = (void *)v14;
        objc_msgSend(v13, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v9);
  }

}

- (void)finalizeCollectionViewUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICDocCamReorderingThumbnailCollectionViewLayout;
  -[ICDocCamReorderingThumbnailCollectionViewLayout finalizeCollectionViewUpdates](&v3, sel_finalizeCollectionViewUpdates);
  -[ICDocCamReorderingThumbnailCollectionViewLayout setDeleteIndexPaths:](self, "setDeleteIndexPaths:", 0);
  -[ICDocCamReorderingThumbnailCollectionViewLayout setInsertIndexPaths:](self, "setInsertIndexPaths:", 0);
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamReorderingThumbnailCollectionViewLayout;
  -[ICDocCamReorderingThumbnailCollectionViewLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v9, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamReorderingThumbnailCollectionViewLayout insertIndexPaths](self, "insertIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) == 0)
  {
    if (!v5)
    {
      -[ICDocCamReorderingThumbnailCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "setAlpha:", 1.0);
  }

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamReorderingThumbnailCollectionViewLayout;
  -[ICDocCamReorderingThumbnailCollectionViewLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v9, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamReorderingThumbnailCollectionViewLayout deleteIndexPaths](self, "deleteIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) == 0)
  {
    if (!v5)
    {
      -[ICDocCamReorderingThumbnailCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "setAlpha:", 1.0);
  }

  return v5;
}

- (ICDocCamThumbnailViewLayoutDelegate)delegate
{
  return (ICDocCamThumbnailViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)movingItem
{
  return self->_movingItem;
}

- (void)setMovingItem:(BOOL)a3
{
  self->_movingItem = a3;
}

- (BOOL)isScrollingBetweenPages
{
  return self->_isScrollingBetweenPages;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (BOOL)isUndergoingOrientationChange
{
  return self->_isUndergoingOrientationChange;
}

- (void)setIsUndergoingOrientationChange:(BOOL)a3
{
  self->_isUndergoingOrientationChange = a3;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  self->_itemSpacing = a3;
}

- (double)topBottomMargins
{
  return self->_topBottomMargins;
}

- (void)setTopBottomMargins:(double)a3
{
  self->_topBottomMargins = a3;
}

- (double)leftMargin
{
  return self->_leftMargin;
}

- (void)setLeftMargin:(double)a3
{
  self->_leftMargin = a3;
}

- (double)rightMargin
{
  return self->_rightMargin;
}

- (void)setRightMargin:(double)a3
{
  self->_rightMargin = a3;
}

- (double)itemHeight
{
  return self->_itemHeight;
}

- (void)setItemHeight:(double)a3
{
  self->_itemHeight = a3;
}

- (BOOL)layoutCacheIsValid
{
  return self->_layoutCacheIsValid;
}

- (void)setLayoutCacheIsValid:(BOOL)a3
{
  self->_layoutCacheIsValid = a3;
}

- (CGSize)cachedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedContentSize.width;
  height = self->_cachedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedContentSize:(CGSize)a3
{
  self->_cachedContentSize = a3;
}

- (NSArray)itemAttributes
{
  return self->_itemAttributes;
}

- (void)setItemAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSMutableArray)imageSizeCache
{
  return self->_imageSizeCache;
}

- (void)setImageSizeCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageSizeCache, a3);
}

- (unint64_t)currentItem
{
  return self->_currentItem;
}

- (void)setCurrentItem:(unint64_t)a3
{
  self->_currentItem = a3;
}

- (double)currentInterPageScrollPosition
{
  return self->_currentInterPageScrollPosition;
}

- (void)setCurrentInterPageScrollPosition:(double)a3
{
  self->_currentInterPageScrollPosition = a3;
}

- (NSMutableArray)deleteIndexPaths
{
  return self->_deleteIndexPaths;
}

- (void)setDeleteIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_deleteIndexPaths, a3);
}

- (NSMutableArray)insertIndexPaths
{
  return self->_insertIndexPaths;
}

- (void)setInsertIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_insertIndexPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertIndexPaths, 0);
  objc_storeStrong((id *)&self->_deleteIndexPaths, 0);
  objc_storeStrong((id *)&self->_imageSizeCache, 0);
  objc_storeStrong((id *)&self->_itemAttributes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)layoutAttributesForItemAtIndexPath:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "itemAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2048;
  v9 = objc_msgSend(v5, "count");
  _os_log_error_impl(&dword_20CE8E000, a3, OS_LOG_TYPE_ERROR, "Index out of bounds: %@, %ld", (uint8_t *)&v6, 0x16u);

}

@end
