@implementation TabBar

+ (double)defaultHeight
{
  double result;

  _SFRoundFloatToPixels();
  return result;
}

uint64_t __32__TabBar__updatePinnedItemCount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPlaceholder");
}

- (double)_horizontalPositionForItemAtIndex:(unint64_t)a3 withSlowingFactor:(double)a4 pinned:(BOOL)a5
{
  int64_t v5;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double result;
  double v23;
  double v24;
  NSUInteger v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;

  v5 = a3;
  if (a5)
  {
    v7 = (double)(a3
                - -[NSIndexSet countOfIndexesInRange:](self->_overflowPinnedItemIndexes, "countOfIndexesInRange:", 0, a3, a4))* 36.0;
    -[TabBar _sf_safeAreaBounds](self, "_sf_safeAreaBounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = -[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
    v17 = v9;
    v18 = v11;
    v19 = v13;
    v20 = v15;
    if (v16)
      return v7 + CGRectGetMinX(*(CGRect *)&v17);
    else
      return CGRectGetMaxX(*(CGRect *)&v17) - v7;
  }
  else
  {
    -[TabBar bounds](self, "bounds");
    v24 = v23;
    v25 = -[NSArray count](self->_items, "count");
    -[TabBar _itemWidth](self, "_itemWidth");
    v27 = v26;
    if (!-[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
      v5 = v25 - v5;
    if (-[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
      v5 -= -[TabBar _totalPinnedItemCount](self, "_totalPinnedItemCount");
    -[TabBar _pinnedItemInsets](self, "_pinnedItemInsets");
    v29 = v28;
    -[TabBar _sf_safeAreaBounds](self, "_sf_safeAreaBounds");
    v30 = v29 + CGRectGetMinX(v35);
    if (-[TabBar _isScrollable](self, "_isScrollable"))
    {
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      v32 = v31;
      v33 = v29 + v27 * (double)-[TabBar _scrollableItemCount](self, "_scrollableItemCount");
      v34 = v30 + (double)v5 * v27;
      itemOffsetForSlowingOffset(v33 - v34, v33 - v24 - v32, a4);
      itemOffsetForSlowingOffset(v34 - v29, v32, a4);
    }
    _SFRoundFloatToPixels();
  }
  return result;
}

- (double)_scrollableWidth
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[TabBar _itemWidth](self, "_itemWidth");
  v4 = v3;
  v5 = (double)-[TabBar _scrollableItemCount](self, "_scrollableItemCount");
  -[TabBar _pinnedItemsWidth](self, "_pinnedItemsWidth");
  return v6 + v4 * v5;
}

- (double)_itemWidth
{
  double Width;
  double v4;
  double v5;
  double minimumTabWidth;
  unint64_t v7;
  double v8;
  CGRect v10;

  -[TabBar _sf_safeAreaBounds](self, "_sf_safeAreaBounds");
  Width = CGRectGetWidth(v10);
  -[TabBar _pinnedItemsWidth](self, "_pinnedItemsWidth");
  v5 = v4;
  minimumTabWidth = self->_minimumTabWidth;
  v7 = -[TabBar _scrollableItemCount](self, "_scrollableItemCount");
  v8 = 1.0;
  if (v7 >= 2)
    v8 = (double)-[TabBar _scrollableItemCount](self, "_scrollableItemCount", 1.0);
  return fmax(minimumTabWidth, (Width - v5) / v8);
}

- (double)_pinnedItemsWidth
{
  unint64_t visiblePinnedItemCount;
  unint64_t v3;

  visiblePinnedItemCount = self->_visiblePinnedItemCount;
  if (-[NSIndexSet count](self->_overflowPinnedItemIndexes, "count"))
    v3 = visiblePinnedItemCount + 1;
  else
    v3 = visiblePinnedItemCount;
  return (double)v3 * 36.0;
}

- (unint64_t)_scrollableItemCount
{
  NSUInteger v3;

  v3 = -[NSArray count](self->_items, "count");
  return v3 - -[TabBar _totalPinnedItemCount](self, "_totalPinnedItemCount");
}

- (unint64_t)_totalPinnedItemCount
{
  unint64_t visiblePinnedItemCount;

  visiblePinnedItemCount = self->_visiblePinnedItemCount;
  return -[NSIndexSet count](self->_overflowPinnedItemIndexes, "count") + visiblePinnedItemCount;
}

- (BOOL)_isScrollable
{
  double v3;
  double v4;
  CGRect v6;

  -[TabBar _scrollableWidth](self, "_scrollableWidth");
  v4 = v3;
  -[TabBar _sf_safeAreaBounds](self, "_sf_safeAreaBounds");
  return v4 > CGRectGetWidth(v6);
}

- (UIEdgeInsets)_pinnedItemInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  -[TabBar _pinnedItemsWidth](self, "_pinnedItemsWidth");
  UIEdgeInsetsMakeWithEdges();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (NSArray)items
{
  return self->_items;
}

- (double)minimumTabWidth
{
  return self->_minimumTabWidth;
}

- (void)scrollToItem:(id)a3 animated:(BOOL)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[TabBar _scrollToItemIfNeeded:](self, "_scrollToItemIfNeeded:", a3);
  if (a4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = self->_items;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v11), "layoutInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isVisibleInTabBar"))
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "setActiveAnimationCount:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "activeAnimationCount") + 1);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v15);
    }

    v18 = (void *)MEMORY[0x1E0DC3F10];
    v21 = v13;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __32__TabBar_scrollToItem_animated___block_invoke;
    v22[3] = &unk_1E9CF1900;
    v22[4] = self;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __32__TabBar_scrollToItem_animated___block_invoke_2;
    v20[3] = &unk_1E9CF16A0;
    v19 = v13;
    objc_msgSend(v18, "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v22, v20);

  }
  else
  {
    -[TabBar layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  }
}

- (void)_scrollToItemIfNeeded:(id)a3
{
  _BOOL4 v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  CGRect v24;

  v23 = a3;
  v4 = -[TabBar _isScrollable](self, "_isScrollable");
  if (v23)
  {
    if (v4 && (objc_msgSend(v23, "isPinned") & 1) == 0)
    {
      -[TabBar _sf_safeAreaBounds](self, "_sf_safeAreaBounds");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      -[TabBar _itemWidth](self, "_itemWidth");
      v14 = v13;
      v15 = -[NSArray indexOfObject:](self->_items, "indexOfObject:", v23);
      if (v15 < -[NSArray count](self->_items, "count"))
      {
        if (-[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
          -[TabBar _totalPinnedItemCount](self, "_totalPinnedItemCount");
        -[TabBar _pinnedItemInsets](self, "_pinnedItemInsets");
        v24.origin.x = v6;
        v24.origin.y = v8;
        v24.size.width = v10;
        v24.size.height = v12;
        CGRectGetMinX(v24);
        _SFRoundFloatToPixels();
        v17 = v16;
        -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
        v19 = v18;
        v21 = fmax(fmin(v20, v17 + -128.0), v14 + v17 - v10 + 128.0);
        -[TabBar _scrollableWidth](self, "_scrollableWidth");
        -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", fmax(fmin(v21, v22 - v10), 0.0), v19);
      }
    }
  }

}

- (void)setDraggingItem:(BOOL)a3
{
  self->_draggingItem = a3;
}

- (void)setAllowsScrollingPinnedItems:(BOOL)a3
{
  self->_allowsScrollingPinnedItems = a3;
}

- (void)_updatePinnedItemCount
{
  NSIndexSet *v3;
  NSIndexSet *overflowPinnedItemIndexes;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSUInteger v11;
  NSUInteger v12;
  _BOOL4 v14;
  double v15;
  double Width;
  double v17;
  double v18;
  unint64_t v19;
  void *v20;
  NSUInteger v21;
  NSIndexSet *v22;
  NSIndexSet *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;

  v29 = *MEMORY[0x1E0C80C00];
  self->_visiblePinnedItemCount = 0;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v3 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
  overflowPinnedItemIndexes = self->_overflowPinnedItemIndexes;
  self->_overflowPinnedItemIndexes = v3;

  if (!self->_allowsScrollingPinnedItems)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = self->_items;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v5);
          v8 += objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "isPinned", (_QWORD)v24);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

    self->_visiblePinnedItemCount = v8;
    v11 = -[NSArray indexOfObjectPassingTest:](self->_items, "indexOfObjectPassingTest:", &__block_literal_global_45);
    v12 = v11;
    v14 = v11 != 0x7FFFFFFFFFFFFFFFLL && v11 < v8;
    v15 = 3.5;
    if (-[NSArray count](self->_items, "count", (_QWORD)v24) - v8 <= 3)
      v15 = (double)(-[NSArray count](self->_items, "count") - v8);
    -[TabBar _sf_safeAreaBounds](self, "_sf_safeAreaBounds");
    Width = CGRectGetWidth(v30);
    -[TabBar _itemWidth](self, "_itemWidth");
    v18 = fmax((Width - v17 * v15) / 36.0 + -1.0, 1.0) + (double)v14;
    if (v8 > (unint64_t)v18 + 1)
    {
      if (v8 >= (unint64_t)v18)
        v19 = (unint64_t)v18;
      else
        v19 = v8;
      self->_visiblePinnedItemCount = v19;
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", v19, v8 - v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[NSArray indexOfObjectPassingTest:](self->_items, "indexOfObjectPassingTest:", &__block_literal_global_45_1);
      if (objc_msgSend(v20, "containsIndex:", v21))
      {
        objc_msgSend(v20, "addIndex:", objc_msgSend(v20, "firstIndex") - 1);
        objc_msgSend(v20, "removeIndex:", v21);
      }
      if (objc_msgSend(v20, "containsIndex:", v12))
      {
        objc_msgSend(v20, "addIndex:", objc_msgSend(v20, "firstIndex") - 1);
        objc_msgSend(v20, "removeIndex:", v12);
      }
      v22 = (NSIndexSet *)objc_msgSend(v20, "copy");
      v23 = self->_overflowPinnedItemIndexes;
      self->_overflowPinnedItemIndexes = v22;

    }
  }
}

uint64_t __32__TabBar_scrollToItem_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
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
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)TabBar;
  -[TabBar layoutSubviews](&v18, sel_layoutSubviews);
  -[TabBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIScrollView frame](self->_scrollView, "frame");
  v20.origin.x = v11;
  v20.origin.y = v12;
  v20.size.width = v13;
  v20.size.height = v14;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  if (!CGRectEqualToRect(v19, v20))
  {
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10);
    -[TabBar _updatePinnedItemCount](self, "_updatePinnedItemCount");
  }
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[NSArray count](self->_items, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabBar _layoutIndexes:ofItems:currentItems:](self, "_layoutIndexes:ofItems:currentItems:", v15, self->_items, 0);

  if (!-[UIScrollView isDragging](self->_scrollView, "isDragging")
    && !-[UIScrollView isDecelerating](self->_scrollView, "isDecelerating")
    && self->_newTabVisibleInTabBar)
  {
    -[SFTabHoverPreviewController setNeedsSnapshotUpdate](self->_tabHoverPreviewController, "setNeedsSnapshotUpdate");
    self->_newTabVisibleInTabBar = 0;
  }
  -[TabBar _pinnedItemInsets](self, "_pinnedItemInsets");
  -[UIScrollView _setAutoScrollTouchInsets:](self->_scrollView, "_setAutoScrollTouchInsets:", 0.0, -128.0 - v16, 0.0, -128.0 - v17);
  -[TabBar _layOutPinnedOverflowButton](self, "_layOutPinnedOverflowButton");
}

- (void)_layoutIndexes:(id)a3 ofItems:(id)a4 currentItems:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  UIScrollView *scrollView;
  double v39;
  double v40;
  CGFloat rect2;
  id rect2_8;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  rect2_8 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "count");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    rect2 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = 1;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12, *(_QWORD *)&rect2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTabBar:", self);
      objc_msgSend(v17, "layoutInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_hidesTitles)
        v19 = 1;
      else
        v19 = objc_msgSend(v17, "isPlaceholder");
      objc_msgSend(v18, "setHidesTitleText:", v19);
      if (objc_msgSend(rect2_8, "containsIndex:", v12))
      {
        v20 = -[TabBar _effectiveIndexForIndex:ofItems:currentItems:](self, "_effectiveIndexForIndex:ofItems:currentItems:", v12, v8, v9);
        if (!v9
          || (objc_msgSend(v18, "frame"),
              v45.origin.x = rect2,
              v45.origin.y = v13,
              v45.size.width = v14,
              v45.size.height = v15,
              !CGRectEqualToRect(v43, v45))
          || (objc_msgSend(v17, "isActive") & 1) != 0
          || (objc_msgSend(v17, "isPlaceholder") & 1) != 0
          || v20 >= -[NSArray count](self->_items, "count"))
        {
          -[TabBar _frameForItemAtIndex:](self, "_frameForItemAtIndex:", v20);
        }
        else
        {
          -[TabBar _initialFrameForItemAtIndex:](self, "_initialFrameForItemAtIndex:", v20);
        }
        v25 = v21;
        v26 = v22;
        v27 = v23;
        v28 = v24;
        v29 = -[TabBar _isScrollable](self, "_isScrollable");
        v30 = 0.0;
        if (v29)
        {
          -[TabBar _horizontalPositionForItemAtIndex:withSlowingFactor:](self, "_horizontalPositionForItemAtIndex:withSlowingFactor:", v20, 52.0);
          v32 = v31;
          -[TabBar _horizontalPositionForItemAtIndex:](self, "_horizontalPositionForItemAtIndex:", v20);
          v30 = vabdd_f64(v32, v33);
        }
        objc_msgSend(v18, "setTitleAnchorAdditionalOffset:", v30);
        -[TabBar _layoutItem:atIndex:inRect:itemCount:beforeActiveItem:](self, "_layoutItem:atIndex:inRect:itemCount:beforeActiveItem:", v17, v12, v11, v16 & 1, v25, v26, v27, v28);
      }
      v16 &= objc_msgSend(v17, "isActive") ^ 1;

      ++v12;
    }
    while (v11 != v12);
  }
  -[TabBar _layoutContainers](self, "_layoutContainers");
  -[TabBar safeAreaInsets](self, "safeAreaInsets");
  v35 = v34;
  v37 = v36;
  scrollView = self->_scrollView;
  -[TabBar _scrollableWidth](self, "_scrollableWidth");
  v40 = v37 + v35 + v39;
  -[TabBar bounds](self, "bounds");
  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v40, CGRectGetHeight(v44));
  -[TabBar _updateReorderRecognizer](self, "_updateReorderRecognizer");

}

- (unint64_t)_effectiveIndexForIndex:(unint64_t)a3 ofItems:(id)a4 currentItems:(id)a5
{
  id v8;
  NSArray *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;

  v8 = a4;
  v9 = (NSArray *)a5;
  v10 = 0;
  v11 = a3;
  while (1)
  {
    if (v11 < objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v9 ? v9 : self->_items;
      v14 = -[NSArray indexOfObject:](v13, "indexOfObject:", v12);

      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        break;
    }
    ++v10;
    --v11;
    if (v10 > a3)
      goto LABEL_10;
  }
  a3 = v14 + v10;
LABEL_10:

  return a3;
}

- (void)_updateReorderRecognizer
{
  -[UIPanGestureRecognizer _setCanPanHorizontally:](self->_reorderRecognizer, "_setCanPanHorizontally:", -[TabBar _isScrollable](self, "_isScrollable") ^ 1);
}

- (void)_layoutContainers
{
  int v3;
  CGFloat MaxX;
  CGFloat Height;
  NSArray *v6;
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
  int *v18;
  void *v19;
  int *v20;
  id v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat MinX;
  CGFloat MidY;
  CGFloat v51;
  double v52;
  CGFloat rect;
  double rect_8;
  double rect_16;
  double rect_16a;
  double rect_24;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = -[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  v61 = 0.0;
  MaxX = 0.0;
  if (v3)
  {
    -[TabBar bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v71);
  }
  -[TabBar bounds](self, "bounds");
  Height = CGRectGetHeight(v72);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v6 = self->_items;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v66;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v66 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        if (objc_msgSend(v11, "isActive"))
        {
          objc_msgSend(v11, "layoutInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "tabBarItemView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "frame");
          MaxX = v14;
          v59 = v16;
          v61 = v15;
          v51 = v17;

          goto LABEL_13;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      if (v8)
        continue;
      break;
    }
  }
  v51 = 0.0;
  v59 = Height;
LABEL_13:
  rect = MaxX;

  if (v3)
    v18 = &OBJC_IVAR___TabBar__leadingContainer;
  else
    v18 = &OBJC_IVAR___TabBar__trailingContainer;
  v19 = *(Class *)((char *)&self->super.super.super.isa + *v18);
  if (v3)
    v20 = &OBJC_IVAR___TabBar__trailingContainer;
  else
    v20 = &OBJC_IVAR___TabBar__leadingContainer;
  v21 = v19;
  v22 = *(id *)((char *)&self->super.super.super.isa + *v20);
  -[TabBar bounds](self, "bounds");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[TabBar bounds](self, "bounds");
  rect_8 = v34;
  rect_16 = v33;
  v35 = v31;
  v36 = v32;
  if (v3)
    v37 = v30;
  else
    v37 = v32;
  if (v3)
    v38 = v26;
  else
    v38 = v31;
  v52 = v31;
  rect_24 = v38;
  v58 = v37;
  v73.origin.x = MaxX;
  v73.size.height = v59;
  v73.origin.y = v61;
  v73.size.width = v51;
  v39 = CGRectGetMinX(v73) - v24;
  v74.origin.x = v24;
  v74.origin.y = v26;
  v74.size.width = v28;
  v74.size.height = v30;
  v40 = fmax(fmin(CGRectGetWidth(v74), v39), 0.0);
  objc_msgSend(v21, "setBounds:", v24, v26, v40, v30);
  v75.origin.x = v24;
  v75.origin.y = v26;
  v75.size.width = v40;
  v75.size.height = v30;
  v41 = CGRectGetMaxX(v75);
  v76.origin.x = v24;
  v76.origin.y = v26;
  v76.size.width = v40;
  v76.size.height = v30;
  objc_msgSend(v21, "setCenter:", v41, CGRectGetMidY(v76));
  v77.origin.x = rect;
  v77.size.height = v59;
  v77.origin.y = v61;
  v77.size.width = v51;
  v42 = CGRectGetMaxX(v77);
  v78.origin.x = rect_16;
  v78.origin.y = v35;
  v78.size.width = rect_8;
  v78.size.height = v36;
  v43 = fmax(fmin(CGRectGetWidth(v78), v42 - rect_16), 0.0);
  v44 = rect_16 + v43;
  v45 = rect_8 - v43;
  if (v3)
    v46 = rect_8 - v43;
  else
    v46 = v40;
  if (v3)
    v47 = rect_16 + v43;
  else
    v47 = v24;
  rect_16a = v47;
  if (v3)
    v48 = v36;
  else
    v48 = v30;
  v60 = v48;
  v62 = v46;
  if (v3)
    v26 = v52;
  else
    v40 = v45;
  if (!v3)
    v24 = v44;
  objc_msgSend(v22, "setBounds:", v44, v52, v45, v36);
  v79.origin.x = v44;
  v79.origin.y = v52;
  v79.size.width = v45;
  v79.size.height = v36;
  MinX = CGRectGetMinX(v79);
  v80.origin.x = v44;
  v80.origin.y = v52;
  v80.size.width = v45;
  v80.size.height = v36;
  MidY = CGRectGetMidY(v80);
  CGAffineTransformMakeTranslation(&v64, MinX, MidY);
  v63 = v64;
  objc_msgSend(v22, "setTransform:", &v63);
  -[UIVisualEffectView setFrame:](self->_leadingVibrancyEffectView, "setFrame:", v24, rect_24, v40, v58);
  -[UIVisualEffectView setFrame:](self->_trailingVibrancyEffectView, "setFrame:", rect_16a, v26, v62, v60);

}

- (void)_layOutPinnedOverflowButton
{
  NSUInteger v3;
  int v4;
  uint64_t v5;
  double MinX;
  double visiblePinnedItemCount;
  double v11;
  double v12;
  unint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  CGRect v17;

  v3 = -[NSIndexSet count](self->_overflowPinnedItemIndexes, "count");
  -[PinnedTabsOverflowButton setHidden:](self->_pinnedOverflowButton, "setHidden:", v3 == 0);
  v4 = -[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  -[TabBar _sf_safeAreaBounds](self, "_sf_safeAreaBounds");
  if (v4)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v5);
    visiblePinnedItemCount = (double)self->_visiblePinnedItemCount;
    v11 = 36.0;
  }
  else
  {
    MinX = CGRectGetMaxX(*(CGRect *)&v5);
    visiblePinnedItemCount = (double)(self->_visiblePinnedItemCount + 1);
    v11 = -36.0;
  }
  v12 = MinX + visiblePinnedItemCount * v11;
  -[TabBar bounds](self, "bounds");
  -[PinnedTabsOverflowButton setFrame:](self->_pinnedOverflowButton, "setFrame:", v12, 0.0, 36.0, CGRectGetHeight(v17));
  v13 = -[TabBar _totalPinnedItemCount](self, "_totalPinnedItemCount");
  if (v13 >= -[NSArray count](self->_items, "count"))
  {
    v15 = 1;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isActive") ^ 1;

  }
  if (v3)
    v16 = v15;
  else
    v16 = 0;
  -[PinnedTabsOverflowButton setShowsTrailingSeparator:](self->_pinnedOverflowButton, "setShowsTrailingSeparator:", v16);
}

- (void)_layoutItem:(id)a3 atIndex:(unint64_t)a4 inRect:(CGRect)a5 itemCount:(unint64_t)a6 beforeActiveItem:(BOOL)a7
{
  _BOOL4 v7;
  double width;
  double y;
  CGFloat x;
  int v13;
  _BOOL4 v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v33;
  uint64_t v34;
  double v35;
  int v36;
  _BOOL4 v37;
  unint64_t v38;
  int v39;
  int *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  double MinX;
  _BOOL4 v59;
  double MaxX;
  _BOOL4 v61;
  int v62;
  _BOOL4 v63;
  _BOOL4 v64;
  double v65;
  double v66;
  double v67;
  double v68;
  id WeakRetained;
  double v70;
  double v72;
  char v73;
  CGFloat v74;
  _BOOL4 rect;
  CGFloat recta;
  unint64_t rect_8;
  double rect_16;
  id rect_24;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v7 = a7;
  rect_16 = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  rect_24 = a3;
  v13 = objc_msgSend(rect_24, "isActive");
  v73 = objc_msgSend(rect_24, "isPlaceholder");
  v14 = -[TabBar _itemAtIndexIsPinned:](self, "_itemAtIndexIsPinned:", a4);
  -[TabBar _scrollableItemArea](self, "_scrollableItemArea");
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  if ((v13 & 1) != 0)
  {
    v23 = 1;
  }
  else
  {
    v93.origin.x = x;
    v93.origin.y = y;
    v93.size.width = width;
    v93.size.height = rect_16;
    v23 = (CGRectIntersectsRect(*(CGRect *)&v15, v93) || v14) && v7;
  }
  v80.origin.x = v19;
  v80.origin.y = v20;
  v80.size.width = v21;
  v80.size.height = v22;
  v94.origin.x = x;
  v94.origin.y = y;
  v94.size.width = width;
  v94.size.height = rect_16;
  rect = v14;
  v24 = CGRectIntersectsRect(v80, v94) || v14;
  rect_8 = a4;
  v25 = !-[NSIndexSet containsIndex:](self->_overflowPinnedItemIndexes, "containsIndex:", a4);
  v26 = v25 & v24;
  v27 = v25 & v24 & (v23 ^ 1u);
  v28 = v23 & v25;
  objc_msgSend(rect_24, "layoutInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  LOBYTE(v31) = self->_newTabVisibleInTabBar;
  if (!self->_newTabVisibleInTabBar && (v23 & v25 | v27) != 0)
    v31 = objc_msgSend(v29, "isVisibleInTabBar") ^ 1;
  self->_newTabVisibleInTabBar = v31;
  objc_msgSend(v30, "setVisibleInTabBar:", v28 | v27);
  objc_msgSend(v30, "setTrailingActiveItem:", v27);
  objc_msgSend(v30, "tabBarItemView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(rect_24, "dragState");
  v35 = 1.0;
  if (v34 == 1)
    v35 = 0.5;
  objc_msgSend(v33, "setAlpha:", v35);
  if ((v13 & 1) != 0)
  {
    -[TabBar addSubview:](self, "addSubview:", v33);
    v36 = 0;
    v37 = 0;
    v38 = rect_8;
  }
  else
  {
    if (v23)
      v39 = v25;
    else
      v39 = v26;
    v38 = rect_8;
    if (v39 == 1)
    {
      v40 = &OBJC_IVAR___TabBar__trailingContainer;
      if (v28)
        v40 = &OBJC_IVAR___TabBar__leadingContainer;
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v40), "addSubview:", v33);
    }
    if ((v73 & 1) != 0)
    {
      v36 = 0;
    }
    else
    {
      if (rect_8)
        v36 = v13 ^ 1;
      else
        v36 = 0;
      if ((v13 & 1) == 0)
      {
        v37 = a6 - 1 != rect_8;
        goto LABEL_28;
      }
    }
    v37 = 0;
  }
LABEL_28:
  -[TabBar _firstVisibleItemAfterIndex:](self, "_firstVisibleItemAfterIndex:", v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  v43 = rect
     && (objc_msgSend(v41, "isPinned") & 1) == 0
     && -[NSIndexSet count](self->_overflowPinnedItemIndexes, "count") != 0;
  if (v36)
  {
    v44 = self->_visiblePinnedItemCount < v38;
    if (!v37)
      goto LABEL_38;
  }
  else
  {
    v44 = 0;
    if (!v37)
    {
LABEL_38:
      v45 = 0;
      goto LABEL_39;
    }
  }
  if (-[NSArray count](self->_items, "count") - 1 <= v38)
    goto LABEL_38;
  v45 = objc_msgSend(v42, "isActive") ^ 1 | v43;
LABEL_39:
  v46 = 0.0;
  if (self->_visiblePinnedItemCount && !rect)
  {
    -[TabBar _scrollableItemArea](self, "_scrollableItemArea");
    v50 = v49;
    v52 = v51;
    recta = x;
    v54 = v53;
    v56 = v55;
    v81.origin.x = recta;
    v57 = y;
    v81.origin.y = y;
    v81.size.width = width;
    v81.size.height = rect_16;
    MinX = CGRectGetMinX(v81);
    v82.origin.x = v50;
    v82.origin.y = v52;
    v82.size.width = v54;
    v82.size.height = v56;
    v59 = MinX > CGRectGetMinX(v82);
    v83.origin.x = recta;
    v83.origin.y = y;
    v83.size.width = width;
    v83.size.height = rect_16;
    MaxX = CGRectGetMaxX(v83);
    v84.origin.x = v50;
    v84.origin.y = v52;
    v84.size.width = v54;
    v84.size.height = v56;
    v61 = MaxX < CGRectGetMaxX(v84);
    v62 = -[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
    if (v62)
      v63 = v59;
    else
      v63 = v61;
    v44 = v44 & v63;
    if (v62)
      v64 = v61;
    else
      v64 = v59;
    v45 = v45 & v64;
    v85.origin.x = recta;
    v85.origin.y = y;
    v85.size.width = width;
    v85.size.height = rect_16;
    v65 = CGRectGetMinX(v85);
    v86.origin.x = v50;
    v86.origin.y = v52;
    v86.size.width = v54;
    v86.size.height = v56;
    v74 = width;
    v66 = CGRectGetMinX(v86);
    v87.origin.x = v50;
    v87.origin.y = v52;
    v87.size.width = v54;
    v87.size.height = v56;
    v47 = fmax(v66, fmin(CGRectGetMaxX(v87), v65));
    v88.size.width = v74;
    v88.origin.x = recta;
    v88.origin.y = y;
    v88.size.height = rect_16;
    v72 = CGRectGetMaxX(v88);
    v89.origin.x = v50;
    v89.origin.y = v52;
    v89.size.width = v54;
    v89.size.height = v56;
    v67 = CGRectGetMinX(v89);
    v90.origin.x = v50;
    v90.origin.y = v52;
    v90.size.width = v54;
    v90.size.height = v56;
    v68 = fmax(v67, fmin(CGRectGetMaxX(v90), v72));
    v91.origin.y = v57;
    width = v74;
    v91.origin.x = recta;
    y = v57;
    v91.size.width = v74;
    v91.size.height = rect_16;
    v46 = 0.0;
    if (v47 > CGRectGetMinX(v91))
    {
      v92.origin.x = recta;
      v92.origin.y = v57;
      v92.size.width = v74;
      v92.size.height = rect_16;
      v46 = CGRectGetMinX(v92) - v47;
    }
    v48 = v68 - v47;
  }
  else
  {
    v47 = x;
    v48 = width;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v30, "setCanClose:", objc_msgSend(WeakRetained, "tabCollectionView:canCloseItem:", self, rect_24));

  objc_msgSend(v30, "setLeadingEdgeVisible:", v44);
  objc_msgSend(v30, "setTrailingEdgeVisible:", v45);
  if (-[TabBar _itemAtIndexIsPinned:](self, "_itemAtIndexIsPinned:", rect_8))
    v70 = 36.0;
  else
    v70 = fmax(width, self->_minimumTabWidth);
  objc_msgSend(v30, "setTitleLayoutWidth:", v70);
  objc_msgSend(v30, "setContentOffset:", v46);
  objc_msgSend(v30, "setFrame:", v47, y, v48, rect_16);

}

- (BOOL)_itemAtIndexIsPinned:(unint64_t)a3
{
  return -[TabBar _totalPinnedItemCount](self, "_totalPinnedItemCount") > a3;
}

- (CGRect)_scrollableItemArea
{
  double v3;
  double v4;
  double v5;
  double v6;
  int v7;
  double v8;
  double v9;
  double v10;
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
  CGRect result;

  if (self->_visiblePinnedItemCount)
  {
    v3 = *MEMORY[0x1E0DC49E8];
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v7 = -[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
    -[TabBar safeAreaInsets](self, "safeAreaInsets");
    v9 = v8;
    v11 = v10;
    -[TabBar _pinnedItemsWidth](self, "_pinnedItemsWidth");
    v13 = v9 + v12;
    v14 = v11 + v12;
    if (v7)
      v15 = v6;
    else
      v15 = v14;
    if (v7)
      v16 = v13;
    else
      v16 = v4;
    -[TabBar bounds](self, "bounds");
    v18 = v16 + v17;
    v20 = v3 + v19;
    v22 = v21 - (v15 + v16);
    v24 = v23 - (v3 + v5);
  }
  else
  {
    -[TabBar bounds](self, "bounds");
  }
  result.size.height = v24;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = v18;
  return result;
}

- (CGRect)_frameForItemAtIndex:(unint64_t)a3
{
  _BOOL8 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v5 = -[TabBar _itemAtIndexIsPinned:](self, "_itemAtIndexIsPinned:");
  if (-[NSIndexSet containsIndex:](self->_overflowPinnedItemIndexes, "containsIndex:", a3))
    a3 = -[TabBar _lastVisiblePinnedItemIndex](self, "_lastVisiblePinnedItemIndex");
  -[TabBar _horizontalPositionForItemAtIndex:withSlowingFactor:pinned:](self, "_horizontalPositionForItemAtIndex:withSlowingFactor:pinned:", a3, v5, 64.0);
  v7 = v6;
  -[TabBar _horizontalPositionForItemAtIndex:withSlowingFactor:pinned:](self, "_horizontalPositionForItemAtIndex:withSlowingFactor:pinned:", a3 + 1, v5, 64.0);
  v9 = v8;
  -[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  -[TabBar bounds](self, "bounds", v7 - v9, v9 - v7);
  _SFRoundRectToPixels();
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)_firstVisibleItemAfterIndex:(unint64_t)a3
{
  void *v5;

  while (++a3 < -[NSArray count](self->_items, "count"))
  {
    if (!-[NSIndexSet containsIndex:](self->_overflowPinnedItemIndexes, "containsIndex:", a3))
    {
      -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
  }
  v5 = 0;
  return v5;
}

- (double)_horizontalPositionForItemAtIndex:(unint64_t)a3 withSlowingFactor:(double)a4
{
  double result;

  -[TabBar _horizontalPositionForItemAtIndex:withSlowingFactor:pinned:](self, "_horizontalPositionForItemAtIndex:withSlowingFactor:pinned:", a3, self->_visiblePinnedItemCount > a3, a4);
  return result;
}

- (double)_horizontalPositionForItemAtIndex:(unint64_t)a3
{
  double result;

  -[TabBar _horizontalPositionForItemAtIndex:withSlowingFactor:](self, "_horizontalPositionForItemAtIndex:withSlowingFactor:", a3, 64.0);
  return result;
}

uint64_t __28__TabBar_setItems_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void)setTintStyle:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_tintStyle != a3
    || (-[UIVisualEffectView effect](self->_leadingVibrancyEffectView, "effect"),
        (v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v6 = (void *)v5,
        -[UIVisualEffectView effect](self->_trailingVibrancyEffectView, "effect"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    self->_tintStyle = a3;
    -[TabBar _setOverrideUserInterfaceStyle:](self, "_setOverrideUserInterfaceStyle:", 2 * (a3 == 4));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = self->_items;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12), "layoutInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "updateTabBarStyle");

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v10);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = self->_tabBarItemViewReuseStack;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "updateTabBarStyle", (_QWORD)v19);
        }
        while (v16 != v18);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }

    -[PinnedTabsOverflowButton setTintStyle:](self->_pinnedOverflowButton, "setTintStyle:", a3);
    -[TabBar _updateBackground](self, "_updateBackground");
    -[TabBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (TabBar)initWithFrame:(CGRect)a3
{
  TabBar *v3;
  NSMutableArray *v4;
  NSMutableArray *tabBarItemViewReuseStack;
  void *v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *leadingContainer;
  UIView *v11;
  UIView *trailingContainer;
  void *v13;
  void *v14;
  unsigned int v15;
  UIVisualEffectView *v16;
  UIVisualEffectView *leadingVibrancyEffectView;
  void *v18;
  void *v19;
  UIVisualEffectView *v20;
  UIVisualEffectView *trailingVibrancyEffectView;
  void *v22;
  void *v23;
  UIScrollView *v24;
  UIScrollView *scrollView;
  void *v26;
  UIView *v27;
  UIView *dragPreviewContainer;
  uint64_t v29;
  UITapGestureRecognizer *tapRecognizer;
  void *v31;
  int IsPad;
  double v33;
  uint64_t v34;
  UIPanGestureRecognizer *reorderRecognizer;
  uint64_t v36;
  UIHoverGestureRecognizer *hoverRecognizer;
  SFTabHoverPreviewController *v38;
  SFTabHoverPreviewController *tabHoverPreviewController;
  uint64_t v40;
  NSIndexSet *overflowPinnedItemIndexes;
  PinnedTabsOverflowButton *v42;
  PinnedTabsOverflowButton *pinnedOverflowButton;
  void *v44;
  void *v45;
  TabBar *v46;
  _QWORD v48[4];
  id v49;
  id location;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)TabBar;
  v3 = -[TabBar initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tabBarItemViewReuseStack = v3->_tabBarItemViewReuseStack;
    v3->_tabBarItemViewReuseStack = v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__didReceiveMemoryWarning_, *MEMORY[0x1E0DC4778], 0);

    -[TabBar setMultipleTouchEnabled:](v3, "setMultipleTouchEnabled:", 0);
    -[TabBar setExclusiveTouch:](v3, "setExclusiveTouch:", 1);
    -[TabBar layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnchorPoint:", 0.5, 0.0);

    -[TabBar layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    leadingContainer = v3->_leadingContainer;
    v3->_leadingContainer = v9;

    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    trailingContainer = v3->_trailingContainer;
    v3->_trailingContainer = v11;

    -[UIView setClipsToBounds:](v3->_leadingContainer, "setClipsToBounds:", 1);
    -[UIView setClipsToBounds:](v3->_trailingContainer, "setClipsToBounds:", 1);
    -[TabBar addSubview:](v3, "addSubview:", v3->_leadingContainer);
    -[TabBar addSubview:](v3, "addSubview:", v3->_trailingContainer);
    -[UIView layer](v3->_leadingContainer, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v3->_trailingContainer, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsGroupOpacity:", 0);
    objc_msgSend(v14, "setAllowsGroupOpacity:", 0);
    objc_msgSend(v13, "setAllowsGroupBlending:", 0);
    objc_msgSend(v14, "setAllowsGroupBlending:", 0);
    objc_msgSend(v13, "setAllowsEdgeAntialiasing:", 0);
    objc_msgSend(v14, "setAllowsEdgeAntialiasing:", 0);
    v15 = -[TabBar _sf_usesLeftToRightLayout](v3, "_sf_usesLeftToRightLayout");
    objc_msgSend(v13, "setAnchorPoint:", (double)v15, 0.5);
    objc_msgSend(v14, "setAnchorPoint:", (double)(v15 ^ 1), 0.5);
    v3->_tintStyle = 1;
    v16 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    leadingVibrancyEffectView = v3->_leadingVibrancyEffectView;
    v3->_leadingVibrancyEffectView = v16;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v3->_leadingVibrancyEffectView, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v18);

    -[UIVisualEffectView _setOverrideUserInterfaceStyle:](v3->_leadingVibrancyEffectView, "_setOverrideUserInterfaceStyle:", 1);
    v20 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    trailingVibrancyEffectView = v3->_trailingVibrancyEffectView;
    v3->_trailingVibrancyEffectView = v20;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v3->_trailingVibrancyEffectView, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v22);

    -[UIVisualEffectView _setOverrideUserInterfaceStyle:](v3->_trailingVibrancyEffectView, "_setOverrideUserInterfaceStyle:", 1);
    -[UIView addSubview:](v3->_leadingContainer, "addSubview:", v3->_leadingVibrancyEffectView);
    -[UIView addSubview:](v3->_trailingContainer, "addSubview:", v3->_trailingVibrancyEffectView);
    -[TabBar _updateBackground](v3, "_updateBackground");
    v24 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    scrollView = v3->_scrollView;
    v3->_scrollView = v24;

    -[UIScrollView setDelegate:](v3->_scrollView, "setDelegate:", v3);
    -[UIScrollView setUserInteractionEnabled:](v3->_scrollView, "setUserInteractionEnabled:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v3->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setContentInsetAdjustmentBehavior:](v3->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
    -[UIScrollView setTracksImmediatelyWhileDecelerating:](v3->_scrollView, "setTracksImmediatelyWhileDecelerating:", 0);
    -[TabBar addSubview:](v3, "addSubview:", v3->_scrollView);
    -[UIScrollView panGestureRecognizer](v3->_scrollView, "panGestureRecognizer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_setCanPanVertically:", 0);
    -[TabBar addGestureRecognizer:](v3, "addGestureRecognizer:", v26);
    -[UIScrollView _setAutoScrollTouchInsets:](v3->_scrollView, "_setAutoScrollTouchInsets:", 0.0, -128.0, 0.0, -128.0);
    v27 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    dragPreviewContainer = v3->_dragPreviewContainer;
    v3->_dragPreviewContainer = v27;

    -[UIView setHidden:](v3->_dragPreviewContainer, "setHidden:", 1);
    -[TabBar addSubview:](v3, "addSubview:", v3->_dragPreviewContainer);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel__tap_);
    tapRecognizer = v3->_tapRecognizer;
    v3->_tapRecognizer = (UITapGestureRecognizer *)v29;

    -[UITapGestureRecognizer setEnabled:](v3->_tapRecognizer, "setEnabled:", 1);
    -[TabBar addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tapRecognizer);
    +[TabCollectionViewSpringLoadingBehavior addSpringLoadedInteractionToTabView:](TabCollectionViewSpringLoadingBehavior, "addSpringLoadedInteractionToTabView:", v3);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabBar setItems:](v3, "setItems:", v31);

    -[TabBar setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("tabBar"));
    IsPad = _SFDeviceIsPad();
    v33 = 119.0;
    if (IsPad)
      v33 = 132.0;
    v3->_minimumTabWidth = v33;
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v3, sel__reorder_);
    reorderRecognizer = v3->_reorderRecognizer;
    v3->_reorderRecognizer = (UIPanGestureRecognizer *)v34;

    -[UIPanGestureRecognizer setDelegate:](v3->_reorderRecognizer, "setDelegate:", v3);
    -[TabBar addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_reorderRecognizer);
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v3, sel__hover_);
    hoverRecognizer = v3->_hoverRecognizer;
    v3->_hoverRecognizer = (UIHoverGestureRecognizer *)v36;

    -[TabBar addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_hoverRecognizer);
    v38 = (SFTabHoverPreviewController *)objc_alloc_init(MEMORY[0x1E0D4EDA8]);
    tabHoverPreviewController = v3->_tabHoverPreviewController;
    v3->_tabHoverPreviewController = v38;

    -[SFTabHoverPreviewController setHoverRecognizer:](v3->_tabHoverPreviewController, "setHoverRecognizer:", v3->_hoverRecognizer);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v40 = objc_claimAutoreleasedReturnValue();
    overflowPinnedItemIndexes = v3->_overflowPinnedItemIndexes;
    v3->_overflowPinnedItemIndexes = (NSIndexSet *)v40;

    v42 = objc_alloc_init(PinnedTabsOverflowButton);
    pinnedOverflowButton = v3->_pinnedOverflowButton;
    v3->_pinnedOverflowButton = v42;

    -[PinnedTabsOverflowButton setTintStyle:](v3->_pinnedOverflowButton, "setTintStyle:", v3->_tintStyle);
    objc_initWeak(&location, v3);
    v44 = (void *)MEMORY[0x1E0DC39D0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __24__TabBar_initWithFrame___block_invoke;
    v48[3] = &unk_1E9CF7008;
    objc_copyWeak(&v49, &location);
    objc_msgSend(v44, "safari_menuWithUncachedChildrenProvider:", v48);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PinnedTabsOverflowButton setMenu:](v3->_pinnedOverflowButton, "setMenu:", v45);

    -[TabBar addSubview:](v3, "addSubview:", v3->_pinnedOverflowButton);
    v46 = v3;
    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);

  }
  return v3;
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSArray *v26;
  id v27;
  void *v28;
  NSArray *v29;
  NSArray *items;
  void *v31;
  NSArray *v32;
  id v33;
  id v34;
  void *v35;
  _BOOL4 v36;
  NSArray *v37;
  _QWORD v38[5];
  NSArray *v39;
  id v40;
  id v41;
  uint64_t v42;
  _QWORD v43[5];
  NSArray *v44;
  id v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v4 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  v6 = (NSArray *)a3;
  v7 = v6;
  if (self->_items != v6 && !-[NSArray isEqualToArray:](v6, "isEqualToArray:"))
  {
    v36 = v4;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v37 = v7;
    v8 = v7;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v54 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "layoutInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setRemovedFromTabBar:", 0);

        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v15 = self->_items;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v50 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          if ((objc_msgSend(v14, "containsObject:", v20) & 1) == 0)
          {
            objc_msgSend(v20, "layoutInfo");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setRemovedFromTabBar:", 1);

            objc_msgSend(v20, "setTabBar:", 0);
          }
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v17);
    }

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", self->_items);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __28__TabBar_setItems_animated___block_invoke;
    v47[3] = &unk_1E9CF7030;
    v24 = v22;
    v48 = v24;
    v25 = -[NSArray indexOfObjectWithOptions:passingTest:](v8, "indexOfObjectWithOptions:passingTest:", 2, v47);
    v43[0] = v23;
    v43[1] = 3221225472;
    v43[2] = __28__TabBar_setItems_animated___block_invoke_2;
    v43[3] = &unk_1E9CF7058;
    v43[4] = self;
    v26 = v8;
    v44 = v26;
    v27 = v24;
    v45 = v27;
    v46 = v25;
    -[NSArray indexesOfObjectsPassingTest:](v26, "indexesOfObjectsPassingTest:", v43);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
      -[TabBar _layoutIndexes:ofItems:currentItems:](self, "_layoutIndexes:ofItems:currentItems:", v28, v26, v27);
    v29 = (NSArray *)-[NSArray copy](v26, "copy");
    items = self->_items;
    self->_items = v29;

    -[TabBar _updatePinnedItemCount](self, "_updatePinnedItemCount");
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", self->_items);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v23;
    v38[1] = 3221225472;
    v38[2] = __28__TabBar_setItems_animated___block_invoke_3;
    v38[3] = &unk_1E9CF7080;
    v38[4] = self;
    v32 = v26;
    v39 = v32;
    v33 = v31;
    v41 = v27;
    v42 = v25;
    v40 = v33;
    v34 = v27;
    -[NSArray indexesOfObjectsPassingTest:](v32, "indexesOfObjectsPassingTest:", v38);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v37;
    if (v36)
      -[TabBar _layoutIndexes:ofItems:currentItems:](self, "_layoutIndexes:ofItems:currentItems:", v35, v32, v33);
    -[TabBar setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)updatePinnedItems
{
  unint64_t visiblePinnedItemCount;
  NSUInteger v4;
  NSUInteger v5;
  _QWORD v6[5];

  visiblePinnedItemCount = self->_visiblePinnedItemCount;
  v4 = -[NSIndexSet count](self->_overflowPinnedItemIndexes, "count");
  -[TabBar _updatePinnedItemCount](self, "_updatePinnedItemCount");
  v5 = -[NSIndexSet count](self->_overflowPinnedItemIndexes, "count");
  if (v4 != v5 || visiblePinnedItemCount != self->_visiblePinnedItemCount)
  {
    -[TabBar setNeedsLayout](self, "setNeedsLayout");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27__TabBar_updatePinnedItems__block_invoke;
    v6[3] = &unk_1E9CF1900;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "sf_animate:usingDefaultMotionWithOptions:animations:completion:", (v5 | v4) == 0, 2, v6, 0);
  }
}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

- (void)setItems:(id)a3
{
  -[TabBar setItems:animated:](self, "setItems:animated:", a3, 0);
}

- (void)_updateBackground
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3F08], "_sf_effectWithStyle:forBarTintStyle:", 2, self->_tintStyle);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](self->_leadingVibrancyEffectView, "setEffect:", v3);
  -[UIVisualEffectView setEffect:](self->_trailingVibrancyEffectView, "setEffect:", v3);

}

void __32__TabBar_scrollToItem_animated___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5), "setActiveAnimationCount:", objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5), "activeAnimationCount", (_QWORD)v6) - 1);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)_requestReusableTabBarItemView
{
  void *v3;
  TabBarItemView *v4;
  TabBarItemView *v5;

  -[NSMutableArray lastObject](self->_tabBarItemViewReuseStack, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableArray removeLastObject](self->_tabBarItemViewReuseStack, "removeLastObject");
    objc_msgSend(v3, "setHidden:", 0);
    v4 = v3;
  }
  else
  {
    v4 = -[TabBarItemView initWithTabBar:]([TabBarItemView alloc], "initWithTabBar:", self);
  }
  v5 = v4;

  return v5;
}

- (void)addInteraction:(id)a3
{
  id v5;
  objc_super v6;

  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TabBar;
  -[TabBar addInteraction:](&v6, sel_addInteraction_, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_dragInteraction, a3);

}

- (SFTabHoverPreviewController)tabHoverPreviewController
{
  return self->_tabHoverPreviewController;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

uint64_t __28__TabBar_setItems_animated___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "_effectiveIndexForIndex:ofItems:currentItems:", a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)) <= *(_QWORD *)(a1 + 64))v6 = objc_msgSend(*(id *)(a1 + 56), "containsObject:", v5) ^ 1;
  else
    v6 = 0;

  return v6;
}

uint64_t __28__TabBar_setItems_animated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "_effectiveIndexForIndex:ofItems:currentItems:", a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)) <= *(_QWORD *)(a1 + 56))v6 = 0;
  else
    v6 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", v5) ^ 1;

  return v6;
}

id __24__TabBar_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_overflowPinnedItemsMenuElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UIScrollView *v8;
  UIScrollView *v9;
  objc_super v11;
  CGPoint v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (objc_msgSend(v7, "type") == 9
    && (-[TabBar bounds](self, "bounds"), v13.size.height = 70.0, v12.x = x, v12.y = y, CGRectContainsPoint(v13, v12)))
  {
    v8 = self->_scrollView;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TabBar;
    -[TabBar hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
    v8 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (void)_itemDidPressCloseButton:(id)a3
{
  SFTabHoverPreviewController *tabHoverPreviewController;
  id v5;
  id WeakRetained;
  id v7;

  tabHoverPreviewController = self->_tabHoverPreviewController;
  v5 = a3;
  -[SFTabHoverPreviewController dismiss](tabHoverPreviewController, "dismiss");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabCollectionView:closeItem:", self, v5);

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didCloseTabWithTrigger:tabCollectionViewType:", 0, 1);

}

- (void)_toggleMediaStateMutedForItem:(id)a3
{
  TabBarDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "tabBar:toggleMediaStateMutedForItem:", self, v5);

}

- (CGRect)frameForItem:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  objc_msgSend(a3, "layoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)viewForItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "layoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabBarItemView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)targetItemForDropAtPoint:(CGPoint)a3
{
  double x;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;

  x = a3.x;
  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_items;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v27;
    v10 = 1.79769313e308;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "layoutInfo", (_QWORD)v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "hasViews"))
        {
          objc_msgSend(v13, "frame");
          v14 = v32.origin.x;
          y = v32.origin.y;
          width = v32.size.width;
          height = v32.size.height;
          v18 = CGRectGetWidth(v32);
          -[TabBar _itemWidth](self, "_itemWidth");
          _SFRoundFloatToPixels();
          v20 = v19;
          _SFOnePixel();
          if (v18 >= v20 - v21 || objc_msgSend(v12, "isPinned"))
          {
            v33.origin.x = v14;
            v33.origin.y = y;
            v33.size.width = width;
            v33.size.height = height;
            v22 = x - CGRectGetMidX(v33);
            if (v22 >= 0.0)
              v23 = v22;
            else
              v23 = -v22;
            if (v23 < v10)
            {
              v24 = v12;

              v8 = v24;
              v10 = v23;
            }
          }
        }

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)itemDragContentType
{
  return 3;
}

- (unsigned)_edgeToAlignWithPreviewForItem:(id)a3
{
  int64_t v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = -[NSArray indexOfObjectIdenticalTo:](self->_items, "indexOfObjectIdenticalTo:", a3);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_items;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = -1;
    while (2)
    {
      v10 = 0;
      v11 = v9 + v7;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "isActive", (_QWORD)v16) & 1) != 0)
        {
          v11 = v9 + v10 + 1;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v9 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = -1;
  }
LABEL_12:

  v12 = -[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  if (v12)
    v13 = 0;
  else
    v13 = 2;
  if (v12)
    v14 = 2;
  else
    v14 = 0;
  if (v4 <= v11)
    return v13;
  else
    return v14;
}

- (id)targetedDragPreviewForLiftingItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double x;
  double y;
  double height;
  double Width;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  unsigned int v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  CGRect v40;
  CGRect v41;

  v4 = a3;
  -[TabBar viewForItem:](self, "viewForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "layoutInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewForDragPreview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "frame");
    x = v40.origin.x;
    y = v40.origin.y;
    height = v40.size.height;
    Width = CGRectGetWidth(v40);
    if ((objc_msgSend(v6, "isPinned") & 1) != 0)
      v13 = 36.0;
    else
      -[TabBar itemWidth](self, "itemWidth");
    objc_msgSend(v8, "setFrame:", x, y, fmax(Width, v13), height);
    objc_msgSend(v5, "center");
    v16 = v15;
    objc_msgSend(v5, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v8, "frame");
    v25 = CGRectGetWidth(v41);
    v26 = -[TabBar _edgeToAlignWithPreviewForItem:](self, "_edgeToAlignWithPreviewForItem:", v6);
    v27 = v25 * 0.5;
    v28 = v18;
    v29 = v20;
    v30 = v22;
    v31 = v24;
    if (v26)
      v32 = CGRectGetMaxX(*(CGRect *)&v28) - v27;
    else
      v32 = v27 + CGRectGetMinX(*(CGRect *)&v28);
    v33 = objc_alloc_init(MEMORY[0x1E0DC3768]);
    if (_SFIsDarkTintStyle())
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setBackgroundColor:", v34);

    }
    v35 = objc_alloc(MEMORY[0x1E0DC3D88]);
    v36 = objc_alloc(MEMORY[0x1E0DC3770]);
    objc_msgSend(v5, "superview");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v36, "initWithContainer:center:", v37, v32, v16);
    v14 = (void *)objc_msgSend(v35, "initWithView:parameters:target:", v8, v33, v38);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)supportsDropTransitionToItemView
{
  return 1;
}

- (unint64_t)contextMenuOptionsForItem:(id)a3
{
  return 4146;
}

- (BOOL)shouldPinItemsDroppedAtPoint:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  int v7;
  uint64_t v8;

  x = a3.x;
  -[TabBar _pinnedItemsWidth](self, "_pinnedItemsWidth", a3.x, a3.y);
  v6 = v5 + self->_minimumTabWidth * 0.33;
  v7 = -[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  -[TabBar _sf_safeAreaBounds](self, "_sf_safeAreaBounds");
  if (v7)
    return x < v6 + CGRectGetMinX(*(CGRect *)&v8);
  else
    return x > CGRectGetMaxX(*(CGRect *)&v8) - v6;
}

- (id)dragPreviewForItem:(id)a3 pinned:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  CGRect v20;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "setTabBar:", self);
  objc_msgSend(v6, "layoutInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tabBarItemPreviewView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPinned:", v4);
  if (v4 && !self->_allowsScrollingPinnedItems)
  {
    v10 = 36.0;
  }
  else
  {
    -[TabBar itemWidth](self, "itemWidth");
    v10 = v9;
  }
  -[TabBar bounds](self, "bounds");
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v10, CGRectGetHeight(v20));
  objc_msgSend(v8, "setTitleLayoutWidth:", v10);
  if (v4)
  {
    objc_msgSend(v8, "closeButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 0);

  }
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __36__TabBar_dragPreviewForItem_pinned___block_invoke;
  v18[3] = &unk_1E9CF1900;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v12, "performWithoutAnimation:", v18);
  -[UIView addSubview:](self->_dragPreviewContainer, "addSubview:", v13);
  v14 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  if (_SFIsDarkTintStyle())
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3760]), "initWithView:parameters:", v13, v14);

  return v16;
}

uint64_t __36__TabBar_dragPreviewForItem_pinned___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureForDragPreview");
}

- (void)cleanUpDragPreviewForItem:(id)a3
{
  void *v4;
  TabBar *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "layoutInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearPreviewView");

  if (!-[NSArray containsObject:](self->_items, "containsObject:", v6))
  {
    objc_msgSend(v6, "tabBar");
    v5 = (TabBar *)objc_claimAutoreleasedReturnValue();

    if (v5 == self)
      objc_msgSend(v6, "setTabBar:", 0);
  }

}

- (void)_scrollTowardItem:(id)a3 byAmount:(double)a4
{
  unint64_t v6;
  int v7;
  double v8;
  double v9;
  double v10;
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
  _QWORD v23[5];
  _QWORD v24[5];

  v6 = -[NSArray indexOfObject:](self->_items, "indexOfObject:", a3);
  if (v6 < -[NSArray count](self->_items, "count"))
  {
    v7 = -[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
    if (v7)
      -[TabBar _totalPinnedItemCount](self, "_totalPinnedItemCount");
    -[TabBar _sf_safeAreaBounds](self, "_sf_safeAreaBounds");
    v9 = v8;
    -[TabBar _itemWidth](self, "_itemWidth");
    _SFRoundFloatToPixels();
    v11 = v10;
    if (v7)
    {
      -[TabBar _pinnedItemsWidth](self, "_pinnedItemsWidth");
      v11 = v11 + v12;
    }
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    v14 = v13 + v9 * 0.5;
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    v16 = v15;
    v18 = v17 + v9 * a4;
    v19 = v17 - v9 * a4;
    if (v11 <= v14)
      v20 = v19;
    else
      v20 = v18;
    -[TabBar _scrollableWidth](self, "_scrollableWidth");
    v22 = fmax(fmin(v20, v21 - v9), 0.0);
    -[TabBar layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v22, v16);
    -[UIHoverGestureRecognizer setEnabled:](self->_hoverRecognizer, "setEnabled:", 0);
    v23[4] = self;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __37__TabBar__scrollTowardItem_byAmount___block_invoke;
    v24[3] = &unk_1E9CF1900;
    v24[4] = self;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __37__TabBar__scrollTowardItem_byAmount___block_invoke_2;
    v23[3] = &unk_1E9CF16A0;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v24, v23);
  }
}

uint64_t __37__TabBar__scrollTowardItem_byAmount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
}

uint64_t __37__TabBar__scrollTowardItem_byAmount___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didCompleteScrolling");
}

- (CGRect)_initialFrameForItemAtIndex:(unint64_t)a3
{
  NSUInteger v5;
  double Width;
  unint64_t v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  v5 = -[NSArray count](self->_items, "count") - 1;
  -[TabBar _sf_safeAreaBounds](self, "_sf_safeAreaBounds");
  Width = CGRectGetWidth(v14);
  if (v5 <= 1)
    v7 = 1;
  else
    v7 = v5;
  v8 = fmax(self->_minimumTabWidth, Width / (double)v7);
  v9 = -[TabBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  if (v8 * (double)v5 <= Width)
  {
    -[TabBar _sf_safeAreaBounds](self, "_sf_safeAreaBounds");
    CGRectGetMinX(v15);
  }
  else
  {
    -[TabBar _horizontalPositionForItemAtIndex:](self, "_horizontalPositionForItemAtIndex:", (v9 ^ 1u) + a3);
  }
  -[TabBar bounds](self, "bounds");
  _SFRoundRectToPixels();
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)setHidesTitles:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_hidesTitles != a3)
  {
    v3 = a3;
    self->_hidesTitles = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = self->_items;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "layoutInfo", (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setHidesTitleText:", v3);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (id)_itemAtLocation:(CGPoint)a3
{
  double x;
  NSArray *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect v21;
  CGRect v22;

  x = a3.x;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_items;
  v5 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "layoutInfo", (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "hasViews"))
        {
          objc_msgSend(v9, "frame");
          v10 = v21.origin.x;
          y = v21.origin.y;
          width = v21.size.width;
          height = v21.size.height;
          if (CGRectGetMinX(v21) <= x)
          {
            v22.origin.x = v10;
            v22.origin.y = y;
            v22.size.width = width;
            v22.size.height = height;
            if (x < CGRectGetMaxX(v22))
            {
              v5 = v8;

              goto LABEL_13;
            }
          }
        }

      }
      v5 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

- (void)_activateItemIfNeeded:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  id WeakRetained;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    v6 = objc_msgSend(v4, "isActive");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = objc_msgSend(v9, "isPlaceholder");
      v5 = v9;
      if ((v7 & 1) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "tabCollectionView:didSelectItem:", self, v9);

        v5 = v9;
      }
    }
  }

}

- (id)_itemForTouch:(id)a3
{
  objc_msgSend(a3, "locationInView:", self);
  return -[TabBar _itemAtLocation:](self, "_itemAtLocation:");
}

- (void)_tap:(id)a3
{
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  char v10;
  id v11;

  objc_msgSend(a3, "locationInView:", self);
  -[TabBar _itemAtLocation:](self, "_itemAtLocation:");
  v4 = objc_claimAutoreleasedReturnValue();
  v11 = (id)v4;
  if (!v4)
    goto LABEL_7;
  v5 = -[TabBar _isScrollable](self, "_isScrollable");
  v4 = (uint64_t)v11;
  if (!v5)
    goto LABEL_7;
  objc_msgSend(v11, "layoutInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  -[TabBar _itemWidth](self, "_itemWidth");
  if (v8 >= v9 * 0.8)
  {

    v4 = (uint64_t)v11;
    goto LABEL_7;
  }
  v10 = objc_msgSend(v11, "isPinned");

  v4 = (uint64_t)v11;
  if ((v10 & 1) != 0)
  {
LABEL_7:
    -[TabBar _activateItemIfNeeded:](self, "_activateItemIfNeeded:", v4);
    goto LABEL_8;
  }
  -[TabBar _scrollTowardItem:byAmount:](self, "_scrollTowardItem:byAmount:", v11, 0.25);
LABEL_8:

}

- (void)_reorder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)(objc_msgSend(v4, "state") - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    -[UIPanGestureRecognizer translationInView:](self->_reorderRecognizer, "translationInView:", self);
    if (v6 != *MEMORY[0x1E0C9D538] || v5 != *(double *)(MEMORY[0x1E0C9D538] + 8))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v4, "_activeEvents", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (!objc_msgSend(v13, "type"))
            {
              objc_msgSend(v4, "_activeTouchesForEvent:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "anyObject");
              v15 = objc_claimAutoreleasedReturnValue();

              if (v15)
              {

                -[UIDragInteraction _immediatelyBeginDragWithTouch:completion:](self->_dragInteraction, "_immediatelyBeginDragWithTouch:completion:", v15, 0);
                v8 = (void *)v15;
                goto LABEL_17;
              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_17:

      objc_msgSend(v4, "setEnabled:", 0);
      objc_msgSend(v4, "setEnabled:", 1);
    }
  }

}

- (void)_hover:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "state");

  if ((unint64_t)(v9 - 1) > 1)
  {
    -[SFTabHoverPreviewController updateWithItem:atLocation:](self->_tabHoverPreviewController, "updateWithItem:atLocation:", 0, v6, v8);
  }
  else
  {
    -[TabBar _itemAtLocation:](self, "_itemAtLocation:", v6, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[SFTabHoverPreviewController updateWithItem:atLocation:](self->_tabHoverPreviewController, "updateWithItem:atLocation:", v10, v6, v8);

  }
}

- (unint64_t)indexOfCenterItem
{
  double MidX;
  NSObject *v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MinX;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  -[TabBar bounds](self, "bounds");
  MidX = CGRectGetMidX(v21);
  if (MidX == 0.0)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[TabBar indexOfCenterItem].cold.1(v4);
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v6 = MidX;
  if (!-[NSArray count](self->_items, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = 0;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v22.origin.x = v11;
    v22.origin.y = v13;
    v22.size.width = v15;
    v22.size.height = v17;
    MinX = CGRectGetMinX(v22);
    v23.origin.x = v11;
    v23.origin.y = v13;
    v23.size.width = v15;
    v23.size.height = v17;
    if (v6 <= CGRectGetMaxX(v23) && MinX < v6)
      v5 = v7;

    ++v7;
  }
  while (v7 < -[NSArray count](self->_items, "count"));
  return v5;
}

- (unint64_t)maxNumberOfVisibleTabs
{
  CGRect v4;

  -[TabBar bounds](self, "bounds");
  return (unint64_t)(ceil(CGRectGetWidth(v4) / self->_minimumTabWidth) + 6.0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TabBar;
  -[TabBar dealloc](&v4, sel_dealloc);
}

- (void)_didReceiveMemoryWarning:(id)a3
{
  -[NSMutableArray removeAllObjects](self->_tabBarItemViewReuseStack, "removeAllObjects", a3);
}

uint64_t __27__TabBar_updatePinnedItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __32__TabBar__updatePinnedItemCount__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActive");
}

- (unint64_t)_lastVisiblePinnedItemIndex
{
  unint64_t v3;
  unint64_t v4;

  if (!-[TabBar _totalPinnedItemCount](self, "_totalPinnedItemCount"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (!-[NSIndexSet containsIndex:](self->_overflowPinnedItemIndexes, "containsIndex:", v3))
      v4 = v3;
    ++v3;
  }
  while (v3 < -[TabBar _totalPinnedItemCount](self, "_totalPinnedItemCount"));
  return v4;
}

- (id)_overflowPinnedItemsMenuElements
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[NSArray objectsAtIndexes:](self->_items, "objectsAtIndexes:", self->_overflowPinnedItemIndexes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__TabBar__overflowPinnedItemsMenuElements__block_invoke;
  v6[3] = &unk_1E9CF7130;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

id __42__TabBar__overflowPinnedItemsMenuElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__TabBar__overflowPinnedItemsMenuElements__block_invoke_2;
  v6[3] = &unk_1E9CF7108;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  objc_msgSend(v3, "menuElementRepresentationWithSelectionHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  return v4;
}

void __42__TabBar__overflowPinnedItemsMenuElements__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_activateItemIfNeeded:", v3);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v4;
  BOOL v5;

  -[TabBar _itemForTouch:](self, "_itemForTouch:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  double v6;
  char v7;
  void *v8;
  id WeakRetained;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  if (self->_reorderRecognizer == v4
    && (-[UIPanGestureRecognizer translationInView:](v4, "translationInView:", self), v6 < 0.0))
  {
    v7 = 0;
  }
  else
  {
    -[UIPanGestureRecognizer locationInView:](v5, "locationInView:", self);
    -[TabBar _itemAtLocation:](self, "_itemAtLocation:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = objc_msgSend(WeakRetained, "tabBar:canMoveItem:", self, v8);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[UIHoverGestureRecognizer setEnabled:](self->_hoverRecognizer, "setEnabled:", 0);
  -[SFTabHoverPreviewController cancel](self->_tabHoverPreviewController, "cancel");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[TabBar _didCompleteScrolling](self, "_didCompleteScrolling", a3);
}

- (void)_didCompleteScrolling
{
  -[UIHoverGestureRecognizer setEnabled:](self->_hoverRecognizer, "setEnabled:", 1);
  if (self->_newTabVisibleInTabBar)
  {
    -[SFTabHoverPreviewController setNeedsSnapshotUpdate](self->_tabHoverPreviewController, "setNeedsSnapshotUpdate");
    self->_newTabVisibleInTabBar = 0;
  }
}

- (void)_relinquishReusableTabBarItemView:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "setHidden:", 1);
    -[NSMutableArray addObject:](self->_tabBarItemViewReuseStack, "addObject:", v4);

  }
}

- (TabBarDelegate)delegate
{
  return (TabBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)hidesTitles
{
  return self->_hidesTitles;
}

- (BOOL)isDraggingItem
{
  return self->_draggingItem;
}

- (BOOL)allowsScrollingPinnedItems
{
  return self->_allowsScrollingPinnedItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabHoverPreviewController, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hoverRecognizer, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_reorderRecognizer, 0);
  objc_storeStrong((id *)&self->_trailingVibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_leadingVibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_dragPreviewContainer, 0);
  objc_storeStrong((id *)&self->_trailingContainer, 0);
  objc_storeStrong((id *)&self->_leadingContainer, 0);
  objc_storeStrong((id *)&self->_overflowPinnedItemIndexes, 0);
  objc_storeStrong((id *)&self->_pinnedOverflowButton, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_tabBarItemViewReuseStack, 0);
}

- (void)indexOfCenterItem
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_ERROR, "Attempted to get index of center tab bar item when tab bar's bounds is not set.", v1, 2u);
}

@end
