@implementation HUMobileTimerObjectTableViewController

- (HUMobileTimerObjectTableViewController)initWithMediaProfileContainer:(id)a3
{
  id v5;
  HUMobileTimerObjectTableViewController *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *mobileTimerObjects;
  void *v11;
  uint64_t v12;
  HMAccessory *accessory;
  NSUUID *v14;
  NSUUID *headerUUID;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HUMobileTimerObjectTableViewController;
  v6 = -[HUMobileTimerObjectTableViewController initWithStyle:](&v17, sel_initWithStyle_, 2);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessorySettingsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v6);

    objc_storeStrong((id *)&v6->_mediaProfileContainer, a3);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mobileTimerObjects = v6->_mobileTimerObjects;
    v6->_mobileTimerObjects = v9;

    objc_msgSend(v5, "accessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_firstObjectPassingTest:", &__block_literal_global_121);
    v12 = objc_claimAutoreleasedReturnValue();
    accessory = v6->_accessory;
    v6->_accessory = (HMAccessory *)v12;

    v6->_accessoryAccessState = 0;
    v14 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    headerUUID = v6->_headerUUID;
    v6->_headerUUID = v14;

  }
  return v6;
}

uint64_t __72__HUMobileTimerObjectTableViewController_initWithMediaProfileContainer___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "hf_isHomePod") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "hf_isSiriEndpoint");

  return v3;
}

- (unint64_t)numberOfMobileTimerObjects
{
  void *v2;
  unint64_t v3;

  -[HUMobileTimerObjectTableViewController mobileTimerObjects](self, "mobileTimerObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t, uint64_t, uint64_t, void *);
  void *v29;
  id v30;
  id location;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)HUMobileTimerObjectTableViewController;
  -[HUMobileTimerObjectTableViewController viewDidLoad](&v32, sel_viewDidLoad);
  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSectionContentInsetFollowsLayoutMargins:", 0);

  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsSelectionDuringEditing:", 1);

  v6 = -[HUMobileTimerObjectTableViewController _shouldAllowCellSelection](self, "_shouldAllowCellSelection");
  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsSelection:", v6);

  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setMarginWidth:", 1.0);

  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLayoutMarginsFollowReadableWidth:", 1);

  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEstimatedRowHeight:", 88.0);

  v11 = *MEMORY[0x1E0CEBC10];
  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRowHeight:", v11);

  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSectionHeaderHeight:", 0.0);

  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSectionFooterHeight:", 10.0);

  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSeparatorStyle:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v16);

  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setTopPadding:", 0.0);

  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setBottomPadding:", 0.0);

  -[HUMobileTimerObjectTableViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClipsToBounds:", 1);

  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", 8.0);

  objc_initWeak(&location, self);
  v23 = objc_alloc(MEMORY[0x1E0CEAA70]);
  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __53__HUMobileTimerObjectTableViewController_viewDidLoad__block_invoke;
  v29 = &unk_1E6F55100;
  objc_copyWeak(&v30, &location);
  v25 = (void *)objc_msgSend(v23, "initWithTableView:cellProvider:", v24, &v26);
  -[HUMobileTimerObjectTableViewController setTableViewDataSource:](self, "setTableViewDataSource:", v25, v26, v27, v28, v29);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

id __53__HUMobileTimerObjectTableViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "headerUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "hmf_isEqualToUUID:", v7);

  if (v8)
  {
    objc_msgSend(WeakRetained, "headerCellTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(WeakRetained, "_newCellForHeaderTitle:", v9);

  }
  else
  {
    v10 = (void *)objc_msgSend(WeakRetained, "_newCellForMTTimerObjectUUID:", v5);
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  HUMobileTimerObjectTableViewController *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HUMobileTimerObjectTableViewController;
  -[HUMobileTimerObjectTableViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2080;
    v10 = "-[HUMobileTimerObjectTableViewController viewWillAppear:]";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%@)%s: Starting initial load of table view with no MTObjects", buf, 0x16u);
  }

  -[HUMobileTimerObjectTableViewController _reloadTableViewWithExistingData](self, "_reloadTableViewWithExistingData");
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2080;
    v10 = "-[HUMobileTimerObjectTableViewController viewWillAppear:]";
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%@)%s: beginning full check, fetch & reload sequence", buf, 0x16u);
  }

  -[HUMobileTimerObjectTableViewController _checkAccessFetchDataAndReloadTable](self, "_checkAccessFetchDataAndReloadTable");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HUMobileTimerObjectTableViewController accessoryActivationTimer](self, "accessoryActivationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[HUMobileTimerObjectTableViewController setAccessoryActivationTimer:](self, "setAccessoryActivationTimer:", 0);
  v4.receiver = self;
  v4.super_class = (Class)HUMobileTimerObjectTableViewController;
  -[HUMobileTimerObjectTableViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_checkAccessFetchDataAndReloadTable
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  HUMobileTimerObjectTableViewController *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HUMobileTimerObjectTableViewController checkAccessAndFetchDataFuture](self, "checkAccessAndFetchDataFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HUMobileTimerObjectTableViewController checkAccessAndFetchDataFuture](self, "checkAccessAndFetchDataFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFinished");

    if ((v5 & 1) == 0)
    {
      HFLogForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v14 = self;
        v15 = 2080;
        v16 = "-[HUMobileTimerObjectTableViewController _checkAccessFetchDataAndReloadTable]";
        _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(%@)%s: Called with existing check+fetch future - cancelling existing future", buf, 0x16u);
      }

      -[HUMobileTimerObjectTableViewController checkAccessAndFetchDataFuture](self, "checkAccessAndFetchDataFuture");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancel");

    }
  }
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2080;
    v16 = "-[HUMobileTimerObjectTableViewController _checkAccessFetchDataAndReloadTable]";
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "(%@)%s: Kicking off check+fetch future - will reload if successful", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  -[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects](self, "_checkAndFetchTimerObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__HUMobileTimerObjectTableViewController__checkAccessFetchDataAndReloadTable__block_invoke;
  v11[3] = &unk_1E6F55128;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v9, "flatMap:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMobileTimerObjectTableViewController setCheckAccessAndFetchDataFuture:](self, "setCheckAccessAndFetchDataFuture:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

id __77__HUMobileTimerObjectTableViewController__checkAccessFetchDataAndReloadTable__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v5;
  id v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412546;
    v6 = WeakRetained;
    v7 = 2080;
    v8 = "-[HUMobileTimerObjectTableViewController _checkAccessFetchDataAndReloadTable]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%@)%s: Check+fetch future succeeded, reloading table view...", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(WeakRetained, "_reloadTableViewWithExistingData");
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_checkAndFetchTimerObjects
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  -[HUMobileTimerObjectTableViewController _canManagerControlAccessory](self, "_canManagerControlAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke;
  v9[3] = &unk_1E6F4EA10;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "flatMap:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_2_30;
  v8[3] = &unk_1E6F4F2D0;
  v8[4] = self;
  objc_msgSend(v5, "recover:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

id __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_msgSend(WeakRetained, "wasControllableAtLastCheck");
  if (v6 != objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = *MEMORY[0x1E0D30570];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v8;
    v35[1] = *MEMORY[0x1E0D30578];
    objc_msgSend(WeakRetained, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D30580], WeakRetained, v10);

  }
  objc_msgSend(WeakRetained, "setWasControllableAtLastCheck:", objc_msgSend(v3, "BOOLValue"));
  if (objc_msgSend(WeakRetained, "wasControllableAtLastCheck"))
    v11 = 1;
  else
    v11 = 2;
  objc_msgSend(WeakRetained, "setAccessoryAccessState:", v11);
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v26 = WeakRetained;
    v27 = 2080;
    v28 = "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke";
    v29 = 1024;
    v30 = objc_msgSend(WeakRetained, "wasControllableAtLastCheck");
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "(%@)%s: (_canManagerControlAccessory future has returned) accessory is controllable = %{BOOL}d", buf, 0x1Cu);
  }

  if (objc_msgSend(WeakRetained, "wasControllableAtLastCheck"))
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(WeakRetained, "accessoryAccessState") != 2;
      v15 = objc_msgSend(WeakRetained, "numberOfMobileTimerObjects");
      objc_msgSend(WeakRetained, "mobileTimerObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v26 = WeakRetained;
      v27 = 2080;
      v28 = "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke";
      v29 = 1024;
      v30 = v14;
      v31 = 2048;
      v32 = v15;
      v33 = 2112;
      v34 = v16;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "(%@)%s: Requesting mobile timer objects from Coordination framework. Controllable: %{BOOL}d BEFORE REQUEST: %lu MT Objects = %@", buf, 0x30u);

    }
    objc_msgSend(WeakRetained, "_baseMobileTimerObjectsFuture");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reschedule:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_18;
    v23[3] = &unk_1E6F545B8;
    objc_copyWeak(&v24, v4);
    objc_msgSend(v19, "addCompletionBlock:", v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "flatMap:", &__block_literal_global_28_1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

void __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_18(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (a3)
  {
    objc_msgSend(WeakRetained, "setWasControllableAtLastCheck:", 0);
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v7;
      v20 = 2080;
      v21 = "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke";
      v22 = 1024;
      v23 = objc_msgSend(v7, "accessoryAccessState") != 2;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "(%@)%s: MOBILE TIMER FUTURE FAILED. Controllable: %{BOOL}d", buf, 0x1Cu);
    }
  }
  else
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v19 = v7;
      v20 = 2080;
      v21 = "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke";
      v22 = 1024;
      v23 = objc_msgSend(v7, "accessoryAccessState") != 2;
      v24 = 2048;
      v25 = objc_msgSend(v5, "count");
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "(%@)%s: Received mobile timer objects from Coordination framework. Controllable: %{BOOL}d AFTER REQUEST: %lu MT Objects = %@", buf, 0x30u);
    }

    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      NSLog(CFSTR("(%@)%s: should only be called from the main thread"), v7, "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke");
    v10 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v5, "na_filter:", &__block_literal_global_22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMobileTimerObjects:", v12);

    objc_msgSend(v7, "mobileTimerObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortUsingComparator:", &__block_literal_global_24_1);

    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v7, "accessoryAccessState") != 2;
      objc_msgSend(v7, "mobileTimerObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      objc_msgSend(v7, "mobileTimerObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v19 = v7;
      v20 = 2080;
      v21 = "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke";
      v22 = 1024;
      v23 = v14;
      v24 = 2048;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "(%@)%s: Stripped unusable objects. Controllable: %{BOOL}d PRE RELOAD: %lu MTObjects = %@", buf, 0x30u);

    }
  }

}

uint64_t __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isIgnorableTimerObject") ^ 1;
}

uint64_t __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_26()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

id __68__HUMobileTimerObjectTableViewController__checkAndFetchTimerObjects__block_invoke_2_30(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setWasControllableAtLastCheck:", 0);
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412802;
    v9 = v7;
    v10 = 2080;
    v11 = "-[HUMobileTimerObjectTableViewController _checkAndFetchTimerObjects]_block_invoke_2";
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "(%@)%s: MANAGER ACCESS FUTURE FAILED. Err=%@", (uint8_t *)&v8, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  v3[2] = __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke;
  v3[3] = &unk_1E6F4DD08;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "performBlock:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  _BOOL4 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mobileTimerObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = objc_msgSend(WeakRetained, "accessoryAccessState") != 1;
  else
    v3 = 1;

  objc_msgSend(WeakRetained, "quickControlContentHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shouldHideQuickControlHeaderButton:forSectionIdentifier:", v3, v5);

  v6 = objc_msgSend(WeakRetained, "accessoryAccessState");
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v45 = (const char *)WeakRetained;
    v46 = 2080;
    v47 = "-[HUMobileTimerObjectTableViewController _reloadTableViewWithExistingData]_block_invoke";
    v48 = 2112;
    v49 = v9;
    v50 = 1024;
    v51 = v6 != 1;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "(%@)%s: Hiding the header for %@?: %{BOOL}d", buf, 0x26u);

  }
  objc_msgSend(WeakRetained, "quickControlContentHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shouldHideQuickControlHeaderText:forSectionIdentifier:", v6 != 1, v11);

  objc_msgSend(WeakRetained, "_configureNoItemsViewAnimated:", 1);
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(WeakRetained, "accessoryAccessState");
    *(_DWORD *)buf = 138412802;
    v45 = (const char *)WeakRetained;
    v46 = 2080;
    v47 = "-[HUMobileTimerObjectTableViewController _reloadTableViewWithExistingData]_block_invoke";
    v48 = 1024;
    LODWORD(v49) = v13 != 2;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "(%@)%s: Reload called & accessory available is %{BOOL}d", buf, 0x1Cu);
  }

  v14 = (void *)objc_opt_new();
  if (objc_msgSend(WeakRetained, "accessoryAccessState") == 1)
  {
    objc_msgSend(WeakRetained, "mobileTimerObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (!v16)
    {
      objc_msgSend(WeakRetained, "headerUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendSectionsWithIdentifiers:", v18);

      objc_msgSend(WeakRetained, "headerUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "headerUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v20, v21);

    }
    objc_msgSend(WeakRetained, "mobileTimerObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "na_map:", &__block_literal_global_36_2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendSectionsWithIdentifiers:", v23);

    objc_msgSend(WeakRetained, "mobileTimerObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke_2;
    v39[3] = &unk_1E6F55230;
    v26 = v14;
    v40 = v26;
    objc_msgSend(v24, "na_each:", v39);

    objc_msgSend(WeakRetained, "updatedMobileTimerObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v25;
    v38[1] = 3221225472;
    v38[2] = __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke_3;
    v38[3] = &unk_1E6F506B8;
    v38[4] = WeakRetained;
    objc_msgSend(v27, "na_filter:", v38);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v45 = "-[HUMobileTimerObjectTableViewController _reloadTableViewWithExistingData]_block_invoke_4";
      v46 = 2112;
      v47 = (const char *)WeakRetained;
      v48 = 2112;
      v49 = v28;
      _os_log_debug_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEBUG, "%s(%@) setting snapshot to reload updatedMobileTimerObjects: %@", buf, 0x20u);
    }

    objc_msgSend(v28, "na_map:", &__block_literal_global_40_0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "reloadItemsWithIdentifiers:", v30);

    if (objc_msgSend(WeakRetained, "redrawSpinnerCell"))
    {
      objc_msgSend(WeakRetained, "mobileTimerObjects");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (!v32)
      {
        objc_msgSend(WeakRetained, "headerUUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v33;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "reloadItemsWithIdentifiers:", v34);

      }
    }
    objc_msgSend(WeakRetained, "setUpdatedMobileTimerObjects:", 0);
    HFLogForCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v45 = (const char *)WeakRetained;
      v46 = 2080;
      v47 = "-[HUMobileTimerObjectTableViewController _reloadTableViewWithExistingData]_block_invoke_2";
      v48 = 2112;
      v49 = v26;
      _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "(%@)%s: applying snapshot: %@", buf, 0x20u);
    }

  }
  objc_msgSend(WeakRetained, "tableViewDataSource");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySnapshot:animatingDifferences:completion:", v14, 1, 0);

  objc_msgSend(WeakRetained, "_calculatePreferredContentSize");
  objc_msgSend(WeakRetained, "setPreferredContentSize:");
  objc_msgSend(WeakRetained, "_configureNoItemsViewAnimated:", 1);
  objc_msgSend(WeakRetained, "quickControlContentHelper");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "invalidateContentViewLayout");

}

uint64_t __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke_34(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v5, v6);
}

uint64_t __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "mobileTimerObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

uint64_t __74__HUMobileTimerObjectTableViewController__reloadTableViewWithExistingData__block_invoke_39(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (CGSize)_calculatePreferredContentSize
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  CGSize result;

  v3 = -[HUMobileTimerObjectTableViewController numberOfMobileTimerObjects](self, "numberOfMobileTimerObjects");
  -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "contentSize");
    v7 = v6;
    v9 = v8;
    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);

    -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;
    if (v7 == v10 && v9 == v11)
      objc_msgSend(v12, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB988], *(double *)(MEMORY[0x1E0CEB988] + 8));
    else
      objc_msgSend(v12, "contentSize");
    v17 = v14;
    v18 = v15;
  }
  else
  {
    objc_msgSend(v4, "bounds");
    v17 = v16;
    *(double *)&v18 = 140.0;
  }

  v19 = v17;
  v20 = *(double *)&v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)_quickDeleteMobileTimerObjectFromTable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__HUMobileTimerObjectTableViewController__quickDeleteMobileTimerObjectFromTable___block_invoke;
  v7[3] = &unk_1E6F50A68;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __81__HUMobileTimerObjectTableViewController__quickDeleteMobileTimerObjectFromTable___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tableViewDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteSectionsWithIdentifiers:", v5);

  objc_msgSend(WeakRetained, "tableViewDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySnapshot:animatingDifferences:", v4, 1);

}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  id location;
  void *v28;
  uint8_t buf[4];
  HUMobileTimerObjectTableViewController *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HUMobileTimerObjectTableViewController tableViewDataSource](self, "tableViewDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifierForIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMobileTimerObjectTableViewController headerUUID](self, "headerUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E0CEA4C0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUDeleteTitle"), CFSTR("HUDeleteTitle"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __103__HUMobileTimerObjectTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    v24 = &unk_1E6F55278;
    objc_copyWeak(&v26, &location);
    v15 = v7;
    v25 = v15;
    objc_msgSend(v13, "contextualActionWithStyle:title:handler:", 1, v14, &v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = self;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@: User swiped for trailing actions on indexPath: %@", buf, 0x16u);
    }

    v18 = (void *)MEMORY[0x1E0CEAA28];
    v28 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1, v21, v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configurationWithActions:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __103__HUMobileTimerObjectTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  void (**v6)(id, uint64_t);
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_removeTimerObjectAtIndexPath:", *(_QWORD *)(a1 + 32));
  v6[2](v6, 1);

}

- (void)_configureNoItemsViewAnimated:(BOOL)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  HUMobileTimerContentUnavailableView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  _QWORD v28[5];
  BOOL v29;

  v5 = -[HUMobileTimerObjectTableViewController accessoryAccessState](self, "accessoryAccessState");
  -[HUMobileTimerObjectTableViewController noItemsView](self, "noItemsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUMobileTimerObjectTableViewController noItemsView](self, "noItemsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[HUMobileTimerObjectTableViewController setNoItemsView:](self, "setNoItemsView:", 0);
  }
  if (v5 != 1 && -[HUMobileTimerObjectTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    v8 = objc_alloc_init(HUMobileTimerContentUnavailableView);
    -[HUMobileTimerObjectTableViewController setNoItemsView:](self, "setNoItemsView:", v8);

    if (-[HUMobileTimerObjectTableViewController accessoryAccessState](self, "accessoryAccessState") == 2)
    {
      -[HUMobileTimerObjectTableViewController unavailableTitle](self, "unavailableTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUMobileTimerObjectTableViewController noItemsView](self, "noItemsView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitle:", v9);

      -[HUMobileTimerObjectTableViewController unavailableText](self, "unavailableText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUMobileTimerObjectTableViewController noItemsView](self, "noItemsView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMessage:", v11);
    }
    else
    {
      -[HUMobileTimerObjectTableViewController loadingItemsTitle](self, "loadingItemsTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUMobileTimerObjectTableViewController noItemsView](self, "noItemsView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitle:", v11);
    }

    -[HUMobileTimerObjectTableViewController noItemsView](self, "noItemsView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setVibrantOptions:", 0);

    -[HUMobileTimerObjectTableViewController noItemsView](self, "noItemsView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUserInteractionEnabled:", 0);

    -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[HUMobileTimerObjectTableViewController noItemsView](self, "noItemsView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    -[HUMobileTimerObjectTableViewController tableView](self, "tableView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController noItemsView](self, "noItemsView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v26);

  }
  v27 = 0.2;
  if (v5 == 1 || !a3)
    v27 = 0.0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __72__HUMobileTimerObjectTableViewController__configureNoItemsViewAnimated___block_invoke;
  v28[3] = &unk_1E6F4D200;
  v28[4] = self;
  v29 = v5 == 1;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v28, v27);
}

void __72__HUMobileTimerObjectTableViewController__configureNoItemsViewAnimated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "noItemsView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (id)_newCellForHeaderTitle:(id)a3
{
  id v4;
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

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CEAA60]);
  objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HUMobileTimerObjectTableViewController itemShouldDisplaySpinner](self, "itemShouldDisplaySpinner"))
    objc_msgSend(v6, "setText:", v4);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials"))
    objc_msgSend(v5, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v7);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  if (-[HUMobileTimerObjectTableViewController itemShouldDisplaySpinner](self, "itemShouldDisplaySpinner"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v9);

    objc_msgSend(v9, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    objc_msgSend(v9, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    objc_msgSend(v9, "startAnimating");
  }
  objc_msgSend(MEMORY[0x1E0CEA370], "listGroupedCellConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColorTransformer:", &__block_literal_global_56_1);
  objc_msgSend(v19, "setCornerRadius:", 8.0);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryMaterial");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCustomView:", v20);

  }
  objc_msgSend(v5, "setBackgroundConfiguration:", v19);

  return v5;
}

uint64_t __65__HUMobileTimerObjectTableViewController__newCellForHeaderTitle___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "hf_homePodControlCellBackgroundColor");
}

- (BOOL)_shouldAllowCellSelection
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hostProcess") == 100)
  {

    return objc_msgSend(MEMORY[0x1E0D319D0], "isDeviceUnlocked");
  }
  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hostProcess");

  if (v4 == 3)
    return objc_msgSend(MEMORY[0x1E0D319D0], "isDeviceUnlocked");
  return 1;
}

- (void)_showSpinner:(BOOL)a3
{
  -[HUMobileTimerObjectTableViewController setItemShouldDisplaySpinner:](self, "setItemShouldDisplaySpinner:", a3);
  -[HUMobileTimerObjectTableViewController setRedrawSpinnerCell:](self, "setRedrawSpinnerCell:", 1);
}

- (BOOL)_activateAccessoryForMobileTimerCreation
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  HUMobileTimerObjectTableViewController *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_siriEndpointProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hf_needsOnboarding");

    if ((v6 & 1) != 0)
    {
      -[HUMobileTimerObjectTableViewController _showSpinner:](self, "_showSpinner:", 1);
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v16 = self;
        v17 = 2080;
        v18 = "-[HUMobileTimerObjectTableViewController _activateAccessoryForMobileTimerCreation]";
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ needs onboarding: kicking off Implicit Onboarding", buf, 0x20u);

      }
      v9 = objc_alloc_init(MEMORY[0x1E0CBA870]);
      objc_initWeak((id *)buf, self);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __82__HUMobileTimerObjectTableViewController__activateAccessoryForMobileTimerCreation__block_invoke;
      v13[3] = &unk_1E6F552E0;
      objc_copyWeak(&v14, (id *)buf);
      objc_msgSend(v4, "applyOnboardingSelections:completionHandler:", v9, v13);
      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
      LOBYTE(v10) = 0;
    }
    else
    {
      v10 = -[HUMobileTimerObjectTableViewController _isSiriEndpointActive](self, "_isSiriEndpointActive");
      HFLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v16 = self;
        v17 = 2080;
        v18 = "-[HUMobileTimerObjectTableViewController _activateAccessoryForMobileTimerCreation]";
        v19 = 2112;
        v20 = v11;
        v21 = 1024;
        v22 = v10;
        _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ is onboarded & active = %{BOOL}d", buf, 0x26u);

      }
    }

  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

void __82__HUMobileTimerObjectTableViewController__activateAccessoryForMobileTimerCreation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "[HMSiriEndpointProfile applyOnboardingSelections:completionHandler:] Implicit Onboarding failed with error: %@ - Add Timer/Alarm failed", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(WeakRetained, "_showSpinner:", 0);
    objc_msgSend(WeakRetained, "_reloadTableViewWithExistingData");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMSiriEndpointOnboardingResultAsString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v7;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "[HMSiriEndpointProfile applyOnboardingSelections:completionHandler:] Implicit Onboarding succeeded with result: %@", (uint8_t *)&v17, 0xCu);

    }
    if (objc_msgSend(WeakRetained, "_isSiriEndpointActive"))
    {
      objc_msgSend(WeakRetained, "_showSpinner:", 0);
      objc_msgSend(WeakRetained, "_reloadTableViewWithExistingData");
      HFLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "accessory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412802;
        v18 = WeakRetained;
        v19 = 2080;
        v20 = "-[HUMobileTimerObjectTableViewController _activateAccessoryForMobileTimerCreation]_block_invoke";
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ is onboarded & active", (uint8_t *)&v17, 0x20u);

      }
      objc_msgSend(WeakRetained, "presentAddMobileTimerObjectViewControllerOnMainThread");
    }
    else
    {
      HFLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "accessory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412802;
        v18 = WeakRetained;
        v19 = 2080;
        v20 = "-[HUMobileTimerObjectTableViewController _activateAccessoryForMobileTimerCreation]_block_invoke";
        v21 = 2112;
        v22 = v11;
        _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ is onboarded but NOT active, BEGINNING TO WAIT", (uint8_t *)&v17, 0x20u);

      }
      objc_msgSend(WeakRetained, "setCreateNewMTObjectPendingSidekickActivation:", 1);
      v12 = objc_alloc(MEMORY[0x1E0C99E88]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithFireDate:interval:target:selector:userInfo:repeats:", v13, WeakRetained, sel__accessoryActivationTimerFinished_, 0, 0, 20.0);
      objc_msgSend(WeakRetained, "setAccessoryActivationTimer:", v14);

      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "accessoryActivationTimer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addTimer:forMode:", v16, *MEMORY[0x1E0C99748]);

    }
  }

}

- (BOOL)_isSiriEndpointActive
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  HUMobileTimerObjectTableViewController *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_siriEndpointProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sessionState");

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138413314;
    v10 = self;
    v11 = 2080;
    v12 = "-[HUMobileTimerObjectTableViewController _isSiriEndpointActive]";
    v13 = 2112;
    v14 = v7;
    v15 = 1024;
    v16 = v5 == 1;
    v17 = 2048;
    v18 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ isActive = %{BOOL}d state: %ld", (uint8_t *)&v9, 0x30u);

  }
  return v5 == 1;
}

- (void)_accessoryActivationTimerFinished:(id)a3
{
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  HUMobileTimerObjectTableViewController *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[HUMobileTimerObjectTableViewController createNewMTObjectPendingSidekickActivation](self, "createNewMTObjectPendingSidekickActivation", a3))
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412546;
      v10 = self;
      v11 = 2080;
      v12 = "-[HUMobileTimerObjectTableViewController _accessoryActivationTimerFinished:]";
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "(%@)%s: We shouldn't get here", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_10;
  }
  -[HUMobileTimerObjectTableViewController _showSpinner:](self, "_showSpinner:", 0);
  -[HUMobileTimerObjectTableViewController _reloadTableViewWithExistingData](self, "_reloadTableViewWithExistingData");
  v4 = -[HUMobileTimerObjectTableViewController _isSiriEndpointActive](self, "_isSiriEndpointActive");
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = self;
      v11 = 2080;
      v12 = "-[HUMobileTimerObjectTableViewController _accessoryActivationTimerFinished:]";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ activation timer fired & is NOT activated - refreshing view to display unavailable text", (uint8_t *)&v9, 0x20u);

    }
LABEL_10:

    return;
  }
  if (v6)
  {
    -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = self;
    v11 = 2080;
    v12 = "-[HUMobileTimerObjectTableViewController _accessoryActivationTimerFinished:]";
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%@)%s: Siri endpoint accessory %@ activation timer fired & is activated - presenting add view controller...", (uint8_t *)&v9, 0x20u);

  }
  -[HUMobileTimerObjectTableViewController presentAddMobileTimerObjectViewControllerOnMainThread](self, "presentAddMobileTimerObjectViewControllerOnMainThread");
}

- (void)_checkAndAddTimerObject
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  HUMobileTimerObjectTableViewController *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[HUMobileTimerObjectTableViewController _activateAccessoryForMobileTimerCreation](self, "_activateAccessoryForMobileTimerCreation");
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = 138412546;
      v7 = self;
      v8 = 2080;
      v9 = "-[HUMobileTimerObjectTableViewController _checkAndAddTimerObject]";
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%@)%s: accessory active, kicking off New Mobile Timer object creation", (uint8_t *)&v6, 0x16u);
    }

    -[HUMobileTimerObjectTableViewController presentAddMobileTimerObjectViewControllerOnMainThread](self, "presentAddMobileTimerObjectViewControllerOnMainThread");
  }
  else
  {
    if (v5)
    {
      v6 = 138412546;
      v7 = self;
      v8 = 2080;
      v9 = "-[HUMobileTimerObjectTableViewController _checkAndAddTimerObject]";
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%@)%s: accessory NOT active, kicking off reload", (uint8_t *)&v6, 0x16u);
    }

    -[HUMobileTimerObjectTableViewController _reloadTableViewWithExistingData](self, "_reloadTableViewWithExistingData");
  }
}

- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  HUMobileTimerObjectTableViewController *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSObject *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[HUMobileTimerObjectTableViewController createNewMTObjectPendingSidekickActivation](self, "createNewMTObjectPendingSidekickActivation"))
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
    v13 = objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = self;
    v17 = 2080;
    v18 = "-[HUMobileTimerObjectTableViewController didReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:]";
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "(%@)%s: ignoring for Accessory %@ because there are no pending attempts to create a MTObject (settings = %@)", (uint8_t *)&v15, 0x2Au);
LABEL_11:

    goto LABEL_12;
  }
  -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "isEqual:", v9))
    goto LABEL_12;
  if (!-[HUMobileTimerObjectTableViewController _isSiriEndpointActive](self, "_isSiriEndpointActive"))
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = 138413058;
      v16 = self;
      v17 = 2080;
      v18 = "-[HUMobileTimerObjectTableViewController didReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:]";
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "(%@)%s: Accessory %@ is still NOT activated (settings = %@)", (uint8_t *)&v15, 0x2Au);

    }
    goto LABEL_11;
  }
  -[HUMobileTimerObjectTableViewController accessoryActivationTimer](self, "accessoryActivationTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  -[HUMobileTimerObjectTableViewController setAccessoryActivationTimer:](self, "setAccessoryActivationTimer:", 0);
  -[HUMobileTimerObjectTableViewController setCreateNewMTObjectPendingSidekickActivation:](self, "setCreateNewMTObjectPendingSidekickActivation:", 0);
  -[HUMobileTimerObjectTableViewController _showSpinner:](self, "_showSpinner:", 0);
  -[HUMobileTimerObjectTableViewController _reloadTableViewWithExistingData](self, "_reloadTableViewWithExistingData");
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
    v12 = objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = self;
    v17 = 2080;
    v18 = "-[HUMobileTimerObjectTableViewController didReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:]";
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "(%@)%s: Accessory %@ is now ACTIVATED (settings = %@)", (uint8_t *)&v15, 0x2Au);

  }
  -[HUMobileTimerObjectTableViewController presentAddMobileTimerObjectViewControllerOnMainThread](self, "presentAddMobileTimerObjectViewControllerOnMainThread");
LABEL_12:

}

- (id)_baseMobileTimerObjectsFuture
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMobileTimerObjectTableViewController.m"), 759, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUMobileTimerObjectTableViewController _baseMobileTimerObjectsFuture]", objc_opt_class());

  return 0;
}

- (id)_newCellForMTTimerObjectUUID:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMobileTimerObjectTableViewController.m"), 765, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUMobileTimerObjectTableViewController _newCellForMTTimerObjectUUID:]", objc_opt_class());

  return 0;
}

- (id)_canManagerControlAccessory
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMobileTimerObjectTableViewController.m"), 771, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUMobileTimerObjectTableViewController _canManagerControlAccessory]", objc_opt_class());

  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
}

- (id)_findTimerObjectForID:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMobileTimerObjectTableViewController.m"), 777, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUMobileTimerObjectTableViewController _findTimerObjectForID:]", objc_opt_class());

  return 0;
}

- (void)_removeTimerObjectAtIndexPath:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMobileTimerObjectTableViewController.m"), 783, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUMobileTimerObjectTableViewController _removeTimerObjectAtIndexPath:]", objc_opt_class());

}

- (void)presentAddMobileTimerObjectViewControllerOnMainThread
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMobileTimerObjectTableViewController.m"), 788, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUMobileTimerObjectTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]", objc_opt_class());

}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presentationDelegate, a3);
}

- (HUQuickControlContentHelper)quickControlContentHelper
{
  return (HUQuickControlContentHelper *)objc_loadWeakRetained((id *)&self->quickControlContentHelper);
}

- (void)setQuickControlContentHelper:(id)a3
{
  objc_storeWeak((id *)&self->quickControlContentHelper, a3);
}

- (BOOL)wasControllableAtLastCheck
{
  return self->_wasControllableAtLastCheck;
}

- (void)setWasControllableAtLastCheck:(BOOL)a3
{
  self->_wasControllableAtLastCheck = a3;
}

- (NAFuture)checkAccessAndFetchDataFuture
{
  return self->_checkAccessAndFetchDataFuture;
}

- (void)setCheckAccessAndFetchDataFuture:(id)a3
{
  objc_storeStrong((id *)&self->_checkAccessAndFetchDataFuture, a3);
}

- (unint64_t)accessoryAccessState
{
  return self->_accessoryAccessState;
}

- (void)setAccessoryAccessState:(unint64_t)a3
{
  self->_accessoryAccessState = a3;
}

- (HUMobileTimerContentUnavailableView)noItemsView
{
  return self->_noItemsView;
}

- (void)setNoItemsView:(id)a3
{
  objc_storeStrong((id *)&self->_noItemsView, a3);
}

- (NSTimer)accessoryActivationTimer
{
  return self->_accessoryActivationTimer;
}

- (void)setAccessoryActivationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryActivationTimer, a3);
}

- (BOOL)itemShouldDisplaySpinner
{
  return self->_itemShouldDisplaySpinner;
}

- (void)setItemShouldDisplaySpinner:(BOOL)a3
{
  self->_itemShouldDisplaySpinner = a3;
}

- (BOOL)redrawSpinnerCell
{
  return self->_redrawSpinnerCell;
}

- (void)setRedrawSpinnerCell:(BOOL)a3
{
  self->_redrawSpinnerCell = a3;
}

- (BOOL)createNewMTObjectPendingSidekickActivation
{
  return self->_createNewMTObjectPendingSidekickActivation;
}

- (void)setCreateNewMTObjectPendingSidekickActivation:(BOOL)a3
{
  self->_createNewMTObjectPendingSidekickActivation = a3;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void)setMediaProfileContainer:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, a3);
}

- (NSMutableArray)mobileTimerObjects
{
  return self->_mobileTimerObjects;
}

- (void)setMobileTimerObjects:(id)a3
{
  objc_storeStrong((id *)&self->_mobileTimerObjects, a3);
}

- (NSArray)updatedMobileTimerObjects
{
  return self->_updatedMobileTimerObjects;
}

- (void)setUpdatedMobileTimerObjects:(id)a3
{
  objc_storeStrong((id *)&self->_updatedMobileTimerObjects, a3);
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

- (NAFuture)outstandingMobileTimerObjectsFuture
{
  return self->_outstandingMobileTimerObjectsFuture;
}

- (void)setOutstandingMobileTimerObjectsFuture:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingMobileTimerObjectsFuture, a3);
}

- (NSString)loadingItemsTitle
{
  return self->_loadingItemsTitle;
}

- (void)setLoadingItemsTitle:(id)a3
{
  objc_storeStrong((id *)&self->_loadingItemsTitle, a3);
}

- (NSString)unavailableTitle
{
  return self->_unavailableTitle;
}

- (void)setUnavailableTitle:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableTitle, a3);
}

- (NSString)unavailableText
{
  return self->_unavailableText;
}

- (void)setUnavailableText:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableText, a3);
}

- (NSString)headerCellTitle
{
  return self->_headerCellTitle;
}

- (void)setHeaderCellTitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerCellTitle, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSUUID)headerUUID
{
  return self->_headerUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_headerCellTitle, 0);
  objc_storeStrong((id *)&self->_unavailableText, 0);
  objc_storeStrong((id *)&self->_unavailableTitle, 0);
  objc_storeStrong((id *)&self->_loadingItemsTitle, 0);
  objc_storeStrong((id *)&self->_outstandingMobileTimerObjectsFuture, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
  objc_storeStrong((id *)&self->_updatedMobileTimerObjects, 0);
  objc_storeStrong((id *)&self->_mobileTimerObjects, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_accessoryActivationTimer, 0);
  objc_storeStrong((id *)&self->_noItemsView, 0);
  objc_storeStrong((id *)&self->_checkAccessAndFetchDataFuture, 0);
  objc_destroyWeak((id *)&self->quickControlContentHelper);
  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end
