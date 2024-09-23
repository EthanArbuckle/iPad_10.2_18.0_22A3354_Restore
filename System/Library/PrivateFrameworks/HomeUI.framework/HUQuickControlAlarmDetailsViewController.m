@implementation HUQuickControlAlarmDetailsViewController

- (HUQuickControlAlarmDetailsViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  HUQuickControlAlarmDetailsViewController *v7;
  HUQuickControlAlarmDetailsViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HUQuickControlAlarmDetailsViewController;
  v7 = -[HUQuickControlViewController initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:](&v16, sel_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
  {
    -[HUQuickControlAlarmDetailsViewController controlItem](v7, "controlItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HUQuickControlAlarmDetailsViewController setTitle:](v8, "setTitle:", v11);
    }
    else
    {
      HFLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlAlarmDetailsViewController setTitle:](v8, "setTitle:", v12);

    }
    objc_opt_class();
    -[HUQuickControlAlarmDetailsViewController createDetailsViewController](v8, "createDetailsViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    objc_storeStrong((id *)&v8->_alarmTableViewController, v14);

  }
  return v8;
}

- (id)controlItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HUQuickControlViewController controlItems](self, "controlItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
  {
    -[HUQuickControlViewController controlItems](self, "controlItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("More than one control item for alarm VC! Control items; %@"), v5);

  }
  objc_opt_class();
  -[HUQuickControlViewController controlItems](self, "controlItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (id)createDetailsViewController
{
  void *v3;
  HUAlarmTableViewController *v4;

  -[HUQuickControlAlarmDetailsViewController mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (_os_feature_enabled_impl())
    {
      v4 = -[HUAlarmTableViewController initWithMediaProfileContainer:]([HUAlarmTableViewController alloc], "initWithMediaProfileContainer:", v3);
      -[HUQuickControlViewController setChildVCThatRequiresHelper:](self, "setChildVCThatRequiresHelper:", v4);
    }
    else
    {
      v4 = -[HUOLDAlarmTableViewController initWithMediaProfileContainer:]([HUOLDAlarmTableViewController alloc], "initWithMediaProfileContainer:", v3);
    }
  }
  else
  {
    NSLog(CFSTR("Should be impossible to get here; Alarms need an id <HFMediaAccessoryProfile>."));
    v4 = 0;
  }

  return v4;
}

+ (id)controlItemPredicate
{
  return +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:](HUQuickControlSingleItemPredicate, "predicateWithControlItemClass:", objc_opt_class());
}

- (BOOL)isAccessoryControllable
{
  void *v3;
  char v4;
  void *v5;

  if (_os_feature_enabled_impl())
  {
    -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "wasControllableAtLastCheck");
  }
  else
  {
    -[HUQuickControlAlarmDetailsViewController mediaProfileContainer](self, "mediaProfileContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isControllable");

  }
  return v4;
}

- (id)mediaProfileContainer
{
  void *v2;
  void *v3;

  -[HUQuickControlAlarmDetailsViewController controlItem](self, "controlItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldShowContentForReachabilityState:(BOOL)a3
{
  return 1;
}

- (void)itemSection:(id)a3 accessoryButtonPressedInHeader:(id)a4
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  HUQuickControlAlarmDetailsViewController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[HUQuickControlAlarmDetailsViewController itemSection:accessoryButtonPressedInHeader:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%s(%@) adding new alarm", (uint8_t *)&v7, 0x16u);
  }

  if (_os_feature_enabled_impl())
  {
    -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentAddMobileTimerObjectViewControllerOnMainThread");
  }
  else
  {
    -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentAddNewAlarmViewController");
  }

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlAlarmDetailsViewController;
  -[HUQuickControlAlarmDetailsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HUQuickControlAlarmDetailsViewController _addAlarmControlView](self, "_addAlarmControlView");
}

- (void)_addAlarmControlView
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
  id v21;
  void *v22;
  void *v23;
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
  void *v36;
  NSObject *v37;
  const char *v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlAlarmDetailsViewController addChildViewController:](self, "addChildViewController:", v6);

      -[HUQuickControlAlarmDetailsViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v9);

      -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setScrollEnabled:", 0);

      -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAlwaysBounceVertical:", 0);

      -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setShowsHorizontalScrollIndicator:", 0);

      -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setShowsVerticalScrollIndicator:", 0);

      -[HUQuickControlAlarmDetailsViewController _updateConstraints](self, "_updateConstraints");
      -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v39 = v18;
      objc_msgSend(v18, "didMoveToParentViewController:", self);

      return;
    }
    HFLogForCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[HUQuickControlAlarmDetailsViewController _addAlarmControlView]";
      v38 = "(%s) [self createDetailsViewController] didn't return HUAlarmTableViewController.";
LABEL_15:
      _os_log_debug_impl(&dword_1B8E1E000, v37, OS_LOG_TYPE_DEBUG, v38, buf, 0xCu);
    }
  }
  else
  {
    objc_opt_class();
    -[HUQuickControlAlarmDetailsViewController createDetailsViewController](self, "createDetailsViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;
    -[HUQuickControlAlarmDetailsViewController setOldAlarmTableViewController:](self, "setOldAlarmTableViewController:", v21);

    -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlAlarmDetailsViewController addChildViewController:](self, "addChildViewController:", v25);

      -[HUQuickControlAlarmDetailsViewController view](self, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addSubview:", v28);

      -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "tableView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setScrollEnabled:", 0);

      -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "tableView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAlwaysBounceVertical:", 0);

      -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "tableView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setShowsHorizontalScrollIndicator:", 0);

      -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "tableView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setShowsVerticalScrollIndicator:", 0);

      -[HUQuickControlAlarmDetailsViewController _updateConstraints](self, "_updateConstraints");
      -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    HFLogForCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[HUQuickControlAlarmDetailsViewController _addAlarmControlView]";
      v38 = "(%s) [self createDetailsViewController] didn't return HUOLDAlarmTableViewController.";
      goto LABEL_15;
    }
  }

}

- (void)_updateConstraints
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v36;
  void *v37;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlAlarmDetailsViewController alarmTableViewConstraints](self, "alarmTableViewConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  if (_os_feature_enabled_impl())
    -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
  else
    -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSize");
  objc_msgSend(v7, "constraintEqualToConstant:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlAlarmDetailsViewController setHeightConstraint:](self, "setHeightConstraint:", v9);

  objc_msgSend(v5, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlAlarmDetailsViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layoutMarginsGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v32;
  objc_msgSend(v5, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlAlarmDetailsViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layoutMarginsGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v25;
  v30 = v5;
  objc_msgSend(v5, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlAlarmDetailsViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layoutMarginsGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v11;
  objc_msgSend(v5, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlAlarmDetailsViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutMarginsGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlAlarmDetailsViewController setAlarmTableViewConstraints:](self, "setAlarmTableViewConstraints:", v18);

  v19 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlAlarmDetailsViewController alarmTableViewConstraints](self, "alarmTableViewConstraints");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v20);

}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  double v20;
  double v21;
  void *v22;

  -[HUQuickControlAlarmDetailsViewController parentViewController](self, "parentViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    v5 = v4;
    objc_msgSend(v4, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUQuickControlAlarmDetailsViewController parentViewController](self, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      if (v4)
        goto LABEL_5;
      goto LABEL_7;
    }
    objc_msgSend(v4, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v7);
  if (v4)
  {
LABEL_5:
    objc_msgSend(v4, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9 + -80.0;
    goto LABEL_11;
  }
LABEL_7:
  if (_os_feature_enabled_impl())
    -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
  else
    -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v10 = v12;

LABEL_11:
  if (_os_feature_enabled_impl())
  {
    -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v19 = v13;
    objc_msgSend(v13, "preferredContentSize");
    v21 = v20;

    goto LABEL_20;
  }
  -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allDisplayedItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  v18 = -[HUQuickControlAlarmDetailsViewController isAccessoryControllable](self, "isAccessoryControllable");
  if (v17 && v18)
  {
    -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (v18)
    v21 = 88.0;
  else
    v21 = 196.0;
LABEL_20:
  +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 0, v10, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)HUQuickControlAlarmDetailsViewController;
  v4 = a3;
  -[HUQuickControlAlarmDetailsViewController preferredContentSizeDidChangeForChildContentContainer:](&v42, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  if (_os_feature_enabled_impl())
  {
    -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController", v42.receiver, v42.super_class);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
    {
      -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "preferredContentSize");
      v9 = v8;
      -[HUQuickControlAlarmDetailsViewController heightConstraint](self, "heightConstraint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setConstant:", v9);

      -[HUQuickControlAlarmDetailsViewController preferredContentSize](self, "preferredContentSize");
      v12 = v11;
      v14 = v13;
      -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "preferredContentSize");
      v17 = v16;
      v19 = v18;

      if (v12 != v17 || v14 != v19)
      {
        -[HUQuickControlAlarmDetailsViewController alarmTableViewController](self, "alarmTableViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
        v41 = v20;
        objc_msgSend(v20, "preferredContentSize");
        -[HUQuickControlAlarmDetailsViewController setPreferredContentSize:](self, "setPreferredContentSize:");

      }
    }
  }
  else
  {
    -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController", v42.receiver, v42.super_class);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v4, "isEqual:", v21);

    if (v22)
    {
      -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "itemManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "allDisplayedItems");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      v27 = -[HUQuickControlAlarmDetailsViewController isAccessoryControllable](self, "isAccessoryControllable");
      if (!v26)
        goto LABEL_10;
      if (v27)
      {
        -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "preferredContentSize");
        v30 = v29;

      }
      else
      {
LABEL_10:
        v30 = v27 ? 88.0 : 196.0;
      }
      -[HUQuickControlAlarmDetailsViewController heightConstraint](self, "heightConstraint");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setConstant:", v30);

      -[HUQuickControlAlarmDetailsViewController preferredContentSize](self, "preferredContentSize");
      v33 = v32;
      v35 = v34;
      -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "preferredContentSize");
      v38 = v37;
      v40 = v39;

      if (v33 != v38 || v35 != v40)
      {
        -[HUQuickControlAlarmDetailsViewController oldAlarmTableViewController](self, "oldAlarmTableViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (HUAlarmTableViewController)alarmTableViewController
{
  return self->_alarmTableViewController;
}

- (void)setAlarmTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_alarmTableViewController, a3);
}

- (HUOLDAlarmTableViewController)oldAlarmTableViewController
{
  return self->_oldAlarmTableViewController;
}

- (void)setOldAlarmTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_oldAlarmTableViewController, a3);
}

- (NSArray)alarmTableViewConstraints
{
  return self->_alarmTableViewConstraints;
}

- (void)setAlarmTableViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_alarmTableViewConstraints, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_alarmTableViewConstraints, 0);
  objc_storeStrong((id *)&self->_oldAlarmTableViewController, 0);
  objc_storeStrong((id *)&self->_alarmTableViewController, 0);
}

@end
