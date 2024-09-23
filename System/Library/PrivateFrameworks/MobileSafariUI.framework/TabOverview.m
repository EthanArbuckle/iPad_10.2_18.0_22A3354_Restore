@implementation TabOverview

- (void)addPresentationObserver:(id)a3
{
  -[NSHashTable addObject:](self->_presentationObservers, "addObject:", a3);
}

- (void)setTargetItemLiftsFromGrid:(BOOL)a3
{
  self->_targetItemLiftsFromGrid = a3;
}

- (void)setBarPlacement:(int64_t)a3
{
  if (self->_barPlacement != a3)
  {
    self->_barPlacement = a3;
    -[TabOverviewToolbar setPlacement:](self->_header, "setPlacement:");
    self->_needsResizeHeaderItems = 1;
    -[TabOverview setNeedsLayout](self, "setNeedsLayout");
    if (self->_barPlacement)
    {
      if ((-[TabOverview _isDismissibleSearchBarAvailable]((uint64_t)self) & 1) == 0)
      {
        if (-[SFTabOverviewSearchBar isFirstResponder](self->_searchBar, "isFirstResponder"))
          -[SFTabOverviewSearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
      }
    }
  }
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (BOOL)allowsInteractivePresentation
{
  return self->_allowsInteractivePresentation;
}

- (BOOL)showsLockedPrivateBrowsingView
{
  return self->_lockedPrivateBrowsingView != 0;
}

- (void)setShowsLockedPrivateBrowsingView:(BOOL)a3 withUnlockHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  SFLockedPrivateBrowsingView *lockedPrivateBrowsingView;
  BOOL v8;
  SFLockedPrivateBrowsingView *v9;
  void *v10;
  void *v11;
  SFLockedPrivateBrowsingView *v12;
  SFLockedPrivateBrowsingView *v13;
  SFLockedPrivateBrowsingView *v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v6 = a4;
  lockedPrivateBrowsingView = self->_lockedPrivateBrowsingView;
  if (lockedPrivateBrowsingView)
    v8 = 1;
  else
    v8 = !v4;
  if (v8)
  {
    if (lockedPrivateBrowsingView && !v4)
    {
      -[SFLockedPrivateBrowsingView removeFromSuperview](lockedPrivateBrowsingView, "removeFromSuperview");
      v9 = self->_lockedPrivateBrowsingView;
      self->_lockedPrivateBrowsingView = 0;

      -[TabOverview _setShowingSearchExplanationView:]((unsigned __int8 *)self, -[SFTabCollectionSearchController hasEmptyResults](self->_searchController, "hasEmptyResults"));
    }
    if (!v6)
      goto LABEL_12;
  }
  else
  {
    v12 = [SFLockedPrivateBrowsingView alloc];
    -[TabOverview bounds](self, "bounds");
    v13 = -[SFLockedPrivateBrowsingView initWithFrame:style:](v12, "initWithFrame:style:", 1);
    v14 = self->_lockedPrivateBrowsingView;
    self->_lockedPrivateBrowsingView = v13;

    -[TabOverview addSubview:](self, "addSubview:", self->_lockedPrivateBrowsingView);
    if (!v6)
    {
LABEL_12:
      -[SFLockedPrivateBrowsingView setUnlockAction:](self->_lockedPrivateBrowsingView, "setUnlockAction:", 0);
      goto LABEL_13;
    }
  }
  v10 = (void *)MEMORY[0x1E0DC3428];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__TabOverview_setShowsLockedPrivateBrowsingView_withUnlockHandler___block_invoke;
  v15[3] = &unk_1E9CF5BA8;
  v16 = v6;
  objc_msgSend(v10, "actionWithHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFLockedPrivateBrowsingView setUnlockAction:](self->_lockedPrivateBrowsingView, "setUnlockAction:", v11);

LABEL_13:
}

- (void)setItems:(id)a3 alternateItems:(id)a4 atPosition:(int64_t)a5
{
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  _BOOL4 v11;
  char v12;
  NSArray **p_items;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  TabOverviewItem *v24;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  uint64_t v32;
  id v33;
  NSArray *v34;
  NSArray *alternateItems;
  void *v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  objc_class *v43;
  void *v44;
  uint64_t v45;
  NSArray *v46;
  id *v47;
  NSArray *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = (NSArray *)a3;
  v9 = (NSArray *)a4;
  v10 = v9;
  if (self->_alternateItems == v9)
  {
    p_items = &self->_items;
    if (self->_items == v8)
      goto LABEL_9;
    v12 = 1;
    goto LABEL_7;
  }
  v11 = -[NSArray isEqualToArray:](v9, "isEqualToArray:");
  v12 = v11;
  p_items = &self->_items;
  if (self->_items != v8)
  {
LABEL_7:
    if (!-[NSArray isEqualToArray:](v8, "isEqualToArray:") || (v12 & 1) == 0)
      goto LABEL_12;
    goto LABEL_9;
  }
  if (!v11)
    goto LABEL_12;
LABEL_9:
  if (self->_alternateItemPosition != a5)
  {
LABEL_12:
    v48 = v10;
    self->_updatingAlternateItemPosition = self->_alternateItemPosition != a5;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v14 = *p_items;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v65 != v17)
            objc_enumerationMutation(v14);
          -[TabOverview _startClosingItem:]((uint64_t)self, *(void **)(*((_QWORD *)&v64 + 1) + 8 * i));
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (id *)p_items;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *p_items);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v46 = v8;
    v19 = v8;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v61 != v22)
            objc_enumerationMutation(v19);
          v24 = *(TabOverviewItem **)(*((_QWORD *)&v60 + 1) + 8 * j);
          -[TabOverviewItem setIsAlternateItem:]((uint64_t)v24, 0);
          if (v24 != self->_swipeClosingItem)
            -[TabOverviewItem setClosing:]((uint64_t)v24, 0);
          v59 = 0;
          -[TabOverview _initializeIncomingItemIfNecessary:fromItems:oldItems:atPosition:isIncoming:]((uint64_t)self, v24, v19, v50, 0, &v59);
          if (v59)
          {
            -[TabOverviewItem setIncoming:]((uint64_t)v24, 1);
            objc_msgSend(v49, "addObject:", v24);
          }
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      }
      while (v21);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_alternateItems);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v26 = v48;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v56;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v56 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
          -[TabOverviewItem setIsAlternateItem:]((uint64_t)v31, 1);
          -[TabOverviewItem setClosing:]((uint64_t)v31, 0);
          -[TabOverview _initializeIncomingItemIfNecessary:fromItems:oldItems:atPosition:isIncoming:]((uint64_t)self, v31, v26, v25, a5, 0);
        }
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
      }
      while (v28);
    }

    self->_shouldBounceToConstrainedLocation = 0;
    -[TabOverviewInterpolatedLocation setDecelerationFactor:](self->_interpolatedLocation, "setDecelerationFactor:", 0.988);
    v32 = -[NSArray copy](v19, "copy");
    v33 = *v47;
    *v47 = (id)v32;

    v34 = (NSArray *)-[NSArray copy](v26, "copy");
    alternateItems = self->_alternateItems;
    self->_alternateItems = v34;

    self->_alternateItemPosition = a5;
    -[TabOverview _updatePinnedItemCount]((uint64_t)self);
    -[TabOverview setNeedsLayout](self, "setNeedsLayout");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v45 = 440;
    v37 = self->_displayedItems;
    v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v52;
      do
      {
        for (m = 0; m != v39; ++m)
        {
          if (*(_QWORD *)v52 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * m);
          if ((objc_msgSend(v42, "isPlaceholder", v45) & 1) == 0
            && (-[NSArray containsObject:](v19, "containsObject:", v42)
             || -[NSArray containsObject:](v26, "containsObject:", v42)
             || -[TabOverviewItem closing]((_BOOL8)v42)))
          {
            if ((objc_msgSend(v36, "containsObject:", v42) & 1) == 0)
              objc_msgSend(v36, "addObject:", v42);
          }
          else
          {
            -[TabOverview _removeViewsForItem:]((uint64_t)self, v42);
          }
        }
        v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
      }
      while (v39);
    }

    v43 = (objc_class *)objc_msgSend(v36, "copy");
    v44 = *(Class *)((char *)&self->super.super.super.isa + v45);
    *(Class *)((char *)&self->super.super.super.isa + v45) = v43;

    self->_displayedItemsNeedUpdate = 1;
    -[TabOverview _updateIndexesMatchingSearch]((uint64_t)self);
    if ((unint64_t)objc_msgSend(*v47, "count") <= 1
      && -[SFTabCollectionSearchController isSearching](self->_searchController, "isSearching"))
    {
      -[SFTabCollectionSearchController endSearching](self->_searchController, "endSearching");
    }
    v8 = v46;
    v10 = v48;
    if ((objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled", v45) & 1) == 0)
    {
      -[TabOverview layoutIfNeeded](self, "layoutIfNeeded");
      -[TabOverview endAnimation](self, "endAnimation");
    }

    goto LABEL_57;
  }
  if (-[TabOverview _updatePinnedItemCount]((uint64_t)self))
    -[TabOverview setNeedsLayout](self, "setNeedsLayout");
LABEL_57:

}

- (void)setItems:(id)a3
{
  -[TabOverview setItems:alternateItems:atPosition:](self, "setItems:alternateItems:atPosition:", a3, self->_alternateItems, self->_alternateItemPosition);
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)_updatePinnedItemCount
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 v4;

  if (!a1)
    return 0;
  v2 = countPinnedItems(*(void **)(a1 + 1176));
  v3 = countPinnedItems(*(void **)(a1 + 1176));
  v4 = *(_QWORD *)(a1 + 1120) != v2 || *(_QWORD *)(a1 + 1128) != v3;
  *(_QWORD *)(a1 + 1120) = v2;
  *(_QWORD *)(a1 + 1128) = v3;
  return v4;
}

- (void)endAnimation
{
  if (self->_displayLink)
    -[TabOverview _resetToSteadyState]((uint64_t)self);
}

- (unint64_t)estimatedSnapshotsPerPageForBounds:(CGRect)a3 withTraitCollection:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSString *v8;
  uint64_t v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  float v18;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a4, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  UIContentSizeCategoryIsAccessibilityCategory(v8);
  v9 = +[TabOverview _tabsPerRowForBounds:isAccessibilityContentSizeCategory:]();

  v10 = +[TabOverview _itemReferenceBoundsForBounds:](x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v17 = CGRectGetHeight(v20);
  v21.origin.x = v10;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  v18 = v17 / CGRectGetHeight(v21) * (double)(unint64_t)v9;
  return (unint64_t)(float)(ceilf(v18) * (float)(unint64_t)v9);
}

- (double)_itemReferenceBounds
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v6;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "bounds");
  v6 = +[TabOverview _itemReferenceBoundsForBounds:](v2, v3, v4, v5);
  if (-[TabOverview _itemSnapshotsShouldPreserveAspectRatio](a1))
  {
    -[TabOverview _itemHeaderHeight]((uint64_t)a1);
    objc_msgSend(a1[139], "titlePadding");
    objc_msgSend(a1[139], "titleHeight");
    -[TabOverview _thumbnailScaleWithTabLayout:]((uint64_t)a1, 0);
  }
  return v6;
}

+ (CGFloat)_itemReferenceBoundsForBounds:(CGFloat)a3
{
  CGRect v9;
  CGRect v10;

  objc_opt_self();
  v9.origin.x = a1;
  v9.origin.y = a2;
  v9.size.width = a3;
  v9.size.height = a4;
  CGRectGetHeight(v9);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetWidth(v10);
  return a1;
}

- (void)_itemSnapshotsShouldPreserveAspectRatio
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v5;
  CGRect v6;
  CGRect v7;

  if (result)
  {
    objc_msgSend(result, "bounds");
    x = v6.origin.x;
    y = v6.origin.y;
    width = v6.size.width;
    height = v6.size.height;
    v5 = CGRectGetWidth(v6);
    v7.origin.x = x;
    v7.origin.y = y;
    v7.size.width = width;
    v7.size.height = height;
    return (void *)(v5 / CGRectGetHeight(v7) > 1.6);
  }
  return result;
}

- (double)_targetLocationForItemAtIndex:(uint64_t)a3 inNumberOfItems:(uint64_t)a4 insertionStyle:(unint64_t)a5 pinnedItemCount:
{
  double v10;
  double v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double Width;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  unint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  int v47;
  double v48;
  double v49;
  double v51;
  double v52;
  double v53;
  unint64_t v54;
  CGRect v55;
  CGRect v56;

  if (!a1)
    return 0.0;
  -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:]((_QWORD *)a1, a3, a5);
  v11 = v10;
  v12 = -[TabOverview _tabsPerRow](a1);
  v13 = -[TabOverview _itemReferenceBounds]((id *)a1);
  v15 = v14;
  v17 = v16;
  v18 = v16 / v11;
  v20 = v19 / v11;
  v21 = objc_msgSend(*(id *)(a1 + 1176), "count");
  if (v21 <= 1)
    v22 = 1;
  else
    v22 = v21;
  v54 = v22;
  v23 = -[TabOverview _layoutIndexForItemIndex:pinnedItemCount:](a1, a2, a5);
  v24 = v23 / v12;
  v25 = v23 % v12;
  v26 = *(_QWORD *)(a1 + 1232);
  v27 = v13 + (double)(v23 % v12) * (v18 + v18 * dbl_1D7EA8A10[v26 == 0]);
  if (v26)
  {
    -[TabOverview _isDismissibleSearchBarAvailable](a1);
  }
  else
  {
    v27 = v27 + (v17 - -[TabOverview _totalWidthOfItemsWithCount:pinnedItemCount:]((_QWORD *)a1, a3, a5) / v11) * 0.5;
    v28 = dbl_1D7EA8A10[*(_QWORD *)(a1 + 1232) == 0];
    v29 = -[TabOverview _effectiveSafeAreaInsets](a1) + v18 * v28;
    -[TabOverview _barInsets](a1);
    v15 = v15 + -[TabOverview _titleHeight]((id *)a1) + v29 + v30;
    if (-[TabOverview _isDismissibleSearchBarAvailable](a1))
      v15 = v15 + *(double *)(a1 + 1080);
  }
  v55.origin.x = v27;
  v55.origin.y = v15;
  v55.size.width = v18;
  v55.size.height = v20;
  Width = CGRectGetWidth(v55);
  if (!*(_QWORD *)(a1 + 1232))
  {
    v53 = Width * 0.1;
    if (a2 >= a5)
    {
      v38 = (double)(unint64_t)-[TabOverview _layoutIndexForItemIndexIgnoringPinnedItems:](a1, a5) / (double)v12;
      v39 = vcvtpd_u64_f64(v38);
      v52 = (double)(unint64_t)ceil(v38);
      objc_msgSend(*(id *)(a1 + 1112), "titlePadding");
      v41 = v40;
      v43 = v42;
      objc_msgSend(*(id *)(a1 + 1112), "titleHeight");
      v51 = v53 + fmax(v43 + v41 + v44, 30.0);
      v56.origin.x = v27;
      v56.origin.y = v15;
      v56.size.width = v18;
      v56.size.height = v20;
      Width = (v53 + CGRectGetHeight(v56)) * (double)(v24 - v39) + v52 * v51;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 1112), "titlePadding");
      v34 = v33;
      v36 = v35;
      objc_msgSend(*(id *)(a1 + 1112), "titleHeight");
      Width = v53 + fmax(v36 + v34 + v37, 30.0);
    }
  }
  if (a4 == 1 && objc_msgSend((id)a1, "presentationState", Width) != 3)
  {
    v45 = 30.0 / v11;
    v46 = (1.0 - 1.0 / (30.0 / v11)) * v18 * 0.5;
    if (v25 >= v54)
      v46 = -0.0;
    v27 = v27 + v46;
    v18 = v18 / v45;
    v11 = v11 * v45;
  }
  v47 = objc_msgSend((id)a1, "_sf_usesLeftToRightLayout", *(_QWORD *)&v51);
  v48 = v17 - v27 - v18;
  if (v47)
    v48 = v27;
  v49 = -(v48 * v11);
  log(v11);
  return v49;
}

- (double)_totalWidthOfItemsWithCount:(int64_t)a3 pinnedItemCount:
{
  unint64_t v6;
  double Width;
  unint64_t v8;
  CGRect v10;

  if (!a1)
    return 0.0;
  v6 = -[TabOverview _tabsPerRow]((uint64_t)a1);
  objc_msgSend(a1, "bounds");
  Width = CGRectGetWidth(v10);
  v8 = a2 - a3;
  if (a2 - a3 <= a3)
    v8 = a3;
  if (v8 >= v6)
    v8 = v6;
  if (v8 <= 1)
    v8 = 1;
  return Width * (double)(v8 - 1) * dbl_1D7EA8A10[a1[154] == 0] + (double)v8 * Width;
}

+ (uint64_t)_tabsPerRowForBounds:isAccessibilityContentSizeCategory:
{
  objc_opt_self();
  SFTabOverviewMinimumItemWidthForBounds();
  return SFTabOverviewNumberOfColumns();
}

- (uint64_t)_tabsPerRow
{
  if (result)
  {
    if (*(_QWORD *)(result + 1232))
    {
      return -1;
    }
    else
    {
      objc_msgSend((id)result, "bounds");
      return +[TabOverview _tabsPerRowForBounds:isAccessibilityContentSizeCategory:]();
    }
  }
  return result;
}

- (void)_thumbnailScaleOfItemsWithCount:(int64_t)a3 pinnedItemCount:
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double x;
  double y;
  double width;
  double height;
  double v16;
  CGRect v17;
  CGRect v18;

  if (a1)
  {
    if (!a1[154])
    {
      v6 = -[TabOverview _effectiveSafeAreaInsets]((uint64_t)a1);
      v8 = v7;
      v16 = v9;
      v11 = v10;
      objc_msgSend(a1, "bounds");
      x = v17.origin.x;
      y = v17.origin.y;
      width = v17.size.width;
      height = v17.size.height;
      CGRectGetWidth(v17);
      v18.origin.x = v8 + x;
      v18.origin.y = v6 + y;
      v18.size.width = width - (v8 + v11);
      v18.size.height = height - (v6 + v16);
      CGRectGetWidth(v18);
      -[TabOverview _totalWidthOfItemsWithCount:pinnedItemCount:](a1, a2, a3);
    }
  }
}

- (double)_effectiveSafeAreaInsets
{
  id WeakRetained;
  double v3;
  double v4;

  if (!a1)
    return 0.0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
  objc_msgSend(WeakRetained, "effectiveSafeAreaInsetsForTabCollectionView:", a1);
  v4 = v3;

  return v4;
}

- (uint64_t)_isDismissibleSearchBarAvailable
{
  uint64_t v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 1224))
    {
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 1176), "count") <= 1)
      {
        objc_msgSend(*(id *)(v1 + 688), "text");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v1 = objc_msgSend(v2, "length") != 0;

      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (uint64_t)_layoutIndexForItemIndex:(unint64_t)a3 pinnedItemCount:
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (!a1)
    return 0;
  v6 = -[TabOverview _layoutIndexForItemIndexIgnoringPinnedItems:](a1, a2);
  if (a2 >= a3 && !*(_QWORD *)(a1 + 1232))
  {
    v7 = -[TabOverview _layoutIndexForItemIndexIgnoringPinnedItems:](a1, a3);
    v8 = -[TabOverview _tabsPerRow](a1);
    if (v7 % v8)
      return v8 + v6 - v7 % v8;
  }
  return v6;
}

- (uint64_t)_layoutIndexForItemIndexIgnoringPinnedItems:(uint64_t)a1
{
  void *v4;

  if (!a1)
    return 0;
  if (objc_msgSend(*(id *)(a1 + 760), "isSearching"))
  {
    objc_msgSend(*(id *)(a1 + 760), "indexesMatchingSearchTerm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    a2 = objc_msgSend(v4, "countOfIndexesInRange:", 0, a2);

  }
  return a2;
}

- (void)_barInsets
{
  uint64_t v2;
  CGRect v3;
  CGRect v4;
  CGRect v5;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 1224);
    if (v2 != 2)
    {
      if (v2 == 1)
      {
        objc_msgSend((id)a1, "bounds");
        CGRectGetHeight(v4);
        objc_msgSend(*(id *)(a1 + 680), "frame");
        CGRectGetMinY(v5);
      }
      else if (!v2)
      {
        objc_msgSend(*(id *)(a1 + 680), "frame");
        CGRectGetMaxY(v3);
      }
    }
  }
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[TabOverview title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_titleLabel, "setText:", v6);
    -[TabOverview setNeedsLayout](self, "setNeedsLayout");
  }

}

- (double)_titleHeight
{
  double v1;
  void *v3;
  uint64_t v4;
  CGRect v6;

  v1 = 0.0;
  if (a1)
  {
    objc_msgSend(a1, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      objc_msgSend(a1[88], "bounds");
      return CGRectGetHeight(v6) + 44.0;
    }
  }
  return v1;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)_layoutDisplayedItem:(char)a3 forceVisible:
{
  id *v5;
  double v6;
  double v7;
  long double v8;
  long double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  long double v18;
  long double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  id WeakRetained;
  void *v25;
  id *v26;
  id *v27;
  id *v28;
  double (**v29)(double);
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  void *v44;
  CGFloat v45;
  double v46;
  double v47;
  uint64_t v48;
  CGFloat v49;
  double v50;
  int shouldDimItemsFor;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  _BOOL8 v73;
  void *v74;
  void *v75;
  double x;
  double y;
  double width;
  double height;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  void *v92;
  _BOOL4 v93;
  void *v94;
  void *v95;
  char v96;
  _BOOL4 v97;
  int v98;
  int v99;
  int v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  id *v106;
  void *v107;
  double v108;
  double v109;
  _BOOL8 v110;
  void *v111;
  void *v112;
  int v113;
  double v114;
  int v115;
  double v116;
  char v117;
  CGFloat v118;
  CGFloat v119;
  double v120;
  double v121;
  id *v122;
  void *v123;
  id *v124;
  double v125;
  double v126;
  double v127;
  CATransform3D v128;
  CATransform3D v129;
  CATransform3D v130;
  CATransform3D v131;
  CATransform3D v132;
  CATransform3D v133;
  _QWORD aBlock[5];
  id *v135;
  id *v136;
  uint64_t v137;
  uint64_t v138;
  double v139;
  long double v140;
  double v141;
  long double v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;

  v5 = a2;
  if (!a1)
    goto LABEL_56;
  objc_msgSend(*(id *)(a1 + 432), "location");
  v7 = v6;
  v9 = exp(v8);
  -[TabOverviewItem layoutInfo](v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "location");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v127 = exp(v18);
  -[TabOverviewItem layoutInfo](v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedBoundsLogScale]((uint64_t)v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[TabOverviewInterpolatedValue value]((uint64_t)v21);
  v23 = exp(v22);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
  v25 = *(void **)(a1 + 488);
  v123 = WeakRetained;
  v117 = a3;
  v120 = v7;
  if (v25)
  {
    v26 = v25;
  }
  else
  {
    objc_msgSend(WeakRetained, "currentItemForTabOverview:", a1);
    v26 = (id *)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__TabOverview__layoutDisplayedItem_forceVisible___block_invoke;
  aBlock[3] = &unk_1E9CFAF00;
  aBlock[4] = a1;
  v28 = v5;
  v135 = v28;
  v122 = v27;
  v124 = v27;
  v136 = v124;
  v137 = v13;
  v138 = v15;
  v139 = v17;
  v140 = v19;
  v141 = v127;
  v142 = v9;
  v29 = (double (**)(double))_Block_copy(aBlock);
  v30 = v29[2](v127);
  v119 = v9;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v125 = v23;
  v37 = ((double (*)(double (**)(double), double))v29[2])(v29, v23);
  v126 = v17;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  -[TabOverviewItem layoutInfo](v28);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v37;
  v46 = v126;
  -[TabOverviewItemLayoutInfo setFrame:]((uint64_t)v44, v45, v39, v41, v43);

  v47 = v126 - v120 + fmin(v32 / -[TabOverview _bottomEdgeOfTabs](a1), 1.0);
  v48 = objc_msgSend(v28, "dragState");
  memset(&v133, 0, sizeof(v133));
  v118 = v32;
  if (v48 == 1 || objc_msgSend(v28, "dragState") == 3)
  {
    -[TabOverview _thumbnailTransformForFrame:withScale:atZPosition:]((CATransform3D *)a1, (uint64_t)&v133, v30, v32, v34, v36, v119, v47 - v126);
  }
  else
  {
    -[TabOverview _thumbnailTransformForFrame:withScale:atZPosition:]((CATransform3D *)a1, (uint64_t)&v132, v30, v32, v34, v36, v119, v47);
    v133 = v132;
  }
  v49 = v30;
  v50 = v125;
  shouldDimItemsFor = -[TabOverview _shouldDimItemsForSearch](a1);
  v52 = 0.0;
  v53 = 0.5;
  if (!shouldDimItemsFor)
    v53 = 0.0;
  v54 = fmax(1.0 - 200.0 / (200.0 - v126), 0.0) + v53;
  -[TabOverviewItem layoutInfo](v28);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo setDimmingAlpha:animated:]((uint64_t)v55, *(_BYTE *)(a1 + 768), v54);

  if (-[TabOverview _itemShouldBeTransparent:](a1, v28) == 0.0)
  {
    if (objc_msgSend((id)a1, "targetItemLiftsFromGrid"))
    {
      -[TabOverviewItem layoutInfo](v124);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v57);
      _SFClamp();

      _SFInterpolate();
    }
    _SFClampPercent();
    v59 = v58;
    objc_msgSend((id)a1, "bounds");
    v60 = SFTabOverviewMaximumNumberOfColumns();
    -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:]((_QWORD *)a1, v60, 0);
    _SFClampPercent();
    v61 = 1.0;
    v63 = v59 * (1.0 - v62);
    if (v48 == 1)
      v61 = 0.5;
    v52 = v61 * v63;
  }
  -[TabOverviewItem layoutInfo](v28);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo setAlpha:]((uint64_t)v64, v52);

  if (*(id **)(a1 + 488) == v28)
  {
    CATransform3DMakeScale(&v131, 1.0 / v125, 1.0 / v125, 1.0);
    -[TabOverviewItem layoutInfo](v28);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo borrowedContentView]((uint64_t)v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "layer");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = v131;
    objc_msgSend(v67, "setTransform:", &v130);

  }
  -[TabOverviewItem layoutInfo](v28);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[TabOverviewInterpolatedValue value]((uint64_t)v69);
  -[TabOverviewItem layoutInfo](v28);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo setSnapshotAlpha:]((uint64_t)v71, v70);

  -[TabOverviewItem layoutInfo](v28);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = -[TabOverviewItemLayoutInfo snapshotAlpha]((uint64_t)v72) == 1.0;
  -[TabOverviewItem layoutInfo](v28);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo borrowedContentView]((uint64_t)v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setHidden:", v73);

  if (CGFloatIsValid() && CGFloatIsValid())
  {
    v121 = v47;
    v132 = v133;
    CA_CGRectApplyTransform();
    v144 = CGRectOffset(v143, v49, v118);
    x = v144.origin.x;
    y = v144.origin.y;
    width = v144.size.width;
    height = v144.size.height;
    objc_msgSend((id)a1, "bounds");
    v81 = v80;
    v83 = v82;
    v85 = v84;
    v87 = v86;
    objc_msgSend(*(id *)(a1 + 736), "convertRect:toView:", a1, x, y, width, height);
    v146.origin.x = v88;
    v146.origin.y = v89;
    v146.size.width = v90;
    v146.size.height = v91;
    v145.origin.x = v81;
    v145.origin.y = v83;
    v145.size.width = v85;
    v145.size.height = v87;
    if (CGRectIntersectsRect(v145, v146))
    {
      -[TabOverviewItem layoutInfo](v28);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = -[TabOverviewItemLayoutInfo alpha]((uint64_t)v92) > 0.0;

    }
    else
    {
      v93 = 0;
    }
    v50 = v125;
    v46 = v126;
    v47 = v121;
  }
  else
  {
    v93 = 0;
  }
  if (-[TabOverviewItem isAlternateItem]((_BOOL8)v28))
  {
    -[TabOverviewItem layoutInfo](v28);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "isInSteadyStateWithConstraints:", 0);

  }
  else
  {
    v96 = 0;
  }
  if (objc_msgSend(v28, "dragState") == 2)
  {
    v97 = 1;
    if ((v96 & 1) == 0)
    {
LABEL_31:
      v98 = objc_msgSend(v28, "isPlaceholder");
      v99 = v98 ^ 1;
      if (((v98 | (v93 || v97)) & 1) == 0 && (v117 & 1) == 0)
      {
        v100 = objc_msgSend(*(id *)(a1 + 648), "containsObject:", v28);
        if (v48 == 1)
          v99 = 0;
        else
          v99 = v100;
      }
      goto LABEL_38;
    }
  }
  else
  {
    v97 = objc_msgSend(v28, "dragState") == 3;
    if ((v96 & 1) == 0)
      goto LABEL_31;
  }
  v99 = 0;
LABEL_38:
  -[TabOverviewItem layoutInfo](v28);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo setVisibleInTabOverview:]((uint64_t)v101, v99);

  v132 = v133;
  CATransform3DScale(&v129, &v132, v50 / v127, v50 / v127, 1.0);
  -[TabOverviewItem layoutInfo](v28);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v129;
  -[TabOverviewItemLayoutInfo setTransform:]((uint64_t)v102, &v128);

  if (objc_msgSend((id)a1, "targetItemLiftsFromGrid")
    && ((*(_QWORD *)(a1 + 1160) | 2) == 3 || *(_QWORD *)(a1 + 504))
    && v46 >= 0.0
    && v122 == v5)
  {
    v47 = 999.0;
  }
  -[TabOverviewItem layoutInfo](v28);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo setZPosition:]((uint64_t)v103, v47);

  objc_msgSend(v11, "targetLocation");
  v105 = v104;
  -[TabOverviewItem layoutInfo](v28);
  v106 = (id *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo itemView](v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v107, "setShadowOpacity:", fmax((v46 - v105) * 0.15 / 100.0, 0.0) + 0.2);
  -[TabOverview _itemHeaderHeight](a1);
  objc_msgSend(v107, "setTopBackdropHeight:");
  -[TabOverview _itemAdditionalHeaderHeight](a1);
  objc_msgSend(v107, "setAdditionalTopBackdropHeight:");
  objc_msgSend((id)a1, "bounds");
  objc_msgSend(v107, "setWindowSize:", v108, v109);
  v110 = objc_msgSend(v28, "dragState") == 2 && *(_QWORD *)(a1 + 1160) != 3 || objc_msgSend(v28, "dragState") == 1;
  objc_msgSend(v107, "setPreviewViewHidden:", v110);
  -[TabOverviewItem layoutInfo](v28);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedCornerRadius]((uint64_t)v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setCornerRadius:", v127 * -[TabOverviewInterpolatedValue value]((uint64_t)v112) / v50);

  objc_msgSend(v107, "setTabLayout:", *(_QWORD *)(a1 + 1232));
  if (v122 != v5 || (v114 = 0.0, !*(_BYTE *)(a1 + 671)))
  {
    if (!objc_msgSend(v28, "isPinned")
      || (v113 = objc_msgSend((id)a1, "targetItemLiftsFromGrid"), v114 = 1.0, v113))
    {
      v114 = -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v11);
    }
  }
  objc_msgSend(v107, "setTransitionProgress:", v114);
  v115 = objc_msgSend(v28, "isPinned");
  v116 = 0.0;
  if (v115)
    v116 = -[TabOverview _tabSpacing]((_QWORD *)a1) * -0.5;
  objc_msgSend(v107, "_setTouchInsets:", v116, 0.0, v116, 0.0);
  -[TabOverview _updateItemShowsCloseButton:](a1, v28);

LABEL_56:
}

- (BOOL)targetItemLiftsFromGrid
{
  return self->_targetItemLiftsFromGrid || self->_transitioningItemIsPinned;
}

- (id)_topBarThemeForItem:(id *)a1
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    WeakRetained = objc_loadWeakRetained(v2 + 146);
    objc_msgSend(WeakRetained, "tabOverview:topBarThemeForItem:", v2, v3);
    v2 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

double __49__TabOverview__layoutDisplayedItem_forceVisible___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  _QWORD *v9;
  id *v10;
  id *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v2 = -[TabOverview _itemReferenceBounds](*(id **)(a1 + 32));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = *(_QWORD **)(a1 + 32);
  if (v9 && !v9[154] && (objc_msgSend(v9, "targetItemLiftsFromGrid") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "isPinned"))
  {
    v10 = (id *)(a1 + 40);
  }
  else
  {
    v10 = (id *)(a1 + 48);
  }
  v11 = (id *)*v10;
  -[TabOverviewItem layoutInfo](v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewInterpolatedValue value]((uint64_t)v13);

  -[TabOverview _itemHeaderHeight](*(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  CGRectGetHeight(v18);
  v19.origin.x = v2;
  v19.origin.y = v4;
  v19.size.width = v6;
  v19.size.height = v8;
  CGRectGetHeight(v19);
  if (objc_msgSend(*(id *)(a1 + 40), "isPinned"))
  {
    v14 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v14 + 1232))
    {
      objc_msgSend(*(id *)(v14 + 1112), "titlePadding");
      objc_msgSend(*(id *)(v14 + 1112), "titleHeight");
      objc_msgSend(*(id *)(a1 + 32), "targetItemLiftsFromGrid");
    }
  }
  _SFInterpolate();
  v20.origin.x = v2;
  v20.origin.y = v4;
  v20.size.width = v6;
  v20.size.height = v8;
  CGRectGetWidth(v20);
  _SFRoundRectToPixels();
  v16 = v15;

  return v16;
}

- (void)_itemHeaderHeight
{
  id WeakRetained;

  if (a1)
  {
    if (*(double *)(a1 + 888) <= 0.0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
      objc_msgSend(WeakRetained, "tabCollectionViewItemHeaderHeight:", a1);

    }
  }
}

- (void)_itemAdditionalHeaderHeight
{
  id WeakRetained;

  if (a1 && *(double *)(a1 + 896) == 0.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabCollectionViewItemHeaderHeightIncludedInSnapshot:", a1);

  }
}

uint64_t __32__TabOverview__layOutTitleLabel__block_invoke(uint64_t a1)
{
  CGFloat x;
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat height;
  CGFloat v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  CGFloat v23;
  uint64_t v24;
  double v25;
  uint64_t result;
  double v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat rect;
  CGFloat width;
  CGFloat y;
  _QWORD v37[6];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  x = v44.origin.x;
  width = v44.size.width;
  y = v44.origin.y;
  rect = v44.size.height;
  v3 = CGRectGetWidth(v44);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "setBounds:", 0.0, 0.0, v3, v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "layoutIfNeeded");
  v6 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v14, "systemItem") != 6 && objc_msgSend(v14, "systemItem") != 5)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "_frameOfBarButtonItem:", v14);
          v53.origin.x = v6;
          v53.origin.y = v5;
          v53.size.width = v8;
          v53.size.height = height;
          v46 = CGRectUnion(v45, v53);
          v6 = v46.origin.x;
          v5 = v46.origin.y;
          v8 = v46.size.width;
          height = v46.size.height;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v11);
  }

  v15 = objc_msgSend(*(id *)(a1 + 32), "_sf_usesLeftToRightLayout");
  objc_msgSend(*(id *)(a1 + 32), "safeAreaInsets");
  v17 = v16;
  v18 = fmax(-[TabOverview _tabSpacing](*(_QWORD **)(a1 + 32)), v16);
  if ((v15 & 1) == 0)
  {
    v47.origin.x = v6;
    v47.origin.y = v5;
    v47.size.width = v8;
    v47.size.height = height;
    if (!CGRectIsEmpty(v47))
    {
      v48.origin.x = v6;
      v48.origin.y = v5;
      v48.size.width = v8;
      v48.size.height = height;
      v18 = fmax(v18, CGRectGetMaxX(v48));
    }
  }
  v32 = x;
  v49.origin.x = x;
  v49.size.width = width;
  v49.origin.y = y;
  v49.size.height = rect;
  v19 = CGRectGetWidth(v49);
  v20 = v19 - fmax(-[TabOverview _tabSpacing](*(_QWORD **)(a1 + 32)), v17);
  if (v15)
  {
    v50.origin.x = v6;
    v50.origin.y = v5;
    v50.size.width = v8;
    v50.size.height = height;
    if (!CGRectIsEmpty(v50))
    {
      v51.origin.x = v6;
      v51.origin.y = v5;
      v51.size.width = v8;
      v51.size.height = height;
      v20 = fmin(v20, CGRectGetMinX(v51));
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "location", *(_QWORD *)&v32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "location");
  exp(v21);
  v22 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "sizeThatFits:", v20 - v18, 0.0);
  _SFRoundRectToPixels();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "setFrame:");
  v52.origin.x = v33;
  v52.size.height = rect;
  v52.size.width = width;
  v52.origin.y = y;
  v23 = CGRectGetWidth(v52) * 0.5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "center");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "setCenter:", v23);
  if (*(_BYTE *)(a1 + 40))
  {
    v24 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v24 + 665))
    {
      v28 = *(_QWORD *)(v24 + 1160);
      if (v28)
      {
        if (v28 != 3)
        {
          if (!-[TabOverview _isDismissibleSearchBarAvailable](v24)
            || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 688), "text"),
                v29 = (void *)objc_claimAutoreleasedReturnValue(),
                v30 = objc_msgSend(v29, "length"),
                v29,
                !v30))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "targetLocation");
            _SFUninterpolate();
            v22 = v31;
          }
        }
      }
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "alpha");
  if (v25 != v22 || (result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "alpha"), v27 != v22))
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __32__TabOverview__layOutTitleLabel__block_invoke_2;
    v37[3] = &unk_1E9CF2538;
    v37[4] = *(_QWORD *)(a1 + 32);
    *(double *)&v37[5] = v22;
    return objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 50331648, v37, 0);
  }
  return result;
}

- (CGFloat)_tabSpacing
{
  uint64_t v2;
  double v3;
  CGRect v5;

  if (!a1)
    return 0.0;
  v2 = -[TabOverview _tabsPerRow]((uint64_t)a1);
  v3 = dbl_1D7EA8A10[a1[154] == 0];
  objc_msgSend(a1, "bounds");
  return CGRectGetWidth(v5) * v3 / ((double)(unint64_t)v2 + (double)(unint64_t)(v2 + 1) * v3);
}

- (CATransform3D)_thumbnailTransformForFrame:(CGFloat)a3@<D0> withScale:(CGFloat)a4@<D1> atZPosition:(CGFloat)a5@<D2>
{
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CATransform3D v33;
  CATransform3D v34;
  double v35;
  double v36;
  CGFloat v37;
  CGRect v38;
  CGRect v39;

  if (result)
  {
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    CATransform3DMakeScale((CATransform3D *)a2, a7, a7, a7);
    v36 = 0.0;
    v37 = 0.0;
    v35 = 0.0;
    SFTabOverviewScaleTranslationForZPosition();
    if (a8 >= 0.0)
    {
      v16 = *MEMORY[0x1E0D4F2E8] * a8;
      v38.origin.x = a3;
      v38.origin.y = a4;
      v38.size.width = a5;
      v38.size.height = a6;
      v15 = CGRectGetWidth(v38) * v16 * 0.5;
      v39.origin.x = a3;
      v39.origin.y = a4;
      v39.size.width = a5;
      v39.size.height = a6;
      v14 = v16 * CGRectGetHeight(v39) * 0.5;
      v35 = v15;
      v36 = v14;
    }
    else
    {
      v15 = v35;
      v14 = v36;
    }
    v17 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)&v33.m31 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)&v33.m33 = v17;
    v18 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)&v33.m41 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)&v33.m43 = v18;
    v19 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&v33.m11 = *(_OWORD *)a2;
    *(_OWORD *)&v33.m13 = v19;
    v20 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)&v33.m21 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)&v33.m23 = v20;
    CATransform3DTranslate(&v34, &v33, v15, v14, 0.0);
    v21 = *(_OWORD *)&v34.m33;
    *(_OWORD *)(a2 + 64) = *(_OWORD *)&v34.m31;
    *(_OWORD *)(a2 + 80) = v21;
    v22 = *(_OWORD *)&v34.m43;
    *(_OWORD *)(a2 + 96) = *(_OWORD *)&v34.m41;
    *(_OWORD *)(a2 + 112) = v22;
    v23 = *(_OWORD *)&v34.m13;
    *(_OWORD *)a2 = *(_OWORD *)&v34.m11;
    *(_OWORD *)(a2 + 16) = v23;
    v24 = *(_OWORD *)&v34.m23;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v34.m21;
    *(_OWORD *)(a2 + 48) = v24;
    v25 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)&v33.m31 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)&v33.m33 = v25;
    v26 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)&v33.m41 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)&v33.m43 = v26;
    v27 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&v33.m11 = *(_OWORD *)a2;
    *(_OWORD *)&v33.m13 = v27;
    v28 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)&v33.m21 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)&v33.m23 = v28;
    result = CATransform3DScale(&v34, &v33, v37, v37, v37);
    v29 = *(_OWORD *)&v34.m33;
    *(_OWORD *)(a2 + 64) = *(_OWORD *)&v34.m31;
    *(_OWORD *)(a2 + 80) = v29;
    v30 = *(_OWORD *)&v34.m43;
    *(_OWORD *)(a2 + 96) = *(_OWORD *)&v34.m41;
    *(_OWORD *)(a2 + 112) = v30;
    v31 = *(_OWORD *)&v34.m13;
    *(_OWORD *)a2 = *(_OWORD *)&v34.m11;
    *(_OWORD *)(a2 + 16) = v31;
    v32 = *(_OWORD *)&v34.m23;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v34.m21;
    *(_OWORD *)(a2 + 48) = v32;
  }
  else
  {
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

- (uint64_t)_shouldDimItemsForSearch
{
  uint64_t v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 688), "isFirstResponder"))
    {
      objc_msgSend(*(id *)(v1 + 688), "text");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend(v2, "length") == 0;

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (void)setBarButtonItems:(id)a3
{
  char v4;
  void *v5;
  NSArray *v6;
  NSArray *barButtonItems;
  NSUInteger v8;
  UIToolbar *titleToolbar;
  UIToolbar *v10;
  UIToolbar *v11;
  id v12;
  UIToolbar *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = WBSIsEqual();
  v5 = v15;
  if ((v4 & 1) == 0)
  {
    v6 = (NSArray *)objc_msgSend(v15, "copy");
    barButtonItems = self->_barButtonItems;
    self->_barButtonItems = v6;

    -[TabOverview setNeedsLayout](self, "setNeedsLayout");
    v8 = -[NSArray count](self->_barButtonItems, "count");
    titleToolbar = self->_titleToolbar;
    if (v8)
    {
      if (!titleToolbar)
      {
        v10 = (UIToolbar *)objc_alloc_init(MEMORY[0x1E0DC3E68]);
        v11 = self->_titleToolbar;
        self->_titleToolbar = v10;

        v12 = objc_alloc_init(MEMORY[0x1E0DC3E70]);
        objc_msgSend(v12, "configureWithTransparentBackground");
        -[UIToolbar setStandardAppearance:](self->_titleToolbar, "setStandardAppearance:", v12);
        -[TabOverview insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_titleToolbar, self->_header);

      }
      v13 = (UIToolbar *)objc_msgSend(v15, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIToolbar insertObject:atIndex:](v13, "insertObject:atIndex:", v14, 0);

      -[UIToolbar setItems:](self->_titleToolbar, "setItems:", v13);
    }
    else
    {
      -[UIToolbar removeFromSuperview](titleToolbar, "removeFromSuperview");
      v13 = self->_titleToolbar;
      self->_titleToolbar = 0;
    }

    v5 = v15;
  }

}

- (TabOverviewToolbar)toolbar
{
  return self->_header;
}

- (TabOverview)initWithFrame:(CGRect)a3
{
  TabOverview *v3;
  TabOverview *v4;
  uint64_t v5;
  NSHashTable *presentationObservers;
  uint64_t v7;
  NSMutableArray *itemViewReuseStack;
  uint64_t v9;
  NSMutableArray *deferredClosingItems;
  uint64_t v11;
  NSCountedSet *itemsShowingContextMenu;
  UILabel *v13;
  UILabel *titleLabel;
  void *v15;
  UIView *v16;
  UIView *scrollingContainerView;
  UIView *v18;
  UIView *menuPreviewContainerView;
  void *v20;
  int v21;
  void *v22;
  GridVisualizationView *v23;
  UIView *gridVisualizationView;
  void *v25;
  uint64_t v26;
  SFScrollingPanGestureRecognizer *panRecognizer;
  uint64_t v28;
  SFScrollingPanGestureRecognizer *tabCloseRecognizer;
  uint64_t v30;
  UITapGestureRecognizer *tapRecognizer;
  TabOverviewInterpolatedLocation *v32;
  TabOverviewInterpolatedLocation *interpolatedLocation;
  TabOverviewToolbar *v34;
  TabOverviewToolbar *header;
  void *v36;
  void *v37;
  TabOverviewToolbar *v38;
  void *v39;
  SFTabCollectionSearchController *v40;
  SFTabCollectionSearchController *searchController;
  uint64_t v42;
  SFTabOverviewSearchBar *searchBar;
  uint64_t v44;
  SFGradientView *statusBarGradient;
  id v46;
  void *v47;
  uint64_t v48;
  UIVisualEffectView *dismissibleSearchBarBackground;
  SFTabOverviewSearchBar *v50;
  SFTabOverviewSearchBar *v51;
  SFTabOverviewItemContentView *v52;
  SFTabOverviewItemContentView *titleSizingItemView;
  UIView *v54;
  UIView *inputView;
  void *v56;
  void *v57;
  NSString *v58;
  uint64_t v59;
  UIPointerInteraction *cursorInteraction;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  TabOverview *v66;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t);
  void *v71;
  id v72;
  id location;
  objc_super v74;
  _QWORD v75[2];

  v75[1] = *MEMORY[0x1E0C80C00];
  v74.receiver = self;
  v74.super_class = (Class)TabOverview;
  v3 = -[TabOverview initWithFrame:](&v74, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TabOverview setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("TabOverview"));
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    presentationObservers = v4->_presentationObservers;
    v4->_presentationObservers = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    itemViewReuseStack = v4->_itemViewReuseStack;
    v4->_itemViewReuseStack = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    deferredClosingItems = v4->_deferredClosingItems;
    v4->_deferredClosingItems = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    itemsShowingContextMenu = v4->_itemsShowingContextMenu;
    v4->_itemsShowingContextMenu = (NSCountedSet *)v11;

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v13;

    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4AE8], *MEMORY[0x1E0DC1420]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v15);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TabGroupTitleField"));
    -[TabOverview addSubview:](v4, "addSubview:", v4->_titleLabel);
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    scrollingContainerView = v4->_scrollingContainerView;
    v4->_scrollingContainerView = v16;

    -[TabOverview addSubview:](v4, "addSubview:", v4->_scrollingContainerView);
    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    menuPreviewContainerView = v4->_menuPreviewContainerView;
    v4->_menuPreviewContainerView = v18;

    -[UIView setUserInteractionEnabled:](v4->_menuPreviewContainerView, "setUserInteractionEnabled:", 0);
    -[TabOverview addSubview:](v4, "addSubview:", v4->_menuPreviewContainerView);
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "hasInternalContent"))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLForKey:", CFSTR("DebugTabOverviewGeometry"));

      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v4->_scrollingContainerView, "setBackgroundColor:", v22);

        v23 = objc_alloc_init(GridVisualizationView);
        gridVisualizationView = v4->_gridVisualizationView;
        v4->_gridVisualizationView = &v23->super;

        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v4->_gridVisualizationView, "setBackgroundColor:", v25);

        -[TabOverview addSubview:](v4, "addSubview:", v4->_gridVisualizationView);
      }
    }
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4ED40]), "initWithTarget:action:", v4, sel__pan_);
    panRecognizer = v4->_panRecognizer;
    v4->_panRecognizer = (SFScrollingPanGestureRecognizer *)v26;

    -[SFScrollingPanGestureRecognizer setDelegate:](v4->_panRecognizer, "setDelegate:", v4);
    -[TabOverview addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_panRecognizer);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4ED40]), "initWithTarget:action:", v4, sel__tabClose_);
    tabCloseRecognizer = v4->_tabCloseRecognizer;
    v4->_tabCloseRecognizer = (SFScrollingPanGestureRecognizer *)v28;

    -[SFScrollingPanGestureRecognizer _setCanPanVertically:](v4->_tabCloseRecognizer, "_setCanPanVertically:", 0);
    -[SFScrollingPanGestureRecognizer setDelegate:](v4->_tabCloseRecognizer, "setDelegate:", v4);
    -[SFScrollingPanGestureRecognizer _setHysteresis:](v4->_tabCloseRecognizer, "_setHysteresis:", 25.0);
    -[TabOverview addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_tabCloseRecognizer);
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__tap_);
    tapRecognizer = v4->_tapRecognizer;
    v4->_tapRecognizer = (UITapGestureRecognizer *)v30;

    -[TabOverview addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_tapRecognizer);
    v32 = -[TabOverviewInterpolatedLocation initWithLocation:decelerationFactor:]([TabOverviewInterpolatedLocation alloc], "initWithLocation:decelerationFactor:", 0.0, 0.0, 0.0, 0.0, 0.985);
    interpolatedLocation = v4->_interpolatedLocation;
    v4->_interpolatedLocation = v32;

    -[TabOverviewInterpolatedLocation setMinimumTranslationSpeed:](v4->_interpolatedLocation, "setMinimumTranslationSpeed:", 10.0);
    v4->_horizontalBounceEnabled = 1;
    v4->_verticalBounceEnabled = 1;
    v4->_shouldBounceToConstrainedLocation = 1;
    v34 = objc_alloc_init(TabOverviewToolbar);
    header = v4->_header;
    v4->_header = v34;

    -[TabOverviewToolbar setAlpha:](v4->_header, "setAlpha:", 0.0);
    -[TabOverviewToolbar setUserInteractionEnabled:](v4->_header, "setUserInteractionEnabled:", 1);
    -[TabOverviewToolbar setAutoresizingMask:](v4->_header, "setAutoresizingMask:", 0);
    -[TabOverviewToolbar sf_applyContentSizeCategoryLimitsForToolbarButton](v4->_header, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    -[TabOverview addSubview:](v4, "addSubview:", v4->_header);
    objc_initWeak(&location, v4);
    v36 = (void *)MEMORY[0x1E0DC3428];
    v68 = MEMORY[0x1E0C809B0];
    v69 = 3221225472;
    v70 = __29__TabOverview_initWithFrame___block_invoke;
    v71 = &unk_1E9CF2C28;
    objc_copyWeak(&v72, &location);
    objc_msgSend(v36, "actionWithHandler:", &v68);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewToolbar addPrimaryAction:forBarButton:](v4->_header, "addPrimaryAction:forBarButton:", v37, 3, v68, v69, v70, v71);
    v38 = v4->_header;
    objc_msgSend(MEMORY[0x1E0DC39D0], "sf_tabMenu");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewToolbar setMenu:forBarButton:](v38, "setMenu:forBarButton:", v39, 3);

    v40 = objc_alloc_init(SFTabCollectionSearchController);
    searchController = v4->_searchController;
    v4->_searchController = v40;

    -[SFTabCollectionSearchController setTabView:](v4->_searchController, "setTabView:", v4);
    -[SFTabCollectionSearchController setItemSource:](v4->_searchController, "setItemSource:", v4);
    -[SFTabCollectionSearchController setDelegate:](v4->_searchController, "setDelegate:", v4);
    -[SFTabCollectionSearchController searchBar](v4->_searchController, "searchBar");
    v42 = objc_claimAutoreleasedReturnValue();
    searchBar = v4->_searchBar;
    v4->_searchBar = (SFTabOverviewSearchBar *)v42;

    objc_msgSend(MEMORY[0x1E0D4EC88], "standardGaussianGradientView");
    v44 = objc_claimAutoreleasedReturnValue();
    statusBarGradient = v4->_statusBarGradient;
    v4->_statusBarGradient = (SFGradientView *)v44;

    -[SFGradientView setAlpha:](v4->_statusBarGradient, "setAlpha:", 1.0);
    -[TabOverview insertSubview:belowSubview:](v4, "insertSubview:belowSubview:", v4->_statusBarGradient, v4->_header);
    v46 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "initWithEffect:", v47);
    dismissibleSearchBarBackground = v4->_dismissibleSearchBarBackground;
    v4->_dismissibleSearchBarBackground = (UIVisualEffectView *)v48;

    -[UIVisualEffectView setAlpha:](v4->_dismissibleSearchBarBackground, "setAlpha:", 0.0);
    -[TabOverview insertSubview:belowSubview:](v4, "insertSubview:belowSubview:", v4->_dismissibleSearchBarBackground, v4->_header);
    v50 = v4->_searchBar;
    if (v4->_barPlacement)
    {
      -[SFTabOverviewSearchBar setLayoutMarginsFollowReadableWidth:](v50, "setLayoutMarginsFollowReadableWidth:", 1);
      -[SFTabOverviewSearchBar setEmbeddedInToolbar:](v4->_searchBar, "setEmbeddedInToolbar:", 0);
      -[TabOverview insertSubview:belowSubview:](v4, "insertSubview:belowSubview:", v4->_searchBar, v4->_header);
      v51 = 0;
    }
    else
    {
      -[SFTabOverviewSearchBar setEmbeddedInToolbar:](v50, "setEmbeddedInToolbar:", 1);
      v51 = v4->_searchBar;
    }
    -[TabOverviewToolbar setSearchBar:](v4->_header, "setSearchBar:", v51);
    v52 = objc_alloc_init(SFTabOverviewItemContentView);
    titleSizingItemView = v4->_titleSizingItemView;
    v4->_titleSizingItemView = v52;

    -[SFTabOverviewItemContentView setHidden:](v4->_titleSizingItemView, "setHidden:", 1);
    -[TabOverview addSubview:](v4, "addSubview:", v4->_titleSizingItemView);
    v4->_needsResizeHeaderItems = 1;
    v54 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    inputView = v4->_inputView;
    v4->_inputView = v54;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addObserver:selector:name:object:", v4, sel__updateScrollBoundsForKeyboardNotification_, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v56, "addObserver:selector:name:object:", v4, sel__updateScrollBoundsForKeyboardNotification_, *MEMORY[0x1E0DC4FE0], 0);
    objc_msgSend(v56, "addObserver:selector:name:object:", v4, sel__updateScrollBoundsForKeyboardNotification_, *MEMORY[0x1E0DC4FD8], 0);
    objc_msgSend(v56, "addObserver:selector:name:object:", v4, sel__didReceiveMemoryWarning_, *MEMORY[0x1E0DC4778], 0);
    v4->_inSteadyState = 1;
    v4->_allowsInteractivePresentation = 1;
    -[TabOverview traitCollection](v4, "traitCollection");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "preferredContentSizeCategory");
    v58 = (NSString *)objc_claimAutoreleasedReturnValue();
    v4->_usesAccessibilityContentSize = UIContentSizeCategoryIsAccessibilityCategory(v58);

    v59 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v4);
    cursorInteraction = v4->_cursorInteraction;
    v4->_cursorInteraction = (UIPointerInteraction *)v59;

    -[TabOverview addInteraction:](v4, "addInteraction:", v4->_cursorInteraction);
    SFFocusGroupIdentifierForOwner();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverview setFocusGroupIdentifier:](v4, "setFocusGroupIdentifier:", v61);

    v75[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (id)-[TabOverview registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v62, v4, sel__preferredContentSizeCategoryDidChange);

    objc_msgSend(MEMORY[0x1E0DC3E88], "safari_traitsAffectingTextAppearance");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (id)-[TabOverview registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v64, v4, sel__setNeedsResizeHeaderItems);

    v66 = v4;
    objc_destroyWeak(&v72);
    objc_destroyWeak(&location);
  }

  return v4;
}

- (SFTabCollectionSearchController)searchController
{
  return self->_searchController;
}

- (void)setShowsPrivateBrowsingExplanationView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;

  if (self->_shouldShowPrivateBrowsingExplanationView != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_shouldShowPrivateBrowsingExplanationView = a3;
    if (-[TabOverview presentationState](self, "presentationState"))
      -[TabOverview _setExplanationViewVariant:animated:]((uint64_t)self, v5, v4);
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    -[TabOverview _relinquishBorrowedContentView]((uint64_t)self);
    objc_storeWeak((id *)&self->_delegate, obj);
    -[TabOverview _updateBorrowedContentView]((id *)&self->super.super.super.isa);
  }

}

- (void)_updateBorrowedContentView
{
  int v2;
  id *v3;
  id *v4;
  char v5;
  id *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 151);
    v2 = -[TabOverview _wantsBorrowedContentView]((uint64_t)a1);
    objc_msgSend(WeakRetained, "currentItemForTabOverview:", a1);
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    v4 = (id *)a1[61];
    if (v4 == v3)
      v5 = v2;
    else
      v5 = 0;
    if (v4 && (v5 & 1) == 0)
      -[TabOverview _relinquishBorrowedContentView]((uint64_t)a1);
    if (v2 && a1[61] != v3)
    {
      -[TabOverviewItem layoutInfo](v3);
      v6 = (id *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewItemLayoutInfo itemView](v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[TabOverview _itemHeaderHeight]((uint64_t)a1);
        v9 = v8;
        objc_msgSend(WeakRetained, "tabCollectionView:borrowContentViewForItem:withTopBackdropView:ofHeight:", a1, v3, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *MEMORY[0x1E0C9D538];
        v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        objc_msgSend(v10, "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAnchorPoint:", v11, v12);

        objc_msgSend(v10, "setHidden:", 1);
        objc_msgSend(a1, "bounds");
        objc_msgSend(v10, "setFrame:");
        objc_msgSend(v10, "setUserInteractionEnabled:", objc_msgSend(a1, "presentationState") == 3);
        -[TabOverviewItem layoutInfo](v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo setBorrowedContentView:headerHeight:]((uint64_t)v14, v10, v9);
        objc_storeStrong(a1 + 61, v3);
        -[TabOverview _updateSnapshotAlphaForItem:]((uint64_t)a1, a1[61]);
        -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewInterpolatedValue resetToTargetValue]((uint64_t)v15);

        objc_msgSend(a1, "setNeedsLayout");
      }
    }

  }
}

- (uint64_t)_wantsBorrowedContentView
{
  uint64_t v2;
  id WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  double v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;

  if (!a1 || !objc_msgSend(*(id *)(a1 + 1176), "count") || !objc_msgSend((id)a1, "presentationState"))
    return 0;
  if (objc_msgSend((id)a1, "presentationState") == 3 || *(_BYTE *)(a1 + 665))
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
  objc_msgSend(WeakRetained, "currentItemForTabOverview:", a1);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItem layoutInfo](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v7);

  v9 = objc_msgSend(WeakRetained, "tabCollectionView:validSnapshotExistsForItem:", a1, v5);
  if (!v5 || ((v10 = v9, v11 = _SFEqualWithEpsilon(), v8 >= 1.0) ? (v12 = 1) : (v12 = v10), (v2 = 1, !v11) && v12))
  {
    -[TabOverviewItem layoutInfo](*(id **)(a1 + 488));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (*(_QWORD *)(a1 + 488))
    {
      -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha](v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = -[TabOverviewInterpolatedValue isSteadyAtTargetValue:]((uint64_t)v15) ^ 1;

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (void)_relinquishBorrowedContentView
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if (a1)
  {
    -[TabOverviewItem layoutInfo](*(id **)(a1 + 488));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo borrowedContentView]((uint64_t)v9);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = *(_QWORD *)(a1 + 488);

      if (!v3)
        return;
      -[TabOverviewItem layoutInfo](*(id **)(a1 + 488));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
      -[TabOverviewItemLayoutInfo borrowedContentView]((uint64_t)v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "tabCollectionView:relinquishBorrowedContentView:forItem:", a1, v5, *(_QWORD *)(a1 + 488));

      -[TabOverviewItemLayoutInfo setBorrowedContentView:headerHeight:]((uint64_t)v9, 0, 0.0);
      v6 = *(void **)(a1 + 488);
      *(_QWORD *)(a1 + 488) = 0;
      v7 = v6;

      -[TabOverview _updateSnapshotAlphaForItem:](a1, v7);
      -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewInterpolatedValue resetToTargetValue]((uint64_t)v8);

      objc_msgSend((id)a1, "setNeedsLayout");
    }

  }
}

- (double)_controlsAlpha
{
  void *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (!a1)
    return 0.0;
  v2 = *(void **)(a1 + 488);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
    objc_msgSend(WeakRetained, "currentItemForTabOverview:", a1);
    v3 = (id *)objc_claimAutoreleasedReturnValue();

  }
  -[TabOverviewItem layoutInfo](v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v6);

  if (v7 <= 0.0)
    v8 = 0.0;
  else
    v8 = v7 * v7;

  return v8;
}

- (void)_initializeIncomingItemIfNecessary:(void *)a3 fromItems:(void *)a4 oldItems:(uint64_t)a5 atPosition:(_BYTE *)a6 isIncoming:
{
  id v11;
  id v12;
  void *v13;
  TabOverviewInterpolatedLocation *v14;
  double v15;
  TabOverviewInterpolatedLocation *v16;
  unint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  uint64_t v35;
  void *v36;
  double *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  TabOverviewInterpolatedValue *v41;
  void *v42;
  long double v43;
  double v44;
  double v45;
  double *v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  void *v51;
  TabOverviewInterpolatedValue *v52;
  double v53;
  double *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  TabOverviewInterpolatedValue *v58;
  double v59;
  double *v60;
  void *v61;
  id *v62;

  v62 = a2;
  v11 = a3;
  v12 = a4;
  if (a1)
  {
    if (a6)
      *a6 = 0;
    -[TabOverviewItem setTabOverview:]((uint64_t)v62, (void *)a1);
    -[TabOverviewItem layoutInfo](v62);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v13);
    v14 = (TabOverviewInterpolatedLocation *)objc_claimAutoreleasedReturnValue();
    v15 = dbl_1D7EA8A20[a5 == 1];
    if (v14)
    {
      v16 = v14;
      -[TabOverviewInterpolatedLocation setDecelerationFactor:](v14, "setDecelerationFactor:", dbl_1D7EA8A20[a5 == 1]);
    }
    else
    {
      v17 = objc_msgSend(v11, "indexOfObject:", v62);
      v18 = objc_msgSend(v12, "containsObject:", v62);
      v19 = v18;
      if (a6)
        *a6 = v18 ^ 1;
      if ((v18 & 1) != 0)
      {
        v20 = objc_msgSend(v12, "count");
        objc_msgSend(v12, "allObjects");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
      }
      else
      {
        v20 = objc_msgSend(v11, "count");
        if ((objc_msgSend(v62, "isPlaceholder") & 1) != 0)
        {
          v22 = 0;
        }
        else if (objc_msgSend(v62, "dragState") == 3)
        {
          v22 = 2;
        }
        else if (*(_QWORD *)(a1 + 1232) == 1)
        {
          v22 = 2;
        }
        else
        {
          v22 = 1;
        }
        v21 = v11;
      }
      v23 = countPinnedItems(v21);
      v24 = -[TabOverview _targetLocationForItemAtIndex:inNumberOfItems:insertionStyle:pinnedItemCount:](a1, v17, v20, v22, v23);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      if (v19)

      v16 = -[TabOverviewInterpolatedLocation initWithLocation:decelerationFactor:]([TabOverviewInterpolatedLocation alloc], "initWithLocation:decelerationFactor:", v24, v26, v28, v30, v15);
      -[TabOverviewItemLayoutInfo setInterpolatedLocation:]((uint64_t)v13, v16);
    }
    if (objc_msgSend(v62, "dragState") == 2)
    {
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "resetToLocation:", -[TabOverview _targetLocationForItem:inItems:](a1, v62, v11));

      -[TabOverviewItemLayoutInfo interpolatedBoundsLogScale]((uint64_t)v13);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v13);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "location");
      -[TabOverviewInterpolatedValue resetToValue:]((uint64_t)v32, v34);

    }
    -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v13);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v35;
    if (v35)
    {
      -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:](v35, 0.962);
    }
    else
    {
      v37 = -[TabOverviewInterpolatedValue initWithValue:decelerationFactor:]([TabOverviewInterpolatedValue alloc], 1.0, 0.962);
      -[TabOverviewItemLayoutInfo setInterpolatedSnapshotAlpha:]((uint64_t)v13, v37);

      -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v13);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewInterpolatedValue setEpsilon:]((uint64_t)v38, 0.01);

    }
    -[TabOverviewItemLayoutInfo interpolatedCornerRadius]((uint64_t)v13);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v39;
    if (v39)
    {
      -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:](v39, 0.988);
    }
    else
    {
      v41 = [TabOverviewInterpolatedValue alloc];
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v13);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 432), "location");
      v44 = exp(v43);
      v45 = -[TabOverview _cornerRadiusForItemAtLocation:scale:ignoreTransitionProgress:](a1, v42, 0, v44);
      v46 = -[TabOverviewInterpolatedValue initWithValue:decelerationFactor:](v41, v45, 0.988);
      -[TabOverviewItemLayoutInfo setInterpolatedCornerRadius:]((uint64_t)v13, v46);

      _SFOnePixel();
      v48 = v47;
      -[TabOverviewItemLayoutInfo interpolatedCornerRadius]((uint64_t)v13);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewInterpolatedValue setEpsilon:]((uint64_t)v49, v48);

    }
    -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v13);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)v50;
    if (v50)
    {
      -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:](v50, 0.988);
    }
    else
    {
      v52 = [TabOverviewInterpolatedValue alloc];
      v53 = 0.0;
      if (*(_QWORD *)(a1 + 1232) != 1)
        v53 = 1.0;
      v54 = -[TabOverviewInterpolatedValue initWithValue:decelerationFactor:](v52, v53, 0.988);
      -[TabOverviewItemLayoutInfo setInterpolatedHeightTransitionPercent:]((uint64_t)v13, v54);

      -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v13);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewInterpolatedValue setEpsilon:]((uint64_t)v55, 0.01);

    }
    -[TabOverviewItemLayoutInfo interpolatedBoundsLogScale]((uint64_t)v13);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v56;
    if (v56)
    {
      -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:](v56, 0.988);
    }
    else
    {
      v58 = [TabOverviewInterpolatedValue alloc];
      -[TabOverviewInterpolatedLocation location](v16, "location");
      v60 = -[TabOverviewInterpolatedValue initWithValue:decelerationFactor:](v58, v59, 0.988);
      -[TabOverviewItemLayoutInfo setInterpolatedBoundsLogScale:]((uint64_t)v13, v60);

      -[TabOverviewItemLayoutInfo interpolatedBoundsLogScale]((uint64_t)v13);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewInterpolatedValue setEpsilon:]((uint64_t)v61, 0.01);

    }
  }

}

- (void)_notifyObserversForScalePercentageForActiveItem
{
  double v2;
  double v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "scalePercentageForActiveItem");
    v3 = v2;
    if (*(double *)(a1 + 608) != v2)
    {
      *(double *)(a1 + 608) = v2;
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v4 = *(id *)(a1 + 416);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v9, "tabOverview:didUpdateScalePercentageForActiveItem:", a1, v3, (_QWORD)v10);
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v6);
      }

    }
  }
}

- (double)scalePercentageForActiveItem
{
  void *v3;
  void *v4;
  double v5;

  -[TabOverviewItem layoutInfo]((id *)&self->_activeItem->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TabOverview _currentScalePercentageForItemAtLocation:]((uint64_t)self, v4);

  return v5;
}

- (double)_cornerRadiusForItemAtLocation:(int)a3 scale:(double)a4 ignoreTransitionProgress:
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  double v17;
  double v18;
  BOOL v19;
  BOOL v20;
  double v21;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;

  v7 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayCornerRadius");
    v10 = v9;

    if (*(_QWORD *)(a1 + 1232) == 1)
      v11 = 0.0;
    else
      v11 = v10;
    if (a3)
      v12 = a4 * 15.0;
    else
      v12 = v11;
    v23 = 0;
    v24 = (double *)&v23;
    v25 = 0x2020000000;
    v26 = 0;
    v13 = v7;
    v14 = *(_QWORD *)(a1 + 1232);
    *(_QWORD *)(a1 + 1232) = 0;
    -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v13);
    _SFClampPercent();
    v15 = v24;
    *((_QWORD *)v24 + 3) = v16;
    *(_QWORD *)(a1 + 1232) = v14;
    if (*(_BYTE *)(a1 + 665))
    {
      v17 = v15[3];
    }
    else
    {
      v18 = v15[3];
      if (*(_QWORD *)(a1 + 1160) == 3)
      {
        v19 = v18 < 1.0;
        v17 = 0.0;
        if (!v19)
          v17 = 1.0;
      }
      else
      {
        v20 = v18 <= 0.0;
        v17 = 0.0;
        if (!v20)
          v17 = 1.0;
      }
      v15[3] = v17;
    }
    v21 = v17 * 15.0 + v12 / a4 * (1.0 - v17);

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v21 = 0.0;
  }

  return v21;
}

- (double)_currentScalePercentageForItemAtLocation:(uint64_t)a1
{
  id v3;
  double v4;
  uint64_t v5;
  long double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = a2;
  v4 = 0.0;
  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 1232);
    if (v5 != 1)
    {
      if (*(_QWORD *)(a1 + 1160))
      {
        v6 = *(double *)(a1 + 904);
        if (v6 == 0.0)
          v6 = -[TabOverview _thumbnailScaleWithTabLayout:](a1, v5);
        v7 = log(v6);
        v8 = v7;
        if (v3)
        {
          objc_msgSend(v3, "location");
          v10 = v9;
        }
        else
        {
          v10 = v7;
        }
        objc_msgSend(*(id *)(a1 + 432), "location");
        v4 = 1.0;
        if (v8 != 0.0)
        {
          v4 = (v10 - v11) / v8;
          if (v4 < 0.0)
            v4 = v4 / (1.0 - v4);
          if (v4 > 1.0)
            v4 = (v4 + -1.0) / v4 + 1.0;
        }
      }
    }
  }

  return v4;
}

uint64_t __43__TabOverview__updateIndexesMatchingSearch__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 769) = *(_BYTE *)(result + 40);
  return result;
}

- (void)updateSnapshotForItem:(id)a3
{
  void *v4;
  TabOverviewItem *v5;
  TabOverviewItem *v6;

  v6 = (TabOverviewItem *)a3;
  -[TabOverviewItem layoutInfo]((id *)&v6->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo updateSnapshot]((uint64_t)v4);

  v5 = v6;
  if (self->_activeItem == v6)
  {
    -[TabOverview _updateSnapshotAlphaForItem:]((uint64_t)self, v6);
    v5 = v6;
  }

}

- (id)_snapshotForItem:(BOOL *)a3 isBlank:
{
  id *v3;
  id v5;
  id WeakRetained;

  v3 = a1;
  if (a1)
  {
    v5 = a2;
    WeakRetained = objc_loadWeakRetained(v3 + 151);
    objc_msgSend(WeakRetained, "tabCollectionView:snapshotForItem:", v3, v5);
    v3 = (id *)objc_claimAutoreleasedReturnValue();

    if (a3)
      *a3 = v3 == 0;
  }
  return v3;
}

- (uint64_t)_itemHasAdditionalHeaderHeight:(uint64_t)a1
{
  id v3;
  id WeakRetained;

  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      a1 = objc_msgSend(WeakRetained, "tabCollectionView:includesHeaderInSnapshotForItems:", a1, v3);
    else
      a1 = 1;

  }
  return a1;
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_presentationState)
  {
    v3 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(WeakRetained, "tabCollectionViewCanDismiss:", self) & 1) == 0)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXTabView();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9[0]) = 0;
        _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_DEFAULT, "Request to dismiss tab overview vetoed by delegate", (uint8_t *)v9, 2u);
      }
    }
    else
    {
      v6 = WBS_LOG_CHANNEL_PREFIXTabView();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = v3;
        _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_DEFAULT, "Dismiss tab overview animated: %d", (uint8_t *)v9, 8u);
      }
      objc_msgSend(WeakRetained, "currentItemForTabOverview:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverview _dismissWithItem:]((uint64_t)self, v7);

      if (!v3)
        -[TabOverview _resetToSteadyState]((uint64_t)self);
    }

  }
}

- (id)scrollingContainerView
{
  if (a1)
    a1 = (id *)a1[92];
  return a1;
}

- (void)setPresentedTabLayout:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  long double v12;
  id v13;

  if (self->_presentedTabLayout != a3)
  {
    -[TabOverviewInterpolatedLocation targetLocation](self->_interpolatedLocation, "targetLocation");
    -[TabOverview _closestItemToLocation:](self, v5, v6, v7, v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    self->_presentedTabLayout = a3;
    -[TabOverview _updateTabCloseRecognizer](self);
    v9 = -[TabOverview _targetLocationForItem:inItems:]((uint64_t)self, v13, self->_items);
    -[TabOverviewInterpolatedLocation setTargetLocation:](self->_interpolatedLocation, "setTargetLocation:", -[TabOverview _targetLocationCenteredOnItemLocation:]((id *)&self->super.super.super.isa, v9, v10, v11, v12));
    -[TabOverview setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setAlternateBottomSafeAreaInset:(double)a3
{
  if (self->_alternateBottomSafeAreaInset != a3)
  {
    self->_alternateBottomSafeAreaInset = a3;
    -[TabOverview setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setThemeProvider:(id)a3
{
  objc_storeWeak((id *)&self->_themeProvider, a3);
}

- (void)_updateItemShowsCloseButton:(uint64_t)a1
{
  id *v3;
  id *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  id *v8;
  void *v9;
  id *v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v10 = v3;
    -[TabOverviewItem layoutInfo](v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TabOverviewItemLayoutInfo visibleInTabOverview]((_BOOL8)v5);

    v4 = v10;
    if (v6)
    {
      if (-[TabOverview _canCloseItem:](a1, v10))
      {
        if (objc_msgSend(v10, "isPinned"))
          v7 = objc_msgSend(*(id *)(a1 + 648), "containsObject:", v10) ^ 1;
        else
          v7 = 1;
      }
      else
      {
        v7 = 0;
      }
      -[TabOverviewItem layoutInfo](v10);
      v8 = (id *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewItemLayoutInfo itemView](v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setShowsCloseButton:", v7);

      v4 = v10;
    }
  }

}

- (id)_requestReusableTabOverviewItemView
{
  id *p_isa;
  void *v2;
  TabOverviewItemView *v3;

  p_isa = a1;
  if (a1)
  {
    objc_msgSend(a1[125], "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(p_isa[125], "removeLastObject");
      objc_msgSend(v2, "setHidden:", 0);
      v3 = v2;
    }
    else
    {
      v3 = objc_alloc_init(TabOverviewItemView);
    }
    p_isa = (id *)&v3->super.super.super.isa;

  }
  return p_isa;
}

- (uint64_t)_canCloseItem:(uint64_t)a1
{
  id v3;
  void *v4;
  id WeakRetained;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 1232) == 1 || *(id *)(a1 + 504) == v3)
    {
      a1 = 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
      a1 = objc_msgSend(WeakRetained, "tabCollectionView:canCloseItem:", a1, v4);

    }
  }

  return a1;
}

uint64_t __32__TabOverview__layOutTitleLabel__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "setAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "setAlpha:", *(double *)(a1 + 40));
}

- (double)_itemShouldBeTransparent:(uint64_t)a1
{
  id *v3;
  id *v4;
  void *v5;
  BOOL v6;
  double v7;
  void *v8;
  _BOOL4 v9;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_9;
  -[TabOverviewItem layoutInfo](v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TabOverviewItemLayoutInfo interactivelyInserted]((_BOOL8)v5))
  {
    v6 = -[TabOverviewItem closing]((_BOOL8)v4);

    v7 = 1.0;
    if (v6)
      goto LABEL_13;
  }
  else
  {

  }
  if (!objc_msgSend(*(id *)(a1 + 760), "isSearching"))
    goto LABEL_9;
  objc_msgSend(*(id *)(a1 + 760), "indexesMatchingSearchTerm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsIndex:", objc_msgSend(*(id *)(a1 + 1176), "indexOfObject:", v4)))
  {

LABEL_9:
    v7 = 0.0;
    goto LABEL_13;
  }
  v9 = -[TabOverviewItem closing]((_BOOL8)v4);

  if (v9)
    v7 = 0.0;
  else
    v7 = 1.0;
LABEL_13:

  return v7;
}

- (void)_updateDisplayedItems
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id *v9;
  void *v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  void *v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v4 = *(id *)(a1 + 440);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v58 != v7)
            objc_enumerationMutation(v4);
          v9 = *(id **)(*((_QWORD *)&v57 + 1) + 8 * i);
          if (-[TabOverviewItem closing]((_BOOL8)v9))
          {
            -[TabOverviewItem layoutInfo](v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = -[TabOverviewItemLayoutInfo visibleInTabOverview]((_BOOL8)v10);

            if (v11)
              continue;
          }
          objc_msgSend(v3, "addObject:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      }
      while (v6);
    }

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v12 = *(id *)(a1 + 1176);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v54 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
          objc_msgSend(v2, "addObject:", v17);
          objc_msgSend(v3, "removeObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      }
      while (v14);
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v18 = *(id *)(a1 + 1184);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v50;
      do
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v50 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k);
          objc_msgSend(v2, "addObject:", v23);
          objc_msgSend(v3, "removeObject:", v23);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
      }
      while (v20);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v24 = *(id *)(a1 + 440);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v46;
      do
      {
        for (m = 0; m != v26; ++m)
        {
          if (*(_QWORD *)v46 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * m);
          if (objc_msgSend(v3, "containsObject:", v29))
          {
            -[TabOverview _removeViewsForItem:](a1, v29);
          }
          else if ((objc_msgSend(v2, "containsObject:", v29) & 1) == 0)
          {
            objc_msgSend(v2, "addObject:", v29);
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
      }
      while (v26);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v30 = v2;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v42;
      do
      {
        for (n = 0; n != v32; ++n)
        {
          if (*(_QWORD *)v42 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * n);
          v36 = -[TabOverviewItem isAlternateItem]((_BOOL8)v35);
          v37 = *(_QWORD *)(a1 + 1232);
          if (v36)
            v38 = 0;
          else
            v38 = *(_QWORD *)(a1 + 1232);
          *(_QWORD *)(a1 + 1232) = v38;
          -[TabOverview _updateTargetLocationForDisplayedItem:](a1, v35);
          *(_QWORD *)(a1 + 1232) = v37;
          -[TabOverview _layoutDisplayedItem:forceVisible:](a1, v35, 0);
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
      }
      while (v32);
    }

    v39 = objc_msgSend(v30, "copy", (_QWORD)v41);
    v40 = *(void **)(a1 + 440);
    *(_QWORD *)(a1 + 440) = v39;

  }
}

- (void)_updateTargetLocationForDisplayedItem:(uint64_t)a1
{
  id *v3;
  id WeakRetained;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  long double v23;
  void *v24;
  double started;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id *v41;
  int v42;
  long double v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  id *v53;
  _BOOL4 v54;
  char v55;
  char v56;
  double v57;
  void *v58;
  void *v59;
  id v60;
  int v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double Width;
  uint64_t v70;
  id *v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  uint64_t v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  id *v89;
  id *v90;
  double v91;
  double v92;
  double v93;
  id *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  id *v99;
  void *v100;
  _QWORD v101[7];
  CGRect v102;

  v3 = a2;
  if (!a1)
    goto LABEL_71;
  v99 = v3;
  -[TabOverview _updateSnapshotAlphaForItem:](a1, v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
  objc_msgSend((id)a1, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[TabOverviewItem layoutInfo](v99);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabOverview _itemsContainingItem:]((char *)a1, v99);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(id **)(a1 + 632) == v99)
  {
    -[TabOverviewItem layoutInfo](v99);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    started = -[TabOverviewItemLayoutInfo closeStartLocation]((uint64_t)v24);
    v19 = v26;
    v21 = v27;
    v23 = v28;

    v17 = started - *(double *)(a1 + 624);
    goto LABEL_7;
  }
  if (-[TabOverviewItem closing]((_BOOL8)v99))
  {
    -[TabOverviewItem layoutInfo](v99);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TabOverviewItemLayoutInfo closeStartLocation]((uint64_t)v16);
    v19 = v18;
    v21 = v20;
    v23 = v22;

    if (objc_msgSend(v99, "dragState") == 1)
    {
      v21 = -500.0;
    }
    else
    {
      -[TabOverviewItem layoutInfo](v99);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "targetLocation");
      v68 = v67;

      LODWORD(v65) = objc_msgSend((id)a1, "_sf_usesLeftToRightLayout");
      v102.origin.x = v6;
      v102.origin.y = v8;
      v102.size.width = v10;
      v102.size.height = v12;
      Width = CGRectGetWidth(v102);
      if ((_DWORD)v65)
        v17 = fmax(v68, Width * 1.3);
      else
        v17 = fmin(v68, exp(v23) * Width * -1.2);
    }
    goto LABEL_7;
  }
  if (*(_QWORD *)(a1 + 1232) || !objc_msgSend((id)a1, "targetItemLiftsFromGrid"))
    goto LABEL_79;
  v41 = (id *)(id)a1;
  if (objc_msgSend(v41, "presentationState") == 1)
  {

LABEL_79:
    v71 = *(id **)(a1 + 504);
    if (v71)
    {
      if (v71 == v99)
      {
        -[TabOverviewItem layoutInfo](v99);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "targetLocation");
        v17 = v85;
        v19 = v86;
        v21 = v87;
        v23 = v88;

      }
      else
      {
        v17 = -[TabOverview _targetLocationForItem:inItems:](a1, v99, v15);
        v19 = v72;
        v21 = v73;
        v23 = v74;
        if (!-[TabOverviewItem isAlternateItem]((_BOOL8)v99))
        {
          -[TabOverviewItem layoutInfo](*(id **)(a1 + 504));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = fmax(fmin(1.0 - -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v76), 1.0), 0.0);

          v21 = v77 * -150.0;
        }
      }
      goto LABEL_7;
    }
    v17 = -[TabOverview _targetLocationForItem:inItems:](a1, v99, v15);
    v19 = v78;
    v21 = v79;
    v23 = v80;
    if (*(_QWORD *)(a1 + 1232) != 1)
      goto LABEL_7;
    v81 = a1;
LABEL_85:
    -[TabOverview _itemHeaderHeight](v81);
    v19 = v19 - v82;
    goto LABEL_7;
  }
  v70 = objc_msgSend(v41, "presentationState");

  if (v70 == 2)
    goto LABEL_79;
  v89 = (id *)v41[61];
  if (v89)
  {
    v90 = v99;
    if (v89 != v99)
      goto LABEL_89;
LABEL_93:
    if (v41[145])
      objc_msgSend(v41[54], "targetLocation");
    else
      v95 = -[TabOverview _targetLocationForPresentation]((uint64_t)v41);
    v17 = v95;
    v19 = v96;
    v21 = v97;
    v23 = v98;
    v81 = (uint64_t)v41;
    goto LABEL_85;
  }
  objc_msgSend(WeakRetained, "currentItemForTabOverview:", v41);
  v94 = (id *)objc_claimAutoreleasedReturnValue();

  v90 = v99;
  if (v94 == v99)
    goto LABEL_93;
LABEL_89:
  v17 = -[TabOverview _targetLocationForItem:inItems:]((uint64_t)v41, v90, v15);
  v19 = v91;
  v21 = v92;
  v23 = v93;
  if (!-[TabOverviewItem isAlternateItem]((_BOOL8)v99))
    v21 = -150.0;
LABEL_7:
  if (v15 == *(void **)(a1 + 1184))
  {
    v17 = -[TabOverview _applyItemPosition:toLocation:]((id *)a1, *(_QWORD *)(a1 + 1192), v17, v19, v21, v23);
    v19 = v29;
    v21 = v30;
    v23 = v31;
  }
  if (-[TabOverviewItem closing]((_BOOL8)v99) && !objc_msgSend(v99, "dragState"))
    goto LABEL_14;
  v32 = v99;
  if (*(id **)(a1 + 1200) == v99 && *(_BYTE *)(a1 + 1155))
  {
    if (objc_msgSend((id)a1, "presentationState") == 3)
    {
LABEL_15:
      v32 = v99;
      goto LABEL_16;
    }
LABEL_14:
    v21 = v21 + 100.0;
    goto LABEL_15;
  }
LABEL_16:
  -[TabOverviewItem layoutInfo](v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[TabOverviewItemLayoutInfo interactivelyInserted]((_BOOL8)v33);

  if (v34)
  {
    if (-[TabOverviewItem closing]((_BOOL8)v99)
      || (-[TabOverviewItem layoutInfo](v99),
          v35 = (void *)objc_claimAutoreleasedReturnValue(),
          v36 = -[TabOverviewItemLayoutInfo interactiveInsertionProgress]((uint64_t)v35),
          v35,
          v36 < 1.0))
    {
      objc_msgSend((id)a1, "targetItemLiftsFromGrid", v99);
      _SFInterpolate();
      v21 = fmin(v21, v37);
    }
    if (*(_QWORD *)(a1 + 1232) == 1)
    {
      objc_msgSend(*(id *)(a1 + 432), "location");
      v39 = exp(v23 - v38);
      objc_msgSend(*(id *)(a1 + 432), "location");
      v17 = v39 * v40;
    }
  }
  if (objc_msgSend((id)a1, "presentationState", v99)
    && (!-[TabOverviewItem isAlternateItem]((_BOOL8)v100) || *(_BYTE *)(a1 + 666)))
  {
    if (*(_BYTE *)(a1 + 769) || -[TabOverviewItem incoming]((_BOOL8)v100) && *(_QWORD *)(a1 + 1232) == 1)
      objc_msgSend(v14, "shiftTargetLocation:", v17, v19, v21, (double)v23);
    else
      objc_msgSend(v14, "setTargetLocation:", v17, v19, v21, (double)v23);
  }
  else
  {
    objc_msgSend(v14, "resetToLocation:", v17, v19, v21, (double)v23);
  }
  if (objc_msgSend(v100, "isPinned"))
    v42 = objc_msgSend((id)a1, "targetItemLiftsFromGrid") ^ 1;
  else
    v42 = 0;
  objc_msgSend(*(id *)(a1 + 432), "location");
  v44 = exp(v43);
  v45 = -[TabOverview _cornerRadiusForItemAtLocation:scale:ignoreTransitionProgress:](a1, v14, v42, v44);
  v46 = objc_msgSend((id)a1, "presentationState");
  -[TabOverviewItem layoutInfo]((id *)v100);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedCornerRadius]((uint64_t)v47);
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v48;
  if (v46)
    -[TabOverviewInterpolatedValue setTargetValue:](v48, v45);
  else
    -[TabOverviewInterpolatedValue resetToValue:](v48, v45);

  v50 = objc_msgSend((id)a1, "targetItemLiftsFromGrid");
  v51 = *(void **)(a1 + 488);
  v52 = v51;
  if (!v51)
  {
    objc_msgSend(WeakRetained, "currentItemForTabOverview:", a1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53 = (id *)v100;
  if (v52 != v100)
  {
    v54 = 0;
    if (v51)
      goto LABEL_46;
    goto LABEL_45;
  }
  v60 = (id)a1;
  v54 = objc_msgSend(v60, "presentationState") != 1 && objc_msgSend(v60, "presentationState") != 2;

  v53 = (id *)v100;
  if (!v51)
  {
LABEL_45:

    v53 = (id *)v100;
  }
LABEL_46:
  if (*(id **)(a1 + 504) == v53)
    v55 = 0;
  else
    v55 = v50;
  if ((v55 & 1) != 0)
  {
    v56 = *(_QWORD *)(a1 + 1160) != 3 || v54;
    if ((v56 & 1) != 0)
    {
      v57 = 0.0;
      if (!*(_QWORD *)(a1 + 1232))
        v57 = (double)!v54;
      goto LABEL_61;
    }
    -[TabOverviewItem layoutInfo](v53);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[TabOverviewInterpolatedValue targetValue]((uint64_t)v59);
  }
  else
  {
    -[TabOverviewItem layoutInfo](v53);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = fmax(fmin(-[TabOverview _currentScalePercentageForItemAtLocation:](a1, v59), 1.0), 0.0);
  }

LABEL_61:
  if (objc_msgSend((id)a1, "presentationState") && (*(void **)(a1 + 504) != v100 ? (v61 = v50) : (v61 = 0), v61 == 1))
  {
    -[TabOverviewItem layoutInfo]((id *)v100);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewInterpolatedValue setTargetValue:]((uint64_t)v63, v57);
  }
  else
  {
    -[TabOverviewItem layoutInfo]((id *)v100);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewInterpolatedValue resetToValue:]((uint64_t)v63, v57);
  }

  if (!-[TabOverviewItem closing]((_BOOL8)v100))
  {
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __53__TabOverview__updateTargetLocationForDisplayedItem___block_invoke;
    v101[3] = &unk_1E9CF2990;
    v101[4] = a1;
    v101[5] = v15;
    v101[6] = v100;
    v64 = *(_QWORD *)(a1 + 1232);
    *(_QWORD *)(a1 + 1232) = 0;
    __53__TabOverview__updateTargetLocationForDisplayedItem___block_invoke((uint64_t)v101);
    *(_QWORD *)(a1 + 1232) = v64;
  }

  v3 = (id *)v100;
LABEL_71:

}

void __53__TabOverview__updateTargetLocationForDisplayedItem___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  long double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "count");
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(v4 + 1176))
    v5 = &OBJC_IVAR___TabOverview__pinnedItemCount;
  else
    v5 = &OBJC_IVAR___TabOverview__pinnedAlternateItemCount;
  -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](v2, v3, *(_QWORD *)(v4 + *v5));
  v7 = log(v6);
  v8 = objc_msgSend(*(id *)(a1 + 32), "presentationState");
  -[TabOverviewItem layoutInfo](*(id **)(a1 + 48));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedBoundsLogScale]((uint64_t)v11);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    -[TabOverviewInterpolatedValue setTargetValue:](v9, v7);
  else
    -[TabOverviewInterpolatedValue resetToValue:](v9, v7);

}

- (void)layoutSubviews
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D7CA3000, a2, OS_LOG_TYPE_ERROR, "Invalid bounds from tab overview location: %@", (uint8_t *)&v3, 0xCu);
}

- (double)_targetLocationForItem:(void *)a3 inItems:
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  double v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (objc_msgSend(v6, "count"))
      v8 = objc_msgSend(v7, "indexOfObject:", v5);
    else
      v8 = 0;
    v9 = objc_msgSend(v7, "count");
    v10 = countPinnedItems(v7);
    v11 = -[TabOverview _targetLocationForItemAtIndex:inNumberOfItems:insertionStyle:pinnedItemCount:](a1, v8, v9, 0, v10);
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (id)_updateVisiblyCenteredItem
{
  id *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  uint64_t i;
  id *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double MidY;
  CGFloat Height;
  double v24;
  id *v25;
  id *v26;
  id *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double MidX;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  BOOL v39;
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v41 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    objc_msgSend(result, "bounds");
    v30 = v3;
    v31 = v2;
    v28 = v5;
    v29 = v4;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v6 = v1[147];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v36;
      v32 = 1.79769313e308;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(v6);
          v12 = *(id **)(*((_QWORD *)&v35 + 1) + 8 * i);
          -[TabOverviewItem layoutInfo](v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "convertRect:fromView:", v1[92], -[TabOverviewItemLayoutInfo frame]((uint64_t)v13));
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v21 = v20;

          v42.origin.x = v15;
          v42.origin.y = v17;
          v42.size.width = v19;
          v42.size.height = v21;
          MidX = CGRectGetMidX(v42);
          v43.origin.x = v31;
          v43.origin.y = v30;
          v43.size.width = v29;
          v43.size.height = v28;
          v34 = MidX - CGRectGetWidth(v43) * 0.5;
          v44.origin.x = v15;
          v44.origin.y = v17;
          v44.size.width = v19;
          v44.size.height = v21;
          MidY = CGRectGetMidY(v44);
          v45.origin.x = v31;
          v45.origin.y = v30;
          v45.size.width = v29;
          v45.size.height = v28;
          Height = CGRectGetHeight(v45);
          v24 = (MidY - Height * 0.5) * (MidY - Height * 0.5) + v34 * v34;
          if (v24 < v32)
          {
            v25 = v12;

            v32 = v24;
            v9 = v25;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v26 = v1 + 62;
    v27 = (id *)v1[62];
    if (v9 != v27)
      objc_storeStrong(v26, v9);
    v39 = v9 != v27;

    return (id *)v39;
  }
  return result;
}

- (void)_updateSnapshotAlphaForItem:(uint64_t)a1
{
  id *v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  id *v10;
  double v11;
  void *v12;
  double v13;
  float v14;
  double v15;
  char v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  double v21;
  void *v22;
  id *v23;

  v3 = a2;
  if (a1 && v3)
  {
    v23 = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
    v5 = objc_msgSend(WeakRetained, "tabCollectionView:validSnapshotExistsForItem:", a1, v23);
    -[TabOverviewItem layoutInfo](v23);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5 && -[TabOverviewItemLayoutInfo isSnapshotBlank](v6))
      -[TabOverviewItemLayoutInfo updateSnapshot]((uint64_t)v7);
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TabOverview _titleViewSquishPercentageForItemAtLocation:](a1, v8);

    v10 = *(id **)(a1 + 488);
    v11 = 1.0;
    if (v10 == v23)
    {
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v12);
      _SFClampPercent();
      v11 = v13 * (v13 * v13) * (v13 * (v13 * 6.0 + -15.0) + 10.0);

    }
    v14 = v11;
    v15 = roundf(v14);
    if (*(_BYTE *)(a1 + 665))
      v11 = v15;
    if (v9 > 0.0)
      v16 = 1;
    else
      v16 = v5;
    if ((v16 & 1) != 0
      || ((v17 = objc_msgSend((id)a1, "presentationState"), v10 == v23) ? (v18 = v17 == 3) : (v18 = 1), v18))
    {
      -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v7);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = v11;
    }
    else
    {
      -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v7);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = 0.0;
    }
    -[TabOverviewInterpolatedValue setTargetValue:](v19, v21);

    if (!*(_QWORD *)(a1 + 1160))
    {
      -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewInterpolatedValue resetToTargetValue]((uint64_t)v22);

    }
    if (!*(_QWORD *)(a1 + 424) && objc_msgSend((id)a1, "isItemAnimating:", v23))
      objc_msgSend((id)a1, "_updateDisplayLink");

    v3 = v23;
  }

}

- (BOOL)isItemAnimating:(id)a3
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_itemToActivate == a3)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    -[TabOverviewItem layoutInfo]((id *)a3);
    v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[TabOverviewItemLayoutInfo interpolatedValues](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          if (!-[TabOverviewInterpolatedValue isInSteadyState](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)))
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }

    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isInSteadyStateWithConstraints:", 0, (_QWORD)v11) ^ 1;
LABEL_12:

  }
  return v9;
}

- (void)_updateDisplayLink
{
  TabOverviewInterpolatedLocation *interpolatedLocation;
  void *v4;
  int v5;
  CADisplayLink *displayLink;
  CADisplayLink *v7;
  void *v8;
  CADisplayLink *v9;
  CADisplayLink *v10;
  CADisplayLink *v11;
  void *v12;
  TabOverviewItem *activeItem;
  id *v14;
  id *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  CAFrameRateRange v19;

  if (-[TabOverview presentationState](self, "presentationState"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      if (-[TabOverview presentationState](self, "presentationState") == 3
        && !self->_itemActivationTimer
        && !-[TabOverview targetItemLiftsFromGrid](self, "targetItemLiftsFromGrid"))
      {
        interpolatedLocation = self->_interpolatedLocation;
        objc_msgSend(WeakRetained, "currentItemForTabOverview:", self);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewInterpolatedLocation shiftTargetLocation:](interpolatedLocation, "shiftTargetLocation:", -[TabOverview _targetLocationForDismissalWithItem:]((uint64_t)self, v4));

      }
      -[TabOverview _updateBorrowedContentView]((id *)&self->super.super.super.isa);
    }
    v5 = -[TabOverview _checkSteadyState]((uint64_t)self);
    if (((v5 ^ (self->_displayLink != 0)) & 1) == 0)
      -[UIPointerInteraction invalidate](self->_cursorInteraction, "invalidate");
    if (v5)
    {
      self->_updatingAlternateItemPosition = 0;
      displayLink = self->_displayLink;
      if (displayLink)
      {
        -[CADisplayLink invalidate](displayLink, "invalidate");
        v7 = self->_displayLink;
        self->_displayLink = 0;

        -[TabOverview _updatePresentationStateIfSteady]((uint64_t)self);
      }
      -[TabOverview _notifySteadyStateUpdatedIfNeeded]((uint64_t)self);
      if (-[NSMutableArray count](self->_deferredClosingItems, "count"))
      {
        v8 = (void *)-[NSMutableArray copy](self->_deferredClosingItems, "copy");
        -[NSMutableArray removeAllObjects](self->_deferredClosingItems, "removeAllObjects");
        objc_msgSend(WeakRetained, "tabOverview:closeItems:", self, v8);

      }
    }
    else
    {
      if (!self->_displayLink)
      {
        objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
        v9 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
        v10 = self->_displayLink;
        self->_displayLink = v9;

        v19 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
        -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);
        -[CADisplayLink setHighFrameRateReason:](self->_displayLink, "setHighFrameRateReason:", 1638402);
        v11 = self->_displayLink;
        objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CADisplayLink addToRunLoop:forMode:](v11, "addToRunLoop:forMode:", v12, *MEMORY[0x1E0C99860]);

        self->_lastUpdateTime = 0.0;
      }
      activeItem = self->_activeItem;
      if (activeItem)
      {
        v14 = activeItem;
      }
      else
      {
        objc_msgSend(WeakRetained, "currentItemForTabOverview:", self);
        v14 = (id *)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;
      -[TabOverviewItem layoutInfo](v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverview _currentScalePercentageForItemAtLocation:]((uint64_t)self, v17);

      if (self->_presentationState == 1 && _SFEqualWithEpsilon())
        -[TabOverview _setPresentationState:]((uint64_t)self, 2);

      -[TabOverview _notifySteadyStateUpdatedIfNeeded]((uint64_t)self);
    }

  }
}

- (double)_titleViewSquishPercentageForItemAtLocation:(uint64_t)a1
{
  id v3;
  double v4;
  double v5;

  v3 = a2;
  v4 = 0.0;
  if (a1 && !*(_QWORD *)(a1 + 1232))
  {
    -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v3);
    _SFClampPercent();
    v4 = v5;
  }

  return v4;
}

- (double)_thumbnailScaleWithTabLayout:(uint64_t)a1
{
  uint64_t v3;
  double *v4;
  uint64_t v5;
  double v6;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  if (!a1)
    return 0.0;
  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0x3FF0000000000000;
  v3 = *(_QWORD *)(a1 + 1232);
  *(_QWORD *)(a1 + 1232) = a2;
  -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:]((_QWORD *)a1, objc_msgSend(*(id *)(a1 + 1176), "count", v8), *(_QWORD *)(a1 + 1120));
  v4 = v9;
  *((_QWORD *)v9 + 3) = v5;
  *(_QWORD *)(a1 + 1232) = v3;
  v6 = v4[3];
  _Block_object_dispose(&v8, 8);
  return v6;
}

- (uint64_t)_shiftScrollPositionForBoundsChangeIfNeeded
{
  uint64_t v1;
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
  double Height;
  CGRect v17;
  CGRect v18;

  if (result)
  {
    v1 = result;
    objc_msgSend((id)result, "bounds");
    result = CGRectEqualToRect(v17, *(CGRect *)(v1 + 528));
    if ((result & 1) == 0)
    {
      result = CGRectEqualToRect(*(CGRect *)(v1 + 528), *MEMORY[0x1E0C9D648]);
      if ((result & 1) == 0 && *(_QWORD *)(v1 + 1160) == 2)
      {
        objc_msgSend(*(id *)(v1 + 432), "targetLocation");
        v3 = v2;
        v5 = v4;
        v7 = v6;
        v9 = v8;
        v10 = *(double *)(v1 + 600);
        v11 = v10 - CGRectGetHeight(*(CGRect *)(v1 + 560));
        v12 = 0.0;
        v13 = fmax(v11, 0.0);
        objc_msgSend((id)v1, "_contentSize");
        v15 = v14;
        v18.origin.x = -[TabOverview _scrollBounds]((_QWORD *)v1);
        Height = CGRectGetHeight(v18);
        if (v13 != 0.0)
          v12 = v5 * fmax(v15 - Height, 0.0) / v13;
        return objc_msgSend(*(id *)(v1 + 432), "shiftTargetLocation:", v3, v12, v7, v9);
      }
    }
  }
  return result;
}

- (double)_scrollBounds
{
  uint64_t v2;
  double result;

  if (!a1)
    return 0.0;
  v2 = a1[154];
  if (v2 == 1)
  {
    objc_msgSend(a1, "bounds");
  }
  else if (!v2)
  {
    -[TabOverview _effectiveSafeAreaInsets]((uint64_t)a1);
    objc_msgSend(a1, "bounds");
  }
  return result;
}

- (void)_notifyObserversForScrollViewShiftIfNeeded
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;
  CGRect v14;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "bounds");
    if (!CGRectEqualToRect(v14, *(CGRect *)(a1 + 528)))
    {
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      v2 = *(id *)(a1 + 416);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)v9;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v9 != v5)
              objc_enumerationMutation(v2);
            v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v7, "tabOverviewWillShiftScrollPositionForBoundsChange:", a1, (_QWORD)v8);
            ++v6;
          }
          while (v4 != v6);
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        }
        while (v4);
      }

    }
  }
}

- (id)_layOutTitleLabel
{
  id *v1;
  void *v2;
  uint64_t v3;
  BOOL v4;
  _BOOL8 v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  BOOL v11;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "title");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "length");
    v4 = v3 != 0;
    v5 = v3 == 0;

    objc_msgSend(v1, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory(v7))
      v8 = 2;
    else
      v8 = 1;
    objc_msgSend(v1[88], "setNumberOfLines:", v8);

    objc_msgSend(v1[88], "setHidden:", v5);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __32__TabOverview__layOutTitleLabel__block_invoke;
    v10[3] = &unk_1E9CF1EE8;
    v10[4] = v1;
    v11 = v4;
    v9 = v1[154];
    v1[154] = 0;
    result = (id *)__32__TabOverview__layOutTitleLabel__block_invoke((uint64_t)v10);
    v1[154] = v9;
  }
  return result;
}

- (void)_layOutPreviewContainers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id *v7;
  id *v8;
  double Width;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id obj;
  CATransform3D v20;
  CATransform3D v21;
  CATransform3D v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;

  v28 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = *(id *)(a1 + 656);
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v24 != v4)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v6, "tabOverviewItem");
          v7 = (id *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItem layoutInfo](v7);
          v8 = (id *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setFrame:", -[TabOverviewItemLayoutInfo frame]((uint64_t)v8));
          v29.origin.x = -[TabOverviewItemLayoutInfo frame]((uint64_t)v8);
          Width = CGRectGetWidth(v29);
          objc_msgSend(v6, "initialItemWidth");
          v11 = Width / v10;
          -[TabOverviewItemLayoutInfo transform]((uint64_t)v8, &v21);
          CATransform3DScale(&v22, &v21, v11, v11, v11);
          objc_msgSend(v6, "layer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v22;
          objc_msgSend(v12, "setTransform:", &v20);

          v13 = -[TabOverviewItemLayoutInfo zPosition]((uint64_t)v8);
          objc_msgSend(v6, "layer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setZPosition:", v13);

          -[TabOverviewItemLayoutInfo itemView](v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isDescendantOfView:", *(_QWORD *)(a1 + 736));

          if (v16)
          {
            v17 = *(void **)(a1 + 736);
            -[TabOverviewItemLayoutInfo itemView](v8);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "insertSubview:aboveSubview:", v6, v18);

          }
        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v3);
    }

  }
}

- (char)_itemsContainingItem:(char *)a1
{
  id v3;
  void *v4;
  _BOOL4 v5;
  int *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = -[TabOverviewItem isAlternateItem]((_BOOL8)v3);
    v6 = &OBJC_IVAR___TabOverview__items;
    if (v5)
      v6 = &OBJC_IVAR___TabOverview__alternateItems;
    a1 = (char *)*(id *)&a1[*v6];
  }

  return a1;
}

- (CGSize)_contentSize
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  int64_t presentedTabLayout;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double Height;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;
  CGRect v23;
  CGRect v24;

  v4 = -[TabOverview _itemReferenceBounds]((id *)&self->super.super.super.isa);
  v6 = v5;
  v7 = v3;
  v9 = v8;
  if (!self)
  {
    v11 = -[TabOverview _bottomEdgeOfTabs](0);
    v12 = 0.0;
    goto LABEL_5;
  }
  presentedTabLayout = self->_presentedTabLayout;
  if (presentedTabLayout == 1)
  {
    v18 = v3 * (double)-[NSArray count](self->_items, "count");
    v19 = v7 * dbl_1D7EA8A10[self->_presentedTabLayout == 0];
    -[NSArray count](self->_items, "count");
    v7 = v18 + v19 * (double)(-[NSArray count](self->_items, "count") - 1);
    goto LABEL_10;
  }
  if (!presentedTabLayout)
  {
    v11 = -[TabOverview _bottomEdgeOfTabs]((uint64_t)self);
    v12 = dbl_1D7EA8A10[self->_presentedTabLayout == 0];
LABEL_5:
    v13 = v7 * v12;
    -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](self, -[NSArray count](self->_items, "count"), self->_pinnedItemCount);
    v15 = v11 + v13 / v14;
    v16 = 0.0;
    if (self->_presentationState == 3)
    {
      -[TabOverview bounds](self, "bounds", 0.0);
      Height = CGRectGetHeight(v23);
      v24.origin.x = v4;
      v24.origin.y = v6;
      v24.size.width = v7;
      v24.size.height = v9;
      v16 = fmax(Height - CGRectGetHeight(v24), 0.0);
    }
    v9 = v15 + v16;
    if (self->_explanationViewVisible)
      v9 = fmax(v9, -[TabOverview _explanationViewVerticalOffset]((uint64_t)self) + self->_explanationViewSize.height);
  }
LABEL_10:
  v20 = v7;
  v21 = v9;
  result.height = v21;
  result.width = v20;
  return result;
}

- (double)_bottomEdgeOfTabs
{
  void *v2;
  unint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  long double v11;

  if (!a1)
    return 0.0;
  if (CGRectIsEmpty(*(CGRect *)(a1 + 912)))
  {
    if (objc_msgSend(*(id *)(a1 + 760), "isSearching"))
    {
      objc_msgSend(*(id *)(a1 + 760), "indexesMatchingSearchTerm");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "lastIndex");

    }
    else if (objc_msgSend(*(id *)(a1 + 1176), "count"))
    {
      v3 = objc_msgSend(*(id *)(a1 + 1176), "count") - 1;
    }
    else
    {
      v3 = 0;
    }
    v8 = -[TabOverview _targetLocationForItemAtIndex:inNumberOfItems:insertionStyle:pinnedItemCount:](a1, v3, objc_msgSend(*(id *)(a1 + 1176), "count"), 0, *(_QWORD *)(a1 + 1120));
    v4 = -[TabOverview _rectForItemLocation:]((id *)a1, v8, v9, v10, v11);
  }
  else
  {
    v4 = *(double *)(a1 + 912);
    v5 = *(_QWORD *)(a1 + 920);
    v6 = *(_QWORD *)(a1 + 928);
    v7 = *(_QWORD *)(a1 + 936);
  }
  return CGRectGetMaxY(*(CGRect *)&v4);
}

- (double)_rectForItemLocation:(double)a3
{
  double result;

  if (!a1)
    return 0.0;
  -[TabOverview _itemReferenceBounds](a1);
  exp(a5);
  _SFRoundRectToPixels();
  return result;
}

- (void)_updateIndexesMatchingSearch
{
  char v2;
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  char v9;

  if (a1)
  {
    v2 = *(_BYTE *)(a1 + 769);
    *(_BYTE *)(a1 + 769) = 1;
    v3 = objc_alloc_init(MEMORY[0x1E0D89D00]);
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__TabOverview__updateIndexesMatchingSearch__block_invoke;
    v8[3] = &unk_1E9CF1EE8;
    v8[4] = a1;
    v9 = v2;
    objc_msgSend(v3, "setHandler:", v8);
    v5 = objc_msgSend(*(id *)(a1 + 760), "applySearchToItems:", *(_QWORD *)(a1 + 1176));
    if (objc_msgSend((id)a1, "showsLockedPrivateBrowsingView"))
    {
      if (objc_msgSend((id)a1, "presentationState"))
        v6 = *(unsigned __int8 *)(a1 + 1008);
      else
        v6 = 0;
      -[TabOverview _setExplanationViewVariant:animated:](a1, v6, 0);
    }
    else if (v5 && objc_msgSend(*(id *)(a1 + 760), "isSearching"))
    {
      objc_msgSend((id)a1, "setNeedsLayout");
      v7[0] = v4;
      v7[1] = 3221225472;
      v7[2] = __43__TabOverview__updateIndexesMatchingSearch__block_invoke_2;
      v7[3] = &unk_1E9CF1900;
      v7[4] = a1;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
      -[TabOverview _updateAllowsInteractivePresentation](a1);
    }

  }
}

- (double)_searchBarLeadingMargin
{
  double v2;
  double v3;
  double Width;
  CGRect v6;
  CGRect v7;

  if (!a1)
    return 0.0;
  -[TabOverview _thumbnailScaleForLandscapeOrientation](a1);
  v3 = v2;
  objc_msgSend(a1, "bounds");
  Width = CGRectGetWidth(v6);
  objc_msgSend(a1, "bounds");
  return fmax(Width, CGRectGetHeight(v7)) / v3 * dbl_1D7EA8A10[a1[154] == 0];
}

- (void)_thumbnailScaleForLandscapeOrientation
{
  void *v1;
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
  int v17;
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
  CGRect v30;
  CGRect v31;
  CGRect v32;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "bounds");
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v10 = -[TabOverview _effectiveSafeAreaInsets]((uint64_t)v1);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = objc_msgSend(v1, "_sf_hasLandscapeAspectRatio");
    v28 = v3 + v12;
    v29 = v5 + v10;
    v18 = v7 - (v12 + v16);
    v19 = v9 - (v10 + v14);
    v20 = v3;
    v21 = v5;
    v22 = v7;
    v23 = v9;
    if (v17)
    {
      CGRectGetWidth(*(CGRect *)&v20);
      v24 = v28;
      v25 = v29;
      v26 = v18;
      v27 = v19;
    }
    else
    {
      CGRectGetHeight(*(CGRect *)&v20);
      v30.origin.x = v28;
      v30.origin.y = v29;
      v30.size.width = v18;
      v30.size.height = v19;
      CGRectGetHeight(v30);
      v31.origin.x = v3;
      v31.origin.y = v5;
      v31.size.width = v7;
      v31.size.height = v9;
      CGRectGetMinX(v31);
      v32.origin.x = v3;
      v32.origin.y = v5;
      v32.size.width = v7;
      v32.size.height = v9;
      CGRectGetMinY(v32);
      v24 = v3;
      v25 = v5;
      v26 = v7;
      v27 = v9;
    }
    CGRectGetWidth(*(CGRect *)&v24);
    return (void *)+[TabOverview _tabsPerRowForBounds:isAccessibilityContentSizeCategory:]();
  }
  return result;
}

void __29__TabOverview_initWithFrame___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "searchController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endSearching");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TabOverview setDelegate:](self, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TabOverview;
  -[TabOverview dealloc](&v4, sel_dealloc);
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TabOverview;
  -[TabOverview willMoveToWindow:](&v5, sel_willMoveToWindow_, a3);
  -[TabOverview window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_unregisterScrollToTopView:", self);

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TabOverview;
  -[TabOverview didMoveToWindow](&v4, sel_didMoveToWindow);
  -[TabOverview window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_registerScrollToTopView:", self);

}

- (id)undoManager
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "undoManagerForTabCollectionView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateScrollBoundsForKeyboardInfo:(double *)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double Width;
  double MaxY;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  id v37;
  _QWORD v38[5];
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v37 = a2;
  if (a1)
  {
    v3 = objc_msgSend(a1, "presentationState");
    if (v3)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __50__TabOverview__updateScrollBoundsForKeyboardInfo___block_invoke;
      v38[3] = &unk_1E9CF1900;
      v38[4] = a1;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v38);
    }
    objc_msgSend(a1, "window", v37);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "CGRectValue");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

    }
    else
    {
      objc_msgSend(v5, "bounds");
      v8 = v15;
      v10 = v16;
      v12 = v17;
      v14 = v18;
    }
    objc_msgSend(v5, "coordinateSpace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertRect:fromCoordinateSpace:", v19, v8, v10, v12, v14);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    v28 = a1[97];
    v39.origin.x = v21;
    v39.origin.y = v23;
    v39.size.width = v25;
    v39.size.height = v27;
    v29 = 0.0;
    if (!CGRectIsEmpty(v39))
    {
      v40.origin.x = v21;
      v40.origin.y = v23;
      v40.size.width = v25;
      v40.size.height = v27;
      Width = CGRectGetWidth(v40);
      objc_msgSend(v5, "bounds");
      if (Width == CGRectGetWidth(v41))
      {
        objc_msgSend(a1, "bounds");
        MaxY = CGRectGetMaxY(v42);
        v43.origin.x = v21;
        v43.origin.y = v23;
        v43.size.width = v25;
        v43.size.height = v27;
        v29 = fmax(MaxY - CGRectGetMinY(v43), 0.0);
      }
    }
    a1[97] = v29;
    objc_msgSend(a1, "window");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v3 && v32)
    {
      v34 = vabdd_f64(v28, a1[97]);
      _SFOnePixel();
      v36 = v35;

      if (v34 >= v36)
      {
        objc_msgSend(a1, "setNeedsLayout");
        objc_msgSend(a1, "layoutIfNeeded");
      }
    }
    else
    {

    }
  }

}

uint64_t __50__TabOverview__updateScrollBoundsForKeyboardInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updateScrollBoundsForKeyboardNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TabOverview _updateScrollBoundsForKeyboardInfo:]((double *)self, v4);

}

- (void)dismissWithAddTabAnimation
{
  NSObject *v3;
  double v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_presentationState)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_DEFAULT, "Dismiss tab overview with add tab animation", buf, 2u);
    }
    self->_dismissingWithAddTabAnimation = 1;
    -[TabOverviewInterpolatedLocation setDecelerationFactor:](self->_interpolatedLocation, "setDecelerationFactor:", 0.988);
    if (self->_presentedTabLayout)
    {
      v4 = 0.97;
    }
    else if (-[TabOverview targetItemLiftsFromGrid](self, "targetItemLiftsFromGrid"))
    {
      v4 = 0.98;
    }
    else
    {
      v4 = 0.97;
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_items;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          -[TabOverviewItem layoutInfo](*(id **)(*((_QWORD *)&v15 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setDecelerationFactor:", v4, (_QWORD)v15);

          -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v12, 0.0);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v7);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "currentItemForTabOverview:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverview _dismissWithItemAtCurrentDecelerationFactor:](self, "_dismissWithItemAtCurrentDecelerationFactor:", v14);

  }
}

- (void)_preferredContentSizeCategoryDidChange
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;

  -[TabOverview traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (self->_usesAccessibilityContentSize != IsAccessibilityCategory)
  {
    self->_usesAccessibilityContentSize = IsAccessibilityCategory;
    -[TabOverview setNeedsLayout](self, "setNeedsLayout");
  }
  self->_explanationViewSize = (CGSize)*MEMORY[0x1E0C9D820];
}

- (_QWORD)_closestItemToLocation:(double)a3
{
  _QWORD v6[9];

  if (a1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__TabOverview__closestItemToLocation___block_invoke;
    v6[3] = &unk_1E9CFAFC8;
    v6[4] = a1;
    *(double *)&v6[5] = a2;
    *(double *)&v6[6] = a3;
    *(double *)&v6[7] = a4;
    *(double *)&v6[8] = a5;
    -[TabOverview _closestItemWithDistanceCalculationBlock:](a1, v6);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_updateTabCloseRecognizer
{
  void *v1;
  _BOOL8 v2;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(result, "presentationState") != 3 && *((_QWORD *)v1 + 154) != 1;
    objc_msgSend(*((id *)v1 + 58), "setEnabled:", v2);
    return (void *)objc_msgSend(*((id *)v1 + 57), "_setCanPanHorizontally:", v2 ^ 1);
  }
  return result;
}

- (double)_targetLocationCenteredOnItemLocation:(double)a3
{
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;

  if (!a1)
    return 0.0;
  -[TabOverview _rectForItemLocation:](a1, a2, a3, a4, a5);
  -[TabOverview _scrollBounds](a1);
  _SFCGRectGrowToSize();
  v7 = v6;
  objc_msgSend(a1, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
    -[TabOverview _titleHeight](a1);
  -[TabOverview _isDismissibleSearchBarAvailable]((uint64_t)a1);
  v10 = -v7;
  if (-[TabOverview _itemSnapshotsShouldPreserveAspectRatio](a1))
  {
    objc_msgSend(a1[139], "titlePadding");
    objc_msgSend(a1[139], "titleHeight");
  }
  return v10;
}

- (void)_setNeedsResizeHeaderItems
{
  self->_needsResizeHeaderItems = 1;
  -[TabOverview setNeedsLayout](self, "setNeedsLayout");
}

- (double)targetScaleWithTabLayout:(int64_t)a3
{
  return 1.0 / -[TabOverview _thumbnailScaleWithTabLayout:]((uint64_t)self, a3);
}

- (CGRect)frameForItem:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  long double v9;
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

  -[TabOverviewItem layoutInfo]((id *)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v10 = -[TabOverview _rectForItemLocation:]((id *)&self->super.super.super.isa, v6, v7, v8, v9);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[TabOverview convertRect:fromView:](self, "convertRect:fromView:", self->_scrollingContainerView, v10, v12, v14, v16);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)_showsTitle
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "title");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "length") != 0;

  return v2;
}

- (double)_targetLocationForDismissalWithItem:(uint64_t)a1
{
  id v3;
  double v4;

  v3 = a2;
  if (a1)
  {
    v4 = -[TabOverview _targetLocationForItem:inItems:](a1, v3, *(void **)(a1 + 1176));
    if (!*(_QWORD *)(a1 + 1232) && (objc_msgSend((id)a1, "targetItemLiftsFromGrid") & 1) == 0)
      -[TabOverview _itemHeaderHeight](a1);
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

- (id)_itemAtLayoutIndex:(id *)a1
{
  uint64_t v3;
  id *v4;
  unint64_t v5;

  if (a1)
  {
    v3 = (uint64_t)a1;
    a1 = (id *)objc_msgSend(a1[147], "count");
    if (a1)
    {
      v4 = a1;
      v5 = 0;
      while (-[TabOverview _layoutIndexForItemIndex:pinnedItemCount:](v3, v5, *(_QWORD *)(v3 + 1120)) != a2)
      {
        if (v4 == (id *)++v5)
          return (id *)0;
      }
      objc_msgSend(*(id *)(v3 + 1176), "objectAtIndex:", v5);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (void)_didChangeVisibility:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 760), "searchTerm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (!v5)
      objc_msgSend(*(id *)(a1 + 760), "endSearching");
    -[TabOverview _updateBorrowedContentView]((id *)a1);
    if (a2)
    {
      -[TabOverviewItem layoutInfo](*(id **)(a1 + 488));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewItemLayoutInfo borrowedContentView]((uint64_t)v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[TabOverviewItem layoutInfo](*(id **)(a1 + 488));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewInterpolatedValue resetToValue:]((uint64_t)v9, 0.0);

      }
      if ((objc_msgSend(*(id *)(a1 + 760), "hasEmptyResults") & 1) != 0)
      {
        v10 = 2;
      }
      else
      {
        if (!*(_BYTE *)(a1 + 1008))
          return;
        v10 = 1;
      }
    }
    else
    {
      if (!*(_QWORD *)(a1 + 1016))
        return;
      v10 = 0;
    }
    -[TabOverview _setExplanationViewVariant:animated:](a1, v10, 0);
  }
}

- (void)_setExplanationViewVariant:(int)a3 animated:
{
  uint64_t v6;
  void *v7;
  TabExplanationView *v8;
  void *v9;
  id v10;

  if (a1 && (a2 || *(_QWORD *)(a1 + 1016)))
  {
    objc_msgSend(*(id *)(a1 + 688), "text");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 1016);
    v10 = (id)v6;
    if (v7)
    {
      objc_msgSend(v7, "setVariant:query:", a2, v6);
    }
    else
    {
      v8 = -[TabExplanationView initWithVariant:query:]([TabExplanationView alloc], "initWithVariant:query:", a2, v6);
      v9 = *(void **)(a1 + 1016);
      *(_QWORD *)(a1 + 1016) = v8;

      objc_msgSend((id)a1, "bounds");
      objc_msgSend(*(id *)(a1 + 1016), "setFrame:");
      objc_msgSend((id)a1, "insertSubview:atIndex:", *(_QWORD *)(a1 + 1016), 0);
    }
    *(_OWORD *)(a1 + 1024) = *MEMORY[0x1E0C9D820];
    if (a2 || (a3 & 1) != 0)
    {
      if (a3)
        objc_msgSend((id)a1, "layoutBelowIfNeeded");
      objc_msgSend(*(id *)(a1 + 1016), "setHidden:", a2 == 0);
      *(_BYTE *)(a1 + 1040) = a2 != 0;
      objc_msgSend((id)a1, "setNeedsLayout");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 1016), "setHidden:", 1);
    }
    -[TabOverview _updateAllowsInteractivePresentation](a1);

  }
}

- (double)_rubberbandOffsetForOffset:(double)a3
{
  double v6;
  long double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 432), "location");
  -[TabOverview _constrainLocation:](a1, a2, a3, v6, v7);
  v9 = v8;
  -[TabOverview _scrollBounds]((_QWORD *)a1);
  if (!*(_BYTE *)(a1 + 667))
    return v9;
  if (v10 >= 0.001)
  {
    v11 = -v10;
    if (a2 >= v9)
      v11 = v10;
    return v9 + (1.0 - 1.0 / ((a2 - v9) / v11 * 0.55 + 1.0)) * v11;
  }
  return a2;
}

- (void)_constrainLocation:(double)a3
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _BOOL4 v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  int isDismissibleSearchBar;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double Width;
  double MinX;
  double MinY;
  double MaxX;
  CGFloat v39;
  double v40;
  CGFloat rect;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  if (a1)
  {
    -[TabOverview _scrollBounds]((_QWORD *)a1);
    v8 = v7;
    v10 = v9;
    objc_msgSend((id)a1, "_contentSize");
    v12 = v11;
    if ((-[TabOverview _isDismissibleSearchBarAvailable](a1) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 688), "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length") == 0;
    }
    else
    {
      objc_msgSend((id)a1, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length") != 0;
    }

    _SFCGRectGrowToSize();
    v40 = exp(a5);
    rect = v8;
    v15 = v10;
    _SFCGRectGrowToSize();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    if (v14 && v12 < v10)
    {
      v24 = -[TabOverview _titleHeight]((id *)a1);
      isDismissibleSearchBar = -[TabOverview _isDismissibleSearchBarAvailable](a1);
      v26 = 0.0;
      if (isDismissibleSearchBar)
        v26 = *(double *)(a1 + 1080);
      v23 = v23 + v24 + v26;
    }
    v27 = -a2;
    v28 = -a3;
    if (-[TabOverview _isDismissibleSearchBarAvailable](a1))
    {
      if ((objc_msgSend(*(id *)(a1 + 688), "isFirstResponder") & 1) != 0
        || (objc_msgSend(*(id *)(a1 + 688), "text"),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            v30 = objc_msgSend(v29, "length"),
            v29,
            v30))
      {
        v31 = v17;
        v32 = -[TabOverview _titleHeight]((id *)a1);
        v44.origin.x = v31;
        v19 = v19 + v32;
        v44.origin.y = v19;
        v44.size.width = v21;
        v44.size.height = v23;
        v33 = CGRectGetHeight(v44) - v32;
        v17 = v31;
        v28 = -a3;
        v27 = -a2;
        v45.origin.x = -a2;
        v45.origin.y = -a3;
        v45.size.width = rect;
        v45.size.height = v15;
        v23 = fmax(v33, CGRectGetHeight(v45));
      }
    }
    if ((objc_msgSend((id)a1, "_sf_usesLeftToRightLayout") & 1) == 0)
    {
      v46.origin.x = v17;
      v46.origin.y = v19;
      v46.size.width = v21;
      v46.size.height = v23;
      v34 = v17;
      Width = CGRectGetWidth(v46);
      v47.origin.x = -[TabOverview _itemReferenceBounds]((id *)a1);
      v17 = v34 - (Width - CGRectGetWidth(v47) * v40);
    }
    v48.origin.x = v17;
    v48.origin.y = v19;
    v48.size.width = v21;
    v48.size.height = v23;
    v39 = v17;
    MinX = CGRectGetMinX(v48);
    v49.origin.x = v27;
    v49.origin.y = v28;
    v49.size.width = rect;
    v49.size.height = v15;
    fmax(MinX - CGRectGetMinX(v49), 0.0);
    v50.origin.x = v17;
    v50.origin.y = v19;
    v50.size.width = v21;
    v50.size.height = v23;
    MinY = CGRectGetMinY(v50);
    v51.origin.x = v27;
    v51.origin.y = v28;
    v51.size.width = rect;
    v51.size.height = v15;
    fmax(MinY - CGRectGetMinY(v51), 0.0);
    v52.origin.x = v27;
    v52.origin.y = v28;
    v52.size.width = rect;
    v52.size.height = v15;
    MaxX = CGRectGetMaxX(v52);
    v53.origin.x = v39;
    v53.origin.y = v19;
    v53.size.width = v21;
    v53.size.height = v23;
    fmax(MaxX - CGRectGetMaxX(v53), 0.0);
    v54.origin.x = v27;
    v54.origin.y = v28;
    v54.size.width = rect;
    v54.size.height = v15;
    CGRectGetMaxY(v54);
    v55.origin.x = v39;
    v55.origin.y = v19;
    v55.size.width = v21;
    v55.size.height = v23;
    CGRectGetMaxY(v55);
  }
}

- (double)_offsetForRubberbandOffset:(double)a3
{
  double v6;
  long double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 432), "location");
  -[TabOverview _constrainLocation:](a1, a2, a3, v6, v7);
  v9 = v8;
  -[TabOverview _scrollBounds]((_QWORD *)a1);
  if (v10 >= 0.001)
  {
    v11 = -v10;
    if (a2 >= v9)
      v11 = v10;
    v12 = (a2 - v9) / v11 + -1.0;
    if (fabs(v12) >= 0.001)
      return v9 + (-1.0 / v12 + -1.0) / 0.55 * v11;
  }
  return a2;
}

- (double)_explanationViewVerticalOffset
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  CGRect v7;

  if (!a1)
    return 0.0;
  objc_msgSend((id)a1, "safeAreaInsets");
  v3 = v2;
  if (!*(_QWORD *)(a1 + 1224))
    v3 = v2 + *(double *)(a1 + 880);
  objc_msgSend((id)a1, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 704), "bounds");
    return v3 + CGRectGetHeight(v7) + 88.0;
  }
  return v3;
}

- (void)_didChangeDismissing:(uint64_t)a1
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v4 = *(void **)(a1 + 456);
    v5 = objc_msgSend((id)a1, "presentationState") != 3 && *(_BYTE *)(a1 + 665) == 0;
    objc_msgSend(v4, "setEnabled:", v5);
    objc_msgSend(*(id *)(a1 + 472), "setEnabled:", a2 ^ 1);
    objc_msgSend(*(id *)(a1 + 680), "setUserInteractionEnabled:", a2 ^ 1);
    -[TabOverviewItem layoutInfo](*(id **)(a1 + 488));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo borrowedContentView]((uint64_t)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", a2);

    if (((a2 ^ 1) & 1) == 0)
      *(_BYTE *)(a1 + 1155) = 0;
  }
}

- (uint64_t)_checkSteadyState
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = *(void **)(a1 + 432);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __32__TabOverview__checkSteadyState__block_invoke;
  v16[3] = &unk_1E9CFADE8;
  v16[4] = a1;
  if (!objc_msgSend(v2, "isInSteadyStateWithConstraints:", v16))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 440);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[TabOverviewItem layoutInfo](*(id **)(*((_QWORD *)&v12 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[TabOverviewItemLayoutInfo interpolatedValuesAreSteady]((uint64_t)v8);

        if (!v9)
        {
          v10 = 0;
          goto LABEL_14;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_14:

  return v10;
}

- (void)_setPresentationState:(uint64_t)a1
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  id WeakRetained;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t n;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t ii;
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint8_t v87[128];
  uint8_t buf[4];
  __CFString *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v4 = &OBJC_IVAR___URLCompletionProvider__historyWasModified;
  if (*(_QWORD *)(a1 + 1160) == a2)
    return;
  v5 = objc_msgSend((id)a1, "presentationState");
  v6 = objc_msgSend((id)a1, "presentationState");
  v7 = *(_QWORD *)(a1 + 1160);
  *(_QWORD *)(a1 + 1160) = a2;
  objc_msgSend(*(id *)(a1 + 480), "invalidate");
  v9 = a2 == 3 && *(_BYTE *)(a1 + 671) != 0;
  *(_BYTE *)(a1 + 671) = v9;
  v10 = objc_msgSend((id)a1, "presentationState");
  v11 = objc_msgSend((id)a1, "presentationState");
  v12 = *(_QWORD *)(a1 + 1160);
  if ((v7 | 2) == 3)
    goto LABEL_96;
  if ((v12 | 2) == 3)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PresentationAnimation", " isAnimation=YES ", buf, 2u);
    }
    goto LABEL_20;
  }
  if (v7 == 3)
  {
LABEL_96:
    if ((v12 | 2) != 3)
    {
      v13 = WBS_LOG_CHANNEL_PREFIXTabView();
      if (os_signpost_enabled(v13))
      {
        if (*(_QWORD *)(a1 + 1160) == 2)
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        v15 = v14;
        *(_DWORD *)buf = 138412290;
        v89 = v15;
        _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PresentationAnimation", "isPresented=%@", buf, 0xCu);

      }
    }
  }
LABEL_20:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
  v56 = v10;
  v57 = v11;
  if (v5 == 3 && v10 != 3 && v11)
  {
    v54 = v7;
    v18 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabCollectionViewDidCancelDismissal:", a1);
    v19 = WeakRetained;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v20 = *(id *)(a1 + 416);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v79 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v25, "tabCollectionViewDidCancelDismissal:", a1);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
      }
      while (v22);
    }

    v6 = v18;
    v5 = 3;
    v10 = v56;
    v11 = v57;
    WeakRetained = v19;
    v4 = &OBJC_IVAR___URLCompletionProvider__historyWasModified;
  }
  switch(a2)
  {
    case 0:
      -[TabOverview _updateBorrowedContentView]((id *)a1);
      objc_msgSend(WeakRetained, "tabCollectionViewDidDismiss:", a1);
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v26 = *(id *)(a1 + 416);
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v82, 16);
      if (!v27)
        goto LABEL_88;
      v28 = v27;
      v55 = WeakRetained;
      v29 = v5;
      v30 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v59 != v30)
            objc_enumerationMutation(v26);
          v32 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v32, "tabCollectionViewDidDismiss:", a1);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v82, 16);
      }
      while (v28);
      goto LABEL_87;
    case 1:
      if (!v6)
      {
        v54 = v7;
        v33 = WeakRetained;
        objc_msgSend(WeakRetained, "tabCollectionViewWillPresent:", a1);
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v34 = *(id *)(a1 + 416);
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v75;
          do
          {
            for (k = 0; k != v36; ++k)
            {
              if (*(_QWORD *)v75 != v37)
                objc_enumerationMutation(v34);
              v39 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v39, "tabCollectionViewWillPresent:", a1);
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
          }
          while (v36);
        }

        objc_msgSend((id)a1, "setNeedsLayout");
        v6 = 0;
        v10 = v56;
        v11 = v57;
        WeakRetained = v33;
        v4 = &OBJC_IVAR___URLCompletionProvider__historyWasModified;
        v7 = v54;
      }
      *(_QWORD *)(a1 + v4[331]) = v7;
      if (*(_BYTE *)(a1 + 448))
      {
        -[TabOverview _updateDisplayedItems](a1);
        *(_BYTE *)(a1 + 448) = 0;
      }
      objc_msgSend((id)a1, "layoutIfNeeded", v54);
      *(_QWORD *)(a1 + v4[331]) = 1;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v26 = *(id *)(a1 + 440);
      v40 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v71;
        do
        {
          for (m = 0; m != v41; ++m)
          {
            if (*(_QWORD *)v71 != v42)
              objc_enumerationMutation(v26);
            -[TabOverview _updateTargetLocationForDisplayedItem:](a1, *(void **)(*((_QWORD *)&v70 + 1) + 8 * m));
          }
          v41 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
        }
        while (v41);
      }
      goto LABEL_88;
    case 2:
      objc_msgSend(WeakRetained, "tabCollectionViewDidPresent:", a1);
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v26 = *(id *)(a1 + 416);
      v44 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
      if (!v44)
        goto LABEL_88;
      v45 = v44;
      v55 = WeakRetained;
      v29 = v5;
      v46 = *(_QWORD *)v67;
      do
      {
        for (n = 0; n != v45; ++n)
        {
          if (*(_QWORD *)v67 != v46)
            objc_enumerationMutation(v26);
          v48 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * n);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v48, "tabCollectionViewDidPresent:", a1);
        }
        v45 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
      }
      while (v45);
      goto LABEL_87;
    case 3:
      if (!v6)
        goto LABEL_89;
      objc_msgSend(WeakRetained, "tabCollectionViewWillDismiss:", a1);
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v26 = *(id *)(a1 + 416);
      v49 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
      if (!v49)
        goto LABEL_88;
      v50 = v49;
      v55 = WeakRetained;
      v29 = v5;
      v51 = *(_QWORD *)v63;
      do
      {
        for (ii = 0; ii != v50; ++ii)
        {
          if (*(_QWORD *)v63 != v51)
            objc_enumerationMutation(v26);
          v53 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * ii);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v53, "tabCollectionViewWillDismiss:", a1);
        }
        v50 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
      }
      while (v50);
LABEL_87:
      v5 = v29;
      v10 = v56;
      v11 = v57;
      WeakRetained = v55;
LABEL_88:

LABEL_89:
      if ((v5 == 3) != (v10 == 3))
        -[TabOverview _didChangeDismissing:](a1, v10 == 3);
      if ((v6 != 0) != (v11 != 0))
        -[TabOverview _didChangeVisibility:](a1, v11 != 0);
      -[TabOverview _updateTabCloseRecognizer]((void *)a1);

      break;
    default:
      goto LABEL_89;
  }
}

- (void)_updatePresentationStateIfSteady
{
  uint64_t v2;

  if (a1 && !*(_QWORD *)(a1 + 424) && !*(_BYTE *)(a1 + 665))
  {
    if (objc_msgSend((id)a1, "presentationState") == 3)
    {
      v2 = 0;
    }
    else
    {
      if (*(_QWORD *)(a1 + 1160) != 1)
        return;
      v2 = 2;
    }
    -[TabOverview _setPresentationState:](a1, v2);
  }
}

- (void)_notifySteadyStateUpdatedIfNeeded
{
  int v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(unsigned __int8 *)(a1 + 1156);
    *(_BYTE *)(a1 + 1156) = -[TabOverview _checkSteadyState](a1);
    if (v2 != *(unsigned __int8 *)(a1 + 1156))
    {
      objc_msgSend((id)a1, "stateUpdateHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend((id)a1, "stateUpdateHandler");
        v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v4[2](v4, *(unsigned __int8 *)(a1 + 1156));

      }
      objc_msgSend((id)a1, "pptStateUpdateHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend((id)a1, "pptStateUpdateHandler");
        v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v6[2](v6, *(unsigned __int8 *)(a1 + 1156));

      }
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = *(id *)(a1 + 416);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v12, "tabCollectionView:didChangeSteadyState:", a1, *(unsigned __int8 *)(a1 + 1156), (_QWORD)v13);
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

    }
  }
}

void __32__TabOverview__checkSteadyState__block_invoke(uint64_t a1, double a2, double a3, double a4, long double a5)
{
  -[TabOverview _constrainLocation:](*(_QWORD *)(a1 + 32), a2, a3, a4, a5);
}

- (void)_startClosingItem:(uint64_t)a1
{
  id *v3;
  id *v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double *v24;
  void *v25;
  void *v26;
  id *v27;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!*(_BYTE *)(a1 + 672))
    {
      v27 = v3;
      v5 = -[TabOverviewItem closing]((_BOOL8)v3);
      v4 = v27;
      if (!v5)
      {
        -[TabOverviewItem setClosing:]((uint64_t)v27, 1);
        -[TabOverviewItem layoutInfo](v27);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "location");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;
        -[TabOverviewItem layoutInfo](v27);
        v16 = (double *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo setCloseLastLayoutLocation:](v16, v9, v11, v13, v15);

        v17 = -[TabOverview _targetLocationForItem:inItems:](a1, v27, *(void **)(a1 + 1176));
        v19 = v18;
        v21 = v20;
        v23 = v22;
        -[TabOverviewItem layoutInfo](v27);
        v24 = (double *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo setCloseStartLocation:](v24, v17, v19, v21, v23);

        -[TabOverviewItem layoutInfo](v27);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setDecelerationFactor:", 0.991);

        v4 = v27;
      }
    }
  }

}

- (void)_removeViewsForItem:(uint64_t)a1
{
  void *v2;
  id *v3;
  id v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 648);
    v3 = a2;
    LODWORD(v2) = objc_msgSend(v2, "containsObject:", v3);
    -[TabOverviewItem layoutInfo](v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[TabOverviewItemLayoutInfo setVisibleInTabOverview:]((uint64_t)v4, (int)v2);
  }
}

- (void)copyLocationFromItem:(id)a3 toItem:(id)a4
{
  id *v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = (id *)a4;
  -[TabOverviewItem layoutInfo]((id *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItem layoutInfo](v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabOverviewItemLayoutInfo setInterpolatedLocation:]((uint64_t)v9, v8);
  -[TabOverview setNeedsLayout](self, "setNeedsLayout");
}

- (uint64_t)_resetToSteadyState
{
  uint64_t v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  long double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  double v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 432);
    objc_msgSend(v2, "targetLocation");
    -[TabOverview _constrainLocation:](v1, v3, v4, v5, v6);
    objc_msgSend(v2, "resetToLocation:");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = (void *)v1;
    v7 = *(id *)(v1 + 440);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          v12 = *(id **)(*((_QWORD *)&v28 + 1) + 8 * i);
          -[TabOverviewItem layoutInfo](v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "targetLocation");
          objc_msgSend(v14, "resetToLocation:");
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          -[TabOverviewItem layoutInfo](v12);
          v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo interpolatedValues](v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v25 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
                v22 = -[TabOverviewInterpolatedValue targetValue](v21);
                -[TabOverviewInterpolatedValue resetToValue:](v21, v22);
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v18);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v9);
    }

    objc_msgSend(v23, "_updateDisplayLink");
    return objc_msgSend(v23, "setNeedsLayout");
  }
  return result;
}

- (void)copyGeometryFromTabOverview:(id)a3
{
  id *v4;
  void **p_items;
  NSUInteger v6;
  id *v7;
  TabOverviewInterpolatedLocation *interpolatedLocation;
  double v9;
  double v10;
  double v11;
  long double v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  p_items = (void **)&self->_items;
  v6 = -[NSArray count](self->_items, "count");
  v7 = v4 + 147;
  if (v6 == objc_msgSend(v4[147], "count"))
  {
    interpolatedLocation = self->_interpolatedLocation;
    objc_msgSend(v4[54], "targetLocation");
    -[TabOverview _constrainLocation:]((uint64_t)self, v9, v10, v11, v12);
    -[TabOverviewInterpolatedLocation resetToLocation:](interpolatedLocation, "resetToLocation:");
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_displayedItems);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *p_items;
    v15 = *v7;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __43__TabOverview_copyGeometryFromTabOverview___block_invoke;
    v29[3] = &unk_1E9CFAE10;
    v16 = v13;
    v30 = v16;
    objc_msgSend(v14, "safari_enumerateZippedValuesWithArray:withBlock:", v15, v29);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          -[TabOverviewItem layoutInfo](*(id **)(*((_QWORD *)&v25 + 1) + 8 * v21));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "targetLocation", (_QWORD)v25);
          objc_msgSend(v23, "resetToLocation:");

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v19);
    }

    -[TabOverview _updateDisplayLink](self, "_updateDisplayLink");
    -[TabOverview setNeedsLayout](self, "setNeedsLayout");

  }
  else
  {
    v24 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[TabOverview copyGeometryFromTabOverview:].cold.1(p_items, v24, v7);
  }

}

void __43__TabOverview_copyGeometryFromTabOverview___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  _QWORD *v6;
  _QWORD *v7;
  id *v8;

  v5 = a3;
  v8 = a2;
  -[TabOverviewItem layoutInfo](v8);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItem layoutInfo](v5);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  -[TabOverviewItemLayoutInfo copyGeometryFromLayoutInfo:](v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", v8);

}

- (void)setInteractiveInsertionProgress:(double)a3 forItem:(id)a4
{
  void *v6;
  void *v7;
  id *v8;

  v8 = (id *)a4;
  if (-[TabOverviewItem incoming]((_BOOL8)v8))
  {
    -[TabOverviewItem layoutInfo](v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v6, a3);

    -[TabOverviewItem layoutInfo](v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo setInteractivelyInserted:]((uint64_t)v7, 1);

    -[TabOverview setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)targetItemForDropAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  long double v12;
  long double v13;
  long double v14;
  _QWORD v16[12];

  y = a3.y;
  x = a3.x;
  -[TabOverviewInterpolatedLocation location](self->_interpolatedLocation, "location");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = exp(v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__TabOverview_targetItemForDropAtPoint___block_invoke;
  v16[3] = &unk_1E9CFAE38;
  v16[4] = self;
  *(long double *)&v16[5] = v14;
  v16[6] = v7;
  v16[7] = v9;
  v16[8] = v11;
  *(long double *)&v16[9] = v13;
  *(CGFloat *)&v16[10] = x;
  *(CGFloat *)&v16[11] = y;
  -[TabOverview _closestItemWithDistanceCalculationBlock:](self, v16);
  return (id)objc_claimAutoreleasedReturnValue();
}

double __40__TabOverview_targetItemForDropAtPoint___block_invoke(uint64_t a1, id *a2)
{
  id *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  long double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double MidX;
  CGFloat MidY;
  CGRect v23;
  CGRect v24;

  v3 = *(id **)(a1 + 32);
  -[TabOverviewItem layoutInfo](a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetLocation");
  v10 = -[TabOverview _rectForItemLocation:](v3, v6, v7, v8, v9);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = *(double *)(a1 + 40);
  v18 = *(double *)(a1 + 48) + v10 * v17;
  v19 = *(double *)(a1 + 56) + v12 * v17;
  v23.origin.x = v18;
  v23.origin.y = v19;
  v23.size.width = v14;
  v23.size.height = v16;
  MidX = CGRectGetMidX(v23);
  v24.origin.x = v18;
  v24.origin.y = v19;
  v24.size.width = v14;
  v24.size.height = v16;
  MidY = CGRectGetMidY(v24);
  return (*(double *)(a1 + 88) - MidY) * (*(double *)(a1 + 88) - MidY)
       + (*(double *)(a1 + 80) - MidX) * (*(double *)(a1 + 80) - MidX);
}

- (_QWORD)_closestItemWithDistanceCalculationBlock:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  uint64_t *v10;
  _QWORD v11[4];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__16;
    v16 = __Block_byref_object_dispose__16;
    v17 = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v5 = (void *)a1[147];
    v11[3] = 0x7FEFFFFFFFFFFFFFLL;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__TabOverview__closestItemWithDistanceCalculationBlock___block_invoke;
    v7[3] = &unk_1E9CFAFF0;
    v7[4] = a1;
    v8 = v3;
    v9 = v11;
    v10 = &v12;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);
    a1 = (id)v13[5];

    _Block_object_dispose(v11, 8);
    _Block_object_dispose(&v12, 8);

  }
  return a1;
}

- (int64_t)itemDragContentType
{
  return 6;
}

- (ReorderingAutoscroller)reorderingAutoscroller
{
  ReorderingAutoscroller *reorderingAutoscroller;
  ReorderingAutoscroller *v4;
  ReorderingAutoscroller *v5;

  reorderingAutoscroller = self->_reorderingAutoscroller;
  if (!reorderingAutoscroller)
  {
    v4 = objc_alloc_init(ReorderingAutoscroller);
    v5 = self->_reorderingAutoscroller;
    self->_reorderingAutoscroller = v4;

    -[ReorderingAutoscroller setDelegate:](self->_reorderingAutoscroller, "setDelegate:", self);
    reorderingAutoscroller = self->_reorderingAutoscroller;
  }
  return reorderingAutoscroller;
}

- (id)_itemAtPoint:(CGFloat)a3
{
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  id *v10;
  id *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGPoint v32;
  CGPoint v33;
  CGRect v34;
  CGRect v35;

  if (a1)
  {
    objc_msgSend(a1[85], "frame");
    v32.x = a2;
    v32.y = a3;
    if (!CGRectContainsPoint(v34, v32))
    {
      v6 = objc_msgSend(a1[147], "count");
      if (v6)
      {
        for (i = v6 - 1; i != -1; --i)
        {
          if (objc_msgSend(a1[95], "isSearching"))
          {
            objc_msgSend(a1[95], "indexesMatchingSearchTerm");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v8, "containsIndex:", i);

            if (!v9)
              continue;
          }
          objc_msgSend(a1[147], "objectAtIndex:", i);
          v10 = (id *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItem layoutInfo](v10);
          v11 = (id *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo itemView](v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v12, "bounds");
            v14 = v13;
            v16 = v15;
            v18 = v17;
            v20 = v19;
            objc_msgSend(v12, "_touchInsets");
            v22 = v14 + v21;
            v24 = v16 + v23;
            v26 = v18 - (v21 + v25);
            v28 = v20 - (v23 + v27);
            objc_msgSend(a1, "convertPoint:toView:", v12, a2, a3);
            v33.x = v29;
            v33.y = v30;
            v35.origin.x = v22;
            v35.origin.y = v24;
            v35.size.width = v26;
            v35.size.height = v28;
            if (CGRectContainsPoint(v35, v33))
            {

              return v10;
            }
          }

        }
      }
    }
  }
  v10 = 0;
  return v10;
}

- (id)viewForItem:(id)a3
{
  id *v4;
  TabOverview *v5;
  void *v6;
  id *v7;

  v4 = (id *)a3;
  -[TabOverviewItem tabOverview](v4);
  v5 = (TabOverview *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[TabOverview _layoutDisplayedItem:forceVisible:]((uint64_t)self, v4, 1);
    -[TabOverviewItem layoutInfo](v4);
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo itemView](v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)supportsDropTransitionToItemView
{
  return 1;
}

- (id)targetedDragPreviewForDroppingItem:(id)a3
{
  id *v4;
  TabOverview *v5;
  void *v6;
  NSArray *items;
  id *v8;
  double v9;
  double v10;
  double v11;
  long double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  void *v36;
  void *v37;
  _OWORD v39[3];
  _QWORD v40[4];
  id *v41;

  v4 = (id *)a3;
  -[TabOverviewItem tabOverview](v4);
  v5 = (TabOverview *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  if (v5 != self)
  {
    items = self->_items;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __50__TabOverview_targetedDragPreviewForDroppingItem___block_invoke;
    v40[3] = &unk_1E9CFAE60;
    v41 = v4;
    -[NSArray safari_firstObjectPassingTest:](items, "safari_firstObjectPassingTest:", v40);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = -[TabOverviewItemLayoutInfo initWithTabOverview:item:]((id *)[TabOverviewItemLayoutInfo alloc], self, v4);
  -[TabOverviewItemLayoutInfo setInterpolatedSnapshotAlpha:]((uint64_t)v4, v8);
  v9 = -[TabOverview _targetLocationForItem:inItems:]((uint64_t)self, v4, self->_items);
  v13 = -[TabOverview _rectForItemLocation:]((id *)&self->super.super.super.isa, v9, v10, v11, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (objc_msgSend(v6, "isPinned"))
  {
    -[SFTabOverviewItemContentView titlePadding](self->_titleSizingItemView, "titlePadding");
    v21 = v20;
    v23 = v22;
    -[SFTabOverviewItemContentView titleHeight](self->_titleSizingItemView, "titleHeight");
    v19 = fmax(v23 + v21 + v24, 30.0);
  }
  -[TabOverviewItemLayoutInfo setFrame:]((uint64_t)v8, v13, v15, v17, v19);
  -[TabOverviewItemLayoutInfo setSnapshotAlpha:]((uint64_t)v8, 1.0);
  -[TabOverviewItemLayoutInfo setAlpha:]((uint64_t)v8, 1.0);
  -[TabOverviewItemLayoutInfo setVisibleInTabOverview:]((uint64_t)v8, 1);
  -[TabOverviewItemLayoutInfo itemView](v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCornerRadius:", 15.0);
  -[TabOverview window](self, "window");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  objc_msgSend(v25, "setWindowSize:", v27, v28);

  objc_msgSend(v25, "setTransitionProgress:", 1.0);
  objc_msgSend(v25, "setTabLayout:", self->_presentedTabLayout);
  objc_msgSend(v25, "setWasUsedForPreviewing:", 1);
  objc_msgSend(v25, "layoutIfNeeded");
  objc_msgSend(v25, "removeFromSuperview");
  -[TabOverview _createPreviewContainerForItem:]((id *)&self->super.super.super.isa, v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverview _layoutDisplayedItem:forceVisible:]((uint64_t)self, v4, 0);
  -[TabOverview _layOutPreviewContainers]((uint64_t)self);
  v30 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBackgroundColor:", v31);

  objc_msgSend(v25, "previewView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setZPosition:", 998.0);

  objc_msgSend(v25, "setPreviewViewHidden:", 0);
  objc_msgSend(v32, "bounds");
  objc_msgSend(v32, "convertRect:toView:", v25);
  v34 = objc_alloc(MEMORY[0x1E0DC3770]);
  UIRectGetCenter();
  v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v39[0] = *MEMORY[0x1E0C9BAA8];
  v39[1] = v35;
  v39[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v36 = (void *)objc_msgSend(v34, "initWithContainer:center:transform:", v29, v39);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:target:", v32, v30, v36);

  return v37;
}

uint64_t __50__TabOverview_targetedDragPreviewForDroppingItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (TabOverviewTargetedPreviewContainer)_createPreviewContainerForItem:(id *)a1
{
  id v3;
  uint64_t v4;
  id v5;
  TabOverviewTargetedPreviewContainer *v6;
  double v7;
  double v8;
  double v9;
  long double v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;
  CGRect v18;

  v3 = a2;
  if (a1)
  {
    if (!a1[82])
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = a1[82];
      a1[82] = (id)v4;

    }
    v6 = objc_alloc_init(TabOverviewTargetedPreviewContainer);
    -[TabOverviewTargetedPreviewContainer setTabOverviewItem:](v6, "setTabOverviewItem:", v3);
    v7 = -[TabOverview _targetLocationForItem:inItems:]((uint64_t)a1, v3, a1[147]);
    v18.origin.x = -[TabOverview _rectForItemLocation:](a1, v7, v8, v9, v10);
    -[TabOverviewTargetedPreviewContainer setInitialItemWidth:](v6, "setInitialItemWidth:", CGRectGetWidth(v18));
    objc_initWeak(&location, a1);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __46__TabOverview__createPreviewContainerForItem___block_invoke;
    v15 = &unk_1E9CFAF78;
    objc_copyWeak(&v16, &location);
    -[TabOverviewTargetedPreviewContainer setDidRemoveLastSubviewBlock:](v6, "setDidRemoveLastSubviewBlock:", &v12);
    objc_msgSend(a1[92], "addSubview:", v6, v12, v13, v14, v15);
    objc_msgSend(a1[82], "addObject:", v6);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)willAnimateDropForItem:(id)a3 withAnimator:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  TabOverview *v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__TabOverview_willAnimateDropForItem_withAnimator___block_invoke;
  v8[3] = &unk_1E9CFAE88;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a4, "addCompletion:", v8);

}

void __51__TabOverview_willAnimateDropForItem_withAnimator___block_invoke(uint64_t a1)
{
  -[TabOverviewItemLayoutInfo setInterpolatedSnapshotAlpha:](*(_QWORD *)(a1 + 32), 0);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "containsObject:", *(_QWORD *)(a1 + 32)))
    -[TabOverview _layoutDisplayedItem:forceVisible:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32), 0);
}

- (void)willBeginShowingContextMenuForItem:(id)a3
{
  NSCountedSet *itemsShowingContextMenu;
  id v5;

  itemsShowingContextMenu = self->_itemsShowingContextMenu;
  v5 = a3;
  -[NSCountedSet addObject:](itemsShowingContextMenu, "addObject:", v5);
  -[TabOverview _updateItemShowsCloseButton:]((uint64_t)self, v5);

}

- (void)didEndShowingContextMenuForItem:(id)a3
{
  id v4;

  v4 = a3;
  -[NSCountedSet removeObject:](self->_itemsShowingContextMenu, "removeObject:", v4);
  if ((-[NSCountedSet containsObject:](self->_itemsShowingContextMenu, "containsObject:", v4) & 1) == 0)
  {
    -[TabOverview _updateItemShowsCloseButton:]((uint64_t)self, v4);
    if (!-[NSArray containsObject:](self->_items, "containsObject:", v4))
    {
      -[TabOverview _removeViewsForItem:]((uint64_t)self, v4);
      -[TabOverview _updateDisplayedItems]((uint64_t)self);
    }
  }

}

- (id)targetedDragPreviewForLiftingItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (-[TabOverview presentationState](self, "presentationState"))
  {
    -[TabOverview viewForItem:](self, "viewForItem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0DC3768]);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v7);

      v8 = objc_alloc(MEMORY[0x1E0DC3D88]);
      objc_msgSend(v5, "previewView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithView:parameters:", v9, v6);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)targetedPreviewForDismissingMenuForItem:(id)a3
{
  id *v4;
  id v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  UIView *menuPreviewContainerView;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  UIView *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  UIView *v38;
  __int128 v39;
  void *v40;
  id v41;
  UIView *scrollingContainerView;
  double v43;
  double v44;
  double v45;
  double v46;
  double v48;
  _OWORD v49[3];
  CGAffineTransform v50;
  CGAffineTransform v51;

  v4 = (id *)a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[TabOverviewItem layoutInfo](v4);
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo itemView](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "snapshotViewAfterScreenUpdates:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (-[TabOverviewItem closing]((_BOOL8)v4))
    {
      v10 = objc_alloc(MEMORY[0x1E0DC3D90]);
      -[TabOverviewItemLayoutInfo itemView](v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "previewView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithView:", v12);
    }
    else
    {
      -[TabOverviewItemLayoutInfo itemView](v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");

      v48 = -[TabOverview _targetLocationForItem:inItems:]((uint64_t)self, v4, self->_items);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "location");
      v23 = v22;

      if (v20 != v23)
      {
        v24 = objc_alloc(MEMORY[0x1E0DC3B88]);
        menuPreviewContainerView = self->_menuPreviewContainerView;
        UIRectGetCenter();
        v27 = v26;
        v29 = v28;
        CGAffineTransformMakeScale(&v51, 0.0, 0.0);
        v11 = (void *)objc_msgSend(v24, "initWithContainer:center:transform:", menuPreviewContainerView, &v51, v27, v29);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v9, v5, v11);
LABEL_12:

        goto LABEL_13;
      }
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "resetToLocation:", v48, v16, v18, v20);
      -[TabOverview _layoutDisplayedItem:forceVisible:]((uint64_t)self, v4, 0);
      -[TabOverview viewForItem:](self, "viewForItem:", v4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v30;
      if (v30)
      {
        objc_msgSend(v30, "layoutIfNeeded");
        objc_msgSend(v12, "previewView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = self->_menuPreviewContainerView;
        objc_msgSend(v31, "bounds");
        UIRectGetCenter();
        -[UIView convertPoint:fromView:](v32, "convertPoint:fromView:", v31);
        v34 = v33;
        v36 = v35;
        v37 = objc_alloc(MEMORY[0x1E0DC3770]);
        v38 = self->_menuPreviewContainerView;
        v39 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v49[0] = *MEMORY[0x1E0C9BAA8];
        v49[1] = v39;
        v49[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v40 = (void *)objc_msgSend(v37, "initWithContainer:center:transform:", v38, v49, v34, v36);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v31, v5, v40);

      }
      else
      {
        v41 = objc_alloc(MEMORY[0x1E0DC3B88]);
        scrollingContainerView = self->_scrollingContainerView;
        UIRectGetCenter();
        v44 = v43;
        v46 = v45;
        CGAffineTransformMakeScale(&v50, 0.0, 0.0);
        v31 = (void *)objc_msgSend(v41, "initWithContainer:center:transform:", scrollingContainerView, &v50, v44, v46);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v9, v5, v31);
      }

    }
    goto LABEL_12;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (void)activateItem:(id)a3
{
  -[TabOverview _dismissWithItem:]((uint64_t)self, a3);
}

- (void)_dismissWithItem:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1 && !-[TabOverviewItem closing]((_BOOL8)v3))
  {
    *(_BYTE *)(a1 + 1136) = objc_msgSend(v4, "isPinned");
    if (!*(_QWORD *)(a1 + 1232) && objc_msgSend((id)a1, "targetItemLiftsFromGrid"))
    {
      -[TabOverviewItem layoutInfo]((id *)v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDecelerationFactor:", 0.985);

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = *(id *)(a1 + 440);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          -[TabOverviewItem layoutInfo](*(id **)(*((_QWORD *)&v14 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v13, 0.988);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 432), "setDecelerationFactor:", 0.985, (_QWORD)v14);
    objc_msgSend((id)a1, "_dismissWithItemAtCurrentDecelerationFactor:", v4);
  }

}

- (void)_relinquishReusableTabOverviewItemView:(uint64_t)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1 && v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "wasUsedForPreviewing"))
    {
      objc_msgSend(v4, "removeFromSuperview");
    }
    else
    {
      objc_msgSend(v4, "setHidden:", 1);
      objc_msgSend(v4, "updateSnapshotWithImage:", 0);
      objc_msgSend(*(id *)(a1 + 1000), "addObject:", v4);
    }
    v3 = v4;
  }

}

- (void)_didReceiveMemoryWarning:(id)a3
{
  -[NSMutableArray removeAllObjects](self->_itemViewReuseStack, "removeAllObjects", a3);
}

- (void)enumerateItemsOrderedByVisibility:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, _QWORD);
  NSArray *items;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  NSUInteger v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD aBlock[4];
  id v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__TabOverview_enumerateItemsOrderedByVisibility___block_invoke;
  aBlock[3] = &unk_1E9CFAEB0;
  v5 = v4;
  v36 = v5;
  v6 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  if (-[SFTabCollectionSearchController isSearching](self->_searchController, "isSearching"))
  {
    items = self->_items;
    -[SFTabCollectionSearchController indexesMatchingSearchTerm](self->_searchController, "indexesMatchingSearchTerm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectsAtIndexes:](items, "objectsAtIndexes:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(v10);
          v6[2](v6, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v12);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = self->_items;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
          if ((objc_msgSend(v10, "containsObject:", v20, (_QWORD)v27) & 1) == 0)
            v6[2](v6, v20);
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v17);
    }

  }
  if (-[NSArray count](self->_items, "count", (_QWORD)v27))
  {
    if (!-[NSArray containsObject:](self->_items, "containsObject:", self->_visiblyCenteredItem))
      -[TabOverview _updateVisiblyCenteredItem]((id *)&self->super.super.super.isa);
    v21 = -[NSArray indexOfObject:](self->_items, "indexOfObject:", self->_visiblyCenteredItem);
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      v22 = 0;
    else
      v22 = v21;
    v23 = v22;
    while (1)
    {
      v24 = v23;
      v25 = v22 + 1;
      if (-[NSArray count](self->_items, "count") < v22 + 1)
        v25 = -[NSArray count](self->_items, "count");
      if (v23)
        --v23;
      else
        v23 = 0;
      if (v25 > v22)
        enumerateSubarrayWithRange(self->_items, v22, v25, v6);
      if (v23 < v24)
        enumerateSubarrayWithRange(self->_items, v23, v24, v6);
      v26 = v25 == v22;
      v22 = v25;
      if (v26)
      {
        v22 = v25;
        if (v23 == v24)
          break;
      }
    }
  }

}

void __49__TabOverview_enumerateItemsOrderedByVisibility___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)_close:(id)a3
{
  id v4;
  NSArray *items;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSArray *v9;
  NSObject *v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[TabOverview presentationState](self, "presentationState") != 3)
  {
    items = self->_items;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __22__TabOverview__close___block_invoke;
    v17[3] = &unk_1E9CFAED8;
    v18 = v4;
    v6 = -[NSArray indexOfObjectPassingTest:](items, "indexOfObjectPassingTest:", v17);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6;
      v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_items;
        v10 = v8;
        v11 = -[NSArray count](v9, "count");
        *(_DWORD *)buf = 134218240;
        v20 = v7;
        v21 = 2048;
        v22 = v11;
        _os_log_impl(&dword_1D7CA3000, v10, OS_LOG_TYPE_DEFAULT, "Tap close button on tab overview item at index: %ld, number of items: %ld", buf, 0x16u);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[TabOverview _isClosingLastItem](self, "_isClosingLastItem"))
      {
        -[TabOverview _startClosingItem:]((uint64_t)self, v13);
        self->_swipeCloseTranslation = 0.0;
        -[TabOverviewItem layoutInfo]((id *)v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setDecelerationFactor:", 0.988);

        -[NSMutableArray addObject:](self->_deferredClosingItems, "addObject:", v13);
        objc_msgSend(WeakRetained, "tabOverview:willInteractivelyCloseItem:", self, v13);
      }
      else
      {
        objc_msgSend(WeakRetained, "tabCollectionView:closeItem:", self, v13);
      }
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "didCloseTabWithTrigger:tabCollectionViewType:", 0, 2);

      -[TabOverview setNeedsLayout](self, "setNeedsLayout");
      -[TabOverview _updateDisplayedItems]((uint64_t)self);
      -[TabOverview _crossDissolveToSteadyStateIfNeededWithAnimationCompletion:](self, 0);

    }
  }

}

BOOL __22__TabOverview__close___block_invoke(uint64_t a1, id *a2)
{
  id *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  -[TabOverviewItem layoutInfo](a2);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo itemView](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closeButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == *(void **)(a1 + 32);

  return v6;
}

- (void)_crossDissolveToSteadyStateIfNeededWithAnimationCompletion:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  if (a1 && UIAccessibilityIsReduceMotionEnabled())
  {
    v4 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(a1, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__TabOverview__crossDissolveToSteadyStateIfNeededWithAnimationCompletion___block_invoke;
    v6[3] = &unk_1E9CF1900;
    v6[4] = a1;
    objc_msgSend(v4, "transitionWithView:duration:options:animations:completion:", v5, 5242880, v6, v3, 0.25);

  }
}

- (BOOL)_isClosingLastItem
{
  return -[NSArray count](self->_items, "count") == 1;
}

- (void)_pan:(id)a3
{
  uint64_t v4;
  CGFloat v5;
  CGFloat v6;
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
  long double v18;
  double v19;
  double v20;
  double v21;
  double v22;
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
  int64_t presentedTabLayout;
  TabOverviewInterpolatedLocation *interpolatedLocation;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  unint64_t v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v57;
  double v58;
  double v59;
  double v60;
  id v61;

  v61 = a3;
  v4 = objc_msgSend(v61, "state");
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 == 2)
    {
      objc_msgSend(v61, "translationInView:", self);
      v28 = v27;
      v30 = v29;
      -[TabOverviewInterpolatedLocation location](self->_interpolatedLocation, "location");
      v32 = v31;
      v34 = v33;
      v35 = -[TabOverview _offsetForRubberbandOffset:]((uint64_t)self, v31, v33);
      presentedTabLayout = self->_presentedTabLayout;
      if (presentedTabLayout == 1)
      {
        v35 = v35 + v28 - self->_lastPanTranslation.x;
      }
      else if (!presentedTabLayout)
      {
        v36 = v36 + v30 - self->_lastPanTranslation.y;
      }
      v59 = -[TabOverview _rubberbandOffsetForOffset:]((uint64_t)self, v35, v36);
      -[TabOverviewInterpolatedLocation moveBy:atTime:](self->_interpolatedLocation, "moveBy:atTime:", v59 - v32, v60 - v34, CFAbsoluteTimeGetCurrent());
      self->_lastPanTranslation.x = v28;
      self->_lastPanTranslation.y = v30;
      -[TabOverview _updateDisplayLink](self, "_updateDisplayLink");
      -[TabOverview setNeedsLayout](self, "setNeedsLayout");
    }
    else if (v4 == 1)
    {
      if (self)
        _UIUpdateRequestActivate();
      -[TabOverviewInterpolatedLocation beginInteractionAtTime:](self->_interpolatedLocation, "beginInteractionAtTime:", CFAbsoluteTimeGetCurrent());
      objc_msgSend(v61, "translationInView:", self);
      self->_lastPanTranslation.x = v5;
      self->_lastPanTranslation.y = v6;
      self->_dragging = 1;
      -[SFTabOverviewSearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
      -[TabOverview _updateDisplayLink](self, "_updateDisplayLink");
      if (self->_presentationState == 2)
        -[TabOverviewInterpolatedLocation setDecelerationFactor:](self->_interpolatedLocation, "setDecelerationFactor:", 0.9985);
    }
    goto LABEL_51;
  }
  self->_shouldBounceToConstrainedLocation = 1;
  -[TabOverviewInterpolatedLocation location](self->_interpolatedLocation, "location");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[TabOverviewInterpolatedLocation location](self->_interpolatedLocation, "location");
  -[TabOverview _constrainLocation:]((uint64_t)self, v15, v16, v17, v18);
  if (v8 != v22 || v10 != v19 || v12 != v20 || v14 != v21)
  {
    v26 = 0.988;
LABEL_24:
    -[TabOverviewInterpolatedLocation setDecelerationFactor:](self->_interpolatedLocation, "setDecelerationFactor:", v26);
    goto LABEL_25;
  }
  if (self->_presentationState == 2)
  {
    v26 = 0.9985;
    goto LABEL_24;
  }
LABEL_25:
  interpolatedLocation = self->_interpolatedLocation;
  objc_msgSend(v61, "velocityInView:", self);
  -[TabOverviewInterpolatedLocation endInteractionWithVelocity:](interpolatedLocation, "endInteractionWithVelocity:");
  self->_dragging = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", &unk_1E9D62368);
  if (-[TabOverview _showsTitle](self))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -[TabOverview _titleHeight]((id *)&self->super.super.super.isa));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v40);

  }
  if (-[TabOverview _isDismissibleSearchBarAvailable]((uint64_t)self))
  {
    -[SFTabOverviewSearchBar text](self->_searchBar, "text");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "length");

    if (!v42)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dismissibleSearchBarHeight + -[TabOverview _titleHeight]((id *)&self->super.super.super.isa));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v43);

    }
  }
  if ((unint64_t)objc_msgSend(v39, "count") < 2)
  {
LABEL_45:
    -[TabOverview _updateDisplayLink](self, "_updateDisplayLink");
  }
  else
  {
    -[TabOverviewInterpolatedLocation location](self->_interpolatedLocation, "location");
    v45 = -v44;
    -[TabOverviewInterpolatedLocation targetLocation](self->_interpolatedLocation, "targetLocation");
    v46 = 0;
    v48 = -v47;
    while (v46 < objc_msgSend(v39, "count") - 1)
    {
      objc_msgSend(v39, "objectAtIndexedSubscript:", v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "doubleValue");
      v51 = v50;

      objc_msgSend(v39, "objectAtIndexedSubscript:", ++v46);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "doubleValue");
      v54 = v53;

      if (v51 < v48 && v54 > v48)
      {
        _SFUninterpolate();
        if (v54 > v45 && v51 < v45)
          v57 = v54;
        else
          v57 = v51;
        if (v55 >= 0.5)
          v58 = v57;
        else
          v58 = v51;
        -[TabOverviewInterpolatedLocation setTargetLocation:](self->_interpolatedLocation, "setTargetLocation:", 0.0, -v58, 0.0, 0.0);
        -[TabOverviewInterpolatedLocation setDecelerationFactor:](self->_interpolatedLocation, "setDecelerationFactor:", 0.985);
        goto LABEL_45;
      }
    }
    -[TabOverview _updateDisplayLink](self, "_updateDisplayLink");
    if (!self)
      goto LABEL_48;
  }
  _UIUpdateRequestDeactivate();
LABEL_48:

LABEL_51:
}

- (void)test_scrollToTopWithoutAnimation
{
  -[TabOverviewInterpolatedLocation resetToLocation:](self->_interpolatedLocation, "resetToLocation:", 0.0, 0.0, 0.0, 0.0);
  -[TabOverview setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  char isKindOfClass;
  id v5;

  if (self->_panRecognizer == a3)
  {
    v5 = a4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_tabClose:(id)a3
{
  id v4;
  int v5;
  double Current;
  uint64_t v7;
  CGFloat v8;
  CGFloat v9;
  TabOverviewItem *v10;
  TabOverviewItem *v11;
  NSObject *v12;
  NSArray *items;
  TabOverviewItem *v14;
  NSObject *v15;
  uint64_t v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  TabOverviewItem *v22;
  TabOverviewItem *swipeClosingItem;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  _BOOL4 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  NSObject *v47;
  id WeakRetained;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  long double v57;
  double v58;
  long double v59;
  NSObject *v60;
  int v61;
  uint64_t v62;
  __int16 v63;
  NSUInteger v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[TabOverview _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  Current = CFAbsoluteTimeGetCurrent();
  v7 = objc_msgSend(v4, "state");
  if ((unint64_t)(v7 - 3) < 2)
  {
    -[TabOverviewItem layoutInfo]((id *)&self->_swipeClosingItem->super.isa);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "endInteraction");
    v22 = self->_swipeClosingItem;
    -[TabOverviewItem setClosing:]((uint64_t)self->_swipeClosingItem, 0);
    swipeClosingItem = self->_swipeClosingItem;
    self->_swipeClosingItem = 0;

    -[UIPointerInteraction invalidate](self->_cursorInteraction, "invalidate");
    v24 = -[TabOverview _canCloseItem:]((uint64_t)self, v22);
    objc_msgSend(v21, "location");
    v26 = v25;
    objc_msgSend(v21, "targetLocation");
    v28 = v26 - v27;
    objc_msgSend(v4, "translationInView:", self);
    v30 = v29;
    if (v5)
      v31 = -v28;
    else
      v31 = v28;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "safari_doubleForKey:defaultValue:", CFSTR("DebugSwipeToCloseTabThresholdByVelocity"), 100.0);
    v34 = v33;

    if (v31 <= v34)
    {
      if (v5)
        v43 = -v30;
      else
        v43 = v30;
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "safari_doubleForKey:defaultValue:", CFSTR("DebugSwipeToCloseTabThresholdByDistance"), 120.0);
      v46 = v45;

      v35 = v43 > v46;
      if (!v24)
        goto LABEL_29;
    }
    else
    {
      v35 = 1;
      if (!v24)
      {
LABEL_29:
        v47 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v61 = 67109120;
          LODWORD(v62) = v24 ^ 1;
          _os_log_impl(&dword_1D7CA3000, v47, OS_LOG_TYPE_DEFAULT, "End swiping to close tab overview item restoring previous state: %d", (uint8_t *)&v61, 8u);
        }
        if (v24)
        {
          -[TabOverviewItem setClosing:]((uint64_t)v22, 1);
          -[NSMutableArray addObject:](self->_deferredClosingItems, "addObject:", v22);
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "tabOverview:willInteractivelyCloseItem:", self, v22);

          objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "didCloseTabWithTrigger:tabCollectionViewType:", 3, 2);

        }
        if (!-[TabOverviewItem closing]((_BOOL8)v22))
          objc_msgSend(v21, "setDecelerationFactor:", 0.988);
        _UIUpdateRequestDeactivate();

        goto LABEL_45;
      }
    }
    v24 = objc_msgSend(v4, "state") == 3 && v35;
    goto LABEL_29;
  }
  if (v7 == 2)
  {
    objc_msgSend(v4, "translationInView:", self);
    v37 = v36;
    if ((-[TabOverview _canCloseItem:]((uint64_t)self, self->_swipeClosingItem) & 1) != 0 || v37 >= 0.0)
    {
      -[TabOverview bounds](self, "bounds");
      v51 = v50;
      -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](self, -[NSArray count](self->_items, "count"), self->_pinnedItemCount);
      v53 = v51 / (v52 + v52);
      if (v53 >= 0.001)
      {
        v54 = fmin(v37, 0.0);
        v55 = fmax(v37, 0.0);
        if (v5)
          v55 = v54;
        if (v37 < v55)
          v53 = -v53;
        v37 = v55 + (1.0 - 1.0 / ((v37 - v55) / v53 * 0.55 + 1.0)) * v53;
      }
    }
    else
    {
      v38 = -v37;
      -[TabOverview bounds](self, "bounds");
      v40 = v39;
      -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](self, -[NSArray count](self->_items, "count"), self->_pinnedItemCount);
      v42 = v40 / (v41 + v41);
      if (v42 >= 0.001)
      {
        if (v37 > 0.0)
          v42 = -v42;
        v38 = (1.0 - 1.0 / (v38 / v42 * 0.55 + 1.0)) * v42 + 0.0;
      }
      v37 = -v38;
    }
    -[TabOverviewItem layoutInfo]((id *)&self->_swipeClosingItem->super.isa);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v56);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "location");
    v59 = v37 * (exp(v57) / (1.0 / (v58 * *MEMORY[0x1E0D4F2E8] + 1.0)));
    v60 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      -[TabOverview _tabClose:].cold.1(v60, v59);
    objc_msgSend(v21, "moveBy:atTime:", (double)(self->_swipeCloseTranslation - v59), 0.0, Current);
    self->_swipeCloseTranslation = v59;
LABEL_45:

    goto LABEL_46;
  }
  if (v7 == 1)
  {
    if (self)
      _UIUpdateRequestActivate();
    objc_msgSend(v4, "locationInView:", self);
    -[TabOverview _itemAtPoint:]((id *)&self->super.super.super.isa, v8, v9);
    v10 = (TabOverviewItem *)objc_claimAutoreleasedReturnValue();
    v11 = self->_swipeClosingItem;
    self->_swipeClosingItem = v10;

    -[UIPointerInteraction invalidate](self->_cursorInteraction, "invalidate");
    v12 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      items = self->_items;
      v14 = self->_swipeClosingItem;
      v15 = v12;
      v16 = -[NSArray indexOfObject:](items, "indexOfObject:", v14);
      v17 = -[NSArray count](self->_items, "count");
      v61 = 134218240;
      v62 = v16;
      v63 = 2048;
      v64 = v17;
      _os_log_impl(&dword_1D7CA3000, v15, OS_LOG_TYPE_DEFAULT, "Begin swiping to close tab overview item at index: %ld, number of items: %ld", (uint8_t *)&v61, 0x16u);

    }
    -[TabOverviewItem layoutInfo]((id *)&self->_swipeClosingItem->super.isa);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "beginInteractionAtTime:", Current);

    -[TabOverview _startClosingItem:]((uint64_t)self, self->_swipeClosingItem);
    self->_swipeCloseTranslation = 0.0;
  }
LABEL_46:
  -[TabOverview setNeedsLayout](self, "setNeedsLayout");

}

- (void)_dismissWithItemAtCurrentDecelerationFactor:(id)a3
{
  id WeakRetained;
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
  void *v15;
  void *v16;
  TabOverviewItem *itemToActivate;
  id v18;

  v18 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabCollectionView:didSelectItem:", self, v18);
  -[TabOverview _updateBorrowedContentView]((id *)&self->super.super.super.isa);
  self->_transitioningItemIsPinned = objc_msgSend(v18, "isPinned");
  if (self->_presentedTabLayout || !-[TabOverview targetItemLiftsFromGrid](self, "targetItemLiftsFromGrid"))
  {
    -[TabOverviewInterpolatedLocation setTargetLocation:](self->_interpolatedLocation, "setTargetLocation:", -[TabOverview _targetLocationForDismissalWithItem:]((uint64_t)self, v18));
  }
  else
  {
    -[TabOverviewInterpolatedLocation targetLocation](self->_interpolatedLocation, "targetLocation");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[TabOverview _itemHeaderHeight]((uint64_t)self);
    v14 = v8 - v13;
    -[TabOverviewItem layoutInfo]((id *)v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTargetLocation:", v6, v14, v10, v12);

  }
  itemToActivate = self->_itemToActivate;
  self->_itemToActivate = 0;

  -[TabOverview _setPresentationState:]((uint64_t)self, 3);
  -[TabOverview _updateSnapshotAlphaForItem:]((uint64_t)self, v18);
  -[TabOverview _updateDisplayLink](self, "_updateDisplayLink");
  -[TabOverview _crossDissolveToSteadyStateIfNeededWithAnimationCompletion:](self, 0);

}

- (long)_applyItemPosition:(double)a3 toLocation:(double)a4
{
  double v8;

  if (!a1)
    return 0.0;
  if (a2 == 2)
  {
    -[TabOverview _itemReferenceBounds](a1);
    return a3 + v8 * -1.2 * exp(a6);
  }
  return a3;
}

- (uint64_t)_isDecelerating
{
  uint64_t v1;
  void *v2;
  char v3;
  void *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v1 = a1;
  if (a1)
  {
    v2 = *(void **)(a1 + 432);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __30__TabOverview__isDecelerating__block_invoke;
    v10[3] = &unk_1E9CFADE8;
    v10[4] = v1;
    v3 = objc_msgSend(v2, "isInSteadyStateWithConstraints:", v10);
    v4 = *(void **)(v1 + 488);
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(v1 + 1208));
      objc_msgSend(WeakRetained, "currentItemForTabOverview:", v1);
      v5 = (id *)objc_claimAutoreleasedReturnValue();

    }
    -[TabOverviewItem layoutInfo](v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverview _currentScalePercentageForItemAtLocation:](v1, v8);

    if ((v3 & 1) != 0 || *(_QWORD *)(v1 + 1160) != 2)
      v1 = 0;
    else
      v1 = _SFEqualWithEpsilon();

  }
  return v1;
}

void __30__TabOverview__isDecelerating__block_invoke(uint64_t a1, double a2, double a3, double a4, long double a5)
{
  -[TabOverview _constrainLocation:](*(_QWORD *)(a1 + 32), a2, a3, a4, a5);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  TabOverviewInterpolatedLocation *interpolatedLocation;
  BOOL v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[TabOverview _isDecelerating]((uint64_t)self))
  {
    interpolatedLocation = self->_interpolatedLocation;
    -[TabOverviewInterpolatedLocation location](interpolatedLocation, "location");
    -[TabOverviewInterpolatedLocation resetToLocation:](interpolatedLocation, "resetToLocation:");
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  self->_lastDecelerationWasInterrupted = v9;
  v10.receiver = self;
  v10.super_class = (Class)TabOverview;
  -[TabOverview touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v6, v7);

}

- (void)_tap:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  NSObject *v9;
  NSArray *items;
  NSObject *v11;
  uint64_t v12;
  NSUInteger v13;
  id WeakRetained;
  int v15;
  uint64_t v16;
  __int16 v17;
  NSUInteger v18;
  uint64_t v19;
  CGPoint v20;
  CGRect v21;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  if (-[TabOverview _shouldDimItemsForSearch]((uint64_t)self))
  {
    -[SFTabCollectionSearchController endSearching](self->_searchController, "endSearching");
    return;
  }
  -[TabOverviewToolbar frame](self->_header, "frame");
  v20.x = v5;
  v20.y = v7;
  if (CGRectContainsPoint(v21, v20))
  {
    if (!self->_barPlacement)
      -[TabOverview scrollToTop]((uint64_t)self);
    return;
  }
  if (!self->_lastDecelerationWasInterrupted && !-[NSCountedSet count](self->_itemsShowingContextMenu, "count"))
  {
    -[TabOverview _itemAtPoint:]((id *)&self->super.super.super.isa, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if ((unint64_t)(self->_barPlacement - 1) > 1
        || -[SFTabCollectionSearchController isSearching](self->_searchController, "isSearching")
        || !-[TabOverview _hitPointIsInEmptySpace:]((uint64_t)self, v5, v7))
      {
        return;
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "currentItemForTabOverview:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      items = self->_items;
      v11 = v9;
      v12 = -[NSArray indexOfObject:](items, "indexOfObject:", v8);
      v13 = -[NSArray count](self->_items, "count");
      v15 = 134218240;
      v16 = v12;
      v17 = 2048;
      v18 = v13;
      _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_DEFAULT, "Select tab overview item at index: %ld, number of items: %ld", (uint8_t *)&v15, 0x16u);

    }
    -[TabOverview _dismissWithItem:]((uint64_t)self, v8);

  }
}

- (uint64_t)scrollToTop
{
  id *v1;
  double v2;
  double v3;
  double v4;
  double v5;

  if (result)
  {
    v1 = (id *)result;
    if (objc_msgSend((id)result, "presentationState") == 3)
      return 0;
    objc_msgSend(v1[54], "targetLocation");
    if (v5 == 0.0 && v2 == 0.0 && v3 == 0.0 && v4 == 0.0)
    {
      return 0;
    }
    else
    {
      objc_msgSend(v1[54], "setTargetLocation:", 0.0, 0.0, 0.0, 0.0);
      objc_msgSend(v1[54], "setDecelerationFactor:", 0.985);
      objc_msgSend(v1, "_updateDisplayLink");
      return 1;
    }
  }
  return result;
}

- (uint64_t)_hitPointIsInEmptySpace:(double)a3
{
  _QWORD *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  long double v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  long double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  if (result)
  {
    v5 = (_QWORD *)result;
    result = objc_msgSend(*(id *)(result + 1176), "count");
    if (result)
    {
      v6 = result;
      objc_msgSend(v5, "convertPoint:toView:", v5[92], a2, a3);
      v8 = v7;
      v10 = v9;
      v11 = -[TabOverview _targetLocationForItemAtIndex:inNumberOfItems:insertionStyle:pinnedItemCount:]((uint64_t)v5, v6 - 1, v6, 0, v5[140]);
      v25.origin.x = -[TabOverview _rectForItemLocation:]((id *)v5, v11, v12, v13, v14);
      x = v25.origin.x;
      y = v25.origin.y;
      width = v25.size.width;
      height = v25.size.height;
      if (v10 <= CGRectGetMaxY(v25))
      {
        v19 = -[TabOverview _layoutIndexForItemIndex:pinnedItemCount:]((uint64_t)v5, v6, v5[140]);
        v20 = -[TabOverview _tabsPerRow]((uint64_t)v5);
        if (v19 % v20
          && (v21 = -[TabOverview _targetLocationForItemAtIndex:inNumberOfItems:insertionStyle:pinnedItemCount:]((uint64_t)v5, v6 - 1 - v19 % v20, v6, 0, v5[140]), v26.origin.x = -[TabOverview _rectForItemLocation:]((id *)v5, v21, v22, v23, v24), v10 > CGRectGetMaxY(v26)))
        {
          v27.origin.x = x;
          v27.origin.y = y;
          v27.size.width = width;
          v27.size.height = height;
          return v8 > CGRectGetMaxX(v27);
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

- (double)_targetLocationForPresentation
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  double v6;
  double v7;
  double v8;
  long double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (!a1)
    return 0.0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
  objc_msgSend(WeakRetained, "currentItemForTabOverview:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 1200) && objc_msgSend(*(id *)(a1 + 1176), "containsObject:"))
  {
    v4 = *(void **)(a1 + 1200);
    v5 = 1;
  }
  else
  {
    v5 = 0;
    v4 = v3;
  }
  v6 = -[TabOverview _targetLocationForItem:inItems:](a1, v4, *(void **)(a1 + 1176));
  v10 = -[TabOverview _targetLocationCenteredOnItemLocation:]((id *)a1, v6, v7, v8, v9);
  v12 = v10;
  if ((v5 & 1) == 0)
  {
    -[TabOverview _constrainLocation:](a1, v10, v11, 0.0, 0.0);
    v12 = v13;
  }

  return v12;
}

uint64_t __29__TabOverview_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __29__TabOverview_layoutSubviews__block_invoke_2(uint64_t result)
{
  --*(_QWORD *)(*(_QWORD *)(result + 32) + 1104);
  return result;
}

uint64_t __29__TabOverview_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 688), "setAlpha:", 0.0);
}

uint64_t __29__TabOverview_layoutSubviews__block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  double v2;
  unint64_t v4;
  double v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 48))
  {
    v4 = objc_msgSend(*(id *)(v1 + 1176), "count", 1.0);
    v1 = *(_QWORD *)(a1 + 32);
    v2 = 0.0;
    if (v4 >= 2 && !*(_BYTE *)(v1 + 665))
    {
      objc_msgSend(*(id *)(v1 + 432), "targetLocation", 0.0);
      v1 = *(_QWORD *)(a1 + 32);
      v2 = (*(double *)(a1 + 40) + v5) / *(double *)(v1 + 1080) + 1.0;
    }
  }
  return objc_msgSend(*(id *)(v1 + 688), "setAlpha:", v2);
}

uint64_t __29__TabOverview_layoutSubviews__block_invoke_104(uint64_t a1)
{
  char v2;
  uint64_t v3;
  double v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 688), "showsCancelButton");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 0.0;
  if ((v2 & 1) == 0)
  {
    v4 = 1.0;
    if (*(_QWORD *)(v3 + 1224) != 1)
    {
      v4 = 0.0;
      if (*(double *)(a1 + 40) > 0.5)
        v4 = 1.0;
    }
  }
  return objc_msgSend(*(id *)(v3 + 680), "setAlpha:", v4);
}

uint64_t __29__TabOverview_layoutSubviews__block_invoke_3_106(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setAlpha:", *(double *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1016);
  v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 80);
  return objc_msgSend(v2, "setTransform:", v5);
}

void __29__TabOverview_layoutSubviews__block_invoke_4_107(uint64_t a1, double a2, double a3, double a4, long double a5)
{
  -[TabOverview _constrainLocation:](*(_QWORD *)(a1 + 32), a2, a3, a4, a5);
}

void __46__TabOverview__createPreviewContainerForItem___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v4, "removeFromSuperview");
    objc_msgSend(WeakRetained[82], "removeObject:", v4);
  }

}

- (void)attachView:(id)a3 withReferenceRect:(CGRect)a4 toItem:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id *v10;
  id v11;
  void *v12;
  id v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = (id *)a5;
  v11 = a3;
  -[TabOverviewItem layoutInfo](v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo setAttachedView:]((uint64_t)v12, v11);

  -[TabOverviewItem layoutInfo](v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[TabOverviewItemLayoutInfo setAttachedViewReferenceRect:]((uint64_t)v13, x, y, width, height);
}

- (id)attachedViewForItem:(id)a3
{
  void *v3;
  void *v4;

  -[TabOverviewItem layoutInfo]((id *)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo attachedView]((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)_beginPresentation
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    -[TabOverview _setPresentationState:](result, 1);
    -[TabOverview _updateSnapshotAlphaForItem:](v1, *(void **)(v1 + 488));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v2 = *(id *)(v1 + 440);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v2);
          v7 = *(id **)(*((_QWORD *)&v13 + 1) + 8 * i);
          -[TabOverviewItem layoutInfo](v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v9, 0.962);

          v10 = 0.988;
          if (-[TabOverviewItem isAlternateItem]((_BOOL8)v7))
            v10 = dbl_1D7EA8A20[*(_QWORD *)(v1 + 1192) == 1];
          -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setDecelerationFactor:", v10, (_QWORD)v13);

          -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v12, 0.988);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }

    return objc_msgSend((id)v1, "becomeFirstResponder");
  }
  return result;
}

- (void)presentAnimated:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  void *v17;
  void *v18;
  long double v19;
  long double v20;
  NSTimer *v21;
  NSTimer *itemActivationTimer;
  id v23;
  _QWORD v24[4];
  id v25;
  BOOL v26;
  uint8_t buf[4];
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_presentationState != 2)
  {
    v3 = a3;
    v5 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v28 = v3;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Present tab overview animated: %d", buf, 8u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "currentItemForTabOverview:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    self->_transitioningItemIsPinned = objc_msgSend(v7, "isPinned");
    -[TabOverview _beginPresentation]((uint64_t)self);
    v8 = -[TabOverview _targetLocationForPresentation]((uint64_t)self);
    v12 = v8;
    v13 = v9;
    v14 = v10;
    v15 = v11;
    if (v3)
    {
      if (self->_presentedTabLayout || !-[TabOverview targetItemLiftsFromGrid](self, "targetItemLiftsFromGrid"))
      {
        -[TabOverviewInterpolatedLocation setTargetLocation:](self->_interpolatedLocation, "setTargetLocation:", v12, v13, v14, v15);
        v16 = 0;
      }
      else
      {
        -[TabOverviewInterpolatedLocation resetToLocation:](self->_interpolatedLocation, "resetToLocation:", v12, v13, v14, v15);
        v16 = 1;
      }
      -[TabOverview setNeedsLayout](self, "setNeedsLayout");
      if (!self->_presentedTabLayout && -[TabOverview targetItemLiftsFromGrid](self, "targetItemLiftsFromGrid"))
      {
        -[TabOverviewItem layoutInfo]((id *)v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setDecelerationFactor:", 0.985);

      }
      -[TabOverviewInterpolatedLocation setDecelerationFactor:](self->_interpolatedLocation, "setDecelerationFactor:", dbl_1D7EA8A50[self->_itemToActivate == 0]);
    }
    else
    {
      -[TabOverviewInterpolatedLocation resetToLocation:](self->_interpolatedLocation, "resetToLocation:", v8, v9, v10, v11);
      -[TabOverview setNeedsLayout](self, "setNeedsLayout");
      -[TabOverview _setPresentationState:]((uint64_t)self, 2);
      v16 = 1;
    }
    if (self->_itemToActivate)
    {
      -[TabOverviewInterpolatedLocation decelerationFactor](self->_interpolatedLocation, "decelerationFactor");
      v20 = -0.00230258509 / log(v19);
      -[NSTimer invalidate](self->_itemActivationTimer, "invalidate");
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__activateItemToActivate_, 0, 0, (double)v20);
      v21 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      itemActivationTimer = self->_itemActivationTimer;
      self->_itemActivationTimer = v21;

      if (!self->_defersActivation)
        -[TabOverview _setPresentationState:]((uint64_t)self, 3);
    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __31__TabOverview_presentAnimated___block_invoke;
    v24[3] = &unk_1E9CFAFA0;
    v26 = v3;
    v23 = v7;
    v25 = v23;
    -[TabOverview _crossDissolveToSteadyStateIfNeededWithAnimationCompletion:](self, v24);
    if (v16)
      -[TabOverview _updateDisplayedItems]((uint64_t)self);
    if (!v3)
      -[TabOverview _resetToSteadyState]((uint64_t)self);

  }
}

void __31__TabOverview_presentAnimated___block_invoke(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 40))
  {
    -[TabOverviewItem layoutInfo](*(id **)(a1 + 32));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo pulseDimmingView]((uint64_t)v1);

  }
}

uint64_t __74__TabOverview__crossDissolveToSteadyStateIfNeededWithAnimationCompletion___block_invoke(uint64_t a1)
{
  return -[TabOverview _resetToSteadyState](*(_QWORD *)(a1 + 32));
}

- (void)setItemToActivate:(id)a3
{
  TabOverviewItem *v5;

  v5 = (TabOverviewItem *)a3;
  if (self->_itemToActivate != v5)
  {
    objc_storeStrong((id *)&self->_itemToActivate, a3);
    if (self->_defersActivation && -[TabOverview presentationState](self, "presentationState") != 3)
      -[TabOverview setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setDefersActivation:(BOOL)a3
{
  TabOverview *v3;
  uint64_t v4;

  if (self->_defersActivation != a3)
  {
    self->_defersActivation = a3;
    if (!a3)
    {
      v3 = self;
      if (-[TabOverview presentationState](v3, "presentationState") == 1)
      {

      }
      else
      {
        v4 = -[TabOverview presentationState](v3, "presentationState");

        if (v4 != 2)
          return;
      }
      if (!-[NSTimer isValid](v3->_itemActivationTimer, "isValid"))
        -[TabOverview _activateItemToActivate]((uint64_t)v3);
    }
  }
}

- (void)_activateItemToActivate
{
  void *v2;
  id WeakRetained;
  id v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 1200);
    if (v2)
    {
      v4 = v2;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
      objc_msgSend(WeakRetained, "tabCollectionView:didSelectItem:", a1, v4);

      objc_msgSend((id)a1, "_dismissWithItemAtCurrentDecelerationFactor:", v4);
    }
  }
}

- (void)_activateItemToActivate:(id)a3
{
  NSTimer *itemActivationTimer;

  itemActivationTimer = self->_itemActivationTimer;
  self->_itemActivationTimer = 0;

  if (!self->_defersActivation)
    -[TabOverview _activateItemToActivate]((uint64_t)self);
}

double __38__TabOverview__closestItemToLocation___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  double v17;
  double v18;

  v4 = -[TabOverview _targetLocationForItem:inItems:](*(_QWORD *)(a1 + 32), a2, *(void **)(*(_QWORD *)(a1 + 32) + 1176));
  v6 = v5;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8 = v3;
    v9 = *(double *)(a1 + 64);
    v11 = *(double *)(a1 + 40);
    v10 = *(double *)(a1 + 48);
    objc_msgSend(v7, "bounds");
    v13 = v12;
    v15 = v14;
    v16 = exp(v8 - v9);
    v17 = v13 * 0.5 + v16 * (v11 - v13 * 0.5);
    v18 = v15 * 0.5 + v16 * (v10 - v15 * 0.5);
  }
  else
  {
    v18 = 0.0;
    v17 = 0.0;
  }
  return (v6 - v18) * (v6 - v18) + (v4 - v17) * (v4 - v17);
}

void __56__TabOverview__closestItemWithDistanceCalculationBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v6;
  int v7;
  double v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (!objc_msgSend(*(id *)(a1[4] + 760), "isSearching")
    || (objc_msgSend(*(id *)(a1[4] + 760), "indexesMatchingSearchTerm"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "containsIndex:", a3),
        v6,
        v7))
  {
    v8 = (*(double (**)(void))(a1[5] + 16))();
    v9 = *(_QWORD *)(a1[6] + 8);
    if (v8 < *(double *)(v9 + 24))
    {
      *(double *)(v9 + 24) = v8;
      objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
    }
  }

}

- (void)beginInteractivePresentationWithOffset:(CGPoint)a3 scale:(double)a4
{
  double y;
  double x;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  TabOverview *v12;
  uint64_t v13;
  void *v14;
  char v15;
  id *p_interactivePresentationStartingItem;
  SFScrollingPanGestureRecognizer *panRecognizer;
  _BOOL8 v18;
  double Current;
  id *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  long double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  long double v33;
  double v34;
  double v35;
  NSHashTable *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  TabOverviewItem *interactivelyLiftingItem;
  TabOverviewItem *v43;
  TabOverviewInterpolatedLocation *interpolatedLocation;
  NSTimer *itemActivationTimer;
  TabOverviewItem *itemToActivate;
  TabOverviewItem *v47;
  void *v48;
  void *v49;
  TabOverviewInterpolatedLocation *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  long double v63;
  long double v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  double v77;
  uint64_t v78;
  CGPoint v79;

  y = a3.y;
  x = a3.x;
  v78 = *MEMORY[0x1E0C80C00];
  v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v79.x = x;
    v79.y = y;
    NSStringFromCGPoint(v79);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v75 = v10;
    v76 = 2048;
    v77 = a4;
    _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_DEFAULT, "Begin interactive tab overview presentation with offset: %{public}@, scale: %f", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = self;
  if (-[TabOverview presentationState](v12, "presentationState") == 1)
  {

LABEL_6:
    v14 = 0;
    v15 = 1;
    goto LABEL_8;
  }
  v13 = -[TabOverview presentationState](v12, "presentationState");

  if (v13 == 2)
    goto LABEL_6;
  objc_msgSend(WeakRetained, "currentItemForTabOverview:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
LABEL_8:
  p_interactivePresentationStartingItem = (id *)&v12->_interactivePresentationStartingItem;
  objc_storeStrong((id *)&v12->_interactivePresentationStartingItem, v14);
  if ((v15 & 1) == 0)

  v12->_transitioningItemIsPinned = objc_msgSend(*p_interactivePresentationStartingItem, "isPinned");
  v12->_pinching = 1;
  v68 = -[TabOverview presentationState](v12, "presentationState");
  -[TabOverview _shiftLocationsForEffectiveLayoutIfNeeded]((uint64_t)v12);
  panRecognizer = v12->_panRecognizer;
  v18 = -[TabOverview presentationState](v12, "presentationState") != 3 && !v12->_pinching;
  -[SFScrollingPanGestureRecognizer setEnabled:](panRecognizer, "setEnabled:", v18);
  Current = CFAbsoluteTimeGetCurrent();
  v12->_interactivePresentationZoomLockStartTime = -1.79769313e308;
  if (!*p_interactivePresentationStartingItem)
  {
    -[TabOverview _itemAtPoint:]((id *)&v12->super.super.super.isa, x, y);
    v20 = (id *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v67 = a4;
      -[TabOverviewInterpolatedLocation location](v12->_interpolatedLocation, "location");
      v22 = v21;
      v66 = v23;
      v25 = v24;
      -[TabOverviewItem layoutInfo](v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "location");
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v34 = exp(v25);
      v35 = exp(v33);
      if ((_SFEqualWithEpsilon() & 1) == 0)
      {
        v29 = (v29 * v34 - v22 * v35) / (v34 - v35);
        v31 = (v31 * v34 - v66 * v35) / (v34 - v35);
      }
      v12->_interactivePresentationZoomLockOffset.x = v29;
      v12->_interactivePresentationZoomLockOffset.y = v31;

      v12->_interactivePresentationZoomLockStartTime = Current;
      v12->_transitioningItemIsPinned = objc_msgSend(v20, "isPinned");
      a4 = v67;
      if (!v12->_presentedTabLayout && -[TabOverview targetItemLiftsFromGrid](v12, "targetItemLiftsFromGrid"))
      {
        objc_storeStrong((id *)&v12->_interactivelyLiftingItem, v20);
        objc_msgSend(WeakRetained, "tabCollectionView:didSelectItem:", v12, v20);
      }
    }

  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v36 = v12->_presentationObservers;
  v37 = -[NSHashTable countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v70 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v41, "tabOverviewWillBeginInteractivePresentation:", v12);
      }
      v38 = -[NSHashTable countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    }
    while (v38);
  }

  -[TabOverview _beginPresentation]((uint64_t)v12);
  v12->_interactivePresentationLastTimestamp = Current;
  v12->_interactivePresentationVelocity = (CGPoint)*MEMORY[0x1E0C9D538];
  v12->_interactivePresentationFirstOffset.x = x;
  v12->_interactivePresentationFirstOffset.y = y;
  if (v12->_presentedTabLayout || !-[TabOverview targetItemLiftsFromGrid](v12, "targetItemLiftsFromGrid"))
  {
    interpolatedLocation = v12->_interpolatedLocation;
    -[TabOverviewInterpolatedLocation location](interpolatedLocation, "location", *(_QWORD *)&v66);
    -[TabOverviewInterpolatedLocation resetToLocation:](interpolatedLocation, "resetToLocation:");
    -[TabOverviewInterpolatedLocation beginInteractionAtTime:](v12->_interpolatedLocation, "beginInteractionAtTime:", Current);
    v12->_interactivePresentationLastOffset.x = x;
    v12->_interactivePresentationLastOffset.y = y;
    v12->_interactivePresentationLastLogScale = log(a4);
  }
  else
  {
    interactivelyLiftingItem = v12->_interactivelyLiftingItem;
    if (interactivelyLiftingItem)
    {
      v43 = interactivelyLiftingItem;
    }
    else
    {
      objc_msgSend(WeakRetained, "currentItemForTabOverview:", v12);
      v43 = (TabOverviewItem *)objc_claimAutoreleasedReturnValue();
    }
    v47 = v12->_interactivelyLiftingItem;
    v12->_interactivelyLiftingItem = v43;

    -[TabOverviewItem layoutInfo]((id *)&v12->_interactivelyLiftingItem->super.isa);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      v50 = v12->_interpolatedLocation;
      -[TabOverviewInterpolatedLocation location](v50, "location");
      -[TabOverviewInterpolatedLocation resetToLocation:](v50, "resetToLocation:");
      objc_msgSend(v49, "location");
      v53 = v52;
      v55 = v54;
      v57 = v56;
    }
    else
    {
      v53 = -[TabOverview _targetLocationForPresentation]((uint64_t)v12);
      v59 = v58;
      v55 = v60;
      v57 = v61;
      -[TabOverviewInterpolatedLocation resetToLocation:](v12->_interpolatedLocation, "resetToLocation:");
      -[TabOverview _itemHeaderHeight]((uint64_t)v12);
      v51 = v59 - v62;
    }
    objc_msgSend(v49, "resetToLocation:", v53, v51, v55, v57, *(_QWORD *)&v66);
    objc_msgSend(v49, "beginInteractionAtTime:", Current);
    objc_msgSend(v49, "location");
    v64 = exp(v63);
    v65 = v12->_interactivePresentationFirstOffset.y;
    v12->_interactivePresentationLastOffset.x = v12->_interactivePresentationFirstOffset.x - x * v64;
    v12->_interactivePresentationLastOffset.y = v65 - y * v64;
    v12->_interactivePresentationLastLogScale = -log(a4);

  }
  -[NSTimer invalidate](v12->_itemActivationTimer, "invalidate");
  itemActivationTimer = v12->_itemActivationTimer;
  v12->_itemActivationTimer = 0;

  itemToActivate = v12->_itemToActivate;
  v12->_itemToActivate = 0;

}

- (uint64_t)_shiftLocationsForEffectiveLayoutIfNeeded
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id WeakRetained;
  id *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  long double v26;
  double v27;
  double v28;
  double v29;
  long double v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  id *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 1232);
    if (v2 == *(_QWORD *)(result + 1072))
    {
      return 0;
    }
    else
    {
      *(_QWORD *)(result + 1072) = v2;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v3 = *(id *)(result + 1176);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v48 != v6)
              objc_enumerationMutation(v3);
            -[TabOverview _updateTargetLocationForDisplayedItem:](v1, *(void **)(*((_QWORD *)&v47 + 1) + 8 * i));
          }
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v5);
      }

      WeakRetained = objc_loadWeakRetained((id *)(v1 + 1208));
      objc_msgSend(WeakRetained, "currentItemForTabOverview:", v1);
      v9 = (id *)objc_claimAutoreleasedReturnValue();

      -[TabOverviewItem layoutInfo](v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "location");
      v13 = v12;
      v15 = v14;
      v17 = v16;

      -[TabOverviewItem layoutInfo](v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "targetLocation");
      v21 = v20;
      v23 = v22;
      v25 = v24;

      v26 = exp(v17 - v25);
      v27 = -(v13 - v21 * v26);
      v28 = -(v15 - v23 * v26);
      objc_msgSend(*(id *)(v1 + 432), "location");
      v30 = exp(v29 - v17);
      objc_msgSend(*(id *)(v1 + 432), "moveInstantaneouslyBy:", (double)(v27 * v30), (double)(v28 * v30));
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v31 = *(id *)(v1 + 1176);
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v44 != v34)
              objc_enumerationMutation(v31);
            v36 = *(id **)(*((_QWORD *)&v43 + 1) + 8 * j);
            -[TabOverviewItem layoutInfo](v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "location", (_QWORD)v43);
            v40 = exp(v39 - v17);

            -[TabOverviewItem layoutInfo](v36);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "moveInstantaneouslyBy:", v27 * v40, v28 * v40);

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v33);
      }

      *(_BYTE *)(v1 + 669) = 0;
      return 1;
    }
  }
  return result;
}

- (void)updateInteractivePresentationWithOffset:(CGPoint)a3 scale:(double)a4
{
  -[TabOverview updateInteractivePresentationWithOffset:scale:animated:](self, "updateInteractivePresentationWithOffset:scale:animated:", 0, a3.x, a3.y, a4);
}

- (void)updateInteractivePresentationWithOffset:(CGPoint)a3 scale:(double)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  NSObject *v10;
  id WeakRetained;
  double v12;
  TabOverviewItem *interactivelyLiftingItem;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  double v21;
  double *p_interactivePresentationLastLogScale;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  TabOverviewItem *v29;
  double v30;
  double v31;
  long double v32;
  CFAbsoluteTime Current;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGPoint *p_interactivePresentationLastOffset;
  double v40;
  double v41;
  double v42;
  double v43;
  TabOverviewItem *v44;
  double v45;
  _BOOL8 v46;
  void *v47;
  void *v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  NSHashTable *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  double v58;
  double v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  v65 = *MEMORY[0x1E0C80C00];
  v10 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[TabOverview updateInteractivePresentationWithOffset:scale:animated:].cold.1(v10, x, y, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabOverviewWillUpdateInteractivePresentation:", self);

  v12 = log(a4);
  interactivelyLiftingItem = self->_interactivelyLiftingItem;
  if (interactivelyLiftingItem)
    v14 = -v12;
  else
    v14 = v12;
  if (interactivelyLiftingItem)
  {
    -[TabOverviewItem layoutInfo]((id *)&interactivelyLiftingItem->super.isa);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "location");
    v18 = v17;

  }
  else
  {
    -[TabOverviewInterpolatedLocation location](self->_interpolatedLocation, "location");
    v18 = v19;
  }
  -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](self, -[NSArray count](self->_items, "count"), self->_pinnedItemCount);
  v21 = log(v20);
  v58 = v14;
  if (v21 < 0.001)
  {
    p_interactivePresentationLastLogScale = &self->_interactivePresentationLastLogScale;
    v23 = v18 + v14 - self->_interactivePresentationLastLogScale;
    if (!self->_interactivelyLiftingItem)
      goto LABEL_23;
LABEL_22:
    v32 = exp(v23);
    x = self->_interactivePresentationFirstOffset.x - x * v32;
    y = self->_interactivePresentationFirstOffset.y - y * v32;
    goto LABEL_23;
  }
  v24 = fmax(v18, 0.0);
  if (v18 >= v24)
    v25 = v21;
  else
    v25 = -v21;
  v26 = (v18 - v24) / v25 + -1.0;
  v27 = v18;
  if (fabs(v26) >= 0.001)
    v27 = v24 + (-1.0 / v26 + -1.0) / 0.55 * v25;
  p_interactivePresentationLastLogScale = &self->_interactivePresentationLastLogScale;
  v28 = v27 + v14 - self->_interactivePresentationLastLogScale;
  v29 = self->_interactivelyLiftingItem;
  v30 = fmax(v28, 0.0);
  v31 = fmax(fmin(v21, v28), 0.0);
  if (!v29)
    v31 = v30;
  if (v28 < v31)
    v21 = -v21;
  v23 = v31 + (1.0 - 1.0 / ((v28 - v31) / v21 * 0.55 + 1.0)) * v21;
  if (v29)
    goto LABEL_22;
LABEL_23:
  Current = CFAbsoluteTimeGetCurrent();
  v34 = fmin(fmax(1.0- (Current- self->_interactivePresentationZoomLockStartTime+ Current- self->_interactivePresentationZoomLockStartTime), 0.0), 1.0);
  v35 = 1.0 - v34;
  v36 = self->_interactivePresentationZoomLockOffset.x * v34;
  v59 = x;
  v37 = v36 + x * (1.0 - v34);
  v38 = self->_interactivePresentationZoomLockOffset.y * v34;
  p_interactivePresentationLastOffset = &self->_interactivePresentationLastOffset;
  v40 = v36 + self->_interactivePresentationLastOffset.x * v35;
  v41 = y;
  v42 = v38 + y * v35;
  v43 = v38 + self->_interactivePresentationLastOffset.y * v35;
  v44 = self->_interactivelyLiftingItem;
  v45 = v23 - v18;
  v46 = !v5;
  if (v44)
  {
    -[TabOverviewItem layoutInfo]((id *)&v44->super.isa);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "moveLogScaleBy:centeringOffset:withLastCenteringOffset:atTime:shiftLocation:", v46, v45, v37, v42, v40, v43, Current);

  }
  else
  {
    -[TabOverviewInterpolatedLocation moveLogScaleBy:centeringOffset:withLastCenteringOffset:atTime:shiftLocation:](self->_interpolatedLocation, "moveLogScaleBy:centeringOffset:withLastCenteringOffset:atTime:shiftLocation:", v46, v45, v37, v42, v40, v43, Current);
  }
  -[TabOverview _updateSnapshotAlphaForItem:]((uint64_t)self, self->_activeItem);
  -[TabOverview setNeedsLayout](self, "setNeedsLayout");
  v49 = Current - self->_interactivePresentationLastTimestamp;
  if (v49 > 0.008)
  {
    v50 = (v59 - p_interactivePresentationLastOffset->x) / v49;
    v51 = (v41 - self->_interactivePresentationLastOffset.y) / v49;
    self->_interactivePresentationVelocity.x = v50;
    self->_interactivePresentationVelocity.y = v51;
  }
  p_interactivePresentationLastOffset->x = v59;
  self->_interactivePresentationLastOffset.y = v41;
  *p_interactivePresentationLastLogScale = v58;
  self->_interactivePresentationLastTimestamp = Current;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v52 = self->_presentationObservers;
  v53 = -[NSHashTable countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v61 != v55)
          objc_enumerationMutation(v52);
        v57 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v57, "tabOverviewDidUpdateInteractivePresentation:", self);
      }
      v54 = -[NSHashTable countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v54);
  }

}

- (id)_itemRightOfItem:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  if (a1)
  {
    v4 = -[TabOverview _layoutIndexForItemIndex:pinnedItemCount:](a1, objc_msgSend(*(id *)(a1 + 1176), "indexOfObject:", v3), *(_QWORD *)(a1 + 1120));
    if ((v4 + 1) % (unint64_t)-[TabOverview _tabsPerRow](a1))
    {
      if (objc_msgSend((id)a1, "_sf_usesLeftToRightLayout"))
        v5 = v4 + 1;
      else
        v5 = v4 - 1;
      -[TabOverview _itemAtLayoutIndex:]((id *)a1, v5);
      a1 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return (id)a1;
}

- (id)_itemLeftOfItem:(uint64_t)a1
{
  id v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a2;
  if (a1)
  {
    v4 = -[TabOverview _layoutIndexForItemIndex:pinnedItemCount:](a1, objc_msgSend(*(id *)(a1 + 1176), "indexOfObject:", v3), *(_QWORD *)(a1 + 1120));
    if (v4 % -[TabOverview _tabsPerRow](a1))
    {
      if (objc_msgSend((id)a1, "_sf_usesLeftToRightLayout"))
        v5 = v4 - 1;
      else
        v5 = v4 + 1;
      -[TabOverview _itemAtLayoutIndex:]((id *)a1, v5);
      a1 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return (id)a1;
}

- (id)_itemBelowItem:(id *)a1
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    v2 = (uint64_t)a1;
    v3 = -[TabOverview _layoutIndexForItemIndex:pinnedItemCount:](v2, objc_msgSend(a1[147], "indexOfObject:", a2), *(_QWORD *)(v2 + 1120));
    v4 = -[TabOverview _tabsPerRow](v2);
    -[TabOverview _itemAtLayoutIndex:]((id *)v2, v4 + v3);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_itemAboveItem:(uint64_t)a1
{
  id v3;
  unint64_t v4;
  unint64_t v5;

  v3 = a2;
  if (a1)
  {
    v4 = -[TabOverview _layoutIndexForItemIndex:pinnedItemCount:](a1, objc_msgSend(*(id *)(a1 + 1176), "indexOfObject:", v3), *(_QWORD *)(a1 + 1120));
    v5 = -[TabOverview _tabsPerRow](a1);
    if (v4 >= v5)
    {
      -[TabOverview _itemAtLayoutIndex:]((id *)a1, v4 - v5);
      a1 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return (id)a1;
}

- (void)_endInteractivePresentationAllowingDismissal:(int)a3 restoringPreviousState:
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  long double v30;
  void *v31;
  long double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int v40;
  int v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  long double v53;
  double v54;
  void *v55;
  void *v56;
  int *v57;
  id *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  long double v71;
  id *v72;
  void *v73;
  void *v74;
  void *v75;
  _BOOL8 v76;
  id *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint8_t v87[128];
  uint8_t buf[4];
  int v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v6 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v89 = a3;
    _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_DEFAULT, "End interactive tab overview presentation restoring previous state: %d", buf, 8u);
  }
  *(_BYTE *)(a1 + 665) = 0;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v7 = *(id *)(a1 + 416);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v83 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "tabOverviewWillEndInteractivePresentation:", a1);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
    }
    while (v9);
  }

  v13 = (id *)*(id *)(a1 + 504);
  v14 = *(void **)(a1 + 504);
  *(_QWORD *)(a1 + 504) = 0;

  if (v13)
  {
    -[TabOverviewItem layoutInfo](v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endInteraction");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 432), "endInteraction");
  }
  objc_msgSend(*(id *)(a1 + 432), "setDecelerationFactor:", 0.99);
  v77 = v13;
  if (!a2)
  {
    v17 = 0;
    v18 = 0;
    goto LABEL_43;
  }
  if (!a3)
  {
    if (v13)
    {
      v17 = v13;
      -[TabOverviewItem layoutInfo](v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "targetLocation");
      v22 = v21;
      objc_msgSend(v20, "location");
      v18 = v22 < v23;

      goto LABEL_43;
    }
    objc_msgSend(*(id *)(a1 + 432), "targetLocation");
    v25 = v24;
    objc_msgSend(*(id *)(a1 + 432), "location");
    v27 = v26;
    v28 = *(double *)(a1 + 840);
    v29 = *(double *)(a1 + 848);
    objc_msgSend(*(id *)(a1 + 432), "targetLocation");
    v31 = *(void **)(a1 + 784);
    if (!v31 || (v32 = exp(v30), v29 * v29 + v28 * v28 <= 1750.0 / v32 * (1750.0 / v32)))
    {
      objc_msgSend(*(id *)(a1 + 432), "targetLocation");
      -[TabOverview _closestItemToLocation:]((_QWORD *)a1, v36, v37, v38, v39);
      v17 = (id *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
LABEL_35:
      if (objc_msgSend(v17, "isPinned"))
      {

        v17 = 0;
      }
      if (v25 > v27)
        v41 = 1;
      else
        v41 = v40;
      if (v17)
        v18 = v41;
      else
        v18 = 0;
      goto LABEL_43;
    }
    v33 = *(double *)(a1 + 848);
    v34 = fmax(fabs(*(double *)(a1 + 840)), fabs(v33));
    if (v34 == *(double *)(a1 + 840))
    {
      -[TabOverview _itemLeftOfItem:](a1, v31);
      v35 = objc_claimAutoreleasedReturnValue();
    }
    else if (v34 == -*(double *)(a1 + 840))
    {
      -[TabOverview _itemRightOfItem:](a1, v31);
      v35 = objc_claimAutoreleasedReturnValue();
    }
    else if (v34 == v33)
    {
      -[TabOverview _itemAboveItem:](a1, v31);
      v35 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v34 != -v33)
      {
        v17 = 0;
        goto LABEL_34;
      }
      -[TabOverview _itemBelowItem:]((id *)a1, (uint64_t)v31);
      v35 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (id *)v35;
LABEL_34:
    v40 = 1;
    goto LABEL_35;
  }
  v17 = (id *)*(id *)(a1 + 784);
  v18 = v17 != 0;
LABEL_43:
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v42 = *(id *)(a1 + 440);
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v79;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v79 != v45)
          objc_enumerationMutation(v42);
        -[TabOverviewItem layoutInfo](*(id **)(*((_QWORD *)&v78 + 1) + 8 * j));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v48, 0.98);

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    }
    while (v44);
  }

  if (v18)
  {
    objc_msgSend((id)a1, "_dismissWithItemAtCurrentDecelerationFactor:", v17);
    v49 = *(void **)(a1 + 432);
    objc_msgSend(v49, "targetLocation");
    objc_msgSend(v49, "decelerationFactorForTargetLocation:");
    v51 = fmax(v50, 0.985);
    objc_msgSend(*(id *)(a1 + 432), "decelerationFactor");
    v53 = fmin(v51, v52);
    objc_msgSend(*(id *)(a1 + 432), "setDecelerationFactor:", (double)v53);
    v54 = pow(v53, 4.0);
    -[TabOverviewItem layoutInfo](v17);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v56, v54);

    v57 = &OBJC_IVAR___URLCompletionProvider__historyWasModified;
    v58 = v77;
  }
  else
  {
    v58 = v77;
    if (v77)
    {
      -[TabOverview _updateTargetLocationForDisplayedItem:](a1, v77);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 432), "targetLocation");
      v60 = v59;
      v62 = v61;
      v64 = v63;
      v66 = v65;
      objc_msgSend((id)a1, "bounds");
      v68 = v67;
      v70 = v69;
      v71 = exp(0.0 - v66);
      -[TabOverview _constrainLocation:](a1, v68 * 0.5 + v71 * (v60 - v68 * 0.5), v70 * 0.5 + v71 * (v62 - v70 * 0.5), v64, 0.0);
      objc_msgSend(*(id *)(a1 + 432), "setTargetLocation:");
    }
    v57 = &OBJC_IVAR___URLCompletionProvider__historyWasModified;
  }
  -[TabOverview _updateSnapshotAlphaForItem:](a1, *(void **)(a1 + v57[386]));
  v72 = *(id **)(a1 + v57[386]);
  if (v72 != *(id **)(a1 + 488))
  {
    -[TabOverviewItem layoutInfo](v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewInterpolatedValue resetToTargetValue]((uint64_t)v74);

  }
  v75 = *(void **)(a1 + 456);
  v76 = objc_msgSend((id)a1, "presentationState") != 3 && *(_BYTE *)(a1 + 665) == 0;
  objc_msgSend(v75, "setEnabled:", v76);
  *(_BYTE *)(a1 + 669) = 0;
  objc_msgSend((id)a1, "_updateDisplayLink");
  -[TabOverview _updatePresentationStateIfSteady](a1);

}

- (void)endInteractivePresentation
{
  -[TabOverview endInteractivePresentationAllowingDismissalToTargetItem:](self, "endInteractivePresentationAllowingDismissalToTargetItem:", 1);
}

- (void)endInteractivePresentationAllowingDismissalToTargetItem:(BOOL)a3
{
  -[TabOverview _endInteractivePresentationAllowingDismissal:restoringPreviousState:]((uint64_t)self, a3, 0);
}

- (void)cancelInteractivePresentation
{
  -[TabOverview _endInteractivePresentationAllowingDismissal:restoringPreviousState:]((uint64_t)self, 1, 1);
}

- (void)removePresentationObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_presentationObservers, "removeObject:", a3);
}

- (void)resetPresentationScrollPosition
{
  -[TabOverviewInterpolatedLocation resetToLocation:](self->_interpolatedLocation, "resetToLocation:", -[TabOverview _targetLocationForPresentation]((uint64_t)self));
  -[TabOverview setNeedsLayout](self, "setNeedsLayout");
}

- (void)performUpdatesWithoutTabCloseAnimation:(id)a3
{
  BOOL suppressesTabCloseAnimation;

  if (a3)
  {
    suppressesTabCloseAnimation = self->_suppressesTabCloseAnimation;
    self->_suppressesTabCloseAnimation = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_suppressesTabCloseAnimation = suppressesTabCloseAnimation;
  }
}

- (void)_resetRenderedLocations
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  double Rendered;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 432), "resetRenderedLocation");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v2 = *(id *)(a1 + 440);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v5)
            objc_enumerationMutation(v2);
          v7 = *(id **)(*((_QWORD *)&v21 + 1) + 8 * i);
          -[TabOverviewItem layoutInfo](v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "resetRenderedLocation");

          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          -[TabOverviewItem layoutInfo](v7);
          v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          -[TabOverviewItemLayoutInfo interpolatedValues](v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v18;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v18 != v14)
                  objc_enumerationMutation(v11);
                Rendered = -[TabOverviewInterpolatedValue resetLastRenderedValue](*(_QWORD *)(*((_QWORD *)&v17 + 1)
                                                                                            + 8 * j));
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16, Rendered);
            }
            while (v13);
          }

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v4);
    }

  }
}

void __29__TabOverview__canSkipFrames__block_invoke()
{
  double v0;
  id v1;

  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "launchedToTest"))
  {
    _canSkipFrames_canSkip = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_refreshRate");
    _canSkipFrames_canSkip = v0 < 0.0166666667;

  }
}

- (uint64_t)_interpolateValuesByTimeInterval:(uint64_t)a1
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  int v27;
  void *v29;
  double v30;
  double v31;
  double v32;
  long double v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD aBlock[5];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    LOBYTE(v12) = 0;
    return v12 & 1;
  }
  objc_msgSend((id)a1, "bounds");
  v5 = v4;
  v7 = v6;
  if (!*(_BYTE *)(a1 + 664) && !*(_BYTE *)(a1 + 665))
  {
    if (*(_BYTE *)(a1 + 669))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __48__TabOverview__interpolateValuesByTimeInterval___block_invoke;
      aBlock[3] = &unk_1E9CFADE8;
      aBlock[4] = a1;
      v8 = _Block_copy(aBlock);
      goto LABEL_5;
    }
    v29 = *(void **)(a1 + 432);
    objc_msgSend(v29, "targetLocation");
    -[TabOverview _constrainLocation:](a1, v30, v31, v32, v33);
    objc_msgSend(v29, "setTargetLocation:");
  }
  v8 = 0;
LABEL_5:
  v9 = *MEMORY[0x1E0D4F2E8];
  if (*(_BYTE *)(a1 + 667))
    v10 = 0.99;
  else
    v10 = 0.0;
  if (*(_BYTE *)(a1 + 668))
    v11 = 0.99;
  else
    v11 = 0.0;
  v34 = v8;
  v12 = objc_msgSend(*(id *)(a1 + 432), "interpolateByTimeInterval:roundingAtSize:zScaleFactor:withHorizontalBounceFactor:verticalBounceFactor:constraints:", v8, a2, v5, v7, *MEMORY[0x1E0D4F2E8], v10, v11);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v13 = *(id *)(a1 + 440);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v13);
        v18 = *(id **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        -[TabOverviewItem layoutInfo](v18);
        v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo interpolatedValues](v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v36 != v23)
                objc_enumerationMutation(v20);
              v12 |= -[TabOverviewInterpolatedValue interpolateByTimeInterval:](*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), a2);
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          }
          while (v22);
        }

        -[TabOverviewItem layoutInfo](v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "interpolateByTimeInterval:roundingAtSize:zScaleFactor:withHorizontalBounceFactor:verticalBounceFactor:constraints:", 0, a2, v5, v7, v9, 0.0, 0.0);

        v12 |= v27;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v15);
  }

  return v12 & 1;
}

void __48__TabOverview__interpolateValuesByTimeInterval___block_invoke(uint64_t a1, double a2, double a3, double a4, long double a5)
{
  -[TabOverview _constrainLocation:](*(_QWORD *)(a1 + 32), a2, a3, a4, a5);
}

- (void)_displayLinkFired:(id)a3
{
  int v4;
  double v5;
  double v6;
  double lastUpdateTime;
  double v8;
  int v9;
  int v10;
  id v11;

  v11 = a3;
  v4 = -[TabOverview _shiftLocationsForEffectiveLayoutIfNeeded]((uint64_t)self);
  objc_msgSend(v11, "timestamp");
  v6 = v5;
  lastUpdateTime = self->_lastUpdateTime;
  if (lastUpdateTime == 0.0)
    objc_msgSend(v11, "duration");
  else
    v8 = v6 - lastUpdateTime;
  self->_lastUpdateTime = v6;
  v9 = -[TabOverview _interpolateValuesByTimeInterval:]((uint64_t)self, v8);
  if (_canSkipFrames_onceToken != -1)
    dispatch_once(&_canSkipFrames_onceToken, &__block_literal_global_71);
  if (_canSkipFrames_canSkip)
    v10 = v9;
  else
    v10 = 1;
  if ((v10 | v4) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "generateSeed");
    -[TabOverview setNeedsLayout](self, "setNeedsLayout");
    -[TabOverview _resetRenderedLocations]((uint64_t)self);
  }
  -[TabOverview _updateDisplayLink](self, "_updateDisplayLink");

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  TabOverview *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id *v19;
  void *v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v28;
  double v29;
  BOOL v30;
  BOOL v31;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;
  CGPoint v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  y = a3.y;
  x = a3.x;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[TabOverviewToolbar convertPoint:fromView:](self->_header, "convertPoint:fromView:", self, x, y);
  v9 = v8;
  v11 = v10;
  if (-[TabOverviewToolbar isHidden](self->_header, "isHidden")
    || (-[TabOverviewToolbar hitTest:withEvent:](self->_header, "hitTest:withEvent:", v7, v9, v11),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[TabOverviewToolbar bounds](self->_header, "bounds");
    v42.x = v9;
    v42.y = v11;
    if (CGRectContainsPoint(v43, v42))
    {
      v39.receiver = self;
      v39.super_class = (Class)TabOverview;
      -[TabOverview hitTest:withEvent:](&v39, sel_hitTest_withEvent_, v7, x, y);
    }
    else
    {
      if (-[TabOverview _isDecelerating]((uint64_t)self))
      {
        v13 = self;
LABEL_31:
        v12 = v13;
        goto LABEL_32;
      }
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v14 = self->_items;
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v36 != v17)
              objc_enumerationMutation(v14);
            -[TabOverviewItem layoutInfo](*(id **)(*((_QWORD *)&v35 + 1) + 8 * i));
            v19 = (id *)objc_claimAutoreleasedReturnValue();
            -[TabOverviewItemLayoutInfo itemView](v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v20, "alpha");
              if (v21 != 0.0)
              {
                objc_msgSend(v20, "closeButton");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "alpha");
                if (v22 != 0.0 && (objc_msgSend(v12, "isHidden") & 1) == 0)
                {
                  objc_msgSend(v12, "bounds");
                  v23 = v44.origin.x;
                  v24 = v44.origin.y;
                  width = v44.size.width;
                  height = v44.size.height;
                  MidX = CGRectGetMidX(v44);
                  v45.origin.x = v23;
                  v45.origin.y = v24;
                  v45.size.width = width;
                  v45.size.height = height;
                  objc_msgSend(v12, "convertPoint:toView:", self, MidX, CGRectGetMidY(v45));
                  v30 = v28 >= x + -22.0 && v28 <= x + 22.0;
                  v31 = !v30 || v29 < y + -22.0;
                  if (!v31 && v29 <= y + 22.0)
                  {

                    goto LABEL_32;
                  }
                }

              }
            }

          }
          v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          if (v16)
            continue;
          break;
        }
      }

      v34.receiver = self;
      v34.super_class = (Class)TabOverview;
      -[TabOverview hitTest:withEvent:](&v34, sel_hitTest_withEvent_, v7, x, y);
    }
    v13 = (TabOverview *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
LABEL_32:

  return v12;
}

- (void)_setShowingSearchExplanationView:(unsigned __int8 *)a1
{
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    v4 = objc_msgSend(a1, "presentationState");
    v5 = 2 * (v4 != 0);
    if (v4)
    {
      if ((a2 & 1) == 0)
        v5 = a1[1008];
    }
    -[TabOverview _setExplanationViewVariant:animated:]((uint64_t)a1, v5, 0);
  }
}

uint64_t __67__TabOverview_setShowsLockedPrivateBrowsingView_withUnlockHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateAllowsInteractivePresentation
{
  int v2;
  void *v3;
  id WeakRetained;

  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 760), "hasEmptyResults");
    v3 = *(void **)(a1 + 1016);
    if (v3)
      v2 |= objc_msgSend(v3, "isHidden") ^ 1;
    if (*(unsigned __int8 *)(a1 + 1153) != (v2 ^ 1))
    {
      *(_BYTE *)(a1 + 1153) = v2 ^ 1;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
      objc_msgSend(WeakRetained, "tabOverviewDidChangeAllowsInteractivePresentation:", a1);

    }
  }
}

- (void)searchControllerDidUpdateHasEmptyResults:(id)a3
{
  -[TabOverview _setShowingSearchExplanationView:]((unsigned __int8 *)self, objc_msgSend(a3, "hasEmptyResults"));
}

- (void)searchControllerDidChangeEditing:(id)a3
{
  self->_shouldAnimateDimmingForSearch = 1;
  -[TabOverview setNeedsLayout](self, "setNeedsLayout", a3);
  -[TabOverview layoutIfNeeded](self, "layoutIfNeeded");
  self->_shouldAnimateDimmingForSearch = 0;
}

- (void)searchControllerDidEndSearch:(id)a3
{
  double v4;

  -[TabOverview setNeedsLayout](self, "setNeedsLayout", a3);
  -[UIVisualEffectView alpha](self->_dismissibleSearchBarBackground, "alpha");
  -[TabOverview _dismissSearchBarAnimated:]((id *)&self->super.super.super.isa, v4 == 0.0);
}

- (id)_dismissSearchBarAnimated:(id *)result
{
  id *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;
  _BOOL4 v12;
  id v13;

  if (result)
  {
    v3 = result;
    if (objc_msgSend(result, "presentationState") == 3 || !v3[153])
    {
      return 0;
    }
    else
    {
      objc_msgSend(v3, "title");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "length");

      v6 = 0.0;
      if (!v5)
        v6 = -*((double *)v3 + 135);
      objc_msgSend(v3[54], "targetLocation");
      v10 = v9 == 0.0;
      if (v11 != v6)
        v10 = 0;
      if (v7 != 0.0)
        v10 = 0;
      v12 = v8 == 0.0 && v10;
      if (!v12)
      {
        v13 = v3[54];
        if (a2)
        {
          objc_msgSend(v13, "setTargetLocation:", 0.0, v6, 0.0, 0.0);
          objc_msgSend(v3[54], "setDecelerationFactor:", 0.985);
        }
        else
        {
          objc_msgSend(v13, "resetToLocation:", 0.0, v6, 0.0, 0.0);
        }
        objc_msgSend(v3, "_updateDisplayLink");
      }
      return (id *)!v12;
    }
  }
  return result;
}

uint64_t __43__TabOverview__updateIndexesMatchingSearch__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)insertText:(id)a3
{
  id v4;
  id v5;
  void (*v6[4])(_QWORD, _QWORD);
  id v7;

  v4 = a3;
  v6[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v6[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v6[2] = (void (*)(_QWORD, _QWORD))__26__TabOverview_insertText___block_invoke;
  v6[3] = (void (*)(_QWORD, _QWORD))&unk_1E9CFB038;
  v7 = v4;
  v5 = v4;
  -[TabOverview _passTextInputToSeachBarWithChanges:]((uint64_t)self, v6);

}

uint64_t __26__TabOverview_insertText___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringByAppendingString:", *(_QWORD *)(a1 + 32));
}

- (uint64_t)_passTextInputToSeachBarWithChanges:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 688);
    v5 = a2;
    objc_msgSend(v4, "text");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_1E9CFDBB0;
    ((void (**)(_QWORD, const __CFString *))a2)[2](v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v3 + 760), "setSearchTerm:", v9);
    return objc_msgSend(*(id *)(v3 + 688), "becomeFirstResponder");
  }
  return result;
}

- (BOOL)hasText
{
  void *v2;
  BOOL v3;

  -[SFTabOverviewSearchBar text](self->_searchBar, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)deleteBackward
{
  void *v3;
  uint64_t v4;

  -[SFTabOverviewSearchBar text](self->_searchBar, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    -[TabOverview _passTextInputToSeachBarWithChanges:]((uint64_t)self, __block_literal_global_130);
}

id __29__TabOverview_deleteBackward__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") - 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (int64_t)autocapitalizationType
{
  return 0;
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (int64_t)smartQuotesType
{
  return 1;
}

- (int64_t)smartDashesType
{
  return 1;
}

- (int64_t)smartInsertDeleteType
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  TabOverview *v2;
  BOOL v3;

  v2 = self;
  v3 = -[TabOverview presentationState](v2, "presentationState") == 1
    || -[TabOverview presentationState](v2, "presentationState") == 2;

  return v3;
}

- (id)inputView
{
  return self->_inputView;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  void *v5;
  float v6;
  float v7;
  double v8;
  float v9;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAnimationDragCoefficient();
  objc_msgSend(v5, "setMass:", (float)(v6 + v6));
  UIAnimationDragCoefficient();
  objc_msgSend(v5, "setStiffness:", (float)(300.0 / v7));
  objc_msgSend(v5, "setDamping:", 400.0);
  objc_msgSend(v5, "setVelocity:", 1.0);
  v9 = 1.0;
  if (self && !-[NSArray count](self->_items, "count"))
  {
    if (self->_dragging)
      v9 = 1.9;
    else
      v9 = 1.0;
  }
  *(float *)&v8 = v9;
  objc_msgSend(v5, "setSpeed:", v8);
  return v5;
}

- (id)_timingFunctionForAnimation
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1047277443;
  LODWORD(v3) = 986933234;
  LODWORD(v4) = 1058642330;
  LODWORD(v5) = 1064243739;
  return (id)objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

- (CGSize)snapshotSizeForSuggestedSize:(CGSize)result
{
  double v3;

  v3 = fmax(result.height, result.width * 1.5) + 200.0;
  result.height = v3;
  return result;
}

- (double)desiredSnapshotScale
{
  uint64_t v3;
  double result;

  if (-[NSArray count](self->_items, "count") <= 2)
    v3 = -[NSArray count](self->_items, "count");
  else
    v3 = 2;
  -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](self, v3, 0);
  return result;
}

- (unint64_t)snapshotBorderOptions
{
  if (tabSnapshotHasTransparentBorderPadding())
    return 15;
  else
    return 0;
}

- (void)reorderingAutoscroller:(id)a3 handleScroll:(CGPoint)a4
{
  double y;
  double x;
  double Current;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  double v14;
  double v15;

  y = a4.y;
  x = a4.x;
  Current = CFAbsoluteTimeGetCurrent();
  -[TabOverviewInterpolatedLocation location](self->_interpolatedLocation, "location");
  v9 = v8;
  v11 = v10;
  -[TabOverview _constrainLocation:]((uint64_t)self, v8 - x, v10 - y, v12, v13);
  -[TabOverviewInterpolatedLocation moveBy:atTime:](self->_interpolatedLocation, "moveBy:atTime:", v14 - v9, v15 - v11, Current);
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = -[TabOverview scrollToTop]((uint64_t)self);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, v5);
    v6 = v7;
  }

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  TabOverviewItem *v11;
  id *p_isa;
  void *v13;
  int v14;
  double v15;
  double Width;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  CGPoint v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v6 = a4;
  if (-[TabOverview presentationState](self, "presentationState") == 2)
  {
    objc_msgSend(v6, "location");
    v8 = v7;
    v10 = v9;
    -[TabOverview targetItemForDropAtPoint:](self, "targetItemForDropAtPoint:");
    v11 = (TabOverviewItem *)objc_claimAutoreleasedReturnValue();
    p_isa = (id *)&v11->super.isa;
    if (v11 == self->_swipeClosingItem)
      goto LABEL_7;
    -[TabOverviewItem layoutInfo]((id *)&v11->super.isa);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TabOverviewItemLayoutInfo interpolatedValuesAreSteady]((uint64_t)v13);

    if (!v14)
      goto LABEL_7;
    v15 = dbl_1D7EA8A10[self->_presentedTabLayout == 0];
    v31.origin.x = -[TabOverview _itemReferenceBounds]((id *)&self->super.super.super.isa);
    Width = CGRectGetWidth(v31);
    -[TabOverviewItem layoutInfo](p_isa);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverview convertRect:fromView:](self, "convertRect:fromView:", self->_scrollingContainerView, -[TabOverviewItemLayoutInfo frame]((uint64_t)v17));
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v32.origin.x = v19;
    v32.origin.y = v21;
    v32.size.width = v23;
    v32.size.height = v25;
    v33 = CGRectInset(v32, -(v15 * Width), -(v15 * Width));
    v30.x = v8;
    v30.y = v10;
    if (CGRectContainsPoint(v33, v30))
    {
      v26 = (void *)MEMORY[0x1E0DC3B28];
      objc_msgSend(p_isa, "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "regionWithRect:identifier:", v27, v19, v21, v23, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_7:
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  NSArray *items;
  id v7;
  id *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__TabOverview_pointerInteraction_styleForRegion___block_invoke;
  v15[3] = &unk_1E9CFAE60;
  v7 = v5;
  v16 = v7;
  -[NSArray safari_firstObjectPassingTest:](items, "safari_firstObjectPassingTest:", v15);
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItem layoutInfo](v8);
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo itemView](v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v10);
    objc_msgSend(MEMORY[0x1E0DC3B00], "effectWithPreview:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v13, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

uint64_t __49__TabOverview_pointerInteraction_styleForRegion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  char isKindOfClass;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
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
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double MinY;
  double MaxY;
  CGFloat v35;
  CGFloat rect;
  CGFloat v37;
  void *v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  objc_msgSend(a3, "nextFocusedItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v38;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v38, "frame");
    v8 = v7;
    v10 = v9;
    rect = v11;
    v13 = v12;
    -[UIView bounds](self->_scrollingContainerView, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = -[TabOverview _focusAreaInsets]((uint64_t)self);
    v24 = v15 + v23;
    v25 = v17 + v22;
    v27 = v19 - (v23 + v26);
    v29 = v21 - (v22 + v28);
    v30 = v8;
    v39.origin.x = v8;
    v31 = v27;
    v39.origin.y = v10;
    v39.size.width = rect;
    v37 = v13;
    v39.size.height = v13;
    v32 = v25;
    MinY = CGRectGetMinY(v39);
    v40.origin.x = v24;
    v40.origin.y = v32;
    v40.size.width = v31;
    v40.size.height = v29;
    if (MinY < CGRectGetMinY(v40))
    {
      v41.origin.x = v30;
      v41.origin.y = v10;
      v41.size.width = rect;
      v41.size.height = v37;
      CGRectGetMinY(v41);
      v42.origin.x = v24;
      v42.size.height = v29;
      v42.origin.y = v32;
      v42.size.width = v31;
      CGRectGetMinY(v42);
LABEL_6:
      -[TabOverviewInterpolatedLocation location](self->_interpolatedLocation, "location");
      -[TabOverviewInterpolatedLocation setTargetLocation:](self->_interpolatedLocation, "setTargetLocation:");
      -[TabOverview _updateDisplayLink](self, "_updateDisplayLink");
      v6 = v38;
      goto LABEL_7;
    }
    v43.origin.x = v30;
    v43.origin.y = v10;
    v43.size.width = rect;
    v43.size.height = v37;
    MaxY = CGRectGetMaxY(v43);
    v44.origin.x = v24;
    v44.origin.y = v32;
    v44.size.width = v31;
    v44.size.height = v29;
    v35 = CGRectGetMaxY(v44);
    v6 = v38;
    if (MaxY > v35)
    {
      v45.origin.x = v30;
      v45.origin.y = v10;
      v45.size.width = rect;
      v45.size.height = v37;
      CGRectGetMaxY(v45);
      v46.origin.x = v24;
      v46.origin.y = v32;
      v46.size.width = v31;
      v46.size.height = v29;
      CGRectGetMaxY(v46);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (double)_focusAreaInsets
{
  double result;

  if (!a1)
    return 0.0;
  -[TabOverview _effectiveSafeAreaInsets](a1);
  UIEdgeInsetsMax();
  return result;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if ((SFShouldHandleSelectionForPresses() & 1) != 0)
  {
    -[NSArray safari_firstObjectPassingTest:](self->_displayedItems, "safari_firstObjectPassingTest:", &__block_literal_global_140_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[TabOverview _dismissWithItem:]((uint64_t)self, v8);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TabOverview;
    -[TabOverview pressesBegan:withEvent:](&v9, sel_pressesBegan_withEvent_, v6, v7);
  }

}

uint64_t __38__TabOverview_pressesBegan_withEvent___block_invoke(uint64_t a1, id *a2)
{
  id *v2;
  void *v3;
  uint64_t v4;

  -[TabOverviewItem layoutInfo](a2);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItemLayoutInfo itemView](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFocused");

  return v4;
}

- (BOOL)presentingInteractively
{
  return self->_pinching;
}

- (BOOL)lastDecelerationWasInterrupted
{
  return self->_lastDecelerationWasInterrupted;
}

- (TabOverviewThemeProviding)themeProvider
{
  return (TabOverviewThemeProviding *)objc_loadWeakRetained((id *)&self->_themeProvider);
}

- (NSArray)alternateItems
{
  return self->_alternateItems;
}

- (int64_t)alternateItemPosition
{
  return self->_alternateItemPosition;
}

- (TabOverviewItem)itemToActivate
{
  return self->_itemToActivate;
}

- (BOOL)defersActivation
{
  return self->_defersActivation;
}

- (TabOverviewDelegate)delegate
{
  return (TabOverviewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)alternateBottomSafeAreaInset
{
  return self->_alternateBottomSafeAreaInset;
}

- (int64_t)barPlacement
{
  return self->_barPlacement;
}

- (int64_t)presentedTabLayout
{
  return self->_presentedTabLayout;
}

- (NSArray)barButtonItems
{
  return self->_barButtonItems;
}

- (BOOL)isInSteadyState
{
  return self->_inSteadyState;
}

- (id)stateUpdateHandler
{
  return self->_stateUpdateHandler;
}

- (void)setStateUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1248);
}

- (id)pptStateUpdateHandler
{
  return self->_pptStateUpdateHandler;
}

- (void)setPptStateUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1256);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pptStateUpdateHandler, 0);
  objc_storeStrong(&self->_stateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_barButtonItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemToActivate, 0);
  objc_storeStrong((id *)&self->_alternateItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_themeProvider);
  objc_storeStrong((id *)&self->_lockedPrivateBrowsingView, 0);
  objc_storeStrong((id *)&self->_titleSizingItemView, 0);
  objc_storeStrong((id *)&self->_dismissibleSearchBarBackground, 0);
  objc_storeStrong((id *)&self->_statusBarGradient, 0);
  objc_storeStrong((id *)&self->_explanationView, 0);
  objc_storeStrong((id *)&self->_itemViewReuseStack, 0);
  objc_storeStrong((id *)&self->_itemActivationTimer, 0);
  objc_storeStrong((id *)&self->_interactivePresentationStartingItem, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_gridVisualizationView, 0);
  objc_storeStrong((id *)&self->_menuPreviewContainerView, 0);
  objc_storeStrong((id *)&self->_scrollingContainerView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_titleToolbar, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_previewContainers, 0);
  objc_storeStrong((id *)&self->_itemsShowingContextMenu, 0);
  objc_storeStrong((id *)&self->_deferredClosingItems, 0);
  objc_storeStrong((id *)&self->_swipeClosingItem, 0);
  objc_storeStrong((id *)&self->_reorderingAutoscroller, 0);
  objc_storeStrong((id *)&self->_interactivelyLiftingItem, 0);
  objc_storeStrong((id *)&self->_visiblyCenteredItem, 0);
  objc_storeStrong((id *)&self->_activeItem, 0);
  objc_storeStrong((id *)&self->_cursorInteraction, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_tabCloseRecognizer, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
  objc_storeStrong((id *)&self->_displayedItems, 0);
  objc_storeStrong((id *)&self->_interpolatedLocation, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_presentationObservers, 0);
}

- (void)copyGeometryFromTabOverview:(id *)a3 .cold.1(void **a1, void *a2, id *a3)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = a2;
  v6 = objc_msgSend(v4, "count");
  v7 = objc_msgSend(*a3, "count");
  v8 = 134218240;
  v9 = v6;
  v10 = 2048;
  v11 = v7;
  _os_log_fault_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_FAULT, "-[TabOverview copyGeometryFromTabView:] cannot copy geometry with mismatched item counts (%zu != %zu)", (uint8_t *)&v8, 0x16u);

}

- (void)_tabClose:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_DEBUG, "Update swiping to close tab overview item with translation: %f", (uint8_t *)&v2, 0xCu);
}

- (void)updateInteractivePresentationWithOffset:(CGFloat)a3 scale:(double)a4 animated:.cold.1(void *a1, CGFloat a2, CGFloat a3, double a4)
{
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  double v12;
  uint64_t v13;
  CGPoint v14;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v14.x = a2;
  v14.y = a3;
  NSStringFromCGPoint(v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v8;
  v11 = 2048;
  v12 = a4;
  _os_log_debug_impl(&dword_1D7CA3000, v7, OS_LOG_TYPE_DEBUG, "Update interactive tab overview presentation with offset: %{public}@, scale: %f", (uint8_t *)&v9, 0x16u);

}

@end
