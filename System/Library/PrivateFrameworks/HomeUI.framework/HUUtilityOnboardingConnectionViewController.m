@implementation HUUtilityOnboardingConnectionViewController

- (HUUtilityOnboardingConnectionViewController)initWithContext:(id)a3
{
  id v4;
  HUUtilityOnboardingConnectionItemManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HUUtilityOnboardingConnectionItemManager *v11;
  HUUtilityOnboardingConnectionTableViewController *v12;
  void *v13;
  void *v14;
  HUUtilityOnboardingConnectionViewController *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HUUtilityOnboardingConnectionItemManager alloc];
  v19[0] = CFSTR("utilityName");
  objc_msgSend(v4, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("homeName");
  v20[0] = v7;
  objc_msgSend(v4, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUUtilityOnboardingConnectionItemManager initWithDelegate:data:](v5, "initWithDelegate:data:", self, v10);

  v12 = -[HUUtilityOnboardingConnectionTableViewController initWithData:withItemManager:tableViewStyle:]([HUUtilityOnboardingConnectionTableViewController alloc], "initWithData:withItemManager:tableViewStyle:", 0, v11, 1);
  -[HUUtilityOnboardingConnectionViewController setTableView:](self, "setTableView:", v12);

  _HULocalizedStringWithDefaultValue(CFSTR("HUUtilityDiscoveryUtilityConnection_Title"), CFSTR("HUUtilityDiscoveryUtilityConnection_Title"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingConnectionViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)HUUtilityOnboardingConnectionViewController;
  v15 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v18, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v13, 0, 0, 2, v14);

  -[HUUtilityOnboardingConnectionViewController setOnboardingContext:](v15, "setOnboardingContext:", v4);
  objc_msgSend(v4, "utilityID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[HUHomeEnergyAnalyticsHelper sendUtilityOnboardingCompletedEventWithUtilityID:](HUHomeEnergyAnalyticsHelper, "sendUtilityOnboardingCompletedEventWithUtilityID:", v16);
  return v15;
}

- (void)_dismiss:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint8_t buf[4];
  HUUtilityOnboardingConnectionViewController *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = self;
    v11 = 2080;
    v12 = "-[HUUtilityOnboardingConnectionViewController _dismiss:]";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped button", buf, 0x16u);
  }

  -[HUUtilityOnboardingConnectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput");
  v8 = &unk_1E7041200;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController:didFinishWithConfigurationResults:", self, v6);

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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUUtilityOnboardingConnectionViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v13, sel_viewDidLoad);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

  -[HUUtilityOnboardingConnectionViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7043090);

  -[HUUtilityOnboardingConnectionViewController onboardingContext](self, "onboardingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingConnectionViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateIconWithHeaderView:axID:", v7, CFSTR("Home.OnboardingView.Utility.SubscriptionInfo.Icon"));

  -[HUUtilityOnboardingConnectionViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsSelection:", 0);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);

  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.Utility.Connection.DoneButton"));
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__dismiss_, 64);
  -[HUUtilityOnboardingConnectionViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v10);

}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_TtC6HomeUI24UtilityOnboardingContext)onboardingContext
{
  return self->_onboardingContext;
}

- (void)setOnboardingContext:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingContext, a3);
}

- (HUUtilityOnboardingConnectionTableViewController)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_onboardingContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
