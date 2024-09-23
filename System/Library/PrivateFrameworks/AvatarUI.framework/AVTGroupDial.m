@implementation AVTGroupDial

+ (double)estimatedContentWidthForTitleSizes:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3 || (v11 = 0.0, !objc_msgSend(0, "count")))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "CGSizeValue", (_QWORD)v13);
          v8 = v8 + v10 + 20.0;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    v11 = v8 + (double)(unint64_t)(objc_msgSend(v4, "count") - 1) * 30.0;
  }

  return v11;
}

+ (BOOL)shouldScrollGivenTitleSizes:(id)a3 fittingWidth:(double)a4
{
  double v5;

  objc_msgSend(a1, "estimatedContentWidthForTitleSizes:", a3);
  return v5 > a4;
}

- (AVTGroupDial)initWithGroupItems:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  AVTGroupDial *v9;
  AVTGroupDial *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AVTGroupDial;
  v9 = -[AVTGroupDial initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a4);
    objc_storeStrong((id *)&v10->_groupItems, a3);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTGroupDial setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[AVTGroupDial cacheTitleSizes](v10, "cacheTitleSizes");
    -[AVTGroupDial setupDial](v10, "setupDial");
    if (AVTUIGroupDialUsesMasking_once())
      -[AVTGroupDial setupMasking](v10, "setupMasking");
  }

  return v10;
}

- (void)setupMasking
{
  AVTGroupDialMaskingView *v3;
  AVTGroupDialMaskingView *v4;
  AVTGroupDialMaskingView *maskingView;

  v3 = [AVTGroupDialMaskingView alloc];
  -[AVTGroupDial bounds](self, "bounds");
  v4 = -[AVTGroupDialMaskingView initWithFrame:](v3, "initWithFrame:");
  maskingView = self->_maskingView;
  self->_maskingView = v4;

  -[AVTGroupDial setMaskView:](self, "setMaskView:", self->_maskingView);
}

- (void)cacheTitleSizes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSArray *v19;
  NSArray *cachedGroupTitleSizes;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[AVTGroupDial groupItems](self, "groupItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[AVTGroupDial groupItems](self, "groupItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    v9 = *MEMORY[0x1E0CEA098];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "localizedName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v9;
        objc_msgSend((id)objc_opt_class(), "labelFont");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sizeWithAttributes:", v13);
        v15 = v14;
        v17 = v16;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v18);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }

  v19 = (NSArray *)objc_msgSend(v5, "copy");
  cachedGroupTitleSizes = self->_cachedGroupTitleSizes;
  self->_cachedGroupTitleSizes = v19;

}

- (void)setupDial
{
  id v3;
  UICollectionView *v4;
  UICollectionView *collectionView;
  void *v6;
  UICollectionView *v7;
  uint64_t v8;
  void *v9;
  AVTCenteringCollectionViewDelegate *v10;
  UICollectionView *v11;
  void *v12;
  AVTCenteringCollectionViewDelegate *v13;
  AVTCenteringCollectionViewDelegate *centeringCollectionViewDelegate;
  void *v15;
  NSArray *cachedGroupTitleSizes;
  uint64_t v17;
  void *v18;
  AVTFlippingCollectionViewFlowLayout *v19;
  CGRect v20;

  v19 = objc_alloc_init(AVTFlippingCollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v19, "setScrollDirection:", 1);
  -[UICollectionViewFlowLayout setSectionInset:](v19, "setSectionInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v19, "setMinimumInteritemSpacing:", 30.0);
  -[AVTGroupDial setCollectionViewLayout:](self, "setCollectionViewLayout:", v19);
  v3 = objc_alloc(MEMORY[0x1E0CEA410]);
  -[AVTGroupDial bounds](self, "bounds");
  v4 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v19);
  collectionView = self->_collectionView;
  self->_collectionView = v4;

  -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v6);

  -[UICollectionView setContentInsetAdjustmentBehavior:](self->_collectionView, "setContentInsetAdjustmentBehavior:", 2);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  v7 = self->_collectionView;
  v8 = objc_opt_class();
  +[AVTGroupDialCell cellIdentifier](AVTGroupDialCell, "cellIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v7, "registerClass:forCellWithReuseIdentifier:", v8, v9);

  -[AVTGroupDial addSubview:](self, "addSubview:", self->_collectionView);
  -[UICollectionView setDecelerationRate:](self->_collectionView, "setDecelerationRate:", *MEMORY[0x1E0CEBBA0]);
  v10 = [AVTCenteringCollectionViewDelegate alloc];
  v11 = self->_collectionView;
  -[AVTGroupDial environment](self, "environment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AVTCenteringCollectionViewDelegate initWithCollectionView:delegate:environment:](v10, "initWithCollectionView:delegate:environment:", v11, self, v12);
  centeringCollectionViewDelegate = self->_centeringCollectionViewDelegate;
  self->_centeringCollectionViewDelegate = v13;

  v15 = (void *)objc_opt_class();
  cachedGroupTitleSizes = self->_cachedGroupTitleSizes;
  -[AVTGroupDial bounds](self, "bounds");
  v17 = objc_msgSend(v15, "shouldScrollGivenTitleSizes:fittingWidth:", cachedGroupTitleSizes, CGRectGetWidth(v20));
  v18 = self;
  if ((_DWORD)v17)
    v18 = self->_centeringCollectionViewDelegate;
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", v18);
  -[UICollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", v17);

}

- (void)setContentPadding:(double)a3
{
  void *v5;
  id v6;

  -[AVTGroupDial collectionViewLayout](self, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSectionInset:", a3, 0.0, a3, 0.0);

  -[AVTGroupDial collectionViewLayout](self, "collectionViewLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v48;
  void *v49;
  CGRect v50;

  -[AVTGroupDial bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AVTGroupDial collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[AVTGroupDial cellSizeForItemAtIndex:](self, "cellSizeForItemAtIndex:", 0);
  -[AVTGroupDial groupItems](self, "groupItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTGroupDial cellSizeForItemAtIndex:](self, "cellSizeForItemAtIndex:", objc_msgSend(v12, "count") - 1);

  v13 = (void *)objc_opt_class();
  -[AVTGroupDial cachedGroupTitleSizes](self, "cachedGroupTitleSizes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTGroupDial bounds](self, "bounds");
  v15 = objc_msgSend(v13, "shouldScrollGivenTitleSizes:fittingWidth:", v14, CGRectGetWidth(v50));

  if ((_DWORD)v15)
  {
    -[AVTGroupDial collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    +[AVTCenteringCollectionViewHelper insetsForBounds:withFirstCellSize:lastCellSize:](AVTCenteringCollectionViewHelper, "insetsForBounds:withFirstCellSize:lastCellSize:");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    -[AVTGroupDial bounds](self, "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[AVTGroupDial maskingView](self, "maskingView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

    -[AVTGroupDial centeringCollectionViewDelegate](self, "centeringCollectionViewDelegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTGroupDial collectionView](self, "collectionView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDelegate:", v34);

  }
  else
  {
    -[AVTGroupDial bounds](self, "bounds");
    v37 = v36;
    v38 = (void *)objc_opt_class();
    -[AVTGroupDial cachedGroupTitleSizes](self, "cachedGroupTitleSizes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "estimatedContentWidthForTitleSizes:", v39);
    v20 = (v37 - v40) * 0.5;

    v18 = 0.0;
    -[AVTGroupDial setMaskView:](self, "setMaskView:", 0);
    -[AVTGroupDial collectionView](self, "collectionView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDelegate:", self);
    v22 = 0.0;
    v24 = v20;
  }

  -[AVTGroupDial collectionView](self, "collectionView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "contentInset");
  if (v45 != v20 || v42 != v18 || v44 != v24)
  {

LABEL_13:
    -[AVTGroupDial collectionView](self, "collectionView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setContentInset:", v18, v20, v22, v24);

    goto LABEL_14;
  }
  v48 = v43;

  if (v48 != v22)
    goto LABEL_13;
LABEL_14:
  -[AVTGroupDial selectItemAtIndex:updateScrollPosition:animated:](self, "selectItemAtIndex:updateScrollPosition:animated:", -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex"), v15, 0);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVTGroupDial frame](self, "frame");
  v22.origin.x = v8;
  v22.origin.y = v9;
  v22.size.width = v10;
  v22.size.height = v11;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (CGRectEqualToRect(v20, v22))
  {
    v18.receiver = self;
    v18.super_class = (Class)AVTGroupDial;
    -[AVTGroupDial setFrame:](&v18, sel_setFrame_, x, y, width, height);
    v12 = (void *)objc_opt_class();
    -[AVTGroupDial cachedGroupTitleSizes](self, "cachedGroupTitleSizes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v14 = objc_msgSend(v12, "shouldScrollGivenTitleSizes:fittingWidth:", v13, CGRectGetWidth(v21));

    v15 = self;
    if ((_DWORD)v14)
    {
      -[AVTGroupDial centeringCollectionViewDelegate](self, "centeringCollectionViewDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[AVTGroupDial collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v15);

    if ((_DWORD)v14)
    -[AVTGroupDial collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setScrollEnabled:", v14);

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)AVTGroupDial;
    -[AVTGroupDial setFrame:](&v19, sel_setFrame_, x, y, width, height);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVTGroupDial bounds](self, "bounds");
  v22.origin.x = v8;
  v22.origin.y = v9;
  v22.size.width = v10;
  v22.size.height = v11;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (CGRectEqualToRect(v20, v22))
  {
    v18.receiver = self;
    v18.super_class = (Class)AVTGroupDial;
    -[AVTGroupDial setBounds:](&v18, sel_setBounds_, x, y, width, height);
    v12 = (void *)objc_opt_class();
    -[AVTGroupDial cachedGroupTitleSizes](self, "cachedGroupTitleSizes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v14 = objc_msgSend(v12, "shouldScrollGivenTitleSizes:fittingWidth:", v13, CGRectGetWidth(v21));

    v15 = self;
    if ((_DWORD)v14)
    {
      -[AVTGroupDial centeringCollectionViewDelegate](self, "centeringCollectionViewDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[AVTGroupDial collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v15);

    if ((_DWORD)v14)
    -[AVTGroupDial collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setScrollEnabled:", v14);

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)AVTGroupDial;
    -[AVTGroupDial setBounds:](&v19, sel_setBounds_, x, y, width, height);
  }
}

- (void)setSelectedGroupIndex:(int64_t)a3
{
  -[AVTGroupDial setSelectedGroupIndex:animated:](self, "setSelectedGroupIndex:animated:", a3, 1);
}

- (void)setSelectedGroupIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  CGRect v12;

  if ((a3 & 0x8000000000000000) == 0)
  {
    v4 = a4;
    -[AVTGroupDial groupItems](self, "groupItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 > a3)
    {
      -[AVTGroupDial window](self, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)objc_opt_class();
        -[AVTGroupDial cachedGroupTitleSizes](self, "cachedGroupTitleSizes");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        -[AVTGroupDial bounds](self, "bounds");
        -[AVTGroupDial selectItemAtIndex:updateScrollPosition:animated:](self, "selectItemAtIndex:updateScrollPosition:animated:", a3, objc_msgSend(v10, "shouldScrollGivenTitleSizes:fittingWidth:", v11, CGRectGetWidth(v12)), v4);

      }
      else
      {
        -[AVTGroupDial setCurrentSelectedItemIndex:](self, "setCurrentSelectedItemIndex:", a3);
      }
    }
  }
}

- (void)startDiscoverability
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[AVTGroupDial groupItems](self, "groupItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 2)
  {
    v5 = -[AVTGroupDial selectedGroupIndex](self, "selectedGroupIndex") + 1;
    -[AVTGroupDial groupItems](self, "groupItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v5 >= v7)
      v5 = -[AVTGroupDial selectedGroupIndex](self, "selectedGroupIndex") - 1;
    -[AVTGroupDial shimmeringItemIndexPath](self, "shimmeringItemIndexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "item");

    if (v9 != v5)
    {
      -[AVTGroupDial stopDiscoverability](self, "stopDiscoverability");
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v5, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTGroupDial setShimmeringItemIndexPath:](self, "setShimmeringItemIndexPath:", v10);

      -[AVTGroupDial collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTGroupDial shimmeringItemIndexPath](self, "shimmeringItemIndexPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cellForItemAtIndexPath:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "startShimmering");
    }
  }
}

- (void)stopDiscoverability
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AVTGroupDial shimmeringItemIndexPath](self, "shimmeringItemIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTGroupDial collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTGroupDial shimmeringItemIndexPath](self, "shimmeringItemIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellForItemAtIndexPath:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stopShimmeringAnimated:", 1);
    -[AVTGroupDial setShimmeringItemIndexPath:](self, "setShimmeringItemIndexPath:", 0);

  }
}

- (void)reloadData
{
  id v3;

  -[AVTGroupDial cacheTitleSizes](self, "cacheTitleSizes");
  -[AVTGroupDial collectionView](self, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (CGSize)cellSizeForItemAtIndex:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[AVTGroupDial cachedGroupTitleSizes](self, "cachedGroupTitleSizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[AVTGroupDial cachedGroupTitleSizes](self, "cachedGroupTitleSizes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "CGSizeValue");
    v10 = v9;
    v12 = v11 + 20.0;

  }
  else
  {
    v12 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v13 = v12;
  v14 = v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)selectItemAtIndex:(int64_t)a3 updateScrollPosition:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void *v9;
  unint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;

  if ((a3 & 0x8000000000000000) == 0)
  {
    v5 = a5;
    v6 = a4;
    -[AVTGroupDial groupItems](self, "groupItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 > a3)
    {
      v11 = -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex");
      -[AVTGroupDial setCurrentSelectedItemIndex:](self, "setCurrentSelectedItemIndex:", a3);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTGroupDial updateSelectedState:forItemAtIndexPath:animated:](self, "updateSelectedState:forItemAtIndexPath:animated:", 0, v12, v5);
      -[AVTGroupDial collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "selectItemAtIndexPath:animated:scrollPosition:", v26, v5, 0);

      if (v6)
      {
        -[AVTGroupDial layoutIfNeeded](self, "layoutIfNeeded");
        -[AVTGroupDial collectionView](self, "collectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "layoutAttributesForItemAtIndexPath:", v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "frame");
        UIRectGetCenter();
        v17 = v16;
        v19 = v18;
        -[AVTGroupDial collectionView](self, "collectionView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v20, v17, v19);
        v22 = v21;
        v24 = v23;

        -[AVTGroupDial collectionView](self, "collectionView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setContentOffset:animated:", v5, v22, v24);

      }
      if (!v5 || v11 == -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex"))
        -[AVTGroupDial updateSelectedState:forItemAtIndexPath:animated:](self, "updateSelectedState:forItemAtIndexPath:animated:", 1, v26, v5);

    }
  }
}

- (void)updateSelectedState:(BOOL)a3 forItemAtIndexPath:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  -[AVTGroupDial collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setActiveItem:animated:", v6, v5);
}

- (void)updateForEndingScroll
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  -[AVTGroupDial setIsMoving:](self, "setIsMoving:", 0);
  if (-[AVTGroupDial hasFinalizedSelection](self, "hasFinalizedSelection"))
  {
    -[AVTGroupDial collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentOffset");
    v5 = v4;
    v7 = v6;
    -[AVTGroupDial collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v8, v5, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTGroupDial setCurrentSelectedItemIndex:](self, "setCurrentSelectedItemIndex:", objc_msgSend(v10, "row"));
    -[AVTGroupDial updateSelectedState:forItemAtIndexPath:animated:](self, "updateSelectedState:forItemAtIndexPath:animated:", 1, v10, 1);
    -[AVTGroupDial delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupPicker:didSelectGroupAtIndex:tapped:", self, -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex"), 0);

  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AVTGroupDial groupItems](self, "groupItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  -[AVTGroupDial cellSizeForItemAtIndex:](self, "cellSizeForItemAtIndex:", objc_msgSend(a5, "row", a3, a4));
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  +[AVTGroupDialCell cellIdentifier](AVTGroupDialCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTGroupDial groupItems](self, "groupItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setString:", v13);

  return v9;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  int v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v13 = v7;
  v9 = objc_msgSend(v8, "row");
  v10 = -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex");
  objc_msgSend(v13, "setActiveItem:animated:", v9 == v10, 1);
  if (v9 != v10)
  {
    -[AVTGroupDial shimmeringItemIndexPath](self, "shimmeringItemIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqual:", v11);

    if (v12)
      objc_msgSend(v13, "startShimmering");
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[AVTGroupDial setIsMoving:](self, "setIsMoving:", 1);
  -[AVTGroupDial setHasFinalizedSelection:](self, "setHasFinalizedSelection:", 0);
  -[AVTGroupDial stopDiscoverability](self, "stopDiscoverability");
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  CGRect v17;

  v16 = a3;
  v4 = (void *)objc_opt_class();
  -[AVTGroupDial cachedGroupTitleSizes](self, "cachedGroupTitleSizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTGroupDial bounds](self, "bounds");
  LODWORD(v4) = objc_msgSend(v4, "shouldScrollGivenTitleSizes:fittingWidth:", v5, CGRectGetWidth(v17));

  if ((_DWORD)v4)
  {
    if (objc_msgSend(v16, "avtui_isMoving"))
    {
      if (!-[AVTGroupDial hasFinalizedSelection](self, "hasFinalizedSelection"))
      {
        v6 = -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex");
        -[AVTGroupDial centeringCollectionViewDelegate](self, "centeringCollectionViewDelegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "centerItemAttributes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "indexPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "item");

        if (v6 != v10)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex"), 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTGroupDial centeringCollectionViewDelegate](self, "centeringCollectionViewDelegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "centerItemAttributes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "indexPath");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          -[AVTGroupDial updateSelectedState:forItemAtIndexPath:animated:](self, "updateSelectedState:forItemAtIndexPath:animated:", 0, v11, 1);
          -[AVTGroupDial delegate](self, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "groupPicker:didDeselectGroupAtIndex:", self, -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex"));

          if ((objc_msgSend(v16, "isDecelerating") & 1) == 0)
          {
            -[AVTGroupDial setCurrentSelectedItemIndex:](self, "setCurrentSelectedItemIndex:", objc_msgSend(v14, "item"));
            -[AVTGroupDial updateSelectedState:forItemAtIndexPath:animated:](self, "updateSelectedState:forItemAtIndexPath:animated:", 1, v14, 1);
          }

        }
      }
    }
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  CGRect v13;

  v12 = a4;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTGroupDial setCurrentSelectedItemIndex:](self, "setCurrentSelectedItemIndex:", objc_msgSend(v12, "item"));
  v6 = objc_msgSend(v5, "isEqual:", v12);
  -[AVTGroupDial stopDiscoverability](self, "stopDiscoverability");
  if ((v6 & 1) != 0)
  {
    -[AVTGroupDial delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "item");
LABEL_6:
    objc_msgSend(v7, "groupPicker:didSelectGroupAtIndex:tapped:", self, v8, 1);

    goto LABEL_7;
  }
  -[AVTGroupDial updateSelectedState:forItemAtIndexPath:animated:](self, "updateSelectedState:forItemAtIndexPath:animated:", 0, v5, 1);
  -[AVTGroupDial delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupPicker:didDeselectGroupAtIndex:", self, objc_msgSend(v5, "item"));

  -[AVTGroupDial updateSelectedState:forItemAtIndexPath:animated:](self, "updateSelectedState:forItemAtIndexPath:animated:", 1, v12, 1);
  -[AVTGroupDial setHasFinalizedSelection:](self, "setHasFinalizedSelection:", 1);
  v10 = objc_opt_class();
  -[AVTGroupDial cachedGroupTitleSizes](self, "cachedGroupTitleSizes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTGroupDial bounds](self, "bounds");
  LOBYTE(v10) = objc_msgSend((id)v10, "shouldScrollGivenTitleSizes:fittingWidth:", v11, CGRectGetWidth(v13));

  if ((v10 & 1) == 0)
  {
    -[AVTGroupDial delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex");
    goto LABEL_6;
  }
  -[AVTGroupDial setIsMoving:](self, "setIsMoving:", 1);
LABEL_7:

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex", a3, a4.x, a4.y), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTGroupDial updateSelectedState:forItemAtIndexPath:animated:](self, "updateSelectedState:forItemAtIndexPath:animated:", 0, v10, 1);
  -[AVTGroupDial delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupPicker:didDeselectGroupAtIndex:", self, -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex"));

  -[AVTGroupDial collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v8, a5->x, a5->y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTGroupDial setCurrentSelectedItemIndex:](self, "setCurrentSelectedItemIndex:", objc_msgSend(v9, "item"));
  -[AVTGroupDial updateSelectedState:forItemAtIndexPath:animated:](self, "updateSelectedState:forItemAtIndexPath:animated:", 1, v9, 1);
  -[AVTGroupDial setHasFinalizedSelection:](self, "setHasFinalizedSelection:", 1);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[AVTGroupDial updateForEndingScroll](self, "updateForEndingScroll", a3);
}

- (AVTGroupPickerDelegate)delegate
{
  return (AVTGroupPickerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSArray)groupItems
{
  return self->_groupItems;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (NSArray)cachedGroupTitleSizes
{
  return self->_cachedGroupTitleSizes;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (AVTCenteringCollectionViewDelegate)centeringCollectionViewDelegate
{
  return self->_centeringCollectionViewDelegate;
}

- (unint64_t)currentScrollDirection
{
  return self->_currentScrollDirection;
}

- (void)setCurrentScrollDirection:(unint64_t)a3
{
  self->_currentScrollDirection = a3;
}

- (int64_t)currentSelectedItemIndex
{
  return self->_currentSelectedItemIndex;
}

- (void)setCurrentSelectedItemIndex:(int64_t)a3
{
  self->_currentSelectedItemIndex = a3;
}

- (BOOL)isMoving
{
  return self->_isMoving;
}

- (void)setIsMoving:(BOOL)a3
{
  self->_isMoving = a3;
}

- (BOOL)hasFinalizedSelection
{
  return self->_hasFinalizedSelection;
}

- (void)setHasFinalizedSelection:(BOOL)a3
{
  self->_hasFinalizedSelection = a3;
}

- (AVTGroupDialMaskingView)maskingView
{
  return self->_maskingView;
}

- (void)setMaskingView:(id)a3
{
  objc_storeStrong((id *)&self->_maskingView, a3);
}

- (NSIndexPath)shimmeringItemIndexPath
{
  return self->_shimmeringItemIndexPath;
}

- (void)setShimmeringItemIndexPath:(id)a3
{
  self->_shimmeringItemIndexPath = (NSIndexPath *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskingView, 0);
  objc_storeStrong((id *)&self->_centeringCollectionViewDelegate, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_cachedGroupTitleSizes, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_groupItems, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
