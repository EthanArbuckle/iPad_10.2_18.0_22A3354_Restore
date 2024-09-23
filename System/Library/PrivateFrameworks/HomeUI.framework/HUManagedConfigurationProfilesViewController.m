@implementation HUManagedConfigurationProfilesViewController

- (HUManagedConfigurationProfilesViewController)initWithAccessory:(id)a3
{
  id v4;
  HUManagedConfigurationProfilesViewController *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUManagedConfigurationProfilesViewController;
  v5 = -[HUManagedConfigurationProfilesViewController initWithStyle:](&v8, sel_initWithStyle_, 2);
  if (v5)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUManagedConfigurationProfilesTitle"), CFSTR("HUManagedConfigurationProfilesTitle"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUManagedConfigurationProfilesViewController setTitle:](v5, "setTitle:", v6);

    -[HUManagedConfigurationProfilesViewController setAccessory:](v5, "setAccessory:", v4);
  }

  return v5;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUManagedConfigurationProfilesViewController;
  -[HUManagedConfigurationProfilesViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0CEAA70]);
  -[HUManagedConfigurationProfilesViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HUManagedConfigurationProfilesViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_1E6F5BB08;
  v6[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithTableView:cellProvider:", v4, v6);
  -[HUManagedConfigurationProfilesViewController setTableViewDataSource:](self, "setTableViewDataSource:", v5);

}

id __59__HUManagedConfigurationProfilesViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_newCellForProfile:", a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  HUManagedConfigurationProfilesViewController *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)HUManagedConfigurationProfilesViewController;
  -[HUManagedConfigurationProfilesViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v7 = self;
    v8 = 2080;
    v9 = "-[HUManagedConfigurationProfilesViewController viewWillAppear:]";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%@)%s: beginning fetch & reload sequence", buf, 0x16u);
  }

  -[HUManagedConfigurationProfilesViewController _fetchDataAndReloadTable](self, "_fetchDataAndReloadTable");
}

- (id)_newCellForProfile:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0D472B0]);
  -[HUManagedConfigurationProfilesViewController profiles](self, "profiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__HUManagedConfigurationProfilesViewController__newCellForProfile___block_invoke;
  v18[3] = &unk_1E6F5BB30;
  v8 = v5;
  v19 = v8;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D47220];
  objc_msgSend(v9, "profileData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v10, "profileWithData:outError:", v11, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;

  if (v13)
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v16;
      v22 = 2112;
      v23 = v9;
      _os_log_error_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_ERROR, "%@ Profile not found for %@", buf, 0x16u);

    }
  }
  objc_msgSend(v6, "setProfile:", v12);
  objc_msgSend(v6, "setAccessoryType:", 1);

  return v6;
}

uint64_t __67__HUManagedConfigurationProfilesViewController__newCellForProfile___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_fetchDataAndReloadTable
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  HUManagedConfigurationProfilesViewController *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HUManagedConfigurationProfilesViewController fetchDataFuture](self, "fetchDataFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HUManagedConfigurationProfilesViewController fetchDataFuture](self, "fetchDataFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFinished");

    if ((v6 & 1) == 0)
    {
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = self;
        v25 = 2080;
        v26 = "-[HUManagedConfigurationProfilesViewController _fetchDataAndReloadTable]";
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "(%@)%s: Called with existing fetch future - cancelling existing future", buf, 0x16u);
      }

      -[HUManagedConfigurationProfilesViewController fetchDataFuture](self, "fetchDataFuture");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cancel");

    }
  }
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke;
  v22[3] = &unk_1E6F51698;
  v22[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithCompletionHandlerAdapterBlock:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke_2;
  v21[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v21[4] = a2;
  v11 = (id)objc_msgSend(v10, "addFailureBlock:", v21);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke_28;
  v20[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v20[4] = a2;
  v12 = (id)objc_msgSend(v10, "addSuccessBlock:", v20);
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = self;
    v25 = 2080;
    v26 = "-[HUManagedConfigurationProfilesViewController _fetchDataAndReloadTable]";
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "(%@)%s: Kicking off fetch future - will reload if successful", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v15 = v9;
  v16 = 3221225472;
  v17 = __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke_31;
  v18 = &unk_1E6F5BB58;
  objc_copyWeak(&v19, (id *)buf);
  objc_msgSend(v10, "flatMap:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUManagedConfigurationProfilesViewController setFetchDataFuture:](self, "setFetchDataFuture:", v14, v15, v16, v17, v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

void __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "accessory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchManagedConfigurationProfilesWithCompletionHandler:", v3);

}

void __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "%@ Error fetching managed configuration profiles %@", (uint8_t *)&v6, 0x16u);

  }
}

void __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_debug_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEBUG, "%@ fetching managed configuration profiles returned %@", (uint8_t *)&v6, 0x16u);

  }
}

id __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke_31(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v8;
  id v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setProfiles:", v3);

  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = WeakRetained;
    v10 = 2080;
    v11 = "-[HUManagedConfigurationProfilesViewController _fetchDataAndReloadTable]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%@)%s: fetch future succeeded, reloading table view...", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(WeakRetained, "_reloadTableViewWithExistingData");
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_reloadTableViewWithExistingData
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke;
  v3[3] = &unk_1E6F4DD08;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "performBlock:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = WeakRetained;
    v16 = 2080;
    v17 = "-[HUManagedConfigurationProfilesViewController _reloadTableViewWithExistingData]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%@)%s: Reload for managed configuration profiles table", buf, 0x16u);
  }

  v3 = (void *)objc_opt_new();
  objc_msgSend(WeakRetained, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_221);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v5);

  objc_msgSend(WeakRetained, "profiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke_2;
  v12[3] = &unk_1E6F5BBC0;
  v8 = v3;
  v13 = v8;
  objc_msgSend(v6, "na_each:", v12);

  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v15 = WeakRetained;
    v16 = 2080;
    v17 = "-[HUManagedConfigurationProfilesViewController _reloadTableViewWithExistingData]_block_invoke_3";
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "(%@)%s: applying snapshot: %@", buf, 0x20u);
  }

  objc_msgSend(WeakRetained, "tableViewDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke_40;
  v11[3] = &unk_1E6F4D988;
  v11[4] = WeakRetained;
  objc_msgSend(v10, "applySnapshot:animatingDifferences:completion:", v8, 0, v11);

}

uint64_t __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke_35(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v5, v6);
}

void __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke_40(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412546;
    v5 = v3;
    v6 = 2080;
    v7 = "-[HUManagedConfigurationProfilesViewController _reloadTableViewWithExistingData]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%@)%s: snapshot applied", (uint8_t *)&v4, 0x16u);
  }

}

- (id)_profileForIdentifier:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUManagedConfigurationProfilesViewController profiles](self, "profiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__HUManagedConfigurationProfilesViewController__profileForIdentifier___block_invoke;
  v17[3] = &unk_1E6F5BB30;
  v7 = v5;
  v18 = v7;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D47220];
  objc_msgSend(v8, "profileData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v9, "profileWithData:outError:", v10, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;

  if (v12)
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v15;
      v21 = 2112;
      v22 = v7;
      _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "%@ Profile not found for %@", buf, 0x16u);

    }
  }

  return v11;
}

uint64_t __70__HUManagedConfigurationProfilesViewController__profileForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_removeProfileForIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13[2];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  HUManagedConfigurationProfilesViewController *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[HUManagedConfigurationProfilesViewController _removeProfileForIdentifier:]";
    v16 = 2112;
    v17 = self;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%s(%@) Removing profileIdentifier = %@ ", buf, 0x20u);
  }

  -[HUManagedConfigurationProfilesViewController _profileForIdentifier:](self, "_profileForIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_initWeak((id *)buf, self);
    -[HUManagedConfigurationProfilesViewController _confirmProfileDeletion:](self, "_confirmProfileDeletion:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke;
    v11[3] = &unk_1E6F5BC38;
    objc_copyWeak(v13, (id *)buf);
    v12 = v5;
    v13[1] = (id)a2;
    objc_msgSend(v8, "flatMap:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

id __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1E0D519C0];
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke_2;
  v20[3] = &unk_1E6F5BBE8;
  objc_copyWeak(&v22, (id *)(a1 + 40));
  v21 = *(id *)(a1 + 32);
  objc_msgSend(v5, "futureWithErrorOnlyHandlerAdapterBlock:", v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke_3;
  v17[3] = &unk_1E6F4E568;
  v19 = *(_QWORD *)(a1 + 48);
  v18 = *(id *)(a1 + 32);
  v8 = (id)objc_msgSend(v7, "addFailureBlock:", v17);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke_43;
  v13[3] = &unk_1E6F5BC10;
  v16 = *(_QWORD *)(a1 + 48);
  v14 = *(id *)(a1 + 32);
  v15 = WeakRetained;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v13);
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reschedule:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v22);
  return v11;
}

void __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeManagedConfigurationProfileWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 32), v4);

}

void __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "%@ Error removing profile %@: %@", (uint8_t *)&v7, 0x20u);

  }
}

uint64_t __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke_43(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@ Profile %@ removed", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_fetchDataAndReloadTable");
}

- (id)_confirmProfileDeletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessorySettingsProfileViewControllerRemoveProfile"), CFSTR("HUAccessorySettingsProfileViewControllerRemoveProfile"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "needsReboot");

  if (v6)
    v7 = CFSTR("HUAccessorySettingsProfileViewControllerRemoveNeedsReboot");
  else
    v7 = CFSTR("HUAccessorySettingsProfileViewControllerRemove");
  _HULocalizedStringWithDefaultValue(v7, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessorySettingsProfileViewControllerDeleteActionTitle"), CFSTR("HUAccessorySettingsProfileViewControllerDeleteActionTitle"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessorySettingsProfileViewControllerCancelActionTitle"), CFSTR("HUAccessorySettingsProfileViewControllerCancelActionTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v5, v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CEA2E0];
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__HUManagedConfigurationProfilesViewController__confirmProfileDeletion___block_invoke;
  v25[3] = &unk_1E6F4C6E0;
  v14 = v4;
  v26 = v14;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v9, 2, v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0CEA2E0];
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __72__HUManagedConfigurationProfilesViewController__confirmProfileDeletion___block_invoke_2;
  v23[3] = &unk_1E6F4C6E0;
  v17 = v14;
  v24 = v17;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v10, 1, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v18);

  -[HUManagedConfigurationProfilesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  v19 = v24;
  v20 = v17;

  return v20;
}

uint64_t __72__HUManagedConfigurationProfilesViewController__confirmProfileDeletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

void __72__HUManagedConfigurationProfilesViewController__confirmProfileDeletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  HUManagedConfigurationProfilesViewController *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HUManagedConfigurationProfilesViewController tableViewDataSource](self, "tableViewDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315906;
    v13 = "-[HUManagedConfigurationProfilesViewController tableView:didSelectRowAtIndexPath:]";
    v14 = 2112;
    v15 = self;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%s(%@) tapping indexPath = %@/profileIdentifier = %@ ", (uint8_t *)&v12, 0x2Au);
  }

  -[HUManagedConfigurationProfilesViewController _profileForIdentifier:](self, "_profileForIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D472B8]), "initWithStyle:profile:profileViewMode:", 1, v9, 2);
    objc_msgSend(v10, "setProfileViewControllerDelegate:", self);
    -[HUManagedConfigurationProfilesViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushViewController:animated:", v10, 1);

  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  HUManagedConfigurationProfilesViewController *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[HUManagedConfigurationProfilesViewController tableView:trailingSwipeActionsConfigurationForRowAtIndexPath:]";
    v23 = 2112;
    v24 = self;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%s(%@) User swiped for trailing actions on indexPath = %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v9 = (void *)MEMORY[0x1E0CEA4C0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUProfileDeletion"), CFSTR("HUProfileDeletion"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __109__HUManagedConfigurationProfilesViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
  v17[3] = &unk_1E6F55278;
  objc_copyWeak(&v19, (id *)buf);
  v11 = v7;
  v18 = v11;
  objc_msgSend(v9, "contextualActionWithStyle:title:handler:", 1, v10, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CEAA28];
  v20 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationWithActions:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return v15;
}

void __109__HUManagedConfigurationProfilesViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  id v9;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "tableViewDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifierForIndexPath:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(WeakRetained, "_removeProfileForIdentifier:", v8);
  v6[2](v6, 1);

}

- (BOOL)profileViewControllerIsProfileInstalled
{
  void *v2;
  BOOL v3;

  -[HUManagedConfigurationProfilesViewController profiles](self, "profiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)profileViewControllerDidSelectRemoveProfile:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SEL v22;
  _BYTE location[12];
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUManagedConfigurationProfilesViewController profiles](self, "profiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__HUManagedConfigurationProfilesViewController_profileViewControllerDidSelectRemoveProfile___block_invoke;
  v20[3] = &unk_1E6F5BC60;
  v22 = a2;
  v8 = v5;
  v21 = v8;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_initWeak((id *)location, self);
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUManagedConfigurationProfilesViewController _removeProfileForIdentifier:](self, "_removeProfileForIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __92__HUManagedConfigurationProfilesViewController_profileViewControllerDidSelectRemoveProfile___block_invoke_66;
    v17[3] = &unk_1E6F54D78;
    objc_copyWeak(&v19, (id *)location);
    v18 = v8;
    v12 = (id)objc_msgSend(v11, "flatMap:", v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)location);
  }
  else
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UIProfile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "profile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v14;
      v24 = 2112;
      v25 = v16;
      _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "%@ Profile %@ not found !?", location, 0x16u);

    }
  }

}

uint64_t __92__HUManagedConfigurationProfilesViewController_profileViewControllerDidSelectRemoveProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D47220];
  objc_msgSend(v3, "profileData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "profileWithData:outError:", v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;

  if (v7)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "%@ Profile not found for %@", buf, 0x16u);

    }
  }
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UIProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqualToString:", v12);

  return v13;
}

id __92__HUManagedConfigurationProfilesViewController_profileViewControllerDidSelectRemoveProfile___block_invoke_66(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  objc_msgSend(WeakRetained, "profiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    objc_msgSend(WeakRetained, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
  objc_msgSend(WeakRetained, "_fetchDataAndReloadTable");
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presentationDelegate, a3);
}

- (UITableViewDiffableDataSource)tableViewDataSource
{
  return self->_tableViewDataSource;
}

- (void)setTableViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewDataSource, a3);
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_profiles, a3);
}

- (NAFuture)fetchDataFuture
{
  return self->_fetchDataFuture;
}

- (void)setFetchDataFuture:(id)a3
{
  objc_storeStrong((id *)&self->_fetchDataFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchDataFuture, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end
