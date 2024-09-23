@implementation DSNavigationController

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSNavigationController");
    v3 = (void *)DSLog_10;
    DSLog_10 = (uint64_t)v2;

  }
}

- (DSNavigationController)init
{
  id v2;
  NSObject *v3;
  DSNavigationManager *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  dispatch_queue_t v20;
  id v21;
  nw_path_monitor_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD update_handler[4];
  id v32;
  id buf[2];
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)DSNavigationController;
  v2 = -[DSNavigationController init](&v34, sel_init);
  if (v2)
  {
    v3 = DSLog_10;
    if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2278DF000, v3, OS_LOG_TYPE_INFO, "Initializing DSNavigationController", (uint8_t *)buf, 2u);
    }
    v4 = objc_alloc_init(DSNavigationManager);
    objc_msgSend(v2, "setNavigationManager:", v4);

    if (objc_msgSend(MEMORY[0x24BE2CC98], "shouldShowBioRatchetFlow"))
      objc_msgSend(v2, "_setupRatchetObserver");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 197);
    *((_QWORD *)v2 + 197) = v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 198);
    *((_QWORD *)v2 + 198) = v7;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v2 + 199);
    *((_QWORD *)v2 + 199) = v9;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 200);
    *((_QWORD *)v2 + 200) = v11;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v2 + 201);
    *((_QWORD *)v2 + 201) = v13;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v2 + 202);
    *((_QWORD *)v2 + 202) = v15;

    objc_msgSend(v2, "setCurrentChapterForAnalytics:", 1);
    objc_msgSend(v2, "setDelegate:", v2);
    objc_msgSend(v2, "presentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v2);

    v18 = objc_alloc_init(MEMORY[0x24BDDA938]);
    v19 = (void *)*((_QWORD *)v2 + 179);
    *((_QWORD *)v2 + 179) = v18;

    objc_msgSend(v2, "setupConnectionError");
    v20 = dispatch_queue_create("NetworkUpdateQueue", 0);
    objc_msgSend(v2, "setWorkQueue:", v20);

    v21 = objc_alloc_init(MEMORY[0x24BE2CC60]);
    objc_msgSend(v2, "setDaemonProxy:", v21);

    v22 = nw_path_monitor_create();
    v23 = (void *)*((_QWORD *)v2 + 193);
    *((_QWORD *)v2 + 193) = v22;

    objc_initWeak(buf, v2);
    objc_msgSend(v2, "pathMonitor");
    v24 = objc_claimAutoreleasedReturnValue();
    update_handler[0] = MEMORY[0x24BDAC760];
    update_handler[1] = 3221225472;
    update_handler[2] = __30__DSNavigationController_init__block_invoke;
    update_handler[3] = &unk_24EFF41F8;
    objc_copyWeak(&v32, buf);
    nw_path_monitor_set_update_handler(v24, update_handler);

    objc_msgSend(v2, "pathMonitor");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "workQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    nw_path_monitor_set_queue(v25, v26);

    nw_path_monitor_start(*((nw_path_monitor_t *)v2 + 193));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v2, sel_willEnterForeground_, *MEMORY[0x24BEBE008], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v2, sel_didEnterBackground_, *MEMORY[0x24BEBDF98], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v2, sel_willResignActive_, *MEMORY[0x24BEBE010], 0);

    objc_destroyWeak(&v32);
    objc_destroyWeak(buf);
  }
  return (DSNavigationController *)v2;
}

void __30__DSNavigationController_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "updateReachabilityState:", v3);

}

- (void)setNavigationOrderAndChapters
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[DSNavigationController navigationManager](self, "navigationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationOrderForFlowType:", -[DSNavigationController currentFlowType](self, "currentFlowType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSNavigationController setNavigationOrder:](self, "setNavigationOrder:", v4);

  -[DSNavigationController navigationManager](self, "navigationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationChaptersForFlowType:", -[DSNavigationController currentFlowType](self, "currentFlowType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSNavigationController setNavigationChapters:](self, "setNavigationChapters:", v5);

}

- (void)updateReachabilityState:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[5];
  BOOL v7;

  v4 = a3;
  -[DSNavigationController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v5);

  LODWORD(v5) = nw_path_get_status(v4);
  -[DSNavigationController setIsReachable:](self, "setIsReachable:", (v5 & 0xFFFFFFFD) == 1);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__DSNavigationController_updateReachabilityState___block_invoke;
  v6[3] = &unk_24EFF4220;
  v6[4] = self;
  v7 = (v5 & 0xFFFFFFFD) == 1;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);
}

uint64_t __50__DSNavigationController_updateReachabilityState___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isShowingNetworkError");
  if ((_DWORD)result && *(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "hideNetworkError");
    v3 = objc_msgSend(*(id *)(a1 + 32), "topViewControllerType");
    result = objc_opt_class();
    if (v3 == result)
      return objc_msgSend(*(id *)(a1 + 32), "resetRemoteUI");
  }
  return result;
}

- (id)initStartingWithEmergencyReset
{
  DSNavigationController *v2;

  v2 = -[DSNavigationController init](self, "init");
  if (v2)
  {
    -[DSNavigationController setStartingPaneType:](v2, "setStartingPaneType:", objc_opt_class());
    -[DSNavigationController setCurrentFlowType:](v2, "setCurrentFlowType:", 0);
    -[DSNavigationController setNavigationOrderAndChapters](v2, "setNavigationOrderAndChapters");
  }
  return v2;
}

- (id)initStartingWithMangeSharing
{
  DSNavigationController *v2;

  v2 = -[DSNavigationController init](self, "init");
  if (v2)
  {
    -[DSNavigationController setStartingPaneType:](v2, "setStartingPaneType:", objc_opt_class());
    -[DSNavigationController setCurrentFlowType:](v2, "setCurrentFlowType:", 1);
    -[DSNavigationController setNavigationOrderAndChapters](v2, "setNavigationOrderAndChapters");
  }
  return v2;
}

- (id)initStartingWithURL:(id)a3
{
  id v4;
  DSNavigationController *v5;
  DSNavigationController *v6;
  void *v7;
  char v8;
  DSNavigationController *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[DSNavigationController init](self, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  -[DSNavigationController navigationManager](v5, "navigationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldIngestURL:", v4);

  if ((v8 & 1) != 0)
  {
    -[DSNavigationController startWithURL:](v6, "startWithURL:", v4);
LABEL_4:
    v9 = v6;
    goto LABEL_8;
  }
  v10 = DSLog_10;
  if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_2278DF000, v10, OS_LOG_TYPE_INFO, "Safety Check will not act on URL path %@, staying on landing page", (uint8_t *)&v12, 0xCu);
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (void)startWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DSNavigationController navigationManager](self, "navigationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationForURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = DSLog_10;
  if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_2278DF000, v7, OS_LOG_TYPE_INFO, "Initiating new flow for deep link: %@", (uint8_t *)&v11, 0xCu);
  }
  -[DSNavigationController setDeepLink:](self, "setDeepLink:", v6);
  objc_msgSend(v6, "navigationOrder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSNavigationController setStartingPaneType:](self, "setStartingPaneType:", objc_msgSend(v8, "firstObject"));

  -[DSNavigationController setCurrentFlowType:](self, "setCurrentFlowType:", objc_msgSend(v6, "flowType"));
  objc_msgSend(v6, "navigationOrder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSNavigationController setNavigationOrder:](self, "setNavigationOrder:", v9);

  objc_msgSend(v6, "navigationChapters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSNavigationController setNavigationChapters:](self, "setNavigationChapters:", v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  DSSharingPermissionsController *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_super v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)DSNavigationController;
  -[DSNavigationController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[DSNavigationController cachedPanes](self, "cachedPanes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if ((MGGetBoolAnswer() & 1) != 0)
    {
      -[DSNavigationController setCachedPanes:](self, "setCachedPanes:", MEMORY[0x24BDBD1B8]);
    }
    else
    {
      v5 = objc_alloc_init(DSSharingPermissionsController);
      -[DSSharingPermissionsController setDelegate:](v5, "setDelegate:", self);
      -[DSSharingPermissionsController setUrgentFetchNeeded](v5, "setUrgentFetchNeeded");
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v7;
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSNavigationController setCachedPanes:](self, "setCachedPanes:", v8);

    }
  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DSNavigationController;
  -[OBNavigationController viewDidLoad](&v3, sel_viewDidLoad);
  -[DSNavigationController pushPaneType:](self, "pushPaneType:", -[DSNavigationController startingPaneType](self, "startingPaneType"));
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE010], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBDF88], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BEBE008], 0);

  v6.receiver = self;
  v6.super_class = (Class)DSNavigationController;
  -[DSNavigationController dealloc](&v6, sel_dealloc);
}

- (void)setupConnectionError
{
  UIViewController *v3;
  UIViewController *networkErrorController;
  void *v5;
  id v6;
  void *v7;
  UINavigationController *v8;
  UINavigationController *connectionErrorNavigation;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
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
  id v36;

  v3 = (UIViewController *)objc_alloc_init(MEMORY[0x24BEBDB08]);
  networkErrorController = self->_networkErrorController;
  self->_networkErrorController = v3;

  -[DSNavigationController networkErrorController](self, "networkErrorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setModalPresentationStyle:", 0);

  v6 = objc_alloc(MEMORY[0x24BEBD7A0]);
  -[DSNavigationController networkErrorController](self, "networkErrorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (UINavigationController *)objc_msgSend(v6, "initWithRootViewController:", v7);
  connectionErrorNavigation = self->_connectionErrorNavigation;
  self->_connectionErrorNavigation = v8;

  -[DSNavigationController connectionErrorNavigation](self, "connectionErrorNavigation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setModalPresentationStyle:", 0);

  -[DSNavigationController networkErrorController](self, "networkErrorController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BEBD410]);
  DSUILocStringForKey(CFSTR("CANCEL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v14, 0, self, sel_cancel);
  objc_msgSend(v12, "setLeftBarButtonItem:", v15);

  -[DSNavigationController networkErrorController](self, "networkErrorController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x24BEBD410]);
  DSUILocStringForKey(CFSTR("QUICK_EXIT"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithTitle:style:target:action:", v19, 0, self, sel_quickExit);
  objc_msgSend(v17, "setRightBarButtonItem:", v20);

  objc_msgSend(MEMORY[0x24BEBD4E8], "emptyProminentConfiguration");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("NO_CONNECTION_TITLE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setText:", v21);

  v22 = MGGetBoolAnswer();
  v23 = CFSTR("WIFI");
  if (v22)
    v23 = CFSTR("WLAN");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_NO_CONNECTION_DETAIL"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "setSecondaryText:", v25);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("bolt.horizontal.fill"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setImage:", v26);

  DSUILocStringForKey(CFSTR("GO_TO_SETTINGS"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "buttonProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "configuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTitle:", v27);

  objc_msgSend(MEMORY[0x24BEBD388], "actionWithHandler:", &__block_literal_global_16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "buttonProperties");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPrimaryAction:", v30);

  -[DSNavigationController networkErrorController](self, "networkErrorController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_setContentUnavailableConfiguration:", v36);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSNavigationController networkErrorController](self, "networkErrorController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBackgroundColor:", v33);

}

void __46__DSNavigationController_setupConnectionError__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, MEMORY[0x24BDBD1B8]);

}

- (void)displayNetworkError
{
  void *v3;

  -[DSNavigationController connectionErrorNavigation](self, "connectionErrorNavigation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

  self->_isShowingNetworkError = 1;
}

- (void)hideNetworkError
{
  void *v3;

  -[DSNavigationController networkErrorController](self, "networkErrorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3 != 0, 0);

  self->_isShowingNetworkError = 0;
}

- (void)goToCustomizeSharing
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[DSNavigationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__DSNavigationController_goToCustomizeSharing__block_invoke;
  v5[3] = &unk_24EFF33A0;
  v5[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v5);

  -[DSNavigationController setStartingPaneType:](self, "setStartingPaneType:", objc_opt_class());
  -[DSNavigationController setCurrentFlowType:](self, "setCurrentFlowType:", 1);
  -[DSNavigationController setNavigationOrderAndChapters](self, "setNavigationOrderAndChapters");
  -[DSNavigationController pushPaneType:](self, "pushPaneType:", -[DSNavigationController startingPaneType](self, "startingPaneType"));
  -[DSNavigationController presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", self, 1, 0);

}

uint64_t __46__DSNavigationController_goToCustomizeSharing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setViewControllers:", MEMORY[0x24BDBD1A8]);
}

- (void)pushNextPane
{
  -[DSNavigationController updateDaemonModelForCurrentPane](self, "updateDaemonModelForCurrentPane");
  if (-[DSNavigationController shouldFinishFlow](self, "shouldFinishFlow"))
    -[DSNavigationController finishFlow](self, "finishFlow");
  -[DSNavigationController pushPaneAfterPaneType:](self, "pushPaneAfterPaneType:", -[DSNavigationController topViewControllerType](self, "topViewControllerType"));
}

- (BOOL)shouldFinishFlow
{
  objc_class *v3;
  void *v4;

  v3 = -[DSNavigationController topViewControllerType](self, "topViewControllerType");
  -[DSNavigationController navigationOrder](self, "navigationOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v3 == (objc_class *)objc_msgSend(v4, "lastObject");

  return (char)v3;
}

- (void)finishFlow
{
  id v3;

  -[DSNavigationController sendSummaryAnalyticsWithQuickExit:finalScreen:](self, "sendSummaryAnalyticsWithQuickExit:finalScreen:", 0, 1);
  -[DSNavigationController presentingViewController](self, "presentingViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)exitFlowForRatchetWait
{
  id v2;

  -[DSNavigationController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)popViewControllerAnimated:(BOOL)a3
{
  void *v4;

  -[DSNavigationController topViewController](self, "topViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSNavigationController popToPreviousPane:](self, "popToPreviousPane:", v4);
  return v4;
}

- (id)paneBeforePane:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[DSNavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 - 1 >= (unint64_t)objc_msgSend(v5, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v6 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)popToPreviousPane:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  DSNavigationController *v13;
  id v14;
  objc_super v15;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[DSNavigationController paneBeforePane:](self, "paneBeforePane:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "buttonTray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "showButtonsAvailable");

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v6, "shouldShow"))
      {
        v15.receiver = self;
        v15.super_class = (Class)DSNavigationController;
        v8 = -[DSNavigationController popToViewController:animated:](&v15, sel_popToViewController_animated_, v6, 1);
LABEL_11:
        v9 = v8;
        goto LABEL_12;
      }
      -[DSNavigationController popToPreviousPane:](self, "popToPreviousPane:", v6);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v10.receiver = self;
        v10.super_class = (Class)DSNavigationController;
        v8 = -[DSNavigationController popToViewController:animated:](&v10, sel_popToViewController_animated_, v6, 1);
        goto LABEL_11;
      }
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __44__DSNavigationController_popToPreviousPane___block_invoke;
      v11[3] = &unk_24EFF42B0;
      v12 = v6;
      v13 = self;
      v14 = v12;
      objc_msgSend(v14, "shouldShowWithCompletion:", v11);

    }
LABEL_12:

  }
}

void __44__DSNavigationController_popToPreviousPane___block_invoke(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  char v10;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__DSNavigationController_popToPreviousPane___block_invoke_2;
  v6[3] = &unk_24EFF4288;
  v10 = a2;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

id __44__DSNavigationController_popToPreviousPane___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  objc_super v6;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 40);
  if (!v2)
    return (id)objc_msgSend(v3, "popToPreviousPane:", *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v6.receiver = v3;
  v6.super_class = (Class)DSNavigationController;
  return objc_msgSendSuper2(&v6, sel_popToViewController_animated_, v4, 1);
}

- (void)pushPaneAfterPaneType:(Class)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;

  -[DSNavigationController navigationOrder](self, "navigationOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", a3);
  v7 = v6 + 1;
  v8 = v6 == -1;

  if (!v8)
  {
    -[DSNavigationController navigationOrder](self, "navigationOrder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v7 < v10)
    {
      -[DSNavigationController navigationOrder](self, "navigationOrder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "objectAtIndex:", v7);

      if (v12)
        -[DSNavigationController pushPaneType:](self, "pushPaneType:", v12);
    }
  }
}

- (void)pushPaneType:(Class)a3 loadRemoteUI:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  void *v9;
  BOOL v10;
  DSRemoteUILoader *v11;
  void *v12;
  void *v13;
  void *v14;
  DSRemoteUILoader *v15;
  DSRemoteUILoader *remoteUILoader;
  void *v17;
  uint64_t v18;
  DSNavigationController *v19;
  void *v20;
  Class v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  DSNavigationController *v29;
  id v30;
  id v31[2];
  id location;

  v4 = a4;
  if ((Class)objc_opt_class() != a3 || !v4)
  {
    -[DSNavigationController navigationManager](self, "navigationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "panesRequiringNetwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", a3))
    {
      v10 = -[DSNavigationController isNetworkReachable](self, "isNetworkReachable");

      if (!v10)
      {
LABEL_12:
        -[DSNavigationController displayNetworkError](self, "displayNetworkError");
        return;
      }
    }
    else
    {

    }
    -[DSNavigationController paneInstanceForType:](self, "paneInstanceForType:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = objc_msgSend(v17, "shouldShow");
      v19 = self;
      v20 = v17;
      v21 = a3;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[DSNavigationController topViewController](self, "topViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[DSNavigationController topViewController](self, "topViewController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "buttonTray");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "showButtonsBusy");

        }
        else
        {
          v24 = 0;
        }
        objc_initWeak(&location, self);
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __52__DSNavigationController_pushPaneType_loadRemoteUI___block_invoke;
        v27[3] = &unk_24EFF4300;
        objc_copyWeak(v31, &location);
        v26 = v24;
        v28 = v26;
        v29 = self;
        v31[1] = a3;
        v30 = v17;
        objc_msgSend(v30, "shouldShowWithCompletion:", v27);

        objc_destroyWeak(v31);
        objc_destroyWeak(&location);

        goto LABEL_24;
      }
      v19 = self;
      v20 = v17;
      v21 = a3;
      v18 = 1;
    }
    -[DSNavigationController pushPaneWithController:paneType:shouldShow:](v19, "pushPaneWithController:paneType:shouldShow:", v20, v21, v18);
LABEL_24:

    return;
  }
  if (!-[DSNavigationController isNetworkReachable](self, "isNetworkReachable"))
    goto LABEL_12;
  if (_os_feature_enabled_impl())
  {
    -[DSNavigationController _pushWelcomeControllerAsTopView](self, "_pushWelcomeControllerAsTopView");
    v11 = [DSRemoteUILoader alloc];
    -[DSNavigationController topViewController](self, "topViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSNavigationController deepLink](self, "deepLink");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteUIURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[DSRemoteUILoader initWithPresenter:delegate:URL:](v11, "initWithPresenter:delegate:URL:", v12, self, v14);
    remoteUILoader = self->_remoteUILoader;
    self->_remoteUILoader = v15;

    -[DSRemoteUILoader loadRemoteUI](self->_remoteUILoader, "loadRemoteUI");
  }
  else
  {
    -[DSNavigationController pushPaneAfterPaneType:](self, "pushPaneAfterPaneType:", a3);
  }
}

void __52__DSNavigationController_pushPaneType_loadRemoteUI___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__DSNavigationController_pushPaneType_loadRemoteUI___block_invoke_2;
  v8[3] = &unk_24EFF42D8;
  v5 = *(id *)(a1 + 32);
  v14 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v13 = *(_QWORD *)(a1 + 64);
  v11 = WeakRetained;
  v12 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __52__DSNavigationController_pushPaneType_loadRemoteUI___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2 && *(_BYTE *)(a1 + 72))
  {
    objc_msgSend(v2, "buttonTray");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "showButtonsAvailable");

  }
  if (*(_BYTE *)(a1 + 72))
    return objc_msgSend(*(id *)(a1 + 48), "pushPaneWithController:paneType:shouldShow:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "deepLink");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    return objc_msgSend(*(id *)(a1 + 48), "pushPaneWithController:paneType:shouldShow:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
  v6 = (void *)v5;
  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "deepLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationOrder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "firstObject");

  if (v7 != v10)
    return objc_msgSend(*(id *)(a1 + 48), "pushPaneWithController:paneType:shouldShow:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
  v11 = (void *)DSLog_10;
  if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 40);
    v13 = v11;
    objc_msgSend(v12, "deepLink");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v14;
    _os_log_impl(&dword_2278DF000, v13, OS_LOG_TYPE_DEFAULT, "Asked to open to entrypoint %@ but shouldShow returns false", (uint8_t *)&v15, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 48), "pushPaneWithController:paneType:shouldShow:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1);
}

- (void)pushPaneWithController:(id)a3 paneType:(Class)a4 shouldShow:(BOOL)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = v8;
  if (a5)
  {
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_2559160D8))
    {
      -[DSNavigationController setupQuickExitButtonWithController:](self, "setupQuickExitButtonWithController:", v9);
      -[OBNavigationController pushViewController:animated:](self, "pushViewController:animated:", v9, 1);
    }
  }
  else
  {
    -[DSNavigationController pushPaneAfterPaneType:](self, "pushPaneAfterPaneType:", a4);
  }

}

- (void)pushPaneType:(Class)a3
{
  -[DSNavigationController pushPaneType:loadRemoteUI:](self, "pushPaneType:loadRemoteUI:", a3, 1);
}

- (Class)topViewControllerType
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[DSNavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();

  -[DSNavigationController navigationOrder](self, "navigationOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "containsObject:", v4);

  if ((_DWORD)v3)
  {
    v6 = v4;
  }
  else
  {
    if (v4 != (void *)objc_opt_class()
      && v4 != (void *)objc_opt_class()
      && v4 != (void *)objc_opt_class()
      && v4 != (void *)objc_opt_class())
    {
      objc_opt_class();
    }
    objc_opt_class();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v6;
}

- (id)paneInstanceForType:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[DSNavigationController cachedPanes](self, "cachedPanes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = objc_alloc_init(a3);
  v8 = v7;

  return v8;
}

- (void)startFlowWithType:(int64_t)a3
{
  objc_class *v5;

  v5 = -[DSNavigationController topViewControllerType](self, "topViewControllerType");
  if (v5 == (objc_class *)objc_opt_class())
  {
    -[DSNavigationController goToCustomizeSharing](self, "goToCustomizeSharing");
  }
  else
  {
    -[DSNavigationController setCurrentFlowType:](self, "setCurrentFlowType:", a3);
    -[DSNavigationController pushNextPane](self, "pushNextPane");
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  DSNavigationController *v11;

  v5 = a4;
  v9[1] = 3221225472;
  v9[2] = __68__DSNavigationController_presentViewController_animated_completion___block_invoke;
  v9[3] = &unk_24EFF3A78;
  v10 = a3;
  v11 = self;
  v8.receiver = self;
  v8.super_class = (Class)DSNavigationController;
  v9[0] = MEMORY[0x24BDAC760];
  v7 = v10;
  -[DSNavigationController presentViewController:animated:completion:](&v8, sel_presentViewController_animated_completion_, v7, v5, v9);

}

void __68__DSNavigationController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v10, "topViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rightBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x24BEBD410]);
      DSUILocStringForKey(CFSTR("QUICK_EXIT"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 0, *(_QWORD *)(a1 + 40), sel_quickExit);
      objc_msgSend(v10, "topViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRightBarButtonItem:", v7);

    }
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[DSNavigationController setupQuickExitButtonWithController:](self, "setupQuickExitButtonWithController:", v10);
  v8 = objc_opt_class();
  if (v8 == objc_opt_class() || (v9 = objc_opt_class(), v9 == objc_opt_class()))
    -[DSNavigationController setupCancelButtonWithController:](self, "setupCancelButtonWithController:", v10);
  -[DSNavigationController updateCurrentChapterWithPaneType:](self, "updateCurrentChapterWithPaneType:", -[DSNavigationController topViewControllerType](self, "topViewControllerType"));
  -[DSNavigationController setupChapterIndicatorWithController:](self, "setupChapterIndicatorWithController:", v10);

}

- (void)setupQuickExitButtonWithController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x24BEBD410];
  v5 = a3;
  v6 = [v4 alloc];
  DSUILocStringForKey(CFSTR("QUICK_EXIT"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v9, 0, self, sel_quickExit);
  objc_msgSend(v5, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRightBarButtonItem:", v7);
}

- (void)setupCancelButtonWithController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x24BEBD410];
  v5 = a3;
  v6 = [v4 alloc];
  DSUILocStringForKey(CFSTR("CANCEL"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v9, 0, self, sel_finishFlow);
  objc_msgSend(v5, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLeftBarButtonItem:", v7);
}

- (void)updateCurrentChapterWithPaneType:(Class)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[DSNavigationController navigationChapters](self, "navigationChapters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    v7 = objc_msgSend(v8, "integerValue");
  else
    v7 = 0;
  -[DSNavigationController setCurrentChapter:](self, "setCurrentChapter:", v7);
  if (-[DSNavigationController currentChapter](self, "currentChapter"))
    -[DSNavigationController setCurrentChapterForAnalytics:](self, "setCurrentChapterForAnalytics:", -[DSNavigationController currentChapter](self, "currentChapter"));

}

- (void)setupChapterIndicatorWithController:(id)a3
{
  void *v4;
  int64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackButtonDisplayMode:", 1);

  v5 = -[DSNavigationController currentChapter](self, "currentChapter");
  switch(v5)
  {
    case 3:
      objc_msgSend(v9, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("CHAPTER_THREE");
      goto LABEL_8;
    case 2:
      objc_msgSend(v9, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("CHAPTER_TWO");
      goto LABEL_8;
    case 1:
      objc_msgSend(v9, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("CHAPTER_ONE");
LABEL_8:
      DSUILocStringForKey(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v7);

      goto LABEL_9;
  }
  objc_msgSend(v9, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", 0);
LABEL_9:

}

- (void)quickExit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  -[DSNavigationController visibleViewController](self, "visibleViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "performSelector:", sel_postAnalytics);
  -[DSNavigationController sendSummaryAnalyticsWithQuickExit:finalScreen:](self, "sendSummaryAnalyticsWithQuickExit:finalScreen:", 1, -[DSNavigationController shouldFinishFlow](self, "shouldFinishFlow"));
  -[DSNavigationController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BEBD530]);
  v8 = (void *)objc_msgSend(v7, "initWithPreferredAnimationType:callbackQueue:completion:", 1, MEMORY[0x24BDAC9B8], &__block_literal_global_363);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendActions:", v9);

}

void __35__DSNavigationController_quickExit__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Scene destruction request completed with response: %@"), a2);
}

- (void)willEnterForeground:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  -[DSNavigationController deepLink](self, "deepLink", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[DSNavigationController obfuscationWindow](self, "obfuscationWindow"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    v8 = DSLog_10;
    if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2278DF000, v8, OS_LOG_TYPE_DEFAULT, "Skipping authentication check for URL launch", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__DSNavigationController_willEnterForeground___block_invoke;
    v9[3] = &unk_24EFF3440;
    v9[4] = self;
    objc_msgSend(v7, "stateWithCompletion:", v9);

  }
}

void __46__DSNavigationController_willEnterForeground___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  if (objc_msgSend(a2, "rawValue") == 2)
  {
    v6 = MEMORY[0x24BDAC760];
    v3 = __46__DSNavigationController_willEnterForeground___block_invoke_2;
    v4 = &v6;
  }
  else
  {
    v5 = MEMORY[0x24BDAC760];
    v3 = __46__DSNavigationController_willEnterForeground___block_invoke_3;
    v4 = &v5;
  }
  v4[1] = 3221225472;
  v4[2] = (uint64_t)v3;
  v4[3] = (uint64_t)&unk_24EFF33A0;
  v4[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
}

void __46__DSNavigationController_willEnterForeground___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "obfuscationWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "obfuscationWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "setObfuscationWindow:", 0);
  }
}

uint64_t __46__DSNavigationController_willEnterForeground___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "authToReturnToSafetyCheck");
}

- (void)authToReturnToSafetyCheck
{
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, a2, a3, "Cannot evaluate authentication policy for Safety Check, policy error %@", a5, a6, a7, a8, 2u);
}

void __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "obfuscationWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "obfuscationWindow");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHidden:", 1);

      objc_msgSend(*(id *)(a1 + 32), "setObfuscationWindow:", 0);
    }
  }
}

void __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke_371(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  _QWORD *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = DSLog_10;
  if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v20) = a2;
    _os_log_impl(&dword_2278DF000, v7, OS_LOG_TYPE_INFO, "Asked user to auth for Safety Check when foregrounding with success: %d", buf, 8u);
  }
  if ((a2 & 1) != 0)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke_2;
    v18[3] = &unk_24EFF33A0;
    v18[4] = WeakRetained;
    v8 = MEMORY[0x24BDAC9B8];
    v9 = v18;
LABEL_9:
    dispatch_async(v8, v9);
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "code") != -4)
  {
    v10 = DSLog_10;
    if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_2278DF000, v10, OS_LOG_TYPE_INFO, "Error authenticating for Safety Check, going back to base Preferences %@", buf, 0xCu);
    }
    v8 = MEMORY[0x24BDAC9B8];
    v9 = &__block_literal_global_373;
    goto LABEL_9;
  }
LABEL_10:
  if (v5)
  {
    v11 = DSLog_10;
    if (os_log_type_enabled((os_log_t)DSLog_10, OS_LOG_TYPE_ERROR))
      __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke_371_cold_1((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);
  }

}

void __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke_372()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDC14F0];
  v4[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, v2);

}

void __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "obfuscationWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "obfuscationWindow");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHidden:", 1);

      objc_msgSend(*(id *)(a1 + 32), "setObfuscationWindow:", 0);
    }
  }
}

- (void)didEnterBackground:(id)a3
{
  void *v4;
  UIWindow *v5;
  UIWindow *obfuscationWindow;
  id v7;

  if (!self->_obfuscationWindow)
  {
    -[DSNavigationController view](self, "view", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSObfuscationWindow showDSObfuscationWindowForApplicationWindow:](DSObfuscationWindow, "showDSObfuscationWindowForApplicationWindow:", v4);
    v5 = (UIWindow *)objc_claimAutoreleasedReturnValue();
    obfuscationWindow = self->_obfuscationWindow;
    self->_obfuscationWindow = v5;

  }
}

- (void)willResignActive:(id)a3
{
  id v4;

  -[DSNavigationController updateDaemonModelForCurrentPane](self, "updateDaemonModelForCurrentPane", a3);
  -[DSNavigationController daemonProxy](self, "daemonProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendAggregatedSignals");

}

- (void)cancel
{
  void *v3;

  -[DSNavigationController sendSummaryAnalyticsWithQuickExit:finalScreen:](self, "sendSummaryAnalyticsWithQuickExit:finalScreen:", 0, 0);
  -[DSNavigationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[DSNavigationController setCachedPanes:](self, "setCachedPanes:", 0);
}

- (void)learnMorePressedForController:(id)a3 withURL:(id)a4
{
  +[DSSafetyCheck showlearnMoreForPresentingViewController:withURL:](DSSafetyCheck, "showlearnMoreForPresentingViewController:withURL:", a3, a4);
}

- (BOOL)isNetworkReachable
{
  return self->_isReachable;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[DSNavigationController sendSummaryAnalyticsWithQuickExit:finalScreen:](self, "sendSummaryAnalyticsWithQuickExit:finalScreen:", 0, -[DSNavigationController shouldFinishFlow](self, "shouldFinishFlow", a3));
}

- (void)sendSummaryAnalyticsWithQuickExit:(BOOL)a3 finalScreen:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v8;

  v6 = MEMORY[0x24BDAC760];
  LOBYTE(v8) = a4;
  BYTE1(v8) = a3;
  AnalyticsSendEventLazy();
  -[DSNavigationController updateDaemonModelForCurrentPane](self, "updateDaemonModelForCurrentPane", v6, 3221225472, __72__DSNavigationController_sendSummaryAnalyticsWithQuickExit_finalScreen___block_invoke, &unk_24EFF43B0, self, v8);
  -[DSNavigationController daemonProxy](self, "daemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendAggregatedSignals");

}

id __72__DSNavigationController_sendSummaryAnalyticsWithQuickExit_finalScreen___block_invoke(uint64_t a1)
{
  void *v2;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[10];
  _QWORD v23[12];

  v23[10] = *MEMORY[0x24BDAC8D0];
  v22[0] = CFSTR("numPeopleStoppedSharing");
  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "unsharedPeople");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  v22[1] = CFSTR("numSourcesStoppedSharing");
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "unsharedResourcesBySource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v18;
  v22[2] = CFSTR("numAppsStoppedPermissions");
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "unsharedApps");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v5;
  v22[3] = CFSTR("numTypesStoppedPermissions");
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "unsharedPermissions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v8;
  v22[4] = CFSTR("chapter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "currentChapterForAnalytics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v9;
  v22[5] = CFSTR("flowType");
  objc_msgSend(*(id *)(a1 + 32), "flowTypeForAnalytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v10;
  v22[6] = CFSTR("wasFinalScreen");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v11;
  v22[7] = CFSTR("wasQuickExit");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v12;
  v22[8] = CFSTR("wasRatchetEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE2CC98], "shouldShowBioRatchetFlow"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v13;
  v22[9] = CFSTR("wasFamiliarLocation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isInFamiliarLocation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)sendSummaryAnalyticsWithEventName:(id)a3
{
  id v4;

  v4 = a3;
  if (-[DSNavigationController deepLinkPaneType](self, "deepLinkPaneType"))
    -[DSNavigationController deepLinkPaneType](self, "deepLinkPaneType");
  else
    -[DSNavigationController topViewControllerType](self, "topViewControllerType");
  AnalyticsSendEventLazy();

}

id __60__DSNavigationController_sendSummaryAnalyticsWithEventName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("FlowType");
  objc_msgSend(*(id *)(a1 + 32), "flowTypeForAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("Operation");
  v7[0] = v2;
  NSStringFromClass(*(Class *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)flowTypeForAnalytics
{
  if (-[DSNavigationController currentFlowType](self, "currentFlowType"))
    return CFSTR("Review");
  else
    return CFSTR("Reset");
}

- (void)resetRemoteUI
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int i;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;

  -[DSNavigationController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    for (i = 1; ; ++i)
    {
      -[DSNavigationController viewControllers](self, "viewControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      -[DSNavigationController currentFlowType](self, "currentFlowType");
      v8 = objc_opt_class();
      v5 = i;
      if (objc_opt_class() == v8)
        break;

      -[DSNavigationController viewControllers](self, "viewControllers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10 <= v5)
        return;
    }
    -[DSNavigationController viewControllers](self, "viewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subarrayWithRange:", 0, i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBNavigationController setViewControllers:](self, "setViewControllers:", v12);

  }
}

- (id)deepLinkForCurrentFlowAndPane
{
  void *v3;
  void *v4;

  -[DSNavigationController navigationManager](self, "navigationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deepLinkToPane:inFlow:", -[DSNavigationController topViewControllerType](self, "topViewControllerType"), -[DSNavigationController currentFlowType](self, "currentFlowType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSNavigationController setDeepLinkPaneType:](self, "setDeepLinkPaneType:", -[DSNavigationController topViewControllerType](self, "topViewControllerType"));
  return v4;
}

- (void)_pushWelcomeControllerAsTopView
{
  void *v3;
  id v4;

  -[DSNavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!objc_msgSend(MEMORY[0x24BE2CC98], "shouldShowBioRatchetFlow"))
      return;
    -[DSNavigationController currentFlowType](self, "currentFlowType");
    -[DSNavigationController paneInstanceForType:](self, "paneInstanceForType:", objc_opt_class());
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[OBNavigationController pushViewController:animated:](self, "pushViewController:animated:", v4, 1);
    v3 = v4;
  }

}

- (BOOL)isInFamiliarLocation
{
  LAContext *v3;
  LAContext *authContext;
  LAContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v3 = (LAContext *)objc_alloc_init(MEMORY[0x24BDDA938]);
  authContext = self->_authContext;
  self->_authContext = v3;

  v5 = self->_authContext;
  v13[0] = &unk_24F00B3D0;
  v13[1] = &unk_24F00B3E8;
  v14[0] = MEMORY[0x24BDBD1C8];
  v14[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[LAContext evaluatePolicy:options:error:](v5, "evaluatePolicy:options:error:", 1025, v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (void)ratchetStateDidChange:(id)a3
{
  if (objc_msgSend(a3, "rawValue") == 1)
    -[DSNavigationController sendSummaryAnalyticsWithEventName:](self, "sendSummaryAnalyticsWithEventName:", CFSTR("com.apple.DigitalSeparation.RatchetStarted"));
}

- (void)_setupRatchetObserver
{
  id v3;

  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)updateDaemonModelForCurrentPane
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = -[DSNavigationController topViewControllerType](self, "topViewControllerType");
  if (v3 == (objc_class *)objc_opt_class())
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[DSNavigationController unpairedComputers](self, "unpairedComputers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    v6 = (uint64_t *)MEMORY[0x24BE828B0];
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v29;
      v9 = *MEMORY[0x24BE828B0];
      v10 = *MEMORY[0x24BE828B8];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v4);
          v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11);
          -[DSNavigationController daemonProxy](self, "daemonProxy");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeSignalWithIdentifier:sharingType:signalType:", v12, v9, v10);

          -[DSNavigationController reviewedComputers](self, "reviewedComputers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObject:", v12);

          ++v11;
        }
        while (v7 != v11);
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v7);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[DSNavigationController reviewedComputers](self, "reviewedComputers", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      v19 = *v6;
      v20 = *MEMORY[0x24BE828B8];
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v22 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v21);
          -[DSNavigationController daemonProxy](self, "daemonProxy");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addSignalWithIdentifier:sharingType:signalType:", v22, v19, v20);

          ++v21;
        }
        while (v17 != v21);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v17);
    }

  }
}

- (NSString)entryMethod
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[DSNavigationController deepLink](self, "deepLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[DSNavigationController deepLink](self, "deepLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entrypoint");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("Default");
  }

  return (NSString *)v5;
}

- (BOOL)requiresAuthForEntry
{
  void *v3;
  void *v4;
  char v5;

  -[DSNavigationController deepLink](self, "deepLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[DSNavigationController deepLink](self, "deepLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "flowRequiresAuth");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (DSSharingPermissions)fetchedSharingPermissions
{
  return self->fetchedSharingPermissions;
}

- (void)setFetchedSharingPermissions:(id)a3
{
  objc_storeStrong((id *)&self->fetchedSharingPermissions, a3);
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (void)setEntryMethod:(id)a3
{
  objc_storeStrong((id *)&self->_entryMethod, a3);
}

- (void)setRequiresAuthForEntry:(BOOL)a3
{
  self->_requiresAuthForEntry = a3;
}

- (DSNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void)setNavigationManager:(id)a3
{
  objc_storeStrong((id *)&self->_navigationManager, a3);
}

- (NSDictionary)navigationChapters
{
  return self->_navigationChapters;
}

- (void)setNavigationChapters:(id)a3
{
  objc_storeStrong((id *)&self->_navigationChapters, a3);
}

- (NSArray)navigationOrder
{
  return self->_navigationOrder;
}

- (void)setNavigationOrder:(id)a3
{
  objc_storeStrong((id *)&self->_navigationOrder, a3);
}

- (DSRemoteUILoader)remoteUILoader
{
  return self->_remoteUILoader;
}

- (void)setRemoteUILoader:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUILoader, a3);
}

- (int64_t)currentFlowType
{
  return self->_currentFlowType;
}

- (void)setCurrentFlowType:(int64_t)a3
{
  self->_currentFlowType = a3;
}

- (Class)startingPaneType
{
  return self->_startingPaneType;
}

- (void)setStartingPaneType:(Class)a3
{
  self->_startingPaneType = a3;
}

- (int64_t)currentChapter
{
  return self->_currentChapter;
}

- (void)setCurrentChapter:(int64_t)a3
{
  self->_currentChapter = a3;
}

- (int64_t)currentChapterForAnalytics
{
  return self->_currentChapterForAnalytics;
}

- (void)setCurrentChapterForAnalytics:(int64_t)a3
{
  self->_currentChapterForAnalytics = a3;
}

- (UIViewController)networkErrorController
{
  return self->_networkErrorController;
}

- (void)setNetworkErrorController:(id)a3
{
  objc_storeStrong((id *)&self->_networkErrorController, a3);
}

- (BOOL)isShowingNetworkError
{
  return self->_isShowingNetworkError;
}

- (void)setIsShowingNetworkError:(BOOL)a3
{
  self->_isShowingNetworkError = a3;
}

- (UINavigationController)connectionErrorNavigation
{
  return self->_connectionErrorNavigation;
}

- (void)setConnectionErrorNavigation:(id)a3
{
  objc_storeStrong((id *)&self->_connectionErrorNavigation, a3);
}

- (NSDictionary)cachedPanes
{
  return self->_cachedPanes;
}

- (void)setCachedPanes:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPanes, a3);
}

- (UIWindow)obfuscationWindow
{
  return self->_obfuscationWindow;
}

- (void)setObfuscationWindow:(id)a3
{
  objc_storeStrong((id *)&self->_obfuscationWindow, a3);
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (BOOL)isReachable
{
  return self->_isReachable;
}

- (void)setIsReachable:(BOOL)a3
{
  self->_isReachable = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (DSDaemonProxy)daemonProxy
{
  return self->_daemonProxy;
}

- (void)setDaemonProxy:(id)a3
{
  objc_storeStrong((id *)&self->_daemonProxy, a3);
}

- (DSDeepLinkRepresentation)deepLink
{
  return self->_deepLink;
}

- (void)setDeepLink:(id)a3
{
  objc_storeStrong((id *)&self->_deepLink, a3);
}

- (NSMutableDictionary)unsharedResourcesBySource
{
  return self->_unsharedResourcesBySource;
}

- (void)setUnsharedResourcesBySource:(id)a3
{
  objc_storeStrong((id *)&self->_unsharedResourcesBySource, a3);
}

- (NSMutableSet)unsharedPeople
{
  return self->_unsharedPeople;
}

- (void)setUnsharedPeople:(id)a3
{
  objc_storeStrong((id *)&self->_unsharedPeople, a3);
}

- (NSMutableSet)unsharedApps
{
  return self->_unsharedApps;
}

- (void)setUnsharedApps:(id)a3
{
  objc_storeStrong((id *)&self->_unsharedApps, a3);
}

- (NSMutableSet)unsharedPermissions
{
  return self->_unsharedPermissions;
}

- (void)setUnsharedPermissions:(id)a3
{
  objc_storeStrong((id *)&self->_unsharedPermissions, a3);
}

- (NSMutableSet)unpairedComputers
{
  return self->_unpairedComputers;
}

- (void)setUnpairedComputers:(id)a3
{
  objc_storeStrong((id *)&self->_unpairedComputers, a3);
}

- (NSMutableSet)reviewedComputers
{
  return self->_reviewedComputers;
}

- (void)setReviewedComputers:(id)a3
{
  objc_storeStrong((id *)&self->_reviewedComputers, a3);
}

- (Class)deepLinkPaneType
{
  return self->_deepLinkPaneType;
}

- (void)setDeepLinkPaneType:(Class)a3
{
  objc_storeStrong((id *)&self->_deepLinkPaneType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deepLinkPaneType, 0);
  objc_storeStrong((id *)&self->_reviewedComputers, 0);
  objc_storeStrong((id *)&self->_unpairedComputers, 0);
  objc_storeStrong((id *)&self->_unsharedPermissions, 0);
  objc_storeStrong((id *)&self->_unsharedApps, 0);
  objc_storeStrong((id *)&self->_unsharedPeople, 0);
  objc_storeStrong((id *)&self->_unsharedResourcesBySource, 0);
  objc_storeStrong((id *)&self->_deepLink, 0);
  objc_storeStrong((id *)&self->_daemonProxy, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_obfuscationWindow, 0);
  objc_storeStrong((id *)&self->_cachedPanes, 0);
  objc_storeStrong((id *)&self->_connectionErrorNavigation, 0);
  objc_storeStrong((id *)&self->_networkErrorController, 0);
  objc_storeStrong((id *)&self->_remoteUILoader, 0);
  objc_storeStrong((id *)&self->_navigationOrder, 0);
  objc_storeStrong((id *)&self->_navigationChapters, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_entryMethod, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->fetchedSharingPermissions, 0);
}

void __51__DSNavigationController_authToReturnToSafetyCheck__block_invoke_371_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, a2, a3, "Error while evaluating authentication policy for Safety Check, error %@", a5, a6, a7, a8, 2u);
}

@end
