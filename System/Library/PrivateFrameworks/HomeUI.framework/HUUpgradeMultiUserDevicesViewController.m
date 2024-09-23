@implementation HUUpgradeMultiUserDevicesViewController

- (HUUpgradeMultiUserDevicesViewController)initWithUpgradeRequirements:(unint64_t)a3 home:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  HUUpgradeMultiUserDevicesViewController *v12;
  objc_super v14;

  v7 = a4;
  _HULocalizedStringWithDefaultValue(CFSTR("HUUpgradeMultiUserDevices_Title"), CFSTR("HUUpgradeMultiUserDevices_Title"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hf_currentUserIsOwner") & 1) != 0
    || objc_msgSend(v7, "hf_currentUserIsAdministrator"))
  {
    switch(a3)
    {
      case 0uLL:
        NSLog(CFSTR("We should not be called if there is no need for a multiuser device upgrade screen"));
        break;
      case 1uLL:
        v10 = CFSTR("HUUpgradeMultiUserDevices_HomePodOnly_Detail");
        goto LABEL_10;
      case 2uLL:
        v10 = CFSTR("HUUpgradeMultiUserDevices_AppleTVOnly_Detail");
        goto LABEL_10;
      case 3uLL:
        v10 = CFSTR("HUUpgradeMultiUserDevices_HomePodAndAppleTV_Detail");
        goto LABEL_10;
      default:
        break;
    }
    v9 = 0;
  }
  else
  {
    v10 = CFSTR("HUUpgradeMultiUserDevices_Generic_Detail");
LABEL_10:
    _HULocalizedStringWithDefaultValue(v10, v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  HUImageNamed(CFSTR("Onboarding-UpdateSoftware"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)HUUpgradeMultiUserDevicesViewController;
  v12 = -[HUImageOBWelcomeController initWithTitle:detailText:icon:contentImage:](&v14, sel_initWithTitle_detailText_icon_contentImage_, v8, v9, 0, v11);

  if (v12)
    objc_storeStrong((id *)&v12->_home, a4);

  return v12;
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
  HUUpgradeMultiUserDevicesViewController *v12;
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
  -[HUUpgradeMultiUserDevicesViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("HUUpgradeMultiUserDevicesOnboardingKey_UserInput");
  v10 = &unk_1E7041F38;
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
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  HUUpgradeMultiUserDevicesViewController *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)HUUpgradeMultiUserDevicesViewController;
  -[HUImageOBWelcomeController viewDidLoad](&v17, sel_viewDidLoad);
  -[HUUpgradeMultiUserDevicesViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E70433B0);

  _HULocalizedStringWithDefaultValue(CFSTR("HUUpgradeMultiUserDevices_ContinueButton"), CFSTR("HUUpgradeMultiUserDevices_ContinueButton"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUUpgradeMultiUserDevicesViewController isFinalStep](self, "isFinalStep"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUUpgradeMultiUserDevices_DoneButton"), CFSTR("HUUpgradeMultiUserDevices_DoneButton"), 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUpgradeMultiUserDevicesViewController setContinueButton:](self, "setContinueButton:", v8);

  -[HUUpgradeMultiUserDevicesViewController continueButton](self, "continueButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUUpgradeMultiUserDevicesViewController continueButton](self, "continueButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v6, 0);

  -[HUUpgradeMultiUserDevicesViewController continueButton](self, "continueButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.UpgradeMultiUser.ContinueButton"));

  -[HUUpgradeMultiUserDevicesViewController continueButton](self, "continueButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__continueButtonTapped_, 64);

  -[HUUpgradeMultiUserDevicesViewController buttonTray](self, "buttonTray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUpgradeMultiUserDevicesViewController continueButton](self, "continueButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addButton:", v14);

  -[HUUpgradeMultiUserDevicesViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v16;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: UMUDVC", buf, 0x16u);

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

- (BOOL)isFinalStep
{
  return self->_isFinalStep;
}

- (void)setIsFinalStep:(BOOL)a3
{
  self->_isFinalStep = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
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
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
