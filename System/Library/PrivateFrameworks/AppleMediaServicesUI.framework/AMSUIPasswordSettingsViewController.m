@implementation AMSUIPasswordSettingsViewController

- (AMSUIPasswordSettingsViewController)initWithAccount:(id)a3
{
  id v5;
  AMSUIPasswordSettingsViewController *v6;
  AMSUIPasswordSettingsViewController *v7;
  id *p_account;
  id v9;
  uint64_t v10;
  UITableView *tableView;
  uint64_t v12;
  NSBundle *bundle;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIPasswordSettingsViewController;
  v6 = -[AMSUIPasswordSettingsViewController init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    p_account = (id *)&v6->_account;
    objc_storeStrong((id *)&v6->_account, a3);
    v7->_freeSetting = objc_msgSend(*p_account, "ams_freePasswordPromptSetting");
    v7->_paidSetting = objc_msgSend(*p_account, "ams_paidPasswordPromptSetting");
    v7->_isBiometricsEnabled = objc_msgSend(MEMORY[0x24BE08080], "isAvailableForAccount:", v5);
    v9 = objc_alloc(MEMORY[0x24BEBD9F0]);
    v10 = objc_msgSend(v9, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    tableView = v7->_tableView;
    v7->_tableView = (UITableView *)v10;

    -[UITableView setDataSource:](v7->_tableView, "setDataSource:", v7);
    -[UITableView setDelegate:](v7->_tableView, "setDelegate:", v7);
    -[UITableView setSeparatorStyle:](v7->_tableView, "setSeparatorStyle:", 1);
    -[UITableView registerClass:forCellReuseIdentifier:](v7->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Free"));
    -[UITableView registerClass:forCellReuseIdentifier:](v7->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Purchases"));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    v12 = objc_claimAutoreleasedReturnValue();
    bundle = v7->_bundle;
    v7->_bundle = (NSBundle *)v12;

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AMSUIPasswordSettingsViewController;
  -[AMSUIPasswordSettingsViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[AMSUIPasswordSettingsViewController bundle](self, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PASSWORD_SETTINGS_TITLE"), &stru_24CB5A078, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIPasswordSettingsViewController setTitle:](self, "setTitle:", v4);

  -[AMSUIPasswordSettingsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIPasswordSettingsViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[AMSUIPasswordSettingsViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[AMSUIPasswordSettingsViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[AMSUIPasswordSettingsViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAutoresizingMask:", 18);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_donePressed_);
  -[AMSUIPasswordSettingsViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRightBarButtonItem:", v18);

}

- (void)donePressed:(id)a3
{
  -[AMSUIPasswordSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Free"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIPasswordSettingsViewController bundle](self, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PASSWORD_SETTINGS_REQUIRE"), &stru_24CB5A078, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    if (objc_msgSend(MEMORY[0x24BE08398], "requirePasswordImmediately"))
    {
      objc_msgSend(v8, "toggle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 1;
    }
    else
    {
      v21 = -[AMSUIPasswordSettingsViewController freeSetting](self, "freeSetting") == 1;
      objc_msgSend(v8, "toggle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = v21;
    }
    objc_msgSend(v12, "setOn:", v14);

    objc_msgSend(v8, "setDelegate:", self);
    if (!-[AMSUIPasswordSettingsViewController paidSetting](self, "paidSetting")
      || (objc_msgSend(MEMORY[0x24BE08398], "requirePasswordImmediately") & 1) != 0
      || self->_isBiometricsEnabled)
    {
      objc_msgSend(v8, "contentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAlpha:", 0.5);

      objc_msgSend(v8, "toggle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = 0;
    }
    else
    {
      objc_msgSend(v8, "contentView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAlpha:", 1.0);

      objc_msgSend(v8, "toggle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = 1;
    }
    objc_msgSend(v23, "setEnabled:", v25);

    goto LABEL_23;
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Purchases"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE08398], "requirePasswordImmediately"))
  {
    objc_msgSend(v8, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 0.5);

  }
  v16 = objc_msgSend(v7, "row");
  -[AMSUIPasswordSettingsViewController bundle](self, "bundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v16)
  {
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PASSWORD_SETTINGS_ALWAYS"), &stru_24CB5A078, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setText:", v26);

    if (-[AMSUIPasswordSettingsViewController paidSetting](self, "paidSetting") != 1
      && -[AMSUIPasswordSettingsViewController paidSetting](self, "paidSetting")
      && !objc_msgSend(MEMORY[0x24BE08398], "requirePasswordImmediately"))
    {
      goto LABEL_20;
    }
LABEL_19:
    objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", v7, 1, 0);
    goto LABEL_21;
  }
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PASSWORD_SETTINGS_SOMETIMES"), &stru_24CB5A078, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v19);

  if (-[AMSUIPasswordSettingsViewController paidSetting](self, "paidSetting") == 2
    && (objc_msgSend(MEMORY[0x24BE08398], "requirePasswordImmediately") & 1) == 0)
  {
    goto LABEL_19;
  }
LABEL_20:
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
LABEL_21:
  if (self->_isBiometricsEnabled)
  {
    objc_msgSend(v8, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAlpha:", 0.5);

    objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "colorWithAlphaComponent:", 0.5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v30);

    objc_msgSend(v8, "setUserInteractionEnabled:", 0);
  }
LABEL_23:

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 1;
  else
    return 2;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[AMSUIPasswordSettingsViewController bundle](self, "bundle", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    v7 = CFSTR("PASSWORD_SETTINGS_FREE_HEADER");
  else
    v7 = CFSTR("PASSWORD_SETTINGS_PAID_HEADER");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24CB5A078, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 2114;
    v24 = v9;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Paid Downloads toggled", buf, 0x16u);

  }
  if (objc_msgSend(v5, "row"))
    v10 = 2;
  else
    v10 = 1;
  -[AMSUIPasswordSettingsViewController setPaidSetting:](self, "setPaidSetting:", v10);
  v11 = objc_alloc(MEMORY[0x24BE083D0]);
  -[AMSUIPasswordSettingsViewController account](self, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AMSUIPasswordSettingsViewController freeSetting](self, "freeSetting");
  v14 = -[AMSUIPasswordSettingsViewController paidSetting](self, "paidSetting");
  objc_msgSend(MEMORY[0x24BE083D0], "createBagForSubProfile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithAccount:freeSetting:paidSetting:delegate:bag:", v12, v13, v14, self, v15);

  objc_msgSend(v16, "performSync");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __73__AMSUIPasswordSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v19[3] = &unk_24CB504D8;
  v19[4] = self;
  v20 = v5;
  v18 = v5;
  objc_msgSend(v17, "addFinishBlock:", v19);

}

void __73__AMSUIPasswordSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  _QWORD block[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Paid Downloads sync failed - Toggling back", buf, 0x16u);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "paidSetting") == 1)
      v10 = 2;
    else
      v10 = 1;
    objc_msgSend(*(id *)(a1 + 32), "setPaidSetting:", v10);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__AMSUIPasswordSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_32;
    block[3] = &unk_24CB4F4C0;
    v11 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v17 = v11;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Paid Downloads Success", buf, 0x16u);

    }
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __73__AMSUIPasswordSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_35;
    v15[3] = &unk_24CB4F0E8;
    v15[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v15);
  }
}

void __73__AMSUIPasswordSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_32(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 5);

}

void __73__AMSUIPasswordSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_35(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  if ((objc_msgSend(MEMORY[0x24BE08398], "requirePasswordImmediately") & 1) != 0 || self->_isBiometricsEnabled)
  {
    v6 = 0;
  }
  else
  {
    if (objc_msgSend(v5, "section"))
      v7 = 0;
    else
      v7 = v5;
    v6 = v7;
  }

  return v6;
}

- (void)freeDownloadsToggle:(id)a3 changedValue:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
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
    *(_DWORD *)buf = 138543618;
    v23 = v9;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Free Downloads toggled", buf, 0x16u);

  }
  if (v4)
    v11 = 1;
  else
    v11 = 3;
  -[AMSUIPasswordSettingsViewController setFreeSetting:](self, "setFreeSetting:", v11);
  v12 = objc_alloc(MEMORY[0x24BE083D0]);
  -[AMSUIPasswordSettingsViewController account](self, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AMSUIPasswordSettingsViewController freeSetting](self, "freeSetting");
  v15 = -[AMSUIPasswordSettingsViewController paidSetting](self, "paidSetting");
  objc_msgSend(MEMORY[0x24BE083D0], "createBagForSubProfile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithAccount:freeSetting:paidSetting:delegate:bag:", v13, v14, v15, self, v16);

  objc_msgSend(v17, "performSync");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __72__AMSUIPasswordSettingsViewController_freeDownloadsToggle_changedValue___block_invoke;
  v20[3] = &unk_24CB504D8;
  v20[4] = self;
  v21 = v6;
  v19 = v6;
  objc_msgSend(v18, "addFinishBlock:", v20);

}

void __72__AMSUIPasswordSettingsViewController_freeDownloadsToggle_changedValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Free Download sync failed - Toggling back", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setOn:", objc_msgSend(*(id *)(a1 + 40), "isOn") ^ 1);
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Free Downloads Success", (uint8_t *)&v13, 0x16u);

    }
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  -[AMSUIPasswordSettingsViewController handleAuthenticateRequest:completion:](self, "handleAuthenticateRequest:completion:", a5, a6);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  -[AMSUIPasswordSettingsViewController handleDialogRequest:completion:](self, "handleDialogRequest:completion:", a5, a6);
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AMSUIAuthenticateTask *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = -[AMSUIAuthenticateTask initWithRequest:presentingViewController:]([AMSUIAuthenticateTask alloc], "initWithRequest:presentingViewController:", v7, self);

  -[AMSAuthenticateTask performAuthentication](v8, "performAuthentication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__AMSUIPasswordSettingsViewController_handleAuthenticateRequest_completion___block_invoke;
  v11[3] = &unk_24CB4F188;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "addFinishBlock:", v11);

}

uint64_t __76__AMSUIPasswordSettingsViewController_handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AMSUIAlertDialogTask *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = -[AMSUIAlertDialogTask initWithRequest:presentingViewController:]([AMSUIAlertDialogTask alloc], "initWithRequest:presentingViewController:", v7, self);

  -[AMSUIAlertDialogTask present](v8, "present");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__AMSUIPasswordSettingsViewController_handleDialogRequest_completion___block_invoke;
  v11[3] = &unk_24CB4F1B0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "addFinishBlock:", v11);

}

uint64_t __70__AMSUIPasswordSettingsViewController_handleDialogRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (ACAccount)account
{
  return self->_account;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (unint64_t)freeSetting
{
  return self->_freeSetting;
}

- (void)setFreeSetting:(unint64_t)a3
{
  self->_freeSetting = a3;
}

- (unint64_t)paidSetting
{
  return self->_paidSetting;
}

- (void)setPaidSetting:(unint64_t)a3
{
  self->_paidSetting = a3;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (BOOL)isBiometricsEnabled
{
  return self->_isBiometricsEnabled;
}

- (void)setIsBiometricsEnabled:(BOOL)a3
{
  self->_isBiometricsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
