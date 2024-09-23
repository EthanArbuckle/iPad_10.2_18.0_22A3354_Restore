@implementation SFUnifiedTabBarLayout

- (SFUnifiedTabBarLayout)initWithItemArrangement:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  SFUnifiedTabBarLayout *v9;
  SFUnifiedTabBarLayout *v10;
  uint64_t v11;
  UIScrollView *scrollView;
  uint64_t v13;
  SFUnifiedTabBarMetrics *barMetrics;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  uint64_t v22;
  NSMutableIndexSet *visibleItemIndexes;
  uint64_t v24;
  NSMutableIndexSet *occludedItemIndexes;
  SFUnifiedTabBarLayout *v26;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SFUnifiedTabBarLayout;
  v9 = -[SFUnifiedTabBarLayout init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemArrangement, a3);
    objc_msgSend(v8, "scrollView");
    v11 = objc_claimAutoreleasedReturnValue();
    scrollView = v10->_scrollView;
    v10->_scrollView = (UIScrollView *)v11;

    objc_msgSend(v8, "barMetrics");
    v13 = objc_claimAutoreleasedReturnValue();
    barMetrics = v10->_barMetrics;
    v10->_barMetrics = (SFUnifiedTabBarMetrics *)v13;

    objc_msgSend(v8, "midpointForCenteredContent");
    v10->_midpointForCenteredContent.x = v15;
    v10->_midpointForCenteredContent.y = v16;
    v10->_standalone = objc_msgSend(v8, "isStandalone");
    v10->_flipped = objc_msgSend(v8, "flipped");
    v10->_shouldSlideInNewTrailingTab = objc_msgSend(v8, "shouldSlideInNewTrailingTab");
    objc_msgSend(v8, "visibleRectOverride");
    v10->_visibleRectOverride.origin.x = v17;
    v10->_visibleRectOverride.origin.y = v18;
    v10->_visibleRectOverride.size.width = v19;
    v10->_visibleRectOverride.size.height = v20;
    +[SFUnifiedBarMetrics transitioningItemScale](SFUnifiedBarMetrics, "transitioningItemScale");
    v10->_transitioningItemScale = v21;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v22 = objc_claimAutoreleasedReturnValue();
    visibleItemIndexes = v10->_visibleItemIndexes;
    v10->_visibleItemIndexes = (NSMutableIndexSet *)v22;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v24 = objc_claimAutoreleasedReturnValue();
    occludedItemIndexes = v10->_occludedItemIndexes;
    v10->_occludedItemIndexes = (NSMutableIndexSet *)v24;

    -[SFUnifiedTabBarLayout updateItemSizesIfNeeded](v10, "updateItemSizesIfNeeded");
    -[SFUnifiedTabBarLayout _determineOffsetForCenteringExpandedItem](v10, "_determineOffsetForCenteringExpandedItem");
    v26 = v10;
  }

  return v10;
}

- (void)setBarMetrics:(id)a3
{
  SFUnifiedTabBarMetrics *v5;
  SFUnifiedTabBarMetrics *v6;

  v5 = (SFUnifiedTabBarMetrics *)a3;
  if (self->_barMetrics != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_barMetrics, a3);
    -[SFUnifiedTabBarLayout updateItemSizes](self, "updateItemSizes");
    v5 = v6;
  }

}

- (BOOL)activeItemIsSquished
{
  return self->_squishedActiveItemWidth < self->_activeItemWidth;
}

- (void)updateItemSizesIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double x;
  double y;
  double v12;
  double v13;
  _BOOL4 v14;

  -[UIScrollView frame](self->_scrollView, "frame");
  v4 = v3;
  v6 = v5;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  if (self->_lastLayoutSize.width != v4 || self->_lastLayoutSize.height != v6)
  {
    self->_lastLayoutSize.width = v4;
    self->_lastLayoutSize.height = v6;
    self->_lastLayoutMidpoint = self->_midpointForCenteredContent;
    self->_lastLayoutContentOffset.x = v7;
    self->_lastLayoutContentOffset.y = v8;
    -[SFUnifiedTabBarLayout _updateItemWidths](self, "_updateItemWidths");
    -[SFUnifiedTabBarLayout _updateContentSize](self, "_updateContentSize");
LABEL_16:
    -[SFUnifiedTabBarLayout _updateSquishedActiveItemWidth](self, "_updateSquishedActiveItemWidth");
    return;
  }
  x = self->_lastLayoutMidpoint.x;
  y = self->_lastLayoutMidpoint.y;
  v12 = self->_midpointForCenteredContent.x;
  v13 = self->_midpointForCenteredContent.y;
  v14 = self->_lastLayoutContentOffset.y != v8 || self->_lastLayoutContentOffset.x != v7;
  self->_lastLayoutSize.width = v4;
  self->_lastLayoutSize.height = v6;
  self->_lastLayoutMidpoint = self->_midpointForCenteredContent;
  self->_lastLayoutContentOffset.x = v7;
  self->_lastLayoutContentOffset.y = v8;
  if (x == v12 && y == v13)
  {
    if (v14)
      goto LABEL_16;
  }
  else
  {
    -[SFUnifiedTabBarLayout _updateContentSize](self, "_updateContentSize");
    if (v14)
      goto LABEL_16;
  }
}

- (void)updateItemSizes
{
  -[SFUnifiedTabBarLayout _updateItemWidths](self, "_updateItemWidths");
  -[SFUnifiedTabBarLayout _updateContentSize](self, "_updateContentSize");
  -[SFUnifiedTabBarLayout _updateSquishedActiveItemWidth](self, "_updateSquishedActiveItemWidth");
}

- (void)_updateItemWidths
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
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
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;

  v46 = *MEMORY[0x1E0C80C00];
  -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return;
  -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (-[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems"))
  {
    v7 = 0;
    if (v6)
      goto LABEL_4;
LABEL_7:
    v9 = 0.0;
    if (!v7)
      goto LABEL_19;
LABEL_8:
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v42 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (!self->_standalone)
          {
            -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16 == v17)
              continue;
          }
          -[SFUnifiedTabBarLayout _widthForItem:](self, "_widthForItem:", v16);
          v9 = v9 + v18;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v13);
    }

    goto LABEL_19;
  }
  -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v10, "count");

  if (!v6)
    goto LABEL_7;
LABEL_4:
  +[SFUnifiedBarMetrics separatorWidth](SFUnifiedBarMetrics, "separatorWidth");
  v9 = v8;
  if (v7)
    goto LABEL_8;
LABEL_19:
  -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 && !self->_standalone)
  {
    v21 = v4 - (-[SFUnifiedTabBarLayout _activeItemIsPinned](self, "_activeItemIsPinned") ^ 1);
    v20 = 1;
  }
  else
  {
    v20 = 0;
    v21 = v4;
  }
  v22 = v21 - v7;
  -[SFUnifiedTabBarLayout _safeArea](self, "_safeArea");
  v23 = CGRectGetWidth(v47) - v9;
  -[SFUnifiedTabBarLayout _maximumItemSpacing](self, "_maximumItemSpacing");
  v25 = v24;
  if (self->_standalone)
    v26 = v23;
  else
    v26 = 149.0;
  -[SFUnifiedTabBarLayout _minimumItemSpacing](self, "_minimumItemSpacing");
  v40 = v27;
  -[SFUnifiedTabBarMetrics minimumInactiveItemWidth](self->_barMetrics, "minimumInactiveItemWidth");
  v29 = v28;
  if (-[SFUnifiedTabBarLayout horizontalSpaceIsExtremelyConstrained](self, "horizontalSpaceIsExtremelyConstrained"))
  {
    if (shouldSquishActiveItem_onceToken != -1)
      dispatch_once(&shouldSquishActiveItem_onceToken, &__block_literal_global_18);
    if (!shouldSquishActiveItem_shouldSquishActiveItem)
      v29 = 36.0;
  }
  v30 = (double)(uint64_t)((__PAIR128__(v4, v6) - 1) >> 64);
  self->_activeItemWidth = v23 - (double)v22 * v26 - v30 * v25;
  -[SFUnifiedTabBarLayout _effectiveMinimumActiveItemWidth](self, "_effectiveMinimumActiveItemWidth");
  v32 = v31;
  -[SFUnifiedTabBarMetrics maximumActiveItemWidth](self->_barMetrics, "maximumActiveItemWidth");
  v38 = v33;
  v34 = fmax(v32, fmin(v33, self->_activeItemWidth));
  self->_activeItemWidth = v34;
  self->_activeItemWidthWhenNotExpanded = v34;
  if (!v20)
    v34 = 0.0;
  v35 = v23 - v34;
  v36 = fmax(fmin(_SFUninterpolate(v23 - v34, v40 * v30 + (double)v22 * v29, v25 * v30 + (double)v22 * v26), 1.0), 0.0);
  self->_itemSpacing = _SFInterpolate(v40, v25, v36);
  v37 = _SFInterpolate(v29, v26, v36);
  self->_itemWidth = v37;
  if (self->_standalone)
  {
    self->_activeItemWidth = v37;
    self->_activeItemWidthWhenNotExpanded = v37;
  }
  self->_scrollSlowingInset = fmin(v37 + self->_itemSpacing, v35 * 0.33);
  if (-[SFUnifiedTabBarItemArrangement activeItemIsExpanded](self->_itemArrangement, "activeItemIsExpanded", *(_QWORD *)&v38))
  {
    if (-[SFUnifiedTabBarLayout centersActiveItemWhenExpanded](self, "centersActiveItemWhenExpanded"))
      self->_activeItemWidth = v39;
  }

}

- (void)_updateContentSize
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double Width;
  double pinnedItemsWidth;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  CGRect v19;

  -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    self->_leadingItemOffset = 0.0;
    v5 = 0.0;
    if (!-[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems"))
    {
      -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        -[SFUnifiedTabBarLayout _offsetForPinnedItemAtIndex:](self, "_offsetForPinnedItemAtIndex:", v7);
        v5 = v8;
      }
    }
    self->_pinnedItemsWidth = v5;
    -[SFUnifiedTabBarLayout _offsetForItemAtIndex:](self, "_offsetForItemAtIndex:", v4);
    v10 = v9;
    v11 = v9 + self->_pinnedItemsWidth;
    -[SFUnifiedTabBarLayout _safeArea](self, "_safeArea");
    Width = CGRectGetWidth(v19);
    self->_contentSize.width = fmax(v11, Width);
    self->_contentSize.height = 0.0;
    pinnedItemsWidth = self->_pinnedItemsWidth;
    v14 = fmax(self->_midpointForCenteredContent.x + v10 * -0.5, pinnedItemsWidth);
    -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
    v16 = v14 - v15;
    v17 = Width - v11 - (v14 - v15);
    if (self->_flipped)
      v16 = v17;
    self->_leadingItemOffset = fmax(pinnedItemsWidth, fmin(Width + pinnedItemsWidth - v11, v16));
    self->_contentIsCentered = v11 < Width;
    if (v11 < Width)
    {
      LOBYTE(v18) = 0;
    }
    else
    {
      v18 = -[SFUnifiedTabBarItemArrangement activeItemIsExpanded](self->_itemArrangement, "activeItemIsExpanded");
      if (v18)
        LOBYTE(v18) = -[SFUnifiedTabBarLayout centersActiveItemWhenExpanded](self, "centersActiveItemWhenExpanded");
    }
    self->_expandedItemIsCentered = v18;
  }
}

- (void)_updateSquishedActiveItemWidth
{
  double v3;
  double activeItemWidth;

  if (-[SFUnifiedTabBarItemArrangement activeItemIsExpanded](self->_itemArrangement, "activeItemIsExpanded"))
    goto LABEL_6;
  if (shouldSquishActiveItem_onceToken != -1)
    dispatch_once(&shouldSquishActiveItem_onceToken, &__block_literal_global_18);
  if (!shouldSquishActiveItem_shouldSquishActiveItem)
  {
LABEL_6:
    activeItemWidth = self->_activeItemWidth;
  }
  else
  {
    -[SFUnifiedTabBarLayout _pinnedActiveItemOffsetSquishingActiveItem:activeItemFrame:](self, "_pinnedActiveItemOffsetSquishingActiveItem:activeItemFrame:", 0, 0);
    activeItemWidth = fmax(self->_itemWidth, fmin(self->_activeItemWidth, self->_activeItemWidth - fabs(v3)));
  }
  self->_squishedActiveItemWidth = activeItemWidth;
}

- (void)_determineOffsetForCenteringExpandedItem
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MinX;
  CGRect v20;
  CGRect v21;

  if (self->_expandedItemIsCentered)
  {
    -[SFUnifiedTabBarLayout _unpinnedFrameForItemAtIndex:](self, "_unpinnedFrameForItemAtIndex:", -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex"));
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[SFUnifiedTabBarLayout _adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:](self, "_adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:", 1, 0, 0);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[SFUnifiedTabBarLayout _adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:](self, "_adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:", 0, 0, 1, v4, v6, v8, v10);
    MinX = CGRectGetMinX(v20);
    v21.origin.x = v12;
    v21.origin.y = v14;
    v21.size.width = v16;
    v21.size.height = v18;
    self->_offsetForCenteringExpandedItem = MinX - CGRectGetMinX(v21);
  }
}

- (void)enumerateLayoutForItemsAtIndexes:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v24 = *MEMORY[0x1E0C9D628];
    v25 = v8;
    -[SFUnifiedTabBarLayout _pinnedActiveItemOffsetSquishingActiveItem:activeItemFrame:](self, "_pinnedActiveItemOffsetSquishingActiveItem:activeItemFrame:", 1, &v24);
    v10 = v9;
    -[SFUnifiedTabBarLayout _contentArea](self, "_contentArea");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__SFUnifiedTabBarLayout_enumerateLayoutForItemsAtIndexes_usingBlock___block_invoke;
    v15[3] = &unk_1E21E3D18;
    v17 = v11;
    v18 = v12;
    v19 = v13;
    v20 = v14;
    v15[4] = self;
    v21 = v10;
    v22 = v24;
    v23 = v25;
    v16 = v7;
    -[SFUnifiedTabBarLayout _enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:](self, "_enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:", v6, 1, v15);

  }
}

void __69__SFUnifiedTabBarLayout_enumerateLayoutForItemsAtIndexes_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  uint64_t v39;
  char v40;
  double v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  char v45;
  int v46;
  uint64_t v47;
  id v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  int v60;
  void (*v61)(void);
  double v62;
  _QWORD v63[4];
  __int128 v64;
  uint64_t v65;
  char v66;
  _BYTE v67[15];
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  char v75;
  _BYTE v76[7];
  double v77;
  _DWORD v78[2];

  v13 = a2;
  *(_DWORD *)((char *)v78 + 3) = 0;
  v78[0] = 0;
  v14 = _SFFlipRectInCoordinateSpace(*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16), a4, a5, a6, a7, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(*(id *)(a1 + 32), "_zPositionForItem:", v13);
  v22 = v21;
  v23 = *(_BYTE **)(a1 + 32);
  if (v23[192])
  {
    objc_msgSend(v23, "_slideFrame:forItemAtIndex:pinnedActiveItemOffset:", a3, v14, v16, v18, v20, *(double *)(a1 + 80));
    v14 = v24;
    v16 = v25;
    v18 = v26;
    v20 = v27;
    v23 = *(_BYTE **)(a1 + 32);
  }
  *(double *)v63 = v14;
  *(double *)&v63[1] = v16;
  *(double *)&v63[2] = v18;
  *(double *)&v63[3] = v20;
  __asm { FMOV            V0.2D, #1.0 }
  v64 = _Q0;
  v65 = v22;
  v66 = 1;
  memset(v67, 0, sizeof(v67));
  objc_msgSend(v23, "_scrollSlowingLayoutInfoForItemAtIndex:withLayoutInfo:activeItemFrame:", a3, v63, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  v33 = v68;
  v34 = v69;
  v35 = v70;
  v36 = v71;
  v38 = v72;
  v37 = v73;
  v39 = v74;
  v40 = v75;
  v41 = v77;
  v42 = *(_QWORD *)(a1 + 32);
  v78[0] = *(_DWORD *)v76;
  *(_DWORD *)((char *)v78 + 3) = *(_DWORD *)&v76[3];
  objc_msgSend(*(id *)(v42 + 224), "activeItem");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  if (v43 == v13)
  {
    v45 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "revealsSquishedActiveItem");

    v44 = *(_QWORD *)(a1 + 32);
    if ((v45 & 1) == 0)
      v41 = *(double *)(v44 + 104) - *(double *)(v44 + 120);
  }
  else
  {

    v44 = *(_QWORD *)(a1 + 32);
  }
  v46 = objc_msgSend(*(id *)(v44 + 224), "activeItemIsExpanded");
  v47 = *(_QWORD *)(a1 + 32);
  if (v46 && !*(_BYTE *)(v47 + 216) && !*(_BYTE *)(v47 + 192))
  {
    objc_msgSend(*(id *)(v47 + 224), "activeItem");
    v48 = (id)objc_claimAutoreleasedReturnValue();

    v47 = *(_QWORD *)(a1 + 32);
    if (v48 == v13)
    {
      objc_msgSend((id)v47, "_safeArea");
      v33 = v49;
      v34 = v50;
      v35 = v51;
      v36 = v52;
      v47 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v37 = v37 * *(double *)(v47 + 160);
      v38 = 0.0;
    }
  }
  v53 = _SFFlipRectInCoordinateSpace(*(_BYTE *)(v47 + 16), v33, v34, v35, v36, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v60 = objc_msgSend(v13, "isDragging");
  v61 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  v62 = v38 * 0.5;
  if (!v60)
    v62 = v38;
  v68 = v53;
  v69 = v55;
  v70 = v57;
  v71 = v59;
  v72 = v62;
  v73 = v37;
  v74 = v39;
  v75 = v40;
  *(_DWORD *)v76 = v78[0];
  *(_DWORD *)&v76[3] = *(_DWORD *)((char *)v78 + 3);
  v77 = v41;
  v61();

}

- (void)enumerateInitialLayoutForAppearingItemsAtIndexes:(id)a3 withDistanceToScroll:(double)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a3;
  v9 = a5;
  -[SFUnifiedTabBarLayout _activeItemPinnableArea](self, "_activeItemPinnableArea");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__SFUnifiedTabBarLayout_enumerateInitialLayoutForAppearingItemsAtIndexes_withDistanceToScroll_usingBlock___block_invoke;
  v16[3] = &unk_1E21E3D40;
  v19 = a4;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = v10 + a4;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v14 = v9;
  v15 = v8;
  -[SFUnifiedTabBarLayout _enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:](self, "_enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:", v15, 0, v16);

}

void __106__SFUnifiedTabBarLayout_enumerateInitialLayoutForAppearingItemsAtIndexes_withDistanceToScroll_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  double v14;
  int v15;
  id v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  char v26;
  uint64_t v27;
  char v28;
  void *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  CGRect v36;

  v13 = a2;
  v14 = a4 - *(double *)(a1 + 56);
  v15 = objc_msgSend(*(id *)(a1 + 32), "_itemAtIndexIsPinned:", a3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "activeItem");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 != v13 || (v15 & 1) != 0)
  {
    v22 = a7;
    v20 = a6;
    v18 = a5;
    if (v15)
      goto LABEL_16;
  }
  else
  {
    v14 = pinFrame(v14, a5, a6, a7, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
    v18 = v17;
    v20 = v19;
    v22 = v21;
    a4 = pinFrame(a4, a5, a6, a7, *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 120));
    a5 = v23;
    a6 = v24;
    a7 = v25;
    if (v15)
      goto LABEL_16;
  }
  v26 = objc_msgSend(v13, "isDragging");
  v27 = *(_QWORD *)(a1 + 32);
  if ((v26 & 1) == 0)
  {
    if (*(_BYTE *)(v27 + 17))
    {
      v28 = objc_msgSend((id)v27, "isCurrentlyScrollable");
      v27 = *(_QWORD *)(a1 + 32);
      if ((v28 & 1) == 0)
      {
        objc_msgSend(*(id *)(v27 + 224), "items");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "count") - 1 == a3)
        {
          v30 = objc_msgSend(*(id *)(a1 + 40), "count");

          v27 = *(_QWORD *)(a1 + 32);
          if (v30 == 1)
          {
            v31 = *(unsigned __int8 *)(v27 + 16);
            objc_msgSend((id)v27, "_safeArea");
            if (v31)
              CGRectGetMinX(*(CGRect *)&v32);
            else
              CGRectGetMaxX(*(CGRect *)&v32);
            goto LABEL_16;
          }
        }
        else
        {

          v27 = *(_QWORD *)(a1 + 32);
        }
      }
    }
    if (!*(_BYTE *)(v27 + 16))
    {
      v36.origin.x = v14;
      v36.origin.y = v18;
      v36.size.width = v20;
      v36.size.height = v22;
      CGRectGetWidth(v36);
    }
  }
LABEL_16:
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(a4, a5, a6, a7);

}

- (void)enumerateFinalLayoutForDisappearingItemsAtIndexes:(id)a3 withDistanceScrolled:(double)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;

  v8 = a5;
  v9 = a3;
  -[SFUnifiedTabBarLayout _activeItemPinnableArea](self, "_activeItemPinnableArea");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __107__SFUnifiedTabBarLayout_enumerateFinalLayoutForDisappearingItemsAtIndexes_withDistanceScrolled_usingBlock___block_invoke;
  v15[3] = &unk_1E21E3D68;
  v17 = v10 - a4;
  v18 = v11;
  v19 = v12;
  v20 = v13;
  v21 = a4;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  -[SFUnifiedTabBarLayout _enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:](self, "_enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:", v9, 0, v15);

}

void __107__SFUnifiedTabBarLayout_enumerateFinalLayoutForDisappearingItemsAtIndexes_withDistanceScrolled_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  char v14;
  id v15;

  v13 = a2;
  v14 = objc_msgSend(*(id *)(a1 + 32), "_itemAtIndexIsPinned:", a3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "activeItem");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v13 && (v14 & 1) == 0)
    pinFrame(a4, a5, a6, a7, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_enumerateFramesForItemsAtIndexes:(id)a3 pinActiveItem:(BOOL)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  _QWORD v31[3];
  CGFloat MinX;
  _QWORD v33[4];
  CGRect v34;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "lastIndex") + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarLayout _contentArea](self, "_contentArea");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v33[0] = 0;
    v33[1] = v33;
    v19 = self->_leadingItemOffset + self->_offsetForCenteringExpandedItem;
    v33[2] = 0x2020000000;
    *(double *)&v33[3] = v19;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    MinX = 0.0;
    -[SFUnifiedTabBarLayout _safeArea](self, "_safeArea");
    MinX = CGRectGetMinX(v34);
    -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __84__SFUnifiedTabBarLayout__enumerateFramesForItemsAtIndexes_pinActiveItem_usingBlock___block_invoke;
    v21[3] = &unk_1E21E3D90;
    v21[4] = self;
    v24 = v31;
    v25 = v33;
    v30 = a4;
    v26 = v12;
    v27 = v14;
    v28 = v16;
    v29 = v18;
    v22 = v8;
    v23 = v9;
    objc_msgSend(v20, "enumerateObjectsAtIndexes:options:usingBlock:", v10, 0, v21);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);

  }
}

void __84__SFUnifiedTabBarLayout__enumerateFramesForItemsAtIndexes_pinActiveItem_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;

  v31 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_itemAtIndexIsPinned:", a3);
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(v6, "_widthForItem:", v31);
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "_spacingAfterItem:", v31);
    v11 = v9 + v10;
    v12 = *(_QWORD *)(a1 + 56);
  }
  else
  {
    v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    objc_msgSend(v6, "_widthForItem:", v31);
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "_spacingAfterItem:", v31);
    v11 = v14 + v15;
    v12 = *(_QWORD *)(a1 + 64);
  }
  *(double *)(*(_QWORD *)(v12 + 8) + 24) = v11 + *(double *)(*(_QWORD *)(v12 + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "_frameForItem:withOffset:pinActiveItem:squishActiveItem:centerExpandedItem:", v31, *(unsigned __int8 *)(a1 + 104), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "revealsSquishedActiveItem") ^ 1, 1, v7);
  v20 = _SFFlipRectInCoordinateSpace(*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16), v16, v17, v18, v19, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96));
  v24 = SFFloorRectToPixels(v20, v21, v22, v23);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  if (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", a3))
    (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(v24, v26, v28, v30);

}

- (CGRect)_unpinnedFrameForItemAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
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
  CGRect result;

  -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFUnifiedTabBarLayout _offsetForItemAtIndex:](self, "_offsetForItemAtIndex:", a3);
  -[SFUnifiedTabBarLayout _frameForItem:withOffset:pinActiveItem:squishActiveItem:centerExpandedItem:](self, "_frameForItem:withOffset:pinActiveItem:squishActiveItem:centerExpandedItem:", v6, 0, 0, 0);
  v11 = SFFloorRectToPixels(v7, v8, v9, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_frameForItem:(id)a3 withOffset:(double)a4 pinActiveItem:(BOOL)a5 squishActiveItem:(BOOL)a6 centerExpandedItem:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a3;
  -[SFUnifiedTabBarLayout _widthForItem:](self, "_widthForItem:", v12);
  v14 = v13;
  -[SFUnifiedBarMetrics itemHeight](self->_barMetrics, "itemHeight");
  v16 = v15;
  -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v18 = 0.0;
  if (v17 == v12)
  {
    -[SFUnifiedTabBarLayout _adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:](self, "_adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:", v9, v8, v7, a4, 0.0, v14, v16);
    a4 = v19;
    v14 = v20;
    v16 = v21;
  }
  v22 = a4;
  v23 = v14;
  v24 = v16;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v18;
  result.origin.x = v22;
  return result;
}

- (double)_pinnedActiveItemOffsetSquishingActiveItem:(BOOL)a3 activeItemFrame:(CGRect *)a4
{
  _BOOL8 v5;
  uint64_t v7;
  double v8;
  void *v9;
  BOOL v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double MinX;
  CGRect v25;

  v5 = a3;
  -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  if (v7)
  {
    v9 = (void *)v7;
    v10 = -[SFUnifiedTabBarLayout _activeItemIsPinned](self, "_activeItemIsPinned");

    if (!v10)
    {
      -[SFUnifiedTabBarLayout _unpinnedFrameForItemAtIndex:](self, "_unpinnedFrameForItemAtIndex:", -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex"));
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      -[SFUnifiedTabBarLayout _adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:](self, "_adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:", 1, v5, 1);
      if (a4)
      {
        a4->origin.x = v19;
        a4->origin.y = v20;
        a4->size.width = v21;
        a4->size.height = v22;
      }
      MinX = CGRectGetMinX(*(CGRect *)&v19);
      v25.origin.x = v12;
      v25.origin.y = v14;
      v25.size.width = v16;
      v25.size.height = v18;
      return MinX - CGRectGetMinX(v25);
    }
  }
  return v8;
}

- (CGRect)_adjustedActiveItemFrame:(CGRect)a3 pinActiveItem:(BOOL)a4 squishActiveItem:(BOOL)a5 centerExpandedItem:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect result;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[SFUnifiedTabBarLayout _activeItemIsPinned](self, "_activeItemIsPinned"))
  {
    if (v6 && self->_expandedItemIsCentered)
    {
      -[SFUnifiedTabBarLayout _midpointForCenteredContentInScrollView](self, "_midpointForCenteredContentInScrollView");
      v15 = v14;
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      x = x + v15 - CGRectGetMidX(v27);
    }
    else if (v8)
    {
      if (v7)
        width = self->_squishedActiveItemWidth;
      -[SFUnifiedTabBarLayout _activeItemPinnableArea](self, "_activeItemPinnableArea");
      x = pinFrame(x, y, width, height, v16, v17, v18, v19);
      y = v20;
      width = v21;
      height = v22;
    }
  }
  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (double)_distanceToEdgeForItemAtIndex:(unint64_t)a3 withFrame:(CGRect)a4 activeItemFrame:(CGRect)a5 occludedEdge:(unint64_t *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  void *v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  double scrollSlowingInset;
  uint64_t (**v20)(void *, uint64_t, BOOL, __n128);
  double MinX;
  double MaxX;
  double v23;
  __n128 v24;
  char v25;
  char v26;
  double v27;
  double v28;
  double v29;
  __n128 v30;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  _BOOL4 v41;
  SFUnifiedTabBarItemArrangement *itemArrangement;
  void *v43;
  double v44;
  double v45;
  void *v46;
  _BOOL8 v47;
  double v48;
  double v49;
  void *v50;
  _BOOL8 v51;
  CGFloat v53;
  CGFloat v54;
  _QWORD aBlock[7];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double *v61;
  uint64_t v62;
  double v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v53 = a4.size.width;
  v54 = a4.size.height;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  if (-[SFUnifiedTabBarLayout _activeItemIsPinned](self, "_activeItemIsPinned"))
  {
    v15 = 0;
  }
  else
  {
    -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex");
  v17 = 0.0;
  if (v16 != a3)
  {
    v18 = v16;
    v60 = 0;
    v61 = (double *)&v60;
    scrollSlowingInset = self->_scrollSlowingInset;
    v62 = 0x2020000000;
    v63 = scrollSlowingInset;
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__SFUnifiedTabBarLayout__distanceToEdgeForItemAtIndex_withFrame_activeItemFrame_occludedEdge___block_invoke;
    aBlock[3] = &unk_1E21E3DB8;
    aBlock[4] = self;
    aBlock[5] = &v60;
    aBlock[6] = &v56;
    v20 = (uint64_t (**)(void *, uint64_t, BOOL, __n128))_Block_copy(aBlock);
    if (v15 && v18 > a3)
    {
      v64.origin.x = x;
      v64.origin.y = y;
      v64.size.width = width;
      v64.size.height = height;
      MinX = CGRectGetMinX(v64);
      v65.origin.x = v12;
      v65.origin.y = v11;
      v65.size.width = v53;
      v65.size.height = v54;
      MaxX = CGRectGetMaxX(v65);
      -[SFUnifiedTabBarLayout _spacingBeforeItem:](self, "_spacingBeforeItem:", v15);
      v24.n128_f64[0] = MinX - MaxX - v23;
      v25 = v20[2](v20, 1, v18 - 1 == a3, v24);
      v26 = 0;
    }
    else
    {
      v25 = 0;
      v26 = 0;
      if (v15 && v18 < a3)
      {
        v66.origin.x = v12;
        v66.origin.y = v11;
        v66.size.width = v53;
        v66.size.height = v54;
        v27 = CGRectGetMinX(v66);
        v67.origin.x = x;
        v67.origin.y = y;
        v67.size.width = width;
        v67.size.height = height;
        v28 = CGRectGetMaxX(v67);
        -[SFUnifiedTabBarLayout _spacingAfterItem:](self, "_spacingAfterItem:", v15);
        v30.n128_f64[0] = v27 - v28 - v29;
        v26 = v20[2](v20, 0, v18 + 1 == a3, v30);
        v25 = 0;
      }
    }
    -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", a3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFUnifiedTabBarLayout _unpinnedItemSafeArea](self, "_unpinnedItemSafeArea");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v41 = -[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems");
    itemArrangement = self->_itemArrangement;
    if (v41)
      -[SFUnifiedTabBarItemArrangement items](itemArrangement, "items");
    else
      -[SFUnifiedTabBarItemArrangement unpinnedItems](itemArrangement, "unpinnedItems");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v26 & 1) == 0)
    {
      v68.origin.x = v12;
      v68.origin.y = v11;
      v68.size.width = v53;
      v68.size.height = v54;
      v44 = CGRectGetMinX(v68);
      v69.origin.x = v34;
      v69.origin.y = v36;
      v69.size.width = v38;
      v69.size.height = v40;
      v45 = CGRectGetMinX(v69);
      objc_msgSend(v43, "firstObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v32 == v46;

      ((void (*)(uint64_t (**)(void *, uint64_t, BOOL, __n128), _QWORD, _BOOL8, double))v20[2])(v20, 0, v47, v44 - v45);
    }
    if ((v25 & 1) == 0)
    {
      v70.origin.x = v34;
      v70.origin.y = v36;
      v70.size.width = v38;
      v70.size.height = v40;
      v48 = CGRectGetMaxX(v70);
      v71.origin.x = v12;
      v71.origin.y = v11;
      v71.size.width = v53;
      v71.size.height = v54;
      v49 = CGRectGetMaxX(v71);
      objc_msgSend(v43, "lastObject");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v32 == v50;

      ((void (*)(uint64_t (**)(void *, uint64_t, BOOL, __n128), uint64_t, _BOOL8, double))v20[2])(v20, 1, v51, v48 - v49);
    }
    if (a6)
      *a6 = v57[3];
    v17 = v61[3];

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v60, 8);
  }

  return v17;
}

BOOL __94__SFUnifiedTabBarLayout__distanceToEdgeForItemAtIndex_withFrame_activeItemFrame_occludedEdge___block_invoke(_QWORD *a1, uint64_t a2, char a3, double a4)
{
  double v4;

  v4 = 0.0;
  if ((a3 & 1) == 0)
    v4 = *(double *)(a1[4] + 168);
  if (v4 > a4)
  {
    *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = a4;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  }
  return v4 > a4;
}

- (CGRect)_slideFrame:(CGRect)a3 forItemAtIndex:(unint64_t)a4 pinnedActiveItemOffset:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex") > a4)
  {
    v12 = fmax(a5, 0.0);
LABEL_5:
    x = x + v12;
    goto LABEL_6;
  }
  if (-[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex") < a4)
  {
    v12 = fmin(a5, 0.0);
    goto LABEL_5;
  }
LABEL_6:
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- ($174D3796E742295BF8F26947D44880BB)_scrollSlowingLayoutInfoForItemAtIndex:(SEL)a3 withLayoutInfo:(unint64_t)a4 activeItemFrame:(id *)a5
{
  double height;
  double width;
  double y;
  double x;
  $174D3796E742295BF8F26947D44880BB *result;
  __int128 v15;
  CGSize size;
  void *v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double MaxX;
  double v23;
  double MinX;
  double v25;
  double v26;
  double v27;
  double scrollSlowingInset;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  __int128 v34;
  CGSize v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  __int128 v41;
  CGSize v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  BOOL v48;
  double v49;
  double rect;
  CGFloat recta;
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  result = ($174D3796E742295BF8F26947D44880BB *)-[SFUnifiedTabBarLayout _itemAtIndexIsPinned:](self, "_itemAtIndexIsPinned:");
  if ((_DWORD)result)
  {
    v15 = *(_OWORD *)&a5->var3;
    *(_OWORD *)&retstr->var1 = *(_OWORD *)&a5->var1;
    *(_OWORD *)&retstr->var3 = v15;
    retstr->var6 = a5->var6;
    size = a5->var0.size;
    retstr->var0.origin = a5->var0.origin;
    retstr->var0.size = size;
    return result;
  }
  if (-[SFUnifiedTabBarLayout _activeItemIsPinned](self, "_activeItemIsPinned"))
  {
    v17 = 0;
  }
  else
  {
    -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex");
  if (v18 != a4)
  {
    v19 = a5->var0.origin.x;
    rect = a5->var0.origin.y;
    v20 = a5->var0.size.width;
    v21 = a5->var0.size.height;
    if (v17 && v18 + 1 == a4)
    {
      v53.origin.x = x;
      v53.origin.y = y;
      v53.size.width = width;
      v53.size.height = height;
      MaxX = CGRectGetMaxX(v53);
      -[SFUnifiedTabBarLayout _spacingAfterItem:](self, "_spacingAfterItem:", v17);
      v19 = fmin(v19, MaxX + v23);
    }
    else if (v17 && v18 - 1 == a4)
    {
      v54.origin.x = x;
      v54.origin.y = y;
      v54.size.width = width;
      v54.size.height = height;
      MinX = CGRectGetMinX(v54);
      v55.origin.x = v19;
      v55.origin.y = rect;
      v55.size.width = v20;
      v55.size.height = v21;
      v25 = MinX - CGRectGetWidth(v55);
      -[SFUnifiedTabBarLayout _spacingBeforeItem:](self, "_spacingBeforeItem:", v17);
      v19 = fmax(v19, v25 - v26);
    }
    v52 = 0;
    -[SFUnifiedTabBarLayout _distanceToEdgeForItemAtIndex:withFrame:activeItemFrame:occludedEdge:](self, "_distanceToEdgeForItemAtIndex:withFrame:activeItemFrame:occludedEdge:", a4, &v52, v19, rect, v20, v21, x, y, width, height, *(_QWORD *)&rect);
    scrollSlowingInset = self->_scrollSlowingInset;
    if (v27 < scrollSlowingInset)
    {
      v29 = v27;
      v30 = _SFUninterpolate(v27, scrollSlowingInset, scrollSlowingInset * -0.570796327);
      v31 = _SFUninterpolate(v30, 1.0, 1.57079633);
      v32 = _SFInterpolate(1.0, 0.3, fmax(fmin(v31, 1.0), 0.0));
      if (-[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems"))
      {
        v33 = 0;
      }
      else
      {
        -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v36, "count");

      }
      if (v33 != a4)
      {
        -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "count") - 1 == a4
          || -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex") - 1 == a4
          && v52 == 1)
        {

        }
        else
        {
          v48 = -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex") + 1 == a4
             && v52 == 0;

          if (v30 < 1.0 && !v48)
          {
            v49 = self->_scrollSlowingInset;
            v38 = v49 - v29 + sin(v30 * -1.57079633) * v49;
            goto LABEL_26;
          }
        }
      }
      if (v29 < 0.0)
        v38 = -v29;
      else
        v38 = 0.0;
LABEL_26:
      if (v52 == 1)
      {
        v19 = v19 - v38;
        v39 = -1.0 - (double)a4;
      }
      else
      {
        v39 = 0.0;
        if (!v52)
        {
          v19 = v19 + v38;
          -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = -(double)(objc_msgSend(v40, "count") - a4);

        }
      }
      v41 = *(_OWORD *)&a5->var3;
      *(_OWORD *)&retstr->var1 = *(_OWORD *)&a5->var1;
      *(_OWORD *)&retstr->var3 = v41;
      retstr->var6 = a5->var6;
      v42 = a5->var0.size;
      retstr->var0.origin = a5->var0.origin;
      retstr->var0.size = v42;
      retstr->var0.origin.x = SFFloorRectToPixels(v19, recta, v20, v21);
      retstr->var0.origin.y = v43;
      retstr->var0.size.width = v44;
      retstr->var0.size.height = v45;
      retstr->var1 = v32 * retstr->var1;
      retstr->var3 = v39;
      retstr->var4 = v30 < 1.57079633;
      -[SFUnifiedTabBarLayout _minimumHorizontalOffsetForOccludedItems](self, "_minimumHorizontalOffsetForOccludedItems");
      retstr->var5 = v38 >= v46;
      goto LABEL_31;
    }
  }
  v34 = *(_OWORD *)&a5->var3;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&a5->var1;
  *(_OWORD *)&retstr->var3 = v34;
  retstr->var6 = a5->var6;
  v35 = a5->var0.size;
  retstr->var0.origin = a5->var0.origin;
  retstr->var0.size = v35;
LABEL_31:

  return result;
}

- (double)_offsetForItemAtIndex:(unint64_t)a3
{
  _BOOL4 v5;
  double leadingItemOffset;
  double offsetForCenteringExpandedItem;
  SFUnifiedTabBarItemArrangement *itemArrangement;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  void *v13;
  double v14;

  v5 = -[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems");
  leadingItemOffset = self->_leadingItemOffset;
  offsetForCenteringExpandedItem = self->_offsetForCenteringExpandedItem;
  itemArrangement = self->_itemArrangement;
  if (v5)
  {
    -[SFUnifiedTabBarItemArrangement items](itemArrangement, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarLayout _offsetForItemAtIndex:inItems:](self, "_offsetForItemAtIndex:inItems:", a3, v9);
    v11 = v10;
  }
  else
  {
    -[SFUnifiedTabBarItemArrangement pinnedItems](itemArrangement, "pinnedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a3 - objc_msgSend(v9, "count");
    -[SFUnifiedTabBarItemArrangement unpinnedItems](self->_itemArrangement, "unpinnedItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarLayout _offsetForItemAtIndex:inItems:](self, "_offsetForItemAtIndex:inItems:", v12, v13);
    v11 = v14;

  }
  return leadingItemOffset + offsetForCenteringExpandedItem + v11;
}

- (double)_offsetForPinnedItemAtIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;

  -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarLayout _offsetForItemAtIndex:inItems:](self, "_offsetForItemAtIndex:inItems:", a3, v5);
  v7 = v6;

  return v7;
}

- (double)_offsetForItemAtIndex:(unint64_t)a3 inItems:(id)a4
{
  id v6;
  double v7;
  _QWORD v9[7];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a4;
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SFUnifiedTabBarLayout__offsetForItemAtIndex_inItems___block_invoke;
  v9[3] = &unk_1E21E3DE0;
  v9[5] = &v10;
  v9[6] = a3;
  v9[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __55__SFUnifiedTabBarLayout__offsetForItemAtIndex_inItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (*(_QWORD *)(a1 + 48) == a3)
  {
    *a4 = 1;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "_widthForItem:", v6);
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "_spacingAfterItem:", v6);
    v10 = v9;

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8
                                                                + v10
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

- (double)_widthForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  if (!self->_standalone)
  {
    -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      v9 = 104;
      goto LABEL_7;
    }
  }
  if (-[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems")|| (-[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "containsObject:", v4), v6, (v7 & 1) == 0))
  {
    v9 = 112;
LABEL_7:
    v8 = *(double *)((char *)&self->super.isa + v9);
    goto LABEL_8;
  }
  v8 = 36.0;
LABEL_8:

  return v8;
}

- (double)_spacingAfterItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  double v9;
  double itemSpacing;
  double v11;

  v4 = a3;
  -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    itemSpacing = self->_itemSpacing;
    +[SFUnifiedBarMetrics separatorWidth](SFUnifiedBarMetrics, "separatorWidth");
    v9 = v11 + itemSpacing * 2.0;
  }
  else
  {
    -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v4)
      v9 = 0.0;
    else
      v9 = self->_itemSpacing;
  }

  return v9;
}

- (double)_spacingBeforeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  double itemSpacing;
  double v9;
  double v10;
  void *v11;
  id v12;

  v4 = a3;
  -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[SFUnifiedTabBarItemArrangement unpinnedItems](self->_itemArrangement, "unpinnedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      itemSpacing = self->_itemSpacing;
      +[SFUnifiedBarMetrics separatorWidth](SFUnifiedBarMetrics, "separatorWidth");
      v10 = v9 + itemSpacing * 2.0;
      goto LABEL_8;
    }
  }
  else
  {

  }
  -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
    v10 = 0.0;
  else
    v10 = self->_itemSpacing;
LABEL_8:

  return v10;
}

- (double)_zPositionForItem:(id)a3
{
  id v4;
  id v5;
  double v6;
  void *v7;
  int v8;

  v4 = a3;
  -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = 2.0;
  }
  else
  {
    v6 = 0.0;
    if (!-[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems"))
    {
      -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v4);

      if (v8)
        v6 = 1.0;
      else
        v6 = 0.0;
    }
  }

  return v6;
}

- (unint64_t)indexOfCenterItem
{
  -[SFUnifiedTabBarLayout _unpinnedItemSafeArea](self, "_unpinnedItemSafeArea");
  UIRectGetCenter();
  return -[SFUnifiedTabBarLayout _indexOfItemClosestToPoint:passingTest:](self, "_indexOfItemClosestToPoint:passingTest:", 0);
}

- (unint64_t)maximumNumberOfVisibleItems
{
  CGRect v4;

  -[SFUnifiedTabBarLayout _safeArea](self, "_safeArea");
  return vcvtpd_u64_f64(CGRectGetWidth(v4) / (self->_itemWidth + self->_itemSpacing));
}

- (CGRect)frameForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  v4 = a3;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x4010000000;
  v21 = &unk_18BB4097D;
  v22 = 0u;
  v23 = 0u;
  -[SFUnifiedTabBarItemArrangement allItemIndexes](self->_itemArrangement, "allItemIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __38__SFUnifiedTabBarLayout_frameForItem___block_invoke;
  v15[3] = &unk_1E21E3E08;
  v6 = v4;
  v16 = v6;
  v17 = &v18;
  -[SFUnifiedTabBarLayout _enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:](self, "_enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:", v5, 1, v15);

  v7 = v19[4];
  v8 = v19[5];
  v9 = v19[6];
  v10 = v19[7];

  _Block_object_dispose(&v18, 8);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

uint64_t __38__SFUnifiedTabBarLayout_frameForItem___block_invoke(uint64_t result, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, _BYTE *a8)
{
  double *v8;

  if (*(_QWORD *)(result + 32) == a2)
  {
    v8 = *(double **)(*(_QWORD *)(result + 40) + 8);
    v8[4] = a3;
    v8[5] = a4;
    v8[6] = a5;
    v8[7] = a6;
    *a8 = 1;
  }
  return result;
}

- (CGRect)frameForPreviewingItem:(id)a3 pinned:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v17;
  double v18;
  double itemWidth;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v4 = a4;
  v6 = a3;
  -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    -[SFUnifiedTabBarLayout frameForItem:](self, "frameForItem:", v6);
  }
  else
  {
    if (v4)
      -[SFUnifiedTabBarLayout _safeArea](self, "_safeArea");
    else
      -[SFUnifiedTabBarLayout _unpinnedItemSafeArea](self, "_unpinnedItemSafeArea");
    -[SFUnifiedTabBarLayout _frameForItem:withOffset:pinActiveItem:squishActiveItem:centerExpandedItem:](self, "_frameForItem:withOffset:pinActiveItem:squishActiveItem:centerExpandedItem:", v6, 0, 0, 0, CGRectGetMinX(*(CGRect *)&v13));
  }
  v17 = v9;
  v18 = v10;
  itemWidth = v11;
  v20 = v12;
  -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21 != v6)
  {
    if (v4)
      itemWidth = 36.0;
    else
      itemWidth = self->_itemWidth;
  }

  v22 = v17;
  v23 = v18;
  v24 = itemWidth;
  v25 = v20;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)itemClosestToPoint:(CGPoint)a3 passingTest:(id)a4
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v5 = -[SFUnifiedTabBarLayout _indexOfItemClosestToPoint:passingTest:](self, "_indexOfItemClosestToPoint:passingTest:", a4, a3.x, a3.y);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v7 = v5;
    -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (unint64_t)_indexOfItemClosestToPoint:(CGPoint)a3 passingTest:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  NSMutableIndexSet *visibleItemIndexes;
  id v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD *v15;
  CGFloat v16;
  CGFloat v17;
  _QWORD v18[4];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0x7FEFFFFFFFFFFFFFLL;
  visibleItemIndexes = self->_visibleItemIndexes;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__SFUnifiedTabBarLayout__indexOfItemClosestToPoint_passingTest___block_invoke;
  v12[3] = &unk_1E21E3E30;
  v9 = v7;
  v16 = x;
  v17 = y;
  v13 = v9;
  v14 = &v19;
  v15 = v18;
  -[SFUnifiedTabBarLayout _enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:](self, "_enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:", visibleItemIndexes, 0, v12);
  v10 = v20[3];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v10;
}

void __64__SFUnifiedTabBarLayout__indexOfItemClosestToPoint_passingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v15;
  uint64_t v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v15 = a2;
  v16 = *(_QWORD *)(a1 + 32);
  v21 = v15;
  if (!v16 || (v17 = (*(uint64_t (**)(uint64_t, id))(v16 + 16))(v16, v15), v18 = v21, v17))
  {
    v22.origin.x = a5;
    v22.origin.y = a6;
    v22.size.width = a7;
    v22.size.height = a8;
    if (CGRectContainsPoint(v22, *(CGPoint *)(a1 + 56)))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
    v23.origin.x = a5;
    v23.origin.y = a6;
    v23.size.width = a7;
    v23.size.height = a8;
    v19 = vabdd_f64(*(double *)(a1 + 56), CGRectGetMinX(v23));
    v24.origin.x = a5;
    v24.origin.y = a6;
    v24.size.width = a7;
    v24.size.height = a8;
    v20 = fmin(v19, vabdd_f64(*(double *)(a1 + 56), CGRectGetMaxX(v24)));
    if (v20 >= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      *a4 = 1;
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v20;
    }
    v18 = v21;
  }

}

- (id)itemAtPoint:(CGPoint)a3
{
  NSMutableIndexSet *visibleItemIndexes;
  id v4;
  _QWORD v6[6];
  CGPoint v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  visibleItemIndexes = self->_visibleItemIndexes;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SFUnifiedTabBarLayout_itemAtPoint___block_invoke;
  v6[3] = &unk_1E21E3E58;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  -[SFUnifiedTabBarLayout _enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:](self, "_enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:", visibleItemIndexes, 1, v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __37__SFUnifiedTabBarLayout_itemAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  uint64_t v14;
  id v15;
  id v16;
  CGRect v17;

  v16 = a2;
  v17.origin.x = a4;
  v17.origin.y = a5;
  v17.size.width = a6;
  v17.size.height = a7;
  if (CGRectContainsPoint(v17, *(CGPoint *)(a1 + 48))
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "containsIndex:", a3) & 1) == 0)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!*(_QWORD *)(v14 + 40))
    {
LABEL_6:
      objc_storeStrong((id *)(v14 + 40), a2);
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "activeItem");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v16)
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (CGPoint)contentOffsetForScrollingToItemAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  if (-[SFUnifiedTabBarLayout _itemAtIndexIsPinned:](self, "_itemAtIndexIsPinned:"))
  {
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  }
  else
  {
    -[SFUnifiedTabBarLayout _offsetForItemAtIndex:](self, "_offsetForItemAtIndex:", a3);
    v8 = v7;
    -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarLayout _widthForItem:](self, "_widthForItem:", v10);
    v12 = v11;

    if (self->_flipped)
      v8 = self->_contentSize.width - v8 - v12;
    -[SFUnifiedTabBarLayout _insetsForScrollingToItemAtIndex:](self, "_insetsForScrollingToItemAtIndex:", a3);
    -[SFUnifiedTabBarLayout _contentOffsetForScrollingToRegionWithMinX:maxX:insets:](self, "_contentOffsetForScrollingToRegionWithMinX:maxX:insets:", v8, v12 + v8, v13, v14, v15, v16);
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)contentOffsetForScrollingToDroppingItems
{
  __int128 v3;
  void *v4;
  double MinX;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[5];
  uint64_t v13;
  CGRect *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  CGPoint result;

  v13 = 0;
  v14 = (CGRect *)&v13;
  v16 = &unk_18BB4097D;
  v15 = 0x4010000000;
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v17 = *MEMORY[0x1E0C9D628];
  v18 = v3;
  -[SFUnifiedTabBarItemArrangement allItemIndexes](self->_itemArrangement, "allItemIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__SFUnifiedTabBarLayout_contentOffsetForScrollingToDroppingItems__block_invoke;
  v12[3] = &unk_1E21E3E80;
  v12[4] = &v13;
  -[SFUnifiedTabBarLayout _enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:](self, "_enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:", v4, 0, v12);

  MinX = CGRectGetMinX(v14[1]);
  -[SFUnifiedTabBarLayout _contentOffsetForScrollingToRegionWithMinX:maxX:insets:](self, "_contentOffsetForScrollingToRegionWithMinX:maxX:insets:", MinX, CGRectGetMaxX(v14[1]), *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v7 = v6;
  v9 = v8;
  _Block_object_dispose(&v13, 8);
  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

void __65__SFUnifiedTabBarLayout_contentOffsetForScrollingToDroppingItems__block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat y, CGFloat width, CGFloat height)
{
  _BOOL4 IsNull;
  CGRect *v12;
  CGRect v13;
  CGRect v14;

  if (objc_msgSend(a2, "isDropping"))
  {
    IsNull = CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
    v12 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
    if (IsNull)
    {
      v12[1].origin.x = a3;
    }
    else
    {
      v14.origin.x = a3;
      v14.origin.y = y;
      v14.size.width = width;
      v14.size.height = height;
      v13 = CGRectUnion(v12[1], v14);
      y = v13.origin.y;
      width = v13.size.width;
      height = v13.size.height;
      v12 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
      v12[1].origin.x = v13.origin.x;
    }
    v12[1].origin.y = y;
    v12[1].size.width = width;
    v12[1].size.height = height;
  }
}

- (CGPoint)_contentOffsetForScrollingToRegionWithMinX:(double)a3 maxX:(double)a4 insets:(UIEdgeInsets)a5
{
  double right;
  double left;
  double v10;
  double v11;
  double Width;
  double v13;
  double v14;
  double v15;
  CGPoint result;
  CGRect v17;

  right = a5.right;
  left = a5.left;
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset", a3, a4, a5.top, a5.left, a5.bottom);
  v11 = v10;
  -[SFUnifiedTabBarLayout _safeArea](self, "_safeArea");
  Width = CGRectGetWidth(v17);
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v15 = fmin(fmax(fmax(fmin(v11 + v14, a3 - left), right + a4 - Width), 0.0), self->_contentSize.width - Width) - v11;
  result.y = v13;
  result.x = v15;
  return result;
}

- (UIEdgeInsets)_insetsForScrollingToItemAtIndex:(unint64_t)a3
{
  double *v5;
  double v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIEdgeInsets result;

  v5 = (double *)MEMORY[0x1E0DC49E8];
  if (a3)
    v6 = self->_itemWidth + self->_itemSpacing;
  else
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") - 1;

  if (v8 <= a3)
    v9 = v5[3];
  else
    v9 = self->_itemWidth + self->_itemSpacing;
  v10 = *v5;
  v11 = v5[2];
  v12 = -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex");
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v12;
    if (v12 <= a3)
    {
      if (v12 < a3)
      {
        -[SFUnifiedTabBarLayout _insetsForActiveItemPinnableArea](self, "_insetsForActiveItemPinnableArea");
        v19 = v18 + self->_squishedActiveItemWidth;
        -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUnifiedTabBarLayout _spacingAfterItem:](self, "_spacingAfterItem:", v20);
        v6 = v19 + v21;

        if (v13 + 1 < a3)
          v6 = v6 + self->_itemWidth + self->_itemSpacing;
      }
    }
    else
    {
      -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBarLayout _spacingBeforeItem:](self, "_spacingBeforeItem:", v14);
      v16 = v15 + self->_squishedActiveItemWidth;
      -[SFUnifiedTabBarLayout _insetsForActiveItemPinnableArea](self, "_insetsForActiveItemPinnableArea");
      v9 = v16 + v17;

      if (v13 - 1 > a3)
        v9 = v9 + self->_itemWidth + self->_itemSpacing;
    }
  }
  v22 = v10;
  v23 = v6;
  v24 = v11;
  v25 = v9;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (BOOL)isCurrentlyScrollable
{
  double Width;
  CGRect v5;

  -[SFUnifiedTabBarLayout _unpinnedItemSafeArea](self, "_unpinnedItemSafeArea");
  Width = CGRectGetWidth(v5);
  return Width < _SFRoundFloatToPixels(self->_contentSize.width - (self->_activeItemWidth
                                                                 - self->_activeItemWidthWhenNotExpanded));
}

- (CGRect)pinnedItemsSeparatorFrame
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  +[SFUnifiedBarMetrics separatorWidth](SFUnifiedBarMetrics, "separatorWidth");
  v4 = v3;
  if (-[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems"))
  {
    -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarLayout _offsetForItemAtIndex:](self, "_offsetForItemAtIndex:", objc_msgSend(v5, "count"));
    v7 = v6 - self->_itemSpacing - v4;

    v8 = -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex");
    -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") - 1;

    if (v8 == v10)
    {
      -[SFUnifiedTabBarLayout _activeItemPinnableArea](self, "_activeItemPinnableArea");
      v7 = fmax(v7, CGRectGetMinX(v27) + self->_itemWidth + self->_itemSpacing);
    }
    v11 = -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex");
    -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v11 == v13)
    {
      -[SFUnifiedTabBarLayout _activeItemPinnableArea](self, "_activeItemPinnableArea");
      v7 = fmin(v7, CGRectGetMaxX(v28) - self->_itemWidth - self->_itemSpacing - v4);
    }
  }
  else
  {
    -[SFUnifiedTabBarLayout _safeArea](self, "_safeArea");
    v7 = CGRectGetMinX(v29) + self->_pinnedItemsWidth - self->_itemSpacing - v4;
  }
  -[SFUnifiedBarMetrics itemHeight](self->_barMetrics, "itemHeight");
  v30.size.height = v14;
  v30.origin.y = 0.0;
  v30.origin.x = v7;
  v30.size.width = v4;
  v31 = CGRectInset(v30, 0.0, 4.0);
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;
  -[SFUnifiedTabBarLayout _contentArea](self, "_contentArea");
  v23 = _SFFlipRectInCoordinateSpace(self->_flipped, x, y, width, height, v19, v20, v21, v22);
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (double)pinnedItemsSeparatorOpacity
{
  _BOOL4 v3;
  double result;
  int64_t v5;
  void *v6;
  uint64_t v7;
  double itemWidth;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGRect v24;
  CGRect v25;

  if (-[SFUnifiedTabBarItemArrangement activeItemIsExpanded](self->_itemArrangement, "activeItemIsExpanded")
    && !self->_contentIsCentered)
  {
    return 0.0;
  }
  v3 = -[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems");
  result = 1.0;
  if (v3)
  {
    v5 = -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex", 1.0);
    -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    itemWidth = self->_itemWidth;
    -[SFUnifiedBarMetrics itemCornerRadius](self->_barMetrics, "itemCornerRadius");
    v10 = itemWidth - v9;
    v11 = 0.0;
    if (v5 != v7 && v5 != v7 - 1)
      v11 = self->_itemWidth + self->_itemSpacing;
    v12 = v10 + v11;
    -[SFUnifiedTabBarItemArrangement unpinnedItems](self->_itemArrangement, "unpinnedItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "count"))
      v10 = 0.0;

    if (v5 >= v7)
      v14 = v10;
    else
      v14 = v12;
    if (v5 >= v7)
      v15 = v12;
    else
      v15 = v10;
    -[SFUnifiedTabBarLayout _safeArea](self, "_safeArea");
    v17 = v16;
    v19 = v14 + v18;
    v21 = v20 + 0.0;
    v23 = v22 - (v14 + v15);
    -[SFUnifiedTabBarLayout pinnedItemsSeparatorFrame](self, "pinnedItemsSeparatorFrame");
    v25.origin.x = v19;
    v25.origin.y = v21;
    v25.size.width = v23;
    v25.size.height = v17;
    return (double)CGRectIntersectsRect(v24, v25);
  }
  return result;
}

- (CGRect)pinnedItemDropArea
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[UIScrollView bounds](self->_scrollView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v10 = v9 + self->_pinnedItemsWidth + self->_itemWidth * 0.33;
  -[SFUnifiedTabBarLayout _contentArea](self, "_contentArea");
  v15 = _SFFlipRectInCoordinateSpace(self->_flipped, v4, v6, v10, v8, v11, v12, v13, v14);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (UIEdgeInsets)autoScrollTouchInsets
{
  double v2;
  double pinnedItemsWidth;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v2 = -self->_scrollSlowingInset;
  pinnedItemsWidth = self->_pinnedItemsWidth;
  v4 = v2 - pinnedItemsWidth;
  if (self->_flipped)
    v5 = -self->_scrollSlowingInset;
  else
    v5 = v2 - pinnedItemsWidth;
  if (self->_flipped)
    v6 = v4;
  else
    v6 = -self->_scrollSlowingInset;
  v7 = 0.0;
  v8 = 0.0;
  result.right = v6;
  result.bottom = v8;
  result.left = v5;
  result.top = v7;
  return result;
}

+ (unint64_t)pinnedItemLimitForItemArrangement:(id)a3 tabBarWidth:(double)a4 barMetrics:(id)a5 standalone:(BOOL)a6
{
  void *v6;
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;

  v7 = a6;
  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "unpinnedItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13 >= 2)
  {
    objc_msgSend(v10, "unpinnedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 3.5;
    if ((unint64_t)objc_msgSend(v6, "count") > 3)
      goto LABEL_6;
  }
  objc_msgSend(v10, "unpinnedItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 1.0;
  if ((unint64_t)objc_msgSend(v15, "count") >= 2)
  {
    objc_msgSend(v10, "unpinnedItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (double)(unint64_t)objc_msgSend(v16, "count");

  }
  if (v13 >= 2)
LABEL_6:

  if (v7)
    objc_msgSend(v11, "minimumInactiveItemWidth");
  else
    objc_msgSend(v11, "minimumActiveItemWidth");
  v18 = v17;
  objc_msgSend(v11, "minimumInactiveItemWidth");
  v20 = v19;
  objc_msgSend(v11, "minimumItemSpacing");
  v22 = v21;
  v23 = v18 + v20 * v14 + v21 * (v14 + 1.0);
  +[SFUnifiedBarMetrics separatorWidth](SFUnifiedBarMetrics, "separatorWidth");
  v25 = (unint64_t)fmax((a4 - (v23 + v24)) / (v22 + 36.0) + -2.0, 1.0);

  return v25;
}

- (BOOL)_activeItemIsPinned
{
  void *v3;
  BOOL v4;

  -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SFUnifiedTabBarLayout _itemAtIndexIsPinned:](self, "_itemAtIndexIsPinned:", -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex"));
  else
    v4 = 0;

  return v4;
}

- (BOOL)_itemAtIndexIsPinned:(unint64_t)a3
{
  BOOL v5;
  void *v6;

  if (-[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems"))
  {
    return 0;
  }
  -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "count") > a3;

  return v5;
}

- (NSIndexSet)visibleItemIndexes
{
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](self->_visibleItemIndexes, "copy");
}

- (NSArray)visibleItems
{
  void *v3;
  void *v4;

  -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", self->_visibleItemIndexes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setItemAtIndex:(unint64_t)a3 isVisible:(BOOL)a4
{
  NSMutableIndexSet *visibleItemIndexes;

  visibleItemIndexes = self->_visibleItemIndexes;
  if (a4)
    -[NSMutableIndexSet addIndex:](visibleItemIndexes, "addIndex:", a3);
  else
    -[NSMutableIndexSet removeIndex:](visibleItemIndexes, "removeIndex:", a3);
}

- (void)setItemAtIndex:(unint64_t)a3 isOccluded:(BOOL)a4
{
  NSMutableIndexSet *occludedItemIndexes;

  occludedItemIndexes = self->_occludedItemIndexes;
  if (a4)
    -[NSMutableIndexSet addIndex:](occludedItemIndexes, "addIndex:", a3);
  else
    -[NSMutableIndexSet removeIndex:](occludedItemIndexes, "removeIndex:", a3);
}

- (id)indexesOfItemsVisibleInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    if (self->_expandedItemIsCentered)
    {
      -[SFUnifiedTabBarLayout _pinnedActiveItemOffsetSquishingActiveItem:activeItemFrame:](self, "_pinnedActiveItemOffsetSquishingActiveItem:activeItemFrame:", 0, 0);
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex");
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v13, "addIndex:", v14);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v30 = CGRectInset(v29, self->_scrollSlowingInset * -1.57079633, 0.0);
    v15 = v30.origin.x;
    v16 = v30.origin.y;
    v17 = v30.size.width;
    v18 = v30.size.height;
    -[SFUnifiedTabBarItemArrangement allItemIndexes](self->_itemArrangement, "allItemIndexes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __53__SFUnifiedTabBarLayout_indexesOfItemsVisibleInRect___block_invoke;
    v22[3] = &unk_1E21E3EA8;
    v24 = v11;
    v25 = v15;
    v26 = v16;
    v27 = v17;
    v28 = v18;
    v22[4] = self;
    v23 = v13;
    v20 = v13;
    -[SFUnifiedTabBarLayout _enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:](self, "_enumerateFramesForItemsAtIndexes:pinActiveItem:usingBlock:", v19, 0, v22);

    v12 = (void *)objc_msgSend(v20, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

void __53__SFUnifiedTabBarLayout_indexesOfItemsVisibleInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  _BYTE *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  CGRect v19;

  v18 = a2;
  v13 = *(_BYTE **)(a1 + 32);
  if (v13[192])
  {
    objc_msgSend(v13, "_slideFrame:forItemAtIndex:pinnedActiveItemOffset:", a3, a4, a5, a6, a7, *(double *)(a1 + 48));
    a4 = v14;
    a5 = v15;
    a6 = v16;
    a7 = v17;
  }
  v19.origin.x = a4;
  v19.origin.y = a5;
  v19.size.width = a6;
  v19.size.height = a7;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v19))
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);

}

- (id)itemsVisibleInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarLayout indexesOfItemsVisibleInRect:](self, "indexesOfItemsVisibleInRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectsAtIndexes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CGRect)_safeArea
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double width;
  double v9;
  double height;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  if (CGRectIsNull(self->_visibleRectOverride))
  {
    -[UIScrollView bounds](self->_scrollView, "bounds");
    x = v3;
    y = v5;
    width = v7;
    height = v9;
  }
  else
  {
    x = self->_visibleRectOverride.origin.x;
    y = self->_visibleRectOverride.origin.y;
    width = self->_visibleRectOverride.size.width;
    height = self->_visibleRectOverride.size.height;
  }
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v12 = x + v11;
  v14 = y + v13;
  v16 = width - (v11 + v15);
  v18 = height - (v13 + v17);
  -[SFUnifiedTabBarLayout _contentArea](self, "_contentArea");
  v23 = _SFFlipRectInCoordinateSpace(self->_flipped, v12, v14, v16, v18, v19, v20, v21, v22);
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)_unpinnedItemSafeArea
{
  double v2;
  double v3;
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
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[SFUnifiedTabBarLayout _safeArea](self, "_safeArea");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  UIEdgeInsetsMakeWithEdges();
  v11 = v5 + v10;
  v14 = v7 - (v12 + v13);
  v16 = v9 - (v10 + v15);
  v17 = v3 + v12;
  v18 = v11;
  v19 = v14;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_activeItemPinnableArea
{
  double v3;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[SFUnifiedTabBarLayout _unpinnedItemSafeArea](self, "_unpinnedItemSafeArea");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFUnifiedTabBarLayout _insetsForActiveItemPinnableArea](self, "_insetsForActiveItemPinnableArea");
  v12 = v6 + v11;
  v15 = v8 - (v13 + v14);
  v17 = v10 - (v11 + v16);
  v18 = v4 + v13;
  v19 = v12;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_contentArea
{
  double v2;
  double v3;
  double width;
  double height;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIEdgeInsets)_insetsForActiveItemPinnableArea
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  double v10;
  double *v11;
  double v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  if (-[SFUnifiedTabBarLayout _activeItemIsPinned](self, "_activeItemIsPinned")
    || (v3 = -[SFUnifiedTabBarItemArrangement activeItemIndex](self->_itemArrangement, "activeItemIndex"),
        v3 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v4 = *MEMORY[0x1E0DC49E8];
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v8 = v3;
    -[SFUnifiedTabBarLayout _insetToRevealNextItem](self, "_insetToRevealNextItem");
    v10 = v9;
    v11 = (double *)MEMORY[0x1E0DC49E8];
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    if (-[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems"))
    {
      v13 = 0;
    }
    else
    {
      -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "count");

    }
    v4 = *v11;
    v7 = v11[2];
    if (v8 > v13)
      v5 = v10;
    -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count") - 1;

    if (v8 >= v16)
      v6 = v12;
    else
      v6 = v10;
  }
  v17 = v4;
  v18 = v5;
  v19 = v7;
  result.right = v6;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (double)_effectiveMinimumActiveItemWidth
{
  double v3;
  double v4;
  double Width;
  double v6;
  CGRect v8;

  -[SFUnifiedTabBarMetrics minimumActiveItemWidth](self->_barMetrics, "minimumActiveItemWidth");
  v4 = v3;
  -[SFUnifiedTabBarLayout _safeArea](self, "_safeArea");
  Width = CGRectGetWidth(v8);
  -[SFUnifiedTabBarMetrics minimumActiveItemWidthRatio](self->_barMetrics, "minimumActiveItemWidthRatio");
  return fmin(v4, Width * v6);
}

- (double)_minimumItemSpacing
{
  double result;

  -[SFUnifiedTabBarMetrics minimumItemSpacing](self->_barMetrics, "minimumItemSpacing");
  return result;
}

- (double)_maximumItemSpacing
{
  double result;

  -[SFUnifiedTabBarMetrics maximumItemSpacing](self->_barMetrics, "maximumItemSpacing");
  return result;
}

- (double)_minimumHorizontalOffsetForOccludedItems
{
  double itemSpacing;
  double v3;

  itemSpacing = self->_itemSpacing;
  -[SFUnifiedBarMetrics cutoutBorderWidth](self->_barMetrics, "cutoutBorderWidth");
  return itemSpacing - v3 + 1.0;
}

- (double)_insetToRevealNextItem
{
  double result;

  -[SFUnifiedTabBarMetrics insetToRevealNextItem](self->_barMetrics, "insetToRevealNextItem");
  return result;
}

- (BOOL)centersActiveItemWhenExpanded
{
  void *v3;
  uint64_t v4;
  double v6;
  double v7;
  double v8;

  -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 0;
  -[SFUnifiedTabBarMetrics maximumActiveItemWidth](self->_barMetrics, "maximumActiveItemWidth");
  v7 = v6;
  -[SFUnifiedTabBarLayout _maximumActiveItemWidthForCenteringExpandedItem](self, "_maximumActiveItemWidthForCenteringExpandedItem");
  return v7 <= v8;
}

- (BOOL)horizontalSpaceIsExtremelyConstrained
{
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v10;

  -[SFUnifiedTabBarLayout _activeItemPinnableArea](self, "_activeItemPinnableArea");
  Width = CGRectGetWidth(v10);
  -[SFUnifiedTabBarLayout _effectiveMinimumActiveItemWidth](self, "_effectiveMinimumActiveItemWidth");
  v5 = Width - v4;
  -[SFUnifiedTabBarMetrics minimumInactiveItemWidth](self->_barMetrics, "minimumInactiveItemWidth");
  v7 = v6;
  -[SFUnifiedTabBarMetrics minimumItemSpacing](self->_barMetrics, "minimumItemSpacing");
  return v5 < v8 + v7 * 2.0;
}

- (double)_maximumActiveItemWidthForCenteringExpandedItem
{
  CGRect v3;

  -[SFUnifiedTabBarLayout _safeArea](self, "_safeArea");
  return CGRectGetWidth(v3) + -302.0;
}

- (CGPoint)_midpointForCenteredContentInScrollView
{
  UIScrollView *scrollView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  scrollView = self->_scrollView;
  -[UIScrollView superview](scrollView, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView convertPoint:fromView:](scrollView, "convertPoint:fromView:", v4, self->_midpointForCenteredContent.x, self->_midpointForCenteredContent.y);
  v6 = v5;
  v8 = v7;

  if (self->_flipped)
    v6 = self->_contentSize.width - v6;
  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (SFUnifiedTabBarItemArrangement)itemArrangement
{
  return self->_itemArrangement;
}

- (SFUnifiedTabBarMetrics)barMetrics
{
  return self->_barMetrics;
}

- (CGPoint)midpointForCenteredContent
{
  double x;
  double y;
  CGPoint result;

  x = self->_midpointForCenteredContent.x;
  y = self->_midpointForCenteredContent.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMidpointForCenteredContent:(CGPoint)a3
{
  self->_midpointForCenteredContent = a3;
}

- (BOOL)contentIsCentered
{
  return self->_contentIsCentered;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (SFUnifiedBarItem)hoveringItem
{
  return self->_hoveringItem;
}

- (void)setHoveringItem:(id)a3
{
  objc_storeStrong((id *)&self->_hoveringItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoveringItem, 0);
  objc_storeStrong((id *)&self->_barMetrics, 0);
  objc_storeStrong((id *)&self->_itemArrangement, 0);
  objc_storeStrong((id *)&self->_occludedItemIndexes, 0);
  objc_storeStrong((id *)&self->_visibleItemIndexes, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
