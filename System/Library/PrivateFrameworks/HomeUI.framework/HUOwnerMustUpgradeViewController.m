@implementation HUOwnerMustUpgradeViewController

- (HUOwnerMustUpgradeViewController)initWithUpgradeRequirements:(unint64_t)a3
{
  void *v5;
  void *v6;
  __CFString *v7;
  HUOwnerMustUpgradeViewController *v8;
  objc_super v10;

  _HULocalizedStringWithDefaultValue(CFSTR("HUOwnerMustUpgrade_Title"), CFSTR("HUOwnerMustUpgrade_Title"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0uLL:
      NSLog(CFSTR("We should not be called if there is no need for an owner upgrade screen"));
      goto LABEL_3;
    case 1uLL:
      v7 = CFSTR("HUOwnerMustUpgrade_HomePodAndSiriEnabledDevicesOnly_Detail");
      goto LABEL_7;
    case 2uLL:
      v7 = CFSTR("HUOwnerMustUpgrade_AppleTVOnly_Detail");
      goto LABEL_7;
    case 3uLL:
      v7 = CFSTR("HUOwnerMustUpgrade_HomePodSiriEnabledDevicesAndAppleTV_Detail");
LABEL_7:
      _HULocalizedStringWithDefaultValue(v7, v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_3:
      v6 = 0;
      break;
  }
  v10.receiver = self;
  v10.super_class = (Class)HUOwnerMustUpgradeViewController;
  v8 = -[HUOwnerMustUpgradeViewController initWithTitle:detailText:icon:contentLayout:](&v10, sel_initWithTitle_detailText_icon_contentLayout_, v5, v6, 0, 2);

  return v8;
}

- (void)_continueButtonTapped:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint8_t buf[4];
  HUOwnerMustUpgradeViewController *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  -[HUOwnerMustUpgradeViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("HUOwnerMustUpgradeOnboardingKey_UserInput");
  v10 = &unk_1E7041440;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewController:didFinishWithConfigurationResults:", self, v8);

}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  HUOwnerMustUpgradeViewController *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)HUOwnerMustUpgradeViewController;
  -[OBBaseWelcomeController viewDidLoad](&v15, sel_viewDidLoad);
  -[HUOwnerMustUpgradeViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7043158);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUOwnerMustUpgradeViewController setContinueButton:](self, "setContinueButton:", v6);

  -[HUOwnerMustUpgradeViewController continueButton](self, "continueButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUOwnerMustUpgradeViewController continueButton](self, "continueButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUOwnerMustUpgrade_ContinueButton"), CFSTR("HUOwnerMustUpgrade_ContinueButton"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[HUOwnerMustUpgradeViewController continueButton](self, "continueButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.OwnerMustUpgrade.ContinueButton"));

  -[HUOwnerMustUpgradeViewController continueButton](self, "continueButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__continueButtonTapped_, 64);

  -[HUOwnerMustUpgradeViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", self->_continueButton);

  -[HUOwnerMustUpgradeViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: OMUVC", buf, 0x16u);

  }
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

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
