@implementation CloudTabsViewController

- (CloudTabsViewController)initWithDeviceProvider:(id)a3 primaryDeviceUUID:(id)a4 profileIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  CloudTabsViewController *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *profileIdentifier;
  CloudTabsViewController *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CloudTabsViewController;
  v12 = -[CloudTabsViewController init](&v22, sel_init);
  if (v12)
  {
    startPageTitleForCollectionType(CFSTR("CloudTabsCollection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CloudTabsViewController setTitle:](v12, "setTitle:", v13);

    v14 = objc_alloc(MEMORY[0x1E0DC34F0]);
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithTitle:style:target:action:", v15, 2, v12, sel_dismiss);
    -[CloudTabsViewController navigationItem](v12, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRightBarButtonItem:", v16);

    objc_msgSend(v9, "addCloudTabsObserver:", v12);
    objc_storeStrong((id *)&v12->_deviceProvider, a3);
    objc_storeStrong((id *)&v12->_primaryDeviceUUID, a4);
    v18 = objc_msgSend(v11, "copy");
    profileIdentifier = v12->_profileIdentifier;
    v12->_profileIdentifier = (NSString *)v18;

    v12->_onlyShowsPrimaryDevice = v10 != 0;
    -[CloudTabsViewController _loadDevices](v12, "_loadDevices");
    v20 = v12;
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CloudTabsViewController;
  -[CloudTabsViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  PreviewTableViewController *v6;
  PreviewTableViewController *tableViewController;
  void *v8;
  UITableView *v9;
  UITableView *tableView;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CloudTabsViewController setView:](self, "setView:", v4);

  -[CloudTabsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);

  v6 = -[PreviewTableViewController initWithStyle:]([PreviewTableViewController alloc], "initWithStyle:", 2);
  tableViewController = self->_tableViewController;
  self->_tableViewController = v6;

  -[PreviewTableViewController setPreviewDelegate:](self->_tableViewController, "setPreviewDelegate:", self);
  -[CloudTabsViewController linkPreviewProvider](self, "linkPreviewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PreviewTableViewController setLinkPreviewProvider:](self->_tableViewController, "setLinkPreviewProvider:", v8);

  -[PreviewTableViewController tableView](self->_tableViewController, "tableView");
  v9 = (UITableView *)objc_claimAutoreleasedReturnValue();
  tableView = self->_tableView;
  self->_tableView = v9;

  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("CloudTabsTable"));
  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDragDelegate:](self->_tableView, "setDragDelegate:", self);
  +[PageTitleAndAddressTableViewCell defaultHeight](PageTitleAndAddressTableViewCell, "defaultHeight");
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
  -[UITableView setKeyboardDismissMode:](self->_tableView, "setKeyboardDismissMode:", 1);
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[UITableView setSectionHeaderHeight:](self->_tableView, "setSectionHeaderHeight:", 0.0);
  -[UITableView setSectionFooterHeight:](self->_tableView, "setSectionFooterHeight:", 0.0);
  -[CloudTabsViewController addChildViewController:](self, "addChildViewController:", self->_tableViewController);
  -[CloudTabsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_tableView);

  -[PreviewTableViewController didMoveToParentViewController:](self->_tableViewController, "didMoveToParentViewController:", self);
}

- (void)viewDidLoad
{
  UISearchController *v3;
  UISearchController *searchController;
  NSString *primaryDeviceUUID;
  UISearchController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UISearchController *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CloudTabsViewController;
  -[CloudTabsViewController viewDidLoad](&v13, sel_viewDidLoad);
  v3 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
  searchController = self->_searchController;
  self->_searchController = v3;

  -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
  -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
  primaryDeviceUUID = self->_primaryDeviceUUID;
  v6 = self->_searchController;
  if (primaryDeviceUUID)
  {
    -[UISearchController setScopeBarActivation:](v6, "setScopeBarActivation:", 3);
  }
  else
  {
    -[UISearchController searchBar](v6, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsScopeBar:", 0);

  }
  -[UISearchController setHidesNavigationBarDuringPresentation:](self->_searchController, "setHidesNavigationBarDuringPresentation:", primaryDeviceUUID != 0);
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPlaceholder:", v8);

  -[CloudTabsViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidesSearchBarWhenScrolling:", 0);

  v11 = self->_searchController;
  -[CloudTabsViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSearchController:", v11);

  -[CloudTabsViewController _reloadDevicesAndTable](self, "_reloadDevicesAndTable");
}

- (void)_updateContentUnavailableConfiguration
{
  uint64_t v3;
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
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  if (-[CloudTabsViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", self->_tableView) < 1)
  {
LABEL_5:
    if (-[NSArray count](self->_devices, "count") && -[NSString length](self->_userTypedFilter, "length"))
    {
      objc_msgSend(MEMORY[0x1E0DC3698], "searchConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchController _contentUnavailableConfigurationState](self->_searchController, "_contentUnavailableConfigurationState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updatedConfigurationForState:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_onlyShowsPrimaryDevice)
      {
        _WBSLocalizedString();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "buttonProperties");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "configuration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTitle:", v7);

        objc_initWeak(&location, self);
        v10 = (void *)MEMORY[0x1E0DC3428];
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __65__CloudTabsViewController__updateContentUnavailableConfiguration__block_invoke;
        v17[3] = &unk_1E9CF2C28;
        objc_copyWeak(&v18, &location);
        objc_msgSend(v10, "actionWithHandler:", v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "buttonProperties");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setPrimaryAction:", v11);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      -[CloudTabsViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v6);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3698], "emptyExtraProminentConfiguration");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("icloud"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setImage:", v13);

      _WBSLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v14);

      -[WBSCloudTabDeviceProvider cloudTabsAreEnabled](self->_deviceProvider, "cloudTabsAreEnabled");
      _WBSLocalizedString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSecondaryText:", v15);

      -[CloudTabsViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v16);
    }
  }
  else
  {
    v3 = 0;
    while (!-[CloudTabsViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", self->_tableView, v3))
    {
      if (++v3 >= -[CloudTabsViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", self->_tableView))goto LABEL_5;
    }
    -[CloudTabsViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
  }
}

void __65__CloudTabsViewController__updateContentUnavailableConfiguration__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[131], "searchBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSelectedScopeButtonIndex:", 1);

    objc_msgSend(v3, "updateSearchResultsForSearchController:", v3[131]);
    WeakRetained = v3;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CloudTabsViewController;
  -[CloudTabsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CloudTabsViewController _updateContentUnavailableConfiguration](self, "_updateContentUnavailableConfiguration");
  if (!self->_onlyShowsPrimaryDevice)
    -[UIViewController safari_restoreTableViewScrollPosition](self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CloudTabsViewController;
  -[CloudTabsViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (!self->_onlyShowsPrimaryDevice)
    -[UIViewController safari_saveTableViewScrollPosition](self);
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  -[UITableView setNeedsLayout](self->_tableView, "setNeedsLayout", a3);
}

- (void)dismiss
{
  -[CloudTabsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_loadDevices
{
  NSArray *v3;
  NSArray *devices;
  void *v5;
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  _QWORD v19[5];
  _QWORD v20[2];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[WBSCloudTabDeviceProvider syncedRemoteCloudTabDevicesForProfileWithIdentifier:](self->_deviceProvider, "syncedRemoteCloudTabDevicesForProfileWithIdentifier:", self->_profileIdentifier);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  devices = self->_devices;
  self->_devices = v3;

  startPageTitleForCollectionType(CFSTR("CloudTabsCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_onlyShowsPrimaryDevice)
  {
    v6 = self->_devices;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __39__CloudTabsViewController__loadDevices__block_invoke;
    v19[3] = &unk_1E9CF6D90;
    v19[4] = self;
    -[NSArray safari_firstObjectPassingTest:](v6, "safari_firstObjectPassingTest:", v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CloudTabsViewController setTitle:](self, "setTitle:", v11);

      v21[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v13 = self->_devices;
      self->_devices = v12;

      objc_msgSend(v7, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v14;
      _WBSLocalizedString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchController searchBar](self->_searchController, "searchBar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setScopeButtonTitles:", v16);

    }
    else
    {
      v18 = self->_devices;
      self->_devices = (NSArray *)MEMORY[0x1E0C9AA60];

      -[CloudTabsViewController setTitle:](self, "setTitle:", v5);
    }

  }
  else
  {
    -[CloudTabsViewController setTitle:](self, "setTitle:", v5);
  }

}

uint64_t __39__CloudTabsViewController__loadDevices__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984));

  return v4;
}

- (void)_delayReloadTimerFired
{
  NSTimer *delayReloadTimer;

  -[NSTimer invalidate](self->_delayReloadTimer, "invalidate");
  delayReloadTimer = self->_delayReloadTimer;
  self->_delayReloadTimer = 0;

  -[CloudTabsViewController _reloadDevicesAndTable](self, "_reloadDevicesAndTable");
}

- (void)cloudTabDeviceProvider:(id)a3 didUpdateCloudTabsInProfileWithIdentifier:(id)a4
{
  _QWORD block[5];

  if (WBSIsEqual())
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__CloudTabsViewController_cloudTabDeviceProvider_didUpdateCloudTabsInProfileWithIdentifier___block_invoke;
    block[3] = &unk_1E9CF1900;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __92__CloudTabsViewController_cloudTabDeviceProvider_didUpdateCloudTabsInProfileWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDevicesAndTable");
}

- (void)_reloadDevicesAndTable
{
  if (!-[NSTimer isValid](self->_delayReloadTimer, "isValid"))
  {
    -[CloudTabsViewController _loadDevices](self, "_loadDevices");
    -[UITableView reloadData](self->_tableView, "reloadData");
    -[CloudTabsViewController _updateContentUnavailableConfiguration](self, "_updateContentUnavailableConfiguration");
  }
}

- (id)_deviceForIndexPath:(id)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_devices, "objectAtIndexedSubscript:", objc_msgSend(a3, "section"));
}

- (id)_filteredTabsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];

  -[NSArray objectAtIndexedSubscript:](self->_devices, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSString length](self->_userTypedFilter, "length"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__CloudTabsViewController__filteredTabsInSection___block_invoke;
    v9[3] = &unk_1E9CF6DB8;
    v9[4] = self;
    objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

uint64_t __50__CloudTabsViewController__filteredTabsInSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "cloudTabsViewController:tabItem:matchesSearchText:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008));
}

- (id)_tabForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[CloudTabsViewController _filteredTabsInSection:](self, "_filteredTabsInSection:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  _BOOL4 v5;
  NSString *v6;
  NSString *userTypedFilter;
  id v8;

  objc_msgSend(a3, "searchBar");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_primaryDeviceUUID)
    v5 = objc_msgSend(v8, "selectedScopeButtonIndex") == 0;
  else
    v5 = 0;
  if (self->_onlyShowsPrimaryDevice != v5 || (WBSIsEqual() & 1) == 0)
  {
    self->_onlyShowsPrimaryDevice = v5;
    v6 = (NSString *)objc_msgSend(v4, "copy");
    userTypedFilter = self->_userTypedFilter;
    self->_userTypedFilter = v6;

    -[CloudTabsViewController _reloadDevicesAndTable](self, "_reloadDevicesAndTable");
  }

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4;
  void *v5;

  v4 = 10.0;
  if (!self->_onlyShowsPrimaryDevice)
  {
    -[CloudTabsViewController _filteredTabsInSection:](self, "_filteredTabsInSection:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      v4 = *MEMORY[0x1E0DC53D8];
    else
      v4 = 2.22507386e-308;

  }
  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v4;
  double v5;

  -[CloudTabsViewController _filteredTabsInSection:](self, "_filteredTabsInSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v5 = 20.0;
  else
    v5 = 2.22507386e-308;

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_devices, "count", a3);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v7;
  uint64_t v8;
  void *v9;

  if (self->_onlyShowsPrimaryDevice
    || (-[CloudTabsViewController _filteredTabsInSection:](self, "_filteredTabsInSection:", a4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_devices, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;
  void *v7;
  int64_t v8;

  result = -[NSArray count](self->_devices, "count", a3);
  if (result)
  {
    -[CloudTabsViewController _filteredTabsInSection:](self, "_filteredTabsInSection:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    return v8;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  PageTitleAndAddressTableViewCell *v8;
  char *v9;

  v6 = a3;
  -[CloudTabsViewController _tabForIndexPath:](self, "_tabForIndexPath:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("CloudTabReuseIdentifier"));
  v8 = (PageTitleAndAddressTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v8 = -[PageTitleAndAddressTableViewCell initWithStyle:reuseIdentifier:]([PageTitleAndAddressTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("CloudTabReuseIdentifier"));
  objc_msgSend(v7, "title");
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell safari_setLinkedPageTitle:description:](v8, v9, 0);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  -[CloudTabsViewController _tabForIndexPath:](self, "_tabForIndexPath:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationIntentWithCloudTab:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  objc_msgSend(WeakRetained, "handleNavigationIntent:completion:", v6, 0);

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v4;
  unsigned int v5;

  -[CloudTabsViewController _deviceForIndexPath:](self, "_deviceForIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCloseRequestSupported");

  return v5;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return (id)_WBSLocalizedString();
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  -[CloudTabsViewController _deleteRowAtIndexPath:](self, "_deleteRowAtIndexPath:", a5, a4);
}

- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  -[CloudTabsViewController setEditing:](self, "setEditing:", 1, a4);
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)_deleteRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSTimer *v7;
  NSTimer *delayReloadTimer;
  void *v9;
  uint64_t v10;
  UITableView *tableView;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CloudTabsViewController _deviceForIndexPath:](self, "_deviceForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CloudTabsViewController _tabForIndexPath:](self, "_tabForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTimer invalidate](self->_delayReloadTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__delayReloadTimerFired, 0, 0, 0.35);
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  delayReloadTimer = self->_delayReloadTimer;
  self->_delayReloadTimer = v7;

  if (-[WBSCloudTabDeviceProvider closeTab:onDevice:](self->_deviceProvider, "closeTab:onDevice:", v6, v5))
  {
    objc_msgSend(v5, "tabs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    -[CloudTabsViewController _loadDevices](self, "_loadDevices");
    tableView = self->_tableView;
    if (v10 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v4, "section"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView deleteSections:withRowAnimation:](tableView, "deleteSections:withRowAnimation:", v12, 100);
    }
    else
    {
      v13[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v12, 100);
    }

  }
  else
  {
    -[UITableView setEditing:animated:](self->_tableView, "setEditing:animated:", 0, 1);
  }

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return -[PreviewTableViewController tableView:contextMenuConfigurationForRowAtIndexPath:point:](self->_tableViewController, "tableView:contextMenuConfigurationForRowAtIndexPath:point:", a3, a4, a5.x, a5.y);
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  return -[PreviewTableViewController tableView:previewForHighlightingContextMenuWithConfiguration:](self->_tableViewController, "tableView:previewForHighlightingContextMenuWithConfiguration:", a3, a4);
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  -[PreviewTableViewController tableView:willPerformPreviewActionForMenuWithConfiguration:animator:](self->_tableViewController, "tableView:willPerformPreviewActionForMenuWithConfiguration:animator:", a3, a4, a5);
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  return -[PreviewTableViewController tableView:previewForDismissingContextMenuWithConfiguration:](self->_tableViewController, "tableView:previewForDismissingContextMenuWithConfiguration:", a3, a4);
}

- (id)safari_tableViewForScrollPositionSaving
{
  return self->_tableView;
}

- (id)safari_tableViewScrollPositionSaveIdentifier
{
  return CFSTR("CloudTabsCollection");
}

- (id)_urlForRowAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[CloudTabsViewController _tabForIndexPath:](self, "_tabForIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)previewTableViewController:(id)a3 URLForRowAtIndexPath:(id)a4
{
  return -[CloudTabsViewController _urlForRowAtIndexPath:](self, "_urlForRowAtIndexPath:", a4);
}

- (id)previewTableViewController:(id)a3 menuForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id WeakRetained;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD aBlock[4];
  id v43;
  id v44;
  id location;
  _QWORD v46[4];
  id v47;
  _QWORD v48[5];

  v48[3] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CloudTabsViewController _urlForRowAtIndexPath:](self, "_urlForRowAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke;
    v46[3] = &unk_1E9CF3058;
    v13 = v9;
    v47 = v13;
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v46);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v14);

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_2;
    aBlock[3] = &unk_1E9CF6DE0;
    objc_copyWeak(&v44, &location);
    v15 = v13;
    v43 = v15;
    v16 = _Block_copy(aBlock);
    v17 = (void *)MEMORY[0x1E0DC3428];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_3;
    v40[3] = &unk_1E9CF1950;
    v18 = v16;
    v41 = v18;
    objc_msgSend(v17, "_sf_openInNewTabActionWithHandler:", v40);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v19);

    WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_4;
    v38[3] = &unk_1E9CF1950;
    v21 = v18;
    v39 = v21;
    objc_msgSend(WeakRetained, "openInTabGroupMenuWithNewTabGroupName:URL:descendantCount:handler:", 0, v15, 0, v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v22);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);

  }
  if (-[CloudTabsViewController tableView:editingStyleForRowAtIndexPath:](self, "tableView:editingStyleForRowAtIndexPath:", self->_tableView, v6) == 1)
  {
    v23 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_5;
    v36[3] = &unk_1E9CF6E08;
    v36[4] = self;
    v37 = v6;
    objc_msgSend(v23, "actionWithTitle:image:identifier:handler:", v24, v25, 0, v36);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setAttributes:", 2);
    objc_msgSend(v8, "addObject:", v26);

  }
  v27 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v28;
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v29;
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "menuWithTitle:children:", &stru_1E9CFDBB0, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

void __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setURL:", v1);

}

void __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredTabOrder:", a2);
    objc_msgSend(v5, "setPrefersOpenInNewTab:", 1);
    objc_msgSend(v5, "navigationIntentWithHistoryURL:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(v9 + 135);
    objc_msgSend(v7, "dispatchNavigationIntent:", v6);

    if (objc_msgSend(v6, "shouldOrderToForeground"))
    {
      v8 = objc_loadWeakRetained(v9 + 136);
      objc_msgSend(v8, "removeSingleBlankTabFromActiveTabGroup");

    }
    WeakRetained = v9;
  }

}

uint64_t __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteRowAtIndexPath:", *(_QWORD *)(a1 + 40));
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB36C8];
  v7 = a5;
  v8 = [v6 alloc];
  -[CloudTabsViewController _urlForRowAtIndexPath:](self, "_urlForRowAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithContentsOfURL:", v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v10);
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return 3;
}

- (CloudTabsViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CloudTabsViewControllerDelegate *)a3;
}

- (LinkPreviewProvider)linkPreviewProvider
{
  return (LinkPreviewProvider *)objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
}

- (void)setLinkPreviewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_linkPreviewProvider, a3);
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  return (_SFNavigationIntentHandling *)objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
}

- (void)setNavigationIntentHandler:(id)a3
{
  objc_storeWeak((id *)&self->_navigationIntentHandler, a3);
}

- (TabGroupProvider)tabGroupProvider
{
  return (TabGroupProvider *)objc_loadWeakRetained((id *)&self->_tabGroupProvider);
}

- (void)setTabGroupProvider:(id)a3
{
  objc_storeWeak((id *)&self->_tabGroupProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabGroupProvider);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_storeStrong((id *)&self->_delayReloadTimer, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_editBarButtonItem, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_userTypedFilter, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryDeviceUUID, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
}

@end
