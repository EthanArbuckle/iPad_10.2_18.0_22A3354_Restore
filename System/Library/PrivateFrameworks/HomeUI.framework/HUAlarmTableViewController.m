@implementation HUAlarmTableViewController

- (HUAlarmTableViewController)initWithMediaProfileContainer:(id)a3
{
  id v4;
  HUAlarmTableViewController *v5;
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
  COAlarmManager *alarmManager;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HUAlarmTableViewController;
  v5 = -[HUMobileTimerObjectTableViewController initWithMediaProfileContainer:](&v23, sel_initWithMediaProfileContainer_, v4);
  if (v5)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlAlarmsDetailsButtonTitle"), CFSTR("HUQuickControlAlarmsDetailsButtonTitle"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmTableViewController setTitle:](v5, "setTitle:", v6);

    _HULocalizedStringWithDefaultValue(CFSTR("HULoadingAlarms"), CFSTR("HULoadingAlarms"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController setLoadingItemsTitle:](v5, "setLoadingItemsTitle:", v7);

    _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodAlarmsUnavailableTitle"), CFSTR("HUHomePodAlarmsUnavailableTitle"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController setUnavailableTitle:](v5, "setUnavailableTitle:", v8);

    _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodAlarmsNewAlarm"), CFSTR("HUHomePodAlarmsNewAlarm"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController setHeaderCellTitle:](v5, "setHeaderCellTitle:", v9);

    -[HUMobileTimerObjectTableViewController setIdentifier:](v5, "setIdentifier:", *MEMORY[0x1E0D306F0]);
    objc_msgSend(v4, "hf_categoryLowercaseLocalizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUHomePodAlarmsUnavailableExplanation"), CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController setUnavailableText:](v5, "setUnavailableText:", v17);

    v18 = (void *)MEMORY[0x1E0D148D8];
    -[HUMobileTimerObjectTableViewController accessory](v5, "accessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_AlarmManagerForAccessory:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    alarmManager = v5->_alarmManager;
    v5->_alarmManager = (COAlarmManager *)v20;

    if (!v5->_alarmManager)
      NSLog(CFSTR("AlarmManager is missing!"));
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
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)HUAlarmTableViewController;
  -[HUMobileTimerObjectTableViewController viewDidLoad](&v25, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __41__HUAlarmTableViewController_viewDidLoad__block_invoke;
  v22 = &unk_1E6F505A8;
  objc_copyWeak(&v23, &location);
  v3 = _Block_copy(&v19);
  -[HUAlarmTableViewController alarmManager](self, "alarmManager", v19, v20, v21, v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserverForName:queue:usingBlock:", *MEMORY[0x1E0D14850], v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewController setAddNotificationObserver:](self, "setAddNotificationObserver:", v6);

  -[HUAlarmTableViewController alarmManager](self, "alarmManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserverForName:queue:usingBlock:", *MEMORY[0x1E0D14860], v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewController setUpdateNotificationObserver:](self, "setUpdateNotificationObserver:", v9);

  -[HUAlarmTableViewController alarmManager](self, "alarmManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserverForName:queue:usingBlock:", *MEMORY[0x1E0D14858], v11, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewController setRemoveNotificationObserver:](self, "setRemoveNotificationObserver:", v12);

  -[HUAlarmTableViewController alarmManager](self, "alarmManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserverForName:queue:usingBlock:", *MEMORY[0x1E0D14868], v14, v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewController setCanDispatchNotificationObserver:](self, "setCanDispatchNotificationObserver:", v15);

  -[HUAlarmTableViewController alarmManager](self, "alarmManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserverForName:queue:usingBlock:", *MEMORY[0x1E0D14878], v17, v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewController setResetNotificationObserver:](self, "setResetNotificationObserver:", v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __41__HUAlarmTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint8_t buf[4];
  id v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v7 = WeakRetained;
    v8 = 2080;
    v9 = "-[HUAlarmTableViewController viewDidLoad]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%@)%s: received NSNotification = %@", buf, 0x20u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    NSLog(CFSTR("(%@)%s: should only be called from the main thread"), WeakRetained, "-[HUAlarmTableViewController viewDidLoad]_block_invoke");
  objc_msgSend(WeakRetained, "_extractUpdatedTimerObjectsFromNotification:", v3);
  objc_msgSend(WeakRetained, "_checkAccessFetchDataAndReloadTable");

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
  HUAlarmTableViewController *v18;
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
    v16 = "-[HUAlarmTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]";
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%s(%@) adding new alarm", buf, 0x16u);
  }

  -[HUAlarmTableViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  -[HUAlarmTableViewController view](self, "view");
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
      -[HUAlarmTableViewController parentViewController](self, "parentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAlarmTableViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v16 = "-[HUAlarmTableViewController presentAddMobileTimerObjectViewControllerOnMainThread]";
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
    v13[2] = __83__HUAlarmTableViewController_presentAddMobileTimerObjectViewControllerOnMainThread__block_invoke;
    v13[3] = &unk_1E6F4DD08;
    objc_copyWeak(&v14, (id *)buf);
    objc_msgSend(v8, "performBlock:", v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __83__HUAlarmTableViewController_presentAddMobileTimerObjectViewControllerOnMainThread__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editViewControllerForAlarm:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v1, 1, 0);

}

- (id)editViewControllerForAlarm:(id)a3
{
  id v4;
  HUAlarmEditViewController *v5;
  void *v6;
  HUAlarmEditViewController *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  HUAlarmTableViewController *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HUAlarmEditViewController alloc];
  -[HUMobileTimerObjectTableViewController mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUAlarmEditViewController initWithMediaProfileContainer:alarm:](v5, "initWithMediaProfileContainer:alarm:", v6, v4);

  -[HUMobileTimerObjectTableViewController mediaProfileContainer](self, "mediaProfileContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_appleMusicCurrentLoggedInAccountDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmEditViewController setLoggedInAppleMusicAccountDSID:](v7, "setLoggedInAppleMusicAccountDSID:", v9);

  -[HUAlarmEditViewController setDelegate:](v7, "setDelegate:", self);
  if (!v7)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "-[HUAlarmTableViewController editViewControllerForAlarm:]";
      v18 = 2112;
      v19 = self;
      _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "%s(%@) No editAlarmViewController!", (uint8_t *)&v16, 0x16u);
    }

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v7);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    objc_msgSend(v11, "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(MEMORY[0x1E0CEA478], "hu_alarmsBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  if (!v11)
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "-[HUAlarmTableViewController editViewControllerForAlarm:]";
      v18 = 2112;
      v19 = self;
      _os_log_error_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_ERROR, "%s(%@) No navigationController!", (uint8_t *)&v16, 0x16u);
    }

  }
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[HUMobileTimerObjectTableViewController tableViewDataSource](self, "tableViewDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifierForIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMobileTimerObjectTableViewController headerUUID](self, "headerUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "hmf_isEqualToUUID:", v11);

  if (v12)
  {
    -[HUMobileTimerObjectTableViewController _checkAndAddTimerObject](self, "_checkAndAddTimerObject");
  }
  else
  {
    -[HUAlarmTableViewController _findTimerObjectForID:](self, "_findTimerObjectForID:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "alarm");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAlarmTableViewController.m"), 152, CFSTR("HUMobileTimerObject must wrap an alarm"));

      }
      HFLogForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v15;
        _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "Editing alarm: %@", (uint8_t *)&v19, 0xCu);
      }

      -[HUAlarmTableViewController editViewControllerForAlarm:](self, "editViewControllerForAlarm:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAlarmTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

    }
  }
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)setAlarmEnabled:(BOOL)a3 forCell:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  HUAlarmTableViewController *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "alarm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138413058;
      v16 = self;
      v17 = 2080;
      v18 = "-[HUAlarmTableViewController setAlarmEnabled:forCell:]";
      v19 = 2112;
      v20 = v10;
      v21 = 1024;
      v22 = v4;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "(%@)%s: setting alarm %@ enabled to %{BOOL}d", (uint8_t *)&v15, 0x26u);
    }

    v12 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v12, "setEnabled:", v4);
    -[HUAlarmTableViewController alarmManager](self, "alarmManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "updateAlarm:", v12);

  }
}

- (void)alarmEditControllerGettingDismissed:(id)a3
{
  id v3;

  -[HUAlarmTableViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

}

- (void)alarmEditControllerDidCancel:(id)a3
{
  -[HUAlarmTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  HUMobileTimerObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  HUAlarmTableViewController *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v12 = self;
    v13 = 2080;
    v14 = "-[HUAlarmTableViewController alarmEditController:didAddAlarm:]";
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(%@)%s: Adding alarm %@", buf, 0x20u);
  }

  if (v5)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      NSLog(CFSTR("(%@)%s: should only be called from the main thread"), self, "-[HUAlarmTableViewController alarmEditController:didAddAlarm:]");
    -[HUMobileTimerObjectTableViewController mobileTimerObjects](self, "mobileTimerObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HUMobileTimerObject initWithAlarm:]([HUMobileTimerObject alloc], "initWithAlarm:", v5);
    objc_msgSend(v7, "addObject:", v8);

    -[HUAlarmTableViewController alarmManager](self, "alarmManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "addAlarm:", v5);

    -[HUMobileTimerObjectTableViewController _checkAccessFetchDataAndReloadTable](self, "_checkAccessFetchDataAndReloadTable");
  }
  -[HUAlarmTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  HUMobileTimerObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  HUAlarmTableViewController *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412802;
    v20 = self;
    v21 = 2080;
    v22 = "-[HUAlarmTableViewController alarmEditController:didEditAlarm:]";
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(%@)%s: Editing alarm %@", (uint8_t *)&v19, 0x20u);
  }

  -[HUAlarmTableViewController alarmManager](self, "alarmManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "updateAlarm:", v5);

  v9 = -[HUMobileTimerObject initWithAlarm:]([HUMobileTimerObject alloc], "initWithAlarm:", v5);
  -[HUMobileTimerObjectTableViewController tableViewDataSource](self, "tableViewDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMobileTimerObject uniqueIdentifier](v9, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForItemIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAlarmTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cellForRowAtIndexPath:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "alarm");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "alarmID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alarmID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  if (v18)
  {
    objc_msgSend(v14, "refreshUI:roomName:animated:", v5, 0, 1);
    -[HUMobileTimerObjectTableViewController _checkAccessFetchDataAndReloadTable](self, "_checkAccessFetchDataAndReloadTable");
  }
  -[HUAlarmTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  HUAlarmTableViewController *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412802;
    v11 = self;
    v12 = 2080;
    v13 = "-[HUAlarmTableViewController alarmEditController:didDeleteAlarm:]";
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(%@)%s: Deleting alarm %@", (uint8_t *)&v10, 0x20u);
  }

  if ((HFPreferencesBoolForKey() & 1) == 0)
  {
    -[HUAlarmTableViewController alarmManager](self, "alarmManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "removeAlarm:", v5);

  }
  objc_msgSend(v5, "alarmID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMobileTimerObjectTableViewController _quickDeleteMobileTimerObjectFromTable:](self, "_quickDeleteMobileTimerObjectFromTable:", v9);

  -[HUAlarmTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
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
  HUAlarmTableViewController *v25;
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
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAlarmTableViewController.m"), 251, CFSTR("This shouldn't happen"));

  }
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D4F958]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v25 = self;
    v26 = 2080;
    v27 = "-[HUAlarmTableViewController _extractUpdatedTimerObjectsFromNotification:]";
    v28 = 2112;
    v29 = v5;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "(%@)%s: NSNotification %@ contained updated alarms: %@", buf, 0x2Au);
  }

  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D14860]);

  if (v10)
  {
    objc_msgSend(v7, "na_map:", &__block_literal_global_154);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController setUpdatedMobileTimerObjects:](self, "setUpdatedMobileTimerObjects:", v11);

    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      NSLog(CFSTR("(%@)%s: should only be called from the main thread"), self, "-[HUAlarmTableViewController _extractUpdatedTimerObjectsFromNotification:]");
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[HUMobileTimerObjectTableViewController mobileTimerObjects](self, "mobileTimerObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = self;
      v26 = 2080;
      v27 = "-[HUAlarmTableViewController _extractUpdatedTimerObjectsFromNotification:]";
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
      v27 = "-[HUAlarmTableViewController _extractUpdatedTimerObjectsFromNotification:]";
      v28 = 2112;
      v29 = v22;
      _os_log_debug_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEBUG, "(%@)%s:AFTER replace %@", buf, 0x20u);

    }
  }
  objc_msgSend(v5, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D14878]);

  if (v19)
  {
    -[HUMobileTimerObjectTableViewController mobileTimerObjects](self, "mobileTimerObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMobileTimerObjectTableViewController setUpdatedMobileTimerObjects:](self, "setUpdatedMobileTimerObjects:", v20);

  }
}

HUMobileTimerObject *__74__HUAlarmTableViewController__extractUpdatedTimerObjectsFromNotification___block_invoke(uint64_t a1, void *a2)
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
    v6 = -[HUMobileTimerObject initWithAlarm:]([HUMobileTimerObject alloc], "initWithAlarm:", v5);
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
  objc_super v13;

  -[HUAlarmTableViewController alarmManager](self, "alarmManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewController addNotificationObserver](self, "addNotificationObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  -[HUAlarmTableViewController setAddNotificationObserver:](self, "setAddNotificationObserver:", 0);
  -[HUAlarmTableViewController alarmManager](self, "alarmManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewController updateNotificationObserver](self, "updateNotificationObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v6);

  -[HUAlarmTableViewController setUpdateNotificationObserver:](self, "setUpdateNotificationObserver:", 0);
  -[HUAlarmTableViewController alarmManager](self, "alarmManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewController removeNotificationObserver](self, "removeNotificationObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", v8);

  -[HUAlarmTableViewController setRemoveNotificationObserver:](self, "setRemoveNotificationObserver:", 0);
  -[HUAlarmTableViewController alarmManager](self, "alarmManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewController canDispatchNotificationObserver](self, "canDispatchNotificationObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", v10);

  -[HUAlarmTableViewController setCanDispatchNotificationObserver:](self, "setCanDispatchNotificationObserver:", 0);
  -[HUAlarmTableViewController alarmManager](self, "alarmManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewController resetNotificationObserver](self, "resetNotificationObserver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:", v12);

  -[HUAlarmTableViewController setResetNotificationObserver:](self, "setResetNotificationObserver:", 0);
  v13.receiver = self;
  v13.super_class = (Class)HUAlarmTableViewController;
  -[HUMobileTimerObjectTableViewController dealloc](&v13, sel_dealloc);
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
  -[HUAlarmTableViewController alarmManager](self, "alarmManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alarmsForAccessories:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flatMap:", &__block_literal_global_43_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __59__HUAlarmTableViewController__baseMobileTimerObjectsFuture__block_invoke(uint64_t a1, void *a2)
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
  v10[2] = __59__HUAlarmTableViewController__baseMobileTimerObjectsFuture__block_invoke_2;
  v10[3] = &unk_1E6F50650;
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_each:", v10);

  objc_msgSend(v5, "na_map:", &__block_literal_global_47);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __59__HUAlarmTableViewController__baseMobileTimerObjectsFuture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

HUMobileTimerObject *__59__HUAlarmTableViewController__baseMobileTimerObjectsFuture__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  HUMobileTimerObject *v3;

  v2 = a2;
  v3 = -[HUMobileTimerObject initWithAlarm:]([HUMobileTimerObject alloc], "initWithAlarm:", v2);

  return v3;
}

- (id)_newCellForMTTimerObjectUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  HUAlarmTableViewCell *v7;
  NSObject *v8;
  int v10;
  HUAlarmTableViewController *v11;
  __int16 v12;
  HUAlarmTableViewController *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUAlarmTableViewController _findTimerObjectForID:](self, "_findTimerObjectForID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315650;
    v11 = (HUAlarmTableViewController *)"-[HUAlarmTableViewController _newCellForMTTimerObjectUUID:]";
    v12 = 2112;
    v13 = self;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEBUG, "%s(%@) new MT Cell for %@", (uint8_t *)&v10, 0x20u);
  }

  if (v5)
  {
    v7 = -[HUAlarmTableViewCell initWithMobileTimerObject:roomName:]([HUAlarmTableViewCell alloc], "initWithMobileTimerObject:roomName:", v5, 0);
    -[HUAlarmTableViewCell setDelegate:](v7, "setDelegate:", self);
  }
  else
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412802;
      v11 = self;
      v12 = 2080;
      v13 = (HUAlarmTableViewController *)"-[HUAlarmTableViewController _newCellForMTTimerObjectUUID:]";
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "(%@)%s: could not find mobileTimerObject for ID: %@", (uint8_t *)&v10, 0x20u);
    }

    v7 = 0;
  }

  return v7;
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
  -[HUAlarmTableViewController alarmManager](self, "alarmManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAlarmsAndTimersAccessUtility canAccess:for:withManager:](HUAlarmsAndTimersAccessUtility, "canAccess:for:withManager:", v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reschedule:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_fakeMobileAlarmObjectsFuture
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", &__block_literal_global_51_0);
}

void __59__HUAlarmTableViewController__fakeMobileAlarmObjectsFuture__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4FA60]), "initWithHour:minute:", 18, 0);
  objc_msgSend(v3, "setTitle:", CFSTR("6pmAlarm"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4FA60]), "initWithHour:minute:", 19, 0);
  objc_msgSend(v4, "setTitle:", CFSTR("7pmAlarm"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4FA60]), "initWithHour:minute:", 20, 0);
  objc_msgSend(v5, "setTitle:", CFSTR("8pmAlarm"));
  v14[0] = v3;
  v14[1] = v4;
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_59_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_time(0, 5000000000);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__HUAlarmTableViewController__fakeMobileAlarmObjectsFuture__block_invoke_3;
  v11[3] = &unk_1E6F4C638;
  v12 = v2;
  v13 = v7;
  v9 = v7;
  v10 = v2;
  dispatch_after(v8, MEMORY[0x1E0C80D38], v11);

}

HUMobileTimerObject *__59__HUAlarmTableViewController__fakeMobileAlarmObjectsFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HUMobileTimerObject *v3;

  v2 = a2;
  v3 = -[HUMobileTimerObject initWithAlarm:]([HUMobileTimerObject alloc], "initWithAlarm:", v2);

  return v3;
}

uint64_t __59__HUAlarmTableViewController__fakeMobileAlarmObjectsFuture__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
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
  v9[2] = __52__HUAlarmTableViewController__findTimerObjectForID___block_invoke;
  v9[3] = &unk_1E6F506B8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __52__HUAlarmTableViewController__findTimerObjectForID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "alarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alarmID");
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
  HUAlarmTableViewController *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUAlarmTableViewController tableView](self, "tableView");
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
    objc_msgSend(v9, "alarm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138413058;
      v16 = self;
      v17 = 2080;
      v18 = "-[HUAlarmTableViewController _removeTimerObjectAtIndexPath:]";
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "(%@)%s: Removing alarm %@ at %@", (uint8_t *)&v15, 0x2Au);
    }

    if (v10)
    {
      if ((HFPreferencesBoolForKey() & 1) == 0)
      {
        -[HUAlarmTableViewController alarmManager](self, "alarmManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)objc_msgSend(v12, "removeAlarm:", v10);

      }
      objc_msgSend(v10, "alarmID");
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

- (COAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
  objc_storeStrong((id *)&self->_alarmManager, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetNotificationObserver, 0);
  objc_storeStrong(&self->_canDispatchNotificationObserver, 0);
  objc_storeStrong(&self->_updateNotificationObserver, 0);
  objc_storeStrong(&self->_removeNotificationObserver, 0);
  objc_storeStrong(&self->_addNotificationObserver, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end
