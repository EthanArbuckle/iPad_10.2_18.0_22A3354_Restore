@implementation MCDBrowsableContentTableViewController

- (MCDBrowsableContentTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (MCDBrowsableContentTableViewController)initWithContainer:(id)a3
{
  id v5;
  MCDBrowsableContentTableViewController *v6;
  MCDBrowsableContentTableViewController *v7;
  id *p_container;
  void *v9;
  _UIFilteredDataSource *v10;
  _UIFilteredDataSource *dataSource;
  void *v12;
  void *v13;
  CARSessionStatus *v14;
  CARSessionStatus *carSessionStatus;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *serialQueue;
  void *v22;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MCDBrowsableContentTableViewController;
  v6 = -[MCDBrowsableContentTableViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    p_container = (id *)&v6->_container;
    objc_storeStrong((id *)&v6->_container, a3);
    objc_msgSend(*p_container, "setDelegate:", v7);
    objc_msgSend(*p_container, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDBrowsableContentTableViewController setTitle:](v7, "setTitle:", v9);

    v10 = (_UIFilteredDataSource *)objc_alloc_init(MEMORY[0x24BEBDC28]);
    dataSource = v7->_dataSource;
    v7->_dataSource = v10;

    -[_UIFilteredDataSource setTableDataSource:](v7->_dataSource, "setTableDataSource:", v7);
    -[_UIFilteredDataSource setFilterType:](v7->_dataSource, "setFilterType:", 0);
    objc_msgSend(v5, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImageSize:", 48.0, 48.0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (CARSessionStatus *)objc_alloc_init(MEMORY[0x24BE15240]);
    carSessionStatus = v7->_carSessionStatus;
    v7->_carSessionStatus = v14;

    -[CARSessionStatus addSessionObserver:](v7->_carSessionStatus, "addSessionObserver:", v7);
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__limitedUIChanged_, *MEMORY[0x24BE151B8], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__nowPlayingDidChange_, CFSTR("MCDContentItemsChangedNotification"), 0);
    objc_msgSend(v5, "indexPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
      v7->_didFinishInitialLoad = 1;
    else
      objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__appRegisteredForContent_, CFSTR("appReadyToFetch"), 0);
    objc_msgSend(v5, "indexPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
      v7->_didFinishInitialLoad = 1;
    else
      objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__appRegisteredForContent_, CFSTR("appReadyToFetch"), 0);
    v20 = dispatch_queue_create("MCDBrowsableContentViewControllerQueue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v20;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v7, sel__playbackStateChanged_, CFSTR("MCDPlaybackStateChangedNotification"), 0);

  }
  return v7;
}

- (MCDBrowsableContentTableViewController)initWithContainer:(id)a3 tabbedBrowsing:(BOOL)a4
{
  MCDBrowsableContentTableViewController *result;

  result = -[MCDBrowsableContentTableViewController initWithContainer:](self, "initWithContainer:", a3);
  result->_hasTabbedBrowsing = a4;
  return result;
}

- (void)dealloc
{
  void *v3;
  CPUINowPlayingButton *nowPlayingButton;
  OS_dispatch_queue *serialQueue;
  MCDPCContainer *container;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE151B8], 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", 0);
  nowPlayingButton = self->_nowPlayingButton;
  self->_nowPlayingButton = 0;

  serialQueue = self->_serialQueue;
  self->_serialQueue = 0;

  container = self->_container;
  self->_container = 0;

  v7.receiver = self;
  v7.super_class = (Class)MCDBrowsableContentTableViewController;
  -[MCDBrowsableContentTableViewController dealloc](&v7, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDBrowsableContentTableViewController container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _MCDStringFromIndexPath(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p [%@]>"), v5, self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *MCD_tableView;
  UIView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _MCDBrowsableTableView *v12;
  UITableView *tableView;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MCDBrowsableContentTableViewController;
  -[MCDBrowsableContentTableViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[MCDBrowsableContentTableViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isRootTableViewController = (unint64_t)objc_msgSend(v4, "count") < 2;

  -[MCDBrowsableContentTableViewController view](self, "view");
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  MCD_tableView = self->_MCD_tableView;
  self->_MCD_tableView = v5;
  v7 = v5;

  -[UIView bounds](v7, "bounds");
  v12 = -[_MCDBrowsableTableView initWithFrame:]([_MCDBrowsableTableView alloc], "initWithFrame:", v8, v9, v10, v11);
  tableView = self->_tableView;
  self->_tableView = &v12->super;

  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UIView addSubview:](v7, "addSubview:", self->_tableView);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self->_dataSource);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setRemembersLastFocusedIndexPath:](self->_tableView, "setRemembersLastFocusedIndexPath:", 1);
  v14 = *MEMORY[0x24BEBE770];
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x24BEBE770]);
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:", v14);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MCDBrowsableContentTableViewController;
  -[MCDBrowsableContentTableViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  if (self->_hasTabbedBrowsing)
  {
    -[MCDBrowsableContentTableViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNavigationBarHidden:animated:", self->_isRootTableViewController, 1);

  }
  -[MCDBrowsableContentTableViewController _clearTableViewSelectionAnimated:](self, "_clearTableViewSelectionAnimated:", v3);
  objc_msgSend(MEMORY[0x24BEBD8F8], "_carScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasCarScreen = v6 != 0;

  -[MCDBrowsableContentTableViewController _updateNowPlayingButtonVisibility](self, "_updateNowPlayingButtonVisibility");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  -[MCDBrowsableContentTableViewController setVisible:](self, "setVisible:", 1);
  v8.receiver = self;
  v8.super_class = (Class)MCDBrowsableContentTableViewController;
  -[MCDBrowsableContentTableViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  -[MCDBrowsableContentTableViewController setDidFinishInitialViewAppear:](self, "setDidFinishInitialViewAppear:", 1);
  -[MCDBrowsableContentTableViewController container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteGetSupportedBrowsableContentAPIs();

  -[UITableView flashScrollIndicators](self->_tableView, "flashScrollIndicators");
}

void __56__MCDBrowsableContentTableViewController_viewDidAppear___block_invoke(uint64_t a1, int a2, int a3)
{
  NSObject *v4;
  _BOOL4 v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1058) = (a3 | a2) == 0;
  MCDGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1058) == 0;
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Playable Content API implemented? %d", (uint8_t *)v6, 8u);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  MPWeakTimer *delayTimer;
  MPWeakTimer *loadingTimer;
  void *v6;
  NSIndexPath *v7;
  NSIndexPath *reselectIndexPath;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCDBrowsableContentTableViewController;
  -[MCDBrowsableContentTableViewController viewWillDisappear:](&v9, sel_viewWillDisappear_, a3);
  -[MPWeakTimer invalidate](self->_delayTimer, "invalidate");
  delayTimer = self->_delayTimer;
  self->_delayTimer = 0;

  -[MPWeakTimer invalidate](self->_loadingTimer, "invalidate");
  loadingTimer = self->_loadingTimer;
  self->_loadingTimer = 0;

  -[UITableView indexPathsForSelectedRows](self->_tableView, "indexPathsForSelectedRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  reselectIndexPath = self->_reselectIndexPath;
  self->_reselectIndexPath = v7;

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[MCDBrowsableContentTableViewController setVisible:](self, "setVisible:", 0);
  v6.receiver = self;
  v6.super_class = (Class)MCDBrowsableContentTableViewController;
  -[MCDBrowsableContentTableViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  -[MCDBrowsableContentTableViewController alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewDidLayoutSubviews
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
  UIView *MCD_tableView;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MCDBrowsableContentTableViewController;
  -[MCDBrowsableContentTableViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[MCDBrowsableContentTableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  MCD_tableView = self->_MCD_tableView;
  if (MCD_tableView)
    -[UIView setFrame:](MCD_tableView, "setFrame:", v5, v7, v9, v11);
}

- (void)_showLoadingScreen
{
  MPWeakTimer *delayTimer;
  void *v4;
  MPWeakTimer *v5;
  MPWeakTimer *loadingTimer;
  NSObject *v7;
  MCDLoadingContentView *v8;
  MCDLoadingContentView *v9;
  uint8_t v10[16];
  _QWORD v11[4];
  id v12;
  id location;

  -[MPWeakTimer invalidate](self->_delayTimer, "invalidate");
  delayTimer = self->_delayTimer;
  self->_delayTimer = 0;

  if (-[MCDBrowsableContentTableViewController isVisible](self, "isVisible"))
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x24BDDCD00];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __60__MCDBrowsableContentTableViewController__showLoadingScreen__block_invoke;
    v11[3] = &unk_24FD78188;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "timerWithInterval:repeats:block:", 0, v11, 10.0);
    v5 = (MPWeakTimer *)objc_claimAutoreleasedReturnValue();
    loadingTimer = self->_loadingTimer;
    self->_loadingTimer = v5;

    MCDGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22FBAA000, v7, OS_LOG_TYPE_DEFAULT, "Showing loading screen", v10, 2u);
    }

    v8 = [MCDLoadingContentView alloc];
    -[UITableView frame](self->_tableView, "frame");
    v9 = -[MCDLoadingContentView initWithFrame:](v8, "initWithFrame:");
    -[MCDBrowsableContentTableViewController _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __60__MCDBrowsableContentTableViewController__showLoadingScreen__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_showTimeoutScreen");
    WeakRetained = v2;
  }

}

- (void)_showTimeoutScreen
{
  MPWeakTimer *loadingTimer;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MCDErrorLoadingView *v11;
  void *v12;
  uint8_t buf[16];

  -[MPWeakTimer invalidate](self->_loadingTimer, "invalidate");
  loadingTimer = self->_loadingTimer;
  self->_loadingTimer = 0;

  if (-[MCDBrowsableContentTableViewController isVisible](self, "isVisible"))
  {
    MCDGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Showing timeout screen", buf, 2u);
    }

    v5 = (void *)MEMORY[0x24BDD17C8];
    MCDCarDisplayBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unable to connect to “%@.”"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDBrowsableContentTableViewController container](self, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[MCDErrorLoadingView initWithTitle:buttonText:]([MCDErrorLoadingView alloc], "initWithTitle:buttonText:", v10, 0);
    -[MCDBrowsableContentTableViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    -[MCDErrorLoadingView setFrame:](v11, "setFrame:");

    -[MCDErrorLoadingView setDelegate:](v11, "setDelegate:", self);
    -[MCDBrowsableContentTableViewController _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", v11);

  }
}

- (void)_replacePlaceholderViewWithView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  -[MCDBrowsableContentTableViewController placeholderView](self, "placeholderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCDBrowsableContentTableViewController placeholderView](self, "placeholderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
  -[MCDBrowsableContentTableViewController setPlaceholderView:](self, "setPlaceholderView:", v28);
  -[MCDBrowsableContentTableViewController placeholderView](self, "placeholderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", v7 == 0);

  -[MCDBrowsableContentTableViewController placeholderView](self, "placeholderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UITableView frame](self->_tableView, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[UITableView safeAreaInsets](self->_tableView, "safeAreaInsets");
    v18 = v10 + v17;
    v20 = v12 + v19;
    v22 = v14 - (v17 + v21);
    v24 = v16 - (v19 + v23);
    -[MCDBrowsableContentTableViewController placeholderView](self, "placeholderView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    -[UITableView superview](self->_tableView, "superview");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDBrowsableContentTableViewController placeholderView](self, "placeholderView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v27);

  }
}

- (void)errorViewDidTapButton:(id)a3
{
  MCDPCContainer *container;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  container = self->_container;
  MCDGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (container)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Retrying container reload, showing loading screen", buf, 2u);
    }

    -[MCDBrowsableContentTableViewController reloadWithCompletion:](self, "reloadWithCompletion:", 0);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Retrying full refresh, showing loading screen", v8, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("didInvalidate"), 0);

  }
  -[MCDBrowsableContentTableViewController _showLoadingScreen](self, "_showLoadingScreen");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  CPUINowPlayingButton *nowPlayingButton;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCDBrowsableContentTableViewController;
  -[MCDBrowsableContentTableViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, a3);
  -[MCDBrowsableContentTableViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") == 3;

  if (self->_hasCarScreen != v5)
  {
    self->_hasCarScreen = v5;
    -[MCDBrowsableContentTableViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutIfNeeded");

    -[MCDBrowsableContentTableViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", 0);

    nowPlayingButton = self->_nowPlayingButton;
    self->_nowPlayingButton = 0;

    -[MCDBrowsableContentTableViewController _updateNowPlayingButtonVisibility](self, "_updateNowPlayingButtonVisibility");
  }
}

- (id)contentScrollView
{
  if (self->_hasCarScreen)
    return 0;
  else
    return self->_tableView;
}

- (id)preferredFocusEnvironments
{
  void *v2;
  objc_super v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (self->_tableView)
  {
    v5[0] = self->_tableView;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MCDBrowsableContentTableViewController;
    -[MCDBrowsableContentTableViewController preferredFocusEnvironments](&v4, sel_preferredFocusEnvironments);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_configureCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int64_t v15;
  int v16;
  int v17;
  MCDBrowsableContentTableViewController *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  float v27;
  id *p_isa;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  int v42;
  float v43;
  void *v44;
  uint64_t v45;
  unsigned int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  double v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  -[MCDBrowsableContentTableViewController container](self, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedItemForIndex:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessoryView:", 0);
  -[UITableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v11;
  if (v11)
  {
    v12 = v11;
    if (objc_msgSend(v11, "compare:", v7))
    {
      -[MCDBrowsableContentTableViewController selectedIndexPath](self, "selectedIndexPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }
  v15 = -[MCDPCContainer showCurrentlyPlayingIndex](self->_container, "showCurrentlyPlayingIndex");
  if (!-[MCDBrowsableContentTableViewController currentlyPlayingApp](self, "currentlyPlayingApp"))
  {
    v49 = 0;
    if (!v14)
      goto LABEL_14;
LABEL_13:
    objc_msgSend(v6, "setSelected:", 0);
    goto LABEL_14;
  }
  v16 = objc_msgSend(v10, "currentlyPlaying");
  if (v15 == v8)
    v17 = v16;
  else
    v17 = 0;
  v49 = v17;
  if (v14)
    goto LABEL_13;
LABEL_14:
  v50 = v6;
  v48 = v7;
  v46 = v14;
  if (objc_msgSend(v10, "isCloudItem") && objc_msgSend(v10, "isPlayable"))
  {
    v18 = self;
    objc_msgSend(MEMORY[0x24BE153D0], "accessoryWithCloudIcon");
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v20 = (void *)v19;
    goto LABEL_21;
  }
  v18 = self;
  if (objc_msgSend(v10, "isContainer"))
  {
    objc_msgSend(MEMORY[0x24BE153D0], "accessoryWithDisclosureIndicator");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v20 = 0;
LABEL_21:
  v21 = (void *)MEMORY[0x24BE153D8];
  objc_msgSend(v10, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subtitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "artworkImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v10, "isExplicitItem");
  v26 = -[MCDPCContainer showPlaybackProgress](v18->_container, "showPlaybackProgress");
  objc_msgSend(v10, "playbackProgress");
  BYTE1(v45) = v49;
  LOBYTE(v45) = v26;
  p_isa = (id *)&v18->super.super.super.isa;
  objc_msgSend(v21, "configurationWithText:detailText:image:showExplicit:accessory:showActivityIndicator:showPlaybackProgress:playbackProgress:currentlyPlaying:", v22, v23, v24, v25, v20, v46, v27, v45);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v50;
  objc_msgSend(v50, "applyConfiguration:", v29);
  if (v49)
  {
    -[MCDBrowsableContentTableViewController container](v18, "container");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "model");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "playableContentPlaybackManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "playerState") == 2)
      v34 = 1;
    else
      v34 = 2;

    objc_msgSend(v50, "nowPlayingIndicator");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPlaybackState:", v34);

  }
  MCDGeneralLogging();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v29;
    objc_msgSend(v10, "title");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subtitle");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v10, "isExplicitItem");
    if (objc_msgSend(v10, "isCloudItem"))
      v41 = objc_msgSend(v10, "isPlayable");
    else
      v41 = 0;
    v42 = objc_msgSend(p_isa[134], "showPlaybackProgress");
    objc_msgSend(v10, "playbackProgress");
    *(_DWORD *)buf = 138545154;
    v52 = v38;
    v53 = 2114;
    v54 = v39;
    v55 = 1026;
    v56 = v40;
    v57 = 1026;
    v58 = v41;
    v59 = 1026;
    v60 = v42;
    v61 = 2050;
    v62 = v43;
    v63 = 1026;
    v64 = v49;
    v65 = 1026;
    v66 = objc_msgSend(v10, "isContainer");
    _os_log_impl(&dword_22FBAA000, v36, OS_LOG_TYPE_DEFAULT, "Cell displayed: title: %{public}@, subtitle: %{public}@, showExplicit: %{public}d, showCloud: %{public}d, shouldShowPlaybackProgress: %{public}d, playbackProgress: %{public}f, currentlyPlaying: %{public}d, isContainer: %{public}d", buf, 0x3Eu);

    v30 = v50;
    v29 = v37;
  }

  objc_msgSend(v30, "setNeedsLayout");
  if (objc_msgSend(v10, "isContainer"))
  {
    objc_msgSend(p_isa, "container");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "beginLoadingItem:completion:", v10, 0);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t count;

  count = 12;
  if (self->_count < 12)
    count = self->_count;
  if (self->_limited)
    return count;
  else
    return self->_count;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x24BE153C8];
  v7 = a4;
  objc_msgSend(v6, "cellForTableView:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDBrowsableContentTableViewController _configureCell:forIndexPath:](self, "_configureCell:forIndexPath:", v8, v7);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  MCDBrowsableContentTableViewController *v17;
  NSObject *v18;
  void *v19;
  MCDBrowsableContentTableViewController *v20;
  _QWORD v21[5];
  MCDBrowsableContentTableViewController *v22;
  _QWORD v23[5];
  uint8_t buf[16];
  _QWORD v25[4];
  id v26;
  id location;

  v6 = a3;
  v7 = a4;
  -[MCDPCContainer cachedItemForIndex:](self->_container, "cachedItemForIndex:", objc_msgSend(v7, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isContainer") & 1) == 0 && !objc_msgSend(v8, "isPlayable"))
  {
    v14 = v7;
    goto LABEL_14;
  }
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x24BDDCD00];
  v10 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v25[3] = &unk_24FD78188;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v9, "timerWithInterval:repeats:block:", 0, v25, 20.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDBrowsableContentTableViewController setLoadingTimer:](self, "setLoadingTimer:", v11);

  -[MCDBrowsableContentTableViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v7);
  -[MCDBrowsableContentTableViewController container](self, "container");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "indexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "indexPathByAddingIndex:", objc_msgSend(v7, "row"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isPlayable"))
  {
    MCDGeneralLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v15, OS_LOG_TYPE_DEFAULT, "Selected playable content, preparing to play back", buf, 2u);
    }

    -[MCDBrowsableContentTableViewController container](self, "container");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject model](v16, "model");
    v17 = (MCDBrowsableContentTableViewController *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_66;
    v23[3] = &unk_24FD781D8;
    v23[4] = self;
    -[MCDBrowsableContentTableViewController initiatePlaybackAtIndexPath:completion:](v17, "initiatePlaybackAtIndexPath:completion:", v14, v23);
  }
  else
  {
    if (!objc_msgSend(v8, "isContainer"))
    {
      MCDGeneralLogging();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22FBAA000, v16, OS_LOG_TYPE_DEFAULT, "Selected neither a container nor a playable cell", buf, 2u);
      }
      goto LABEL_12;
    }
    MCDGeneralLogging();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v18, OS_LOG_TYPE_DEFAULT, "Selected container, preparing to push to container", buf, 2u);
    }

    -[MCDBrowsableContentTableViewController container](self, "container");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "containerAtIndex:", objc_msgSend(v14, "indexAtPosition:", objc_msgSend(v14, "length") - 1));
    v16 = objc_claimAutoreleasedReturnValue();

    v20 = -[MCDBrowsableContentTableViewController initWithContainer:tabbedBrowsing:]([MCDBrowsableContentTableViewController alloc], "initWithContainer:tabbedBrowsing:", v16, self->_hasTabbedBrowsing);
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_69;
    v21[3] = &unk_24FD781B0;
    v21[4] = self;
    v17 = v20;
    v22 = v17;
    -[MCDBrowsableContentTableViewController reloadWithCompletion:](v17, "reloadWithCompletion:", v21);

  }
LABEL_12:

  -[MCDBrowsableContentTableViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__displayLoadingActivity, 0, 0.25);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
LABEL_14:

}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FC8];
    MCDCarDisplayBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ERROR_LOADING_ITEM"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("MCDError"), 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    MCDGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(WeakRetained, "_displayErrorAlertController:", v6);
    objc_msgSend(WeakRetained, "loadingTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidate");

    objc_msgSend(WeakRetained, "setLoadingTimer:", 0);
  }

}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "loadingTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v6[3] = &unk_24FD781B0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v19[8];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_clearLoadingActivity");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v2, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDDBAA8]);

    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BDD0FC8];
      MCDCarDisplayBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ERROR_LOADING_ITEM"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("MCDError"), 1, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      MCDGeneralLogging();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_cold_1(v10);

    }
    else
    {
      MCDGeneralLogging();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_cold_2(a1 + 40, v12, v13, v14, v15, v16, v17, v18);

      v9 = *(id *)(a1 + 40);
    }
    objc_msgSend(*(id *)(a1 + 32), "_displayErrorAlertController:", v9);

  }
  else
  {
    MCDGeneralLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_22FBAA000, v11, OS_LOG_TYPE_DEFAULT, "Initiating playback complete, preparing to push to now playing", v19, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setPushToNowPlaying:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_updateNowPlayingButtonVisibility");
  }
}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_69(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_70;
  v2[3] = &unk_24FD781B0;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_70(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "loadingTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "_clearLoadingActivity");
  MCDGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22FBAA000, v3, OS_LOG_TYPE_DEFAULT, "Container preparation complete, pushing to container", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)tableView:(id)a3 didFocusRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v9, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compare:", v5);

  if (v7)
  {
    objc_msgSend(v9, "cellForRowAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelected:", 0);

  }
}

- (void)_displayErrorAlertController:(id)a3
{
  id v4;
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
  _QWORD v15[5];

  v4 = a3;
  -[MCDBrowsableContentTableViewController alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(v4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", 0, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDBrowsableContentTableViewController setAlertController:](self, "setAlertController:", v8);

    v9 = (void *)MEMORY[0x24BEBD3A8];
    MCDCarDisplayBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[MCDBrowsableContentTableViewController alertController](self, "alertController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v12);

    -[MCDBrowsableContentTableViewController alertController](self, "alertController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __71__MCDBrowsableContentTableViewController__displayErrorAlertController___block_invoke;
    v15[3] = &unk_24FD78200;
    v15[4] = self;
    -[MCDBrowsableContentTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, v15);

  }
}

uint64_t __71__MCDBrowsableContentTableViewController__displayErrorAlertController___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_clearLoadingActivity");
  return objc_msgSend(*(id *)(a1 + 32), "setAlertController:", 0);
}

- (void)container:(id)a3 didInvalidateIndicies:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  MCDGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_22FBAA000, v8, OS_LOG_TYPE_DEFAULT, "Some content have invalidated, preparing to reload table view: %{public}@, indicies: %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  +[MCDMediaRemoteSerialQueueManager sharedInstance](MCDMediaRemoteSerialQueueManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__MCDBrowsableContentTableViewController_container_didInvalidateIndicies___block_invoke;
  v13[3] = &unk_24FD78250;
  objc_copyWeak(&v16, (id *)buf);
  v13[4] = self;
  v11 = v7;
  v14 = v11;
  v12 = v6;
  v15 = v12;
  objc_msgSend(v10, "addOperation:cancelAllOperations:", v13, 0);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __74__MCDBrowsableContentTableViewController_container_didInvalidateIndicies___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __74__MCDBrowsableContentTableViewController_container_didInvalidateIndicies___block_invoke_2;
  v3[3] = &unk_24FD78250;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_sync(MEMORY[0x24BDAC9B8], v3);

  objc_destroyWeak(&v6);
}

void __74__MCDBrowsableContentTableViewController_container_didInvalidateIndicies___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "indexPathsForVisibleRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__MCDBrowsableContentTableViewController_container_didInvalidateIndicies___block_invoke_3;
  v10[3] = &unk_24FD78228;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v3;
  v13 = WeakRetained;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 40);
  v7 = WeakRetained;
  v8 = v3;
  v9 = v5;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);

}

void __74__MCDBrowsableContentTableViewController_container_didInvalidateIndicies___block_invoke_3(uint64_t a1, unint64_t a2)
{
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a2 < 0xB || !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1056))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3))
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 56), "didFinishInitialLoad");
    MCDGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 64), "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 72);
        v12 = 138543618;
        v13 = v7;
        v14 = 2114;
        v15 = v8;
        _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Content that has been been invalidated is visible, reloading those index paths in table view: %{public}@, indicies: %{public}@", (uint8_t *)&v12, 0x16u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "reloadRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 48), 5);
    }
    else
    {
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 64), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 72);
        v12 = 138543618;
        v13 = v10;
        v14 = 2114;
        v15 = v11;
        _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Content has been invalidated, but view isn't finished loading yet. Container: %{public}@, indicies: %{public}@", (uint8_t *)&v12, 0x16u);

      }
    }
  }
  else
  {
    MCDGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_22FBAA000, v9, OS_LOG_TYPE_DEFAULT, "Content was invalidated, but there are no indexes to reload.", (uint8_t *)&v12, 2u);
    }

  }
}

- (void)containerDidChangeCount:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__MCDBrowsableContentTableViewController_containerDidChangeCount___block_invoke;
  block[3] = &unk_24FD78200;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __66__MCDBrowsableContentTableViewController_containerDidChangeCount___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v11[16];

  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "The container changed count, preparing to reload", v11, 2u);
  }

  if (MCDIndexPathIsRootForContainer(*(void **)(*(_QWORD *)(a1 + 32) + 1072)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "indexPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length") || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "cachedCount") < 1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "indexPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "length");

      if (!v5)
        goto LABEL_10;
    }
    else
    {

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "invalidate");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 1024);
    *(_QWORD *)(v6 + 1024) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "invalidate");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 1016);
    *(_QWORD *)(v8 + 1016) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_replacePlaceholderViewWithView:", 0);
  }
LABEL_10:
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1056) = objc_msgSend(*(id *)(a1 + 32), "_shouldLimitLists");
  return objc_msgSend(*(id *)(a1 + 32), "reloadTable");
}

- (void)_displayLoadingActivity
{
  UITableView *tableView;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  tableView = self->_tableView;
  -[MCDBrowsableContentTableViewController selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v4, 5);

}

- (void)_clearLoadingActivity
{
  UITableView *tableView;
  void *v4;
  UITableView *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__displayLoadingActivity, 0);
  tableView = self->_tableView;
  -[MCDBrowsableContentTableViewController selectedIndexPath](self, "selectedIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView deselectRowAtIndexPath:animated:](tableView, "deselectRowAtIndexPath:animated:", v4, 1);

  v5 = self->_tableView;
  -[MCDBrowsableContentTableViewController selectedIndexPath](self, "selectedIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v5, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 5);

}

- (void)_playbackStateChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  -[MCDBrowsableContentTableViewController container](self, "container", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playableContentPlaybackManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "playerState") == 2)
    v7 = 1;
  else
    v7 = 2;

  -[UITableView visibleCells](self->_tableView, "visibleCells");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__MCDBrowsableContentTableViewController__playbackStateChanged___block_invoke;
  v9[3] = &unk_24FD78278;
  v9[4] = self;
  v9[5] = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

void __64__MCDBrowsableContentTableViewController__playbackStateChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "indexPathForCell:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedItemForIndex:", objc_msgSend(v3, "row"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "currentlyPlayingApp"))
  {
    if (objc_msgSend(v5, "currentlyPlaying"))
    {
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "showCurrentlyPlayingIndex");
      if (v6 == objc_msgSend(v3, "row"))
      {
        v7 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v9, "nowPlayingIndicator");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPlaybackState:", v7);

      }
    }
  }

}

- (void)reloadWithCompletion:(id)a3
{
  id v4;
  _BOOL4 IsRootForContainer;
  uint64_t v6;
  void *v7;
  MPWeakTimer *v8;
  MPWeakTimer *delayTimer;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  MCDPCContainer *container;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  IsRootForContainer = MCDIndexPathIsRootForContainer(self->_container);
  v6 = MEMORY[0x24BDAC760];
  if (IsRootForContainer)
  {
    v7 = (void *)MEMORY[0x24BDDCD00];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __63__MCDBrowsableContentTableViewController_reloadWithCompletion___block_invoke;
    v18[3] = &unk_24FD78188;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v7, "timerWithInterval:repeats:block:", 0, v18, 2.0);
    v8 = (MPWeakTimer *)objc_claimAutoreleasedReturnValue();
    delayTimer = self->_delayTimer;
    self->_delayTimer = v8;

    MCDGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v10, OS_LOG_TYPE_DEFAULT, "Fetching content for root container", buf, 2u);
    }

    objc_destroyWeak(&v19);
  }
  else
  {
    MCDGeneralLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[MCDPCContainer identifier](self->_container, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_impl(&dword_22FBAA000, v11, OS_LOG_TYPE_DEFAULT, "Fetching content for non-root container: %{public}@", buf, 0xCu);

    }
  }
  container = self->_container;
  if (container)
  {
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __63__MCDBrowsableContentTableViewController_reloadWithCompletion___block_invoke_83;
    v15[3] = &unk_24FD782A0;
    objc_copyWeak(&v17, &location);
    v15[4] = self;
    v16 = v4;
    -[MCDPCContainer refreshWithCompletion:](container, "refreshWithCompletion:", v15);

    objc_destroyWeak(&v17);
  }
  else
  {
    MCDGeneralLogging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v14, OS_LOG_TYPE_DEFAULT, "No container available to refresh.", buf, 2u);
    }

    if (v4)
      dispatch_async(MEMORY[0x24BDAC9B8], v4);
  }
  objc_destroyWeak(&location);

}

void __63__MCDBrowsableContentTableViewController_reloadWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_showLoadingScreen");
    WeakRetained = v2;
  }

}

void __63__MCDBrowsableContentTableViewController_reloadWithCompletion___block_invoke_83(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__MCDBrowsableContentTableViewController_reloadWithCompletion___block_invoke_2;
  block[3] = &unk_24FD782A0;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v5);
}

void __63__MCDBrowsableContentTableViewController_reloadWithCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained[134];
  MCDGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v5;
    _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Refreshing content complete for container: %{public}@", (uint8_t *)&v20, 0xCu);

  }
  if (MCDIndexPathIsRootForContainer(v3))
  {
    objc_msgSend(v3, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MRMediaRemoteApplicationSupportsSectionedBrowsing();

    if (v8)
    {
LABEL_5:
      MCDGeneralLogging();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_22FBAA000, v9, OS_LOG_TYPE_DEFAULT, "Root container has content", (uint8_t *)&v20, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "invalidate");
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 1024);
      *(_QWORD *)(v10 + 1024) = 0;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "invalidate");
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 1016);
      *(_QWORD *)(v12 + 1016) = 0;

      objc_msgSend(*(id *)(a1 + 32), "_replacePlaceholderViewWithView:", 0);
      goto LABEL_13;
    }
    objc_msgSend(v3, "indexPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {

    }
    else
    {
      v19 = objc_msgSend(v3, "cachedCount");

      if (v19 >= 1)
        goto LABEL_5;
    }
    MCDGeneralLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_22FBAA000, v15, OS_LOG_TYPE_DEFAULT, "Root container does not have content", (uint8_t *)&v20, 2u);
    }

  }
LABEL_13:
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1056) = objc_msgSend(*(id *)(a1 + 32), "_shouldLimitLists");
  objc_msgSend(*(id *)(a1 + 32), "reloadTable");
  MCDGeneralLogging();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v17;
    _os_log_impl(&dword_22FBAA000, v16, OS_LOG_TYPE_DEFAULT, "Completed refresh for container %{public}@", (uint8_t *)&v20, 0xCu);

  }
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(void))(v18 + 16))();

}

- (void)reloadTable
{
  self->_count = -[MCDPCContainer cachedCount](self->_container, "cachedCount");
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_updateNowPlayingButtonVisibility
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CPUINowPlayingButton *v11;
  CPUINowPlayingButton *v12;
  void *v13;
  void *v14;
  CPUINowPlayingButton *nowPlayingButton;
  id v16;

  -[MCDPCContainer model](self->_container, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playableContentPlaybackManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPlayingSong");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    -[MCDBrowsableContentTableViewController setCurrentlyPlayingApp:](self, "setCurrentlyPlayingApp:", 0);
    -[MCDBrowsableContentTableViewController reloadTable](self, "reloadTable");
LABEL_11:
    nowPlayingButton = self->_nowPlayingButton;
    self->_nowPlayingButton = 0;

    -[MCDBrowsableContentTableViewController navigationItem](self, "navigationItem");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRightBarButtonItem:", 0);

    return;
  }
  v6 = (void *)v5;
  -[MCDPCContainer model](self->_container, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCurrentPlayingApp");

  -[MCDBrowsableContentTableViewController setCurrentlyPlayingApp:](self, "setCurrentlyPlayingApp:", v8);
  -[MCDBrowsableContentTableViewController reloadTable](self, "reloadTable");
  if (!(_DWORD)v8 || !self->_hasCarScreen)
    goto LABEL_11;
  if (!self->_nowPlayingButton)
  {
    -[MCDPCContainer model](self->_container, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MCDGetNowPlayingButton(v10, self, (uint64_t)sel__nowPlayingButtonTapped_);
    v11 = (CPUINowPlayingButton *)objc_claimAutoreleasedReturnValue();
    v12 = self->_nowPlayingButton;
    self->_nowPlayingButton = v11;

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", self->_nowPlayingButton);
    -[MCDBrowsableContentTableViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightBarButtonItem:", v13);

  }
  if (self->_hasNoBrowsableContent && !self->_didPushToNowPlayingAtLaunch)
  {
    -[MCDBrowsableContentTableViewController _pushToNowPlaying:](self, "_pushToNowPlaying:", 1);
    self->_didPushToNowPlayingAtLaunch = 1;
  }
  else if (-[MCDBrowsableContentTableViewController pushToNowPlaying](self, "pushToNowPlaying"))
  {
    -[MCDBrowsableContentTableViewController _pushToNowPlaying:](self, "_pushToNowPlaying:", 1);
    -[MCDBrowsableContentTableViewController setPushToNowPlaying:](self, "setPushToNowPlaying:", 0);
  }
}

- (void)_nowPlayingButtonTapped:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  MCDGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Now Playing button tapped in table view, pushing to Now Playing", v5, 2u);
  }

  -[MCDBrowsableContentTableViewController _pushToNowPlaying:](self, "_pushToNowPlaying:", 1);
}

- (void)_pushToNowPlaying:(BOOL)a3
{
  MCDNowPlayingViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MCDNowPlayingViewController *v9;
  NSObject *v10;
  MCDNowPlayingViewController *v11;
  _QWORD v12[5];
  MCDNowPlayingViewController *v13;
  uint8_t buf[16];

  v4 = [MCDNowPlayingViewController alloc];
  -[MCDPCContainer model](self->_container, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPCContainer model](self->_container, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MCDNowPlayingViewController initWithPlayableBundleID:appName:](v4, "initWithPlayableBundleID:appName:", v6, v8);

  -[MCDNowPlayingViewController setShowNavigationBar:](v9, "setShowNavigationBar:", self->_isRootTableViewController);
  MCDGeneralLogging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FBAA000, v10, OS_LOG_TYPE_DEFAULT, "Pushing to Now Playing view", buf, 2u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__MCDBrowsableContentTableViewController__pushToNowPlaying___block_invoke;
  v12[3] = &unk_24FD781B0;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

uint64_t __60__MCDBrowsableContentTableViewController__pushToNowPlaying___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(_QWORD *)(a1 + 40));
}

- (void)_appRegisteredForContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[MCDMediaRemoteSerialQueueManager sharedInstance](MCDMediaRemoteSerialQueueManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __67__MCDBrowsableContentTableViewController__appRegisteredForContent___block_invoke;
  v10 = &unk_24FD78188;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "addOperation:cancelAllOperations:", &v7, 1);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("appReadyToFetch"), 0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __67__MCDBrowsableContentTableViewController__appRegisteredForContent___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__MCDBrowsableContentTableViewController__appRegisteredForContent___block_invoke_2;
  block[3] = &unk_24FD78188;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __67__MCDBrowsableContentTableViewController__appRegisteredForContent___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "Loading content in table controller for the first time since app registered", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__MCDBrowsableContentTableViewController__appRegisteredForContent___block_invoke_88;
  v5[3] = &unk_24FD78200;
  v6 = WeakRetained;
  v4 = WeakRetained;
  objc_msgSend(v4, "reloadWithCompletion:", v5);

}

uint64_t __67__MCDBrowsableContentTableViewController__appRegisteredForContent___block_invoke_88(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDidFinishInitialLoad:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setDidFinishInitialViewAppear:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_updateNowPlayingButtonVisibility");
}

- (void)_clearTableViewSelectionAnimated:(BOOL)a3
{
  MCDClearTableViewSelection(self->_tableView, a3);
}

- (BOOL)_shouldLimitLists
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "limitUserInterfaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(v2, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = ((unint64_t)objc_msgSend(v4, "limitableUserInterfaces") >> 3) & 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_limitedUIChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__MCDBrowsableContentTableViewController__limitedUIChanged___block_invoke;
  block[3] = &unk_24FD78200;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __60__MCDBrowsableContentTableViewController__limitedUIChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_shouldLimitLists");
  if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1056) != (_DWORD)v2)
  {
    v3 = v2;
    MCDGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1056));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v5;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Limited UI changed from %{public}@ to %{public}@", buf, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1056) = v3;
    v7 = objc_msgSend(*(id *)(a1 + 32), "isVisible");
    v8 = *(id **)(a1 + 32);
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8[121], "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "snapshotViewAfterScreenUpdates:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v10);

      objc_msgSend(*(id *)(a1 + 32), "reloadTable");
      if (v10)
      {
        v12 = (void *)MEMORY[0x24BEBDB00];
        v13 = MEMORY[0x24BDAC760];
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __60__MCDBrowsableContentTableViewController__limitedUIChanged___block_invoke_91;
        v17[3] = &unk_24FD78200;
        v18 = v10;
        v15[0] = v13;
        v15[1] = 3221225472;
        v15[2] = __60__MCDBrowsableContentTableViewController__limitedUIChanged___block_invoke_2;
        v15[3] = &unk_24FD782C8;
        v16 = v18;
        v14 = v18;
        objc_msgSend(v12, "animateWithDuration:animations:completion:", v17, v15, 0.4);

      }
    }
    else
    {
      objc_msgSend(v8, "reloadTable");
    }
  }
}

uint64_t __60__MCDBrowsableContentTableViewController__limitedUIChanged___block_invoke_91(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __60__MCDBrowsableContentTableViewController__limitedUIChanged___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (MCDPCContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderView, a3);
}

- (BOOL)currentlyPlayingApp
{
  return self->_currentlyPlayingApp;
}

- (void)setCurrentlyPlayingApp:(BOOL)a3
{
  self->_currentlyPlayingApp = a3;
}

- (MPWeakTimer)loadingTimer
{
  return self->_loadingTimer;
}

- (void)setLoadingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_loadingTimer, a3);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (BOOL)pushToNowPlaying
{
  return self->_pushToNowPlaying;
}

- (void)setPushToNowPlaying:(BOOL)a3
{
  self->_pushToNowPlaying = a3;
}

- (BOOL)didFinishInitialLoad
{
  return self->_didFinishInitialLoad;
}

- (void)setDidFinishInitialLoad:(BOOL)a3
{
  self->_didFinishInitialLoad = a3;
}

- (BOOL)didFinishInitialViewAppear
{
  return self->_didFinishInitialViewAppear;
}

- (void)setDidFinishInitialViewAppear:(BOOL)a3
{
  self->_didFinishInitialViewAppear = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_MCD_tableView, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_loadingTimer, 0);
  objc_storeStrong((id *)&self->_reselectIndexPath, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectedNextIndexPath, 0);
  objc_storeStrong((id *)&self->_nowPlayingButton, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FBAA000, a2, a3, "Loading content timed out, displaying error: %{public}@", a5, a6, a7, a8, 2u);
}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22FBAA000, log, OS_LOG_TYPE_ERROR, "Initiating playback failed due to timeout", v1, 2u);
}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FBAA000, a2, a3, "Initiating playback failed, displaying error: %{public}@", a5, a6, a7, a8, 2u);
}

@end
