@implementation HUAccessoryFirmwareUpdateSetupViewController

- (HUAccessoryFirmwareUpdateSetupViewController)initWithHome:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HUAccessoryFirmwareUpdateSetupViewController *v11;
  objc_super v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("square.and.arrow.down.fill"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 144.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryFirmwareUpdateOnboarding_Title"), CFSTR("HUAccessoryFirmwareUpdateOnboarding_Title"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryFirmwareUpdateOnboarding_Detail"), CFSTR("HUAccessoryFirmwareUpdateOnboarding_Detail"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)HUAccessoryFirmwareUpdateSetupViewController;
  v11 = -[HUImageOBWelcomeController initWithTitle:detailText:icon:contentImage:](&v13, sel_initWithTitle_detailText_icon_contentImage_, v9, v10, 0, v8);

  if (v11)
    objc_storeStrong((id *)&v11->_home, a3);

  return v11;
}

- (HUAccessoryFirmwareUpdateSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessoryFirmwareUpdateSetupViewController.m"), 50, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAccessoryFirmwareUpdateSetupViewController initWithTitle:detailText:icon:contentImage:]",
    v9);

  return 0;
}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  OBTrayButton *v6;
  OBTrayButton *enableAutomaticUpdatesButton;
  OBTrayButton *v8;
  void *v9;
  void *v10;
  OBLinkTrayButton *v11;
  OBLinkTrayButton *notNowButton;
  OBLinkTrayButton *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  HUAccessoryFirmwareUpdateSetupViewController *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)HUAccessoryFirmwareUpdateSetupViewController;
  -[HUImageOBWelcomeController viewDidLoad](&v18, sel_viewDidLoad);
  -[HUAccessoryFirmwareUpdateSetupViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7042ED8);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
  enableAutomaticUpdatesButton = self->_enableAutomaticUpdatesButton;
  self->_enableAutomaticUpdatesButton = v6;

  -[OBTrayButton setTranslatesAutoresizingMaskIntoConstraints:](self->_enableAutomaticUpdatesButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = self->_enableAutomaticUpdatesButton;
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryFirmwareUpdateOnboarding_Enable"), CFSTR("HUAccessoryFirmwareUpdateOnboarding_Enable"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setTitle:forState:](v8, "setTitle:forState:", v9, 0);

  -[OBTrayButton setAccessibilityIdentifier:](self->_enableAutomaticUpdatesButton, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.AccessoryFirmwareUpdate.Enable"));
  -[OBTrayButton addTarget:action:forControlEvents:](self->_enableAutomaticUpdatesButton, "addTarget:action:forControlEvents:", self, sel__enableAutomaticUpdates_, 64);
  -[HUAccessoryFirmwareUpdateSetupViewController buttonTray](self, "buttonTray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addButton:", self->_enableAutomaticUpdatesButton);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v11 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
  notNowButton = self->_notNowButton;
  self->_notNowButton = v11;

  -[OBLinkTrayButton setTranslatesAutoresizingMaskIntoConstraints:](self->_notNowButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = self->_notNowButton;
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryFirmwareUpdateOnboarding_NotNow"), CFSTR("HUAccessoryFirmwareUpdateOnboarding_NotNow"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton setTitle:forState:](v13, "setTitle:forState:", v14, 0);

  -[OBLinkTrayButton setAccessibilityIdentifier:](self->_notNowButton, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.AccessoryFirmwareUpdate.NotNow"));
  -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_notNowButton, "addTarget:action:forControlEvents:", self, sel__doNotEnableAutomaticUpdates_, 64);
  -[HUAccessoryFirmwareUpdateSetupViewController buttonTray](self, "buttonTray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addButton:", self->_notNowButton);

  -[HUAccessoryFirmwareUpdateSetupViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = self;
    v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: NLSVC", buf, 0x16u);

  }
}

- (void)_enableAutomaticUpdates:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  HUAccessoryFirmwareUpdateSetupViewController *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  HUAccessoryFirmwareUpdateSetupViewController *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  -[HUAccessoryFirmwareUpdateSetupViewController enableAutomaticUpdatesButton](self, "enableAutomaticUpdatesButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityIndicator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAnimating");

  objc_msgSend(v5, "setEnabled:", 0);
  -[HUAccessoryFirmwareUpdateSetupViewController home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__HUAccessoryFirmwareUpdateSetupViewController__enableAutomaticUpdates___block_invoke;
  v19[3] = &unk_1E6F502A0;
  v19[4] = self;
  objc_msgSend(v11, "addSuccessBlock:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __72__HUAccessoryFirmwareUpdateSetupViewController__enableAutomaticUpdates___block_invoke_42;
  v16[3] = &unk_1E6F4D1B0;
  v17 = v5;
  v18 = self;
  v14 = v5;
  v15 = (id)objc_msgSend(v13, "addFailureBlock:", v16);

}

void __72__HUAccessoryFirmwareUpdateSetupViewController__enableAutomaticUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "enableAutomaticUpdatesButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimating");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v7 = CFSTR("HUAccessoryFirmwareUpdateOnboardingKey_UserInput");
  v8[0] = &unk_1E7040930;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController:didFinishWithConfigurationResults:", v5, v6);

}

void __72__HUAccessoryFirmwareUpdateSetupViewController__enableAutomaticUpdates___block_invoke_42(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 40), "enableAutomaticUpdatesButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopAnimating");

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleError:", v4);

}

- (void)_doNotEnableAutomaticUpdates:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint8_t buf[4];
  HUAccessoryFirmwareUpdateSetupViewController *v12;
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
  -[HUAccessoryFirmwareUpdateSetupViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("HUAccessoryFirmwareUpdateOnboardingKey_UserInput");
  v10 = &unk_1E7040948;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewController:didFinishWithConfigurationResults:", self, v8);

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

- (OBTrayButton)enableAutomaticUpdatesButton
{
  return self->_enableAutomaticUpdatesButton;
}

- (void)setEnableAutomaticUpdatesButton:(id)a3
{
  objc_storeStrong((id *)&self->_enableAutomaticUpdatesButton, a3);
}

- (OBLinkTrayButton)notNowButton
{
  return self->_notNowButton;
}

- (void)setNotNowButton:(id)a3
{
  objc_storeStrong((id *)&self->_notNowButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_enableAutomaticUpdatesButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
