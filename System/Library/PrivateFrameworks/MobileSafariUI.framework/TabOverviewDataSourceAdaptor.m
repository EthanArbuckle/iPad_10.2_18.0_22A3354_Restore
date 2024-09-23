@implementation TabOverviewDataSourceAdaptor

- (TabOverviewDataSourceAdaptor)initWithTabGroup:(id)a3 tabController:(id)a4
{
  id v7;
  id v8;
  TabOverviewDataSourceAdaptor *v9;
  TabOverviewDataSourceAdaptor *v10;
  TabOverviewDataSourceAdaptor *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TabOverviewDataSourceAdaptor;
  v9 = -[TabOverviewDataSourceAdaptor init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tabGroup, a3);
    objc_storeStrong((id *)&v10->_tabController, a4);
    v11 = v10;
  }

  return v10;
}

- (void)setTabOverview:(id)a3
{
  TabOverview *v5;
  TabOverview *tabOverview;
  TabOverviewItem *currentItem;
  TabOverview *v8;

  v5 = (TabOverview *)a3;
  tabOverview = self->_tabOverview;
  if (tabOverview != v5)
  {
    v8 = v5;
    -[TabOverview setDelegate:](tabOverview, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_tabOverview, a3);
    currentItem = self->_currentItem;
    self->_currentItem = 0;

    -[TabOverviewDataSourceAdaptor configureTabOverviewFromTabGroup](self, "configureTabOverviewFromTabGroup");
    v5 = v8;
  }

}

- (void)configureTabOverviewFromTabGroup
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  TabOverviewItem *currentItem;
  void *v14;
  void *v15;
  void *v16;
  TabOverviewItem *v17;
  TabOverviewItem *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  _QWORD v23[4];
  id v24;
  TabOverviewDataSourceAdaptor *v25;

  if (self->_tabOverview)
  {
    if ((-[WBTabGroup isNamed](self->_tabGroup, "isNamed") & 1) != 0)
    {
      -[WBTabGroup displayTitle](self->_tabGroup, "displayTitle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverview setTitle:](self->_tabOverview, "setTitle:", v3);

    }
    else
    {
      -[TabOverview setTitle:](self->_tabOverview, "setTitle:", 0);
    }
    -[TabOverview setDelegate:](self->_tabOverview, "setDelegate:", self);
    if (-[WBTabGroup isPrivateBrowsing](self->_tabGroup, "isPrivateBrowsing"))
    {
      -[TabController _application](self->_tabController);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isPrivateBrowsingLocked");

      if (v5)
      {
        -[TabOverview setShowsLockedPrivateBrowsingView:withUnlockHandler:](self->_tabOverview, "setShowsLockedPrivateBrowsingView:withUnlockHandler:", 1, 0);
        -[TabOverview setShowsPrivateBrowsingExplanationView:animated:](self->_tabOverview, "setShowsPrivateBrowsingExplanationView:animated:", 0, 0);
        -[TabOverview setItems:](self->_tabOverview, "setItems:", MEMORY[0x1E0C9AA60]);
        goto LABEL_21;
      }
    }
    -[TabOverview setShowsLockedPrivateBrowsingView:withUnlockHandler:](self->_tabOverview, "setShowsLockedPrivateBrowsingView:withUnlockHandler:", 0, 0);
    if (-[WBTabGroup usesGlobalPinnedTabs](self->_tabGroup, "usesGlobalPinnedTabs"))
    {
      -[TabController globalPinnedTabsForTabGroup:](self->_tabController, "globalPinnedTabsForTabGroup:", self->_tabGroup);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBTabGroup tabs](self->_tabGroup, "tabs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[WBTabGroup tabs](self->_tabGroup, "tabs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safari_partionedArrayUsingCondition:", &__block_literal_global_72);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (-[WBTabGroup isPrivateBrowsing](self->_tabGroup, "isPrivateBrowsing")
      && objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isBlank"))
      {

LABEL_16:
        -[TabOverview setShowsPrivateBrowsingExplanationView:animated:](self->_tabOverview, "setShowsPrivateBrowsingExplanationView:animated:", 1, 0);
        -[TabOverview setItems:](self->_tabOverview, "setItems:", MEMORY[0x1E0C9AA60]);
        currentItem = self->_currentItem;
        self->_currentItem = 0;
LABEL_20:

LABEL_21:
        if (-[WBTabGroup isNamed](self->_tabGroup, "isNamed"))
        {
          v22 = objc_alloc_init(MEMORY[0x1E0D4ED98]);
          objc_msgSend(v22, "setTabGroup:", self->_tabGroup);
          -[TabOverview bounds](self->_tabOverview, "bounds");
          objc_msgSend(v22, "sizeThatFits:", v19, v20);
          self->_bannerHeight = v21;

        }
        else
        {
          self->_bannerHeight = 0.0;
        }
        return;
      }
      -[TabController privateTabs](self->_tabController, "privateTabs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isBlank");

      if (v12)
        goto LABEL_16;
    }
    -[TabOverview setShowsPrivateBrowsingExplanationView:animated:](self->_tabOverview, "setShowsPrivateBrowsingExplanationView:animated:", 0, 0);
    -[WBTabGroup lastSelectedTabUUID](self->_tabGroup, "lastSelectedTabUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __64__TabOverviewDataSourceAdaptor_configureTabOverviewFromTabGroup__block_invoke_2;
    v23[3] = &unk_1E9CFB108;
    currentItem = v14;
    v24 = currentItem;
    v25 = self;
    objc_msgSend(v8, "safari_mapObjectsUsingBlock:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabOverview setItems:](self->_tabOverview, "setItems:", v15);

    if (!((unint64_t)self->_currentItem | (unint64_t)currentItem))
    {
      -[TabOverview items](self->_tabOverview, "items");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (TabOverviewItem *)objc_claimAutoreleasedReturnValue();
      v18 = self->_currentItem;
      self->_currentItem = v17;

    }
    goto LABEL_20;
  }
}

uint64_t __64__TabOverviewDataSourceAdaptor_configureTabOverviewFromTabGroup__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned") ^ 1;
}

TabOverviewItem *__64__TabOverviewDataSourceAdaptor_configureTabOverviewFromTabGroup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  TabOverviewItem *v4;
  id v5;
  void *v6;
  void *v7;
  TabOverviewItem *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v3 = a2;
  v4 = [TabOverviewItem alloc];
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
  v8 = -[TabOverviewItem initWithUUID:](v4, "initWithUUID:", v7);

  objc_msgSend(v3, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v3, "title");
  else
    +[TabDocument blankTabTitleWithLibraryType:controlledByAutomation:](TabDocument, "blankTabTitleWithLibraryType:controlledByAutomation:", 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabOverviewItem setTitle:](v8, "setTitle:", v10);

  -[TabOverviewItem setPinned:](v8, "setPinned:", objc_msgSend(v3, "isPinned"));
  objc_msgSend(v3, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = WBSIsEqual();

  if (v12)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 8), v8);

  return v8;
}

- (id)tabCollectionViewManager
{
  return (id)-[TabController tabCollectionViewManager]((uint64_t)self->_tabController);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TabOverviewDataSourceAdaptor;
  -[TabOverviewDataSourceAdaptor methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[TabOverviewDataSourceAdaptor tabCollectionViewManager](self, "tabCollectionViewManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TabOverviewDataSourceAdaptor;
  if (-[TabOverviewDataSourceAdaptor respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[TabOverviewDataSourceAdaptor tabCollectionViewManager](self, "tabCollectionViewManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "selector");
  -[TabOverviewDataSourceAdaptor tabCollectionViewManager](self, "tabCollectionViewManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "invokeWithTarget:", v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TabOverviewDataSourceAdaptor;
    -[TabOverviewDataSourceAdaptor forwardInvocation:](&v6, sel_forwardInvocation_, v4);
  }

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v3;
  id v4;

  -[TabOverviewDataSourceAdaptor tabCollectionViewManager](self, "tabCollectionViewManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)tabCollectionView:(id)a3 borrowContentViewForItem:(id)a4 withTopBackdropView:(id *)a5 ofHeight:(double)a6
{
  return objc_alloc_init(MEMORY[0x1E0DC3F10]);
}

- (BOOL)tabCollectionView:(id)a3 canCloseItem:(id)a4
{
  void *v4;
  void *v5;
  char v6;
  char v7;

  -[WBTabGroup tabs](self->_tabGroup, "tabs", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBlank");

    v7 = v6 ^ 1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)undoManagerForTabCollectionView:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0CB3A48]);
}

- (double)tabCollectionViewItemHeaderHeightIncludedInSnapshot:(id)a3
{
  return self->_bannerHeight;
}

- (BOOL)tabCollectionView:(id)a3 includesHeaderInSnapshotForItems:(id)a4
{
  WBTabGroup *tabGroup;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  tabGroup = self->_tabGroup;
  objc_msgSend(a4, "UUID", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroup tabWithUUID:](tabGroup, "tabWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBlank") ^ 1;

  return v8;
}

- (id)currentItemForTabOverview:(id)a3
{
  return self->_currentItem;
}

- (TabController)tabController
{
  return self->_tabController;
}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (TabOverview)tabOverview
{
  return self->_tabOverview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabOverview, 0);
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_tabController, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
}

@end
