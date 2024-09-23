@implementation AMSUINotificationSettingsViewController

- (AMSUINotificationSettingsViewController)initWithIdentifier:(id)a3 account:(id)a4 bag:(id)a5
{
  return -[AMSUINotificationSettingsViewController initWithIdentifier:bag:](self, "initWithIdentifier:bag:", a3, a5);
}

- (AMSUINotificationSettingsViewController)initWithIdentifier:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSUINotificationSettingsViewController *v9;
  uint64_t v10;
  NSMutableDictionary *changedItems;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUINotificationSettingsViewController;
  v9 = -[AMSUINotificationSettingsViewController init](&v13, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    changedItems = v9->_changedItems;
    v9->_changedItems = (NSMutableDictionary *)v10;

    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v9->_identifier, a3);
    -[AMSUINotificationSettingsViewController _commonSetup](v9, "_commonSetup");
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)AMSUINotificationSettingsViewController;
  -[AMSUINotificationSettingsViewController dealloc](&v4, sel_dealloc);
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
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)AMSUINotificationSettingsViewController;
  -[AMSUINotificationSettingsViewController viewDidLoad](&v16, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__appWillEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUINotificationSettingsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[AMSUINotificationSettingsViewController bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("NOTIFICATIONS_SETTINGS_TITLE"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUINotificationSettingsViewController setTitle:](self, "setTitle:", v8);

  -[AMSUINotificationSettingsViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLargeTitleDisplayMode:", 2);

  if (-[AMSUINotificationSettingsViewController _isAuthenticated](self, "_isAuthenticated"))
  {
    -[AMSUINotificationSettingsViewController _loadData](self, "_loadData");
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      v14 = "%{public}@: [%{public}@] User authenticated, setting up table";
LABEL_10:
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEBUG, v14, buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      v19 = 2114;
      v20 = v13;
      v14 = "%{public}@: [%{public}@] User not authenticated, delaying table setup";
      goto LABEL_10;
    }
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)AMSUINotificationSettingsViewController;
  -[AMSUINotificationSettingsViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  if (!-[AMSUINotificationSettingsViewController _isAuthenticated](self, "_isAuthenticated"))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] User not authenticated, prompting for authentication.", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    -[AMSUINotificationSettingsViewController _promptForAuthentication](self, "_promptForAuthentication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__AMSUINotificationSettingsViewController_viewDidAppear___block_invoke;
    v9[3] = &unk_24CB50280;
    objc_copyWeak(&v10, (id *)buf);
    objc_msgSend(v8, "addFinishBlock:", v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __57__AMSUINotificationSettingsViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__AMSUINotificationSettingsViewController_viewDidAppear___block_invoke_2;
  block[3] = &unk_24CB4F370;
  v11 = v5;
  v12 = WeakRetained;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __57__AMSUINotificationSettingsViewController_viewDidAppear___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "_loadData");
  else
    return objc_msgSend(v2, "_handleAuthenticationError:", a1[6]);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)AMSUINotificationSettingsViewController;
  -[AMSUINotificationSettingsViewController viewWillLayoutSubviews](&v33, sel_viewWillLayoutSubviews);
  -[AMSUINotificationSettingsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUINotificationSettingsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[AMSUINotificationSettingsViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[AMSUINotificationSettingsViewController loadingView](self, "loadingView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  -[AMSUINotificationSettingsViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[AMSUINotificationSettingsViewController errorView](self, "errorView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUINotificationSettingsViewController;
  -[AMSUINotificationSettingsViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[AMSUINotificationSettingsViewController _commitChangedItemsUpdates](self, "_commitChangedItemsUpdates");
}

- (void)_commitChangedItemsUpdates
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[AMSUINotificationSettingsViewController changedItems](self, "changedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v9;
      v21 = 2114;
      v22 = v10;
      v23 = 2048;
      v24 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating %lu notification settings", buf, 0x20u);

    }
    v11 = objc_alloc(MEMORY[0x24BE082D0]);
    -[AMSUINotificationSettingsViewController identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUINotificationSettingsViewController account](self, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUINotificationSettingsViewController bag](self, "bag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v11, "initWithIdentifier:account:bag:", v12, v13, v14);

    objc_msgSend(v7, "updateSettings:", v4);
    v15 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __69__AMSUINotificationSettingsViewController__commitChangedItemsUpdates__block_invoke;
    v18[3] = &unk_24CB4F510;
    v18[4] = self;
    -[NSObject addFinishBlock:](v15, "addFinishBlock:", v18);
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No settings changed, not updating", buf, 0x16u);

    }
  }

}

void __69__AMSUINotificationSettingsViewController__commitChangedItemsUpdates__block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (a2)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v8 = "%{public}@: [%{public}@] Successfully updated notification settings";
LABEL_10:
      _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);

    }
  }
  else
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v7;
      v8 = "%{public}@: [%{public}@] Failed to update notification settings";
      goto LABEL_10;
    }
  }

}

- (void)_commonSetup
{
  AMSUILoadingView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  AMSUILoadingView *v8;
  AMSUILoadingView *loadingView;
  UNUserNotificationCenter *v10;
  UNUserNotificationCenter *notificationCenter;
  AMSUINotificationSettingsViewModel *v12;
  AMSUINotificationSettingsViewModel *model;
  UITableView *v14;
  UITableView *tableView;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _UIContentUnavailableView *v20;
  _UIContentUnavailableView *errorView;
  void *v22;
  void *v23;
  void *v24;
  _UIContentUnavailableView *v25;
  _QWORD v26[4];
  id v27;
  id location;

  v3 = [AMSUILoadingView alloc];
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = -[AMSUILoadingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  loadingView = self->_loadingView;
  self->_loadingView = v8;

  objc_msgSend(MEMORY[0x24BDF88B8], "currentNotificationCenter");
  v10 = (UNUserNotificationCenter *)objc_claimAutoreleasedReturnValue();
  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v10;

  v12 = objc_alloc_init(AMSUINotificationSettingsViewModel);
  model = self->_model;
  self->_model = v12;

  -[AMSUINotificationSettingsViewModel setDelegate:](self->_model, "setDelegate:", self);
  v14 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F0]), "initWithFrame:style:", 2, v4, v5, v6, v7);
  tableView = self->_tableView;
  self->_tableView = v14;

  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kAMSUINotificationInAppSettingsCellIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kAMSUINotificationInAppSettingsButtonCellIdentifier"));
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self->_model);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[AMSUINotificationSettingsViewController _updateNotificationStatus](self, "_updateNotificationStatus");
  v16 = objc_alloc(MEMORY[0x24BEBDBB0]);
  -[AMSUINotificationSettingsViewController bag](self, "bag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("DEFAULT_ERROR_TITLE"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (_UIContentUnavailableView *)objc_msgSend(v16, "initWithFrame:title:style:", v19, 0, v4, v5, v6, v7);
  errorView = self->_errorView;
  self->_errorView = v20;

  -[_UIContentUnavailableView setMessage:](self->_errorView, "setMessage:", &stru_24CB5A078);
  -[AMSUINotificationSettingsViewController bag](self, "bag");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("DEFAULT_ERROR_BUTTON"), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContentUnavailableView setButtonTitle:](self->_errorView, "setButtonTitle:", v24);

  objc_initWeak(&location, self);
  v25 = self->_errorView;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __55__AMSUINotificationSettingsViewController__commonSetup__block_invoke;
  v26[3] = &unk_24CB4F800;
  objc_copyWeak(&v27, &location);
  -[_UIContentUnavailableView setButtonAction:](v25, "setButtonAction:", v26);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __55__AMSUINotificationSettingsViewController__commonSetup__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "errorView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeFromSuperview");

  objc_msgSend(WeakRetained, "_loadData");
}

- (void)_handleAllowNotificationsButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  _QWORD v19[5];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[AMSUINotificationSettingsViewController shouldDeepLink](self, "shouldDeepLink"))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("prefs:root=NOTIFICATIONS_ID&path=%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BE082E8];
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "openStandardURL:", v8);

    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v13;
      v22 = 2114;
      v23 = v14;
      v15 = "%{public}@: [%{public}@] Successfully opened URL to notifications page.";
      v16 = v12;
      v17 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v18 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v18;
      v22 = 2114;
      v23 = v14;
      v15 = "%{public}@: [%{public}@] Failed to open URL to notifications page.";
      v16 = v12;
      v17 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_211102000, v16, v17, v15, buf, 0x16u);

LABEL_13:
    goto LABEL_14;
  }
  -[AMSUINotificationSettingsViewController notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __74__AMSUINotificationSettingsViewController__handleAllowNotificationsButton__block_invoke;
  v19[3] = &unk_24CB4F510;
  v19[4] = self;
  objc_msgSend(v6, "requestAuthorizationWithOptions:completionHandler:", 38, v19);
LABEL_14:

}

void __74__AMSUINotificationSettingsViewController__handleAllowNotificationsButton__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authorization granted.", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_updateNotificationStatus");
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to acquire authorization. Error: %{public}@", (uint8_t *)&v14, 0x20u);

    }
  }

}

- (void)_loadData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  -[AMSUINotificationSettingsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUINotificationSettingsViewController loadingView](self, "loadingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[AMSUINotificationSettingsViewController loadingView](self, "loadingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimating");

  v6 = objc_alloc(MEMORY[0x24BE082D0]);
  -[AMSUINotificationSettingsViewController identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUINotificationSettingsViewController account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUINotificationSettingsViewController bag](self, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithIdentifier:account:bag:", v7, v8, v9);

  objc_msgSend(v10, "fetchAllSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__AMSUINotificationSettingsViewController__loadData__block_invoke;
  v12[3] = &unk_24CB502A8;
  v12[4] = self;
  objc_msgSend(v11, "addFinishBlock:", v12);

}

void __52__AMSUINotificationSettingsViewController__loadData__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD block[5];

  if (a3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__AMSUINotificationSettingsViewController__loadData__block_invoke_2;
    block[3] = &unk_24CB4F0E8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    objc_msgSend(a2, "sections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSections:", v4);

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__AMSUINotificationSettingsViewController__loadData__block_invoke_3;
    v6[3] = &unk_24CB4F0E8;
    v6[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v6);
  }
}

void __52__AMSUINotificationSettingsViewController__loadData__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "loadingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "errorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

}

void __52__AMSUINotificationSettingsViewController__loadData__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentScrollView:forEdge:", v5, 15);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (void)_updateNotificationStatus
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[AMSUINotificationSettingsViewController notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__AMSUINotificationSettingsViewController__updateNotificationStatus__block_invoke;
  v4[3] = &unk_24CB502D0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "getNotificationSettingsWithCompletionHandler:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __68__AMSUINotificationSettingsViewController__updateNotificationStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD block[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(v3, "authorizationStatus") == 2)
  {
    objc_msgSend(WeakRetained, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
  }
  else
  {
    if (objc_msgSend(v3, "authorizationStatus") == 1)
      objc_msgSend(WeakRetained, "setShouldDeepLink:", 1);
    objc_msgSend(WeakRetained, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1;
  }
  objc_msgSend(v5, "setShowAllowNotificationsButton:", v7);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__AMSUINotificationSettingsViewController__updateNotificationStatus__block_invoke_2;
  block[3] = &unk_24CB4F0E8;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __68__AMSUINotificationSettingsViewController__updateNotificationStatus__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (ACAccount)account
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (BOOL)_isAuthenticated
{
  void *v2;
  BOOL v3;

  -[AMSUINotificationSettingsViewController account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_handleAuthenticationError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to authenticate an account. Error: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  -[AMSUINotificationSettingsViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSUINotificationSettingsViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "popViewControllerAnimated:", 1);

  }
  else
  {
    -[AMSUINotificationSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (id)_promptForAuthentication
{
  void *v3;
  void *v4;
  void *v5;
  AMSUIAuthenticateTask *v6;
  void *v7;
  AMSUIAuthenticateTask *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAuthenticationType:", 2);
  -[AMSUINotificationSettingsViewController clientInfo](self, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientInfo:", v4);

  objc_msgSend(v3, "setDebugReason:", CFSTR("Account is not present while attempting to show notification settings."));
  objc_msgSend(v3, "setEnableAccountCreation:", 0);
  AMSLogKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLogKey:", v5);

  v6 = [AMSUIAuthenticateTask alloc];
  -[AMSUINotificationSettingsViewController account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AMSUIAuthenticateTask initWithAccount:presentingViewController:options:](v6, "initWithAccount:presentingViewController:options:", v7, self, v3);

  -[AMSAuthenticateTask performAuthentication](v8, "performAuthentication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)viewModel:(id)a3 didReceiveValueChange:(id)a4 forItem:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %@ setting changed", (uint8_t *)&v14, 0x20u);

  }
  -[AMSUINotificationSettingsViewController changedItems](self, "changedItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, v13);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "section"))
  {
    -[AMSUINotificationSettingsViewController model](self, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "showAllowNotificationsButton");

    if (v8)
      -[AMSUINotificationSettingsViewController _handleAllowNotificationsButton](self, "_handleAllowNotificationsButton");
  }
  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v6, 1);

}

+ (AMSBagKeySet)bagKeySet
{
  return (AMSBagKeySet *)objc_msgSend(MEMORY[0x24BE082D0], "bagKeySet");
}

+ (NSString)bagSubProfile
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE082D0], "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE082D0], "bagSubProfileVersion");
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableDictionary)changedItems
{
  return self->_changedItems;
}

- (void)setChangedItems:(id)a3
{
  objc_storeStrong((id *)&self->_changedItems, a3);
}

- (_UIContentUnavailableView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
  objc_storeStrong((id *)&self->_errorView, a3);
}

- (AMSUILoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (AMSUINotificationSettingsViewModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (BOOL)shouldDeepLink
{
  return self->_shouldDeepLink;
}

- (void)setShouldDeepLink:(BOOL)a3
{
  self->_shouldDeepLink = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_changedItems, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
