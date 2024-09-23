@implementation HULocationServicesSetupViewController

- (HULocationServicesSetupViewController)initWithHome:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HULocationServicesSetupViewController *v9;
  objc_super v11;

  v5 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HULocationServicesSetup_Title"), CFSTR("HULocationServicesSetup_Title"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULocationServicesSetup_Detail"), CFSTR("HULocationServicesSetup_Detail"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)HULocationServicesSetupViewController;
  v9 = -[HULocationServicesSetupViewController initWithTitle:detailText:icon:](&v11, sel_initWithTitle_detailText_icon_, v6, v7, v8);

  if (v9)
    objc_storeStrong((id *)&v9->_home, a3);

  return v9;
}

- (void)_enableOrDisableLocationServices:(id)a3
{
  id v5;
  NSObject *v6;
  __CFString *v7;
  NSObject *v8;
  HULocationServicesSetupViewController *v9;
  id v10;
  const __CFString *v11;
  id v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  HULocationServicesSetupViewController *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (HULocationServicesSetupViewController *)objc_claimAutoreleasedReturnValue();
    -[HULocationServicesSetupViewController enableLocationServicesButton](self, "enableLocationServicesButton");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("Disabling");
    if (v10 == v5)
      v11 = CFSTR("Enabling");
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ Location Services", buf, 0x16u);

  }
  -[HULocationServicesSetupViewController disableLocationServicesButton](self, "disableLocationServicesButton");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v12 == v5;

  v14 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13, CFSTR("HULocationServicesOnboardingKey_UserInput"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HULocationServicesSetupViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "viewController:didFinishWithConfigurationResults:", self, v17);

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
  NSObject *v24;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  HULocationServicesSetupViewController *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)HULocationServicesSetupViewController;
  -[OBBaseWelcomeController viewDidLoad](&v26, sel_viewDidLoad);
  -[HULocationServicesSetupViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E70430B8);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationServicesSetupViewController setEnableLocationServicesButton:](self, "setEnableLocationServicesButton:", v6);

  -[HULocationServicesSetupViewController enableLocationServicesButton](self, "enableLocationServicesButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HULocationServicesSetupViewController enableLocationServicesButton](self, "enableLocationServicesButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULocationServicesSetup_EnableLocationServices_Button"), CFSTR("HULocationServicesSetup_EnableLocationServices_Button"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[HULocationServicesSetupViewController enableLocationServicesButton](self, "enableLocationServicesButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.LocationServices.EnableButton"));

  -[HULocationServicesSetupViewController enableLocationServicesButton](self, "enableLocationServicesButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__enableOrDisableLocationServices_, 64);

  -[HULocationServicesSetupViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationServicesSetupViewController enableLocationServicesButton](self, "enableLocationServicesButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v13);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationServicesSetupViewController setDisableLocationServicesButton:](self, "setDisableLocationServicesButton:", v14);

  -[HULocationServicesSetupViewController disableLocationServicesButton](self, "disableLocationServicesButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HULocationServicesSetupViewController disableLocationServicesButton](self, "disableLocationServicesButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULocationServicesSetup_DisableLocationServices_Button"), CFSTR("HULocationServicesSetup_DisableLocationServices_Button"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v17, 0);

  -[HULocationServicesSetupViewController disableLocationServicesButton](self, "disableLocationServicesButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.LocationServices.DisableButton"));

  -[HULocationServicesSetupViewController disableLocationServicesButton](self, "disableLocationServicesButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel__enableOrDisableLocationServices_, 64);

  -[HULocationServicesSetupViewController buttonTray](self, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationServicesSetupViewController disableLocationServicesButton](self, "disableLocationServicesButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v21);

  -[HULocationServicesSetupViewController buttonTray](self, "buttonTray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = *MEMORY[0x1E0D651F8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPrivacyLinkForBundles:", v23);

  -[HULocationServicesSetupViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = self;
    v29 = 2112;
    v30 = v25;
    _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HULocationServicesSetupViewController", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HULocationServicesSetupViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HULocationServicesSetupViewController;
  -[HULocationServicesSetupViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HULocationServicesSetupViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);

    }
    -[HULocationServicesSetupViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerDidGoBack:", self);

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

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (OBBoldTrayButton)enableLocationServicesButton
{
  return self->_enableLocationServicesButton;
}

- (void)setEnableLocationServicesButton:(id)a3
{
  objc_storeStrong((id *)&self->_enableLocationServicesButton, a3);
}

- (OBLinkTrayButton)disableLocationServicesButton
{
  return self->_disableLocationServicesButton;
}

- (void)setDisableLocationServicesButton:(id)a3
{
  objc_storeStrong((id *)&self->_disableLocationServicesButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableLocationServicesButton, 0);
  objc_storeStrong((id *)&self->_enableLocationServicesButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
