@implementation HUQuickControlTimerDetailsViewController

+ (id)controlItemPredicate
{
  return +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:](HUQuickControlSingleItemPredicate, "predicateWithControlItemClass:", objc_opt_class());
}

- (HUQuickControlTimerDetailsViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  HUQuickControlTimerDetailsViewController *v7;
  HUQuickControlTimerDetailsViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HUQuickControlTimerDetailsViewController;
  v7 = -[HUQuickControlViewController initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:](&v16, sel_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
  {
    -[HUQuickControlTimerDetailsViewController controlItem](v7, "controlItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HUQuickControlTimerDetailsViewController setTitle:](v8, "setTitle:", v11);
    }
    else
    {
      HFLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlTimerDetailsViewController setTitle:](v8, "setTitle:", v12);

    }
    objc_opt_class();
    -[HUQuickControlTimerDetailsViewController createDetailsViewController](v8, "createDetailsViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    objc_storeStrong((id *)&v8->_timerTableViewController, v14);

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
    NSLog(CFSTR("More than one control item for timer VC! Control items; %@"), v5);

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
  HUTimerTableViewController *v4;

  -[HUQuickControlTimerDetailsViewController mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[HUTimerTableViewController initWithMediaProfileContainer:]([HUTimerTableViewController alloc], "initWithMediaProfileContainer:", v3);
    -[HUQuickControlViewController setChildVCThatRequiresHelper:](self, "setChildVCThatRequiresHelper:", v4);
  }
  else
  {
    NSLog(CFSTR("Should be impossible to get here; Timers need an id <HFMediaAccessoryProfile>."));
    v4 = 0;
  }

  return v4;
}

- (BOOL)isAccessoryControllable
{
  void *v2;
  char v3;

  -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wasControllableAtLastCheck");

  return v3;
}

- (id)mediaProfileContainer
{
  void *v2;
  void *v3;

  -[HUQuickControlTimerDetailsViewController controlItem](self, "controlItem");
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
  HUQuickControlTimerDetailsViewController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[HUQuickControlTimerDetailsViewController itemSection:accessoryButtonPressedInHeader:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%s(%@) adding new timer", (uint8_t *)&v7, 0x16u);
  }

  -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentAddMobileTimerObjectViewControllerOnMainThread");

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlTimerDetailsViewController;
  -[HUQuickControlTimerDetailsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HUQuickControlTimerDetailsViewController _addTimerControlView](self, "_addTimerControlView");
}

- (void)_addTimerControlView
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
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlTimerDetailsViewController addChildViewController:](self, "addChildViewController:", v6);

    -[HUQuickControlTimerDetailsViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v9);

    -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setScrollEnabled:", 0);

    -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlwaysBounceVertical:", 0);

    -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShowsHorizontalScrollIndicator:", 0);

    -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShowsVerticalScrollIndicator:", 0);

    -[HUQuickControlTimerDetailsViewController _updateConstraints](self, "_updateConstraints");
    -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "didMoveToParentViewController:", self);

  }
  else
  {
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[HUQuickControlTimerDetailsViewController _addTimerControlView]";
      _os_log_debug_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEBUG, "(%s) [self createDetailsViewController] didn't return HUTimerTableViewController.", buf, 0xCu);
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
  void *v8;
  double v9;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[7];

  v43[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlTimerDetailsViewController timerTableViewConstraints](self, "timerTableViewConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSize");
  objc_msgSend(v7, "constraintEqualToConstant:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlTimerDetailsViewController setHeightConstraint:](self, "setHeightConstraint:", v10);

  -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlTimerDetailsViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layoutMarginsGuide");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v36;
  -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlTimerDetailsViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layoutMarginsGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v29;
  -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlTimerDetailsViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v22;
  -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlTimerDetailsViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutMarginsGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v17;
  -[HUQuickControlTimerDetailsViewController heightConstraint](self, "heightConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlTimerDetailsViewController setTimerTableViewConstraints:](self, "setTimerTableViewConstraints:", v19);

  v20 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlTimerDetailsViewController timerTableViewConstraints](self, "timerTableViewConstraints");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v21);

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
  double v14;
  double v15;
  void *v16;

  -[HUQuickControlTimerDetailsViewController parentViewController](self, "parentViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    v5 = v4;
    objc_msgSend(v4, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUQuickControlTimerDetailsViewController parentViewController](self, "parentViewController");
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
    goto LABEL_8;
  }
LABEL_7:
  -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v10 = v12;

LABEL_8:
  -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredContentSize");
  v15 = v14;

  +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 0, v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
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
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUQuickControlTimerDetailsViewController;
  v4 = a3;
  -[HUQuickControlTimerDetailsViewController preferredContentSizeDidChangeForChildContentContainer:](&v21, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController", v21.receiver, v21.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSize");
    v9 = v8;
    -[HUQuickControlTimerDetailsViewController heightConstraint](self, "heightConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setConstant:", v9);

    -[HUQuickControlTimerDetailsViewController preferredContentSize](self, "preferredContentSize");
    v12 = v11;
    v14 = v13;
    -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredContentSize");
    v17 = v16;
    v19 = v18;

    if (v12 != v17 || v14 != v19)
    {
      -[HUQuickControlTimerDetailsViewController timerTableViewController](self, "timerTableViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferredContentSize");
      -[HUQuickControlTimerDetailsViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (HUTimerTableViewController)timerTableViewController
{
  return self->_timerTableViewController;
}

- (void)setTimerTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_timerTableViewController, a3);
}

- (NSArray)timerTableViewConstraints
{
  return self->_timerTableViewConstraints;
}

- (void)setTimerTableViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_timerTableViewConstraints, a3);
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
  objc_storeStrong((id *)&self->_timerTableViewConstraints, 0);
  objc_storeStrong((id *)&self->_timerTableViewController, 0);
}

@end
