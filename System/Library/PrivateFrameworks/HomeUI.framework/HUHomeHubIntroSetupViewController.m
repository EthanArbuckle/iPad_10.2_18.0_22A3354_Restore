@implementation HUHomeHubIntroSetupViewController

- (HUHomeHubIntroSetupViewController)initWithHomes:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HUHomeHubIntroSetupViewController *v25;
  HUHomeHubIntroSetupViewController *v26;
  uint64_t v27;
  HFHomeKitDispatcher *homeKitDispatcher;
  objc_super v30;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = v5 > 1;
  if (v5 > 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationUpgradeHomesTitle"), CFSTR("HUSoftwareUpdateMigrationUpgradeHomesTitle"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("HUSoftwareUpdateMigrationUpgradeHomesDescription");
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUSoftwareUpdateMigrationUpgradeSpecificHomeTitle"), CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = CFSTR("HUSoftwareUpdateMigrationUpgradeHomeDescription");
  }
  _HULocalizedStringWithDefaultValue(v16, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "configurationWithHierarchicalColor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 100.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "configurationByApplyingConfiguration:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("homekit"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "imageWithConfiguration:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v30.receiver = self;
  v30.super_class = (Class)HUHomeHubIntroSetupViewController;
  v25 = -[HUImageOBWelcomeController initWithTitle:detailText:icon:contentImage:](&v30, sel_initWithTitle_detailText_icon_contentImage_, v15, v17, 0, v24);
  v26 = v25;
  if (v25)
  {
    v25->_moreThanOneHome = v6;
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v27 = objc_claimAutoreleasedReturnValue();
    homeKitDispatcher = v26->_homeKitDispatcher;
    v26->_homeKitDispatcher = (HFHomeKitDispatcher *)v27;

  }
  return v26;
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
  NSObject *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  HUHomeHubIntroSetupViewController *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)HUHomeHubIntroSetupViewController;
  -[HUImageOBWelcomeController viewDidLoad](&v24, sel_viewDidLoad);
  -[HUHomeHubIntroSetupViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7043270);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubIntroSetupViewController setCommitButton:](self, "setCommitButton:", v6);

  -[HUHomeHubIntroSetupViewController commitButton](self, "commitButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeHubIntroSetupViewController commitButton](self, "commitButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubIntroSetupViewController _commitOrContinueButtonTitle](self, "_commitOrContinueButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[HUHomeHubIntroSetupViewController commitButton](self, "commitButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.IntroSetUp.CommitOrContinueButton"));

  -[HUHomeHubIntroSetupViewController commitButton](self, "commitButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__commitOrContinue, 64);

  -[HUHomeHubIntroSetupViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubIntroSetupViewController commitButton](self, "commitButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v13);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubIntroSetupViewController setCancelButton:](self, "setCancelButton:", v14);

  -[HUHomeHubIntroSetupViewController cancelButton](self, "cancelButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeHubIntroSetupViewController cancelButton](self, "cancelButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationUpgradeLaterTitle"), CFSTR("HUSoftwareUpdateMigrationUpgradeLaterTitle"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v17, 0);

  -[HUHomeHubIntroSetupViewController cancelButton](self, "cancelButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.IntroSetUp.UpgradeLater"));

  -[HUHomeHubIntroSetupViewController cancelButton](self, "cancelButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel__cancelFlow, 64);

  -[HUHomeHubIntroSetupViewController buttonTray](self, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubIntroSetupViewController cancelButton](self, "cancelButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v21);

  -[HUHomeHubIntroSetupViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = self;
    v27 = 2112;
    v28 = v23;
    _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubSharedUserWarningViewController", buf, 0x16u);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[5];
  _QWORD aBlock[5];

  v3 = a3;
  -[HUHomeHubIntroSetupViewController setIsViewVisible:](self, "setIsViewVisible:", 1);
  if (-[HUHomeHubIntroSetupViewController needsToPresentUpgradeFailedAlert](self, "needsToPresentUpgradeFailedAlert"))
  {
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__HUHomeHubIntroSetupViewController_viewWillAppear___block_invoke;
    aBlock[3] = &unk_1E6F4D988;
    aBlock[4] = self;
    v6 = _Block_copy(aBlock);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __52__HUHomeHubIntroSetupViewController_viewWillAppear___block_invoke_2;
    v11[3] = &unk_1E6F4D988;
    v11[4] = self;
    v7 = _Block_copy(v11);
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationFailedAlertTitle"), CFSTR("HUSoftwareUpdateMigrationFailedAlertTitle"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationFailedAlertMessage"), CFSTR("HUSoftwareUpdateMigrationFailedAlertMessage"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubIntroSetupViewController _presentUpgradeFailedAlert:message:retryTitle:retryBlock:cancelBlock:](self, "_presentUpgradeFailedAlert:message:retryTitle:retryBlock:cancelBlock:", v8, v9, 0, v6, v7);

  }
  v10.receiver = self;
  v10.super_class = (Class)HUHomeHubIntroSetupViewController;
  -[HUHomeHubIntroSetupViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
}

uint64_t __52__HUHomeHubIntroSetupViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commitOrContinue");
}

uint64_t __52__HUHomeHubIntroSetupViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelFlow");
}

- (BOOL)_limitToNonScrollingContentHeight
{
  return 1;
}

- (id)_commitOrContinueButtonTitle
{
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;

  if (-[HUHomeHubIntroSetupViewController moreThanOneHome](self, "moreThanOneHome"))
    v3 = CFSTR("HUSoftwareUpdateMigrationUpgradeHomesTitle");
  else
    v3 = CFSTR("HUSoftwareUpdateMigrationUpgradeHomeTitle");
  _HULocalizedStringWithDefaultValue(v3, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUHomeHubIntroSetupViewController isFinalStep](self, "isFinalStep"))
  {
    v5 = v4;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)_commitOrContinue
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  NSObject *v14;
  __CFString *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void **v19;
  const __CFString **v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD aBlock[5];
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint8_t buf[4];
  _BYTE v30[10];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubIntroSetupViewController _commitOrContinueButtonTitle](self, "_commitOrContinueButtonTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v30 = self;
    *(_WORD *)&v30[8] = 2112;
    v31 = v5;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button '%@'", buf, 0x20u);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HUHomeHubIntroSetupViewController__commitOrContinue__block_invoke;
  aBlock[3] = &unk_1E6F4D988;
  aBlock[4] = self;
  v7 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLowPowerModeEnabled");

  v10 = objc_msgSend(MEMORY[0x1E0D319D0], "isMonitoredInterfaceWifiOrEthernet");
  v11 = objc_msgSend(MEMORY[0x1E0D319D0], "isUsingiCloud");
  v12 = objc_msgSend(MEMORY[0x1E0D319D0], "isCurrentAccount2FAEnabled");
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationFailedAlertTitle"), CFSTR("HUSoftwareUpdateMigrationFailedAlertTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v30 = v10;
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = v9;
    LOWORD(v31) = 1024;
    *(_DWORD *)((char *)&v31 + 2) = v11;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "HH2 migration can only start if: User is connected to WiFi or Ethernet, and low power mode is not enabled, and logged into iCloud. isWifiOrEthernetReachable = %{BOOL}d, isLowPowerModeEnabled = %{BOOL}d, isLoggedIntoiCloud = %{BOOL}d", buf, 0x14u);
  }

  if (v9 | v10 ^ 1 | v11 & v12 ^ 1)
  {
    if (v9)
    {
      if (objc_msgSend(MEMORY[0x1E0D319D0], "useWLANInsteadOfWiFi"))
        v15 = CFSTR("HUSoftwareUpdateMigrationFailedDueToLowPowerModeAlertMessageWLAN");
      else
        v15 = CFSTR("HUSoftwareUpdateMigrationFailedDueToLowPowerModeAlertMessageWiFi");
    }
    else
    {
      if ((v10 & 1) != 0)
      {
        if ((v11 & 1) == 0)
        {
          _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationFailedsignIniCloudTitle"), CFSTR("HUSoftwareUpdateMigrationFailedsignIniCloudTitle"), 1);
          v23 = objc_claimAutoreleasedReturnValue();

          _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationFailedSigninButtonTitle"), CFSTR("HUSoftwareUpdateMigrationFailedSigninButtonTitle"), 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationFailedsignIniCloudMessage"), CFSTR("HUSoftwareUpdateMigrationFailedsignIniCloudMessage"), 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = &__block_literal_global_225;
          v13 = (void *)v23;
LABEL_24:
          -[HUHomeHubIntroSetupViewController _presentUpgradeFailedAlert:message:retryTitle:retryBlock:cancelBlock:](self, "_presentUpgradeFailedAlert:message:retryTitle:retryBlock:cancelBlock:", v13, v17, v22, v21, v7);
          goto LABEL_25;
        }
        if ((v12 & 1) == 0)
        {
          _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationFailed2FAMessage"), CFSTR("HUSoftwareUpdateMigrationFailed2FAMessage"), 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationFailedSigninButtonTitle"), CFSTR("HUSoftwareUpdateMigrationFailedSigninButtonTitle"), 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = &__block_literal_global_70_1;
          goto LABEL_24;
        }
        v21 = 0;
        v17 = 0;
LABEL_23:
        v22 = 0;
        goto LABEL_24;
      }
      if (objc_msgSend(MEMORY[0x1E0D319D0], "useWLANInsteadOfWiFi"))
        v15 = CFSTR("HUSoftwareUpdateMigrationFailedDueToNoWLANAlertMessageWLAN");
      else
        v15 = CFSTR("HUSoftwareUpdateMigrationFailedDueToNoWiFiAlertMessageWiFi");
    }
    HULocalizedModelString(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    goto LABEL_23;
  }
  v16 = -[HUHomeHubIntroSetupViewController isFinalStep](self, "isFinalStep");
  -[HUHomeHubIntroSetupViewController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v27 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
    v28 = &unk_1E70416E0;
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = &v28;
    v20 = &v27;
  }
  else
  {
    v25 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
    v26 = &unk_1E70416F8;
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = &v26;
    v20 = &v25;
  }
  objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "viewController:didFinishWithConfigurationResults:", self, v22);
LABEL_25:

}

uint64_t __54__HUHomeHubIntroSetupViewController__commitOrContinue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelFlow");
}

void __54__HUHomeHubIntroSetupViewController__commitOrContinue__block_invoke_65()
{
  void *v0;
  id v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "hf_openiCloudPreferencesURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "openURL:", v0);

}

void __54__HUHomeHubIntroSetupViewController__commitOrContinue__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "hf_openiCloudPasswordAndSecurityURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "openURL:", v0);

}

- (void)_cancelFlow
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  HUHomeHubIntroSetupViewController *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  -[HUHomeHubIntroSetupViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
  v9 = &unk_1E7041710;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didFinishWithConfigurationResults:", self, v7);

}

- (void)_presentUpgradeFailedAlert:(id)a3 message:(id)a4 retryTitle:(id)a5 retryBlock:(id)a6 cancelBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  SEL v24;
  void *v25;
  void *v26;
  char *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  SEL v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  SEL v42;
  uint8_t buf[4];
  HUHomeHubIntroSetupViewController *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v44 = self;
    v45 = 2080;
    v46 = "-[HUHomeHubIntroSetupViewController _presentUpgradeFailedAlert:message:retryTitle:retryBlock:cancelBlock:]";
    v47 = 2112;
    v48 = v13;
    v49 = 2112;
    v50 = v14;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%s presenting alert card: title %@ message %@", buf, 0x2Au);
  }

  if (-[HUHomeHubIntroSetupViewController isViewVisible](self, "isViewVisible"))
  {
    v31 = v17;
    -[HUHomeHubIntroSetupViewController setNeedsToPresentUpgradeFailedAlert:](self, "setNeedsToPresentUpgradeFailedAlert:", 0);
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v15, "length");
    v21 = v16;
    v22 = MEMORY[0x1E0C809B0];
    v32 = v21;
    if (v21 && v20)
    {
      v23 = (void *)MEMORY[0x1E0CEA2E0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __106__HUHomeHubIntroSetupViewController__presentUpgradeFailedAlert_message_retryTitle_retryBlock_cancelBlock___block_invoke;
      v38[3] = &unk_1E6F5BE90;
      v41 = v21;
      v42 = a2;
      v38[4] = self;
      v24 = a2;
      v39 = v15;
      v40 = v13;
      objc_msgSend(v23, "actionWithTitle:style:handler:", v39, 0, v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addAction:](v19, "addAction:", v25);

      _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = a2;
    }
    v28 = (void *)MEMORY[0x1E0CEA2E0];
    v33[0] = v22;
    v33[1] = 3221225472;
    v33[2] = __106__HUHomeHubIntroSetupViewController__presentUpgradeFailedAlert_message_retryTitle_retryBlock_cancelBlock___block_invoke_82;
    v33[3] = &unk_1E6F5BE90;
    v36 = v31;
    v37 = v24;
    v17 = v31;
    v33[4] = self;
    v34 = v26;
    v35 = v13;
    v29 = v26;
    objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 1, v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addAction:](v19, "addAction:", v30);

    -[HUHomeHubIntroSetupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);
    v16 = v32;
  }
  else
  {
    -[HUHomeHubIntroSetupViewController setNeedsToPresentUpgradeFailedAlert:](self, "setNeedsToPresentUpgradeFailedAlert:", 1);
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v27 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v44 = self;
      v45 = 2112;
      v46 = v27;
      _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@: Deferring alert presentation since view isn't shown yet", buf, 0x16u);

    }
  }

}

void __106__HUHomeHubIntroSetupViewController__presentUpgradeFailedAlert_message_retryTitle_retryBlock_cancelBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 138413058;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped retry button %@ for alert view with title %@", (uint8_t *)&v7, 0x2Au);

  }
}

void __106__HUHomeHubIntroSetupViewController__presentUpgradeFailedAlert_message_retryTitle_retryBlock_cancelBlock___block_invoke_82(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 138413058;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped cancel button %@ for alert view with title %@", (uint8_t *)&v7, 0x2Au);

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

- (OBBoldTrayButton)commitButton
{
  return self->_commitButton;
}

- (void)setCommitButton:(id)a3
{
  objc_storeStrong((id *)&self->_commitButton, a3);
}

- (OBLinkTrayButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (BOOL)moreThanOneHome
{
  return self->_moreThanOneHome;
}

- (void)setMoreThanOneHome:(BOOL)a3
{
  self->_moreThanOneHome = a3;
}

- (BOOL)needsToPresentUpgradeFailedAlert
{
  return self->_needsToPresentUpgradeFailedAlert;
}

- (void)setNeedsToPresentUpgradeFailedAlert:(BOOL)a3
{
  self->_needsToPresentUpgradeFailedAlert = a3;
}

- (BOOL)isViewVisible
{
  return self->_isViewVisible;
}

- (void)setIsViewVisible:(BOOL)a3
{
  self->_isViewVisible = a3;
}

- (HFHomeKitDispatcher)homeKitDispatcher
{
  return self->_homeKitDispatcher;
}

- (void)setHomeKitDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitDispatcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitDispatcher, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_commitButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
