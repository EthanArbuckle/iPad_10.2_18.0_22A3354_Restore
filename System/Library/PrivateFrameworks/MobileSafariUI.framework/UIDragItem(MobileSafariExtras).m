@implementation UIDragItem(MobileSafariExtras)

+ (uint64_t)safari_itemWithTab:()MobileSafariExtras browserController:
{
  return objc_msgSend(a1, "safari_itemWithTab:tabItem:browserController:", a3, 0, a4);
}

+ (id)safari_itemWithTab:()MobileSafariExtras tabItem:browserController:
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  TabDragMetadata *v14;

  v8 = (void *)MEMORY[0x1E0CB36C8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "safari_itemProviderForTab:browserController:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend([a1 alloc], "initWithItemProvider:", v12);
  v14 = objc_alloc_init(TabDragMetadata);
  -[TabDragMetadata setTab:](v14, "setTab:", v11);

  -[TabDragMetadata setTabItem:](v14, "setTabItem:", v10);
  -[TabDragMetadata setBrowserController:](v14, "setBrowserController:", v9);

  objc_msgSend(v13, "setLocalObject:", v14);
  return v13;
}

- (id)safari_localWBTab
{
  void *v1;
  void *v2;

  -[UIDragItem _safari_localTabDragMetadata](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tab");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)safari_localTabIsPinnable
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "safari_localBrowserController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "safari_localWBTab");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isTabPinnable:", v4);

  return v5;
}

- (id)safari_localTabItem
{
  void *v1;
  void *v2;

  -[UIDragItem _safari_localTabDragMetadata](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tabItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_localBrowserController
{
  void *v1;
  void *v2;

  -[UIDragItem _safari_localTabDragMetadata](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "browserController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_localTab
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(a1, "safari_localWBTab");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithUUIDString:", v4);

  objc_msgSend(a1, "safari_localBrowserController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabWithUUID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)safari_localSourceTabView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "safari_localTabItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "safari_localBrowserController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tabCollectionViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabCollectionViewForItem:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)safari_dragPreviewRequiresUpdateForTabView:()MobileSafariExtras pinned:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;

  v6 = a3;
  -[UIDragItem _safari_localTabDragMetadata](a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetTabViewForDragPreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(a1, "safari_localSourceTabView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v7, "setTargetTabViewForDragPreview:", v6);
  v12 = objc_msgSend(v7, "dragPreviewPinned");
  objc_msgSend(v7, "setDragPreviewPinned:", a4);

  if (v11 == v6)
    v13 = v12 ^ a4;
  else
    v13 = 1;

  return v13;
}

@end
