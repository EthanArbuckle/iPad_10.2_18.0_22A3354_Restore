@implementation HUAnnounceSetupViewController

- (HUAnnounceSetupViewController)initWithHome:(id)a3 step:(unint64_t)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  HUSimpleItemModuleTableViewController *v13;
  HUAnnounceSetupViewController *v14;
  HUAnnounceSetupViewController *v15;
  objc_super v17;
  _QWORD aBlock[4];
  id v19;
  uint64_t v20;

  v6 = a3;
  if (a4 == 2)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUOnboardingAnnounceAccessControl_Title"), CFSTR("HUOnboardingAnnounceAccessControl_Title"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("HUOnboardingAnnounceAccessControl_Detail");
    v9 = 3;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUOnboardingAnnounceNotifications_Title"), CFSTR("HUOnboardingAnnounceNotifications_Title"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("HUOnboardingAnnounceNotifications_Detail");
    v9 = 2;
LABEL_5:
    _HULocalizedStringWithDefaultValue(v8, v8, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v7 = 0;
  v10 = 0;
  v9 = 2;
LABEL_7:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HUAnnounceSetupViewController_initWithHome_step___block_invoke_3;
  aBlock[3] = &unk_1E6F50540;
  v19 = v6;
  v20 = v9;
  v11 = v6;
  v12 = _Block_copy(aBlock);
  v13 = -[HUSimpleItemModuleTableViewController initWithTableViewStyle:moduleCreator:moduleControllerBuilder:]([HUSimpleItemModuleTableViewController alloc], "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:", 1, v12, &__block_literal_global_11_3);
  v17.receiver = self;
  v17.super_class = (Class)HUAnnounceSetupViewController;
  v14 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v17, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v7, v10, 0, 2, v13);
  v15 = v14;
  if (v14)
    v14->_step = a4;

  return v15;
}

id __51__HUAnnounceSetupViewController_initWithHome_step___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HUAnnounceSettingsItemModule *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HUAnnounceSettingsItemModule initWithItemUpdater:home:settingsContext:]([HUAnnounceSettingsItemModule alloc], "initWithItemUpdater:home:settingsContext:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

HUAnnounceSettingsItemModuleController *__51__HUAnnounceSetupViewController_initWithHome_step___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  HUAnnounceSettingsItemModuleController *v3;

  v2 = a2;
  v3 = -[HUItemModuleController initWithModule:]([HUAnnounceSettingsItemModuleController alloc], "initWithModule:", v2);

  return v3;
}

- (void)continuePressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[HUAnnounceSetupViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("announceSetupStep");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUAnnounceSetupViewController step](self, "step"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController:didFinishWithConfigurationResults:", self, v6);

}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  HUAnnounceSetupViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)HUAnnounceSetupViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v11, sel_viewDidLoad);
  -[HUAnnounceSetupViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7043108);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _HULocalizedStringWithDefaultValue(CFSTR("HUOnboardingAnnounce_ContinueButton"), CFSTR("HUOnboardingAnnounce_ContinueButton"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.AnnounceSetUp.ContinueButton"));
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_continuePressed_, 64);
  -[HUAnnounceSetupViewController buttonTray](self, "buttonTray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addButton:", v6);

  -[HUAnnounceSetupViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: ATVC", buf, 0x16u);

  }
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (unint64_t)step
{
  return self->_step;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
}

@end
