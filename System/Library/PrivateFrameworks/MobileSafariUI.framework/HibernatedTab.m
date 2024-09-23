@implementation HibernatedTab

- (HibernatedTab)initWithTabDocument:(id)a3
{
  id v4;
  HibernatedTab *v5;
  void *v6;
  uint64_t v7;
  NSURL *url;
  uint64_t v9;
  NSString *title;
  WBTab *wbTab;
  id v12;
  void *v13;
  uint64_t v14;
  UnifiedTabBarItem *unifiedTabBarItem;
  uint64_t v16;
  TabBarItem *tabBarItem;
  uint64_t v18;
  TabOverviewItem *tabOverviewItem;
  uint64_t v20;
  TabDocumentCollectionItem *tabCollectionItem;
  double v22;
  uint64_t v23;
  NSArray *ancestorUUIDs;
  double v25;
  uint64_t v26;
  NSArray *shareParticipants;
  HibernatedTab *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HibernatedTab;
  v5 = -[HibernatedTab init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "tabGroupTab");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v7 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v7;

    if (v5->_url)
    {
      objc_msgSend(v6, "title");
      v9 = objc_claimAutoreleasedReturnValue();
      title = v5->_title;
      v5->_title = (NSString *)v9;
    }
    else
    {
      title = v5->_title;
      v5->_title = 0;
    }

    wbTab = v5->_wbTab;
    v5->_wbTab = (WBTab *)v6;
    v12 = v6;

    objc_msgSend(v4, "browserController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HibernatedTab setBrowserController:](v5, "setBrowserController:", v13);
    objc_msgSend(v4, "unifiedTabBarItem");
    v14 = objc_claimAutoreleasedReturnValue();
    unifiedTabBarItem = v5->_unifiedTabBarItem;
    v5->_unifiedTabBarItem = (UnifiedTabBarItem *)v14;

    objc_msgSend(v4, "tabBarItem");
    v16 = objc_claimAutoreleasedReturnValue();
    tabBarItem = v5->_tabBarItem;
    v5->_tabBarItem = (TabBarItem *)v16;

    objc_msgSend(v4, "tabOverviewItem");
    v18 = objc_claimAutoreleasedReturnValue();
    tabOverviewItem = v5->_tabOverviewItem;
    v5->_tabOverviewItem = (TabOverviewItem *)v18;

    objc_msgSend(v4, "tabCollectionItem");
    v20 = objc_claimAutoreleasedReturnValue();
    tabCollectionItem = v5->_tabCollectionItem;
    v5->_tabCollectionItem = (TabDocumentCollectionItem *)v20;

    objc_msgSend(v4, "idForWebExtensions");
    v5->_idForWebExtensions = v22;
    objc_msgSend(v4, "ancestorUUIDs");
    v23 = objc_claimAutoreleasedReturnValue();
    ancestorUUIDs = v5->_ancestorUUIDs;
    v5->_ancestorUUIDs = (NSArray *)v23;

    objc_msgSend(v4, "lastViewedTime");
    v5->_lastViewedTime = v25;
    objc_msgSend(v4, "shareParticipants");
    v26 = objc_claimAutoreleasedReturnValue();
    shareParticipants = v5->_shareParticipants;
    v5->_shareParticipants = (NSArray *)v26;

    -[HibernatedTab setUnread:](v5, "setUnread:", objc_msgSend(v4, "isUnread"));
    -[HibernatedTab restoreStateFromTab:](v5, "restoreStateFromTab:", v12);

    v28 = v5;
  }

  return v5;
}

- (HibernatedTab)initWithWBTab:(id)a3 browserController:(id)a4
{
  id v7;
  id v8;
  HibernatedTab *v9;
  uint64_t v10;
  NSURL *url;
  uint64_t v12;
  NSString *title;
  UnifiedTabBarItem *v14;
  UnifiedTabBarItem *unifiedTabBarItem;
  void *v16;
  void *v17;
  int v18;
  TabBarItem *v19;
  TabBarItem *tabBarItem;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *ancestorUUIDs;
  void *v27;
  double v28;
  NSArray *shareParticipants;
  uint64_t v30;
  HibernatedTab *v31;
  objc_super v33;

  v7 = a3;
  v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)HibernatedTab;
  v9 = -[HibernatedTab init](&v33, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "url");
    v10 = objc_claimAutoreleasedReturnValue();
    url = v9->_url;
    v9->_url = (NSURL *)v10;

    if (v9->_url)
    {
      objc_msgSend(v7, "title");
      v12 = objc_claimAutoreleasedReturnValue();
      title = v9->_title;
      v9->_title = (NSString *)v12;
    }
    else
    {
      title = v9->_title;
      v9->_title = 0;
    }

    objc_storeStrong((id *)&v9->_wbTab, a3);
    -[HibernatedTab setBrowserController:](v9, "setBrowserController:", v8);
    v14 = objc_alloc_init(UnifiedTabBarItem);
    unifiedTabBarItem = v9->_unifiedTabBarItem;
    v9->_unifiedTabBarItem = v14;

    -[HibernatedTab uuid](v9, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UnifiedTabBarItem setUUID:](v9->_unifiedTabBarItem, "setUUID:", v16);

    -[SFUnifiedTabBarItem setMenuButtonConfigurator:](v9->_unifiedTabBarItem, "setMenuButtonConfigurator:", v8);
    objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "showRectangularTabsInSeparateBar");

    if (v18)
    {
      v19 = objc_alloc_init(TabBarItem);
      tabBarItem = v9->_tabBarItem;
      v9->_tabBarItem = v19;

      -[HibernatedTab uuid](v9, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabBarItem setUUID:](v9->_tabBarItem, "setUUID:", v21);

    }
    -[HibernatedTab resetTabViewItems](v9, "resetTabViewItems");
    objc_msgSend(MEMORY[0x1E0D8ADC8], "nextTabID");
    v9->_idForWebExtensions = v22;
    objc_msgSend(v7, "localAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "ancestorTabUUIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_30);
    v25 = objc_claimAutoreleasedReturnValue();
    ancestorUUIDs = v9->_ancestorUUIDs;
    v9->_ancestorUUIDs = (NSArray *)v25;

    objc_msgSend(v23, "lastVisitTime");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceReferenceDate");
    v9->_lastViewedTime = v28;

    shareParticipants = v9->_shareParticipants;
    v9->_shareParticipants = (NSArray *)MEMORY[0x1E0C9AA60];

    if (objc_msgSend(v7, "isShared"))
      v30 = objc_msgSend(v7, "isMarkedAsRead") ^ 1;
    else
      v30 = 0;
    -[HibernatedTab setUnread:](v9, "setUnread:", v30);
    -[HibernatedTab restoreStateFromTab:](v9, "restoreStateFromTab:", v7);
    v31 = v9;

  }
  return v9;
}

id __49__HibernatedTab_initWithWBTab_browserController___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HibernatedTab _cancelFaviconUpdate](self, "_cancelFaviconUpdate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HibernatedTab;
  -[HibernatedTab dealloc](&v4, sel_dealloc);
}

- (void)setBrowserController:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "tabController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willLoseOwnershipOfTab:", self);

    objc_storeWeak((id *)&self->_browserController, obj);
    objc_msgSend(obj, "tabController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didGainOwnershipOfTab:", self);

  }
}

- (NSUUID)uuid
{
  NSUUID *uuid;
  id v4;
  void *v5;
  NSUUID *v6;
  NSUUID *v7;

  uuid = self->_uuid;
  if (!uuid)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[HibernatedTab uuidString](self, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSUUID *)objc_msgSend(v4, "initWithUUIDString:", v5);
    v7 = self->_uuid;
    self->_uuid = v6;

    uuid = self->_uuid;
  }
  return uuid;
}

- (NSString)uuidString
{
  return (NSString *)-[WBTab uuid](self->_wbTab, "uuid");
}

- (BOOL)isActive
{
  return 0;
}

- (BOOL)isShowingSystemStartPage
{
  return self->_url == 0;
}

- (BOOL)isBlank
{
  NSURL *url;
  void *v3;
  char v4;

  url = self->_url;
  if (!url)
    return 1;
  extensionOverridenStartPageURLForTab(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSURL isEqual:](url, "isEqual:", v3);

  return v4;
}

- (BOOL)isPrivateBrowsingEnabled
{
  return -[WBTab isPrivateBrowsing](self->_wbTab, "isPrivateBrowsing");
}

- (int64_t)pageStatus
{
  if (self->_showingErrorPage)
    return 2;
  else
    return 1;
}

- (BOOL)canSetPinned
{
  return 1;
}

- (void)setPinned:(BOOL)a3
{
  _BOOL8 v3;
  NSString *v5;
  NSString *pinnedTitle;
  NSURL *pinnedURL;
  NSString *v8;

  if (self->_pinned != a3)
  {
    v3 = a3;
    self->_pinned = a3;
    -[TabBarItem setPinned:](self->_tabBarItem, "setPinned:");
    -[UnifiedTabBarItem setPinned:](self->_unifiedTabBarItem, "setPinned:", v3);
    -[TabOverviewItem setPinned:](self->_tabOverviewItem, "setPinned:", v3);
    -[TabDocumentCollectionItem setPinned:](self->_tabCollectionItem, "setPinned:", v3);
    -[HibernatedTab _notifyDidUpdateTabCollectionItem](self, "_notifyDidUpdateTabCollectionItem");
    if (v3)
    {
      objc_storeStrong((id *)&self->_pinnedURL, self->_url);
      -[HibernatedTab title](self, "title");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      pinnedTitle = self->_pinnedTitle;
      self->_pinnedTitle = v5;

    }
    else
    {
      pinnedURL = self->_pinnedURL;
      self->_pinnedURL = 0;

      v8 = self->_pinnedTitle;
      self->_pinnedTitle = 0;

    }
  }
}

- (void)loadURL:(id)a3 title:(id)a4 skipSyncableTabUpdates:(BOOL)a5
{
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  NSURL *v12;
  NSURL *url;
  NSString *v14;
  NSString *title;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  HibernatedTab *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  self->_skipSyncableTabUpdates = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v11 = WBS_LOG_CHANNEL_PREFIXPageLoading();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v19 = 134218499;
    v20 = self;
    v21 = 2160;
    v22 = 1752392040;
    v23 = 2117;
    v24 = v8;
    _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_INFO, "Store deferred navigation: (hibernated tab: %p) %{sensitive, mask.hash}@", (uint8_t *)&v19, 0x20u);
  }
  self->_hasDeferredNavigation = 1;
  v12 = (NSURL *)objc_msgSend(v8, "copy");
  url = self->_url;
  self->_url = v12;

  v14 = (NSString *)objc_msgSend(v9, "copy");
  title = self->_title;
  self->_title = v14;

  -[HibernatedTab updateTabTitle](self, "updateTabTitle");
  -[HibernatedTab updateTabIcon](self, "updateTabIcon");
  objc_msgSend(WeakRetained, "tabCollectionViewProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HibernatedTab uuid](self, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeSnapshotForTabWithUUID:", v17);

  objc_msgSend(WeakRetained, "tabController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateWBTabWithTab:notify:persist:", self, 0, 0);

}

- (void)restoreStateFromTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *pinnedTitle;
  void *v14;
  NSURL *v15;
  NSURL *pinnedURL;
  WBTab *wbTab;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "localAttributes");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "queuedNavigation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sessionStateData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v5)
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HibernatedTab loadURL:title:skipSyncableTabUpdates:](self, "loadURL:title:skipSyncableTabUpdates:", v9, v10, 0);

  }
  -[HibernatedTab setPinned:](self, "setPinned:", objc_msgSend(v4, "isPinned"));
  objc_msgSend(v4, "pinnedTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSString *)objc_msgSend(v11, "copy");
  pinnedTitle = self->_pinnedTitle;
  self->_pinnedTitle = v12;

  objc_msgSend(v4, "pinnedURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (NSURL *)objc_msgSend(v14, "copy");
  pinnedURL = self->_pinnedURL;
  self->_pinnedURL = v15;

  wbTab = self->_wbTab;
  self->_wbTab = (WBTab *)v4;

}

- (id)tabUpdateBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__HibernatedTab_tabUpdateBlock__block_invoke;
  v4[3] = &unk_1E9CF5FB0;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __31__HibernatedTab_tabUpdateBlock__block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[24])
    {
      objc_msgSend(v8, "setPinned:title:url:", WeakRetained[73], *((_QWORD *)WeakRetained + 14), *((_QWORD *)WeakRetained + 15));
    }
    else
    {
      WeakRetained[24] = 1;
      objc_msgSend(WeakRetained, "_localAttributes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLocalAttributes:", v5);

      objc_msgSend(v4, "_titleForStatePersistingForTabGroupTab");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "urlForStatePersisting");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && v4[25])
      {
        objc_msgSend(v8, "setLocalTitle:", v6);
        objc_msgSend(v8, "setLocalURL:", v7);
      }
      objc_msgSend(v8, "setPinned:title:url:", v4[73], *((_QWORD *)v4 + 14), *((_QWORD *)v4 + 15));

    }
  }

}

- (id)_localAttributes
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *title;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_lastViewedTime);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_hasDeferredNavigation)
  {
    v12[0] = CFSTR("url");
    -[NSURL absoluteString](self->_url, "absoluteString");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    title = (NSString *)&stru_1E9CFDBB0;
    if (v4)
      v7 = (const __CFString *)v4;
    else
      v7 = &stru_1E9CFDBB0;
    v12[1] = CFSTR("title");
    v13[0] = v7;
    if (self->_title)
      title = self->_title;
    v13[1] = title;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[WBTab localAttributes](self->_wbTab, "localAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localAttributesWithLastVisitTime:queuedNavigation:", v3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (WBSCloudTab)cloudTab
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0D8A850]);
  -[HibernatedTab urlForCloudTab](self, "urlForCloudTab");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithURL:", v4);

  -[HibernatedTab uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUuid:", v6);

  -[HibernatedTab titleForCloudTab](self, "titleForCloudTab");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  -[WBTab localAttributes](self->_wbTab, "localAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowingReader:", objc_msgSend(v8, "isShowingReader"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "windowState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sceneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSceneID:", v11);

  objc_msgSend(v5, "setLastViewedTime:", self->_lastViewedTime);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A838]), "initWithParameters:", v5);

  return (WBSCloudTab *)v12;
}

- (SFTabStateData)tabStateData
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = objc_alloc_init(MEMORY[0x1E0D4EDC8]);
  -[HibernatedTab urlForStatePersisting](self, "urlForStatePersisting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_originalDataAsString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E9CFDBB0;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  -[HibernatedTab uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUUIDString:", v10);

  -[HibernatedTab _titleForStatePersistingForTabStateData](self, "_titleForStatePersistingForTabStateData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v11);

  objc_msgSend(v3, "setUrl:", v8);
  -[WBTab localAttributes](self->_wbTab, "localAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (self->_hasDeferredNavigation)
  {
    objc_msgSend(v3, "setUserVisibleURL:", v8);
    objc_msgSend(v3, "setLastViewedTime:", -1.0);
    objc_msgSend(v3, "setReadingListBookmarkID:", 0);
    objc_msgSend(v3, "setShowingReader:", 0);
    objc_msgSend(v3, "setReaderViewTopScrollOffset:", 0);
    objc_msgSend(v3, "setDisplayingStandaloneImage:", 0);
    v14 = 0;
  }
  else
  {
    if ((objc_msgSend(v4, "isFileURL") & 1) != 0)
    {
      -[HibernatedTab urlString](self, "urlString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setUserVisibleURL:", v15);

    }
    else
    {
      objc_msgSend(v3, "setUserVisibleURL:", v8);
    }
    -[HibernatedTab lastActivationTime](self, "lastActivationTime");
    objc_msgSend(v3, "setLastViewedTime:");
    objc_msgSend(v3, "setReadingListBookmarkID:", objc_msgSend(v12, "readingListBookmarkID"));
    objc_msgSend(v3, "setShowingReader:", objc_msgSend(v12, "isShowingReader"));
    objc_msgSend(v12, "readerViewTopScrollOffset");
    objc_msgSend(v3, "setReaderViewTopScrollOffset:", (uint64_t)v16);
    objc_msgSend(v3, "setDisplayingStandaloneImage:", objc_msgSend(v12, "isDisplayingStandaloneImage"));
    v14 = objc_msgSend(v12, "wasOpenedFromLink");
  }
  objc_msgSend(v3, "setWasOpenedFromLink:", v14);
  objc_msgSend(v3, "setPrivateBrowsing:", -[HibernatedTab isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));
  objc_msgSend(v12, "sessionStateData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionStateData:", v17);

  objc_msgSend(WeakRetained, "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOwningBrowserWindowUUIDString:", v19);

  objc_msgSend(v3, "setOrderIndex:", objc_msgSend(WeakRetained, "orderIndexForTab:", self));
  objc_msgSend(v3, "sessionStateData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUncompressedSessionStateDataSize:", objc_msgSend(v20, "length"));

  -[WBTab tabGroupUUID](self->_wbTab, "tabGroupUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTabGroupUUID:", v21);

  objc_msgSend(WeakRetained, "effectiveProfileIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProfileIdentifier:", v22);

  return (SFTabStateData *)v3;
}

- (void)updateAncestryWithParentTab:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *ancestorUUIDs;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "ancestorUUIDs");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayByAddingObject:", v5);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  ancestorUUIDs = self->_ancestorUUIDs;
  self->_ancestorUUIDs = v6;

}

- (SFNavigationBarItem)navigationBarItem
{
  SFNavigationBarItem *cachedNavigationBarItem;
  SFNavigationBarItem *v4;
  SFNavigationBarItem *v5;

  cachedNavigationBarItem = self->_cachedNavigationBarItem;
  if (!cachedNavigationBarItem)
  {
    v4 = (SFNavigationBarItem *)objc_alloc_init(MEMORY[0x1E0D4ECD8]);
    v5 = self->_cachedNavigationBarItem;
    self->_cachedNavigationBarItem = v4;

    -[HibernatedTab _updateNavigationBarItem](self, "_updateNavigationBarItem");
    cachedNavigationBarItem = self->_cachedNavigationBarItem;
  }
  return cachedNavigationBarItem;
}

- (void)_updateNavigationBarItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  _BOOL8 v13;
  id v14;

  if (-[HibernatedTab isBlank](self, "isBlank"))
  {
    v3 = 0;
  }
  else if (objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari"))
  {
    v3 = 1;
  }
  else
  {
    v3 = 2;
  }
  -[SFNavigationBarItem setLockdownModeAnnotation:](self->_cachedNavigationBarItem, "setLockdownModeAnnotation:", v3);
  -[HibernatedTab urlString](self, "urlString");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSURL safari_isSafariWebExtensionURL](self->_url, "safari_isSafariWebExtensionURL"))
  {

    v14 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultSearchEngineIfPopulatedForPrivateBrowsing:", -[HibernatedTab isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CD5930];
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0CD5930], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__searchEngineControllerDidFinishPopulating_, v7, 0);

  }
  objc_msgSend(v5, "userVisibleQueryFromSearchURL:", self->_url);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((-[NSURL safari_isDataURL](self->_url, "safari_isDataURL") & 1) != 0)
  {
    v11 = CFSTR("data:");
  }
  else
  {
    if (v9)
      v12 = v9;
    else
      v12 = v10;
    v11 = v12;
  }
  -[SFNavigationBarItem setText:textWhenExpanded:startIndex:](self->_cachedNavigationBarItem, "setText:textWhenExpanded:startIndex:", v11, 0, 0x7FFFFFFFFFFFFFFFLL);
  -[SFNavigationBarItem setShowsPageFormatButton:](self->_cachedNavigationBarItem, "setShowsPageFormatButton:", self->_url != 0);
  v13 = v11 == v9 || self->_url == 0;
  -[SFNavigationBarItem setShowsSearchIndicator:](self->_cachedNavigationBarItem, "setShowsSearchIndicator:", v13);

}

- (void)_searchEngineControllerDidFinishPopulating:(id)a3
{
  id v4;

  -[HibernatedTab _updateNavigationBarItem](self, "_updateNavigationBarItem", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CD5930], 0);

}

- (id)topBarThemeForTabOverviewShowingThemeColor:(BOOL)a3
{
  UIColor *themeColor;
  UIColor *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;

  if (a3)
    themeColor = self->_themeColor;
  else
    themeColor = 0;
  v5 = themeColor;
  -[TabOverviewItem cachedTopBarTheme](self->_tabOverviewItem, "cachedTopBarTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (v9 = objc_msgSend(v8, "barTintStyle"), v9 != objc_msgSend(v6, "tintStyle"))
    || (objc_msgSend(v6, "preferredBarTintColor"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = WBSIsEqual(),
        v10,
        (v11 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0D4EF20], "themeWithBarTintStyle:preferredBarTintColor:controlsTintColor:", objc_msgSend(v8, "barTintStyle"), v5, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    -[TabOverviewItem setCachedTopBarTheme:](self->_tabOverviewItem, "setCachedTopBarTheme:", v12);
    v6 = (void *)v12;
  }

  return v6;
}

- (void)updateUsesDarkTheme
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabCollectionViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateSnapshotForTab:", self);

}

- (void)clearBrowserController
{
  BrowserController **p_browserController;
  id WeakRetained;
  void *v5;

  p_browserController = &self->_browserController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willLoseOwnershipOfTab:", self);

  objc_storeWeak((id *)p_browserController, 0);
}

- (BOOL)isReusableForURL:(id)a3 webClipURL:(id)a4
{
  id v6;
  NSURL *url;
  id v8;
  void *v9;
  char v10;

  v6 = a4;
  url = self->_url;
  v8 = a3;
  -[NSURL _webkit_URLByRemovingFragment](url, "_webkit_URLByRemovingFragment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(url) = objc_msgSend(v9, "isEqual:", v8);

  if ((url & 1) != 0)
  {
    v10 = 1;
  }
  else if (v6)
  {
    v10 = objc_msgSend(v9, "isEqual:", v6);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasBeenInserted
{
  return 0;
}

- (NSArray)tabCollectionItems
{
  UnifiedTabBarItem *unifiedTabBarItem;
  TabOverviewItem *tabOverviewItem;
  void *tabBarItem;
  void *v5;
  TabDocumentCollectionItem *tabCollectionItem;
  TabOverviewItem *v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  unifiedTabBarItem = self->_unifiedTabBarItem;
  tabOverviewItem = self->_tabOverviewItem;
  tabCollectionItem = self->_tabCollectionItem;
  v8 = tabOverviewItem;
  if (unifiedTabBarItem)
  {
    -[HibernatedTab currentUnifiedTabBarItem](self, "currentUnifiedTabBarItem", tabCollectionItem, v8);
    tabBarItem = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    tabBarItem = self->_tabBarItem;
  }
  v9 = tabBarItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &tabCollectionItem, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (unifiedTabBarItem)

  return (NSArray *)v5;
}

- (id)currentUnifiedTabBarItem
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  UnifiedTabBarItem *unifiedTabBarItem;
  UnifiedTabBarItem *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabBarManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "displayMode");

  unifiedTabBarItem = self->_unifiedTabBarItem;
  if (v5 == 2)
  {
    -[UnifiedTabBarItem secondaryItem](unifiedTabBarItem, "secondaryItem");
    v7 = (UnifiedTabBarItem *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = unifiedTabBarItem;
  }
  return v7;
}

- (void)resetTabViewItems
{
  TabDocumentCollectionItem *v3;
  TabDocumentCollectionItem *tabCollectionItem;
  void *v5;
  TabOverviewItem *v6;
  void *v7;
  TabOverviewItem *v8;
  TabOverviewItem *tabOverviewItem;
  id v10;

  v3 = objc_alloc_init(TabDocumentCollectionItem);
  tabCollectionItem = self->_tabCollectionItem;
  self->_tabCollectionItem = v3;

  -[HibernatedTab uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocumentCollectionItem setUUID:](self->_tabCollectionItem, "setUUID:", v5);

  -[TabDocumentCollectionItem setPinned:](self->_tabCollectionItem, "setPinned:", self->_pinned);
  -[TabOverviewItem icon](self->_tabOverviewItem, "icon");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [TabOverviewItem alloc];
  -[HibernatedTab uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TabOverviewItem initWithUUID:](v6, "initWithUUID:", v7);
  tabOverviewItem = self->_tabOverviewItem;
  self->_tabOverviewItem = v8;

  -[TabOverviewItem setPinned:](self->_tabOverviewItem, "setPinned:", self->_pinned);
  -[TabOverviewItem setIcon:](self->_tabOverviewItem, "setIcon:", v10);
  -[HibernatedTab updateTabTitle](self, "updateTabTitle");

}

- (void)_notifyDidUpdateTabCollectionItem
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabCollectionViewProvider", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabCollectionViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HibernatedTab itemForTabCollectionView:](self, "itemForTabCollectionView:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "didUpdateItem:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)itemForTabCollectionView:(id)a3
{
  id v4;
  void *tabOverviewItem;
  int v6;
  UnifiedTabBarItem *unifiedTabBarItem;
  UnifiedTabBarItem *v8;
  UnifiedTabBarItem *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    tabOverviewItem = self->_tabOverviewItem;
LABEL_9:
    v8 = tabOverviewItem;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    tabOverviewItem = self->_tabBarItem;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    tabOverviewItem = self->_tabCollectionItem;
    goto LABEL_9;
  }
  v6 = objc_msgSend(v4, "isStandalone");
  unifiedTabBarItem = self->_unifiedTabBarItem;
  if (v6)
  {
    -[UnifiedTabBarItem secondaryItem](unifiedTabBarItem, "secondaryItem");
    v8 = (UnifiedTabBarItem *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = unifiedTabBarItem;
  }
LABEL_10:
  v9 = v8;

  return v9;
}

- (void)updateTabIconWithDelay:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[HibernatedTab _cancelFaviconUpdate](self, "_cancelFaviconUpdate");
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0C99E88];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HibernatedTab_updateTabIconWithDelay___block_invoke;
  v7[3] = &unk_1E9CF5FD8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_updateFaviconTimer, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __40__HibernatedTab_updateTabIconWithDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateTabIcon");

}

- (void)_cancelFaviconUpdate
{
  NSURL *cachedURLForIconUpdate;
  void *v4;
  id faviconToken;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_updateFaviconTimer);
  if ((objc_msgSend(WeakRetained, "isValid") & 1) != 0 || self->_faviconToken)
  {
    cachedURLForIconUpdate = self->_cachedURLForIconUpdate;
    self->_cachedURLForIconUpdate = 0;

  }
  objc_msgSend(WeakRetained, "invalidate");
  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequestWithToken:", self->_faviconToken);

  faviconToken = self->_faviconToken;
  self->_faviconToken = 0;

}

- (void)updateTabIcon
{
  NSURL **p_cachedURLForIconUpdate;
  NSURL *url;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id faviconToken;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  p_cachedURLForIconUpdate = &self->_cachedURLForIconUpdate;
  if ((-[NSURL isEqual:](self->_url, "isEqual:", self->_cachedURLForIconUpdate) & 1) == 0)
  {
    -[HibernatedTab _cancelFaviconUpdate](self, "_cancelFaviconUpdate");
    objc_storeStrong((id *)p_cachedURLForIconUpdate, self->_url);
    url = self->_url;
    if (!url)
    {
      objc_msgSend(MEMORY[0x1E0D4EF58], "favoritesFavicon");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    -[NSURL absoluteString](url, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("about:blank"));

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D4EF58], "fallbackFavicon");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v15 = (id)v7;
      -[HibernatedTab _setIcon:isMonogram:](self, "_setIcon:isMonogram:", v7, 0);
LABEL_7:

      return;
    }
    if (-[NSURL safari_isSafariWebExtensionURL](self->_url, "safari_isSafariWebExtensionURL"))
    {
      -[HibernatedTab webExtensionsController](self, "webExtensionsController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL host](self->_url, "host");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "webExtensionForBaseURIHost:", v9);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "icon");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HibernatedTab _setIcon:isMonogram:](self, "_setIcon:isMonogram:", v10, 0);

      goto LABEL_7;
    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A8E8]), "initWithURL:iconSize:fallbackType:", self->_url, 2, +[TabIconAndTitleView defaultTabIconSize]());
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __30__HibernatedTab_updateTabIcon__block_invoke;
    v16[3] = &unk_1E9CF2DE8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v12, "registerRequest:priority:responseHandler:", v11, 2, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    faviconToken = self->_faviconToken;
    self->_faviconToken = v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

void __30__HibernatedTab_updateTabIcon__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = v9;
    objc_msgSend(v4, "favicon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "browserController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tabBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v5, "sf_registerFaviconForDarkUserInterfaceStyle");
    objc_msgSend(WeakRetained, "_setIcon:isMonogram:", v5, objc_msgSend(v4, "faviconType") == 0);

  }
}

- (void)_setIcon:(id)a3 isMonogram:(BOOL)a4
{
  _BOOL4 v4;
  TabBarItem *tabBarItem;
  id v7;
  id v8;

  v4 = a4;
  tabBarItem = self->_tabBarItem;
  v8 = a3;
  -[TabBarItem setIcon:](tabBarItem, "setIcon:", v8);
  -[UnifiedTabBarItem setIcon:](self->_unifiedTabBarItem, "setIcon:", v8);
  if (v4)
    v7 = 0;
  else
    v7 = v8;
  -[TabOverviewItem setIcon:](self->_tabOverviewItem, "setIcon:", v7);
  -[TabDocumentCollectionItem setIcon:](self->_tabCollectionItem, "setIcon:", v7);

}

- (void)updateTabTitle
{
  void *v3;
  id v4;

  -[TabDocumentCollectionItem title](self->_tabCollectionItem, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HibernatedTab titleForTabCollection](self, "titleForTabCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabBarItem setTitle:](self->_tabBarItem, "setTitle:", v3);
  -[UnifiedTabBarItem setTitle:](self->_unifiedTabBarItem, "setTitle:", v3);
  -[TabOverviewItem setTitle:](self->_tabOverviewItem, "setTitle:", v3);
  -[TabDocumentCollectionItem setTitle:](self->_tabCollectionItem, "setTitle:", v3);
  if ((WBSIsEqual() & 1) == 0)
    -[HibernatedTab _notifyDidUpdateTabCollectionItem](self, "_notifyDidUpdateTabCollectionItem");

}

- (void)setUnread:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  if (self->_unread != a3)
  {
    v3 = a3;
    self->_unread = a3;
    -[TabBarItem setUnread:](self->_tabBarItem, "setUnread:");
    -[SFUnifiedTabBarItem setUnread:](self->_unifiedTabBarItem, "setUnread:", v3);
    -[TabOverviewItem setUnread:](self->_tabOverviewItem, "setUnread:", v3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "updateTabOverviewButton");

  }
}

- (void)setShareParticipants:(id)a3
{
  NSArray *v4;
  NSArray *shareParticipants;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_shareParticipants, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    shareParticipants = self->_shareParticipants;
    self->_shareParticipants = v4;

    -[TabBarItem setShareParticipants:](self->_tabBarItem, "setShareParticipants:", v6);
    -[SFUnifiedTabBarItem setShareParticipants:](self->_unifiedTabBarItem, "setShareParticipants:", v6);
    -[TabOverviewItem setShareParticipants:](self->_tabOverviewItem, "setShareParticipants:", v6);
  }

}

- (id)readingListAddress
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  -[WBTab localAttributes](self->_wbTab, "localAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "readingListBookmarkID");

  if (-[NSURL isFileURL](self->_url, "isFileURL"))
    v5 = (_DWORD)v4 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bookmarkWithID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)urlString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HibernatedTab readingListAddress](self, "readingListAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NSURL safari_userVisibleStringConsideringLongURLs](self->_url, "safari_userVisibleStringConsideringLongURLs");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (NSString)addressForNewBookmark
{
  void *v2;
  void *v3;

  -[HibernatedTab urlForSharing](self, "urlForSharing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_originalDataAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)urlForCloudTab
{
  void *v3;
  NSURL *v4;

  if (-[NSURL isFileURL](self->_url, "isFileURL"))
  {
    -[HibernatedTab urlString](self, "urlString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_bestURLForUserTypedString");
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_url;
  }
  return v4;
}

- (NSURL)urlForSharing
{
  void *v3;
  NSURL *v4;
  NSURL *v5;
  void *v6;

  -[HibernatedTab readingListAddress](self, "readingListAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_url;
  }
  v5 = v4;
  -[HibernatedTab titleForSharing](self, "titleForSharing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[NSURL _setTitle:](v5, "_setTitle:", v6);

  return v5;
}

- (LPLinkMetadata)linkMetadataForSharing
{
  return 0;
}

- (id)urlForStatePersisting
{
  _BOOL4 hasDeferredNavigation;
  NSURL *url;
  NSURL *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  hasDeferredNavigation = self->_hasDeferredNavigation;
  url = self->_url;
  if (hasDeferredNavigation)
  {
    v5 = url;
  }
  else
  {
    if (-[NSURL safari_isSafariWebExtensionURL](url, "safari_isSafariWebExtensionURL"))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      +[Application sharedApplication](Application, "sharedApplication", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allWebExtensionsControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "_persistentStateURLForExtensionURL:", self->_url);
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v13 = (void *)v12;

              return v13;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
    v5 = self->_url;
  }
  v13 = v5;
  return v13;
}

- (NSString)title
{
  return (NSString *)-[HibernatedTab _titleAllowURLStringFallback:allowUntitled:](self, "_titleAllowURLStringFallback:allowUntitled:", 0, 1);
}

- (NSString)titleForNewBookmark
{
  return (NSString *)-[HibernatedTab _titleAllowURLStringFallback:allowUntitled:](self, "_titleAllowURLStringFallback:allowUntitled:", 0, 0);
}

- (id)titleForCloudTab
{
  return -[HibernatedTab _titleAllowURLStringFallback:allowUntitled:](self, "_titleAllowURLStringFallback:allowUntitled:", 1, 1);
}

- (id)titleForTabCollection
{
  void *v3;
  char v4;
  void *v5;

  -[WBTab localAttributes](self->_wbTab, "localAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDisplayingStandaloneImage");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[HibernatedTab _titleAllowURLStringFallback:allowUntitled:](self, "_titleAllowURLStringFallback:allowUntitled:", 1, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)titleForSharing
{
  if (self->_showingErrorPage)
    return 0;
  -[HibernatedTab _titleAllowURLStringFallback:allowUntitled:](self, "_titleAllowURLStringFallback:allowUntitled:", 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_titleForStatePersistingForTabGroupTab
{
  void *v3;
  NSURL *url;
  uint64_t v5;
  id v6;

  -[HibernatedTab _titleAllowURLStringFallback:allowUntitled:](self, "_titleAllowURLStringFallback:allowUntitled:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    url = self->_url;
    if (url)
      -[NSURL safari_userVisibleHostWithoutWWWSubdomain](url, "safari_userVisibleHostWithoutWWWSubdomain");
    else
      _WBSLocalizedString();
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  v6 = v3;

  return v6;
}

- (id)_titleForStatePersistingForTabStateData
{
  NSString *title;
  NSString *v3;
  void *v4;
  void *v5;

  title = self->_title;
  if (self->_hasDeferredNavigation)
  {
    v3 = title;
  }
  else
  {
    if (title)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "safari_lockRelatedEmojiCharacterSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString safari_stringByRemovingCharactersInSet:](title, "safari_stringByRemovingCharactersInSet:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
    -[HibernatedTab _titleAllowURLStringFallback:allowUntitled:](self, "_titleAllowURLStringFallback:allowUntitled:", 1, 0);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  return v4;
}

- (id)_titleAllowURLStringFallback:(BOOL)a3 allowUntitled:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSString *v7;
  __CFString *v8;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  if (-[NSString length](self->_title, "length"))
  {
    v7 = self->_title;
  }
  else
  {
    if (v5)
    {
      -[HibernatedTab urlString](self, "urlString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[HibernatedTab urlString](self, "urlString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 1, 0);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

        return v8;
      }
    }
    if (!v4)
    {
      v8 = &stru_1E9CFDBB0;
      return v8;
    }
    _WBSLocalizedString();
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v8 = (__CFString *)v7;
  return v8;
}

- (NSURL)committedURL
{
  return 0;
}

- (BOOL)isLoading
{
  return 0;
}

- (NSArray)ancestorTabIdentifiers
{
  return (NSArray *)-[NSArray safari_mapObjectsUsingBlock:](self->_ancestorUUIDs, "safari_mapObjectsUsingBlock:", &__block_literal_global_51_0);
}

uint64_t __39__HibernatedTab_ancestorTabIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (NSString)windowIdentifier
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isPinnedTab
{
  return -[WBTab isPinned](self->_wbTab, "isPinned");
}

- (double)lastActivationTime
{
  return self->_lastViewedTime;
}

- (SFWebExtensionsController)webExtensionsController
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  +[Application sharedApplication](Application, "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HibernatedTab isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled");
  -[HibernatedTab profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webExtensionsControllerForTabWithPrivateBrowsingEnabled:profile:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFWebExtensionsController *)v6;
}

- (WKWebView)webViewForExtensions
{
  return 0;
}

- (id)webViewsThatCanReceiveMessages
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (double)parentTabIDForWebExtensions
{
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  double v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originatingTabForTab:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "idForWebExtensions");
    v7 = v6;
  }
  else
  {
    v7 = *MEMORY[0x1E0D8B728];
  }

  return v7;
}

- (NSURL)urlForExtensions
{
  return self->_url;
}

- (NSURL)expectedOrCurrentURL
{
  return 0;
}

- (NSURL)pendingURLForWebExtensions
{
  return 0;
}

- (BOOL)isLoadingComplete
{
  return 1;
}

- (BOOL)isAudible
{
  return 0;
}

- (BOOL)isMuted
{
  return 0;
}

- (BOOL)isFrontmost
{
  return 0;
}

- (BOOL)isArticle
{
  return 0;
}

- (BOOL)isInReaderMode
{
  return 0;
}

- (CGSize)tabViewSize
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "webExtensionTabSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (WBSWebExtensionWindow)webExtensionWindow
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "webExtensionWindowForTab:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSWebExtensionWindow *)v4;
}

- (WBProfile)profile
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "effectiveProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBProfile *)v3;
}

- (unint64_t)changedPropertiesForOnUpdatedWebExtensionEvent
{
  return 0;
}

- (double)zoomFactor
{
  return 1.0;
}

- (void)close
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closeTab:animated:", self, 1);

  objc_msgSend(MEMORY[0x1E0D8AC68], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTabNeedsSpotlightDeletion:", self);

}

- (void)select
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActiveTab:", self);

}

- (WBSTranslationContext)translationContext
{
  return 0;
}

- (unint64_t)indexInWindowForWebExtensionContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[HibernatedTab webExtensionWindow](self, "webExtensionWindow", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "webExtensionTabs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", self);

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)parentTabForWebExtensionContext:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originatingTabForTab:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)pinForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HibernatedTab setPinned:](self, "setPinned:", 1);
  v5[2](v5, 0);

}

- (void)unpinForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HibernatedTab setPinned:](self, "setPinned:", 0);
  v5[2](v5, 0);

}

- (void)toggleReaderModeForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HibernatedTab toggleReader](self, "toggleReader");
  v5[2](v5, 0);

}

- (void)muteForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HibernatedTab mute](self, "mute");
  v5[2](v5, 0);

}

- (void)unmuteForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HibernatedTab unmute](self, "unmute");
  v5[2](v5, 0);

}

- (void)detectWebpageLocaleForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)loadURL:(id)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a5;
  -[HibernatedTab loadURL:](self, "loadURL:", a3);
  v7[2](v7, 0);

}

- (void)reloadForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HibernatedTab reload](self, "reload");
  v5[2](v5, 0);

}

- (void)reloadFromOriginForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HibernatedTab reloadFromOrigin](self, "reloadFromOrigin");
  v5[2](v5, 0);

}

- (void)goBackForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HibernatedTab goBack](self, "goBack");
  v5[2](v5, 0);

}

- (void)goForwardForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HibernatedTab goForward](self, "goForward");
  v5[2](v5, 0);

}

- (void)activateForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HibernatedTab select](self, "select");
  v5[2](v5, 0);

}

- (void)selectForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HibernatedTab select](self, "select");
  v5[2](v5, 0);

}

- (void)closeForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HibernatedTab close](self, "close");
  v5[2](v5, 0);

}

- (WBSSiriIntelligenceDonorTabData)tabDataForSpotlightDonation
{
  return (WBSSiriIntelligenceDonorTabData *)objc_alloc_init(MEMORY[0x1E0D8AC80]);
}

- (NSArray)ancestorUUIDs
{
  return self->_ancestorUUIDs;
}

- (BrowserController)browserController
{
  return (BrowserController *)objc_loadWeakRetained((id *)&self->_browserController);
}

- (BOOL)isClosed
{
  return self->_closed;
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (double)lastViewedTime
{
  return self->_lastViewedTime;
}

- (void)setLastViewedTime:(double)a3
{
  self->_lastViewedTime = a3;
}

- (WBTab)wbTab
{
  return self->_wbTab;
}

- (void)setWBTab:(id)a3
{
  objc_storeStrong((id *)&self->_wbTab, a3);
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (NSString)pinnedTitle
{
  return self->_pinnedTitle;
}

- (void)setPinnedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSURL)pinnedURL
{
  return self->_pinnedURL;
}

- (void)setPinnedURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (TabBarItem)tabBarItem
{
  return self->_tabBarItem;
}

- (TabOverviewItem)tabOverviewItem
{
  return self->_tabOverviewItem;
}

- (UnifiedTabBarItem)unifiedTabBarItem
{
  return self->_unifiedTabBarItem;
}

- (TabDocumentCollectionItem)tabCollectionItem
{
  return self->_tabCollectionItem;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)shouldSelectOriginatingTabWhenClosed
{
  return self->_shouldSelectOriginatingTabWhenClosed;
}

- (NSString)lastSearchTerm
{
  return self->_lastSearchTerm;
}

- (void)setLastSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)matchedLastSearch
{
  return self->_matchedLastSearch;
}

- (void)setMatchedLastSearch:(BOOL)a3
{
  self->_matchedLastSearch = a3;
}

- (NSString)titleForLastSearch
{
  return self->_titleForLastSearch;
}

- (void)setTitleForLastSearch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)titleWords
{
  return self->_titleWords;
}

- (void)setTitleWords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSArray)URLStringComponents
{
  return self->_URLStringComponents;
}

- (void)setURLStringComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)URLStringForLastSearch
{
  return self->_URLStringForLastSearch;
}

- (void)setURLStringForLastSearch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)suppressWebExtensionEvents
{
  return self->_suppressWebExtensionEvents;
}

- (void)setSuppressWebExtensionEvents:(BOOL)a3
{
  self->_suppressWebExtensionEvents = a3;
}

- (double)idForWebExtensions
{
  return self->_idForWebExtensions;
}

- (WBSWebExtensionTabPosition)previousWebExtensionTabPosition
{
  return self->_previousWebExtensionTabPosition;
}

- (void)setPreviousWebExtensionTabPosition:(id)a3
{
  objc_storeStrong((id *)&self->_previousWebExtensionTabPosition, a3);
}

- (SFNavigationBarItem)cachedNavigationBarItem
{
  return self->_cachedNavigationBarItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedNavigationBarItem, 0);
  objc_storeStrong((id *)&self->_previousWebExtensionTabPosition, 0);
  objc_storeStrong((id *)&self->_URLStringForLastSearch, 0);
  objc_storeStrong((id *)&self->_URLStringComponents, 0);
  objc_storeStrong((id *)&self->_titleWords, 0);
  objc_storeStrong((id *)&self->_titleForLastSearch, 0);
  objc_storeStrong((id *)&self->_lastSearchTerm, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_tabCollectionItem, 0);
  objc_storeStrong((id *)&self->_unifiedTabBarItem, 0);
  objc_storeStrong((id *)&self->_tabOverviewItem, 0);
  objc_storeStrong((id *)&self->_tabBarItem, 0);
  objc_storeStrong((id *)&self->_pinnedURL, 0);
  objc_storeStrong((id *)&self->_pinnedTitle, 0);
  objc_storeStrong((id *)&self->_wbTab, 0);
  objc_destroyWeak((id *)&self->_browserController);
  objc_storeStrong((id *)&self->_ancestorUUIDs, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_destroyWeak((id *)&self->_updateFaviconTimer);
  objc_storeStrong(&self->_faviconToken, 0);
  objc_storeStrong((id *)&self->_cachedURLForIconUpdate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
