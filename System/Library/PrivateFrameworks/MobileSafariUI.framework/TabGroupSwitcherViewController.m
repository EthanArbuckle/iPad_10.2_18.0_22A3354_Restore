@implementation TabGroupSwitcherViewController

- (TabContainerView)view
{
  TabGroupSwitcherView *view;
  TabGroupSwitcherView *v4;
  TabGroupSwitcherView *v5;

  view = self->_view;
  if (!view)
  {
    v4 = (TabGroupSwitcherView *)-[TabGroupSwitcherView initWithTabGroupSwitcher:]((id *)[TabGroupSwitcherView alloc], self);
    v5 = self->_view;
    self->_view = v4;

    view = self->_view;
  }
  return (TabContainerView *)view;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TabGroupSwitcherViewController)initWithTabController:(id)a3
{
  id v5;
  TabGroupSwitcherViewController *v6;
  TabGroupSwitcherViewController *v7;
  NSArray *tabGroups;
  NSMutableDictionary *v9;
  NSMutableDictionary *tabGroupIDToTabViewAdaptorMap;
  TabGroupSwitcherViewController *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TabGroupSwitcherViewController;
  v6 = -[TabGroupSwitcherViewController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabController, a3);
    tabGroups = v7->_tabGroups;
    v7->_tabGroups = (NSArray *)MEMORY[0x1E0C9AA60];

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tabGroupIDToTabViewAdaptorMap = v7->_tabGroupIDToTabViewAdaptorMap;
    v7->_tabGroupIDToTabViewAdaptorMap = v9;

    v11 = v7;
  }

  return v7;
}

- (void)recenterViews
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (a1)
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 88), "activeTabGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "indexOfObject:", v3);

    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = *(_QWORD *)(a1 + 72);
      if (v5)
        v6 = *(void **)(v5 + 456);
      else
        v6 = 0;
      objc_msgSend(v6, "revealChildAtIndex:", v4);
      v7 = *(_QWORD *)(a1 + 72);
      if (v7)
        v8 = *(void **)(v7 + 448);
      else
        v8 = 0;
      objc_msgSend(v8, "setSelectedItemIndex:", v4);
    }
  }
}

- (unint64_t)numberOfItemsInCapsuleCollectionView:(id)a3
{
  return -[NSArray count](self->_tabGroups, "count", a3);
}

- (int64_t)numberOfChildrenForContainerView:(id)a3
{
  return -[NSArray count](self->_tabGroups, "count", a3);
}

- (void)updateToolbarButtons
{
  void *v2;
  void *v3;
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 10);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(WeakRetained, "tabGroupSwitcherCanShowProfileInToolbar:", a1))
    {
      objc_msgSend(a1[11], "activeProfile");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      +[ToolbarItemConfiguration configurationForProfile:](ToolbarItemConfiguration, "configurationForProfile:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[ToolbarItemConfiguration configurationForTabGroupPicker](ToolbarItemConfiguration, "configurationForTabGroupPicker");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setEmphasized:", 0);
    objc_msgSend(a1[8], "setTabGroupButtonConfiguration:", v3);

  }
}

- (void)reloadTabGroup:(id)a3
{
  NSUInteger v4;
  TabGroupSwitcherView *view;
  SFTabViewContainerView *containerView;
  TabGroupSwitcherView *v7;
  SFCapsuleCollectionView *capsuleView;
  id v9;

  v4 = -[NSArray indexOfObject:](self->_tabGroups, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    view = self->_view;
    if (view)
      containerView = view->_containerView;
    else
      containerView = 0;
    -[SFTabViewContainerView reloadViewsAtIndexes:](containerView, "reloadViewsAtIndexes:", v9);
    v7 = self->_view;
    if (v7)
      capsuleView = v7->_capsuleView;
    else
      capsuleView = 0;
    -[SFCapsuleCollectionView reloadItemsAtIndexes:](capsuleView, "reloadItemsAtIndexes:", v9);

  }
}

- (id)capsuleCollectionView:(id)a3 contentViewForItemAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "createOrDequeueContentViewWithIdentifier:atIndex:", CFSTR("tab-group"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_tabGroups, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v8);

  return v6;
}

uint64_t __49__TabGroupSwitcherViewController_reloadTabGroups__block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

- (id)createToolbarForCapsuleCollectionView:(id)a3
{
  TabOverviewToolbar *toolbar;
  TabOverviewToolbar *v4;
  TabOverviewToolbar *v6;
  TabOverviewToolbar *v7;
  uint64_t v8;
  void *v9;
  TabOverviewToolbar *v10;
  void *v11;
  TabOverviewToolbar *v12;
  void *v13;
  TabOverviewToolbar *v14;
  void *v15;
  void *v16;
  TabOverviewToolbar *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[5];

  toolbar = self->_toolbar;
  if (toolbar)
  {
    v4 = toolbar;
  }
  else
  {
    v6 = objc_alloc_init(TabOverviewToolbar);
    v7 = self->_toolbar;
    self->_toolbar = v6;

    -[TabOverviewToolbar setBackgroundHidden:](self->_toolbar, "setBackgroundHidden:", 1);
    -[TabOverviewToolbar setTabGroupButtonDisplayStyle:](self->_toolbar, "setTabGroupButtonDisplayStyle:", 1);
    -[TabOverviewToolbar setPlacement:](self->_toolbar, "setPlacement:", 1);
    v8 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __72__TabGroupSwitcherViewController_createToolbarForCapsuleCollectionView___block_invoke;
    v21[3] = &unk_1E9CF61B8;
    v21[4] = self;
    objc_msgSend(MEMORY[0x1E0DC39D0], "safari_menuWithUncachedChildrenProvider:", v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_toolbar;
    objc_msgSend(MEMORY[0x1E0DC3428], "safari_actionWithTarget:selector:", self, sel_createTab_);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewToolbar addPrimaryAction:forBarButton:](v10, "addPrimaryAction:forBarButton:", v11, 1);

    -[TabOverviewToolbar setMenu:forBarButton:](self->_toolbar, "setMenu:forBarButton:", v9, 1);
    v12 = self->_toolbar;
    objc_msgSend(MEMORY[0x1E0DC3428], "safari_actionWithTarget:selector:", self, sel_presentTabGroups_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewToolbar addPrimaryAction:forBarButton:](v12, "addPrimaryAction:forBarButton:", v13, 0);

    v14 = self->_toolbar;
    -[TabController tabGroupsMenuForTabGroupButton:](self->_tabController, "tabGroupsMenuForTabGroupButton:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewToolbar setMenu:forBarButton:](v14, "setMenu:forBarButton:", v15, 0);

    -[TabOverviewToolbar setBarButton:enabled:](self->_toolbar, "setBarButton:enabled:", 0, 1);
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __72__TabGroupSwitcherViewController_createToolbarForCapsuleCollectionView___block_invoke_3;
    v20[3] = &unk_1E9CF61B8;
    v20[4] = self;
    objc_msgSend(MEMORY[0x1E0DC39D0], "safari_menuWithUncachedChildrenProvider:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_toolbar;
    objc_msgSend(MEMORY[0x1E0DC3428], "safari_actionWithTarget:selector:", self, sel_dismissTabSwitcher_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverviewToolbar addPrimaryAction:forBarButton:](v17, "addPrimaryAction:forBarButton:", v18, 2);

    -[TabOverviewToolbar setMenu:forBarButton:](self->_toolbar, "setMenu:forBarButton:", v16, 2);
    -[TabGroupSwitcherViewController updateToolbarButtons]((id *)&self->super.isa);
    v4 = self->_toolbar;

  }
  return v4;
}

- (void)reloadTabGroups
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *tabGroups;
  NSArray *v9;
  void *v10;
  uint64_t v11;
  TabGroupSwitcherView *view;
  SFTabViewContainerView *containerView;
  TabGroupSwitcherView *v14;
  TabGroupSwitcherView *v15;
  _QWORD v16[5];

  if (!self->_ignoreReloadData)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TabController privateTabGroupIfAvailable](self->_tabController, "privateTabGroupIfAvailable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

    -[TabController unnamedTabGroup](self->_tabController, "unnamedTabGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_addObjectUnlessNil:", v5);

    -[TabController namedTabGroups](self->_tabController, "namedTabGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

    v7 = (NSArray *)objc_msgSend(v3, "copy");
    tabGroups = self->_tabGroups;
    self->_tabGroups = v7;

    v9 = self->_tabGroups;
    -[TabController activeTabGroup](self->_tabController, "activeTabGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSArray indexOfObject:](v9, "indexOfObject:", v10);

    view = self->_view;
    if (view)
      containerView = view->_containerView;
    else
      containerView = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__TabGroupSwitcherViewController_reloadTabGroups__block_invoke;
    v16[3] = &__block_descriptor_40_e8_q16__0q8l;
    v16[4] = v11;
    -[SFTabViewContainerView reloadDataWithPostUpdateActions:](containerView, "reloadDataWithPostUpdateActions:", v16);
    v14 = self->_view;
    if (v14)
      v14 = (TabGroupSwitcherView *)v14->_capsuleView;
    v15 = v14;
    -[TabGroupSwitcherView reloadData](v15, "reloadData");
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      -[TabGroupSwitcherView setSelectedItemIndex:](v15, "setSelectedItemIndex:", v11);
    -[TabGroupSwitcherViewController updateToolbarButtons]((id *)&self->super.isa);

  }
}

- (BOOL)containerView:(id)a3 shouldDismantleChildView:(id)a4 atIndex:(int64_t)a5
{
  TabController *tabController;
  id v7;
  void *v8;
  void *v9;
  id v10;

  tabController = self->_tabController;
  v7 = a4;
  -[TabController tabCollectionViewProvider](tabController, "tabCollectionViewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tabThumbnailCollectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10 != v7 && !self->_hasActiveUserInteraction && self->_activeAnimationCount == 0;
}

- (id)containerView:(id)a3 childViewAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  TabOverviewDataSourceAdaptor *v11;
  uint64_t v12;
  NSMutableDictionary *tabGroupIDToTabViewAdaptorMap;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  TabOverviewDataSourceAdaptor *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  double lastBottomInset;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  TabOverviewDataSourceAdaptor *v30;

  v6 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_tabGroups, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController activeTabGroup](self->_tabController, "activeTabGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = WBSIsEqual();

  if (v9)
  {
    -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tabThumbnailCollectionView");
    v11 = (TabOverviewDataSourceAdaptor *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TabOverviewDataSourceAdaptor setAlternateBottomSafeAreaInset:](v11, "setAlternateBottomSafeAreaInset:", self->_lastBottomInset);
    -[TabOverviewDataSourceAdaptor view](v11, "view");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    tabGroupIDToTabViewAdaptorMap = self->_tabGroupIDToTabViewAdaptorMap;
    if (!tabGroupIDToTabViewAdaptorMap)
    {
      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = self->_tabGroupIDToTabViewAdaptorMap;
      self->_tabGroupIDToTabViewAdaptorMap = v14;

      tabGroupIDToTabViewAdaptorMap = self->_tabGroupIDToTabViewAdaptorMap;
    }
    objc_msgSend(v7, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](tabGroupIDToTabViewAdaptorMap, "objectForKeyedSubscript:", v16);
    v11 = (TabOverviewDataSourceAdaptor *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v17 = -[TabOverviewDataSourceAdaptor initWithTabGroup:tabController:]([TabOverviewDataSourceAdaptor alloc], "initWithTabGroup:tabController:", v7, self->_tabController);
      v18 = (void *)MEMORY[0x1E0DC3F10];
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __65__TabGroupSwitcherViewController_containerView_childViewAtIndex___block_invoke;
      v28 = &unk_1E9CF1830;
      v29 = v6;
      v11 = v17;
      v30 = v11;
      objc_msgSend(v18, "performWithoutAnimation:", &v25);
      v19 = self->_tabGroupIDToTabViewAdaptorMap;
      objc_msgSend(v7, "uuid", v25, v26, v27, v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v11, v20);

    }
    lastBottomInset = self->_lastBottomInset;
    -[TabOverviewDataSourceAdaptor tabOverview](v11, "tabOverview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAlternateBottomSafeAreaInset:", lastBottomInset);

    -[TabOverviewDataSourceAdaptor tabOverview](v11, "tabOverview");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v12;

  return v23;
}

- (void)viewDidLayoutSubviews
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 72);
    v3 = v2 ? *(void **)(v2 + 448) : 0;
    objc_msgSend(v3, "obscuredInsetsForState:ignoringKeyboard:", 0, 1);
    if (*(double *)(a1 + 32) != v4)
    {
      v5 = v4;
      *(double *)(a1 + 32) = v4;
      objc_msgSend(*(id *)(a1 + 88), "tabCollectionViewProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tabThumbnailCollectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "setAlternateBottomSafeAreaInset:", v5);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(*(id *)(a1 + 56), "objectEnumerator", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "tabOverview");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setAlternateBottomSafeAreaInset:", v5);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v10);
      }

    }
  }
}

- (void)activeTabGroupDidChange
{
  if (!self->_activeAnimationCount)
    -[TabGroupSwitcherViewController recenterViews]((uint64_t)self);
}

- (void)closeAllTabs:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "closeAllTabsForTabGroupSwitcher:", self);

}

- (void)createTab:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "openNewTabForTabGroupSwitcher:", self);

}

- (void)presentTabGroups:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presentTabGroupSheetForTabGroupSwitcher:", self);

}

- (void)dismissTabSwitcher:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dismissTabGroupSwitcher:", self);

}

- (void)tabCollectionViewWillPresent:(id)a3
{
  TabGroupSwitcherView *view;
  SFTabViewContainerView *containerView;

  if (-[NSArray count](self->_tabGroups, "count", a3))
  {
    view = self->_view;
    if (view)
      containerView = view->_containerView;
    else
      containerView = 0;
    -[SFTabViewContainerView reloadViewsAtIndexes:](containerView, "reloadViewsAtIndexes:", 0);
  }
  else
  {
    -[TabGroupSwitcherViewController reloadTabGroups](self, "reloadTabGroups");
  }
}

- (void)tabOverview:(id)a3 didUpdateScalePercentageForActiveItem:(double)a4
{
  TabGroupSwitcherView *view;
  double v5;

  view = self->_view;
  if (view)
  {
    v5 = fmax(fmin(a4, 1.0), 0.0);
    if (view->_tabViewPresentationProgress != v5)
    {
      view->_tabViewPresentationProgress = v5;
      -[TabGroupSwitcherView setNeedsLayout](view, "setNeedsLayout", a3);
    }
  }
}

void __65__TabGroupSwitcherViewController_containerView_childViewAtIndex___block_invoke(uint64_t a1)
{
  TabOverview *v2;
  TabOverview *v3;

  v2 = [TabOverview alloc];
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = -[TabOverview initWithFrame:](v2, "initWithFrame:");
  -[TabOverview setBarPlacement:](v3, "setBarPlacement:", 2);
  -[TabOverview setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setTabOverview:", v3);
  -[TabOverview presentAnimated:](v3, "presentAnimated:", 0);

}

- (void)containerView:(id)a3 dismantleChildView:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *tabGroupIDToTabViewAdaptorMap;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v14 = a4;
  -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabThumbnailCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v14;
  if (v7 != v14)
  {
    -[NSMutableDictionary allValues](self->_tabGroupIDToTabViewAdaptorMap, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__TabGroupSwitcherViewController_containerView_dismantleChildView___block_invoke;
    v15[3] = &unk_1E9CF6140;
    v16 = v14;
    objc_msgSend(v9, "safari_firstObjectPassingTest:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      tabGroupIDToTabViewAdaptorMap = self->_tabGroupIDToTabViewAdaptorMap;
      objc_msgSend(v10, "tabGroup");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](tabGroupIDToTabViewAdaptorMap, "setObject:forKeyedSubscript:", 0, v13);

    }
    v8 = v14;
  }

}

BOOL __67__TabGroupSwitcherViewController_containerView_dismantleChildView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "tabOverview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (_QWORD)adjustDiscreteAnimationCount:(_QWORD *)result
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (result)
  {
    v2 = result[2] + a2;
    result[1] += a2;
    result[2] = v2;
    v3 = result[9];
    if (v3)
      v4 = *(void **)(v3 + 456);
    else
      v4 = 0;
    return (_QWORD *)objc_msgSend(v4, "setExtendsVisibleRange:", v2 != 0);
  }
  return result;
}

- (void)capsuleCollectionView:(id)a3 willSelectItemAtIndex:(int64_t)a4 coordinator:(id)a5
{
  id v7;
  TabGroupSwitcherView *view;
  TabGroupSwitcherView *v9;
  uint64_t v10;
  TabGroupSwitcherView *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  TabGroupSwitcherView *v14;
  int64_t v15;

  if (!self->_hasActiveUserInteraction)
  {
    v7 = a5;
    -[TabGroupSwitcherViewController adjustDiscreteAnimationCount:](self, 1);
    view = self->_view;
    if (view)
      view = (TabGroupSwitcherView *)view->_containerView;
    v9 = view;
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __90__TabGroupSwitcherViewController_capsuleCollectionView_willSelectItemAtIndex_coordinator___block_invoke;
    v13[3] = &unk_1E9CF6168;
    v14 = v9;
    v15 = a4;
    v11 = v9;
    objc_msgSend(v7, "addAnimations:", v13);
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __90__TabGroupSwitcherViewController_capsuleCollectionView_willSelectItemAtIndex_coordinator___block_invoke_2;
    v12[3] = &unk_1E9CF1900;
    v12[4] = self;
    objc_msgSend(v7, "addCompletion:", v12);

  }
}

uint64_t __90__TabGroupSwitcherViewController_capsuleCollectionView_willSelectItemAtIndex_coordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "revealChildAtIndex:", *(_QWORD *)(a1 + 40));
}

_QWORD *__90__TabGroupSwitcherViewController_capsuleCollectionView_willSelectItemAtIndex_coordinator___block_invoke_2(uint64_t a1)
{
  return -[TabGroupSwitcherViewController adjustDiscreteAnimationCount:](*(_QWORD **)(a1 + 32), -1);
}

- (void)capsuleCollectionView:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  if (!self->_hasActiveUserInteraction)
  {
    -[NSArray objectAtIndexedSubscript:](self->_tabGroups, "objectAtIndexedSubscript:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[TabController activeTabGroupUUID](self->_tabController, "activeTabGroupUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = WBSIsEqual();

    if ((v7 & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __77__TabGroupSwitcherViewController_capsuleCollectionView_didSelectItemAtIndex___block_invoke;
      v10[3] = &unk_1E9CF1830;
      v10[4] = self;
      v11 = v9;
      objc_msgSend(v8, "performWithoutAnimation:", v10);

    }
  }
}

void __77__TabGroupSwitcherViewController_capsuleCollectionView_didSelectItemAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "tabCollectionViewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabOverview");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__TabGroupSwitcherViewController_capsuleCollectionView_didSelectItemAtIndex___block_invoke_2;
    v13[3] = &unk_1E9CF1830;
    v3 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v4 = &v14;
    v14 = v3;
    objc_msgSend(v10, "performUpdatesWithoutTabCloseAnimation:", v13);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__TabGroupSwitcherViewController_capsuleCollectionView_didSelectItemAtIndex___block_invoke_3;
    v11[3] = &unk_1E9CF1830;
    v6 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v4 = &v12;
    v12 = v6;
    objc_msgSend(v5, "performWithoutAnimation:", v11);
  }

  v7 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 72);
  if (v7)
    v7 = (_QWORD *)v7[57];
  v8 = v7;
  objc_msgSend(v8, "visibleChildIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadViewsAtIndexes:", v9);

}

uint64_t __77__TabGroupSwitcherViewController_capsuleCollectionView_didSelectItemAtIndex___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setActiveTabGroupUUID:", *(_QWORD *)(a1 + 40));
}

uint64_t __77__TabGroupSwitcherViewController_capsuleCollectionView_didSelectItemAtIndex___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setActiveTabGroupUUID:", *(_QWORD *)(a1 + 40));
}

- (BOOL)capsuleCollectionViewShouldFocusSelectedItem:(id)a3
{
  -[TabGroupSwitcherViewController dismissTabSwitcher:](self, "dismissTabSwitcher:", 0);
  return 0;
}

id __72__TabGroupSwitcherViewController_createToolbarForCapsuleCollectionView___block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isPrivateBrowsingEnabled") & 1) != 0)
    return MEMORY[0x1E0C9AA60];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__TabGroupSwitcherViewController_createToolbarForCapsuleCollectionView___block_invoke_2;
  aBlock[3] = &unk_1E9CF6190;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v3 = _Block_copy(aBlock);
  v4 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "activeProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_recentlyClosedTabsMenuForProfile:showProfileTitle:openHandler:", v5, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "hasMultipleProfiles"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __72__TabGroupSwitcherViewController_createToolbarForCapsuleCollectionView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "insertTabDocumentFromTabStateData:", a2);
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "tabCollectionViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 4, objc_msgSend(v3, "visibleTabCollectionViewType"));

}

id __72__TabGroupSwitcherViewController_createToolbarForCapsuleCollectionView___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isPrivateBrowsingAndLocked") & 1) != 0)
    return MEMORY[0x1E0C9AA60];
  v2 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandWithTitle:image:action:propertyList:", v3, v4, sel_closeAllTabs_, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAttributes:", 2);
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)capsuleCollectionView:(id)a3 didBeginSelectionGestureOnAxis:(unint64_t)a4
{
  TabGroupSwitcherView *view;
  SFTabViewContainerView *containerView;

  self->_hasActiveUserInteraction = 1;
  view = self->_view;
  if (view)
    containerView = view->_containerView;
  else
    containerView = 0;
  -[SFTabViewContainerView setUserInteractionEnabled:](containerView, "setUserInteractionEnabled:", 0, a4);
}

- (void)capsuleCollectionView:(id)a3 didUpdateProgress:(double)a4 toSelectItemAtIndex:(int64_t)a5 progressToTopAction:(double)a6 snapToAxis:(unint64_t)a7
{
  id v10;
  int64_t v11;
  uint64_t v12;
  TabGroupSwitcherView *view;
  SFTabViewContainerView *containerView;
  double v15;

  v10 = a3;
  v11 = objc_msgSend(v10, "selectedItemIndex");
  v12 = objc_msgSend(v10, "selectedItemIndex");

  view = self->_view;
  if (view)
    containerView = view->_containerView;
  else
    containerView = 0;
  v15 = -1.0;
  if (v11 < a5)
    v15 = 1.0;
  -[SFTabViewContainerView revealChildAtFractionalIndex:](containerView, "revealChildAtFractionalIndex:", (double)v12 + a4 * v15);
}

- (void)capsuleCollectionView:(id)a3 willEndSelectionGestureWithCoordinator:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;

  v6 = a3;
  ++self->_activeAnimationCount;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__TabGroupSwitcherViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke;
  v11[3] = &unk_1E9CF4A40;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  v9 = a4;
  objc_msgSend(v9, "addAnimations:", v11);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __95__TabGroupSwitcherViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke_2;
  v10[3] = &unk_1E9CF1900;
  v10[4] = self;
  objc_msgSend(v9, "addCompletion:", v10);

}

void __95__TabGroupSwitcherViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  id v13;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 1;
  v2 = objc_msgSend(*(id *)(a1 + 40), "selectedItemIndex");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  objc_msgSend(*(id *)(v3 + 40), "objectAtIndexedSubscript:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabOverview");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "capsuleCollectionView:didSelectItemAtIndex:", *(_QWORD *)(a1 + 40), v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "tabCollectionViewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tabOverview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v9, "copyGeometryFromTabOverview:");
  else
    objc_msgSend(v9, "endAnimation");
  v10 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 72);
  if (v10)
    v10 = (_QWORD *)v10[57];
  v11 = *(void **)(a1 + 40);
  v12 = v10;
  objc_msgSend(v12, "revealChildAtIndex:", objc_msgSend(v11, "selectedItemIndex"));

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 0;
}

void __95__TabGroupSwitcherViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v1 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 72);
  if (v1)
    v1 = (_QWORD *)v1[57];
  v2 = v1;
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);
  objc_msgSend(v2, "reloadViewsAtIndexes:", 0);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  TabController *tabController;
  void *v5;
  void *v6;

  tabController = self->_tabController;
  -[TabController activeTabGroup](tabController, "activeTabGroup", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController contextMenuConfigurationForTabGroup:variant:](tabController, "contextMenuConfigurationForTabGroup:variant:", v5, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPreferredMenuElementOrder:", 1);
  return v6;
}

- (id)_dragPreviewForCapsuleView:(uint64_t)a1
{
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
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
  void *v17;
  void *v18;
  void *v19;

  if (a1)
  {
    v1 = *(_QWORD **)(a1 + 72);
    if (v1)
      v1 = (_QWORD *)v1[56];
    v2 = v1;
    objc_msgSend(v2, "viewForItemAtIndex:", objc_msgSend(v2, "selectedItemIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capsuleBackgroundCornerRadius");
    objc_msgSend(v3, "_setContinuousCornerRadius:");
    objc_msgSend(v2, "contentViewForItemAtIndex:", objc_msgSend(v2, "selectedItemIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    v6 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(v4, "bounds");
    objc_msgSend(v4, "convertRect:toView:", v3);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v2, "capsuleBackgroundCornerRadius");
    v16 = v15;

    objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:", v8, v10, v12, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVisiblePath:", v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v18);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:", v3, v5);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabGroupSwitcherViewController _dragPreviewForCapsuleView:]((uint64_t)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[TabController tabGroupWithUUID:](self->_tabController, "tabGroupWithUUID:", v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v7, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabGroupSwitcherViewController _dragPreviewForCapsuleView:]((uint64_t)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  TabGroupSwitcherView *view;
  SFCapsuleCollectionView *capsuleView;

  view = self->_view;
  if (view)
    capsuleView = view->_capsuleView;
  else
    capsuleView = 0;
  -[SFCapsuleCollectionView setSelectedItemUsesLiftedPreviewAppearance:animator:](capsuleView, "setSelectedItemUsesLiftedPreviewAppearance:animator:", 1, a5);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  TabGroupSwitcherView *view;
  SFCapsuleCollectionView *capsuleView;

  view = self->_view;
  if (view)
    capsuleView = view->_capsuleView;
  else
    capsuleView = 0;
  -[SFCapsuleCollectionView setSelectedItemUsesLiftedPreviewAppearance:animator:](capsuleView, "setSelectedItemUsesLiftedPreviewAppearance:animator:", 0, a5);
}

- (TabGroupSwitcherViewControllerDelegate)delegate
{
  return (TabGroupSwitcherViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TabController)tabController
{
  return self->_tabController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_tabGroupIDToTabViewAdaptorMap, 0);
  objc_storeStrong((id *)&self->_tabGroupPickerButton, 0);
  objc_storeStrong((id *)&self->_tabGroups, 0);
}

@end
