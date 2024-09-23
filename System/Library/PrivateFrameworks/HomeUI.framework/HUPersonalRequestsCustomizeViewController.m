@implementation HUPersonalRequestsCustomizeViewController

- (HUPersonalRequestsCustomizeViewController)initWithLocationDevice:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  HUPersonalRequestsEditorTableViewController *v28;
  void *v29;
  HUPersonalRequestsCustomizeViewController *v30;
  id v31;
  uint64_t v32;
  NSString *finePrintFooterText;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSString *v38;
  void *v40;
  id v41;
  objc_super v42;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPersonalRequestsCustomizeViewController.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locationDevice"));

  }
  v9 = objc_alloc(MEMORY[0x1E0D31988]);
  objc_msgSend(v8, "currentUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithHome:user:nameStyle:", v8, v10, 0);

  objc_msgSend(v7, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUPersonalRequestsCustomize_Detail"), CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUPersonalRequestsCustomize_Detail"), CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = -[HUPersonalRequestsEditorTableViewController initWithUserItem:onlyShowDeviceSwitches:]([HUPersonalRequestsEditorTableViewController alloc], "initWithUserItem:onlyShowDeviceSwitches:", v11, 1);
  _HULocalizedStringWithDefaultValue(CFSTR("HUPersonalRequestsCustomize_Title"), CFSTR("HUPersonalRequestsCustomize_Title"), 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42.receiver = self;
  v42.super_class = (Class)HUPersonalRequestsCustomizeViewController;
  v30 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v42, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v29, v27, 0, 2, v28);

  if (v30)
  {
    objc_storeStrong((id *)&v30->_home, a4);
    if (objc_msgSend(v7, "isCurrentDevice"))
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "hu_modelAndNetworkLocalizedStringKeyForKey:", CFSTR("HUPersonalRequestsCustomize_ThisDevice_FinePrint"));
      v31 = (id)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(v31, v31, 1);
      v32 = objc_claimAutoreleasedReturnValue();
      finePrintFooterText = v30->_finePrintFooterText;
      v30->_finePrintFooterText = (NSString *)v32;

    }
    else
    {
      v34 = (void *)MEMORY[0x1E0CB3940];
      HULocalizedWiFiString(CFSTR("HUPersonalRequestsCustomize_OtherDevice_FinePrint"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      objc_msgSend(v7, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithValidatedFormat:validFormatSpecifiers:error:", v35, CFSTR("%@"), &v41, v36);
      v37 = objc_claimAutoreleasedReturnValue();
      v31 = v41;
      v38 = v30->_finePrintFooterText;
      v30->_finePrintFooterText = (NSString *)v37;

      if (!v30->_finePrintFooterText)
        NSLog(CFSTR("Couldn't localize format string \"%@\". Most likely, the format specifiers don't match. %@"), CFSTR("HUPersonalRequestsCustomize_OtherDevice_FinePrint"), v31);
    }

  }
  return v30;
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
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: Turning on Personal Requests for all multi user capable devices", (uint8_t *)&v14, 0xCu);

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

  objc_msgSend(v11, "prDevicesModule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices");
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_dontSetupPersonalRequests:(id)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  HUPersonalRequestsCustomizeViewController *v8;
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
  HUPersonalRequestsCustomizeViewController *v21;
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
    v8 = (HUPersonalRequestsCustomizeViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: Turning off all Personal Requests devices", buf, 0xCu);

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

  objc_msgSend(v14, "prDevicesModule");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setPersonalRequestsDevices:", MEMORY[0x1E0C9AA60]);
  -[HUPersonalRequestsCustomizeViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFSTR("HUPersonalRequestsOnboardingKey_UserInput");
  v19 = &unk_1E7040468;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewController:didFinishWithConfigurationResults:", self, v17);

}

- (void)_setupPersonalRequests:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint8_t buf[4];
  HUPersonalRequestsCustomizeViewController *v12;
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
  -[HUPersonalRequestsCustomizeViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("HUPersonalRequestsOnboardingKey_UserInput");
  v10 = &unk_1E7040480;
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
  HUPersonalRequestsCustomizeViewController *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)HUPersonalRequestsCustomizeViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v29, sel_viewDidLoad);
  -[HUPersonalRequestsCustomizeViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7042E10);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsCustomizeViewController setUsePRButton:](self, "setUsePRButton:", v6);

  -[HUPersonalRequestsCustomizeViewController usePRButton](self, "usePRButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUPersonalRequestsCustomizeViewController usePRButton](self, "usePRButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUPersonalRequestsCustomize_ContinueButton"), CFSTR("HUPersonalRequestsCustomize_ContinueButton"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[HUPersonalRequestsCustomizeViewController usePRButton](self, "usePRButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.PersonalRequests.ContinueButton"));

  -[HUPersonalRequestsCustomizeViewController usePRButton](self, "usePRButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__setupPersonalRequests_, 64);

  -[HUPersonalRequestsCustomizeViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsCustomizeViewController usePRButton](self, "usePRButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v13);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsCustomizeViewController setCustomizeButton:](self, "setCustomizeButton:", v14);

  -[HUPersonalRequestsCustomizeViewController customizeButton](self, "customizeButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUPersonalRequestsCustomizeViewController customizeButton](self, "customizeButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUPersonalRequestsCustomize_DoNotUseButton"), CFSTR("HUPersonalRequestsCustomize_DoNotUseButton"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v17, 0);

  -[HUPersonalRequestsCustomizeViewController customizeButton](self, "customizeButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.PersonalRequests.DoNotUseButton"));

  -[HUPersonalRequestsCustomizeViewController customizeButton](self, "customizeButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel__dontSetupPersonalRequests_, 64);

  -[HUPersonalRequestsCustomizeViewController buttonTray](self, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsCustomizeViewController customizeButton](self, "customizeButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v21);

  -[HUPersonalRequestsCustomizeViewController buttonTray](self, "buttonTray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsCustomizeViewController finePrintFooterText](self, "finePrintFooterText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaptionText:", v23);

  -[HUPersonalRequestsCustomizeViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
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
    _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: PRCVC", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUPersonalRequestsCustomizeViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUPersonalRequestsCustomizeViewController;
  -[HUPersonalRequestsCustomizeViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HUPersonalRequestsCustomizeViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
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
    -[HUPersonalRequestsCustomizeViewController delegate](self, "delegate");
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

- (NSString)finePrintFooterText
{
  return self->_finePrintFooterText;
}

- (void)setFinePrintFooterText:(id)a3
{
  objc_storeStrong((id *)&self->_finePrintFooterText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finePrintFooterText, 0);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_usePRButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
