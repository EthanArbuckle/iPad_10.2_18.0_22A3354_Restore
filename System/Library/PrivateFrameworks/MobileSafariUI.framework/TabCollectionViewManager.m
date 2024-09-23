@implementation TabCollectionViewManager

- (TabContainerView)tabViewContainerView
{
  void *v3;
  TabGroupSwitcherViewController *v4;
  id WeakRetained;
  void *v6;
  TabGroupSwitcherViewController *v7;
  TabGroupSwitcherViewController *tabGroupSwitcherViewController;

  if ((SFEnhancedTabOverviewEnabled() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    if (self->_tabThumbnailCollectionViewStyle && !self->_tabGroupSwitcherViewController)
    {
      v4 = [TabGroupSwitcherViewController alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(WeakRetained, "tabController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[TabGroupSwitcherViewController initWithTabController:](v4, "initWithTabController:", v6);
      tabGroupSwitcherViewController = self->_tabGroupSwitcherViewController;
      self->_tabGroupSwitcherViewController = v7;

      -[TabGroupSwitcherViewController setDelegate:](self->_tabGroupSwitcherViewController, "setDelegate:", self);
      -[TabOverview addPresentationObserver:](self->_tabOverview, "addPresentationObserver:", self->_tabGroupSwitcherViewController);
    }
    -[TabGroupSwitcherViewController view](self->_tabGroupSwitcherViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (TabContainerView *)v3;
}

- (void)updateTabOverviewItems
{
  id WeakRetained;
  int v4;
  _BOOL4 v5;
  TabOverview *tabOverview;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  if (!self->_tabOverviewItemsFixed)
  {
    if (SFEnhancedTabOverviewEnabled())
    {
      -[TabSwitcherViewController setNeedsApplyContentAnimated:](self->_tabSwitcherViewController, "setNeedsApplyContentAnimated:", 1);
      return;
    }
    if (self->_tabOverview)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      v4 = SFTabGroupSwitcherEnabled();
      v5 = -[TabCollectionViewManager _isPrivateBrowsingAndLocked](self, "_isPrivateBrowsingAndLocked");
      if (v4)
      {
        if (v5)
        {
          objc_initWeak(&location, self);
          tabOverview = self->_tabOverview;
          v17 = MEMORY[0x1E0C809B0];
          v18 = 3221225472;
          v19 = __50__TabCollectionViewManager_updateTabOverviewItems__block_invoke_2;
          v20 = &unk_1E9CF25A0;
          objc_copyWeak(&v21, &location);
          -[TabOverview setShowsLockedPrivateBrowsingView:withUnlockHandler:](tabOverview, "setShowsLockedPrivateBrowsingView:withUnlockHandler:", 1, &v17);
          -[TabOverview setItems:](self->_tabOverview, "setItems:", MEMORY[0x1E0C9AA60], v17, v18, v19, v20);
          -[TabOverview layoutIfNeeded](self->_tabOverview, "layoutIfNeeded");
          -[TabOverview endAnimation](self->_tabOverview, "endAnimation");
          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
LABEL_25:
          if (-[TabOverview presentationState](self->_tabOverview, "presentationState"))
            -[TabCollectionViewManager updateSnapshotIdentifiers](self, "updateSnapshotIdentifiers");
          v16 = objc_loadWeakRetained((id *)&self->_browserController);
          objc_msgSend(v16, "updateTabViewPinchRecognizer");

          return;
        }
        v8 = -[TabOverview showsLockedPrivateBrowsingView](self->_tabOverview, "showsLockedPrivateBrowsingView");
        -[TabOverview setShowsLockedPrivateBrowsingView:withUnlockHandler:](self->_tabOverview, "setShowsLockedPrivateBrowsingView:withUnlockHandler:", 0, 0);
        -[TabOverview items](self->_tabOverview, "items");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabCollectionViewManager _tabCollectionItemsRemovingHiddenItems:outHiddenItems:outIsDragging:itemRetriever:](self, "_tabCollectionItemsRemovingHiddenItems:outHiddenItems:outIsDragging:itemRetriever:", 1, 0, 0, &__block_literal_global_39);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverview setItems:](self->_tabOverview, "setItems:", v9);
        if (v8 && (WBSIsEqual() & 1) == 0)
          -[TabOverview resetPresentationScrollPosition](self->_tabOverview, "resetPresentationScrollPosition");
LABEL_24:

        goto LABEL_25;
      }
      if (v5)
      {
        v7 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        -[TabCollectionViewManager _tabCollectionItemsRemovingHiddenItems:outHiddenItems:outIsDragging:itemRetriever:](self, "_tabCollectionItemsRemovingHiddenItems:outHiddenItems:outIsDragging:itemRetriever:", 1, 0, 0, &__block_literal_global_39);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "safari_partionedArrayUsingCondition:", &__block_literal_global_38_1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      +[Application sharedApplication](Application, "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isPrivateBrowsingLocked"))
      {
        v12 = -[TabCollectionViewManager privateBrowsingEnabled](self, "privateBrowsingEnabled");

        if (!v12)
        {
          v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_20:
          if (self->_privateBrowsingEnabled)
            v15 = 2;
          else
            v15 = 1;
          -[TabOverview setItems:alternateItems:atPosition:](self->_tabOverview, "setItems:alternateItems:atPosition:", v7, v9, v15);
          goto LABEL_24;
        }
      }
      else
      {

      }
      objc_msgSend(WeakRetained, "alternateTabs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safari_mapObjectsUsingBlock:", &__block_literal_global_39);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "safari_partionedArrayUsingCondition:", &__block_literal_global_39_0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
  }
}

- (TabOverview)tabOverview
{
  return self->_tabOverview;
}

- (TabThumbnailCollectionView)tabThumbnailCollectionView
{
  void *tabSwitcherViewController;

  tabSwitcherViewController = self->_tabSwitcherViewController;
  if (!tabSwitcherViewController)
  {
    tabSwitcherViewController = self->_fluidTabOverviewViewController;
    if (!tabSwitcherViewController)
      tabSwitcherViewController = self->_tabOverview;
  }
  return (TabThumbnailCollectionView *)tabSwitcherViewController;
}

- (UIEdgeInsets)effectiveSafeAreaInsetsForTabCollectionView:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
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
  UIEdgeInsets result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (BOOL)_isPrivateBrowsingAndLocked
{
  void *v2;
  char v3;

  if (!self->_privateBrowsingEnabled)
    return 0;
  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPrivateBrowsingLocked");

  return v3;
}

- (void)updateTabViewsAnimatingTabBar:(BOOL)a3
{
  -[TabCollectionViewManager updateTabBarAnimated:keepingTabVisible:](self, "updateTabBarAnimated:keepingTabVisible:", a3, 0);
  -[TabCollectionViewManager updateTabOverviewItems](self, "updateTabOverviewItems");
}

- (void)updateTabBarAnimated:(BOOL)a3 keepingTabVisible:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  if (-[TabCollectionViewManager _canUpdateUnifiedBar](self, "_canUpdateUnifiedBar"))
  {
    objc_msgSend(v8, "unifiedTabBarItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabCollectionViewManager _updateUnifiedTabBarAnimated:keepingTabVisibleForItem:](self, "_updateUnifiedTabBarAnimated:keepingTabVisibleForItem:", v4, v6);

  }
  if (-[TabCollectionViewManager _canUpdateClassicBar](self, "_canUpdateClassicBar"))
  {
    objc_msgSend(v8, "tabBarItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabCollectionViewManager _updateClassicTabBarAnimated:keepingTabVisibleForItem:](self, "_updateClassicTabBarAnimated:keepingTabVisibleForItem:", v4, v7);

  }
}

- (BOOL)_canUpdateUnifiedBar
{
  id WeakRetained;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
  if (WeakRetained)
    v4 = self->_tabBarItemsFixed == 0;
  else
    v4 = 0;

  return v4;
}

- (BOOL)_canUpdateClassicBar
{
  id WeakRetained;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  if (WeakRetained)
    v4 = self->_tabBarItemsFixed == 0;
  else
    v4 = 0;

  return v4;
}

- (void)_updateClassicTabBarAnimated:(BOOL)a3 keepingTabVisibleForItem:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unsigned __int8 v15;

  v4 = a3;
  v6 = a4;
  if (v4)
  {
    if (self->_suppressTabBarAnimation)
    {
      v4 = 0;
    }
    else
    {
      -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "presentationState") == 0;

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  v9 = objc_loadWeakRetained((id *)&self->_dataSource);
  v10 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v10, "updateShowingTabBarAnimated:", v4);

  v15 = 0;
  -[TabCollectionViewManager _tabCollectionItemsRemovingHiddenItems:outHiddenItems:outIsDragging:itemRetriever:](self, "_tabCollectionItemsRemovingHiddenItems:outHiddenItems:outIsDragging:itemRetriever:", 1, 0, &v15, &__block_literal_global_41_1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setDraggingItem:", v15);
  objc_msgSend(v11, "safari_partionedArrayUsingCondition:", &__block_literal_global_43_0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "layoutIfNeeded");
  objc_msgSend(WeakRetained, "setAllowsScrollingPinnedItems:", objc_msgSend(v9, "shouldAllowScrollingPinnedItems"));
  objc_msgSend(WeakRetained, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToArray:", v12);

  if (v14)
    objc_msgSend(WeakRetained, "updatePinnedItems");
  else
    objc_msgSend(WeakRetained, "setItems:animated:", v12, v4);
  objc_msgSend(WeakRetained, "scrollToItem:animated:", v6, v4);

}

- (void)_updateUnifiedTabBarAnimated:(BOOL)a3 keepingTabVisibleForItem:(id)a4
{
  _BOOL4 v4;
  _BOOL8 v6;
  id WeakRetained;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  id v31;
  id v32;

  v4 = a3;
  v31 = a4;
  if (v4 && !self->_suppressTabBarAnimation)
  {
    -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v29, "presentationState") == 0;

  }
  else
  {
    v6 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
  v8 = objc_loadWeakRetained((id *)&self->_dataSource);
  v9 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v9, "updateShowingTabBarAnimated:", v6);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabCollectionViewManager _tabCollectionItemsRemovingHiddenItems:outHiddenItems:outIsDragging:itemRetriever:](self, "_tabCollectionItemsRemovingHiddenItems:outHiddenItems:outIsDragging:itemRetriever:", 0, v10, 0, &__block_literal_global_45_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(WeakRetained, "setHiddenItems:", v12);

  objc_msgSend(v8, "activeNonLibraryTab");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unifiedTabBarItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "favoritesFieldShouldBeExpanded") & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(v9, "tabController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activeTabDocument");
    v30 = v9;
    v17 = v10;
    v18 = v14;
    v19 = WeakRetained;
    v20 = v8;
    v21 = v11;
    v22 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sfScribbleControllerIfLoaded");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v24, "isScribbling");

    v6 = v22;
    v11 = v21;
    v8 = v20;
    WeakRetained = v19;
    v14 = v18;
    v10 = v17;
    v9 = v30;

  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EEC8]), "initWithItems:activeItem:activeItemIsExpanded:allowsScrollingPinnedItems:", v11, v14, v15, objc_msgSend(v8, "shouldAllowScrollingPinnedItems"));
  v26 = v31;
  if (!v31)
  {
    if (objc_msgSend(WeakRetained, "displayMode") == 2
      && (objc_msgSend(v9, "rootViewController"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = objc_msgSend(v27, "isPerformingSizeTransition"),
          v27,
          v28))
    {
      v26 = v14;
    }
    else
    {
      v26 = 0;
    }
  }
  v32 = v26;
  objc_msgSend(WeakRetained, "setItemArrangement:animated:keepingItemVisible:", v25, v6, v26);

}

void __110__TabCollectionViewManager__tabCollectionItemsRemovingHiddenItems_outHiddenItems_outIsDragging_itemRetriever___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (*(_BYTE *)(a1 + 72))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 64) == a3)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(v5 + 56));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v11, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "_isTabHiddenWithUUID:", v8);

  if (!(_DWORD)v7)
    goto LABEL_17;
  v9 = *(_BYTE **)(a1 + 64);
  if (v9)
    *v9 = 1;
  v10 = *(void **)(a1 + 48);
  if (v10)
    objc_msgSend(v10, "addObject:", v6);
  if (!*(_BYTE *)(a1 + 73))
  {
LABEL_17:
    if (*(_QWORD *)(a1 + 64) && objc_msgSend(v6, "dragState"))
      **(_BYTE **)(a1 + 64) = 1;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }

}

- (BOOL)_isTabHiddenWithUUID:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "hiddenTabForExplanationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v7) & 1) != 0)
    v8 = 1;
  else
    v8 = -[NSMutableSet containsObject:](self->_hiddenTabUUIDs, "containsObject:", v4);

  return v8;
}

uint64_t __82__TabCollectionViewManager__updateUnifiedTabBarAnimated_keepingTabVisibleForItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unifiedTabBarItem");
}

- (id)_tabCollectionItemsRemovingHiddenItems:(BOOL)a3 outHiddenItems:(id)a4 outIsDragging:(BOOL *)a5 itemRetriever:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  id WeakRetained;
  void *v13;
  void *v14;
  unint64_t placeholderItemIndex;
  int v16;
  void *v17;
  void (**v18)(id, void *);
  id v19;
  id v20;
  BOOL *v21;
  BOOL v22;
  void *v23;
  int isKindOfClass;
  void *v25;
  id v26;
  void (**v27)(id, void *);
  id v28;
  unint64_t v29;
  void *v30;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  void (**v36)(id, void *);
  BOOL *v37;
  char v38;
  BOOL v39;

  v10 = a4;
  v11 = (void (**)(id, void *))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "currentTabs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v16 = 0;
  if (self->_placeholderItem)
  {
    placeholderItemIndex = self->_placeholderItemIndex;
    if (placeholderItemIndex <= objc_msgSend(v13, "count")
      && self->_placeholderItemIsPrivate == self->_privateBrowsingEnabled)
    {
      v16 = 1;
    }
  }
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v17);
    v32 = v14;
    v18 = v11;
    v19 = WeakRetained;
    v20 = v10;
    v21 = a5;
    v22 = a3;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    a3 = v22;
    a5 = v21;
    v10 = v20;
    WeakRetained = v19;
    v11 = v18;
    v14 = v32;

    v16 &= isKindOfClass;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __110__TabCollectionViewManager__tabCollectionItemsRemovingHiddenItems_outHiddenItems_outIsDragging_itemRetriever___block_invoke;
  v33[3] = &unk_1E9CF6798;
  v38 = v16;
  v33[4] = self;
  v26 = v25;
  v34 = v26;
  v27 = v11;
  v36 = v27;
  v37 = a5;
  v28 = v10;
  v35 = v28;
  v39 = a3;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v33);
  if (v16)
  {
    v29 = self->_placeholderItemIndex;
    if (v29 == objc_msgSend(v14, "count"))
      objc_msgSend(v26, "addObject:", self->_placeholderItem);
  }
  v30 = (void *)objc_msgSend(v26, "copy");

  return v30;
}

uint64_t __50__TabCollectionViewManager_updateTabOverviewItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tabOverviewItem");
}

uint64_t __82__TabCollectionViewManager__updateClassicTabBarAnimated_keepingTabVisibleForItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tabBarItem");
}

- (void)beginFixingTabOverviewItems
{
  ++self->_tabOverviewItemsFixed;
}

- (void)beginFixingTabBarItems
{
  ++self->_tabBarItemsFixed;
}

- (void)tabSnapshotCacheDidFinishUpdating:(id)a3
{
  id flushPendingSnapshotsCompletion;
  void (**v5)(id, uint64_t);

  self->_flushPendingSnapshots = 0;
  self->_shouldUpdateSnapshotsTemporarily = 0;
  v5 = (void (**)(id, uint64_t))_Block_copy(self->_flushPendingSnapshotsCompletion);
  flushPendingSnapshotsCompletion = self->_flushPendingSnapshotsCompletion;
  self->_flushPendingSnapshotsCompletion = 0;

  if (v5)
    v5[2](v5, 1);
  -[TabCollectionViewManager updateSnapshotCacheState](self, "updateSnapshotCacheState");

}

- (void)updateSnapshotCacheState
{
  -[TabCollectionViewManager _updateSnapshotCacheStateWithCapacity:](self, "_updateSnapshotCacheStateWithCapacity:", -[TabCollectionViewManager _snapshotCacheCapacity](self, "_snapshotCacheCapacity"));
}

- (unint64_t)_snapshotCacheCapacity
{
  return -[TabCollectionViewManager _snapshotCacheCapacityWithSnapshotsEnabled:](self, "_snapshotCacheCapacityWithSnapshotsEnabled:", self->_snapshotsEnabled);
}

- (void)_updateSnapshotCacheStateWithCapacity:(unint64_t)a3
{
  void *v5;
  id WeakRetained;
  char v7;
  _BOOL4 v8;
  _BOOL8 v9;

  -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "presentationState"))
  {

LABEL_6:
    v8 = 1;
    goto LABEL_7;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v7 = objc_msgSend(WeakRetained, "shouldSnapshotActiveTab");

  if ((v7 & 1) != 0 || self->_flushPendingSnapshots || self->_shouldUpdateSnapshotsTemporarily)
    goto LABEL_6;
  v8 = -[TabCollectionViewManager _shouldUpdateSnapshotsForTabHoverPreview](self, "_shouldUpdateSnapshotsForTabHoverPreview");
LABEL_7:
  v9 = self->_snapshotsEnabled && v8;
  -[TabSnapshotCache setUpdating:forDelegate:](self->_snapshotCache, "setUpdating:forDelegate:", v9, self);
  -[TabSnapshotCache setCapacity:forDelegate:](self->_snapshotCache, "setCapacity:forDelegate:", a3, self);
}

- (NSArray)tabCollectionViews
{
  void *v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_tabOverview);
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_fluidTabOverviewViewController);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  objc_msgSend(v3, "safari_addObjectUnlessNil:", WeakRetained);

  v5 = objc_loadWeakRetained((id *)&self->_tabBarManager);
  objc_msgSend(v5, "effectiveTabBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v7;
}

- (unint64_t)_snapshotCacheCapacityWithSnapshotsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  unint64_t v18;
  id v19;
  _BOOL4 v20;
  _BOOL4 v21;
  id v22;
  void *v23;
  _BOOL4 v24;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewIfLoaded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v7, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v8, "estimatedSnapshotsPerPageForBounds:withTraitCollection:", v17, v10, v12, v14, v16);

    if (objc_msgSend(v8, "presentationState"))
    {
      if (v3)
      {
        if (+[Application systemMemorySize](Application, "systemMemorySize") > 0x40000000)
          v18 *= 2;
        else
          v18 = (unint64_t)((double)v18 * 1.5);
      }
    }
    else if (v3)
    {
      v19 = objc_loadWeakRetained((id *)&self->_tabBar);
      v20 = -[TabCollectionViewManager _shouldUpdateSnapshotsForTabHoverPreview](self, "_shouldUpdateSnapshotsForTabHoverPreview");
      v21 = v20;
      if (v19 && v20)
      {
        v18 += objc_msgSend(v19, "maxNumberOfVisibleTabs");
      }
      else
      {
        v22 = objc_loadWeakRetained((id *)&self->_tabBarManager);
        objc_msgSend(v22, "effectiveTabBar");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
          v24 = v21;
        else
          v24 = 0;
        if (v24)
          v18 += objc_msgSend(v23, "maximumNumberOfVisibleItems");

      }
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)_shouldUpdateSnapshotsForTabHoverPreview
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  char v7;

  if (self->_snapshotsEnabled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
    objc_msgSend(WeakRetained, "effectiveTabBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

LABEL_5:
      +[Application sharedApplication](Application, "sharedApplication");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasPointerDevice");

      return v7;
    }
    v5 = objc_loadWeakRetained((id *)&self->_tabBar);

    if (v5)
      goto LABEL_5;
  }
  return 0;
}

uint64_t __82__TabCollectionViewManager__updateClassicTabBarAnimated_keepingTabVisibleForItem___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned") ^ 1;
}

- (BOOL)tabCollectionView:(id)a3 canCloseItem:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v7, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "tabWithUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_4;
  v11 = objc_loadWeakRetained((id *)&self->_tabBar);
  if (v11 == v6)
  {

LABEL_6:
    v15 = objc_loadWeakRetained((id *)&self->_tabBarManager);
    objc_msgSend(v15, "inlineTabBar");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16 == v6)
    {
      v17 = objc_msgSend(v15, "displayMode");

      if (v17 != 1)
      {
        v14 = 0;
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(WeakRetained, "canCloseTabWithUUID:", v18);

LABEL_11:
    goto LABEL_12;
  }
  v12 = v11;
  v13 = objc_msgSend(v7, "isPinned");

  if ((v13 & 1) == 0)
    goto LABEL_6;
LABEL_4:
  v14 = 0;
LABEL_12:

  return v14;
}

- (TabGroupSwitcherViewController)tabGroupSwitcherViewController
{
  return self->_tabGroupSwitcherViewController;
}

- (BOOL)tabGroupSwitcherCanShowProfileInToolbar:(id)a3
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v4 = objc_msgSend(WeakRetained, "canShowProfileInTabOverviewToolbar");

  return v4;
}

- (void)setTabThumbnailCollectionViewStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  TabOverview *tabOverview;
  SFFluidTabOverviewViewController *fluidTabOverviewViewController;
  TabGroupSwitcherViewController *tabGroupSwitcherViewController;
  void *v11;
  TabGroupSwitcherViewController *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  TabSwitcherViewController *tabSwitcherViewController;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id location;

  if (self->_tabThumbnailCollectionViewStyle != a3)
  {
    -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchTerm");
    v30 = objc_claimAutoreleasedReturnValue();

    self->_tabThumbnailCollectionViewStyle = a3;
    objc_msgSend(v5, "dismissAnimated:", 0);
    objc_msgSend(v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    objc_msgSend(v5, "setDelegate:", 0);
    tabOverview = self->_tabOverview;
    self->_tabOverview = 0;

    fluidTabOverviewViewController = self->_fluidTabOverviewViewController;
    self->_fluidTabOverviewViewController = 0;

    tabGroupSwitcherViewController = self->_tabGroupSwitcherViewController;
    if (tabGroupSwitcherViewController)
    {
      -[TabGroupSwitcherViewController view](tabGroupSwitcherViewController, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

      v12 = self->_tabGroupSwitcherViewController;
      self->_tabGroupSwitcherViewController = 0;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    v14 = WeakRetained;
    if (self->_tabSwitcherViewController)
    {
      objc_msgSend(WeakRetained, "rootViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tearDownTabSwitcherViewController");

      tabSwitcherViewController = self->_tabSwitcherViewController;
      self->_tabSwitcherViewController = 0;

    }
    if (a3 == 2)
    {
      if (SFEnhancedTabOverviewEnabled())
        -[TabCollectionViewManager _setUpTabSwitcherViewController](self, "_setUpTabSwitcherViewController");
      else
        -[TabCollectionViewManager _setUpFluidTabOverview](self, "_setUpFluidTabOverview");
    }
    else if (a3 == 1)
    {
      -[TabCollectionViewManager _setUpTabOverview](self, "_setUpTabOverview");
    }
    objc_initWeak(&location, self);
    v17 = (void *)MEMORY[0x1E0DC3428];
    v18 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __63__TabCollectionViewManager_setTabThumbnailCollectionViewStyle___block_invoke;
    v37[3] = &unk_1E9CF2C28;
    objc_copyWeak(&v38, &location);
    objc_msgSend(v17, "actionWithHandler:", v37);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0DC3428];
    v32 = v18;
    v33 = 3221225472;
    v34 = __63__TabCollectionViewManager_setTabThumbnailCollectionViewStyle___block_invoke_2;
    v35 = &unk_1E9CF2C28;
    objc_copyWeak(&v36, &location);
    objc_msgSend(v20, "actionWithHandler:", &v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "toolbar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "addPrimaryAction:forBarButton:", v19, 1);
    objc_msgSend(v23, "addPrimaryAction:forBarButton:", v21, 2);
    -[TabCollectionViewManager _openNewTabInteraction](self, "_openNewTabInteraction");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addInteraction:toBarButton:", v24, 1);

    objc_msgSend(MEMORY[0x1E0DC39D0], "sf_tabMenu");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMenu:forBarButton:", v25, 2);

    +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = objc_msgSend(v26, "isFloatingSidebarButtonEnabled");

    if ((_DWORD)v20)
    {
      objc_msgSend(v14, "sidebarAction");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addPrimaryAction:forBarButton:", v27, 4);

    }
    -[TabCollectionViewManager _updateAddTabMenuProvider](self, "_updateAddTabMenuProvider", v30, v32, v33, v34, v35);
    -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "searchController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSearchTerm:", v31);

    -[TabCollectionViewManager updateSnapshotCacheState](self, "updateSnapshotCacheState");
    objc_destroyWeak(&v36);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

  }
}

- (void)_updateAddTabMenuProvider
{
  void *v3;
  void *v4;
  id v5;

  -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabCollectionViewManager _recentlyClosedTabsMenu](self, "_recentlyClosedTabsMenu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMenu:forBarButton:", v4, 1);

}

- (void)_setUpTabOverview
{
  id WeakRetained;
  TabOverview *v4;
  TabOverview *tabOverview;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "makeTabOverview");
  v4 = (TabOverview *)objc_claimAutoreleasedReturnValue();
  tabOverview = self->_tabOverview;
  self->_tabOverview = v4;

  -[TabOverview setDelegate:](self->_tabOverview, "setDelegate:", self);
  v6 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v6, "didSetUpTabOverview");

  -[TabCollectionViewManager updateTabOverviewItems](self, "updateTabOverviewItems");
  -[TabCollectionViewManager updateExplanationViewVisibilityAnimated:](self, "updateExplanationViewVisibilityAnimated:", 0);
  -[TabOverview addPresentationObserver:](self->_tabOverview, "addPresentationObserver:", self->_tabGroupSwitcherViewController);
}

- (id)currentItemForTabOverview:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "activeNonLibraryTab");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabOverviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateExplanationViewVisibilityAnimated:(BOOL)a3
{
  -[TabOverview setShowsPrivateBrowsingExplanationView:animated:](self->_tabOverview, "setShowsPrivateBrowsingExplanationView:animated:", -[TabCollectionViewManager _shouldShowExplanationView](self, "_shouldShowExplanationView"), a3);
}

- (BOOL)_shouldShowExplanationView
{
  void *v3;
  char v4;
  BOOL v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  if (!self->_privateBrowsingEnabled)
    return 0;
  +[Application sharedApplication](Application, "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPrivateBrowsingLocked");

  if ((v4 & 1) != 0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "currentTabs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "hiddenTabForExplanationView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8 == v9;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_recentlyClosedTabsMenu
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;
  id from;
  id location;

  if (self->_privateBrowsingEnabled)
    return 0;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_initWeak(&from, WeakRetained);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __51__TabCollectionViewManager__recentlyClosedTabsMenu__block_invoke;
  v12 = &unk_1E9CF6770;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  v5 = _Block_copy(&v9);
  v6 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(WeakRetained, "activeProfile", v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_recentlyClosedTabsMenuForProfile:showProfileTitle:openHandler:", v7, objc_msgSend(WeakRetained, "hasMultipleProfiles"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
  return v8;
}

- (id)_openNewTabInteraction
{
  UserNavigationDropInteraction *v2;
  UserNavigationDropInteraction *v3;
  _QWORD v5[4];
  id v6;
  id to;

  objc_copyWeak(&to, (id *)&self->_browserController);
  v2 = [UserNavigationDropInteraction alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__TabCollectionViewManager__openNewTabInteraction__block_invoke;
  v5[3] = &unk_1E9CF6748;
  objc_copyWeak(&v6, &to);
  v3 = -[UserNavigationDropInteraction initWithOpensNewTab:tabOrder:navigationHandler:](v2, "initWithOpensNewTab:tabOrder:navigationHandler:", 1, 1, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&to);
  return v3;
}

- (void)setTabBarManager:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tabBarManager, obj);
    objc_msgSend(WeakRetained, "removeObserver:", self);
    objc_msgSend(obj, "addObserver:", self);
  }

}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void)setBrowserController:(id)a3
{
  objc_storeWeak((id *)&self->_browserController, a3);
}

- (TabCollectionViewManager)init
{
  TabCollectionViewManager *v2;
  uint64_t v3;
  TabSnapshotCache *snapshotCache;
  uint64_t v5;
  NSMutableSet *hiddenTabUUIDs;
  id v7;
  void *v8;
  uint64_t v9;
  SFTabIconPool *iconPool;
  uint64_t v11;
  SFTabSnapshotPool *v12;
  SFTabSnapshotPool *snapshotPool;
  void *v14;
  TabCollectionViewManager *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)TabCollectionViewManager;
  v2 = -[TabCollectionViewManager init](&v31, sel_init);
  if (v2)
  {
    +[TabSnapshotCache defaultSnapshotCache](TabSnapshotCache, "defaultSnapshotCache");
    v3 = objc_claimAutoreleasedReturnValue();
    snapshotCache = v2->_snapshotCache;
    v2->_snapshotCache = (TabSnapshotCache *)v3;

    v2->_snapshotsEnabled = 1;
    -[TabSnapshotCache setDelegate:](v2->_snapshotCache, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    hiddenTabUUIDs = v2->_hiddenTabUUIDs;
    v2->_hiddenTabUUIDs = (NSMutableSet *)v5;

    objc_initWeak(&location, v2);
    v7 = objc_alloc(MEMORY[0x1E0D4EDB0]);
    objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithSiteMetadataManager:", v8);
    iconPool = v2->_iconPool;
    v2->_iconPool = (SFTabIconPool *)v9;

    v11 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __32__TabCollectionViewManager_init__block_invoke;
    v28[3] = &unk_1E9CF6658;
    objc_copyWeak(&v29, &location);
    -[SFTabIconPool setExistingIconProvider:](v2->_iconPool, "setExistingIconProvider:", v28);
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __32__TabCollectionViewManager_init__block_invoke_2;
    v26[3] = &unk_1E9CF6680;
    objc_copyWeak(&v27, &location);
    -[SFTabIconPool setExtensionIconProvider:](v2->_iconPool, "setExtensionIconProvider:", v26);
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __32__TabCollectionViewManager_init__block_invoke_3;
    v24[3] = &unk_1E9CF66A8;
    objc_copyWeak(&v25, &location);
    -[SFTabIconPool setUrlProvider:](v2->_iconPool, "setUrlProvider:", v24);
    v12 = (SFTabSnapshotPool *)objc_alloc_init(MEMORY[0x1E0D4EDC0]);
    snapshotPool = v2->_snapshotPool;
    v2->_snapshotPool = v12;

    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __32__TabCollectionViewManager_init__block_invoke_4;
    v22[3] = &unk_1E9CF66D0;
    objc_copyWeak(&v23, &location);
    -[SFTabSnapshotPool setContentProvider:](v2->_snapshotPool, "setContentProvider:", v22);
    v17 = v11;
    v18 = 3221225472;
    v19 = __32__TabCollectionViewManager_init__block_invoke_5;
    v20 = &unk_1E9CF25A0;
    objc_copyWeak(&v21, &location);
    -[SFTabSnapshotPool setSortedSnapshotIdentifiersDidChangeHandler:](v2->_snapshotPool, "setSortedSnapshotIdentifiersDidChangeHandler:", &v17);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__didReceiveMemoryWarning_, *MEMORY[0x1E0DC4778], 0);
    v15 = v2;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (NSSet)allSnapshotIdentifiers
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
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
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "normalAndPrivateTabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count") + 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10), "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(WeakRetained, "allTabGroups", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        -[TabCollectionViewManager _blankSnapshotGroupIdentifierForTabGroup:](self, "_blankSnapshotGroupIdentifierForTabGroup:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  return (NSSet *)v5;
}

void __53__TabCollectionViewManager_updateSnapshotIdentifiers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void (**v6)(void *, void *, uint64_t, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id obj;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  void (**v73)(void *, void *, uint64_t, void *);
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD aBlock[4];
  id v83;
  uint64_t v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__TabCollectionViewManager_updateSnapshotIdentifiers__block_invoke_2;
  aBlock[3] = &unk_1E9CF6948;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v55 = v4;
  v83 = v4;
  v84 = v5;
  v6 = (void (**)(void *, void *, uint64_t, void *))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 40), "activeTabGroup");
  v57 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_blankSnapshotGroupIdentifierForTabGroup:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v60 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_hiddenCollectionViewTabs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v79 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v14, objc_msgSend(v13, "isShowingSystemStartPage"), v7);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    }
    while (v10);
  }

  if (SFEnhancedTabOverviewEnabled()
    && (objc_msgSend(*(id *)(v60 + 32), "tabThumbnailCollectionView"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "presentationState"),
        v15,
        v16))
  {
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v17 = v60;
    objc_msgSend(*(id *)(*(_QWORD *)(v60 + 32) + 224), "sortedSnapshotIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v75;
      do
      {
        v22 = 0;
        v61 = v20;
        do
        {
          if (*(_QWORD *)v75 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v22);
          objc_msgSend(*(id *)(v17 + 32), "tabWithUUID:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v24, "uuid");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, v26, objc_msgSend(v25, "isShowingSystemStartPage"), v7);
          }
          else
          {
            v27 = *(void **)(v17 + 40);
            objc_msgSend(v23, "UUIDString");
            v28 = v21;
            v29 = v18;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "wbTabWithUUID:", v30);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = *(void **)(v17 + 40);
            objc_msgSend(v26, "uuid");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "tabGroupRelatedToTabWithUUID:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(v60 + 32), "_blankSnapshotGroupIdentifierForTabGroup:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, v23, objc_msgSend(v26, "isBlank"), v34);

            v17 = v60;
            v18 = v29;
            v21 = v28;
            v20 = v61;
          }

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
      }
      while (v20);
    }
  }
  else
  {
    v17 = v60;
    v35 = *(void **)(v60 + 32);
    v71[0] = v3;
    v71[1] = 3221225472;
    v71[2] = __53__TabCollectionViewManager_updateSnapshotIdentifiers__block_invoke_3;
    v71[3] = &unk_1E9CF6970;
    v73 = v6;
    v72 = v7;
    objc_msgSend(v35, "_enumerateTabsOrderedByVisibility:", v71);

    v18 = v73;
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(*(id *)(v17 + 40), "allTabGroups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
  v37 = (void *)v57;
  if (v36)
  {
    v38 = v36;
    v39 = *(_QWORD *)v68;
    v56 = *(_QWORD *)v68;
    do
    {
      v40 = 0;
      v58 = v38;
      do
      {
        if (*(_QWORD *)v68 != v39)
          objc_enumerationMutation(obj);
        v62 = v40;
        v41 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v40);
        objc_msgSend(v41, "uuid");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "uuid");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "isEqual:", v43);

        if ((v44 & 1) == 0)
        {
          objc_msgSend(*(id *)(v60 + 32), "_blankSnapshotGroupIdentifierForTabGroup:", v41);
          v45 = objc_claimAutoreleasedReturnValue();

          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          objc_msgSend(v41, "tabs");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v85, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v64;
            do
            {
              for (j = 0; j != v48; ++j)
              {
                if (*(_QWORD *)v64 != v49)
                  objc_enumerationMutation(v46);
                v51 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
                v52 = objc_alloc(MEMORY[0x1E0CB3A28]);
                objc_msgSend(v51, "uuid");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = (void *)objc_msgSend(v52, "initWithUUIDString:", v53);
                v6[2](v6, v54, objc_msgSend(v51, "isBlank"), (void *)v45);

              }
              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v85, 16);
            }
            while (v48);
          }

          v7 = (void *)v45;
          v39 = v56;
          v37 = (void *)v57;
          v38 = v58;
        }
        v40 = v62 + 1;
      }
      while (v62 + 1 != v38);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
    }
    while (v38);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v60 + 32) + 96), "setIdentifiersToCache:forDelegate:", v55);
}

- (id)_blankSnapshotGroupIdentifierForTabGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isSyncable"))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v4, "isPrivateBrowsing");
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "blankSnapshotGroupIdentifierForPrivateBrowsing:syncableTabGroupUUID:forWindowWithUUID:", v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBlankSnapshotGroupIdentifier:forPrivateBrowsing:syncableTabGroupUUID:forWindowWithUUID:", v10, v7, v6, v9);
  }

  return v10;
}

- (void)tabSnapshotCache:(id)a3 didCacheSnapshotWithIdentifier:(id)a4
{
  -[TabCollectionViewManager _updateTabSnapshotsWithIdentifier:animated:](self, "_updateTabSnapshotsWithIdentifier:animated:", a4, 0);
}

- (void)_updateTabSnapshotsWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  TabOverview *tabOverview;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "normalAndPrivateTabs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v26 = WeakRetained;
  v27 = v5;
  v25 = v7;
  if (v5)
  {
    objc_msgSend(WeakRetained, "tabWithUUID:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && objc_msgSend(v8, "containsObject:", v9))
    {
      v33[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = v7;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        tabOverview = self->_tabOverview;
        objc_msgSend(v16, "tabOverviewItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabOverview updateSnapshotForItem:](tabOverview, "updateSnapshotForItem:", v18);

        objc_msgSend(v16, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabCollectionViewManager cachedContentImageForTabWithUUID:allowScaledImage:](self, "cachedContentImageForTabWithUUID:allowScaledImage:", v19, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v16, "uuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CollectionViewTab uuid](self->_tabShowingPreview, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isEqual:", v22) & 1) != 0)
          {
            v23 = objc_msgSend(v16, "isActive");

            if ((v23 & 1) != 0)
              goto LABEL_19;
            v24 = objc_loadWeakRetained((id *)&self->_browserController);
            objc_msgSend(v24, "tabHoverPreview");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "setSnapshotImage:", v20);
          }
          else
          {

          }
        }
LABEL_19:

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

  if (v27)
    -[SFTabSnapshotPool contentDidChangeForSnapshotsWithIdentifier:](self->_snapshotPool, "contentDidChangeForSnapshotsWithIdentifier:", v27);

}

- (BOOL)tabCollectionView:(id)a3 includesHeaderInSnapshotForItems:(id)a4
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;

  p_dataSource = &self->_dataSource;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v5, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "tabDocumentWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isShowingSystemStartPage") ^ 1;

  return v9;
}

- (id)cachedContentImageForTabWithUUID:(id)a3 allowScaledImage:(BOOL)a4
{
  id v6;
  CGImage *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  CGFloat Width;
  CGImage *v19;
  CGRect v21;
  CGRect v22;

  -[TabSnapshotCache snapshotWithIdentifier:](self->_snapshotCache, "snapshotWithIdentifier:", a3);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (CGImage *)objc_msgSend(v6, "CGImage");

  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    v17 = v16;

    if (a4 || (double)CGImageGetWidth(v7) / (v12 * v17) >= 0.5 && (double)CGImageGetHeight(v7) / (v14 * v17) >= 0.5)
    {
      Width = (double)CGImageGetWidth(v7);
      v21.size.height = (double)CGImageGetHeight(v7);
      v21.origin.x = 0.0;
      v21.origin.y = 0.0;
      v21.size.width = Width;
      v22 = CGRectInset(v21, 1.0, 1.0);
      v22.origin.y = v22.origin.y + 200.0;
      v22.size.height = v22.size.height + -200.0;
      v19 = CGImageCreateWithImageInRect(v7, v22);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v19);
      v7 = (CGImage *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v19);
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (id)tabCollectionView:(id)a3 snapshotForItem:(id)a4
{
  TabSnapshotCache *snapshotCache;
  void *v5;
  void *v6;

  snapshotCache = self->_snapshotCache;
  objc_msgSend(a4, "UUID", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabSnapshotCache snapshotWithIdentifier:](snapshotCache, "snapshotWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __53__TabCollectionViewManager_updateSnapshotIdentifiers__block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a2;
  v7 = a4;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
    if (a3)
    {
      objc_msgSend(v8, "groupIdentifierForSnapshotWithIdentifier:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", v7);

      if ((v10 & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "addIdentifier:toGroupWithIdentifier:", v11, v7);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 224), "contentDidChangeForSnapshotsWithIdentifier:", v11);
      }
    }
    else
    {
      objc_msgSend(v8, "removeIdentifier:fromGroupWithIdentifier:", v11, v7);
    }
  }

}

- (BOOL)tabSnapshotCacheShouldDeferNextSnapshotRequest:(id)a3
{
  return self->_shouldDeferSnapshotRequest;
}

- (id)snapshotsToPersistOnDiskForTabSnapshotCache:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "allTabGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_reduceObjectsWithInitialValue:usingBlock:", v5, &__block_literal_global_64);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_hiddenCollectionViewTabs
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(WeakRetained, "currentTabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__TabCollectionViewManager__hiddenCollectionViewTabs__block_invoke;
  v9[3] = &unk_1E9CF2C90;
  v9[4] = self;
  objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithArray:", v6);

  return v7;
}

- (void)_enumerateTabsOrderedByVisibility:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "presentationState"))
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __62__TabCollectionViewManager__enumerateTabsOrderedByVisibility___block_invoke;
    v30[3] = &unk_1E9CF6998;
    v32 = v4;
    v31 = WeakRetained;
    v7 = v4;
    objc_msgSend(v6, "enumerateItemsOrderedByVisibility:", v30);

  }
  else
  {
    objc_msgSend(WeakRetained, "currentTabs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "activeNonLibraryTab");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "indexOfObject:", v9);
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      v12 = 0;
    else
      v12 = v10;
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      objc_msgSend(v8, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v13)
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(v8, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == v14)
          v11 = objc_msgSend(v8, "count") - 1;
        else
          v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __62__TabCollectionViewManager__enumerateTabsOrderedByVisibility___block_invoke_2;
    v25 = &unk_1E9CF69C0;
    v27 = v4;
    v28 = v11;
    v29 = v12;
    v7 = v8;
    v26 = v7;
    v15 = v4;
    v16 = _Block_copy(&v22);
    if (-[TabCollectionViewManager _shouldUpdateSnapshotsForTabHoverPreview](self, "_shouldUpdateSnapshotsForTabHoverPreview", v22, v23, v24, v25))
    {
      v17 = objc_loadWeakRetained((id *)&self->_tabBar);
      v18 = objc_loadWeakRetained((id *)&self->_tabBarManager);
      objc_msgSend(v18, "effectiveTabBar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v19;
      if ((v19 || (v20 = v17, v21 = v12, v17))
        && (v21 = objc_msgSend(v20, "indexOfCenterItem"), v21 == 0x7FFFFFFFFFFFFFFFLL)
        || v21 >= objc_msgSend(v7, "count"))
      {
        v21 = v12;
      }
      objc_msgSend(v7, "safari_enumerateOutwardFromIndex:otherIndex:usingBlock:", v12, v21, v16);

    }
    else
    {
      objc_msgSend(v7, "safari_enumerateOutwardFromIndex:usingBlock:", v12, v16);
    }

  }
}

- (BOOL)tabBarItemsFixed
{
  return self->_tabBarItemsFixed != 0;
}

- (void)updateTabBarAnimated:(BOOL)a3
{
  -[TabCollectionViewManager updateTabBarAnimated:keepingTabVisible:](self, "updateTabBarAnimated:keepingTabVisible:", a3, 0);
}

- (void)endFixingTabOverviewItems
{
  --self->_tabOverviewItemsFixed;
}

- (void)endFixingTabBarItems
{
  --self->_tabBarItemsFixed;
}

id __72__TabCollectionViewManager_snapshotsToPersistOnDiskForTabSnapshotCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a2, "tabsUUIDSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)tabCollectionViewItemHeaderHeightIncludedInSnapshot:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  char v6;
  double v7;
  void *v8;
  void *v9;
  double MaxY;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (!SFEnhancedTabOverviewEnabled())
    goto LABEL_3;
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isShowingSystemStartPage");

  v7 = 0.0;
  if ((v6 & 1) == 0)
  {
LABEL_3:
    objc_msgSend(WeakRetained, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentAndTopBarsContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBarFrameInCoordinateSpace:", v9);
    MaxY = CGRectGetMaxY(v26);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(WeakRetained, "bannerController", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topBannersAnchoredToStatusBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      v16 = MaxY;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v18, "bounds");
          objc_msgSend(v9, "convertRect:fromView:", v18);
          v16 = fmax(v16, CGRectGetMaxY(v27));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }
    else
    {
      v16 = MaxY;
    }

    v7 = v16 - MaxY;
  }

  return v7;
}

- (TabDragDropInteractionController)tabDragDropController
{
  TabDragDropInteractionController *tabDragDropController;
  TabDocumentDropHandler *v4;
  id WeakRetained;
  void *v6;
  TabDocumentDropHandler *v7;
  TabDragDropInteractionController *v8;
  TabDragDropInteractionController *v9;

  tabDragDropController = self->_tabDragDropController;
  if (!tabDragDropController)
  {
    v4 = [TabDocumentDropHandler alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TabDocumentDropHandler initWithAlertPresentationViewController:](v4, "initWithAlertPresentationViewController:", v6);

    v8 = -[TabDragDropInteractionController initWithDataSource:dropHandler:]([TabDragDropInteractionController alloc], "initWithDataSource:dropHandler:", self, v7);
    v9 = self->_tabDragDropController;
    self->_tabDragDropController = v8;

    tabDragDropController = self->_tabDragDropController;
  }
  return tabDragDropController;
}

- (void)setTabBar:(id)a3
{
  id WeakRetained;
  TabCollectionViewManager *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tabBar, obj);
    objc_msgSend(WeakRetained, "delegate");
    v5 = (TabCollectionViewManager *)objc_claimAutoreleasedReturnValue();

    if (v5 == self)
      objc_msgSend(WeakRetained, "setDelegate:", 0);
    objc_msgSend(WeakRetained, "tabHoverPreviewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", 0);

    objc_msgSend(obj, "tabHoverPreviewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    objc_msgSend(obj, "setDelegate:", self);
    v8 = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v8, "activeNonLibraryTab");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabCollectionViewManager updateTabBarAnimated:keepingTabVisible:](self, "updateTabBarAnimated:keepingTabVisible:", 0, v9);

  }
}

- (void)setSnapshotsEnabled:(BOOL)a3
{
  void (**postponedSnapshotInvalidationBlock)(id, SEL);
  id v5;

  if (((!self->_snapshotsEnabled ^ a3) & 1) == 0)
  {
    self->_snapshotsEnabled = a3;
    if (a3)
    {
      postponedSnapshotInvalidationBlock = (void (**)(id, SEL))self->_postponedSnapshotInvalidationBlock;
      if (postponedSnapshotInvalidationBlock)
      {
        postponedSnapshotInvalidationBlock[2](postponedSnapshotInvalidationBlock, a2);
        v5 = self->_postponedSnapshotInvalidationBlock;
        self->_postponedSnapshotInvalidationBlock = 0;

      }
    }
    -[TabCollectionViewManager updateSnapshotCacheState](self, "updateSnapshotCacheState");
  }
}

- (void)setPostponedSnapshotInvalidationCondition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)tabCollectionView:(id)a3 validSnapshotExistsForItem:(id)a4
{
  TabSnapshotCache *snapshotCache;
  void *v5;

  snapshotCache = self->_snapshotCache;
  objc_msgSend(a4, "UUID", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(snapshotCache) = -[TabSnapshotCache hasValidSnapshotWithIdentifier:](snapshotCache, "hasValidSnapshotWithIdentifier:", v5);

  return (char)snapshotCache;
}

uint64_t __53__TabCollectionViewManager__hiddenCollectionViewTabs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_isTabHiddenWithUUID:", v3);

  return v4;
}

- (void)updateSnapshotIdentifiers
{
  id WeakRetained;
  TabSnapshotCache *snapshotCache;
  id v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  snapshotCache = self->_snapshotCache;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__TabCollectionViewManager_updateSnapshotIdentifiers__block_invoke;
  v6[3] = &unk_1E9CF1830;
  v6[4] = self;
  v7 = WeakRetained;
  v5 = WeakRetained;
  -[TabSnapshotCache performBatchUpdatesWithBlock:](snapshotCache, "performBatchUpdatesWithBlock:", v6);

}

- (double)tabCollectionViewItemHeaderHeight:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  double MaxY;
  CGRect v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBarFrameInCoordinateSpace:", v5);
  MaxY = CGRectGetMaxY(v8);

  return MaxY;
}

- (void)updateSnapshotsForTabHoverPreviewIfNeeded
{
  void *v3;
  uint64_t v4;

  if (-[TabCollectionViewManager _shouldUpdateSnapshotsForTabHoverPreview](self, "_shouldUpdateSnapshotsForTabHoverPreview"))
  {
    -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "presentationState");

    if (!v4)
      -[TabCollectionViewManager updateSnapshotIdentifiers](self, "updateSnapshotIdentifiers");
  }
}

void __62__TabCollectionViewManager__enumerateTabsOrderedByVisibility___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  if (*(_QWORD *)(a1 + 48) != a3)
  {
    v8 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = v8;
    if (*(_QWORD *)(a1 + 48) != 0x7FFFFFFFFFFFFFFFLL && *(_QWORD *)(a1 + 56) == a3)
    {
      v6 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

      v5 = v8;
    }
  }

}

void __53__TabCollectionViewManager_updateSnapshotIdentifiers__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isShowingSystemStartPage");

  (*(void (**)(uint64_t, id, uint64_t, _QWORD))(v3 + 16))(v3, v6, v5, *(_QWORD *)(a1 + 32));
}

id __32__TabCollectionViewManager_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_iconForTabWithUUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __32__TabCollectionViewManager_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_extensionIconForTabWithURL:UUID:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __32__TabCollectionViewManager_init__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_urlForTabWithUUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __32__TabCollectionViewManager_init__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_contentForSnapshotWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __32__TabCollectionViewManager_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateSnapshotIdentifiers");

}

- (void)dealloc
{
  void (**flushPendingSnapshotsCompletion)(id, _QWORD);
  objc_super v4;

  flushPendingSnapshotsCompletion = (void (**)(id, _QWORD))self->_flushPendingSnapshotsCompletion;
  if (flushPendingSnapshotsCompletion)
    flushPendingSnapshotsCompletion[2](flushPendingSnapshotsCompletion, 0);
  v4.receiver = self;
  v4.super_class = (Class)TabCollectionViewManager;
  -[TabCollectionViewManager dealloc](&v4, sel_dealloc);
}

- (void)_didReceiveMemoryWarning:(id)a3
{
  -[TabCollectionViewManager updateSnapshotIdentifiers](self, "updateSnapshotIdentifiers", a3);
  -[TabCollectionViewManager _updateSnapshotCacheStateWithCapacity:](self, "_updateSnapshotCacheStateWithCapacity:", -[TabCollectionViewManager _snapshotCacheCapacityWithSnapshotsEnabled:](self, "_snapshotCacheCapacityWithSnapshotsEnabled:", 0));
}

- (void)setPrivateBrowsingEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id WeakRetained;

  if (self->_privateBrowsingEnabled != a3)
  {
    v4 = a4;
    self->_privateBrowsingEnabled = a3;
    -[TabCollectionViewManager _updateAddTabMenuProvider](self, "_updateAddTabMenuProvider");
    -[TabCollectionViewManager updateExplanationViewVisibilityAnimated:](self, "updateExplanationViewVisibilityAnimated:", v4);
    -[TabCollectionViewManager updateTabOverviewItems](self, "updateTabOverviewItems");
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "activeNonLibraryTab");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabCollectionViewManager updateTabBarAnimated:keepingTabVisible:](self, "updateTabBarAnimated:keepingTabVisible:", 0, v6);

  }
}

- (BOOL)tabItem:(id)a3 matchesSearchText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSArray *v20;
  NSArray *searchTermWords;
  NSString *v22;
  NSString *lastSearchTerm;
  void *v24;
  void *v25;
  int v26;
  char v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  NSArray *obj;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "lastSearchTerm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  objc_msgSend(v6, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleForLastSearch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  objc_msgSend(v6, "URLString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLStringForLastSearch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (v9 && v12 && v15)
  {
    LOBYTE(v16) = objc_msgSend(v6, "matchedLastSearch");
    goto LABEL_35;
  }
  if ((objc_msgSend(v7, "isEqualToString:", self->_lastSearchTerm) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v7, "length");
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __54__TabCollectionViewManager_tabItem_matchesSearchText___block_invoke;
    v68[3] = &unk_1E9CF66F8;
    v69 = v17;
    v19 = v17;
    objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v18, 3, v68);
    v20 = (NSArray *)objc_msgSend(v19, "copy");
    searchTermWords = self->_searchTermWords;
    self->_searchTermWords = v20;

  }
  v22 = (NSString *)objc_msgSend(v7, "copy");
  lastSearchTerm = self->_lastSearchTerm;
  self->_lastSearchTerm = v22;

  objc_msgSend(v6, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLastSearchTerm:", v7);
  objc_msgSend(v6, "setURLStringForLastSearch:", v25);
  objc_msgSend(v6, "setTitleForLastSearch:", v24);
  v26 = objc_msgSend(v24, "localizedStandardContainsString:", v7);
  v27 = v26;
  if (((v12 ^ 1 | v26) & 1) == 0)
  {
    objc_msgSend(v6, "titleWords");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
      goto LABEL_10;
    goto LABEL_9;
  }
  if ((v12 & 1) == 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v24, "length");
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __54__TabCollectionViewManager_tabItem_matchesSearchText___block_invoke_2;
    v66[3] = &unk_1E9CF66F8;
    v67 = v28;
    v30 = v28;
    objc_msgSend(v24, "enumerateSubstringsInRange:options:usingBlock:", 0, v29, 3, v66);
    objc_msgSend(v6, "setTitleWords:", v30);

  }
LABEL_10:
  if ((v27 & 1) != 0)
    goto LABEL_33;
  if (-[NSArray count](self->_searchTermWords, "count"))
  {
    v50 = v15;
    v51 = v25;
    v52 = v24;
    v53 = v7;
    v31 = (void *)-[NSArray mutableCopy](self->_searchTermWords, "mutableCopy");
    v54 = v6;
    objc_msgSend(v6, "titleWords");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = self->_searchTermWords;
    v33 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v63 != v35)
            objc_enumerationMutation(obj);
          v37 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v38 = v32;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
          if (v39)
          {
            v40 = v39;
            v41 = *(_QWORD *)v59;
            do
            {
              for (j = 0; j != v40; ++j)
              {
                if (*(_QWORD *)v59 != v41)
                  objc_enumerationMutation(v38);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "safari_hasLocalizedCaseAndDiacriticInsensitivePrefix:", v37))objc_msgSend(v31, "removeObject:", v37);
              }
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
            }
            while (v40);
          }

        }
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      }
      while (v34);
    }

    v43 = objc_msgSend(v31, "count");
    v7 = v53;
    v6 = v54;
    v25 = v51;
    v24 = v52;
    v15 = v50;
    if (!v43)
      goto LABEL_33;
  }
  if (!v15
    || (objc_msgSend(v6, "URLStringComponents"),
        v44 = (void *)objc_claimAutoreleasedReturnValue(),
        v44,
        !v44))
  {
    objc_msgSend(v25, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 0, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "componentsSeparatedByString:", CFSTR("."));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setURLStringComponents:", v46);

  }
  if ((objc_msgSend(v25, "localizedStandardContainsString:", v7) & 1) != 0)
  {
LABEL_33:
    LOBYTE(v16) = 1;
    objc_msgSend(v6, "setMatchedLastSearch:", 1);
  }
  else
  {
    objc_msgSend(v6, "URLStringComponents");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __54__TabCollectionViewManager_tabItem_matchesSearchText___block_invoke_3;
    v56[3] = &unk_1E9CF6720;
    v57 = v7;
    v16 = objc_msgSend(v49, "safari_containsObjectPassingTest:", v56);

    objc_msgSend(v6, "setMatchedLastSearch:", v16);
  }

LABEL_35:
  return v16;
}

uint64_t __54__TabCollectionViewManager_tabItem_matchesSearchText___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __54__TabCollectionViewManager_tabItem_matchesSearchText___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __54__TabCollectionViewManager_tabItem_matchesSearchText___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_hasLocalizedCaseInsensitivePrefix:", *(_QWORD *)(a1 + 32));
}

- (void)_setUpFluidTabOverview
{
  SFFluidTabOverviewViewController *v3;
  SFFluidTabOverviewViewController *fluidTabOverviewViewController;
  void *v5;
  id WeakRetained;

  v3 = objc_alloc_init(SFFluidTabOverviewViewController);
  fluidTabOverviewViewController = self->_fluidTabOverviewViewController;
  self->_fluidTabOverviewViewController = v3;

  -[SFFluidTabOverviewViewController setDelegate:](self->_fluidTabOverviewViewController, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFluidTabOverviewViewController setTabController:](self->_fluidTabOverviewViewController, "setTabController:", v5);

}

- (void)_setUpTabSwitcherViewController
{
  id WeakRetained;
  void *v4;
  TabSwitcherViewController *v5;
  TabSwitcherViewController *tabSwitcherViewController;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpTabSwitcherViewController");
  v5 = (TabSwitcherViewController *)objc_claimAutoreleasedReturnValue();
  tabSwitcherViewController = self->_tabSwitcherViewController;
  self->_tabSwitcherViewController = v5;

  -[TabSwitcherViewController setDelegate:](self->_tabSwitcherViewController, "setDelegate:", self);
  v7 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v7, "didSetUpTabSwitcherViewController");

}

- (void)_openTabFromNewTabButton
{
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__TabCollectionViewManager__openTabFromNewTabButton__block_invoke;
  v4[3] = &unk_1E9CF16A0;
  v4[4] = self;
  objc_msgSend(WeakRetained, "openNewTabWithCompletionHandler:", v4);

}

void __52__TabCollectionViewManager__openTabFromNewTabButton__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_DEFAULT, "Open new tab via tab view button", v6, 2u);
  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didOpenNewBlankTabWithTrigger:tabCollectionViewType:", 2, objc_msgSend(*(id *)(a1 + 32), "visibleTabCollectionViewType"));

  }
}

void __50__TabCollectionViewManager__openNewTabInteraction__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v3);

}

void __51__TabCollectionViewManager__recentlyClosedTabsMenu__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "insertTabDocumentFromTabStateData:", v7);
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 4, objc_msgSend(WeakRetained, "visibleTabCollectionViewType"));

    }
  }

}

void __63__TabCollectionViewManager_setTabThumbnailCollectionViewStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_openTabFromNewTabButton");

}

void __63__TabCollectionViewManager_setTabThumbnailCollectionViewStyle___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tabThumbnailCollectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissAnimated:", 1);

}

- (BOOL)hasTabBar
{
  id WeakRetained;
  void *v4;
  BOOL v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
  objc_msgSend(WeakRetained, "effectiveTabBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_tabBar);
    v5 = v6 != 0;

  }
  return v5;
}

- (int64_t)visibleTabCollectionViewType
{
  void *v3;
  uint64_t v4;
  id WeakRetained;

  -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationState");

  if (v4)
    return 2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);

  return WeakRetained != 0;
}

- (id)tabCollectionViewForItem:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *tabOverview;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
LABEL_10:
    v7 = WeakRetained;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      tabOverview = self->_tabOverview;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = 0;
        goto LABEL_11;
      }
      tabOverview = self->_fluidTabOverviewViewController;
    }
    WeakRetained = tabOverview;
    goto LABEL_10;
  }
  v6 = objc_loadWeakRetained((id *)&self->_tabBarManager);
  objc_msgSend(v6, "effectiveTabBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v7;
}

- (BOOL)tabViewDefersActivation
{
  return -[TabOverview defersActivation](self->_tabOverview, "defersActivation");
}

- (void)setTabViewDefersActivation:(BOOL)a3
{
  -[TabOverview setDefersActivation:](self->_tabOverview, "setDefersActivation:", a3);
}

- (BOOL)isShowingTabView
{
  void *v2;
  BOOL v3;

  -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presentationState") == 1 || objc_msgSend(v2, "presentationState") == 2;

  return v3;
}

void __50__TabCollectionViewManager_updateTabOverviewItems__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 25);
    objc_msgSend(v2, "authenticateToUnlockPrivateBrowsing");

    WeakRetained = v3;
  }

}

uint64_t __50__TabCollectionViewManager_updateTabOverviewItems__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned") ^ 1;
}

uint64_t __50__TabCollectionViewManager_updateTabOverviewItems__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned") ^ 1;
}

- (void)_updateTabBarAnimated:(BOOL)a3 keepingTabVisibleForItem:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[TabCollectionViewManager _canUpdateUnifiedBar](self, "_canUpdateUnifiedBar"))
    {
      -[TabCollectionViewManager _updateUnifiedTabBarAnimated:keepingTabVisibleForItem:](self, "_updateUnifiedTabBarAnimated:keepingTabVisibleForItem:", v4, v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && -[TabCollectionViewManager _canUpdateClassicBar](self, "_canUpdateClassicBar"))
      {
        -[TabCollectionViewManager _updateClassicTabBarAnimated:keepingTabVisibleForItem:](self, "_updateClassicTabBarAnimated:keepingTabVisibleForItem:", v4, v6);
      }
    }
  }
  else
  {
    -[TabCollectionViewManager updateTabBarAnimated:keepingTabVisible:](self, "updateTabBarAnimated:keepingTabVisible:", v4, 0);
  }

}

- (void)tabCollectionView:(id)a3 didSelectItem:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarManager);
  v8 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v8, "activeNonLibraryTab");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "inlineTabBar");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v21)
  {
    objc_msgSend(v9, "unifiedTabBarItem");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v6)
    {
      v13 = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(v13, "unifiedTabBarActiveTabWasTapped");
      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tabWithUUID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (self->_privateBrowsingEnabled)
    {
      objc_msgSend(v8, "hiddenTabForExplanationView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v14)
      {
        objc_msgSend(v8, "clearHiddenTabForExplanationView");
        -[TabCollectionViewManager updateTabOverviewItems](self, "updateTabOverviewItems");
      }
    }
    objc_msgSend(v8, "setActiveTab:", v13);
    v15 = objc_loadWeakRetained((id *)&self->_tabBar);
    if (v15 == v21
      || (objc_msgSend(WeakRetained, "effectiveTabBar"),
          v16 = (id)objc_claimAutoreleasedReturnValue(),
          v16,
          v16 == v21))
    {
      +[Application postTestNotificationName:object:](Application, "postTestNotificationName:object:", CFSTR("TabBarDidSwitchTabNotification"), self);
    }
    else
    {
      objc_msgSend(v9, "tabBarItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scrollToItem:animated:", v17, 0);

      objc_msgSend(v9, "unifiedTabBarItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(WeakRetained, "displayMode") == 2)
      {
        objc_msgSend(v18, "secondaryItem");
        v19 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v19;
      }
      objc_msgSend(WeakRetained, "effectiveTabBar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scrollToItem:animated:", v18, 0);

    }
  }
LABEL_15:

}

- (void)tabCollectionView:(id)a3 closeItem:(id)a4
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;

  p_dataSource = &self->_dataSource;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "tabWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(WeakRetained, "closeTab:animated:", v8, 1);
  }
  else
  {
    -[TabCollectionViewManager updateTabOverviewItems](self, "updateTabOverviewItems");
    -[TabCollectionViewManager updateTabBarAnimated:keepingTabVisible:](self, "updateTabBarAnimated:keepingTabVisible:", 1, 0);
  }

}

- (void)tabCollectionView:(id)a3 item:(id)a4 didProduceNavigationIntent:(id)a5
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;

  v11 = a5;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v7, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "insertTabWithUUIDForNavigation:", v9);
  if (v11)
  {
    v10 = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(v10, "dispatchNavigationIntent:", v11);

  }
}

- (void)tabCollectionViewWillPresent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v4 = a3;
  -[TabCollectionViewManager updateExplanationViewVisibilityAnimated:](self, "updateExplanationViewVisibilityAnimated:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabCollectionViewWillPresent:", v4);

  -[TabCollectionViewManager updateSnapshotCacheAndSnapshotActiveTab](self, "updateSnapshotCacheAndSnapshotActiveTab");
  objc_msgSend(WeakRetained, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearStatus");

}

- (void)tabCollectionViewWillDismiss:(id)a3
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v5;
  void *v6;
  _BOOL4 privateBrowsingEnabled;
  id v8;
  id WeakRetained;

  p_dataSource = &self->_dataSource;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "hiddenTabForExplanationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    privateBrowsingEnabled = self->_privateBrowsingEnabled;

    if (privateBrowsingEnabled)
    {
      objc_msgSend(WeakRetained, "clearHiddenTabForExplanationView");
      -[TabCollectionViewManager updateTabOverviewItems](self, "updateTabOverviewItems");
    }
  }
  v8 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v8, "tabCollectionViewWillDismiss:", v5);

}

- (void)tabCollectionViewDidDismiss:(id)a3
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v5;
  void *v6;
  id v7;
  id WeakRetained;

  p_dataSource = &self->_dataSource;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "clearTabsClosedWhileTabViewPresentedCount");
  objc_msgSend(v5, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSearchTerm:", &stru_1E9CFDBB0);

  -[TabCollectionViewManager setShouldDeferSnapshotRequest:](self, "setShouldDeferSnapshotRequest:", 0);
  -[TabCollectionViewManager updateSnapshotCacheState](self, "updateSnapshotCacheState");
  v7 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v7, "tabCollectionViewDidDismiss:", v5);

}

- (void)tabCollectionViewBeginIgnoringUserInteraction:(id)a3 reason:(id)a4
{
  BrowserController **p_browserController;
  id v5;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "beginIgnoringUserInteraction:", v5);

}

- (void)tabCollectionViewEndIgnoringUserInteraction:(id)a3 reason:(id)a4
{
  BrowserController **p_browserController;
  id v5;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "endIgnoringUserInteraction:", v5);

}

- (void)tabCollectionViewDidCancelDismissal:(id)a3
{
  id WeakRetained;

  -[TabCollectionViewManager setShouldDeferSnapshotRequest:](self, "setShouldDeferSnapshotRequest:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "didCancelDismissingTabOverview");

  -[TabCollectionViewManager updateExplanationViewVisibilityAnimated:](self, "updateExplanationViewVisibilityAnimated:", 1);
}

- (BOOL)tabCollectionViewCanDismiss:(id)a3
{
  _BOOL4 v4;
  id WeakRetained;

  v4 = -[TabCollectionViewManager _isPrivateBrowsingAndLocked](self, "_isPrivateBrowsingAndLocked", a3);
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    if (objc_msgSend(WeakRetained, "activeWindowIsForeground") && !SBSGetScreenLockStatus())
      objc_msgSend(WeakRetained, "authenticateToUnlockPrivateBrowsing");

  }
  return !v4;
}

- (id)tabCollectionView:(id)a3 borrowContentViewForItem:(id)a4 withTopBackdropView:(id *)a5 ofHeight:(double)a6
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  p_dataSource = &self->_dataSource;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v10, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "tabDocumentWithUUID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v14, "borrowContentViewForTab:withTopBackdropView:ofHeight:", v13, a5, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)tabCollectionView:(id)a3 relinquishBorrowedContentView:(id)a4 forItem:(id)a5
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;

  p_dataSource = &self->_dataSource;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v7, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "tabDocumentWithUUID:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v10, "reinsertBorrowedContentViewForTab:", v11);

}

- (id)tabCollectionView:(id)a3 borrowContentViewControllerForItem:(id)a4
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;

  p_dataSource = &self->_dataSource;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "activeTabDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    v12 = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(v12, "borrowContentViewControllerForTab:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)tabCollectionView:(id)a3 relinquishBorrowedContentViewController:(id)a4 forItem:(id)a5
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;

  p_dataSource = &self->_dataSource;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v7, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "tabDocumentWithUUID:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v10, "reinsertBorrowedContentViewForTab:", v11);

}

- (void)tabCollectionView:(id)a3 closeCloudTab:(id)a4 onDevice:(id)a5
{
  BrowserController **p_browserController;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v7 = a5;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "browserWindowController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudTabStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "closeTab:onDevice:", v8, v7);

}

- (BOOL)tabCollectionView:(id)a3 item:(id)a4 matchesSearchText:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  BOOL v12;

  v7 = a5;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v8, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "tabWithUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = -[TabCollectionViewManager tabItem:matchesSearchText:](self, "tabItem:matchesSearchText:", v11, v7);
  else
    v12 = 0;

  return v12;
}

- (id)undoManagerForTabCollectionView:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)tabOverviewDidChangeAllowsInteractivePresentation:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "updateTabViewPinchRecognizer");

}

- (void)tabOverviewWillUpdateInteractivePresentation:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "dismissPageFormatMenu");

}

- (void)tabOverview:(id)a3 willInteractivelyCloseItem:(id)a4
{
  NSMutableSet *hiddenTabUUIDs;
  void *v6;

  hiddenTabUUIDs = self->_hiddenTabUUIDs;
  objc_msgSend(a4, "UUID", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](hiddenTabUUIDs, "addObject:", v6);

  -[TabCollectionViewManager updateTabOverviewItems](self, "updateTabOverviewItems");
}

- (void)tabOverview:(id)a3 closeItems:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableSet *hiddenTabUUIDs;
  void *v11;
  id WeakRetained;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        hiddenTabUUIDs = self->_hiddenTabUUIDs;
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](hiddenTabUUIDs, "removeObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__TabCollectionViewManager_tabOverview_closeItems___block_invoke;
  v20[3] = &unk_1E9CF6920;
  v14 = WeakRetained;
  v21 = v14;
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v20);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __51__TabCollectionViewManager_tabOverview_closeItems___block_invoke_2;
  v17[3] = &unk_1E9CF1830;
  v18 = v14;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  v16 = v14;
  objc_msgSend(v16, "registerUndoWithType:actions:", 1, v17);

}

id __51__TabCollectionViewManager_tabOverview_closeItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __51__TabCollectionViewManager_tabOverview_closeItems___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeTabs:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (BOOL)tabBar:(id)a3 canMoveItem:(id)a4
{
  return 1;
}

- (void)tabBar:(id)a3 toggleMediaStateMutedForItem:(id)a4
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  p_dataSource = &self->_dataSource;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v5, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "tabDocumentWithUUID:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "toggleMediaStateMuted");
}

- (void)tabBarManager:(id)a3 didCreateTabBar:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "tabHoverPreviewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDelegate:", self);
}

- (void)openNewTabForTabGroupSwitcher:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "openNewTabWithCompletionHandler:", 0);

}

- (void)presentTabGroupSheetForTabGroupSwitcher:(id)a3
{
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v3 = (id)objc_msgSend(WeakRetained, "showTabGroupPicker:", 0);

}

- (void)dismissTabGroupSwitcher:(id)a3
{
  id v3;

  -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAnimated:", 1);

}

- (void)closeAllTabsForTabGroupSwitcher:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "closeAllTabs:", 0);

}

- (id)_iconForTabWithUUID:(id)a3
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;

  p_dataSource = &self->_dataSource;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconForTabUUID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_extensionIconForTabWithURL:(id)a3 UUID:(id)a4
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  p_dataSource = &self->_dataSource;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v7, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "tabGroupRelatedToTabWithUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v12, "tabGroupManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profileIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "profileWithIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[Application sharedApplication](Application, "sharedApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifierForExtensions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "webExtensionsControllerForProfileServerID:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "host");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "webExtensionForBaseURIHost:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "icon");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_urlForTabWithUUID:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "wbTabWithUUID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)setShouldDeferSnapshotRequest:(BOOL)a3
{
  id v3;

  if (self->_shouldDeferSnapshotRequest != a3)
  {
    self->_shouldDeferSnapshotRequest = a3;
    if (!a3)
    {
      +[TabSnapshotCache defaultSnapshotCache](TabSnapshotCache, "defaultSnapshotCache");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "requestNextSnapshotIfNecessary");

    }
  }
}

- (void)addSnapshotCacheObserver:(id)a3
{
  -[TabSnapshotCache addSnapshotCacheObserver:](self->_snapshotCache, "addSnapshotCacheObserver:", a3);
}

- (void)removeSnapshotCacheObserver:(id)a3
{
  -[TabSnapshotCache removeSnapshotCacheObserver:](self->_snapshotCache, "removeSnapshotCacheObserver:", a3);
}

- (void)requestSnapshotForTabDocument:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  id v30;

  v30 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = snapshotSizeForSuggestedSize(v15, v12, v14);
    v18 = v16;
    if (v17 == 1.79769313e308 && v16 == 1.79769313e308)
    {
      v6[2](v6, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scale");
      v22 = 200.0 / v21;

      v23 = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(v23, "activeNonLibraryTab");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      +[TabSnapshotCache defaultSnapshotCache](TabSnapshotCache, "defaultSnapshotCache");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v25, "isIdentifier:memberOfSameGroupAsIdentifier:", v26, v27);

      if (v28)
      {
        v29 = v24;

        v30 = v29;
      }
      objc_msgSend(v8, "snapshotTabDocument:size:topBackdropHeight:options:completion:", v30, 2 * (objc_msgSend(v15, "snapshotBorderOptions") & 0xF), v6, v17, v18, v22);

    }
  }
  else
  {
    v6[2](v6, 0);
  }

}

void __62__TabCollectionViewManager__enumerateTabsOrderedByVisibility___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "tabWithUUID:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)updateSnapshotCacheAndSnapshotActiveTab
{
  TabSnapshotCache *snapshotCache;
  _QWORD v3[5];

  snapshotCache = self->_snapshotCache;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__TabCollectionViewManager_updateSnapshotCacheAndSnapshotActiveTab__block_invoke;
  v3[3] = &unk_1E9CF1900;
  v3[4] = self;
  -[TabSnapshotCache performBatchUpdatesWithBlock:](snapshotCache, "performBatchUpdatesWithBlock:", v3);
}

void __67__TabCollectionViewManager_updateSnapshotCacheAndSnapshotActiveTab__block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "updateSnapshotCacheState");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 200));
  if (!objc_msgSend(WeakRetained, "avoidSnapshotOfActiveTabIfPossible")
    || objc_msgSend(WeakRetained, "shouldSnapshotActiveTab"))
  {
    objc_msgSend(WeakRetained, "setNeedsSnapshotUpdateForActiveTab");
  }

}

- (void)updateStartPageSnapshotIfNeededForTabDocument:(id)a3 currentSnapshotSize:(CGSize)a4
{
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v5 = a3;
  if (objc_msgSend(v5, "isShowingSystemStartPage"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "windowSize");
    v8 = v7;
    v10 = v9;

    -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    snapshotSizeForSuggestedSize(v11, v8, v10);
    _SFScreenScale();
    if ((_SFEqualWithEpsilon() & 1) == 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __94__TabCollectionViewManager_updateStartPageSnapshotIfNeededForTabDocument_currentSnapshotSize___block_invoke;
      v12[3] = &unk_1E9CF1830;
      v12[4] = self;
      v13 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v12);

    }
  }

}

void __94__TabCollectionViewManager_updateStartPageSnapshotIfNeededForTabDocument_currentSnapshotSize___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 96);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __94__TabCollectionViewManager_updateStartPageSnapshotIfNeededForTabDocument_currentSnapshotSize___block_invoke_2;
  v4[3] = &unk_1E9CF1830;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "performBatchUpdatesWithBlock:", v4);

}

uint64_t __94__TabCollectionViewManager_updateStartPageSnapshotIfNeededForTabDocument_currentSnapshotSize___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateSnapshotForTab:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "flushPendingSnapshotsWithCompletion:", 0);
}

- (void)_temporarilyUpdateSnapshotsForTabDocument:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  TabSnapshotCache *snapshotCache;
  id v8;
  _QWORD v9[5];
  id v10;

  v8 = a3;
  -[TabCollectionViewManager tabThumbnailCollectionView](self, "tabThumbnailCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "presentationState"))
  {

LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  v5 = objc_msgSend(v8, "contentIsReadyForSnapshot");

  v6 = v8;
  if ((v5 & 1) != 0)
  {
    self->_shouldUpdateSnapshotsTemporarily = 1;
    snapshotCache = self->_snapshotCache;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__TabCollectionViewManager__temporarilyUpdateSnapshotsForTabDocument___block_invoke;
    v9[3] = &unk_1E9CF1830;
    v9[4] = self;
    v10 = v8;
    -[TabSnapshotCache performBatchUpdatesWithBlock:](snapshotCache, "performBatchUpdatesWithBlock:", v9);

    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __70__TabCollectionViewManager__temporarilyUpdateSnapshotsForTabDocument___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateSnapshotCacheState");
  return objc_msgSend(*(id *)(a1 + 40), "setNeedsNewTabSnapshot");
}

- (id)_contentForSnapshotWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  void *v12;

  v4 = a3;
  -[TabSnapshotCache snapshotWithIdentifier:](self->_snapshotCache, "snapshotWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "activeTabDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqual:", v8);

    v10 = 0.0;
    if (v9)
    {
      -[TabCollectionViewManager tabCollectionViewItemHeaderHeightIncludedInSnapshot:](self, "tabCollectionViewItemHeaderHeightIncludedInSnapshot:", self->_tabSwitcherViewController);
      v10 = v11;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EDB8]), "initWithImage:bannerHeight:topBackdropHeight:isValid:", v5, -[TabSnapshotCache hasValidSnapshotWithIdentifier:](self->_snapshotCache, "hasValidSnapshotWithIdentifier:", v4), v10, 200.0);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)clearSnapshotCache
{
  TabSnapshotCache *snapshotCache;
  void *v4;
  TabSnapshotCache *v5;

  snapshotCache = self->_snapshotCache;
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabSnapshotCache setIdentifiersToCache:forDelegate:](snapshotCache, "setIdentifiersToCache:forDelegate:", v4, self);

  v5 = self->_snapshotCache;
  self->_snapshotCache = 0;

}

- (void)invalidateSnapshotForTab:(id)a3
{
  id v4;
  void *v5;
  TabSnapshotCache *snapshotCache;
  id v7;
  SFTabSnapshotPool *snapshotPool;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id postponedSnapshotInvalidationBlock;
  _QWORD v16[4];
  id v17;
  TabCollectionViewManager *v18;
  _QWORD aBlock[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id location;

  v4 = a3;
  v5 = v4;
  if (!self->_snapshotsEnabled
    && self->_postponedSnapshotInvalidationCondition
    && self->_snapshotInvalidationIsPostponed)
  {
    v10 = _Block_copy(self->_postponedSnapshotInvalidationBlock);
    v11 = _Block_copy(self->_postponedSnapshotInvalidationCondition);
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__TabCollectionViewManager_invalidateSnapshotForTab___block_invoke;
    aBlock[3] = &unk_1E9CF69E8;
    v21 = v10;
    v12 = v10;
    objc_copyWeak(&v23, &location);
    v22 = v11;
    v20 = v5;
    v13 = v11;
    v14 = _Block_copy(aBlock);
    postponedSnapshotInvalidationBlock = self->_postponedSnapshotInvalidationBlock;
    self->_postponedSnapshotInvalidationBlock = v14;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    snapshotCache = self->_snapshotCache;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53__TabCollectionViewManager_invalidateSnapshotForTab___block_invoke_2;
    v16[3] = &unk_1E9CF1830;
    v7 = v4;
    v17 = v7;
    v18 = self;
    -[TabSnapshotCache performBatchUpdatesWithBlock:](snapshotCache, "performBatchUpdatesWithBlock:", v16);
    snapshotPool = self->_snapshotPool;
    objc_msgSend(v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabSnapshotPool contentDidChangeForSnapshotsWithIdentifier:](snapshotPool, "contentDidChangeForSnapshotsWithIdentifier:", v9);

  }
}

void __53__TabCollectionViewManager_invalidateSnapshotForTab___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    WeakRetained = v5;
    if (v4)
    {
      objc_msgSend(v5, "invalidateSnapshotForTab:", *(_QWORD *)(a1 + 32));
      WeakRetained = v5;
    }
  }

}

void __53__TabCollectionViewManager_invalidateSnapshotForTab___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if ((objc_msgSend(*(id *)(a1 + 32), "isBlank") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 200));
    objc_msgSend(WeakRetained, "tabGroupManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "wbTab");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabGroupUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tabGroupWithUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_blankSnapshotGroupIdentifierForTabGroup:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeIdentifier:fromGroupWithIdentifier:", v8, v9);

  }
  v10 = *(void **)(a1 + 32);
  v11 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
  objc_msgSend(v10, "uuid");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidateSnapshotWithIdentifier:", v12);

}

- (void)removeSnapshotForTabWithUUID:(id)a3
{
  -[TabSnapshotCache removeSnapshotWithIdentifier:](self->_snapshotCache, "removeSnapshotWithIdentifier:", a3);
  -[TabCollectionViewManager _updateTabSnapshotsAnimated:](self, "_updateTabSnapshotsAnimated:", 1);
}

- (void)_updateTabSnapshotsAnimated:(BOOL)a3
{
  -[TabCollectionViewManager _updateTabSnapshotsWithIdentifier:animated:](self, "_updateTabSnapshotsWithIdentifier:animated:", 0, a3);
}

- (void)flushPendingSnapshotsWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  TabSnapshotCache *snapshotCache;
  void *v7;
  void *v8;
  void *v9;
  id flushPendingSnapshotsCompletion;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(_QWORD, _QWORD);

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_flushPendingSnapshots)
  {
    if (!v4)
      goto LABEL_12;
  }
  else
  {
    self->_flushPendingSnapshots = 1;
    -[TabCollectionViewManager updateSnapshotCacheState](self, "updateSnapshotCacheState");
    if (!v5)
      goto LABEL_12;
  }
  snapshotCache = self->_snapshotCache;
  if (snapshotCache && !-[TabSnapshotCache isFinishedUpdating](snapshotCache, "isFinishedUpdating"))
  {
    v7 = _Block_copy(self->_flushPendingSnapshotsCompletion);
    v8 = v7;
    if (v7)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__TabCollectionViewManager_flushPendingSnapshotsWithCompletion___block_invoke;
      v13[3] = &unk_1E9CF6A10;
      v14 = v7;
      v15 = v5;
      v9 = (void *)objc_msgSend(v13, "copy");
      flushPendingSnapshotsCompletion = self->_flushPendingSnapshotsCompletion;
      self->_flushPendingSnapshotsCompletion = v9;

      v11 = v14;
    }
    else
    {
      v12 = (void *)objc_msgSend(v5, "copy");
      v11 = self->_flushPendingSnapshotsCompletion;
      self->_flushPendingSnapshotsCompletion = v12;
    }

  }
  else
  {
    v5[2](v5, 1);
  }
LABEL_12:

}

uint64_t __64__TabCollectionViewManager_flushPendingSnapshotsWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)tabSnapshotCache:(id)a3 requestSnapshotWithIdentifier:(id)a4 completion:(id)a5
{
  void (**v7)(id, _QWORD);
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  v7 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabDocumentWithUUID:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "inElementFullscreen"))
  {
    if (v9)
    {
      objc_msgSend(WeakRetained, "currentTabs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "containsObject:", v9) & 1) != 0)
      {
        v12 = objc_msgSend(v9, "isClosed");

        if ((v12 & 1) == 0)
        {
          -[TabCollectionViewManager requestSnapshotForTabDocument:completion:](self, "requestSnapshotForTabDocument:completion:", v9, v7);
          goto LABEL_3;
        }
      }
      else
      {

      }
    }
    +[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reusableTabDocumentWithUUID:", v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v14 = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(v14, "tabGroupManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tabGroupTab");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tabGroupUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tabGroupWithUUID:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "tabWithUUID:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[TabCollectionViewManager requestSnapshotForTabDocument:completion:](self, "requestSnapshotForTabDocument:completion:", v10, v7);

        goto LABEL_14;
      }

    }
    v7[2](v7, 0);
    goto LABEL_14;
  }
  v7[2](v7, 0);
LABEL_3:
  v10 = v9;
LABEL_14:

}

- (void)tabSnapshotCache:(id)a3 didEvictSnapshotWithIdentifier:(id)a4
{
  -[TabCollectionViewManager _updateTabSnapshotsWithIdentifier:animated:](self, "_updateTabSnapshotsWithIdentifier:animated:", a4, 0);
}

- (void)dismissTabHoverPreview
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  objc_msgSend(WeakRetained, "tabHoverPreviewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismiss");

  v7 = objc_loadWeakRetained((id *)&self->_tabBarManager);
  objc_msgSend(v7, "effectiveTabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabHoverPreviewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismiss");

}

- (void)tabHoverPreviewController:(id)a3 showPreviewForItem:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  const __CFString *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  objc_msgSend(WeakRetained, "tabHoverPreviewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v26)
  {

    goto LABEL_6;
  }
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0)
  {
LABEL_6:
    v11 = objc_loadWeakRetained((id *)&self->_tabBarManager);
    objc_msgSend(v11, "effectiveTabBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "tabHoverPreviewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v26)
    {
      objc_msgSend(v12, "viewForBarItem:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

    if (!v10)
      goto LABEL_21;
    goto LABEL_10;
  }
  objc_msgSend(WeakRetained, "viewForItem:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_21;
LABEL_10:
  v14 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v14, "tabHoverPreview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v6, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tabWithUUID:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_tabShowingPreview, v18);
    if ((objc_msgSend(v18, "isActive") & 1) != 0)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v6, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabCollectionViewManager cachedContentImageForTabWithUUID:allowScaledImage:](self, "cachedContentImageForTabWithUUID:allowScaledImage:", v20, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v15, "setSnapshotImage:", v19);
    objc_msgSend(v6, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitleText:", v21);

    objc_msgSend(v18, "url");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "safari_isSafariWebExtensionURL"))
    {
      objc_msgSend(v22, "safari_userVisibleHostOrExtensionDisplayName");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "titleText");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isEqualToString:", v23))
        v25 = &stru_1E9CFDBB0;
      else
        v25 = v23;
    }
    else
    {
      objc_msgSend(v22, "host");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString safari_stringByRemovingWwwDotPrefix](v23, "safari_stringByRemovingWwwDotPrefix");
      v25 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)v25;
    }
    objc_msgSend(v15, "setSecondaryTitleText:", v25);

    objc_msgSend(v15, "showPreviewForItemView:", v10);
  }

LABEL_21:
}

- (void)tabHoverPreviewControllerDismissPreview:(id)a3
{
  id WeakRetained;
  CollectionViewTab *tabShowingPreview;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabHoverPreview");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dismissPreview");
  tabShowingPreview = self->_tabShowingPreview;
  self->_tabShowingPreview = 0;

}

- (id)tabWithUUID:(id)a3
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v4;
  id WeakRetained;
  void *v6;

  p_dataSource = &self->_dataSource;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "tabWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)_indexToInsertPlaceholderAtTabItem:(id)a3
{
  id v4;
  unint64_t v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "currentTabs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__TabCollectionViewManager__indexToInsertPlaceholderAtTabItem___block_invoke;
    v14[3] = &unk_1E9CF6A78;
    v15 = v4;
    v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v14);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "hiddenTabForExplanationView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v10 == v11;

        if (v12)
          v5 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v5 = v9;
      }
      else
      {
        v5 = v9;
      }
    }

  }
  return v5;
}

uint64_t __63__TabCollectionViewManager__indexToInsertPlaceholderAtTabItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (id)insertPlaceholderAfterTabItem:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  TabCollectionItem *v7;
  TabCollectionItem *placeholderItem;
  uint64_t v9;

  self->_placeholderItemIsPrivate = self->_privateBrowsingEnabled;
  v4 = a3;
  v5 = -[TabCollectionViewManager _indexToInsertPlaceholderAtTabItem:](self, "_indexToInsertPlaceholderAtTabItem:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0;
  else
    v6 = v5;
  self->_placeholderItemIndex = v6;
  objc_msgSend((id)objc_opt_class(), "placeholderItem");
  v7 = (TabCollectionItem *)objc_claimAutoreleasedReturnValue();
  placeholderItem = self->_placeholderItem;
  self->_placeholderItem = v7;

  v9 = objc_msgSend(v4, "isPinned");
  -[TabCollectionItem setPinned:](self->_placeholderItem, "setPinned:", v9);
  -[TabCollectionViewManager updateTabOverviewItems](self, "updateTabOverviewItems");
  -[TabCollectionViewManager updateTabBarAnimated:keepingTabVisible:](self, "updateTabBarAnimated:keepingTabVisible:", 1, 0);
  return self->_placeholderItem;
}

- (BOOL)isPlaceholderItemValid:(id)a3
{
  return self->_placeholderItem == a3 && self->_privateBrowsingEnabled == self->_placeholderItemIsPrivate;
}

- (void)movePlaceholderToEndOfPinnedTabs:(id)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "currentTabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", &__block_literal_global_70_0);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = objc_msgSend(v5, "count");
  -[TabCollectionViewManager _movePlaceholder:toIndex:](self, "_movePlaceholder:toIndex:", v7, v6);

}

uint64_t __61__TabCollectionViewManager_movePlaceholderToEndOfPinnedTabs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned") ^ 1;
}

- (void)movePlaceholder:(id)a3 overTabItem:(id)a4
{
  id v6;
  unint64_t v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isPlaceholder") & 1) == 0)
  {
    v7 = -[TabCollectionViewManager _indexToInsertPlaceholderAtTabItem:](self, "_indexToInsertPlaceholderAtTabItem:", v6);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(WeakRetained, "currentTabs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    else if (v7 < self->_placeholderItemIndex)
    {
      v10 = v7;
    }
    else
    {
      v10 = v7 + 1;
    }
    -[TabCollectionViewManager _movePlaceholder:toIndex:](self, "_movePlaceholder:toIndex:", v11, v10);
  }

}

- (void)_movePlaceholder:(id)a3 toIndex:(unint64_t)a4
{
  id v6;

  v6 = a3;
  if (-[TabCollectionViewManager isPlaceholderItemValid:](self, "isPlaceholderItemValid:"))
  {
    self->_placeholderItemIndex = a4;
    -[TabCollectionViewManager updateTabOverviewItems](self, "updateTabOverviewItems");
    -[TabCollectionViewManager _updateTabBarAnimated:keepingTabVisibleForItem:](self, "_updateTabBarAnimated:keepingTabVisibleForItem:", 1, v6);
  }

}

- (void)removePlaceholderItem:(id)a3
{
  _BOOL4 v4;
  TabCollectionItem *v5;

  v5 = (TabCollectionItem *)a3;
  v4 = -[TabCollectionViewManager isPlaceholderItemValid:](self, "isPlaceholderItemValid:", v5);
  if (self->_placeholderItem == v5)
  {
    self->_placeholderItem = 0;

    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    -[TabCollectionViewManager updateTabOverviewItems](self, "updateTabOverviewItems");
    -[TabCollectionViewManager _updateTabBarAnimated:keepingTabVisibleForItem:](self, "_updateTabBarAnimated:keepingTabVisibleForItem:", 1, 0);
  }
LABEL_4:

}

- (id)replacePlaceholderItem:(id)a3 withTabsForDropSession:(id)a4 dragItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  unint64_t v13;
  unint64_t placeholderItemIndex;
  NSObject *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "currentTabs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (-[TabCollectionViewManager isPlaceholderItemValid:](self, "isPlaceholderItemValid:", v8)
    && (placeholderItemIndex = self->_placeholderItemIndex, placeholderItemIndex <= v13))
  {
    objc_msgSend(WeakRetained, "dropTabsAtIndex:pinned:dropSession:dragItems:", placeholderItemIndex, -[TabCollectionItem isPinned](self->_placeholderItem, "isPinned"), v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabCollectionViewManager removePlaceholderItem:](self, "removePlaceholderItem:", v8);
  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[TabCollectionViewManager replacePlaceholderItem:withTabsForDropSession:dragItems:].cold.1((uint64_t)self, v13, v15);
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (id)dragItemForTab:(id)a3 tabItem:(id)a4
{
  void *v5;
  BrowserController **p_browserController;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;

  v5 = (void *)MEMORY[0x1E0DC3758];
  p_browserController = &self->_browserController;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(v5, "safari_itemWithTab:tabItem:browserController:", v8, v7, WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)hideTabsForDragItems:(id)a3
{
  -[TabCollectionViewManager _setTabsForDragItems:hidden:](self, "_setTabsForDragItems:hidden:", a3, 1);
}

- (void)unhideTabsForDragItems:(id)a3
{
  -[TabCollectionViewManager _setTabsForDragItems:hidden:](self, "_setTabsForDragItems:hidden:", a3, 0);
}

- (void)_setTabsForDragItems:(id)a3 hidden:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v12, "safari_localBrowserController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v16;

        objc_msgSend(v12, "safari_localWBTab");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v12, "safari_localWBTab");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setByAddingObject:", v19);
          v20 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v20;
        }
        objc_msgSend(v6, "setObject:forKey:", v17, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v9);
  }
  v32 = v7;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v6, "keyEnumerator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v6, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_74);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "tabController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabController tabCollectionViewManager]((uint64_t)v29);
        v30 = (_QWORD *)objc_claimAutoreleasedReturnValue();

        v31 = (void *)v30[10];
        if (v4)
          objc_msgSend(v31, "unionSet:", v28);
        else
          objc_msgSend(v31, "minusSet:", v28);
        objc_msgSend(v30, "updateTabOverviewItems");
        objc_msgSend(v30, "updateTabBarAnimated:keepingTabVisible:", 1, 0);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v23);
  }

}

id __56__TabCollectionViewManager__setTabsForDragItems_hidden___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);
  return v6;
}

- (void)willBeginDragSession:(id)a3
{
  BrowserController **p_browserController;
  id v4;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "tabDocumentWillBeginDragSession:", v4);

}

- (void)willEndDragSession:(id)a3
{
  BrowserController **p_browserController;
  id v4;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "tabDocumentWillEndDragSession:", v4);

}

- (void)didBeginTrackingSession:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  -[TabCollectionViewManager dismissTabHoverPreview](self, "dismissTabHoverPreview");
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "beginTrackingDropSessionForTabBarVisibility:", v4);

}

- (void)didEndTrackingSession:(id)a3
{
  BrowserController **p_browserController;
  id v4;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "endTrackingDropSessionForTabBarVisibility:", v4);

}

- (TabMenuProviderDataSource)tabMenuProviderDataSource
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabMenuProviderDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TabMenuProviderDataSource *)v3;
}

- (void)performBatchUpdatesWithBlock:(id)a3
{
  TabCollectionViewManagerDataSource **p_dataSource;
  id v4;
  id WeakRetained;

  p_dataSource = &self->_dataSource;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "performBatchUpdatesWithBlock:", v4);

}

- (TabBar)tabBar
{
  return (TabBar *)objc_loadWeakRetained((id *)&self->_tabBar);
}

- (TabBarManager)tabBarManager
{
  return (TabBarManager *)objc_loadWeakRetained((id *)&self->_tabBarManager);
}

- (int64_t)tabThumbnailCollectionViewStyle
{
  return self->_tabThumbnailCollectionViewStyle;
}

- (BOOL)snapshotInvalidationIsPostponed
{
  return self->_snapshotInvalidationIsPostponed;
}

- (void)setSnapshotInvalidationIsPostponed:(BOOL)a3
{
  self->_snapshotInvalidationIsPostponed = a3;
}

- (BOOL)areSnapshotsEnabled
{
  return self->_snapshotsEnabled;
}

- (id)postponedSnapshotInvalidationCondition
{
  return self->_postponedSnapshotInvalidationCondition;
}

- (TabCollectionViewManagerDataSource)dataSource
{
  return (TabCollectionViewManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BrowserController)browserController
{
  return (BrowserController *)objc_loadWeakRetained((id *)&self->_browserController);
}

- (BOOL)privateBrowsingEnabled
{
  return self->_privateBrowsingEnabled;
}

- (BOOL)suppressTabBarAnimation
{
  return self->_suppressTabBarAnimation;
}

- (void)setSuppressTabBarAnimation:(BOOL)a3
{
  self->_suppressTabBarAnimation = a3;
}

- (BOOL)isTabOverviewVisible
{
  return self->_tabOverviewVisible;
}

- (void)setTabOverviewVisible:(BOOL)a3
{
  self->_tabOverviewVisible = a3;
}

- (BOOL)isTabThumbnailViewVisible
{
  return self->_tabThumbnailViewVisible;
}

- (void)setTabThumbnailViewVisible:(BOOL)a3
{
  self->_tabThumbnailViewVisible = a3;
}

- (TabSwitcherViewController)tabSwitcherViewController
{
  return self->_tabSwitcherViewController;
}

- (SFTabIconPool)iconPool
{
  return self->_iconPool;
}

- (TabSnapshotCache)snapshotCache
{
  return self->_snapshotCache;
}

- (BOOL)shouldDeferSnapshotRequest
{
  return self->_shouldDeferSnapshotRequest;
}

- (SFTabSnapshotPool)snapshotPool
{
  return self->_snapshotPool;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotPool, 0);
  objc_storeStrong((id *)&self->_iconPool, 0);
  objc_storeStrong((id *)&self->_tabSwitcherViewController, 0);
  objc_destroyWeak((id *)&self->_browserController);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong(&self->_postponedSnapshotInvalidationCondition, 0);
  objc_storeStrong((id *)&self->_tabOverview, 0);
  objc_destroyWeak((id *)&self->_tabBarManager);
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_tabShowingPreview, 0);
  objc_storeStrong(&self->_postponedSnapshotInvalidationBlock, 0);
  objc_storeStrong(&self->_flushPendingSnapshotsCompletion, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_tabDragDropController, 0);
  objc_storeStrong((id *)&self->_hiddenTabUUIDs, 0);
  objc_storeStrong((id *)&self->_placeholderItem, 0);
  objc_storeStrong((id *)&self->_fluidTabOverviewViewController, 0);
  objc_storeStrong((id *)&self->_tabGroupSwitcherViewController, 0);
  objc_storeStrong((id *)&self->_searchTermWords, 0);
  objc_storeStrong((id *)&self->_lastSearchTerm, 0);
}

- (void)webViewDidFirstMeaningfulPaintForTabDocument:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isActive") & 1) == 0)
    -[TabCollectionViewManager _temporarilyUpdateSnapshotsForTabDocument:](self, "_temporarilyUpdateSnapshotsForTabDocument:", v4);

}

- (void)replacePlaceholderItem:(uint64_t)a1 withTabsForDropSession:(uint64_t)a2 dragItems:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 64);
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_fault_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_FAULT, "Failed to drop at index %lu of %lu tabs", (uint8_t *)&v4, 0x16u);
}

@end
