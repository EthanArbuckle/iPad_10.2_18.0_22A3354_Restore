@implementation MSDSearchResultViewController

- (MSDSearchResultViewController)initWithDelegate:(id)a3
{
  id v4;
  MSDSearchResultViewController *v5;
  MSDSearchResultViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSDSearchResultViewController;
  v5 = -[MSDSearchResultViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MSDSearchResultViewController setSearchBar:](v5, "setSearchBar:", 0);
    -[MSDSearchResultViewController setTableView:](v6, "setTableView:", 0);
    -[MSDSearchResultViewController setMode:](v6, "setMode:", 1);
    -[MSDSearchResultViewController setStoreInfoList:](v6, "setStoreInfoList:", 0);
    -[MSDSearchResultViewController setDebounceTimer:](v6, "setDebounceTimer:", 0);
    -[MSDSearchResultViewController setDelegate:](v6, "setDelegate:", v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
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
  void *v18;
  void *v19;
  void *v20;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  objc_super v62;
  _QWORD v63[4];
  _QWORD v64[5];

  v64[3] = *MEMORY[0x24BDAC8D0];
  v62.receiver = self;
  v62.super_class = (Class)MSDSearchResultViewController;
  -[MSDSearchResultViewController viewDidLoad](&v62, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSearchResultViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc_init(MEMORY[0x24BDF6D60]);
  -[MSDSearchResultViewController setSearchBar:](self, "setSearchBar:", v5);

  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("SEARCH_PLACEHOLDER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSearchResultViewController searchBar](self, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaceholder:", v6);

  -[MSDSearchResultViewController searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[MSDSearchResultViewController searchBar](self, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSearchBarStyle:", 2);

  -[MSDSearchResultViewController searchBar](self, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MSDSearchResultViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSearchResultViewController searchBar](self, "searchBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[MSDSearchResultViewController searchBar](self, "searchBar");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSearchResultViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "safeAreaLayoutGuide");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v51, 15.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v49;
  -[MSDSearchResultViewController searchBar](self, "searchBar");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSearchResultViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "safeAreaLayoutGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v14;
  -[MSDSearchResultViewController searchBar](self, "searchBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSearchResultViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeAreaLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v61);
  v21 = objc_alloc(MEMORY[0x24BDF6E58]);
  v22 = (void *)objc_msgSend(v21, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[MSDSearchResultViewController setTableView:](self, "setTableView:", v22);

  -[MSDSearchResultViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDataSource:", self);

  -[MSDSearchResultViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDelegate:", self);

  -[MSDSearchResultViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MSDSearchResultViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSearchResultViewController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v27);

  -[MSDSearchResultViewController tableView](self, "tableView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSearchResultViewController searchBar](self, "searchBar");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v54);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v52;
  -[MSDSearchResultViewController tableView](self, "tableView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSearchResultViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v44);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v42;
  -[MSDSearchResultViewController tableView](self, "tableView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSearchResultViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v31;
  -[MSDSearchResultViewController tableView](self, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSearchResultViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v39);
  -[MSDSearchResultViewController tableView](self, "tableView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("StoreInfoCell"));

  -[MSDSearchResultViewController tableView](self, "tableView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("StoreLoading"));

}

- (void)showInProgress
{
  id v3;

  -[MSDSearchResultViewController setStoreInfoList:](self, "setStoreInfoList:", 0);
  -[MSDSearchResultViewController setMode:](self, "setMode:", 0);
  -[MSDSearchResultViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)showStoreInfo:(id)a3
{
  id v4;
  void *v5;
  MSDStoreInfoViewController *v6;

  v4 = a3;
  v6 = -[MSDStoreInfoViewController initWithStoreInfo:andDelegate:]([MSDStoreInfoViewController alloc], "initWithStoreInfo:andDelegate:", v4, self);

  -[MSDSearchResultViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)showStoreList:(id)a3 inDisplayMode:(unint64_t)a4
{
  MSDStoreInfoListViewController *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (a4 == 2)
  {
    v6 = -[MSDStoreInfoListViewController initWithStoreInfoList:andDelegate:]([MSDStoreInfoListViewController alloc], "initWithStoreInfoList:andDelegate:", v9, self);
    -[MSDSearchResultViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v6, 1);

LABEL_10:
    goto LABEL_11;
  }
  -[MSDSearchResultViewController setStoreInfoList:](self, "setStoreInfoList:", v9);
  if (!v9 || !objc_msgSend(v9, "count"))
  {
    v8 = 3;
    goto LABEL_9;
  }
  if (!a4)
  {
    v8 = 1;
    goto LABEL_9;
  }
  if (a4 == 1)
  {
    v8 = 2;
LABEL_9:
    -[MSDSearchResultViewController setMode:](self, "setMode:", v8);
    -[MSDSearchResultViewController tableView](self, "tableView");
    v6 = (MSDStoreInfoListViewController *)objc_claimAutoreleasedReturnValue();
    -[MSDStoreInfoListViewController reloadData](v6, "reloadData");
    goto LABEL_10;
  }
LABEL_11:

}

- (void)dismissAllTopViews
{
  NSObject *v3;
  void *v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[MSDSearchResultViewController dismissAllTopViews]";
    _os_log_impl(&dword_22A6E6000, v3, OS_LOG_TYPE_DEFAULT, "%s - dismissing all top views", (uint8_t *)&v6, 0xCu);
  }

  -[MSDSearchResultViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popToRootViewControllerAnimated:", 1);

}

- (BOOL)isShowingSearchResult
{
  MSDSearchResultViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[MSDSearchResultViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v4, "isEqual:", v2);

  return (char)v2;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  defaultLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v5;
    _os_log_impl(&dword_22A6E6000, v6, OS_LOG_TYPE_DEFAULT, "User entered search text: %{public}@", buf, 0xCu);
  }

  -[MSDSearchResultViewController debounceTimer](self, "debounceTimer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MSDSearchResultViewController debounceTimer](self, "debounceTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isValid");

    if (v10)
    {
      -[MSDSearchResultViewController debounceTimer](self, "debounceTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

    }
  }
  v12 = objc_alloc(MEMORY[0x24BDBCF40]);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __57__MSDSearchResultViewController_searchBar_textDidChange___block_invoke;
  v17[3] = &unk_24F47D308;
  v17[4] = self;
  v14 = (void *)objc_msgSend(v12, "initWithFireDate:interval:repeats:block:", v13, 0, v17, 0.0);
  -[MSDSearchResultViewController setDebounceTimer:](self, "setDebounceTimer:", v14);

  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSearchResultViewController debounceTimer](self, "debounceTimer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addTimer:forMode:", v16, *MEMORY[0x24BDBCA90]);

}

void __57__MSDSearchResultViewController_searchBar_textDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_22A6E6000, v4, OS_LOG_TYPE_DEFAULT, "Processing search text: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didEnterSearchText:forViewController:", v3, *(_QWORD *)(a1 + 32));

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3;

  -[MSDSearchResultViewController searchBar](self, "searchBar", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22A6E6000, v4, OS_LOG_TYPE_DEFAULT, "User cancelled search", v8, 2u);
  }

  -[MSDSearchResultViewController searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endEditing:", 1);

  -[MSDSearchResultViewController searchBar](self, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", 0);

  -[MSDSearchResultViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didEnterSearchText:forViewController:", 0, self);

}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v3;

  -[MSDSearchResultViewController searchBar](self, "searchBar", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsCancelButton:", 1);

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v3;

  -[MSDSearchResultViewController searchBar](self, "searchBar", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsCancelButton:", 0);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  if (-[MSDSearchResultViewController mode](self, "mode", a3, a4) == 3
    || !-[MSDSearchResultViewController mode](self, "mode"))
  {
    return 2;
  }
  -[MSDSearchResultViewController storeInfoList](self, "storeInfoList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + 1;

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  MSDStoreInfoTableViewCell *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  double v20;
  MSDStoreInfoTableViewCell *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  MSDStoreInfoTableViewCell *v33;
  void *v34;
  void *v35;
  CGRect v37;

  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  -[MSDSearchResultViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfRowsInSection:", 0);

  v9 = 0;
  if (v6 < v8)
  {
    v10 = objc_msgSend(v5, "row");
    -[MSDSearchResultViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "numberOfRowsInSection:", 0) - 1;

    if (v10 == v12)
    {
      v9 = (MSDStoreInfoTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 3, CFSTR("StoreInfoCell"));
      -[MSDStoreInfoTableViewCell defaultContentConfiguration](v9, "defaultContentConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("CANNOT_FIND_STORE_BUTTON"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v14);

      objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setColor:", v15);

      -[MSDStoreInfoTableViewCell setContentConfiguration:](v9, "setContentConfiguration:", v13);
      -[MSDSearchResultViewController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      -[MSDStoreInfoTableViewCell setSeparatorInset:](v9, "setSeparatorInset:", 0.0, 0.0, 0.0, CGRectGetWidth(v37));

      goto LABEL_18;
    }
    v18 = -[MSDSearchResultViewController mode](self, "mode");
    if (v18 == 3)
    {
      v21 = [MSDStoreInfoTableViewCell alloc];
      +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("NO_RESULTS_TITLE"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("NO_RESULTS_DESCRIPTION"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("magnifyingglass.circle.fill"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MSDStoreInfoTableViewCell initWithTitle:description:image:imageColor:reuseIdentifier:](v21, "initWithTitle:description:image:imageColor:reuseIdentifier:", v22, v23, v24, v25, CFSTR("StoreInfoCell"));

      goto LABEL_8;
    }
    if (!v18)
    {
      v9 = -[MSDStoreInfoTableViewCell initSpinnerCellWithReuseIdentifier:]([MSDStoreInfoTableViewCell alloc], "initSpinnerCellWithReuseIdentifier:", CFSTR("StoreLoading"));
      -[MSDSearchResultViewController tableView](self, "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      -[MSDStoreInfoTableViewCell setSeparatorInset:](v9, "setSeparatorInset:", 0.0, v20, 0.0, 0.0);

LABEL_8:
      -[MSDStoreInfoTableViewCell setSelectionStyle:](v9, "setSelectionStyle:", 0);
      goto LABEL_18;
    }
    -[MSDSearchResultViewController storeInfoList](self, "storeInfoList");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndex:", objc_msgSend(v5, "row"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "isHQ"))
    {
      v28 = (void *)MEMORY[0x24BDF6AC8];
      v29 = CFSTR("building.2.crop.circle.fill");
    }
    else
    {
      v30 = -[MSDSearchResultViewController mode](self, "mode");
      v28 = (void *)MEMORY[0x24BDF6AC8];
      if (v30 == 1)
        v29 = CFSTR("mappin.circle.fill");
      else
        v29 = CFSTR("magnifyingglass.circle.fill");
    }
    objc_msgSend(v28, "systemImageNamed:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MSDSearchResultViewController mode](self, "mode") == 1)
      objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = [MSDStoreInfoTableViewCell alloc];
    objc_msgSend(v27, "storeName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "storeDescription");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MSDStoreInfoTableViewCell initWithTitle:description:image:imageColor:reuseIdentifier:](v33, "initWithTitle:description:image:imageColor:reuseIdentifier:", v34, v35, v31, v32, CFSTR("StoreInfoCell"));

  }
LABEL_18:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  const __CFString *v8;

  v6 = a3;
  if (a4 > 0)
    goto LABEL_2;
  if (-[MSDSearchResultViewController mode](self, "mode") == 1)
  {
    v8 = CFSTR("NEARBY_STORE_SECTION_HEADER");
LABEL_7:
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (-[MSDSearchResultViewController mode](self, "mode") == 2)
  {
    v8 = CFSTR("SEARCH_RESULT_SECTION_HEADER");
    goto LABEL_7;
  }
LABEL_2:
  v7 = 0;
LABEL_8:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v5 = objc_msgSend(v18, "row");
  -[MSDSearchResultViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfRowsInSection:", 0);

  v8 = v18;
  if (v5 < v7)
  {
    v9 = objc_msgSend(v18, "row");
    -[MSDSearchResultViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "numberOfRowsInSection:", 0) - 1;

    if (v9 == v11)
    {
      -[MSDSearchResultViewController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "didSelectNoStoreForViewController:", self);
LABEL_7:

      -[MSDSearchResultViewController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deselectRowAtIndexPath:animated:", v18, 1);

      v8 = v18;
      goto LABEL_8;
    }
    v13 = -[MSDSearchResultViewController mode](self, "mode");
    v8 = v18;
    if (v13 != 3)
    {
      v14 = -[MSDSearchResultViewController mode](self, "mode");
      v8 = v18;
      if (v14)
      {
        -[MSDSearchResultViewController storeInfoList](self, "storeInfoList");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v18, "row"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[MSDSearchResultViewController showStoreInfo:](self, "showStoreInfo:", v12);
        -[MSDSearchResultViewController searchBar](self, "searchBar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "endEditing:", 1);

        goto LABEL_7;
      }
    }
  }
LABEL_8:

}

- (void)viewWillAppear:(id)a3 forStore:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MSDSearchResultViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didSelectStore:forViewController:", v5, self);

}

- (void)viewWillClose:(id)a3 forStore:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MSDSearchResultViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didDeselectStore:forViewController:", v5, self);

}

- (void)didConfirmStoreAssignment:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MSDSearchResultViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didAssignStore:forViewController:", v4, self);

}

- (void)listViewDidClose:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MSDSearchResultViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MSDSearchResultViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didDismissStoreListView:forViewController:", v7, self);

  }
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (NSTimer)debounceTimer
{
  return self->_debounceTimer;
}

- (void)setDebounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_debounceTimer, a3);
}

- (NSArray)storeInfoList
{
  return self->_storeInfoList;
}

- (void)setStoreInfoList:(id)a3
{
  objc_storeStrong((id *)&self->_storeInfoList, a3);
}

- (MSDSearchResultViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_storeInfoList, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
