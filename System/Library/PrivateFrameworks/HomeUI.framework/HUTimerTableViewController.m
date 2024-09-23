@implementation HUTimerTableViewController

- (HUTimerTableViewController)initWithMediaProfileContainer:(id)a3
{
  id v4;
  HUTimerTableViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  COTimerManager *timerManager;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HUTimerTableViewController;
  v5 = -[HUMobileTimerObjectTableViewController initWithMediaProfileContainer:](&v23, sel_initWithMediaProfileContainer_, v4);
  if (v5)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlTimersDetailsButtonTitle"), CFSTR("HUQuickControlTimersDetailsButtonTitle"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerTableViewController setTitle:](v5, "setTitle:", v6);

    _HULocalizedStringWithDefaultValue(CFSTR("HULoadingTimers"), CFSTR("HULoadingTimers"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController setLoadingItemsTitle:](v5, "setLoadingItemsTitle:", v7);

    _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodTimersUnavailableTitle"), CFSTR("HUHomePodTimersUnavailableTitle"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController setUnavailableTitle:](v5, "setUnavailableTitle:", v8);

    _HULocalizedStringWithDefaultValue(CFSTR("HUNewTimer"), CFSTR("HUNewTimer"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController setHeaderCellTitle:](v5, "setHeaderCellTitle:", v9);

    -[HUMobileTimerObjectTableViewController setIdentifier:](v5, "setIdentifier:", *MEMORY[0x1E0D30788]);
    objc_msgSend(v4, "hf_categoryLowercaseLocalizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUHomePodTimersUnavailableExplanation"), CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController setUnavailableText:](v5, "setUnavailableText:", v17);

    v18 = (void *)MEMORY[0x1E0D148E8];
    -[HUMobileTimerObjectTableViewController accessory](v5, "accessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_TimerManagerForAccessory:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    timerManager = v5->_timerManager;
    v5->_timerManager = (COTimerManager *)v20;

    if (!v5->_timerManager)
      NSLog(CFSTR("TimerManager is missing!"));
  }

  return v5;
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
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)HUTimerTableViewController;
  -[HUMobileTimerObjectTableViewController viewDidLoad](&v28, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __41__HUTimerTableViewController_viewDidLoad__block_invoke;
  v25 = &unk_1E6F505A8;
  objc_copyWeak(&v26, &location);
  v3 = _Block_copy(&v22);
  -[HUTimerTableViewController timerManager](self, "timerManager", v22, v23, v24, v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserverForName:queue:usingBlock:", *MEMORY[0x1E0D148B0], v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController setAddNotificationObserver:](self, "setAddNotificationObserver:", v6);

  -[HUTimerTableViewController timerManager](self, "timerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserverForName:queue:usingBlock:", *MEMORY[0x1E0D148C0], v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController setUpdateNotificationObserver:](self, "setUpdateNotificationObserver:", v9);

  -[HUTimerTableViewController timerManager](self, "timerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserverForName:queue:usingBlock:", *MEMORY[0x1E0D148B8], v11, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController setRemoveNotificationObserver:](self, "setRemoveNotificationObserver:", v12);

  -[HUTimerTableViewController timerManager](self, "timerManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserverForName:queue:usingBlock:", *MEMORY[0x1E0D14890], v14, v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController setCanDispatchNotificationObserver:](self, "setCanDispatchNotificationObserver:", v15);

  -[HUTimerTableViewController timerManager](self, "timerManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserverForName:queue:usingBlock:", *MEMORY[0x1E0D148A8], v17, v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController setResetNotificationObserver:](self, "setResetNotificationObserver:", v18);

  -[HUTimerTableViewController timerManager](self, "timerManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserverForName:queue:usingBlock:", *MEMORY[0x1E0D14898], v20, v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController setFiringNotificationObserver:](self, "setFiringNotificationObserver:", v21);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __41__HUTimerTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v9 = WeakRetained;
    v10 = 2080;
    v11 = "-[HUTimerTableViewController viewDidLoad]_block_invoke";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%@)%s: received NSNotification = %@", buf, 0x20u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    NSLog(CFSTR("(%@)%s: should only be called from the main thread"), WeakRetained, "-[HUTimerTableViewController viewDidLoad]_block_invoke");
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D148C0]);

  if (v7)
    objc_msgSend(WeakRetained, "_extractUpdatedTimerObjectsFromNotification:", v3);
  objc_msgSend(WeakRetained, "_checkAccessFetchDataAndReloadTable");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUTimerTableViewController;
  -[HUMobileTimerObjectTableViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[HUTimerTableViewController animationTimer](self, "animationTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E88]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFireDate:interval:target:selector:userInfo:repeats:", v6, self, sel_animationTimerTick_, 0, 1, 0.25);
    -[HUTimerTableViewController setAnimationTimer:](self, "setAnimationTimer:", v7);

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerTableViewController animationTimer](self, "animationTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTimer:forMode:", v9, *MEMORY[0x1E0C99748]);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUTimerTableViewController;
  -[HUTimerTableViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[HUTimerTableViewController animationTimer](self, "animationTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[HUTimerTableViewController setAnimationTimer:](self, "setAnimationTimer:", 0);
}

- (void)animationTimerTick:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  -[HUTimerTableViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");

  if (v5 >= 1)
  {
    v6 = 0;
    do
    {
      objc_opt_class();
      -[HUTimerTableViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      objc_msgSend(v11, "updateTimerInfo");
      ++v6;
      -[HUTimerTableViewController tableView](self, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "numberOfSections");

    }
    while (v6 < v13);
  }
}

- (void)presentAddMobileTimerObjectViewControllerOnMainThread
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  HUTimerTableViewController *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[HUTimerTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]";
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%s(%@) adding new timer", buf, 0x16u);
  }

  -[HUTimerTableViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  -[HUTimerTableViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (v7)
  {
LABEL_6:
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[HUTimerTableViewController parentViewController](self, "parentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTimerTableViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v16 = "-[HUTimerTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]";
      v17 = 2112;
      v18 = self;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      _os_log_error_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_ERROR, "%s(%@) view hierarchy problem: parentViewController %@ / window %@", buf, 0x2Au);

    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__HUTimerTableViewController_presentAddMobileTimerObjectViewControllerOnMainThread__block_invoke;
    v13[3] = &unk_1E6F4DD08;
    objc_copyWeak(&v14, (id *)buf);
    objc_msgSend(v8, "performBlock:", v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __83__HUTimerTableViewController_presentAddMobileTimerObjectViewControllerOnMainThread__block_invoke(uint64_t a1)
{
  id WeakRetained;
  HUTimerCreationViewController *v2;
  void *v3;
  HUTimerCreationViewController *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [HUTimerCreationViewController alloc];
  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HUTimerCreationViewController initWithMediaProfileContainer:](v2, "initWithMediaProfileContainer:", v3);

  -[HUTimerCreationViewController setDelegate:](v4, "setDelegate:", WeakRetained);
  if (!v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[HUTimerTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]_block_invoke";
      v12 = 2112;
      v13 = WeakRetained;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "%s(%@) No tableviewController!", (uint8_t *)&v10, 0x16u);
    }

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v4);
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  if (!v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[HUTimerTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]_block_invoke";
      v12 = 2112;
      v13 = WeakRetained;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "%s(%@) No navController!", (uint8_t *)&v10, 0x16u);
    }

  }
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v6, 1, 0);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    objc_msgSend(v6, "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(MEMORY[0x1E0CEA478], "hu_alarmsBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

}

- (void)timerCreationViewController:(id)a3 didCreateTimer:(id)a4
{
  id v5;
  void *v6;
  HUMobileTimerObject *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a4;
  if (v5)
  {
    v10 = v5;
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      NSLog(CFSTR("(%@)%s: should only be called from the main thread"), self, "-[HUTimerTableViewController timerCreationViewController:didCreateTimer:]");
    -[HUMobileTimerObjectTableViewController mobileTimerObjects](self, "mobileTimerObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUMobileTimerObject initWithTimer:]([HUMobileTimerObject alloc], "initWithTimer:", v10);
    objc_msgSend(v6, "addObject:", v7);

    -[HUTimerTableViewController timerManager](self, "timerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "addTimer:", v10);

    -[HUMobileTimerObjectTableViewController _checkAccessFetchDataAndReloadTable](self, "_checkAccessFetchDataAndReloadTable");
    v5 = v10;
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  const char *v15;
  __int16 v16;
  HUTimerTableViewController *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HUMobileTimerObjectTableViewController tableViewDataSource](self, "tableViewDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifierForIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[HUMobileTimerObjectTableViewController headerUUID](self, "headerUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136316162;
    v15 = "-[HUTimerTableViewController tableView:didSelectRowAtIndexPath:]";
    v16 = 2112;
    v17 = self;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%s(%@) tapping indexPath = %@/objectID = %@ (FYI header ID: %@)", (uint8_t *)&v14, 0x34u);

  }
  -[HUMobileTimerObjectTableViewController headerUUID](self, "headerUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "hmf_isEqualToUUID:", v12);

  if (v13)
    -[HUMobileTimerObjectTableViewController _checkAndAddTimerObject](self, "_checkAndAddTimerObject");
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)_extractUpdatedTimerObjectsFromNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  HUTimerTableViewController *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTimerTableViewController.m"), 199, CFSTR("This shouldn't happen"));

  }
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D4FA38]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v25 = self;
    v26 = 2080;
    v27 = "-[HUTimerTableViewController _extractUpdatedTimerObjectsFromNotification:]";
    v28 = 2112;
    v29 = v5;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "(%@)%s: NSNotification %@ contained updated timers: %@", buf, 0x2Au);
  }

  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D148C0]);

  if (v10)
  {
    objc_msgSend(v7, "na_map:", &__block_literal_global_55);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController setUpdatedMobileTimerObjects:](self, "setUpdatedMobileTimerObjects:", v11);

    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      NSLog(CFSTR("(%@)%s: should only be called from the main thread"), self, "-[HUTimerTableViewController _extractUpdatedTimerObjectsFromNotification:]");
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[HUMobileTimerObjectTableViewController mobileTimerObjects](self, "mobileTimerObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = self;
      v26 = 2080;
      v27 = "-[HUTimerTableViewController _extractUpdatedTimerObjectsFromNotification:]";
      v28 = 2112;
      v29 = v21;
      _os_log_debug_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEBUG, "(%@)%s:BEFORE replace %@", buf, 0x20u);

    }
    -[HUMobileTimerObjectTableViewController mobileTimerObjects](self, "mobileTimerObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController updatedMobileTimerObjects](self, "updatedMobileTimerObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectsInArray:", v14);

    -[HUMobileTimerObjectTableViewController mobileTimerObjects](self, "mobileTimerObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController updatedMobileTimerObjects](self, "updatedMobileTimerObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v16);

    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[HUMobileTimerObjectTableViewController mobileTimerObjects](self, "mobileTimerObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = self;
      v26 = 2080;
      v27 = "-[HUTimerTableViewController _extractUpdatedTimerObjectsFromNotification:]";
      v28 = 2112;
      v29 = v22;
      _os_log_debug_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEBUG, "(%@)%s:AFTER replace %@", buf, 0x20u);

    }
  }
  objc_msgSend(v5, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D148A8]);

  if (v19)
  {
    -[HUMobileTimerObjectTableViewController mobileTimerObjects](self, "mobileTimerObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController setUpdatedMobileTimerObjects:](self, "setUpdatedMobileTimerObjects:", v20);

  }
}

HUMobileTimerObject *__74__HUTimerTableViewController__extractUpdatedTimerObjectsFromNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  HUMobileTimerObject *v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    v6 = -[HUMobileTimerObject initWithTimer:]([HUMobileTimerObject alloc], "initWithTimer:", v5);
  else
    v6 = 0;

  return v6;
}

- (void)dealloc
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
  objc_super v15;

  -[HUTimerTableViewController timerManager](self, "timerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController addNotificationObserver](self, "addNotificationObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  -[HUTimerTableViewController setAddNotificationObserver:](self, "setAddNotificationObserver:", 0);
  -[HUTimerTableViewController timerManager](self, "timerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController updateNotificationObserver](self, "updateNotificationObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v6);

  -[HUTimerTableViewController setUpdateNotificationObserver:](self, "setUpdateNotificationObserver:", 0);
  -[HUTimerTableViewController timerManager](self, "timerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController removeNotificationObserver](self, "removeNotificationObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", v8);

  -[HUTimerTableViewController setRemoveNotificationObserver:](self, "setRemoveNotificationObserver:", 0);
  -[HUTimerTableViewController timerManager](self, "timerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController canDispatchNotificationObserver](self, "canDispatchNotificationObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", v10);

  -[HUTimerTableViewController setCanDispatchNotificationObserver:](self, "setCanDispatchNotificationObserver:", 0);
  -[HUTimerTableViewController timerManager](self, "timerManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController resetNotificationObserver](self, "resetNotificationObserver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:", v12);

  -[HUTimerTableViewController setResetNotificationObserver:](self, "setResetNotificationObserver:", 0);
  -[HUTimerTableViewController timerManager](self, "timerManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController firingNotificationObserver](self, "firingNotificationObserver");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:", v14);

  -[HUTimerTableViewController setFiringNotificationObserver:](self, "setFiringNotificationObserver:", 0);
  v15.receiver = self;
  v15.super_class = (Class)HUTimerTableViewController;
  -[HUMobileTimerObjectTableViewController dealloc](&v15, sel_dealloc);
}

- (id)_baseMobileTimerObjectsFuture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[HUMobileTimerObjectTableViewController mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x1E0C99D20];
    -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  -[HUTimerTableViewController timerManager](self, "timerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timersForAccessories:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flatMap:", &__block_literal_global_49_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __59__HUTimerTableViewController__baseMobileTimerObjectsFuture__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__HUTimerTableViewController__baseMobileTimerObjectsFuture__block_invoke_2;
  v10[3] = &unk_1E6F50650;
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_each:", v10);

  objc_msgSend(v5, "na_map:", &__block_literal_global_53);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __59__HUTimerTableViewController__baseMobileTimerObjectsFuture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

HUMobileTimerObject *__59__HUTimerTableViewController__baseMobileTimerObjectsFuture__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  HUMobileTimerObject *v3;

  v2 = a2;
  v3 = -[HUMobileTimerObject initWithTimer:]([HUMobileTimerObject alloc], "initWithTimer:", v2);

  return v3;
}

- (id)_newCellForMTTimerObjectUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  HUTimerTableViewCell *v7;
  NSObject *v8;
  HUTimerTableViewCell *v9;
  int v11;
  HUTimerTableViewController *v12;
  __int16 v13;
  HUTimerTableViewController *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUTimerTableViewController _findTimerObjectForID:](self, "_findTimerObjectForID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = (HUTimerTableViewController *)"-[HUTimerTableViewController _newCellForMTTimerObjectUUID:]";
    v13 = 2112;
    v14 = self;
    v15 = 2112;
    v16 = v5;
    _os_log_debug_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEBUG, "%s(%@) new MT Cell for %@", (uint8_t *)&v11, 0x20u);
  }

  if (v5)
  {
    v7 = [HUTimerTableViewCell alloc];
    -[HUTimerTableViewController timerManager](self, "timerManager");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -[HUTimerTableViewCell initWithMobileTimerObject:manager:roomName:](v7, "initWithMobileTimerObject:manager:roomName:", v5, v8, 0);
  }
  else
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412802;
      v12 = self;
      v13 = 2080;
      v14 = (HUTimerTableViewController *)"-[HUTimerTableViewController _newCellForMTTimerObjectUUID:]";
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "(%@)%s: could not find mobileTimerObject for ID: %@", (uint8_t *)&v11, 0x20u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)_canManagerControlAccessory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUMobileTimerObjectTableViewController accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewController timerManager](self, "timerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAlarmsAndTimersAccessUtility canAccess:for:withManager:](HUAlarmsAndTimersAccessUtility, "canAccess:for:withManager:", v3, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reschedule:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_findTimerObjectForID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUMobileTimerObjectTableViewController mobileTimerObjects](self, "mobileTimerObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__HUTimerTableViewController__findTimerObjectForID___block_invoke;
  v9[3] = &unk_1E6F506B8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __52__HUTimerTableViewController__findTimerObjectForID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)_removeTimerObjectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  HUTimerTableViewController *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUTimerTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "timer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138413058;
      v16 = self;
      v17 = 2080;
      v18 = "-[HUTimerTableViewController _removeTimerObjectAtIndexPath:]";
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "(%@)%s: Removing timer %@ at %@", (uint8_t *)&v15, 0x2Au);
    }

    if (v10)
    {
      -[HUTimerTableViewController timerManager](self, "timerManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v12, "removeTimer:", v10);

      objc_msgSend(v10, "timerID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUMobileTimerObjectTableViewController _quickDeleteMobileTimerObjectFromTable:](self, "_quickDeleteMobileTimerObjectFromTable:", v14);

    }
  }

}

- (id)presentationDelegate
{
  return objc_loadWeakRetained((id *)&self->presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presentationDelegate, a3);
}

- (COTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (NSTimer)animationTimer
{
  return self->_animationTimer;
}

- (void)setAnimationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_animationTimer, a3);
}

- (id)addNotificationObserver
{
  return self->_addNotificationObserver;
}

- (void)setAddNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_addNotificationObserver, a3);
}

- (id)removeNotificationObserver
{
  return self->_removeNotificationObserver;
}

- (void)setRemoveNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_removeNotificationObserver, a3);
}

- (id)updateNotificationObserver
{
  return self->_updateNotificationObserver;
}

- (void)setUpdateNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_updateNotificationObserver, a3);
}

- (id)canDispatchNotificationObserver
{
  return self->_canDispatchNotificationObserver;
}

- (void)setCanDispatchNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_canDispatchNotificationObserver, a3);
}

- (id)resetNotificationObserver
{
  return self->_resetNotificationObserver;
}

- (void)setResetNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_resetNotificationObserver, a3);
}

- (id)firingNotificationObserver
{
  return self->_firingNotificationObserver;
}

- (void)setFiringNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_firingNotificationObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firingNotificationObserver, 0);
  objc_storeStrong(&self->_resetNotificationObserver, 0);
  objc_storeStrong(&self->_canDispatchNotificationObserver, 0);
  objc_storeStrong(&self->_updateNotificationObserver, 0);
  objc_storeStrong(&self->_removeNotificationObserver, 0);
  objc_storeStrong(&self->_addNotificationObserver, 0);
  objc_storeStrong((id *)&self->_animationTimer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end
