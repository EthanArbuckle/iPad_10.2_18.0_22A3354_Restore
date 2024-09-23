@implementation DSSharingPermissionsController

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSSharingPermissions");
    v3 = (void *)DSLogSharingPermissions;
    DSLogSharingPermissions = (uint64_t)v2;

  }
}

- (DSSharingPermissionsController)init
{
  DSSharingPermissionsController *v2;
  id v3;
  dispatch_queue_t v4;
  id v5;
  NSMutableSet *v6;
  NSMutableSet *selectedPeople;
  NSMutableSet *v8;
  NSMutableSet *selectedTypes;
  uint64_t v10;
  NSMutableDictionary *personIconCache;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)DSSharingPermissionsController;
  v2 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](&v17, sel_initWithTitle_detailText_icon_shouldShowSearchBar_, &stru_24EFF4790, &stru_24EFF4790, 0, 1);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE2CC78]);
    -[DSSharingPermissionsController setPermissions:](v2, "setPermissions:", v3);

    v4 = dispatch_queue_create("SharingPermissionsControllerWork", 0);
    -[DSSharingPermissionsController setWorkQueue:](v2, "setWorkQueue:", v4);

    v5 = objc_alloc_init(MEMORY[0x24BE2CC88]);
    -[DSSharingPermissionsController setRepo:](v2, "setRepo:", v5);

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    selectedPeople = v2->_selectedPeople;
    v2->_selectedPeople = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    selectedTypes = v2->_selectedTypes;
    v2->_selectedTypes = v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    personIconCache = v2->_personIconCache;
    v2->_personIconCache = (NSMutableDictionary *)v10;

    DSUILocStringForKey(CFSTR("SKIP"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", v2, v12, v2, sel__pushNextPane);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setBoldButton:](v2, "setBoldButton:", v13);

    DSUILocStringForKey(CFSTR("STOP_ALL_SHARING"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", v2, v14, v2, sel_stopAllSharing);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setLinkButton:](v2, "setLinkButton:", v15);

  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DSSharingPermissionsController;
  -[OBTableWelcomeController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[DSSharingPermissionsController registerForNotifications](self, "registerForNotifications");
  -[DSSharingPermissionsController setFetchNeeded](self, "setFetchNeeded");
  -[DSSharingPermissionsController _updateButton](self, "_updateButton");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DSSharingPermissionsController;
  -[OBBaseWelcomeController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[DSSharingPermissionsController cachedFetchError](self, "cachedFetchError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DSSharingPermissionsController cachedFetchError](self, "cachedFetchError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissionsController presentFetchErrorMessage:](self, "presentFetchErrorMessage:", v5);

    -[DSSharingPermissionsController setCachedFetchError:](self, "setCachedFetchError:", 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[DSSharingPermissionsController postAnalytics](self, "postAnalytics");
  -[DSSharingPermissionsController unregisterForNotifications](self, "unregisterForNotifications");
  v5.receiver = self;
  v5.super_class = (Class)DSSharingPermissionsController;
  -[DSSharingPermissionsController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)postAnalytics
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[DSSharingPermissionsController permissions](self, "permissions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elapsedUnfinishedFetchesBySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = v4;
        AnalyticsSendEventLazy();

      }
      v6 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v12, v16, 16, v8, 3221225472, __47__DSSharingPermissionsController_postAnalytics__block_invoke, &unk_24EFF3620, v11);
    }
    while (v6);
  }

}

id __47__DSSharingPermissionsController_postAnalytics__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v6[0] = CFSTR("sourceName");
  v6[1] = CFSTR("elapsedTime");
  v7[0] = v2;
  objc_msgSend(v1, "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)registerForNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_setUrgentFetchNeeded, *MEMORY[0x24BEBE008], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_didEnterBackground, *MEMORY[0x24BEBDF98], 0);

}

- (void)unregisterForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)setFetchNeeded
{
  -[DSSharingPermissionsController requestNewFetchImmediately:](self, "requestNewFetchImmediately:", 0);
}

- (void)setUrgentFetchNeeded
{
  -[DSSharingPermissionsController requestNewFetchImmediately:](self, "requestNewFetchImmediately:", 1);
}

- (void)requestNewFetchImmediately:(BOOL)a3
{
  int *p_fetchState;

  p_fetchState = &self->_fetchState;
  while (!__ldaxr((unsigned int *)p_fetchState))
  {
    if (!__stlxr(1u, (unsigned int *)p_fetchState))
    {
      if (!a3)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  __clrex();
  if (a3)
  {
LABEL_5:
    -[DSSharingPermissionsController setFetchCompletedTime:](self, "setFetchCompletedTime:", 0);
    -[DSSharingPermissionsController setCachedFetchError:](self, "setCachedFetchError:", 0);
  }
LABEL_6:
  -[DSSharingPermissionsController fetchSharingPermissions](self, "fetchSharingPermissions");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)DSSharingPermissionsController;
  -[DSTableWelcomeController viewDidLoad](&v11, sel_viewDidLoad);
  DSUILocStringForKey(CFSTR("BY_PERSON"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  DSUILocStringForKey(CFSTR("BY_TYPE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController searchController](self, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScopeButtonTitles:", v5);

  DSUILocStringForKey(CFSTR("SEARCH_SHARING_PEOPLE_PLACEHOLDER"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController searchController](self, "searchController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPlaceholder:", v8);

}

- (void)fetchSharingPermissions
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134349312;
  v4 = a1;
  v5 = 2050;
  v6 = a2;
  _os_log_fault_impl(&dword_2278DF000, log, OS_LOG_TYPE_FAULT, "mach_continuous_time walked backwards (now: %{public}llu, then: %{public}llu)", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0_0();
}

void __57__DSSharingPermissionsController_fetchSharingPermissions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__DSSharingPermissionsController_fetchSharingPermissions__block_invoke_2;
  v5[3] = &unk_24EFF3708;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __57__DSSharingPermissionsController_fetchSharingPermissions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchCompletedWithError:", *(_QWORD *)(a1 + 32));

}

- (void)_fetchCompletedWithError:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  atomic_store(0, (unsigned int *)&self->_fetchState);
  -[DSSharingPermissionsController setFetchCompletedTime:](self, "setFetchCompletedTime:", clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW));
  -[DSTableWelcomeController stopContentSpinner](self, "stopContentSpinner");
  if (v6)
    -[DSSharingPermissionsController presentFetchErrorMessage:](self, "presentFetchErrorMessage:", v6);
  -[DSSharingPermissionsController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[DSSharingPermissionsController permissions](self, "permissions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFetchedSharingPermissions:", v5);

  }
  -[DSSharingPermissionsController reloadTableViewData](self, "reloadTableViewData");

}

- (void)presentFetchErrorMessage:(id)a3
{
  id v4;
  void *v5;
  DSSharingPermissionsController *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  -[DSSharingPermissionsController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleViewController");
  v6 = (DSSharingPermissionsController *)objc_claimAutoreleasedReturnValue();

  v7 = DSLogSharingPermissions;
  if (v6 == self)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_ERROR))
      -[DSSharingPermissionsController presentFetchErrorMessage:].cold.1((uint64_t)v4, v7);
    objc_msgSend(MEMORY[0x24BEBD3B0], "ds_alertControllerWithFetchSharingError:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController presentErrorAlertController:](self, "presentErrorAlertController:", v8);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2278DF000, v7, OS_LOG_TYPE_INFO, "Caching fetch error until we are the visible view controller", v9, 2u);
    }
    -[DSSharingPermissionsController setCachedFetchError:](self, "setCachedFetchError:", v4);
  }

}

- (void)reloadTableViewData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[DSSharingPermissionsController permissions](self, "permissions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sort");

  -[DSSharingPermissionsController permissions](self, "permissions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController setIsModelEmpty:](self, "setIsModelEmpty:", objc_msgSend(v4, "peopleCountWithFilter:", 0) == 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSections:withRowAnimation:", v6, 100);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[DSSharingPermissionsController selectedPeople](self, "selectedPeople");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  -[DSSharingPermissionsController permissions](self, "permissions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allPeople");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intersectSet:", v12);

  -[DSSharingPermissionsController selectedTypes](self, "selectedTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDBCF20];
  -[DSSharingPermissionsController permissions](self, "permissions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allSharingTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "intersectSet:", v17);

  -[DSSharingPermissionsController _updateButton](self, "_updateButton");
}

- (BOOL)isFindMyASource
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[DSSharingPermissionsController permissions](self, "permissions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSharingTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x24BE2CC28];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "source");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v7);

        if ((v11 & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)stopAllSharing
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  DSUILocStringForKey(CFSTR("STOP_ALL_SHARING_CONFIRMATION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DSSharingPermissionsController isFindMyASource](self, "isFindMyASource"))
  {
    v15[0] = v3;
    DSUILocStringForKey(CFSTR("FIND_MY_NOTIFICATION_WARNING"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CANCEL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, &__block_literal_global_2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("STOP_ALL_SHARING_BY_TYPE_ALERT_LABEL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __48__DSSharingPermissionsController_stopAllSharing__block_invoke_2;
  v14[3] = &unk_24EFF3418;
  v14[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 2, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v13);
  objc_msgSend(v7, "addAction:", v10);
  -[DSSharingPermissionsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

void __48__DSSharingPermissionsController_stopAllSharing__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showButtonsBusy");

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "permissions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__DSSharingPermissionsController_stopAllSharing__block_invoke_3;
  v7[3] = &unk_24EFF34C8;
  objc_copyWeak(&v8, &location);
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "stopAllSharingOnQueue:completion:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __48__DSSharingPermissionsController_stopAllSharing__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  void *v31;
  _QWORD block[6];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v27 = a3;
  v28 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "permissions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allPeople");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v8)
  {
    v9 = v8;
    v30 = *(_QWORD *)v43;
    do
    {
      v10 = 0;
      do
      {
        v11 = WeakRetained;
        if (*(_QWORD *)v43 != v30)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x24BDBCEF0], "set", v27, v28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v14 = v31;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v39;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v39 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v18), "sharedResourcesForSourceName:", v12);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "unionSet:", v19);

              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          }
          while (v16);
        }

        WeakRetained = v11;
        objc_msgSend(v11, "addUnsharedSource:resources:", v12, v13);

        ++v10;
      }
      while (v10 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v9);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = v31;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v24), "displayName", v27, v28);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "addUnsharedPerson:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v22);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__DSSharingPermissionsController_stopAllSharing__block_invoke_4;
  block[3] = &unk_24EFF3778;
  block[4] = *(_QWORD *)(v28 + 32);
  block[5] = WeakRetained;
  v33 = v27;
  v26 = v27;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __48__DSSharingPermissionsController_stopAllSharing__block_invoke_4(id *a1)
{
  void *v2;
  id v3;

  objc_msgSend(a1[4], "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showButtonsAvailable");

  objc_msgSend(a1[5], "reloadTableViewData");
  if (objc_msgSend(a1[6], "count"))
  {
    objc_msgSend(MEMORY[0x24BE2CC68], "errorWithCode:underlyingErrors:", 2, a1[6]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "stopSharingFailedWithError:", v3);

  }
  else
  {
    objc_msgSend(a1[5], "_pushNextPane");
  }
}

- (void)reviewSelectedSharing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_257);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSTableWelcomeController searchController](self, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selectedScopeButtonIndex");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 1)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = v5;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          -[DSSharingPermissionsController sharingTypeForIndexPath:](self, "sharingTypeForIndexPath:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22), (_QWORD)v26);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend(v10, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v20);
    }

    if (objc_msgSend(v10, "count"))
    {
      +[DSSharingPermissionsDetailController detailControllerWithSharingTypes:startingViewController:delegate:](DSSharingPermissionsDetailController, "detailControllerWithSharingTypes:startingViewController:delegate:", v10, self, self);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
  }
  else if (!v8)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          -[DSSharingPermissionsController personForIndexPath:](self, "personForIndexPath:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v15));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v9, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v9, "count"))
    {
      +[DSSharingPermissionsDetailController detailControllerWithPeople:startingViewController:delegate:](DSSharingPermissionsDetailController, "detailControllerWithPeople:startingViewController:delegate:", v9, self, self);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v24 = (void *)v17;
      -[DSSharingPermissionsController navigationController](self, "navigationController", (_QWORD)v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pushViewController:animated:", v24, 1);

    }
  }

}

uint64_t __55__DSSharingPermissionsController_reviewSelectedSharing__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "row");
  if (v6 >= objc_msgSend(v5, "row"))
  {
    v8 = objc_msgSend(v4, "row");
    v7 = v8 > objc_msgSend(v5, "row");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (id)personForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[DSSharingPermissionsController permissions](self, "permissions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "person:withFilter:", v6, -[DSTableWelcomeController isFiltering](self, "isFiltering"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sharingTypeForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[DSSharingPermissionsController permissions](self, "permissions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "sharingType:withFilter:", v6, -[DSTableWelcomeController isFiltering](self, "isFiltering"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableIconForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DSSharingPermissionsController personIconCache](self, "personIconCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v4, "iconForTable");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSSharingPermissionsController personIconCache](self, "personIconCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

    }
    v10 = v8;

  }
  else
  {
    objc_msgSend(v4, "iconForTable");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "searchBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsController filterContentForSearchText:category:](self, "filterContentForSearchText:category:", v4, objc_msgSend(v6, "selectedScopeButtonIndex"));

}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  if (a4 == 1)
  {
    DSUILocStringForKey(CFSTR("SHARING_PERMISSIONS_BY_TYPE_DETAIL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("SHARING_PERMISSIONS_INFORMATION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("SEARCH_SHARING_INFORMATION_PLACEHOLDER");
  }
  else
  {
    if (a4)
    {
      v6 = 0;
      v7 = 0;
      goto LABEL_7;
    }
    DSUILocStringForKey(CFSTR("SHARING_PERMISSIONS_BY_PEOPLE_DETAIL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("SHARING_PERMISSIONS_PEOPLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("SEARCH_SHARING_PEOPLE_PLACEHOLDER");
  }
  DSUILocStringForKey(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController searchController](self, "searchController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlaceholder:", v9);

LABEL_7:
  -[DSSharingPermissionsController headerView](self, "headerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v7);

  -[DSSharingPermissionsController headerView](self, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDetailText:", v6);

  -[DSTableWelcomeController searchController](self, "searchController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsController filterContentForSearchText:category:](self, "filterContentForSearchText:category:", v16, a4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutIfNeeded");

}

- (void)filterContentForSearchText:(id)a3 category:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("displayName contains[c] %@"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissionsController permissions](self, "permissions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filterSharingTypesWithPredicate:", v12);
LABEL_5:

    if (v12)
      goto LABEL_9;
    goto LABEL_6;
  }
  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("displayName contains[c] %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1758];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __70__DSSharingPermissionsController_filterContentForSearchText_category___block_invoke;
    v18[3] = &unk_24EFF37E0;
    v19 = v6;
    objc_msgSend(v8, "predicateWithBlock:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD14C0];
    v20[0] = v7;
    v20[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "orPredicateWithSubpredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[DSSharingPermissionsController permissions](self, "permissions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filterPeopleWithPredicate:", v12);

    goto LABEL_5;
  }
LABEL_6:
  v14 = DSLogSharingPermissions;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
    -[DSSharingPermissionsController filterContentForSearchText:category:].cold.1(a4, v14);
  v12 = 0;
LABEL_9:
  -[DSSharingPermissionsController headerView](self, "headerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", &stru_24EFF4790);

  -[DSSharingPermissionsController headerView](self, "headerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDetailText:", &stru_24EFF4790);

  -[OBTableWelcomeController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reloadData");

  -[DSSharingPermissionsController _updateButton](self, "_updateButton");
}

uint64_t __70__DSSharingPermissionsController_filterContentForSearchText_category___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticGivenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneticMiddleName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "contact");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "phoneticFamilyName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v10, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32));

    }
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a4;
  -[DSTableWelcomeController searchController](self, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selectedScopeButtonIndex");

  if (v8 == 1)
  {
    -[DSSharingPermissionsController sharingTypeForIndexPath:](self, "sharingTypeForIndexPath:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedDetailText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconForTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissionsController selectedTypes](self, "selectedTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v9);

    if (!v16)
      goto LABEL_7;
LABEL_6:
    -[OBTableWelcomeController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectRowAtIndexPath:animated:scrollPosition:", v5, 1, 0);

    goto LABEL_7;
  }
  if (v8)
  {
    v12 = 0;
    v11 = 0;
    v10 = 0;
    goto LABEL_9;
  }
  -[DSSharingPermissionsController personForIndexPath:](self, "personForIndexPath:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedDetail");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsController tableIconForPerson:](self, "tableIconForPerson:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsController selectedPeople](self, "selectedPeople");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v9);

  if ((v14 & 1) != 0)
    goto LABEL_6;
LABEL_7:

LABEL_9:
  -[OBTableWelcomeController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSIconTableViewCell iconTableViewCellFromTableView:withText:detail:icon:](DSIconTableViewCell, "iconTableViewCellFromTableView:withText:detail:icon:", v18, v10, v11, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setAccessoryType:", 0);
  return v19;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  signed int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = atomic_load((unsigned int *)&self->_fetchState);
  if ((unint64_t)(v6 - 1) < 2)
    goto LABEL_11;
  -[DSTableWelcomeController searchController](self, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "selectedScopeButtonIndex");

  if (v9 == 1)
  {
    -[DSSharingPermissionsController permissions](self, "permissions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "sharingTypesCountWithFilter:", -[DSTableWelcomeController isFiltering](self, "isFiltering"));
    goto LABEL_6;
  }
  if (!v9)
  {
    -[DSSharingPermissionsController permissions](self, "permissions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "peopleCountWithFilter:", -[DSTableWelcomeController isFiltering](self, "isFiltering"));
LABEL_6:
    v12 = v11;

    if (-[DSTableWelcomeController isFiltering](self, "isFiltering"))
    {
      if (v12)
      {
        -[DSTableWelcomeController hideNoResultsView](self, "hideNoResultsView");
        goto LABEL_12;
      }
      goto LABEL_10;
    }
    if (v12)
    {
      -[DSTableWelcomeController hideNoSharingView](self, "hideNoSharingView");
      -[DSTableWelcomeController setIsModelEmpty:](self, "setIsModelEmpty:", 0);
      -[DSSharingPermissionsController _updateTitle](self, "_updateTitle");
      -[DSSharingPermissionsController _updateButton](self, "_updateButton");
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  if (-[DSTableWelcomeController isFiltering](self, "isFiltering"))
  {
LABEL_10:
    -[DSTableWelcomeController searchController](self, "searchController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController showNoResultsViewWithSearchText:](self, "showNoResultsViewWithSearchText:", v15);

LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
LABEL_15:
  v35 = v5;
  v17 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[DSSharingPermissionsController repo](self, "repo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sources");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)MEMORY[0x24BE2CC80];
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sourceDescriptorForSource:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedAppName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "addObject:", v27);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v21);
  }

  v28 = (void *)MEMORY[0x24BDD1640];
  objc_msgSend(v17, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringByJoiningStrings:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x24BDD17C8];
  DSUILocStringForKey(CFSTR("NO_SHARING_INFORMATION"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringWithFormat:", v32, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("person.3.fill"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController showNoSharingViewWithText:image:](self, "showNoSharingViewWithText:image:", v33, v34);

  -[DSTableWelcomeController setIsModelEmpty:](self, "setIsModelEmpty:", 1);
  -[DSSharingPermissionsController _updateButton](self, "_updateButton");

  v12 = 0;
  v5 = v35;
LABEL_12:

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  -[DSTableWelcomeController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectedScopeButtonIndex");

  if (v7 == 1)
  {
    -[DSSharingPermissionsController selectedTypes](self, "selectedTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissionsController sharingTypeForIndexPath:](self, "sharingTypeForIndexPath:", v11);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v7)
  {
    -[DSSharingPermissionsController selectedPeople](self, "selectedPeople");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissionsController personForIndexPath:](self, "personForIndexPath:", v11);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;
    objc_msgSend(v8, "addObject:", v9);

  }
  -[DSSharingPermissionsController _updateButton](self, "_updateButton");

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  -[DSTableWelcomeController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectedScopeButtonIndex");

  if (v7 == 1)
  {
    -[DSSharingPermissionsController selectedTypes](self, "selectedTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissionsController sharingTypeForIndexPath:](self, "sharingTypeForIndexPath:", v11);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v7)
  {
    -[DSSharingPermissionsController selectedPeople](self, "selectedPeople");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissionsController personForIndexPath:](self, "personForIndexPath:", v11);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;
    objc_msgSend(v8, "removeObject:", v9);

  }
  -[DSSharingPermissionsController _updateButton](self, "_updateButton");

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  if ((-[DSTableWelcomeController isKeyboardActive](self, "isKeyboardActive")
     || -[DSTableWelcomeController isFiltering](self, "isFiltering"))
    && !-[DSTableWelcomeController isShowingNoResultsView](self, "isShowingNoResultsView"))
  {
    -[DSTableWelcomeController searchController](self, "searchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "selectedScopeButtonIndex");

    if (v10)
    {
      if (v10 != 1)
      {
        v12 = &stru_24EFF4790;
        goto LABEL_11;
      }
      v11 = CFSTR("SEARCH_SHARING_TITLE_INFORMATION");
    }
    else
    {
      v11 = CFSTR("SEARCH_SHARING_TITLE_PEOPLE");
    }
    DSUILocStringForKey(v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("header"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultContentConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);
    objc_msgSend(v7, "setContentConfiguration:", v13);

    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)DSSharingPermissionsController;
  -[DSTableWelcomeController tableView:viewForHeaderInSection:](&v15, sel_tableView_viewForHeaderInSection_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v7;
}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[DSTableWelcomeController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedScopeButtonIndex");

  if (v5 == 1)
  {
    -[DSSharingPermissionsController headerView](self, "headerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("SHARING_PERMISSIONS_INFORMATION"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v10);

    -[DSSharingPermissionsController headerView](self, "headerView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("SHARING_PERMISSIONS_BY_TYPE_DETAIL");
  }
  else
  {
    if (v5)
      return;
    -[DSSharingPermissionsController headerView](self, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("SHARING_PERMISSIONS_PEOPLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);

    -[DSSharingPermissionsController headerView](self, "headerView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("SHARING_PERMISSIONS_BY_PEOPLE_DETAIL");
  }
  DSUILocStringForKey(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDetailText:", v11);

}

- (void)_pushNextPane
{
  void *v3;
  id v4;

  -[DSSharingPermissionsController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushNextPane");

  -[DSTableWelcomeController searchController](self, "searchController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

}

- (void)_updateButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  -[DSTableWelcomeController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedScopeButtonIndex");

  if (v5)
    -[DSSharingPermissionsController selectedTypes](self, "selectedTypes");
  else
    -[DSSharingPermissionsController selectedPeople](self, "selectedPeople");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

  if (v7)
  {
    -[DSTableWelcomeController boldButton](self, "boldButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("REVIEW_SHARING"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v10, 0);

    -[DSTableWelcomeController boldButton](self, "boldButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_reviewSelectedSharing, 64);
  }
  else
  {
    if (-[DSTableWelcomeController isModelEmpty](self, "isModelEmpty"))
      v12 = CFSTR("CONTINUE");
    else
      v12 = CFSTR("SKIP");
    DSUILocStringForKey(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController boldButton](self, "boldButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:forState:", v11, 0);

    -[DSTableWelcomeController boldButton](self, "boldButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel__pushNextPane, 64);

  }
  -[DSTableWelcomeController hideButtonsIfSearching](self, "hideButtonsIfSearching");
}

- (void)sharingStoppedForPerson:(id)a3 sourceNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v24;
    *(_QWORD *)&v11 = 138543362;
    v22 = v11;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v14);
        -[DSSharingPermissionsController repo](self, "repo", v22, (_QWORD)v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v8, "addObject:", v17);
          objc_msgSend(v6, "sharedResourcesForSourceName:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[DSSharingPermissionsController addUnsharedSource:resources:](self, "addUnsharedSource:resources:", v15, v18);

        }
        else
        {
          v19 = DSLogSharingPermissions;
          if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v22;
            v28 = v15;
            _os_log_fault_impl(&dword_2278DF000, v19, OS_LOG_TYPE_FAULT, "Failed to find source named %{public}@", buf, 0xCu);
          }
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v12);
  }

  objc_msgSend(v6, "displayName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsController addUnsharedPerson:](self, "addUnsharedPerson:", v20);

  -[DSSharingPermissionsController permissions](self, "permissions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removePerson:sources:", v6, v8);

  -[DSSharingPermissionsController reloadTableViewData](self, "reloadTableViewData");
}

- (void)sharingStoppedForType:(id)a3 people:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DSSharingPermissionsController permissions](self, "permissions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeSharingType:people:", v6, v7);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
        objc_msgSend(v6, "source");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sharedResourcesForSourceName:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "unionSet:", v17);

        objc_msgSend(v14, "displayName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[DSSharingPermissionsController addUnsharedPerson:](self, "addUnsharedPerson:", v18);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "source");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissionsController addUnsharedSource:resources:](self, "addUnsharedSource:resources:", v20, v9);

  -[DSSharingPermissionsController reloadTableViewData](self, "reloadTableViewData");
}

- (void)stopSharingFailedWithError:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BEBD3B0], "ds_alertControllerWithStopSharingError:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController presentErrorAlertController:](self, "presentErrorAlertController:", v4);

}

- (void)reviewSelectedSharingFlowCompleted
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
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

  v33 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v8);
        -[OBTableWelcomeController tableView](self, "tableView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v9, 0);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v6);
  }

  v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[DSSharingPermissionsController setSelectedPeople:](self, "setSelectedPeople:", v11);

  v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[DSSharingPermissionsController setSelectedTypes:](self, "setSelectedTypes:", v12);

  -[DSSharingPermissionsController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushPaneAfterPaneType:", objc_opt_class());

  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[DSSharingPermissionsController navigationController](self, "navigationController", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewControllers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(v14, "addObject:", v21);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  -[DSSharingPermissionsController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setViewControllers:", v14);

}

- (void)addUnsharedSource:(id)a3 resources:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[DSSharingPermissionsController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "unsharedResourcesBySource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);

  }
  v11 = v6;
  v10 = v6;
  AnalyticsSendEventLazy();

}

id __62__DSSharingPermissionsController_addUnsharedSource_resources___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("source");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addUnsharedPerson:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DSSharingPermissionsController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "unsharedPeople");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DSSourceRepository)repo
{
  return self->_repo;
}

- (void)setRepo:(id)a3
{
  objc_storeStrong((id *)&self->_repo, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (DSSharingPermissions)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
  objc_storeStrong((id *)&self->_permissions, a3);
}

- (NSMutableSet)selectedPeople
{
  return self->_selectedPeople;
}

- (void)setSelectedPeople:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPeople, a3);
}

- (NSMutableSet)selectedTypes
{
  return self->_selectedTypes;
}

- (void)setSelectedTypes:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTypes, a3);
}

- (unint64_t)fetchCompletedTime
{
  return self->_fetchCompletedTime;
}

- (void)setFetchCompletedTime:(unint64_t)a3
{
  self->_fetchCompletedTime = a3;
}

- (NSError)cachedFetchError
{
  return self->_cachedFetchError;
}

- (void)setCachedFetchError:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFetchError, a3);
}

- (NSMutableDictionary)personIconCache
{
  return self->_personIconCache;
}

- (void)setPersonIconCache:(id)a3
{
  objc_storeStrong((id *)&self->_personIconCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personIconCache, 0);
  objc_storeStrong((id *)&self->_cachedFetchError, 0);
  objc_storeStrong((id *)&self->_selectedTypes, 0);
  objc_storeStrong((id *)&self->_selectedPeople, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_repo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)presentFetchErrorMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2278DF000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch permissions because %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0_0();
}

- (void)filterContentForSearchText:(uint64_t)a1 category:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134349056;
  v3 = a1;
  _os_log_fault_impl(&dword_2278DF000, a2, OS_LOG_TYPE_FAULT, "Failed to find a predicate for search scope %{public}ld", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0_0();
}

@end
