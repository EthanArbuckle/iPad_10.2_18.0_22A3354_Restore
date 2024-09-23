@implementation HUTVViewingProfilesSetupViewController

- (HUTVViewingProfilesSetupViewController)initWithHome:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HUTVViewingProfilesSetupViewController *v9;
  objc_super v11;

  v5 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUTVViewingProfilesSetup_Title"), CFSTR("HUTVViewingProfilesSetup_Title"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUTVViewingProfilesSetup_Detail"), CFSTR("HUTVViewingProfilesSetup_Detail"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HUImageNamed(CFSTR("Onboarding-TVViewingProfiles"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)HUTVViewingProfilesSetupViewController;
  v9 = -[HUImageOBWelcomeController initWithTitle:detailText:icon:contentImage:](&v11, sel_initWithTitle_detailText_icon_contentImage_, v6, v7, 0, v8);

  if (v9)
    objc_storeStrong((id *)&v9->_home, a3);

  return v9;
}

- (void)_setupTVViewingProfilesItemInfrastructure
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HUTVViewingProfilesEditorItemManager *v8;
  void *v9;
  id v10;
  id v11;

  v4 = objc_alloc(MEMORY[0x1E0D31988]);
  -[HUTVViewingProfilesSetupViewController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTVViewingProfilesSetupViewController home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "initWithHome:user:nameStyle:", v5, v7, 0);

  v8 = -[HUTVViewingProfilesEditorItemManager initWithDelegate:userItem:]([HUTVViewingProfilesEditorItemManager alloc], "initWithDelegate:userItem:", self, v11);
  -[HUTVViewingProfilesSetupViewController setTvVPEditorItemManager:](self, "setTvVPEditorItemManager:", v8);

  -[HUTVViewingProfilesSetupViewController tvVPEditorItemManager](self, "tvVPEditorItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

}

- (void)_customizeOrOffButton:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int v13;
  HUTVViewingProfilesSetupViewController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTVViewingProfilesSetupViewController home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_appleTVs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 <= 1)
    v11 = &unk_1E7040C90;
  else
    v11 = &unk_1E7040CA8;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("HUTVViewingProfilesOnboardingKey_UserInput"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HUMultiUserKey_SetIsEnabled"));
  -[HUTVViewingProfilesSetupViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewController:didFinishWithConfigurationResults:", self, v7);

}

- (void)_turnOnAllTVViewingProfiles:(id)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  HUTVViewingProfilesSetupViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint8_t buf[4];
  HUTVViewingProfilesSetupViewController *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (HUTVViewingProfilesSetupViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: Turning on TV Viewing Profiles for all devices", buf, 0xCu);

  }
  -[HUTVViewingProfilesSetupViewController tvVPEditorItemManager](self, "tvVPEditorItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tvpDevicesModule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "turnOnTVViewingProfilesForAllDevices");

  v11 = (void *)MEMORY[0x1E0C99E08];
  v15 = CFSTR("HUTVViewingProfilesOnboardingKey_UserInput");
  v16 = &unk_1E7040CC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HUMultiUserKey_SetIsEnabled"));
  -[HUTVViewingProfilesSetupViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewController:didFinishWithConfigurationResults:", self, v13);

}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  return -[UIViewController hu_performPresentationRequest:](self, "hu_performPresentationRequest:", a4);
}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return -[UIViewController hu_performDismissalRequest:](self, "hu_performDismissalRequest:", a4);
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return 0;
}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
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
  NSObject *v29;
  void *v30;
  objc_super v31;
  uint8_t buf[4];
  HUTVViewingProfilesSetupViewController *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)HUTVViewingProfilesSetupViewController;
  -[HUImageOBWelcomeController viewDidLoad](&v31, sel_viewDidLoad);
  -[HUTVViewingProfilesSetupViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7042FC8);

  -[HUTVViewingProfilesSetupViewController home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_appleTVs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTVViewingProfilesSetupViewController setUseTVVPButton:](self, "setUseTVVPButton:", v9);

  -[HUTVViewingProfilesSetupViewController useTVVPButton](self, "useTVVPButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUTVViewingProfilesSetupViewController useTVVPButton](self, "useTVVPButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 1)
    v12 = CFSTR("HUTVViewingProfilesSetup_UseTVViewingProfilesButton_Single");
  else
    v12 = CFSTR("HUTVViewingProfilesSetup_UseTVViewingProfilesButton_Multiple");
  if (v8 == 1)
    v13 = CFSTR("HUTVViewingProfilesSetup_CustomizeButton_Single");
  else
    v13 = CFSTR("HUTVViewingProfilesSetup_CustomizeButton_Multiple");
  _HULocalizedStringWithDefaultValue(v12, v12, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v14, 0);

  -[HUTVViewingProfilesSetupViewController useTVVPButton](self, "useTVVPButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.TVViewing.SetUp.SingleOrMultipleButton"));

  -[HUTVViewingProfilesSetupViewController useTVVPButton](self, "useTVVPButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__turnOnAllTVViewingProfiles_, 64);

  -[HUTVViewingProfilesSetupViewController buttonTray](self, "buttonTray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTVViewingProfilesSetupViewController useTVVPButton](self, "useTVVPButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addButton:", v18);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTVViewingProfilesSetupViewController setCustomizeButton:](self, "setCustomizeButton:", v19);

  -[HUTVViewingProfilesSetupViewController customizeButton](self, "customizeButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUTVViewingProfilesSetupViewController customizeButton](self, "customizeButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v13, v13, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitle:forState:", v22, 0);

  -[HUTVViewingProfilesSetupViewController customizeButton](self, "customizeButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.TVViewing.SetUp.SingleOrMultipleCustomizeButton"));

  -[HUTVViewingProfilesSetupViewController customizeButton](self, "customizeButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addTarget:action:forControlEvents:", self, sel__customizeOrOffButton_, 64);

  -[HUTVViewingProfilesSetupViewController buttonTray](self, "buttonTray");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTVViewingProfilesSetupViewController customizeButton](self, "customizeButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addButton:", v26);

  -[HUTVViewingProfilesSetupViewController buttonTray](self, "buttonTray");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedModelString(CFSTR("HUTVViewingProfilesSetup_FinePrint"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addCaptionText:", v28);

  -[HUTVViewingProfilesSetupViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HUTVViewingProfilesSetupViewController _setupTVViewingProfilesItemInfrastructure](self, "_setupTVViewingProfilesItemInfrastructure");
  HFLogForCategory();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = self;
    v34 = 2112;
    v35 = v30;
    _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: TVVPSVC", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUTVViewingProfilesSetupViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUTVViewingProfilesSetupViewController;
  -[HUTVViewingProfilesSetupViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HUTVViewingProfilesSetupViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
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
    -[HUTVViewingProfilesSetupViewController delegate](self, "delegate");
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

- (OBTrayButton)useTVVPButton
{
  return self->_useTVVPButton;
}

- (void)setUseTVVPButton:(id)a3
{
  objc_storeStrong((id *)&self->_useTVVPButton, a3);
}

- (OBLinkTrayButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
  objc_storeStrong((id *)&self->_customizeButton, a3);
}

- (HUTVViewingProfilesEditorItemManager)tvVPEditorItemManager
{
  return self->_tvVPEditorItemManager;
}

- (void)setTvVPEditorItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_tvVPEditorItemManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvVPEditorItemManager, 0);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_useTVVPButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
