@implementation HUOLDAlarmTableViewController

- (HUOLDAlarmTableViewController)initWithMediaProfileContainer:(id)a3
{
  id v6;
  void *v7;
  HUOLDAlarmTableViewController *v8;
  HUHomePodAlarmItemModuleController *v9;
  void *v10;
  uint64_t v11;
  HUHomePodAlarmItemModuleController *alarmModuleController;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v31;
  objc_super v32;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUOLDAlarmTableViewController.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31450]), "initWithDelegate:mediaProfileContainer:", self, v6);
  v32.receiver = self;
  v32.super_class = (Class)HUOLDAlarmTableViewController;
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v32, sel_initWithItemManager_tableViewStyle_, v7, 2);
  if (v8)
  {
    v9 = [HUHomePodAlarmItemModuleController alloc];
    objc_msgSend(v7, "alarmItemModule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HUHomePodAlarmItemModuleController initWithModule:](v9, "initWithModule:", v10);
    alarmModuleController = v8->_alarmModuleController;
    v8->_alarmModuleController = (HUHomePodAlarmItemModuleController *)v11;

    -[HUHomePodAlarmItemModuleController setDelegate:](v8->_alarmModuleController, "setDelegate:", v8);
    objc_msgSend(v6, "hf_settingsAdapterManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "adapterForIdentifier:", *MEMORY[0x1E0D30138]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:", v8);

    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("BarAlarmTemplate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUOLDAlarmTableViewController tabBarItem](v8, "tabBarItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v15);

    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("BarAlarmOn"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUOLDAlarmTableViewController tabBarItem](v8, "tabBarItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSelectedImage:", v17);

    objc_msgSend(v6, "hf_serviceNameComponents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serviceName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUAlarmClock"), CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUOLDAlarmTableViewController setTitle:](v8, "setTitle:", v27);
    -[HUTableViewController setSectionContentInsetFollowsLayoutMargins:](v8, "setSectionContentInsetFollowsLayoutMargins:", 0);
    -[HUItemTableViewController setWantsPreferredContentSize:](v8, "setWantsPreferredContentSize:", 1);
    v28 = (id)objc_msgSend(v7, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
    objc_storeStrong((id *)&v8->_mediaProfileContainer, a3);
    -[HUOLDAlarmTableViewController _discernReachabilityForAccessory:](v8, "_discernReachabilityForAccessory:", 0);
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addAccessoryObserver:", v8);

  }
  return v8;
}

- (id)itemModuleControllers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUOLDAlarmTableViewController alarmModuleController](self, "alarmModuleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HUOLDAlarmTableViewController;
  -[HUItemTableViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[HUOLDAlarmTableViewController _numberOfItemsDidChangeAnimated:](self, "_numberOfItemsDidChangeAnimated:", v3);
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
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
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUOLDAlarmTableViewController;
  -[HUItemTableViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  MTUIMainScreenScale();
  v11 = -1.0 / v10;
  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentInset:", v11, v5, v7, v9);

  -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[HUOLDAlarmTableViewController _layoutNoItemsLabel](self, "_layoutNoItemsLabel");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUOLDAlarmTableViewController;
  -[HUItemTableViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsSelectionDuringEditing:", 1);

  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsSelection:", 1);

  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setMarginWidth:", 1.0);

  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLayoutMarginsFollowReadableWidth:", 1);

  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEstimatedRowHeight:", 88.0);

  v8 = *MEMORY[0x1E0CEBC10];
  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRowHeight:", v8);

  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSectionFooterHeight:", 0.0);

  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSeparatorStyle:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setTopPadding:", 0.0);

  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setBottomPadding:", 0.0);

  -[HUOLDAlarmTableViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClipsToBounds:", 1);

  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", 10.0);

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  double v7;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleForSection:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = *MEMORY[0x1E0CEBC10];
  else
    v7 = 8.0;

  return v7;
}

- (double)heightForFooterInTableView:(id)a3
{
  return 10.0;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)alwaysUseDeltaTableViewUpdatesAfterViewHasAppeared
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)presentAddNewAlarmViewController
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "adding new alarm", v5, 2u);
  }

  -[HUOLDAlarmTableViewController editViewControllerForAlarmItem:](self, "editViewControllerForAlarmItem:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUOLDAlarmTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)alarmItemModuleController:(id)a3 didSelectAlarmItem:(id)a4
{
  id v5;

  -[HUOLDAlarmTableViewController editViewControllerForAlarmItem:](self, "editViewControllerForAlarmItem:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUOLDAlarmTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (id)editViewControllerForAlarmItem:(id)a3
{
  id v4;
  HUAlarmEditViewController *v5;
  void *v6;
  void *v7;
  HUAlarmEditViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = [HUAlarmEditViewController alloc];
  -[HUOLDAlarmTableViewController mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HUAlarmEditViewController initWithMediaProfileContainer:alarm:](v5, "initWithMediaProfileContainer:alarm:", v6, v7);
  -[HUOLDAlarmTableViewController alarmItemManager](self, "alarmItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaProfileContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_appleMusicCurrentLoggedInAccountDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmEditViewController setLoggedInAppleMusicAccountDSID:](v8, "setLoggedInAppleMusicAccountDSID:", v11);

  -[HUAlarmEditViewController setDelegate:](v8, "setDelegate:", self);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v8);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    objc_msgSend(v12, "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(MEMORY[0x1E0CEA478], "hu_alarmsBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  return v12;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__HUOLDAlarmTableViewController_dismissViewControllerAnimated_completion___block_invoke;
  v8[3] = &unk_1E6F4DD08;
  objc_copyWeak(&v9, &location);
  v7.receiver = self;
  v7.super_class = (Class)HUOLDAlarmTableViewController;
  -[HUOLDAlarmTableViewController dismissViewControllerAnimated:completion:](&v7, sel_dismissViewControllerAnimated_completion_, v4, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __74__HUOLDAlarmTableViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tableView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUserInteractionEnabled:", 1);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (HUIsVeryWidePhoneSize() && HUIsPhoneIdiom())
    objc_msgSend(v8, "setModalPresentationStyle:", 2);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__HUOLDAlarmTableViewController_presentViewController_animated_completion___block_invoke;
  v12[3] = &unk_1E6F4DD30;
  objc_copyWeak(&v14, &location);
  v10 = v9;
  v13 = v10;
  v11.receiver = self;
  v11.super_class = (Class)HUOLDAlarmTableViewController;
  -[HUOLDAlarmTableViewController presentViewController:animated:completion:](&v11, sel_presentViewController_animated_completion_, v8, v6, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __75__HUOLDAlarmTableViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  if (-[HUOLDAlarmTableViewController isAccessoryControllable](self, "isAccessoryControllable"))
  {
    v7.receiver = self;
    v7.super_class = (Class)HUOLDAlarmTableViewController;
    v5 = -[HUItemTableViewController numberOfSectionsInTableView:](&v7, sel_numberOfSectionsInTableView_, v4);
  }
  else
  {
    v5 = 0;
  }

  return (int64_t)v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  if (a4 == 1)
  {
    if (a5)
    {
      v6 = a5;
      -[HUOLDAlarmTableViewController alarmItemManager](self, "alarmItemManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayedItemAtIndexPath:", v6);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "alarm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUOLDAlarmTableViewController alarmItemManager](self, "alarmItemManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "alarmItemModule");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mobileTimerAdapterForAlarmItem:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v11, "removeAlarm:", v8);

    }
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v4;
  unsigned int v5;

  -[HUOLDAlarmTableViewController alarmModuleController](self, "alarmModuleController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsCellSelection");

  return v5;
}

- (void)itemManagerDidUpdate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUOLDAlarmTableViewController;
  -[HUItemTableViewController itemManagerDidUpdate:](&v4, sel_itemManagerDidUpdate_, a3);
  -[HUOLDAlarmTableViewController _numberOfItemsDidChangeAnimated:](self, "_numberOfItemsDidChangeAnimated:", -[HUOLDAlarmTableViewController isViewLoaded](self, "isViewLoaded"));
}

- (void)alarmEditControllerDidCancel:(id)a3
{
  -[HUOLDAlarmTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)alarmEditControllerGettingDismissed:(id)a3
{
  id v3;

  -[HUOLDAlarmTableViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

}

- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4 forMediaProfile:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  HUOLDAlarmTableViewController *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    -[HUOLDAlarmTableViewController mediaProfileContainer](self, "mediaProfileContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaProfiles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315906;
    v19 = "-[HUOLDAlarmTableViewController alarmEditController:didAddAlarm:forMediaProfile:]";
    v20 = 2112;
    v21 = self;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%s(%@): Adding alarm %@ to profile %@", (uint8_t *)&v18, 0x2Au);
  }

  -[HUOLDAlarmTableViewController alarmItemManager](self, "alarmItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alarmItemModule");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mobileTimerAdapterForMediaProfile:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "addAlarm:", v9);

  -[HUOLDAlarmTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4 forMediaProfile:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  HUOLDAlarmTableViewController *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    -[HUOLDAlarmTableViewController mediaProfileContainer](self, "mediaProfileContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaProfiles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315906;
    v19 = "-[HUOLDAlarmTableViewController alarmEditController:didEditAlarm:forMediaProfile:]";
    v20 = 2112;
    v21 = self;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%s(%@): Editing alarm %@ for profile %@", (uint8_t *)&v18, 0x2Au);
  }

  -[HUOLDAlarmTableViewController alarmItemManager](self, "alarmItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alarmItemModule");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mobileTimerAdapterForMediaProfile:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "updateAlarm:", v9);

  -[HUOLDAlarmTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4 forMediaProfile:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  HUOLDAlarmTableViewController *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    -[HUOLDAlarmTableViewController mediaProfileContainer](self, "mediaProfileContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaProfiles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315906;
    v19 = "-[HUOLDAlarmTableViewController alarmEditController:didDeleteAlarm:forMediaProfile:]";
    v20 = 2112;
    v21 = self;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%s(%@): Deleting alarm %@ from profile %@", (uint8_t *)&v18, 0x2Au);
  }

  -[HUOLDAlarmTableViewController alarmItemManager](self, "alarmItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alarmItemModule");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mobileTimerAdapterForMediaProfile:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "removeAlarm:", v9);

  -[HUOLDAlarmTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4
{
  -[HUOLDAlarmTableViewController alarmEditController:didAddAlarm:forMediaProfile:](self, "alarmEditController:didAddAlarm:forMediaProfile:", a3, a4, 0);
}

- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4
{
  -[HUOLDAlarmTableViewController alarmEditController:didDeleteAlarm:forMediaProfile:](self, "alarmEditController:didDeleteAlarm:forMediaProfile:", a3, a4, 0);
}

- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4
{
  -[HUOLDAlarmTableViewController alarmEditController:didEditAlarm:forMediaProfile:](self, "alarmEditController:didEditAlarm:forMediaProfile:", a3, a4, 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v7.receiver = self;
  v7.super_class = (Class)HUOLDAlarmTableViewController;
  -[HUOLDAlarmTableViewController setEditing:animated:](&v7, sel_setEditing_animated_, v5, v4);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_editDoneAction:(id)a3
{
  -[HUOLDAlarmTableViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (id)backgroundView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v4 = (void *)objc_opt_new();
    -[HUOLDAlarmTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v4, "setFrame:");

    -[HUOLDAlarmTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundView:", v4);

  }
  return v4;
}

- (void)_layoutNoItemsLabel
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  -[HUOLDAlarmTableViewController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");

  if (v5 <= v7)
    v9 = v7;
  else
    v9 = v5;
  if (v5 <= v7)
    v10 = v5;
  else
    v10 = v7;
  MTUIRoundToPixel();
  v12 = v11;
  MTUIRoundToPixel();
  v14 = v13;
  -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v12, v14, v9, v10);

  -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "message");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setAlignment:", 1);
    LODWORD(v19) = 1.0;
    objc_msgSend(v18, "setHyphenationFactor:", v19);
    objc_msgSend(v18, "setLineBreakMode:", 0);
    v28[0] = *MEMORY[0x1E0CEA098];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = *MEMORY[0x1E0CEA0D0];
    v29[0] = v20;
    v29[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "message");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithString:attributes:", v24, v21);
    -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_messageLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAttributedText:", v25);

  }
}

- (void)_numberOfItemsDidChangeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  _QWORD v36[5];
  BOOL v37;

  v3 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allDisplayedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (-[HUOLDAlarmTableViewController isAccessoryControllable](self, "isAccessoryControllable"))
  {
    v8 = -[HUOLDAlarmTableViewController isAlarmsSettingReady](self, "isAlarmsSettingReady");
    if (v7)
      v9 = 0;
    else
      v9 = v3;
    v10 = v8 && v7 != 0;
    if (v8)
      v3 = v9;
  }
  else
  {
    v10 = 0;
  }
  -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    -[HUOLDAlarmTableViewController setNoItemsView:](self, "setNoItemsView:", 0);
  }
  if (!v10 && -[HUOLDAlarmTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUNoAlarms"), CFSTR("HUNoAlarms"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CEACD8]);
    v15 = (void *)objc_msgSend(v14, "initWithFrame:title:style:includeBackdrop:", v13, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HUOLDAlarmTableViewController setNoItemsView:](self, "setNoItemsView:", v15);

    if (-[HUOLDAlarmTableViewController isAlarmsSettingReady](self, "isAlarmsSettingReady"))
    {
      if (-[HUOLDAlarmTableViewController isAccessoryControllable](self, "isAccessoryControllable"))
      {
LABEL_20:
        -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setVibrantOptions:", 0);

        -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setUserInteractionEnabled:", 0);

        -[HUOLDAlarmTableViewController _layoutNoItemsLabel](self, "_layoutNoItemsLabel");
        -[HUOLDAlarmTableViewController backgroundView](self, "backgroundView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addSubview:", v33);

        goto LABEL_21;
      }
      _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodNotReachable"), CFSTR("HUHomePodNotReachable"), 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTitle:", v16);

      -[HUOLDAlarmTableViewController mediaProfileContainer](self, "mediaProfileContainer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hf_categoryLowercaseLocalizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUHomePodAlarmsUnavailableExplanation"), CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setMessage:", v26);

    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodAlarmsSettingNotReadyTitle"), CFSTR("HUHomePodAlarmsSettingNotReadyTitle"), 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTitle:", v28);

      -[HUOLDAlarmTableViewController noItemsView](self, "noItemsView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setMessage:", 0);
    }

    goto LABEL_20;
  }
LABEL_21:
  -[HUOLDAlarmTableViewController tableView](self, "tableView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setSeparatorStyle:", v10);

  v35 = 0.2;
  if (!v3)
    v35 = 0.0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __65__HUOLDAlarmTableViewController__numberOfItemsDidChangeAnimated___block_invoke;
  v36[3] = &unk_1E6F4D200;
  v36[4] = self;
  v37 = v10;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v36, v35);
}

void __65__HUOLDAlarmTableViewController__numberOfItemsDidChangeAnimated___block_invoke(uint64_t a1)
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

- (void)_discernReachabilityForAccessory:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  if (!v18)
    goto LABEL_3;
  -[HUOLDAlarmTableViewController mediaProfileContainer](self, "mediaProfileContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v18);

  v7 = v18;
  if (v6)
  {
LABEL_3:
    -[HUOLDAlarmTableViewController mediaProfileContainer](self, "mediaProfileContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isControllable");

    if ((v10 & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(v8, "hf_backingAccessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hf_siriEndpointProfile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v13 != 0;

    }
    -[HUOLDAlarmTableViewController mediaProfileContainer](self, "mediaProfileContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hf_settingsAdapterManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "adapterForIdentifier:", *MEMORY[0x1E0D30138]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isAdapterReady");

    -[HUOLDAlarmTableViewController _updateAccessoryControllable:alarmsSettingReady:](self, "_updateAccessoryControllable:alarmsSettingReady:", v11, v17);
    v7 = v18;
  }

}

- (void)_updateAccessoryControllable:(BOOL)a3 alarmsSettingReady:(BOOL)a4
{
  void *v7;

  if (self->_isAccessoryControllable != a3 || self->_isAlarmsSettingReady != a4)
  {
    if (-[HUOLDAlarmTableViewController isViewLoaded](self, "isViewLoaded"))
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    self->_isAccessoryControllable = a3;
    self->_isAlarmsSettingReady = a4;
    if (-[HUOLDAlarmTableViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[HUOLDAlarmTableViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reloadData");

      -[HUOLDAlarmTableViewController _numberOfItemsDidChangeAnimated:](self, "_numberOfItemsDidChangeAnimated:", 1);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
}

- (void)mobileTimerAdapterDidUpdateReadiness:(id)a3
{
  -[HUOLDAlarmTableViewController _discernReachabilityForAccessory:](self, "_discernReachabilityForAccessory:", 0);
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneButtonItem, a3);
}

- (HUHomePodAlarmItemModuleController)alarmModuleController
{
  return self->_alarmModuleController;
}

- (void)setAlarmModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_alarmModuleController, a3);
}

- (_UIContentUnavailableView)noItemsView
{
  return self->_noItemsView;
}

- (void)setNoItemsView:(id)a3
{
  objc_storeStrong((id *)&self->_noItemsView, a3);
}

- (BOOL)isAccessoryControllable
{
  return self->_isAccessoryControllable;
}

- (BOOL)isAlarmsSettingReady
{
  return self->_isAlarmsSettingReady;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_noItemsView, 0);
  objc_storeStrong((id *)&self->_alarmModuleController, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
