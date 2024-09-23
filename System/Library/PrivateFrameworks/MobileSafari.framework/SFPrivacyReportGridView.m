@implementation SFPrivacyReportGridView

- (SFPrivacyReportGridView)init
{
  void *v3;
  SFPrivacyReportGridView *v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = -[SFPrivacyReportGridView initWithFrame:](self, "initWithFrame:");

  return v4;
}

- (SFPrivacyReportGridView)initWithFrame:(CGRect)a3
{
  SFPrivacyReportGridView *v3;
  uint64_t v4;
  NSMutableArray *cachedRowInfo;
  UICollectionViewFlowLayout *v6;
  UICollectionViewFlowLayout *collectionViewLayout;
  id v8;
  uint64_t v9;
  UICollectionView *collectionView;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  id v15;
  SFPrivacyReportGridView *v16;
  objc_super v18;
  _QWORD v19[2];
  CGRect v20;

  v19[1] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)SFPrivacyReportGridView;
  v3 = -[SFPrivacyReportGridView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    cachedRowInfo = v3->_cachedRowInfo;
    v3->_cachedRowInfo = (NSMutableArray *)v4;

    v6 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E0DC3610]);
    collectionViewLayout = v3->_collectionViewLayout;
    v3->_collectionViewLayout = v6;

    v8 = objc_alloc(MEMORY[0x1E0DC35B8]);
    -[SFPrivacyReportGridView bounds](v3, "bounds");
    v9 = objc_msgSend(v8, "initWithFrame:collectionViewLayout:", v3->_collectionViewLayout);
    collectionView = v3->_collectionView;
    v3->_collectionView = (UICollectionView *)v9;

    -[UICollectionView setAutoresizingMask:](v3->_collectionView, "setAutoresizingMask:", 18);
    -[UICollectionView setScrollEnabled:](v3->_collectionView, "setScrollEnabled:", 0);
    -[SFPrivacyReportGridView updateInterItemSpacing](v3, "updateInterItemSpacing");
    -[SFPrivacyReportGridView addSubview:](v3, "addSubview:", v3->_collectionView);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v3->_collectionView, "setBackgroundColor:", v11);

    -[UICollectionView setDelegate:](v3->_collectionView, "setDelegate:", v3);
    -[UICollectionView setDataSource:](v3->_collectionView, "setDataSource:", v3);
    -[UICollectionView frame](v3->_collectionView, "frame");
    v3->_previousCollectionViewWidth = CGRectGetWidth(v20);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v3->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("reportGridItemCell"));
    -[SFPrivacyReportGridView traitCollection](v3, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredContentSizeCategory");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    v3->_isAccessibilitySize = UIContentSizeCategoryIsAccessibilityCategory(v13);

    v19[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[SFPrivacyReportGridView registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v14, v3, sel__preferredContentSizeCategoryDidChange);

    v16 = v3;
  }

  return v3;
}

- (void)invalidateIntrinsicContentSize
{
  id WeakRetained;
  objc_super v4;

  -[NSMutableArray removeAllObjects](self->_cachedRowInfo, "removeAllObjects");
  -[UICollectionViewFlowLayout invalidateLayout](self->_collectionViewLayout, "invalidateLayout");
  -[UICollectionView setNeedsLayout](self->_collectionView, "setNeedsLayout");
  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportGridView;
  -[SFPrivacyReportGridView invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "gridViewDidUpdateContentSize:", self);

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UICollectionView layoutIfNeeded](self->_collectionView, "layoutIfNeeded");
  v3 = *MEMORY[0x1E0DC55F0];
  -[UICollectionViewFlowLayout collectionViewContentSize](self->_collectionViewLayout, "collectionViewContentSize");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)updateInterItemSpacing
{
  double v3;
  double v4;
  double v5;

  -[SFPrivacyReportGridView interItemSpacing](self, "interItemSpacing");
  v4 = v3;
  -[UICollectionViewFlowLayout minimumInteritemSpacing](self->_collectionViewLayout, "minimumInteritemSpacing");
  if (v4 != v5)
  {
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_collectionViewLayout, "setMinimumInteritemSpacing:", v4);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_collectionViewLayout, "setMinimumLineSpacing:", v4);
    -[SFPrivacyReportGridView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[SFPrivacyReportGridView didUpdateInterItemSpacing:](self, "didUpdateInterItemSpacing:", v4);
  }
}

- (void)_preferredContentSizeCategoryDidChange
{
  void *v3;
  NSString *v4;

  -[SFPrivacyReportGridView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  self->_isAccessibilitySize = UIContentSizeCategoryIsAccessibilityCategory(v4);

  -[SFPrivacyReportGridView updateInterItemSpacing](self, "updateInterItemSpacing");
}

- (void)layoutSubviews
{
  CGFloat Width;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportGridView;
  -[SFPrivacyReportGridView layoutSubviews](&v4, sel_layoutSubviews);
  -[UICollectionView frame](self->_collectionView, "frame");
  Width = CGRectGetWidth(v5);
  if (Width != self->_previousCollectionViewWidth)
  {
    self->_previousCollectionViewWidth = Width;
    -[SFPrivacyReportGridView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)_rebuildRowLayoutInfoIfNeeded
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  int64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char v10;
  double v11;
  double v12;
  double v13;
  double Width;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  SFPrivacyReportGridRowLayoutInfo *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;

  v37 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_cachedRowInfo, "count"))
  {
    -[SFPrivacyReportGridView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    if ((int64_t)-[NSArray count](self->_itemViews, "count") >= 1)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        if (v6 + 1 >= (int64_t)-[NSArray count](self->_itemViews, "count")
          || (-[NSArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", v6),
              v8 = (void *)objc_claimAutoreleasedReturnValue(),
              v9 = -[SFPrivacyReportGridView itemViewIsLineBreak:](self, "itemViewIsLineBreak:", v8),
              v8,
              v9))
        {
          v10 = 0;
        }
        else
        {
          -[NSArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", v6);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[SFPrivacyReportGridView itemViewCanUseCompactWidth:](self, "itemViewCanUseCompactWidth:", v22))
          {
            -[NSArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", v6 + 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[SFPrivacyReportGridView itemViewCanUseCompactWidth:](self, "itemViewCanUseCompactWidth:", v23);

            if (v24)
              v11 = 250.0;
            else
              v11 = 375.0;
            if (v24)
              v12 = 150.0;
            else
              v12 = 250.0;
            v10 = 1;
            goto LABEL_8;
          }

          v10 = 1;
        }
        v11 = 375.0;
        v12 = 250.0;
LABEL_8:
        if (IsAccessibilityCategory)
          v13 = v11;
        else
          v13 = v12;
        -[UICollectionView frame](self->_collectionView, "frame");
        Width = CGRectGetWidth(v38);
        -[UICollectionViewFlowLayout minimumInteritemSpacing](self->_collectionViewLayout, "minimumInteritemSpacing");
        v16 = v15;
        -[UICollectionViewFlowLayout sectionInset](self->_collectionViewLayout, "sectionInset");
        if ((v10 & (v16 + v18 + v17 + v13 * 2.0 <= Width)) != 0)
          v19 = 2;
        else
          v19 = 1;
        v20 = -[SFPrivacyReportGridRowLayoutInfo initWithRow:itemRange:]([SFPrivacyReportGridRowLayoutInfo alloc], "initWithRow:itemRange:", v7, v6, v19);
        v21 = v19;
        do
        {
          -[NSMutableArray addObject:](self->_cachedRowInfo, "addObject:", v20);
          --v21;
        }
        while (v21);
        ++v7;
        v6 += v19;

      }
      while (v6 < (int64_t)-[NSArray count](self->_itemViews, "count"));
    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v33 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          -[NSArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", objc_msgSend(v30, "item"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setGridPosition:", -[SFPrivacyReportGridView _gridPositionForItemAtIndexPath:](self, "_gridPositionForItemAtIndexPath:", v30));

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v27);
    }

  }
}

- (void)layoutMarginsDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)SFPrivacyReportGridView;
  -[SFPrivacyReportGridView layoutMarginsDidChange](&v13, sel_layoutMarginsDidChange);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[UICollectionView visibleCells](self->_collectionView, "visibleCells", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        -[SFPrivacyReportGridView layoutMargins](self, "layoutMargins");
        objc_msgSend(v8, "setLayoutMargins:");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

  -[SFPrivacyReportGridView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (BOOL)itemViewCanUseCompactWidth:(id)a3
{
  return 0;
}

- (BOOL)itemViewIsLineBreak:(id)a3
{
  return 0;
}

- (double)interItemSpacing
{
  void *v3;
  double v4;

  -[SFPrivacyReportGridView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "horizontalSizeClass") != 2 || (v4 = 20.0, objc_msgSend(v3, "verticalSizeClass") != 2))
  {
    if (self->_isAccessibilitySize)
      v4 = 20.0;
    else
      v4 = 10.0;
  }

  return v4;
}

- (unint64_t)_gridPositionForItemAtIndexPath:(id)a3
{
  NSMutableArray *cachedRowInfo;
  id v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  cachedRowInfo = self->_cachedRowInfo;
  v5 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](cachedRowInfo, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "row") == 0;
  v8 = objc_msgSend(v6, "row");
  -[NSMutableArray lastObject](self->_cachedRowInfo, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "row");

  if (v8 == v10)
    v11 = v7 | 2;
  else
    v11 = v7;
  v12 = objc_msgSend(v5, "item");
  if (v12 == objc_msgSend(v6, "itemRange"))
    v11 |= 4uLL;
  v13 = objc_msgSend(v5, "item");

  v14 = objc_msgSend(v6, "itemRange");
  objc_msgSend(v6, "itemRange");
  if (v13 == v14 + v15 - 1)
    v16 = v11 | 8;
  else
    v16 = v11;

  return v16;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("reportGridItemCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);
  v9 = -[SFPrivacyReportGridView _gridPositionForItemAtIndexPath:](self, "_gridPositionForItemAtIndexPath:", v6);

  objc_msgSend(v8, "setGridPosition:", v9);
  -[SFPrivacyReportGridView layoutMargins](self, "layoutMargins");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v7, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLayoutMargins:", v11, v13, v15, v17);

  objc_msgSend(v7, "defaultBackgroundConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v8, "cellBackgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v21);

  }
  objc_msgSend(v8, "cellBackgroundCornerRadius");
  if (v22 != 9.22337204e18)
  {
    objc_msgSend(v8, "cellBackgroundCornerRadius");
    objc_msgSend(v19, "setCornerRadius:");
  }
  objc_msgSend(v7, "setBackgroundConfiguration:", v19);
  objc_msgSend(v7, "setReportView:", v8);

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return -[NSArray count](self->_itemViews, "count", a3);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double Width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSArray *itemViews;
  double v28;
  double v29;
  _QWORD v30[6];
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  CGSize result;
  CGRect v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SFPrivacyReportGridView _rebuildRowLayoutInfoIfNeeded](self, "_rebuildRowLayoutInfoIfNeeded");
  -[NSMutableArray objectAtIndexedSubscript:](self->_cachedRowInfo, "objectAtIndexedSubscript:", objc_msgSend(v10, "item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView frame](self->_collectionView, "frame");
  Width = CGRectGetWidth(v36);
  -[UICollectionViewFlowLayout minimumInteritemSpacing](self->_collectionViewLayout, "minimumInteritemSpacing");
  v14 = v13;
  -[UICollectionViewFlowLayout sectionInset](self->_collectionViewLayout, "sectionInset");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v11, "itemRange");
  v31 = 0;
  v32 = (double *)&v31;
  v20 = (Width - v16 - v18 - v14 * (double)(v19 - 1)) / (double)v19;
  v33 = 0x2020000000;
  v34 = 0;
  objc_msgSend(v11, "height");
  v34 = v21;
  v22 = v32[3];
  if (v22 == 0.0)
  {
    v23 = (void *)MEMORY[0x1E0CB36B8];
    v24 = objc_msgSend(v11, "itemRange");
    objc_msgSend(v23, "indexSetWithIndexesInRange:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    itemViews = self->_itemViews;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __72__SFPrivacyReportGridView_collectionView_layout_sizeForItemAtIndexPath___block_invoke;
    v30[3] = &unk_1E21E6078;
    v30[4] = &v31;
    *(double *)&v30[5] = v20;
    -[NSArray enumerateObjectsAtIndexes:options:usingBlock:](itemViews, "enumerateObjectsAtIndexes:options:usingBlock:", v26, 0, v30);
    objc_msgSend(v11, "setHeight:", v32[3]);

    v22 = v32[3];
  }
  _Block_object_dispose(&v31, 8);

  v28 = v20;
  v29 = v22;
  result.height = v29;
  result.width = v28;
  return result;
}

double __72__SFPrivacyReportGridView_collectionView_layout_sizeForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  double v7;
  double v8;
  double result;

  v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  LODWORD(a5) = 1148846080;
  LODWORD(a6) = 1112014848;
  objc_msgSend(a2, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *(double *)(a1 + 40), 1000.0, a5, a6);
  result = fmax(v7, v8);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  -[NSArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", objc_msgSend(a4, "item", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  void (**v4)(void);
  id v5;

  -[NSArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", objc_msgSend(a4, "item", a3));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "action");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();

}

- (NSArray)itemViews
{
  return self->_itemViews;
}

- (void)setItemViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (SFPrivacyReportGridViewDelegate)delegate
{
  return (SFPrivacyReportGridViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemViews, 0);
  objc_storeStrong((id *)&self->_cachedRowInfo, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
