@implementation HUVoiceProfileSetupViewController

- (HUVoiceProfileSetupViewController)initWithHome:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString *v24;
  NSString *buttonOneText;
  void *v26;
  id v27;
  void *v28;
  NSString *v29;
  NSString *v30;
  void *v31;
  HUVoiceProfileSetupViewController *v32;
  objc_super v34;
  id v35;

  v5 = a3;
  HULocalizedSiriTriggerPhrase(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assistantIsEnabled");

  if (v8)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUVoiceProfileSetup_Title"), CFSTR("HUVoiceProfileSetup_Title"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUVoiceProfileSetup_Detail"), CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedSiriTriggerPhrase(v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUVoiceProfileSetup_SetupButton"), CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v17);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    buttonOneText = self->_buttonOneText;
    self->_buttonOneText = v24;

  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSiriSetup_Title"), CFSTR("HUSiriSetup_Title"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedModelString(CFSTR("HUSiriSetup_Detail"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v26, CFSTR("%@"), &v35, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v35;
    v28 = v27;
    if (!v16)
      NSLog(CFSTR("Couldn't localize format string \"%@\". Most likely, the format specifiers don't match. %@"), v26, v27);
    _HULocalizedStringWithDefaultValue(CFSTR("HUSiriSetup_SetupButton"), CFSTR("HUSiriSetup_SetupButton"), 1);
    v29 = (NSString *)objc_claimAutoreleasedReturnValue();
    v30 = self->_buttonOneText;
    self->_buttonOneText = v29;

  }
  HUImageNamed(CFSTR("Onboarding-Siri"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34.receiver = self;
  v34.super_class = (Class)HUVoiceProfileSetupViewController;
  v32 = -[HUImageOBWelcomeController initWithTitle:detailText:icon:contentImage:](&v34, sel_initWithTitle_detailText_icon_contentImage_, v9, v16, 0, v31);

  if (v32)
    objc_storeStrong((id *)&v32->_home, a3);

  return v32;
}

- (void)_setupPersonalRequestsItemInfrastructure
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HUPersonalRequestsEditorItemManager *v8;
  void *v9;
  id v10;
  id v11;

  v4 = objc_alloc(MEMORY[0x1E0D31988]);
  -[HUVoiceProfileSetupViewController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUVoiceProfileSetupViewController home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "initWithHome:user:nameStyle:", v5, v7, 0);

  v8 = -[HUPersonalRequestsEditorItemManager initWithDelegate:userItem:onlyShowDeviceSwitches:]([HUPersonalRequestsEditorItemManager alloc], "initWithDelegate:userItem:onlyShowDeviceSwitches:", 0, v11, 1);
  -[HUVoiceProfileSetupViewController setPrEditorItemManager:](self, "setPrEditorItemManager:", v8);

  -[HUVoiceProfileSetupViewController prEditorItemManager](self, "prEditorItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

}

- (void)_dontSetupVoiceProfileWithWarning:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  HUVoiceProfileSetupViewController *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v16, 0x16u);

  }
  -[HUVoiceProfileSetupViewController prEditorItemManager](self, "prEditorItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prDevicesModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personalRequestsDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[HUVoiceProfileSetupViewController home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hf_currentUserIsAdministrator"))
    {

LABEL_7:
      v14 = 0;
      v15 = 1;
      goto LABEL_9;
    }
    -[HUVoiceProfileSetupViewController home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hf_currentUserIsOwner");

    if (v13)
      goto LABEL_7;
  }
  v15 = 0;
  v14 = 1;
LABEL_9:
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro") & 1) != 0)
  {
    goto LABEL_15;
  }
  if (v14)
  {
    +[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOfVoiceRecognitionFrom:](HUHomeFeatureOnboardingUtilities, "presentAlertConfirmingTurningOfVoiceRecognitionFrom:", self);
    return;
  }
  if (!v15)
LABEL_15:
    -[HUVoiceProfileSetupViewController _dontSetupVoiceProfile](self, "_dontSetupVoiceProfile");
  else
    +[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOffPersonalRequestsFrom:](HUHomeFeatureOnboardingUtilities, "presentAlertConfirmingTurningOffPersonalRequestsFrom:", self);
}

- (void)_dontSetupVoiceProfile
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[HUVoiceProfileSetupViewController _turnOffVoiceRecognition](self, "_turnOffVoiceRecognition");
  -[HUVoiceProfileSetupViewController _turnOffPersonalRequests](self, "_turnOffPersonalRequests");
  -[HUVoiceProfileSetupViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("HUVoiceProfileOnboardingKey_UserInput");
  v6[0] = &unk_1E7041E48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController:didFinishWithConfigurationResults:", self, v4);

}

- (void)_setupVoiceProfile:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  HUVoiceProfileSetupViewController *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v18, 0x16u);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC8720]), "init:", 2);
  -[HUVoiceProfileSetupViewController setVoiceProfileVC:](self, "setVoiceProfileVC:", v7);

  -[HUVoiceProfileSetupViewController voiceProfileVC](self, "voiceProfileVC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[HUVoiceProfileSetupViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNavigationBarHidden:animated:", 0, 1);

  -[HUVoiceProfileSetupViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0CEA638]);
  objc_msgSend(v11, "setBackgroundImage:forBarPosition:barMetrics:", v12, 0, 0);

  -[HUVoiceProfileSetupViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0CEA638]);
  objc_msgSend(v14, "setShadowImage:", v15);

  -[HUVoiceProfileSetupViewController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUVoiceProfileSetupViewController voiceProfileVC](self, "voiceProfileVC");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pushViewController:animated:", v17, 1);

}

- (void)_resetVoiceProfileSetup
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  HUVoiceProfileSetupViewController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v14, 0x16u);

  }
  -[HUVoiceProfileSetupViewController voiceProfileVC](self, "voiceProfileVC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC8720]), "init:", 2);
  -[HUVoiceProfileSetupViewController setVoiceProfileVC:](self, "setVoiceProfileVC:", v7);

  -[HUVoiceProfileSetupViewController voiceProfileVC](self, "voiceProfileVC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[HUVoiceProfileSetupViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "removeLastObject");
  -[HUVoiceProfileSetupViewController voiceProfileVC](self, "voiceProfileVC");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  -[HUVoiceProfileSetupViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setViewControllers:animated:", v11, 0);

}

- (void)_turnOffVoiceRecognition
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  HUVoiceProfileSetupViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: Turning off Recognize My Voice", (uint8_t *)&v12, 0x16u);

  }
  v6 = objc_alloc(MEMORY[0x1E0D31988]);
  -[HUVoiceProfileSetupViewController home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUVoiceProfileSetupViewController home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithHome:user:nameStyle:", v7, v9, 0);

  v11 = (id)objc_msgSend(v10, "setEnableIdentifyVoice:", 0);
}

- (void)_turnOffPersonalRequests
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  HUVoiceProfileSetupViewController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: Turning off all Personal Requests devices", (uint8_t *)&v8, 0x16u);

  }
  -[HUVoiceProfileSetupViewController prEditorItemManager](self, "prEditorItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prDevicesModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPersonalRequestsDevices:", MEMORY[0x1E0C9AA60]);

}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)skipSetup
{
  -[HUVoiceProfileSetupViewController _dontSetupVoiceProfileWithWarning:](self, "_dontSetupVoiceProfileWithWarning:", 0);
}

- (void)continueSetup
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[HUVoiceProfileSetupViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNavigationBarHidden:animated:", 1, 1);

  -[HUVoiceProfileSetupViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("HUVoiceProfileOnboardingKey_UserInput");
  v7[0] = &unk_1E7041E60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController:didFinishWithConfigurationResults:", self, v5);

}

- (void)dismissSetup
{
  -[HUVoiceProfileSetupViewController _dontSetupVoiceProfileWithWarning:](self, "_dontSetupVoiceProfileWithWarning:", 0);
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
  HUVoiceProfileSetupViewController *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)HUVoiceProfileSetupViewController;
  -[HUImageOBWelcomeController viewDidLoad](&v26, sel_viewDidLoad);
  -[HUVoiceProfileSetupViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7043310);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUVoiceProfileSetupViewController setSetupButton:](self, "setSetupButton:", v6);

  -[HUVoiceProfileSetupViewController setupButton](self, "setupButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUVoiceProfileSetupViewController setupButton](self, "setupButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUVoiceProfileSetupViewController buttonOneText](self, "buttonOneText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[HUVoiceProfileSetupViewController setupButton](self, "setupButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.Onboarding.Voice.SetupButton"));

  -[HUVoiceProfileSetupViewController setupButton](self, "setupButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__setupVoiceProfile_, 64);

  -[HUVoiceProfileSetupViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUVoiceProfileSetupViewController setupButton](self, "setupButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v13);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUVoiceProfileSetupViewController setNotNowButton:](self, "setNotNowButton:", v14);

  -[HUVoiceProfileSetupViewController notNowButton](self, "notNowButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUVoiceProfileSetupViewController notNowButton](self, "notNowButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUVoiceProfileSetup_NotNowButton"), CFSTR("HUVoiceProfileSetup_NotNowButton"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v17, 0);

  -[HUVoiceProfileSetupViewController notNowButton](self, "notNowButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("Home.Onboarding.Voice.NotNowButton"));

  -[HUVoiceProfileSetupViewController notNowButton](self, "notNowButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel__dontSetupVoiceProfileWithWarning_, 64);

  -[HUVoiceProfileSetupViewController buttonTray](self, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUVoiceProfileSetupViewController notNowButton](self, "notNowButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v21);

  -[HUVoiceProfileSetupViewController buttonTray](self, "buttonTray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = *MEMORY[0x1E0D651D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPrivacyLinkForBundles:", v23);

  -[HUVoiceProfileSetupViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HUVoiceProfileSetupViewController _setupPersonalRequestsItemInfrastructure](self, "_setupPersonalRequestsItemInfrastructure");
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
    _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: VPSVC", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUVoiceProfileSetupViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUVoiceProfileSetupViewController;
  -[HUVoiceProfileSetupViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HUVoiceProfileSetupViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
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
    -[HUVoiceProfileSetupViewController delegate](self, "delegate");
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

- (OBTrayButton)setupButton
{
  return self->_setupButton;
}

- (void)setSetupButton:(id)a3
{
  objc_storeStrong((id *)&self->_setupButton, a3);
}

- (OBLinkTrayButton)notNowButton
{
  return self->_notNowButton;
}

- (void)setNotNowButton:(id)a3
{
  objc_storeStrong((id *)&self->_notNowButton, a3);
}

- (HUPersonalRequestsEditorItemManager)prEditorItemManager
{
  return self->_prEditorItemManager;
}

- (void)setPrEditorItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_prEditorItemManager, a3);
}

- (NSString)buttonOneText
{
  return self->_buttonOneText;
}

- (void)setButtonOneText:(id)a3
{
  objc_storeStrong((id *)&self->_buttonOneText, a3);
}

- (VTUIEnrollTrainingViewController)voiceProfileVC
{
  return self->_voiceProfileVC;
}

- (void)setVoiceProfileVC:(id)a3
{
  objc_storeStrong((id *)&self->_voiceProfileVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceProfileVC, 0);
  objc_storeStrong((id *)&self->_buttonOneText, 0);
  objc_storeStrong((id *)&self->_prEditorItemManager, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_setupButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
