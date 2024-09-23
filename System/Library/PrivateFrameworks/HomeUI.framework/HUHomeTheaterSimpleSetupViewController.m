@implementation HUHomeTheaterSimpleSetupViewController

- (HUHomeTheaterSimpleSetupViewController)initWithAppleTVAccessory:(id)a3 destination:(id)a4 inHome:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  HUHomeTheaterSimpleSetupViewController *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "hf_displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUHomeTheaterSetup_Title"), CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(CFSTR("HUHomeTheaterSetup_Detail"), CFSTR("HUHomeTheaterSetup_Detail"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HUImageNamed(CFSTR("Onboarding-HomeTheater"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)HUHomeTheaterSimpleSetupViewController;
  v22 = -[HUImageOBWelcomeController initWithTitle:detailText:icon:contentImage:](&v24, sel_initWithTitle_detailText_icon_contentImage_, v19, v20, 0, v21);

  if (v22)
  {
    objc_storeStrong((id *)&v22->_accessory, a3);
    objc_storeStrong((id *)&v22->_home, a5);
    objc_storeStrong((id *)&v22->_destination, a4);
  }

  return v22;
}

- (HUHomeTheaterSimpleSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAppleTVAccessory_destination_inHome_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeTheaterSimpleSetupViewController.m"), 49, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUHomeTheaterSimpleSetupViewController initWithTitle:detailText:icon:contentImage:]",
    v9);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  OBTrayButton *v5;
  OBTrayButton *confirmButton;
  OBTrayButton *v7;
  void *v8;
  void *v9;
  OBLinkTrayButton *v10;
  OBLinkTrayButton *skipButton;
  OBLinkTrayButton *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUHomeTheaterSimpleSetupViewController;
  -[HUImageOBWelcomeController viewDidLoad](&v15, sel_viewDidLoad);
  -[HUHomeTheaterSimpleSetupViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v4, &unk_1E7043360);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v5 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
  confirmButton = self->_confirmButton;
  self->_confirmButton = v5;

  -[OBTrayButton setTranslatesAutoresizingMaskIntoConstraints:](self->_confirmButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = self->_confirmButton;
  _HULocalizedStringWithDefaultValue(CFSTR("HUHomeTheaterSetup_UseHomeTheaterButton"), CFSTR("HUHomeTheaterSetup_UseHomeTheaterButton"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setTitle:forState:](v7, "setTitle:forState:", v8, 0);

  -[OBTrayButton setAccessibilityIdentifier:](self->_confirmButton, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeTheater.UseHomeTheaterButton"));
  -[OBTrayButton addTarget:action:forControlEvents:](self->_confirmButton, "addTarget:action:forControlEvents:", self, sel__confirm_, 64);
  -[HUHomeTheaterSimpleSetupViewController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", self->_confirmButton);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v10 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
  skipButton = self->_skipButton;
  self->_skipButton = v10;

  -[OBLinkTrayButton setTranslatesAutoresizingMaskIntoConstraints:](self->_skipButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = self->_skipButton;
  _HULocalizedStringWithDefaultValue(CFSTR("HUHomeTheaterSetup_NotNowButton"), CFSTR("HUHomeTheaterSetup_NotNowButton"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton setTitle:forState:](v12, "setTitle:forState:", v13, 0);

  -[OBLinkTrayButton setAccessibilityIdentifier:](self->_skipButton, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeTheater.NotNowButton"));
  -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_skipButton, "addTarget:action:forControlEvents:", self, sel__skip_, 64);
  -[HUHomeTheaterSimpleSetupViewController buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", self->_skipButton);

}

- (void)_confirm:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16[2];
  _QWORD v17[4];
  id v18[2];
  id location;
  _QWORD v20[5];

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__HUHomeTheaterSimpleSetupViewController__confirm___block_invoke;
  v20[3] = &unk_1E6F4C5E8;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSimpleSetupViewController confirmButton](self, "confirmButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityIndicator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAnimating");

  -[HUHomeTheaterSimpleSetupViewController confirmButton](self, "confirmButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 0);

  objc_initWeak(&location, self);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __51__HUHomeTheaterSimpleSetupViewController__confirm___block_invoke_2;
  v17[3] = &unk_1E6F5CBA8;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a2;
  objc_msgSend(v7, "addSuccessBlock:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __51__HUHomeTheaterSimpleSetupViewController__confirm___block_invoke_47;
  v14[3] = &unk_1E6F608F8;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a2;
  v12 = v5;
  v15 = v12;
  v13 = (id)objc_msgSend(v11, "addFailureBlock:", v14);

  objc_destroyWeak(v16);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

}

void __51__HUHomeTheaterSimpleSetupViewController__confirm___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "accessory");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_backingAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "audioDestinationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateDestination:completionHandler:", v8, v4);

}

void __51__HUHomeTheaterSimpleSetupViewController__confirm___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
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
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@:%@ Unexpected nil accessory - result was %@"), WeakRetained, v6, v3);

  }
  objc_msgSend(WeakRetained, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E08];
    v16[0] = &unk_1E7041ED8;
    v15[0] = CFSTR("HUHomeTheaterOnboardingKey_UserInput");
    v15[1] = CFSTR("HUHomeTheaterOnboardingKey_Accessory");
    objc_msgSend(WeakRetained, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "confirmButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activityIndicator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stopAnimating");

    objc_msgSend(WeakRetained, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewController:didFinishWithConfigurationResults:", WeakRetained, v11);

  }
}

void __51__HUHomeTheaterSimpleSetupViewController__confirm___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = WeakRetained;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ completed with error: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
  objc_msgSend(WeakRetained, "confirmButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopAnimating");

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleError:", v3);

}

- (void)_skip:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E08];
  v10[0] = &unk_1E7041EF0;
  v9[0] = CFSTR("HUHomeTheaterOnboardingKey_UserInput");
  v9[1] = CFSTR("HUHomeTheaterOnboardingKey_Accessory");
  -[HUHomeTheaterSimpleSetupViewController accessory](self, "accessory", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomeTheaterSimpleSetupViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController:didFinishWithConfigurationResults:", self, v7);

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

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HMMediaDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (OBTrayButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (OBLinkTrayButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
