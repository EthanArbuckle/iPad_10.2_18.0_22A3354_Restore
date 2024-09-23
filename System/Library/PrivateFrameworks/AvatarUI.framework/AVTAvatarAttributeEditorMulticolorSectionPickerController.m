@implementation AVTAvatarAttributeEditorMulticolorSectionPickerController

+ (BOOL)supportsSelection
{
  return 0;
}

+ (double)estimatedContentWidthForTitleSizes:(id)a3 items:(id)a4
{
  id v5;
  id v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = 0.0;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v23;
      v13 = 0.0;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "CGSizeValue");
          v16 = v15;
          v18 = v17;
          objc_msgSend(v6, "objectAtIndexedSubscript:", v11 + i);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "isPlaceholder"))
            +[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell estimatedWidthForLabelSize:](AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell, "estimatedWidthForLabelSize:", v16, v18);
          else
            +[AVTAvatarAttributeEditorMulticolorPickerCell estimatedWidthForLabelSize:isRemovable:isSelected:](AVTAvatarAttributeEditorMulticolorPickerCell, "estimatedWidthForLabelSize:isRemovable:isSelected:", objc_msgSend(v19, "isRemovable"), objc_msgSend(v19, "isSelected"), v16, v18);
          v13 = v13 + v20;

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v11 += i;
      }
      while (v10);
    }
    else
    {
      v13 = 0.0;
    }

    v7 = v13 + (double)(unint64_t)(objc_msgSend(v8, "count") - 1) * 14.0;
  }

  return v7;
}

+ (double)estimatedContentWidthForWrappingTitleSizes:(id)a3 items:(id)a4 forWidth:(double)a5
{
  id v8;
  id v9;
  double v10;
  unint64_t v11;
  double v12;

  v8 = a3;
  v9 = a4;
  v10 = 0.0;
  if (v8 && objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v9, "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(a1, "cellSizeForItemAtIndex:forTitleSizes:items:forContainerWidth:", v11, v8, v9, a5);
        v10 = v10 + v12;
        ++v11;
      }
      while (objc_msgSend(v9, "count") > v11);
    }
    v10 = v10 + (double)(unint64_t)(objc_msgSend(v8, "count") - 1) * 14.0;
  }

  return v10;
}

+ (double)estimatedContentHeightForWrappingTitleSizes:(id)a3 items:(id)a4 forWidth:(double)a5
{
  id v8;
  id v9;
  double v10;
  unint64_t v11;
  double v12;

  v8 = a3;
  v9 = a4;
  v10 = 0.0;
  if (v8 && objc_msgSend(v8, "count") && objc_msgSend(v9, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(a1, "cellSizeForItemAtIndex:forTitleSizes:items:forContainerWidth:", v11, v8, v9, a5);
      if (v10 < v12)
        v10 = v12;
      ++v11;
    }
    while (objc_msgSend(v9, "count") > v11);
  }

  return v10;
}

+ (BOOL)shouldWrapTitlesForTitleSizes:(id)a3 items:(id)a4 forWidth:(double)a5
{
  return 0;
}

+ (BOOL)shouldScrollGivenTitleSizes:(id)a3 fittingWidth:(double)a4 items:(id)a5
{
  double v6;

  objc_msgSend(a1, "estimatedContentWidthForTitleSizes:items:", a3, a5);
  return v6 > a4;
}

+ (CGPoint)clampedContentOffsetForOffset:(CGPoint)a3 collectionView:(id)a4
{
  CGFloat y;
  double x;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_msgSend(v6, "contentSize");
  v8 = v7;
  objc_msgSend(v6, "contentInset");
  v10 = v8 + v9;
  objc_msgSend(v6, "bounds");
  v11 = v10 - CGRectGetWidth(v18);
  objc_msgSend(v6, "contentInset");
  v13 = v12;

  v14 = -v13;
  if (v11 >= x)
    v15 = x;
  else
    v15 = v11;
  if (v15 >= v14)
    v14 = v15;
  v16 = y;
  result.y = v16;
  result.x = v14;
  return result;
}

- (void)cacheTitleSizes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  NSArray *cachedTitleSizes;
  AVTAvatarAttributeEditorMulticolorSectionPickerController *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v24 = self;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    v12 = *MEMORY[0x1E0CEA098];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "localizedName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v12;
        objc_msgSend((id)objc_opt_class(), "labelFont");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sizeWithAttributes:", v16);
        v18 = v17;
        v20 = v19;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v21);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v10);
  }

  v22 = objc_msgSend(v6, "copy");
  cachedTitleSizes = v24->_cachedTitleSizes;
  v24->_cachedTitleSizes = (NSArray *)v22;

}

- (id)sectionView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController setContainerView:](self, "setContainerView:", v4);

    -[AVTAvatarAttributeEditorMulticolorSectionPickerController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMasksToBounds:", 0);

  }
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController cacheTitleSizes](self, "cacheTitleSizes");
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController createCollectionView](self, "createCollectionView");
  }
  return -[AVTAvatarAttributeEditorMulticolorSectionPickerController containerView](self, "containerView");
}

- (void)createCollectionView
{
  id v3;
  void *v4;
  UICollectionView *v5;
  UICollectionView *collectionView;
  void *v7;
  void *v8;
  UICollectionView *v9;
  uint64_t v10;
  void *v11;
  UICollectionView *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *cachedTitleSizes;
  void *v18;
  double Width;
  void *v20;
  void *v21;
  uint64_t v22;
  AVTFlippingCollectionViewFlowLayout *v23;
  CGRect v24;

  v23 = objc_alloc_init(AVTFlippingCollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v23, "setScrollDirection:", 1);
  -[UICollectionViewFlowLayout setSectionInset:](v23, "setSectionInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v23, "setMinimumInteritemSpacing:", 14.0);
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController setFlowLayout:](self, "setFlowLayout:", v23);
  v3 = objc_alloc(MEMORY[0x1E0CEA410]);
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v23);
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v7);

  -[UICollectionView layer](self->_collectionView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMasksToBounds:", 0);

  -[UICollectionView setContentInsetAdjustmentBehavior:](self->_collectionView, "setContentInsetAdjustmentBehavior:", 2);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  v9 = self->_collectionView;
  v10 = objc_opt_class();
  +[AVTAvatarAttributeEditorMulticolorPickerCell cellIdentifier](AVTAvatarAttributeEditorMulticolorPickerCell, "cellIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v9, "registerClass:forCellWithReuseIdentifier:", v10, v11);

  v12 = self->_collectionView;
  v13 = objc_opt_class();
  +[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell cellIdentifier](AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell, "cellIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v12, "registerClass:forCellWithReuseIdentifier:", v13, v14);

  -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController containerView](self, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_collectionView);

  -[UICollectionView setDecelerationRate:](self->_collectionView, "setDecelerationRate:", *MEMORY[0x1E0CEBBA0]);
  v16 = (void *)objc_opt_class();
  cachedTitleSizes = self->_cachedTitleSizes;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController containerView](self, "containerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  Width = CGRectGetWidth(v24);
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v16, "shouldScrollGivenTitleSizes:fittingWidth:items:", cachedTitleSizes, v21, Width);

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", v22);

}

- (void)updateInsetsForSize:(CGSize)a3
{
  double width;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  width = a3.width;
  v5 = objc_opt_class();
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController cachedTitleSizes](self, "cachedTitleSizes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend((id)v5, "shouldScrollGivenTitleSizes:fittingWidth:items:", v6, v8, width);

  if ((v5 & 1) != 0)
  {
    v9 = 20.0;
  }
  else
  {
    v10 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController cachedTitleSizes](self, "cachedTitleSizes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "adjustedWidthForTitleSizes:items:forWidth:", v11, v13, width);
    v9 = (width - v14) * 0.5;

  }
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentInset");
  v19 = v18;
  if (v20 != v9 || v16 != 20.0 || v17 != v9)
  {

    goto LABEL_10;
  }

  if (v19 != 0.0)
  {
LABEL_10:
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContentInset:", 20.0, v9, 0.0, v9);

  }
}

- (void)cell:(id)a3 willDisplayAtIndex:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "bounds");
  v6 = v5;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController updateInsetsForSize:](self, "updateInsetsForSize:", v5, v7);
  v8 = (void *)objc_opt_class();
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController cachedTitleSizes](self, "cachedTitleSizes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "shouldScrollGivenTitleSizes:fittingWidth:items:", v9, v11, v6);

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScrollEnabled:", v12);

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "indexOfObjectPassingTest:", &__block_literal_global_23);

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "indexPathsForSelectedItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19 || objc_msgSend(v19, "item") != v16)
  {
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "selectItemAtIndexPath:animated:scrollPosition:", v21, 0, 0);

  }
  objc_msgSend(v22, "layoutIfNeeded");

}

uint64_t __85__AVTAvatarAttributeEditorMulticolorSectionPickerController_cell_willDisplayAtIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSelected");
}

- (UIEdgeInsets)edgeInsetsFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)evaluateDisplayCondition:(id)a3
{
  return 1;
}

- (unint64_t)indexForItem:(id)a3
{
  return 0;
}

- (void)invalidateLayoutForNewContainerSize:(CGSize)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateLayout");

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController containerView](self, "containerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController updateInsetsForSize:](self, "updateInsetsForSize:", v6, v7);

}

- (int64_t)numberOfItems
{
  return 1;
}

- (id)prefetchingSectionItemForIndex:(int64_t)a3
{
  return 0;
}

- (CGSize)sizeForFocusingItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a4.width;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController containerView](self, "containerView", a3, a4.width, a4.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeForItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double width;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  width = a4.width;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController cachedTitleSizes](self, "cachedTitleSizes", a3, a4.width, a4.height);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        -[AVTAvatarAttributeEditorMulticolorSectionPickerController cachedTitleSizes](self, "cachedTitleSizes"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7,
        v9))
  {
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController cachedTitleSizes](self, "cachedTitleSizes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "CGSizeValue");
    v13 = v12;
    v14 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController cachedTitleSizes](self, "cachedTitleSizes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sectionItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v14, "shouldWrapTitlesForTitleSizes:items:forWidth:", v15, v17, width);

    v18 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController cachedTitleSizes](self, "cachedTitleSizes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sectionItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "estimatedContentHeightForWrappingTitleSizes:items:forWidth:", v19, v21, width);
    v23 = v22;

    v24 = v13 + 22.0;
    if ((_DWORD)v14)
      v24 = v23;
    v25 = ceil(v24 + 20.0);

  }
  else
  {
    v25 = 60.0;
  }
  v26 = width;
  v27 = v25;
  result.height = v27;
  result.width = v26;
  return result;
}

- (CGSize)cellSizeForItemAtIndex:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController cachedTitleSizes](self, "cachedTitleSizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController cachedTitleSizes](self, "cachedTitleSizes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sectionItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController containerView](self, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    objc_msgSend(v7, "cellSizeForItemAtIndex:forTitleSizes:items:forContainerWidth:", a3, v8, v10, v12);
    v14 = v13;
    v16 = v15;

  }
  else
  {
    v14 = *MEMORY[0x1E0C9D820];
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

+ (CGSize)cellSizeForItemAtIndex:(int64_t)a3 forTitleSizes:(id)a4 items:(id)a5 forContainerWidth:(double)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  _QWORD v40[2];
  CGSize result;

  v40[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v11, "count") <= (unint64_t)a3)
  {
    v21 = *MEMORY[0x1E0C9D820];
    v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CGSizeValue");
    v15 = v14;
    v17 = v16;
    if (v12)
    {
      v18 = objc_msgSend(v12, "isRemovable");
      v19 = objc_msgSend(v12, "isSelected");
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
    if (objc_msgSend(a1, "shouldWrapTitlesForTitleSizes:items:forWidth:", v10, v11, a6))
    {
      v22 = a6 + -30.0 + (double)(unint64_t)(objc_msgSend(v11, "count") - 1) * -14.0;
      v23 = v22 / (double)(unint64_t)objc_msgSend(v11, "count");
      if (objc_msgSend(v12, "isPlaceholder"))
        +[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell estimatedTitleSpaceForWidth:](AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell, "estimatedTitleSpaceForWidth:", v23);
      else
        +[AVTAvatarAttributeEditorMulticolorPickerCell estimatedTitleSpaceForWidth:isRemovable:isSelected:](AVTAvatarAttributeEditorMulticolorPickerCell, "estimatedTitleSpaceForWidth:isRemovable:isSelected:", v18, v19, v23);
      v25 = v24;
      objc_msgSend((id)objc_opt_class(), "labelFont");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *MEMORY[0x1E0CEA098];
      v40[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "boundingRectWithSize:options:attributes:context:", 1, v28, 0, v25, 1.79769313e308);
      v30 = v29;
      v32 = v31;

      objc_msgSend(v26, "lineHeight");
      v34 = ceil(v33 + v33) + 3.0;
      v15 = ceil(v30);
      v35 = ceil(v32);
      if (v35 >= v34)
        v17 = v34;
      else
        v17 = v35;

    }
    if (objc_msgSend(v12, "isPlaceholder"))
      +[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell estimatedWidthForLabelSize:](AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell, "estimatedWidthForLabelSize:", v15, v17);
    else
      +[AVTAvatarAttributeEditorMulticolorPickerCell estimatedWidthForLabelSize:isRemovable:isSelected:](AVTAvatarAttributeEditorMulticolorPickerCell, "estimatedWidthForLabelSize:isRemovable:isSelected:", v18, v19, v15, v17);
    v21 = v36;
    v20 = v17 + 22.0;

  }
  v37 = v21;
  v38 = v20;
  result.height = v38;
  result.width = v37;
  return result;
}

- (void)updateCell:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController viewForIndex:](self, "viewForIndex:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v8, "setFrame:");

  objc_msgSend(v6, "setAttributeView:", v8);
}

- (void)updateWithSection:(id)a3
{
  AVTAvatarAttributeEditorSection *v5;
  char isKindOfClass;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  AVTAvatarAttributeEditorSection *v26;

  v5 = (AVTAvatarAttributeEditorSection *)a3;
  if (self->_section != v5)
  {
    v26 = v5;
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController currentRelativeContentOffsetX](self, "currentRelativeContentOffsetX");
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController setCurrentOffsetX:](self, "setCurrentOffsetX:");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v26;
    if ((isKindOfClass & 1) != 0)
    {
      objc_storeStrong((id *)&self->_section, a3);
      -[AVTAvatarAttributeEditorMulticolorSectionPickerController cacheTitleSizes](self, "cacheTitleSizes");
      -[AVTAvatarAttributeEditorMulticolorSectionPickerController containerView](self, "containerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      -[AVTAvatarAttributeEditorMulticolorSectionPickerController updateInsetsForSize:](self, "updateInsetsForSize:", v8, v9);

      -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reloadData");

      v11 = (void *)objc_opt_class();
      -[AVTAvatarAttributeEditorMulticolorSectionPickerController cachedTitleSizes](self, "cachedTitleSizes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarAttributeEditorMulticolorSectionPickerController containerView](self, "containerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;
      -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sectionItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v11, "shouldScrollGivenTitleSizes:fittingWidth:items:", v12, v17, v15);

      -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sectionItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "indexOfObjectPassingTest:", &__block_literal_global_11);

      -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setScrollEnabled:", v18);

      v23 = 0.0;
      if ((_DWORD)v18)
        -[AVTAvatarAttributeEditorMulticolorSectionPickerController currentOffsetX](self, "currentOffsetX", 0.0);
      -[AVTAvatarAttributeEditorMulticolorSectionPickerController setCurrentRelativeContentOffsetX:](self, "setCurrentRelativeContentOffsetX:", v23);
      -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "selectItemAtIndexPath:animated:scrollPosition:", v25, 0, 0);

      v5 = v26;
    }
  }

}

uint64_t __79__AVTAvatarAttributeEditorMulticolorSectionPickerController_updateWithSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSelected");
}

- (double)currentRelativeContentOffsetX
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInset");
  v8 = v5 + v7;

  return v8;
}

- (void)setCurrentRelativeContentOffsetX:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double Width;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  CGRect v29;

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  v7 = v6;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v29);
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentInset");
  v12 = v11;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInset");
  v15 = Width - (v12 + v14);

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentInset");
  v18 = v17;

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contentOffset");
  v21 = v20;

  if (v7 <= v15)
  {
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentInset");
    v25 = -v27;
  }
  else
  {
    v22 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "clampedContentOffsetForOffset:collectionView:", v23, a3 - v18, v21);
    v25 = v24;
    v21 = v26;
  }

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setContentOffset:", v25, v21);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AVTAvatarAttributeEditorMulticolorSectionPickerController *v14;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isPlaceholder"))
  {
    +[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell cellIdentifier](AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell, "cellIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setItem:", v10);
  }
  else
  {
    +[AVTAvatarAttributeEditorMulticolorPickerCell cellIdentifier](AVTAvatarAttributeEditorMulticolorPickerCell, "cellIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setItem:", v10);
    objc_msgSend(v12, "delegate");
    v14 = (AVTAvatarAttributeEditorMulticolorSectionPickerController *)objc_claimAutoreleasedReturnValue();

    if (v14 != self)
      objc_msgSend(v12, "setDelegate:", self);
  }

  return v12;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController cellSizeForItemAtIndex:](self, "cellSizeForItemAtIndex:", objc_msgSend(a5, "row", a3, a4));
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributeEditorSectionController:didSelectSectionItem:", self, v8);

}

- (void)attributeSection:(id)a3 didChangeValueForSectionItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathsForSelectedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "updateColor");
  }

}

- (void)multicolorPickerCellDidTapClearButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v13, "item");
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController section](self, "section");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subarrayWithRange:", v8, objc_msgSend(v10, "count") - objc_msgSend(v13, "item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorMulticolorSectionPickerController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributeEditorSectionController:didDeleteSectionItems:", self, v11);

}

- (AVTAvatarAttributeEditorControllerSubSelectionDelegate)delegate
{
  return (AVTAvatarAttributeEditorControllerSubSelectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTAvatarAttributeEditorSection)section
{
  return self->_section;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_flowLayout, a3);
}

- (double)currentOffsetX
{
  return self->_currentOffsetX;
}

- (void)setCurrentOffsetX:(double)a3
{
  self->_currentOffsetX = a3;
}

- (NSArray)cachedTitleSizes
{
  return self->_cachedTitleSizes;
}

- (void)setCachedTitleSizes:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTitleSizes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTitleSizes, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
