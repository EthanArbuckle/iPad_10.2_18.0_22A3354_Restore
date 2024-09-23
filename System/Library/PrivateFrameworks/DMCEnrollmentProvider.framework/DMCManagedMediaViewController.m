@implementation DMCManagedMediaViewController

- (DMCManagedMediaViewController)initWithProfileViewModel:(id)a3 managedApp:(id)a4
{
  id v7;
  id v8;
  DMCManagedMediaViewController *v9;
  DMCManagedMediaViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DMCManagedMediaViewController;
  v9 = -[DMCProfileTableViewController initWithStyle:](&v12, sel_initWithStyle_, 2);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_app, a4);
    objc_storeStrong((id *)&v10->_profileViewModel, a3);
    -[DMCManagedMediaViewController _setup](v10, "_setup");
  }

  return v10;
}

- (DMCManagedMediaViewController)initWithProfileViewModel:(id)a3 managedBook:(id)a4
{
  id v7;
  id v8;
  DMCManagedMediaViewController *v9;
  DMCManagedMediaViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DMCManagedMediaViewController;
  v9 = -[DMCProfileTableViewController initWithStyle:](&v12, sel_initWithStyle_, 2);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_book, a4);
    objc_storeStrong((id *)&v10->_profileViewModel, a3);
    -[DMCManagedMediaViewController _setup](v10, "_setup");
  }

  return v10;
}

- (void)_setup
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DMCManagedMediaViewController;
  -[DMCProfileTableViewController updateExtendedLayoutIncludesOpaqueBars](&v13, sel_updateExtendedLayoutIncludesOpaqueBars);
  -[DMCManagedMediaViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("MCUIManagedMediaSummaryCell"));

  -[DMCManagedMediaViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("MCUIManagedMediaDetailsCell"));

  v12.receiver = self;
  v12.super_class = (Class)DMCManagedMediaViewController;
  -[DMCProfileTableViewController reloadTableOnContentSizeCategoryChange](&v12, sel_reloadTableOnContentSizeCategoryChange);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__profileChanged_, CFSTR("kMCUIProfileDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__reloadTable_, CFSTR("kMCUIBridgeIconLoadedNotification"), 0);

  -[DMCManagedMediaViewController app](self, "app");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    -[DMCManagedMediaViewController book](self, "book");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "friendlyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[DMCManagedMediaViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v10);

  if (!v9)
  {

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DMCManagedMediaViewController;
  -[DMCProfileTableViewController dealloc](&v4, sel_dealloc);
}

- (void)_profileChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD block[4];
  id v16;
  char v17;
  char v18;
  id location;

  v4 = a3;
  -[DMCManagedMediaViewController app](self, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kMCUIManagedAppsDidChange"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  -[DMCManagedMediaViewController book](self, "book");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v4, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kMCUIManagedBooksDidChange"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__DMCManagedMediaViewController__profileChanged___block_invoke;
  block[3] = &unk_24D52EC58;
  objc_copyWeak(&v16, &location);
  v17 = v9;
  v18 = v14;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __49__DMCManagedMediaViewController__profileChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(WeakRetained, "profileViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "app");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "managesAppID:", v5);
    }
    else
    {
      if (!*(_BYTE *)(a1 + 41))
      {
        objc_msgSend(WeakRetained, "tableView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "reloadData");
        goto LABEL_9;
      }
      objc_msgSend(WeakRetained, "profileViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "book");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "persistentID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "managesBook:", v5);
    }
    v7 = v6;

    WeakRetained = v10;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v10, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);
LABEL_9:

      WeakRetained = v10;
    }
  }

}

- (void)_reloadTable:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__DMCManagedMediaViewController__reloadTable___block_invoke;
  v3[3] = &unk_24D52E7F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __46__DMCManagedMediaViewController__reloadTable___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadData");

    WeakRetained = v3;
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  void *v4;
  double v5;
  double v6;

  -[DMCManagedMediaViewController tableView](self, "tableView", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowHeight");
  v6 = v5;

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "row"))
    v8 = CFSTR("MCUIManagedMediaDetailsCell");
  else
    v8 = CFSTR("MCUIManagedMediaSummaryCell");
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCManagedMediaViewController app](self, "app");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DMCManagedMediaViewController app](self, "app");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setManagedApp:", v11);
LABEL_8:

    return v9;
  }
  -[DMCManagedMediaViewController book](self, "book");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DMCManagedMediaViewController book](self, "book");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setManagedBook:", v11);
    goto LABEL_8;
  }
  return v9;
}

- (DMCProfileViewModel)profileViewModel
{
  return self->_profileViewModel;
}

- (void)setProfileViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_profileViewModel, a3);
}

- (DMCApplicationProxy)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
  objc_storeStrong((id *)&self->_app, a3);
}

- (MDMBook)book
{
  return self->_book;
}

- (void)setBook:(id)a3
{
  objc_storeStrong((id *)&self->_book, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_book, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_profileViewModel, 0);
}

@end
