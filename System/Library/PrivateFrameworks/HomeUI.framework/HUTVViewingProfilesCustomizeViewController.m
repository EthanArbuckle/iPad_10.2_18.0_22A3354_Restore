@implementation HUTVViewingProfilesCustomizeViewController

- (HUTVViewingProfilesCustomizeViewController)initWithHome:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HUTVViewingProfilesEditorTableViewController *v9;
  void *v10;
  void *v11;
  HUTVViewingProfilesCustomizeViewController *v12;
  objc_super v14;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0D31988]);
  objc_msgSend(v5, "currentUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithHome:user:nameStyle:", v5, v7, 0);

  v9 = -[HUTVViewingProfilesEditorTableViewController initWithUserItem:]([HUTVViewingProfilesEditorTableViewController alloc], "initWithUserItem:", v8);
  -[HUTVViewingProfilesEditorTableViewController setHideHeadersAndFooters:](v9, "setHideHeadersAndFooters:", 1);
  _HULocalizedStringWithDefaultValue(CFSTR("HUTVViewingProfilesCustomize_Title"), CFSTR("HUTVViewingProfilesCustomize_Title"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUTVViewingProfilesSetup_Detail"), CFSTR("HUTVViewingProfilesSetup_Detail"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)HUTVViewingProfilesCustomizeViewController;
  v12 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v14, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v10, v11, 0, 2, v9);

  if (v12)
    objc_storeStrong((id *)&v12->_home, a3);

  return v12;
}

- (id)hu_preloadContent
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: Turning on TV Viewing Profiles for all devices", (uint8_t *)&v14, 0xCu);

  }
  objc_opt_class();
  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  objc_msgSend(v8, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "tvpDevicesModule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "turnOnTVViewingProfilesForAllDevices");
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_dontSetupTVViewingProfiles:(id)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  HUTVViewingProfilesCustomizeViewController *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint8_t buf[4];
  HUTVViewingProfilesCustomizeViewController *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (HUTVViewingProfilesCustomizeViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: Turning off all TV Viewing Profiles devices", buf, 0xCu);

  }
  objc_opt_class();
  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_opt_class();
  objc_msgSend(v11, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v14, "tvpDevicesModule");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setViewingProfilesDevices:", MEMORY[0x1E0C9AA60]);
  -[HUTVViewingProfilesCustomizeViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFSTR("HUTVViewingProfilesOnboardingKey_UserInput");
  v19 = &unk_1E7041EA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewController:didFinishWithConfigurationResults:", self, v17);

}

- (void)_setupTVViewingProfiles:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint8_t buf[4];
  HUTVViewingProfilesCustomizeViewController *v12;
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
  -[HUTVViewingProfilesCustomizeViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("HUTVViewingProfilesOnboardingKey_UserInput");
  v10 = &unk_1E7041EC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewController:didFinishWithConfigurationResults:", self, v8);

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
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  HUTVViewingProfilesCustomizeViewController *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)HUTVViewingProfilesCustomizeViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v29, sel_viewDidLoad);
  -[HUTVViewingProfilesCustomizeViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7043338);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTVViewingProfilesCustomizeViewController setUsePRButton:](self, "setUsePRButton:", v6);

  -[HUTVViewingProfilesCustomizeViewController usePRButton](self, "usePRButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUTVViewingProfilesCustomizeViewController usePRButton](self, "usePRButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUTVViewingProfilesCustomize_ContinueButton"), CFSTR("HUTVViewingProfilesCustomize_ContinueButton"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[HUTVViewingProfilesCustomizeViewController usePRButton](self, "usePRButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.Onboarding.TVViewing.CustomizeOrContinueButton"));

  -[HUTVViewingProfilesCustomizeViewController usePRButton](self, "usePRButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__setupTVViewingProfiles_, 64);

  -[HUTVViewingProfilesCustomizeViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTVViewingProfilesCustomizeViewController usePRButton](self, "usePRButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v13);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTVViewingProfilesCustomizeViewController setCustomizeButton:](self, "setCustomizeButton:", v14);

  -[HUTVViewingProfilesCustomizeViewController customizeButton](self, "customizeButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUTVViewingProfilesCustomizeViewController customizeButton](self, "customizeButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUTVViewingProfilesCustomize_DoNotUseButton"), CFSTR("HUTVViewingProfilesCustomize_DoNotUseButton"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v17, 0);

  -[HUTVViewingProfilesCustomizeViewController customizeButton](self, "customizeButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("Home.Onboarding.TVViewing.CustomizeOrDoNotUseButton"));

  -[HUTVViewingProfilesCustomizeViewController customizeButton](self, "customizeButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel__dontSetupTVViewingProfiles_, 64);

  -[HUTVViewingProfilesCustomizeViewController buttonTray](self, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTVViewingProfilesCustomizeViewController customizeButton](self, "customizeButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v21);

  -[HUTVViewingProfilesCustomizeViewController buttonTray](self, "buttonTray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedModelString(CFSTR("HUTVViewingProfilesSetup_FinePrint"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaptionText:", v23);

  -[HUTVViewingProfilesCustomizeViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "itemManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v25, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

  HFLogForCategory();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = self;
    v32 = 2112;
    v33 = v28;
    _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@: presented", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUTVViewingProfilesCustomizeViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUTVViewingProfilesCustomizeViewController;
  -[HUTVViewingProfilesCustomizeViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HUTVViewingProfilesCustomizeViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
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
    -[HUTVViewingProfilesCustomizeViewController delegate](self, "delegate");
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

- (OBTrayButton)usePRButton
{
  return self->_usePRButton;
}

- (void)setUsePRButton:(id)a3
{
  objc_storeStrong((id *)&self->_usePRButton, a3);
}

- (OBLinkTrayButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
  objc_storeStrong((id *)&self->_customizeButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_usePRButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
