@implementation CKSettingsMessagesController

+ (IMSyncedSettingsManaging)syncedSettingsManager
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_syncedSettingsManager_0;
  if (!_syncedSettingsManager_0)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE50378]);
    v4 = (void *)_syncedSettingsManager_0;
    _syncedSettingsManager_0 = (uint64_t)v3;

    v2 = (void *)_syncedSettingsManager_0;
  }
  return (IMSyncedSettingsManaging *)v2;
}

+ (void)setSyncedSettingsManager:(id)a3
{
  objc_storeStrong((id *)&_syncedSettingsManager_0, a3);
}

- (void)_nicknameSettingsDidChange:(id)a3
{
  -[CKSettingsMessagesController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("NAME_AND_PHOTO_SHARING_BUTTON"));
}

- (CKSettingsMessagesController)init
{
  CKSettingsMessagesController *v2;
  void *v3;
  CKFilteringListController *v4;
  CKFilteringListController *filteringController;
  void *v6;
  void *v7;
  CKSettingsiMessageAppManager *v8;
  void *v9;
  uint64_t v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  CKLazuliEnablementManager *v17;
  CKSharedSettingsHelper *v18;
  void *v19;
  char v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKSettingsMessagesController;
  v2 = -[CKSettingsMessagesController init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_newCarrierNotification, CFSTR("PSNewCarrierNotification"), 0);

    if (!v2->_filteringController)
    {
      v4 = objc_alloc_init(CKFilteringListController);
      filteringController = v2->_filteringController;
      v2->_filteringController = v4;

    }
    +[CNFRegController controllerForServiceType:](CNFRegController, "controllerForServiceType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController setRegController:](v2, "setRegController:", v6);

    -[CNFRegListController regController](v2, "regController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connect:", 1);

    -[CKSettingsMessagesController _startListeningForProfileChanges](v2, "_startListeningForProfileChanges");
    v8 = objc_alloc_init(CKSettingsiMessageAppManager);
    -[CKSettingsMessagesController setIMessageAppManager:](v2, "setIMessageAppManager:", v8);

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if (v10 == 1)
    {
      +[CNFRegWizardController setGlobalAppearanceStyle:](CNFRegWizardController, "setGlobalAppearanceStyle:", 2);
      +[CNFRegWizardController setSupportsAutoRotation:](CNFRegWizardController, "setSupportsAutoRotation:", 1);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSpecifiersFromNotification, CFSTR("com.apple.MobileSMS.ReadReceiptsEnabled.changed"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSpecifiersFromNotification, CFSTR("com.apple.MobileSMS.SettingsChangedByAppIntents"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSpecifiersFromNotification, CFSTR("com.apple.MobileSMS.IncomingMessageAlertFiltration.changed"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isSyncedSettingsEnabled");

    if (v13)
    {
      +[CKSettingsMessagesController syncedSettingsManager](CKSettingsMessagesController, "syncedSettingsManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:key:", v2, sel__syncedSettingsDidChange_, 0);

    }
    else
    {
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSpecifiersFromNotification, CFSTR("com.apple.MobileSMS.KeepMessages.changed"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSpecifiersFromNotification, (CFStringRef)*MEMORY[0x24BE500F8], v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSpecifiersFromNotification, CFSTR("CKSettingsiMessageAppManagerInstalledAppsDidChange"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addListenerID:capabilities:", CFSTR("CKSettingsMessagesController"), (*MEMORY[0x24BE50A00] | *MEMORY[0x24BE509F0]) | *MEMORY[0x24BE50A10]);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel__nicknameSettingsDidChange_, *MEMORY[0x24BE50FA8], 0);

    v17 = objc_alloc_init(CKLazuliEnablementManager);
    -[CKSettingsMessagesController setLazuliEnablementManager:](v2, "setLazuliEnablementManager:", v17);

    v18 = objc_alloc_init(CKSharedSettingsHelper);
    -[CKSettingsMessagesController setSharedSettingsHelper:](v2, "setSharedSettingsHelper:", v18);

    objc_msgSend(MEMORY[0x24BE502B0], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE502B0], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "startMonitor");

    }
  }
  return v2;
}

- (PSSystemPolicyForApp)systemPolicy
{
  PSSystemPolicyForApp *systemPolicy;
  PSSystemPolicyForApp *v4;
  PSSystemPolicyForApp *v5;

  systemPolicy = self->_systemPolicy;
  if (!systemPolicy)
  {
    v4 = (PSSystemPolicyForApp *)objc_msgSend(objc_alloc(MEMORY[0x24BE755E0]), "initWithBundleIdentifier:", CFSTR("com.apple.MobileSMS"));
    v5 = self->_systemPolicy;
    self->_systemPolicy = v4;

    -[PSSystemPolicyForApp setDelegate:](self->_systemPolicy, "setDelegate:", self);
    systemPolicy = self->_systemPolicy;
  }
  return systemPolicy;
}

- (void)dealloc
{
  CKFilteringListController *filteringController;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  int v7;
  void *v8;
  objc_super v9;

  -[CKSettingsMessagesController endMatchingExtensions](self, "endMatchingExtensions");
  filteringController = self->_filteringController;
  self->_filteringController = 0;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  -[CKSettingsMessagesController _stopListeningForProfileChanges](self, "_stopListeningForProfileChanges");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.MobileSMS.ReadReceiptsEnabled.changed"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.MobileSMS.SettingsChangedByAppIntents"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.MobileSMS.IncomingMessageAlertFiltration.changed"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("CKSettingsiMessageAppManagerInstalledAppsDidChange"), 0);
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSyncedSettingsEnabled");

  if (v7)
  {
    +[CKSettingsMessagesController syncedSettingsManager](CKSettingsMessagesController, "syncedSettingsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:key:", self, 0);

    +[CKSettingsMessagesController setSyncedSettingsManager:](CKSettingsMessagesController, "setSyncedSettingsManager:", 0);
  }
  else
  {
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.MobileSMS.KeepMessages.changed"), 0);
  }
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BE500F8], 0);
  v9.receiver = self;
  v9.super_class = (Class)CKSettingsMessagesController;
  -[CNFRegListController dealloc](&v9, sel_dealloc);
}

- (id)logName
{
  return CFSTR("MessagesSettings");
}

- (void)_startListeningForProfileChanges
{
  int *p_profileToken;
  NSObject *v3;
  id v4;
  _QWORD handler[5];
  _QWORD v6[5];
  id v7;

  p_profileToken = &self->_profileToken;
  if (!self->_profileToken)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3042000000;
    v6[3] = __Block_byref_object_copy__4;
    v6[4] = __Block_byref_object_dispose__4;
    objc_initWeak(&v7, self);
    v3 = MEMORY[0x24BDAC9B8];
    v4 = MEMORY[0x24BDAC9B8];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __64__CKSettingsMessagesController__startListeningForProfileChanges__block_invoke;
    handler[3] = &unk_24D076540;
    handler[4] = v6;
    notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", p_profileToken, v3, handler);

    _Block_object_dispose(v6, 8);
    objc_destroyWeak(&v7);
  }
}

void __64__CKSettingsMessagesController__startListeningForProfileChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(WeakRetained, "endMatchingExtensions");

  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(v3, "findSpamExtensions");

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(v4, "reloadSpecifiers");

}

- (void)_stopListeningForProfileChanges
{
  int profileToken;

  profileToken = self->_profileToken;
  if (profileToken)
  {
    notify_cancel(profileToken);
    self->_profileToken = 0;
  }
}

- (BOOL)wantsWiFiChooser
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKSettingsMessagesController;
  -[CNFRegListController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  CNFRegSetStringTableForServiceType(1);
  -[CNFRegListController regController](self, "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isConnected");

  if (v5)
    -[CKSettingsMessagesController reloadSpecifiers](self, "reloadSpecifiers");
  -[CNFRegListController showAuthKitSignInIfNecessary](self, "showAuthKitSignInIfNecessary");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v3 = a3;
  -[CKSettingsMessagesController findSpamExtensions](self, "findSpamExtensions");
  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setBlocksConnectionAtResume:", 1);

  v9.receiver = self;
  v9.super_class = (Class)CKSettingsMessagesController;
  -[CNFRegListController viewDidAppear:](&v9, sel_viewDidAppear_, v3);
  -[CKSettingsMessagesController _setupAccountHandlers](self, "_setupAccountHandlers");
  -[CKSettingsMessagesController _startListeningForProfileChanges](self, "_startListeningForProfileChanges");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__CKSettingsMessagesController_viewDidAppear___block_invoke;
  v8[3] = &unk_24D075180;
  v8[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v8);
  self->_showingChildViewController = 0;
  -[CKFilteringListController setShowingParentViewController:](self->_filteringController, "setShowingParentViewController:", 1);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Apps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("com.apple.MobileSMS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSettingsMessagesController emitNavigationEvent:deepLinkURL:](self, "emitNavigationEvent:deepLinkURL:", MEMORY[0x24BDBD1A8], v7);
}

void __46__CKSettingsMessagesController_viewDidAppear___block_invoke(uint64_t a1)
{
  char *v1;
  id v2;

  v1 = *(char **)(a1 + 32);
  objc_msgSend(*(id *)&v1[*MEMORY[0x24BE756E0]], "specifierForID:", CFSTR("MADRID_ACCOUNTS_BUTTON"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSpecifier:", v2);

}

- (void)emitNavigationEvent:(id)a3 deepLinkURL:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = (objc_class *)MEMORY[0x24BDD19B8];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "initWithKey:table:locale:bundleURL:", CFSTR("Messages"), 0, v10, v12);

  -[CKSettingsMessagesController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.MobileSMS"), v13, v8, v7);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSettingsMessagesController;
  -[CNFRegListController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CNFRegListController removeAllHandlers](self, "removeAllHandlers");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSettingsMessagesController;
  -[CNFRegListController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CKSettingsMessagesController endMatchingExtensions](self, "endMatchingExtensions");
}

- (void)applicationWillSuspend
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSettingsMessagesController;
  -[CKSettingsMessagesController applicationWillSuspend](&v3, sel_applicationWillSuspend);
  -[CKSettingsMessagesController endMatchingExtensions](self, "endMatchingExtensions");
}

- (void)applicationDidResume
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSettingsMessagesController;
  -[CNFRegListController applicationDidResume](&v3, sel_applicationDidResume);
  if (!self->_showingChildViewController)
    -[CKSettingsMessagesController findSpamExtensions](self, "findSpamExtensions");
}

- (void)systemApplicationWillEnterForeground
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSettingsMessagesController;
  -[CNFRegListController systemApplicationWillEnterForeground](&v5, sel_systemApplicationWillEnterForeground);
  -[CKSettingsMessagesController _setupAccountHandlers](self, "_setupAccountHandlers");
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isConnected");

  if (v4)
    -[CKSettingsMessagesController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)systemApplicationDidEnterBackground
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSettingsMessagesController;
  -[CNFRegListController systemApplicationDidEnterBackground](&v3, sel_systemApplicationDidEnterBackground);
  -[CNFRegListController removeAllHandlers](self, "removeAllHandlers");
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)_showPrivacySheetForiMessageFaceTime:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x24BE6E478]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (void)_openPhoneNumberActivationLearnMorePage:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BE30378], "sharedInstance", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  CNFStringKeyForProduct(CFSTR("phone-number-activation-learn-more"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
  }
  else
  {
    CNFRegStringTableName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CommunicationsSetupUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CNFLocalizedStringFromTableInBundleWithFallback(CFSTR("PHONE_NUMBER_ACTIVATION_LEARN_MORE_URL"), v6, v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8 = (void *)*MEMORY[0x24BEBDF78];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openURL:withCompletionHandler:", v9, 0);

}

- (void)systemPolicyForApp:(id)a3 didUpdateForSystemPolicyOptions:(unint64_t)a4 withValue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 134218242;
      v12 = a4;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_INFO, "System policy %ld did update with value: %@", (uint8_t *)&v11, 0x16u);
    }

  }
  if ((a4 & 0x400000000) != 0)
    -[CKSettingsMessagesController notifyDNDFocusStatusAuthorizationChanged](self, "notifyDNDFocusStatusAuthorizationChanged");

}

- (void)notifyDNDFocusStatusAuthorizationChanged
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2138BA000, v0, v1, "Unable to update focus status following authorization change, forward declared selector unavailable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)newDNDGlobalConfigurationService
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;

  v2 = (void *)CUTWeakLinkClass();
  if (v2)
  {
    objc_msgSend(v2, "serviceForClientIdentifier:", CFSTR("com.apple.donotdisturb.preferences"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v4 = v3;
      v5 = v4;
    }
    else
    {
      IMLogHandleForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CKSettingsMessagesController newDNDGlobalConfigurationService].cold.2();

      v5 = 0;
    }
  }
  else
  {
    IMLogHandleForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CKSettingsMessagesController newDNDGlobalConfigurationService].cold.1();
    v5 = 0;
  }

  return v5;
}

- (id)specifiers
{
  id *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_class *v15;
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
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL8 v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  id v73;
  void *v74;
  void *v75;
  BOOL v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i;
  void *v92;
  void *v93;
  __CFString *v94;
  void *v95;
  void *v96;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t v103[128];
  uint8_t buf[16];
  const __CFString *v105;
  _QWORD v106[3];
  NSRange v107;
  NSRange v108;

  v106[1] = *MEMORY[0x24BDAC8D0];
  v3 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v4 = *v3;
  if (*v3)
    return v4;
  v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[CKSettingsMessagesController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("Messages"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  -[CKSettingsMessagesController systemPolicy](self, "systemPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "specifiersForPolicyOptions:force:", 0x400800001, 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (v98)
  {
    objc_msgSend(v98, "arrayByAddingObjectsFromArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");

    v7 = (void *)v10;
  }
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "accountModificationRestricted") ^ 1;

  if (-[CKSettingsMessagesController shouldShowMadridSwitch](self, "shouldShowMadridSwitch"))
  {
    objc_msgSend(v7, "specifierForID:", CFSTR("MADRID_ENABLED_GROUP"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    -[CKSettingsMessagesController _switchFooterText:](self, "_switchFooterText:", buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)buf == 2)
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setProperty:forKey:", v27, *MEMORY[0x24BE75A30]);

      CommunicationsSetupUIBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("PHONE_NUMBER_ACTIVATION_LEARN_MORE"), &stru_24D077260, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingString:", v31);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v108.location = objc_msgSend(v21, "rangeOfString:", v30);
      NSStringFromRange(v108);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setProperty:forKey:", v32, *MEMORY[0x24BE75A40]);

      objc_msgSend(v13, "setProperty:forKey:", v21, *MEMORY[0x24BE75A58]);
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setProperty:forKey:", v33, *MEMORY[0x24BE75A50]);

      NSStringFromSelector(sel__openPhoneNumberActivationLearnMorePage_);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setProperty:forKey:", v34, *MEMORY[0x24BE75A38]);

    }
    else if (*(_QWORD *)buf == 1)
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setProperty:forKey:", v16, *MEMORY[0x24BE75A30]);

      CommunicationsSetupUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_24D077260, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingString:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v107.location = objc_msgSend(v21, "rangeOfString:", v19);
      NSStringFromRange(v107);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setProperty:forKey:", v22, *MEMORY[0x24BE75A40]);

      objc_msgSend(v13, "setProperty:forKey:", v21, *MEMORY[0x24BE75A58]);
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setProperty:forKey:", v23, *MEMORY[0x24BE75A50]);

      NSStringFromSelector(sel__showPrivacySheetForiMessageFaceTime_);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setProperty:forKey:", v24, *MEMORY[0x24BE75A38]);

    }
    else
    {
      objc_msgSend(v13, "setProperty:forKey:", 0, *MEMORY[0x24BE75A30]);
      objc_msgSend(v13, "setProperty:forKey:", v14, *MEMORY[0x24BE75A68]);
      v21 = v14;
    }
    objc_msgSend(v7, "specifierForID:", CFSTR("MADRID_ENABLED_SWITCH"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setProperty:forKey:", v36, *MEMORY[0x24BE75A18]);

  }
  else
  {
    -[CKSettingsMessagesController madridSwitchSpecifierIdentifiers](self, "madridSwitchSpecifierIdentifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v25);

  }
  if (!-[CKSettingsMessagesController shouldShowDeliveryReceipts](self, "shouldShowDeliveryReceipts"))
  {
    -[CKSettingsMessagesController deliveryReceiptSpecifierIdentifiers](self, "deliveryReceiptSpecifierIdentifiers");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v37);

  }
  if (!-[CKSettingsMessagesController shouldShowReadReceipts](self, "shouldShowReadReceipts"))
  {
    -[CKSettingsMessagesController readReceiptSpecifierIdentifiers](self, "readReceiptSpecifierIdentifiers");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v38);

  }
  if (!-[CKSettingsMessagesController shouldShowContactPhotoSettings](self, "shouldShowContactPhotoSettings"))
  {
    -[CKSettingsMessagesController contactPhotoSettingsSpecifierIdentifiers](self, "contactPhotoSettingsSpecifierIdentifiers");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v39);

  }
  if (-[CKSettingsMessagesController shouldShowMadridAccounts](self, "shouldShowMadridAccounts"))
  {
    objc_msgSend(v7, "specifierForID:", CFSTR("MADRID_ACCOUNTS_BUTTON"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setProperty:forKey:", v41, *MEMORY[0x24BE75A18]);

  }
  else
  {
    -[CKSettingsMessagesController madridEnabledSpecifierIdentifiers](self, "madridEnabledSpecifierIdentifiers");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v40);
  }

  if (!-[CKSettingsMessagesController shouldShowUpdateAppleID](self, "shouldShowUpdateAppleID"))
  {
    v106[0] = CFSTR("MADRID_UPDATE_APPLEID_BUTTON");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v106, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v42);
    goto LABEL_25;
  }
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v7, "specifierForID:", CFSTR("MADRID_UPDATE_APPLEID_BUTTON"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    MessagesSettingsLocalizedString(CFSTR("MADRID_UPDATE_APPLEID_APPLEACCOUNT"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setProperty:forKey:", v43, *MEMORY[0x24BE75D50]);
    objc_msgSend(v42, "setName:", v43);

LABEL_25:
  }
  v105 = CFSTR("MESSAGES_IN_ICLOUD");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v105, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  _removeSpecifiersWithIdentifiers(v7, v44);

  v45 = -[CKSettingsMessagesController shouldShowCharacterCount](self, "shouldShowCharacterCount");
  if (!v45)
  {
    -[CKSettingsMessagesController characterCountSpecifierIdentifiers](self, "characterCountSpecifierIdentifiers");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v46);

  }
  if (-[CKSettingsMessagesController shouldShowBlocklistSettings](self, "shouldShowBlocklistSettings"))
  {
    v45 = 1;
  }
  else
  {
    -[CKSettingsMessagesController blocklistSettingsSpecifierIdentifiers](self, "blocklistSettingsSpecifierIdentifiers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v47);

  }
  if (-[CKSettingsMessagesController shouldShowSendAsSMS](self, "shouldShowSendAsSMS"))
  {
    objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "isLazuliEnabled");

    if (v49)
    {
      -[CKSettingsMessagesController lazuliEnablementManager](self, "lazuliEnablementManager");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "isRCSSupportedForAnyActiveSubscription");

      if (v51)
        objc_msgSend(v7, "specifierForID:", CFSTR("PRE_LAZULI_SEND_AS_SMS_GROUP"));
      else
        objc_msgSend(v7, "specifierForID:", CFSTR("SEND_AS_SMS_GROUP"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v52);
    }
    else
    {
      objc_msgSend(v7, "specifierForID:", CFSTR("SEND_AS_SMS_GROUP"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v52);
    }
  }
  else
  {
    -[CKSettingsMessagesController sendAsSMSIdentifiers](self, "sendAsSMSIdentifiers");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v52);
  }

  if (!-[CKSettingsMessagesController shouldShowiMessageApps](self, "shouldShowiMessageApps"))
  {
    -[CKSettingsMessagesController iMessageAppsIdentifiers](self, "iMessageAppsIdentifiers");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v53);

  }
  if (-[CKSettingsMessagesController shouldShowAudioMessageSettings](self, "shouldShowAudioMessageSettings"))
  {
    if (-[CKSettingsMessagesController shouldShowRaiseToListenSwitch](self, "shouldShowRaiseToListenSwitch"))
    {
      MessagesSettingsLocalizedString(CFSTR("RAISE_TO_LISTEN_DESCRIPTION"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "specifierForID:", CFSTR("AUDIO_MESSAGES_GROUP"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setProperty:forKey:", v54, *MEMORY[0x24BE75A68]);

    }
    else
    {
      -[CKSettingsMessagesController raiseToListenSpecifierIdentifiers](self, "raiseToListenSpecifierIdentifiers");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      _removeSpecifiersWithIdentifiers(v7, v54);
    }
  }
  else
  {
    -[CKSettingsMessagesController audioMessageSettingsSpecifierIdentifiers](self, "audioMessageSettingsSpecifierIdentifiers");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v54);
  }

  -[CKFilteringListController extensionIDArray](self->_filteringController, "extensionIDArray");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[CKSettingsMessagesController shouldShowiMessageFilteringSettings:](self, "shouldShowiMessageFilteringSettings:", v56);

  objc_msgSend(v7, "specifierForID:", CFSTR("MADRID_FILTER_GROUP"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v57)
  {
    MessagesSettingsLocalizedString(CFSTR("MADRID_FILTER"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = *MEMORY[0x24BE75A68];
    objc_msgSend(v59, "setProperty:forKey:", v60, *MEMORY[0x24BE75A68]);

    -[CKSettingsMessagesController spamFilteringSpecifierIdentifiers](self, "spamFilteringSpecifierIdentifiers");
  }
  else
  {
    v61 = *MEMORY[0x24BE75A68];
    objc_msgSend(v58, "setProperty:forKey:", 0, *MEMORY[0x24BE75A68]);
    -[CKSettingsMessagesController iMessageFilteringSpecifierIdentifiers](self, "iMessageFilteringSpecifierIdentifiers");
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  _removeSpecifiersWithIdentifiers(v7, v62);

  if (!-[CKSettingsMessagesController shouldShowJunkConversationsRow](self, "shouldShowJunkConversationsRow"))
  {
    -[CKSettingsMessagesController junkConversationsRowIdentifier](self, "junkConversationsRowIdentifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v63);

  }
  if (!-[CKSettingsMessagesController shouldShowJunkFilteringReceipts](self, "shouldShowJunkFilteringReceipts"))
  {
    objc_msgSend(v7, "specifierForID:", CFSTR("JUNK_FILTERING_RECEIPTS_GROUP"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setProperty:forKey:", 0, v61);
    -[CKSettingsMessagesController junkFilterReceiptsRowIdentifier](self, "junkFilterReceiptsRowIdentifier");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v65);

  }
  if (!-[CKSettingsMessagesController shouldShowSiriSettings](self, "shouldShowSiriSettings"))
  {
    -[CKSettingsMessagesController siriSettingsIdentifiers](self, "siriSettingsIdentifiers");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v66);

  }
  if (!-[CKSettingsMessagesController shouldShowSMSRelaySettings](self, "shouldShowSMSRelaySettings"))
  {
    -[CKSettingsMessagesController smsRelaySettingsSpecifierIdentifiers](self, "smsRelaySettingsSpecifierIdentifiers");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v67);

  }
  if (!-[CKSettingsMessagesController shouldShowGenericSettings](self, "shouldShowGenericSettings"))
  {
    -[CKSettingsMessagesController genericSettingsSpecifierIdentifiers](self, "genericSettingsSpecifierIdentifiers");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v68);

  }
  if (-[CKSettingsMessagesController shouldShowMadridSignin](self, "shouldShowMadridSignin"))
  {
    v69 = _os_feature_enabled_impl();
    CommunicationsSetupUIBundle();
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
      v72 = CFSTR("FACETIME_ACCOUNT_INFO_UNAVAILABLE_APPLEACCOUNT");
    else
      v72 = CFSTR("FACETIME_ACCOUNT_INFO_UNAVAILABLE");
    objc_msgSend(v70, "localizedStringForKey:value:table:", v72, &stru_24D077260, v71);
    v73 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "specifierForID:", CFSTR("MADRID_SIGNIN_BUTTON"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setProperty:forKey:", v75, *MEMORY[0x24BE75A18]);

    objc_msgSend(v74, "setProperty:forKey:", v73, *MEMORY[0x24BE75D50]);
    objc_msgSend(v74, "setName:", v73);

  }
  else
  {
    -[CKSettingsMessagesController madridSigninSpecifiers](self, "madridSigninSpecifiers");
    v73 = (id)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v73);
  }

  v76 = -[CKSettingsMessagesController shouldShowNicknames](self, "shouldShowNicknames");
  objc_msgSend(v7, "specifierForID:", CFSTR("NAME_AND_PHOTO_SHARING_GROUP"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v77;
  if (v76)
  {
    -[CKSettingsMessagesController getNameAndPhotoSharingFooterText](self, "getNameAndPhotoSharingFooterText");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setProperty:forKey:", v79, v61);
  }
  else
  {
    objc_msgSend(v77, "setProperty:forKey:", 0, v61);
    -[CKSettingsMessagesController nameAndPhotoSharingSpecifiers](self, "nameAndPhotoSharingSpecifiers");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v79);
  }

  objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "ctSubscriptionInfo");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingsMessagesController setCtSubscriptionInfo:](self, "setCtSubscriptionInfo:", v81);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
    {
      -[CKSettingsMessagesController ctSubscriptionInfo](self, "ctSubscriptionInfo");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v83;
      _os_log_impl(&dword_2138BA000, v82, OS_LOG_TYPE_INFO, "Sub info %@", buf, 0xCu);

    }
  }
  -[CKSettingsMessagesController _setupTextMessageGroupSpecifiers:wantsTextMessageBasicGroup:](self, "_setupTextMessageGroupSpecifiers:wantsTextMessageBasicGroup:", v7, v45);
  if (!-[CKSettingsMessagesController shouldShowSharedWithYouSettings](self, "shouldShowSharedWithYouSettings"))
  {
    -[CKSettingsMessagesController sharedWithYouSettingsSpecifierIdentifiers](self, "sharedWithYouSettingsSpecifierIdentifiers");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v84);

  }
  if (!-[CKSettingsMessagesController shouldShowInboxSummarySettings](self, "shouldShowInboxSummarySettings"))
  {
    -[CKSettingsMessagesController inboxSummarySettingsSpecifierIdentifiers](self, "inboxSummarySettingsSpecifierIdentifiers");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v7, v85);

  }
  if (-[CKSettingsMessagesController _isSMSDevice](self, "_isSMSDevice")
    || -[CKSettingsMessagesController _isMadridAccountOperational](self, "_isMadridAccountOperational"))
  {
    v86 = v7;
  }
  else
  {
    v87 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    -[CKSettingsMessagesController madridSwitchSpecifierIdentifiers](self, "madridSwitchSpecifierIdentifiers");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
    if (v89)
    {
      v90 = *(_QWORD *)v100;
      do
      {
        for (i = 0; i != v89; ++i)
        {
          if (*(_QWORD *)v100 != v90)
            objc_enumerationMutation(v88);
          objc_msgSend(v7, "specifierForID:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if (v92)
            objc_msgSend(v87, "addObject:", v92);

        }
        v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
      }
      while (v89);
    }

    v86 = v87;
  }
  if (-[CKSettingsMessagesController shouldShowCheckInLocationHistorySettings](self, "shouldShowCheckInLocationHistorySettings"))
  {
    -[CKSettingsMessagesController configureCheckInSpecifiers:](self, "configureCheckInSpecifiers:", v86);
  }
  else
  {
    -[CKSettingsMessagesController checkInLocationHistorySettingsSpecifierIdentifiers](self, "checkInLocationHistorySettingsSpecifierIdentifiers");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v86, v93);

  }
  if (-[CKSettingsMessagesController _shouldShowSatelliteDemoModeButton](self, "_shouldShowSatelliteDemoModeButton"))
  {
    v94 = CFSTR("TRY_DEMO_MODE_FOOTER_DESCRIPTION_WLAN");
    if ((objc_msgSend(MEMORY[0x24BE511E8], "IMDeviceIsGreenTea") & 1) == 0
      && !objc_msgSend(MEMORY[0x24BE511E8], "IMDeviceIsChinaRegion"))
    {
      v94 = CFSTR("TRY_DEMO_MODE_FOOTER_DESCRIPTION");
    }
    MessagesSettingsLocalizedString(v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "specifierForID:", CFSTR("SATELLITE_MESSAGING_TITLE_ID"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setProperty:forKey:", v95, v61);

  }
  else
  {
    -[CKSettingsMessagesController _satelliteDemoModeSpecifierIdentifiers](self, "_satelliteDemoModeSpecifierIdentifiers");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    _removeSpecifiersWithIdentifiers(v86, v95);
  }

  objc_storeStrong(v3, v86);
  v4 = *v3;
  return v4;
}

- (void)_setupTextMessageGroupSpecifiers:(id)a3 wantsTextMessageBasicGroup:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  CKSettingsMessagesController *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  id obj;
  uint64_t v49;
  unsigned int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v42 = a4;
  v64 = *MEMORY[0x24BDAC8D0];
  v46 = a3;
  v43 = self;
  -[IMCTXPCServiceSubscriptionInfo __im_subscriptionsWithMMSSupport](self->_ctSubscriptionInfo, "__im_subscriptionsWithMMSSupport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isLazuliEnabled");

  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[IMCTXPCServiceSubscriptionInfo __im_subscriptionsWithRCSSupport](v43->_ctSubscriptionInfo, "__im_subscriptionsWithRCSSupport");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v45, "count"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = v10;
        _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_INFO, "subscriptionsWithRCSSupport count %@", buf, 0xCu);

      }
    }
  }
  else
  {
    v45 = v6;
  }
  v44 = objc_msgSend(v5, "count");
  v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v11)
  {
    v50 = 0;
    v12 = 0;
    v49 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v52 != v49)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v14, &unk_24D094148, MEMORY[0x24BDBD1C0], MEMORY[0x24BDBD1C0]);
        v17 = objc_msgSend(v16, "BOOLValue");

        v18 = (void *)MEMORY[0x24BE511B0];
        objc_msgSend(v14, "phoneNumber");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "labelID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "IMUniqueIdentifierForPhoneNumber:simID:", v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("MMSEnabled-"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "phoneNumber");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "labelID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKSettingsMMSHelper mmsDefaultEnabledForPhoneNumber:simID:](CKSettingsMMSHelper, "mmsDefaultEnabledForPhoneNumber:simID:", v23, v24);

        if (IMGetDomainBoolForKeyWithDefaultValue())
        {
          objc_msgSend(v47, "addObject:", v14);
          ++v50;
        }

        v12 |= v17;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v11);
  }
  else
  {
    v50 = 0;
    v12 = 0;
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v44);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v50);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v47, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v45, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v56 = v26;
      v57 = 2112;
      v58 = v27;
      v59 = 2112;
      v60 = v28;
      v61 = 2112;
      v62 = v29;
      _os_log_impl(&dword_2138BA000, v25, OS_LOG_TYPE_INFO, "ShouldShowMMS %@ subscriptionsWithMMSEnabledCount %@ subscriptionsWithMMSOverrideEnabledCount %@ subscriptionsWithRCSEnabledCount %@", buf, 0x2Au);

    }
  }
  if (objc_msgSend(v45, "count"))
  {
    -[CKSettingsMessagesController rcsMessagingController](v43, "rcsMessagingController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCtSubscriptions:", v45);
  }
  else
  {
    objc_msgSend(v46, "specifierForID:", CFSTR("RCS_MESSAGING_CELL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "removeObject:", v30);
  }

  objc_msgSend(v46, "specifierForID:", CFSTR("MMS_MESSAGING"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44 == 1)
  {
    objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x24BE511B0];
    objc_msgSend(v32, "phoneNumber");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "labelID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "IMUniqueIdentifierForPhoneNumber:simID:", v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "setProperty:forKey:", v36, CFSTR("subscriptionIdentifier"));
LABEL_30:
    objc_msgSend(v46, "specifierForID:", CFSTR("MMS_MESSAGING_CELL"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "removeObject:", v37);
    goto LABEL_31;
  }
  objc_msgSend(v46, "removeObject:", v31);

  if (v44 != 2)
    goto LABEL_30;
  -[CKSettingsMessagesController mmsMessagingController](v43, "mmsMessagingController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setCtSubscriptions:", obj);
LABEL_31:

  if (!v50 && !-[CKSettingsMessagesController _isMadridAccountOperational](v43, "_isMadridAccountOperational"))
  {
    objc_msgSend(v46, "specifierForID:", CFSTR("SHOW_SUBJECT_FIELD"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "removeObject:", v38);

  }
  if (v42)
  {
    if (v44)
    {
      if ((v12 & 1) != 0)
        goto LABEL_41;
      goto LABEL_40;
    }
    if (objc_msgSend(v45, "count"))
      goto LABEL_40;
  }
  objc_msgSend(v46, "specifierForID:", CFSTR("MMS_BASIC_GROUP"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "removeObject:", v39);

  if (((v44 != 0) & v12) == 0)
  {
LABEL_40:
    objc_msgSend(v46, "specifierForID:", CFSTR("MMS_EMAIL_GROUP"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "removeObject:", v40);

    objc_msgSend(v46, "specifierForID:", CFSTR("MMS_EMAIL_CELL"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "removeObject:", v41);

  }
LABEL_41:

}

- (void)setSpecifierLoading:(id)a3 loading:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = *MEMORY[0x24BE75998];
  v13 = v8;
  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75998]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11 != v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProperty:forKey:", v12, v9);

    -[CKSettingsMessagesController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v13, v5);
  }

}

- (BOOL)shouldShowDeliveryReceipts
{
  return 0;
}

- (id)deliveryReceiptSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("DELIVERY_RECEIPTS_SWITCH"));
}

- (id)isDeliveryReportsEnabled:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  unsigned __int8 v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDC2770], "sharedMessageCenter", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeliveryReportsEnabled:", &v7);

  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x24BDC2770], "sharedMessageCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "isDeliveryReportsEnabled:", &v7);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDeliveryReportsEnabled:(id)a3 specifier:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  __CFNotificationCenter *DarwinNotifyCenter;

  v5 = (void *)MEMORY[0x24BDC2770];
  v6 = a3;
  objc_msgSend(v5, "sharedMessageCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v7, "setDeliveryReportsEnabled:", v8);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.EnableDeliveryReports.changed"), 0, 0, 1u);
  -[CKSettingsMessagesController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)satelliteDemoModeTappedWithSpecifier:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  uint8_t v8[16];

  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_INFO, "Pressed satellite demo mode", v8, 2u);
    }

  }
  v5 = objc_alloc_init(MEMORY[0x24BDC27C8]);
  objc_msgSend(v5, "setReason:", 8);
  objc_msgSend(v5, "setMetadata:", &unk_24D094238);
  v6 = objc_alloc(MEMORY[0x24BDC2810]);
  v7 = (void *)objc_msgSend(v6, "initWithQueue:", MEMORY[0x24BDAC9B8]);
  objc_msgSend(v7, "requestStewieWithContext:completion:", v5, &__block_literal_global_16);

}

void __69__CKSettingsMessagesController_satelliteDemoModeTappedWithSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  if (v2)
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __69__CKSettingsMessagesController_satelliteDemoModeTappedWithSpecifier___block_invoke_cold_1(v2, v3);
  }
  else
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_5;
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_INFO, "Presenting Satellite Demo app", v4, 2u);
    }
  }

LABEL_5:
}

- (BOOL)_shouldShowSatelliteDemoModeButton
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCarrierPigeonEnabled");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE502B0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((objc_msgSend(v5, "isDemoAllowedForService:", 16) & 1) == 0
        && (objc_msgSend(v5, "isDemoAllowedForService:", 32) & 1) == 0)
      {
        goto LABEL_14;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((objc_msgSend(v5, "isPermittedAtCurrentLocation:", 16) & 1) != 0
          || (objc_msgSend(v5, "isPermittedAtCurrentLocation:", 32) & 1) != 0)
        {
          LOBYTE(v3) = 1;
LABEL_15:

          return v3;
        }
LABEL_14:
        LOBYTE(v3) = 0;
        goto LABEL_15;
      }
      IMLogHandleForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CKSettingsMessagesController _shouldShowSatelliteDemoModeButton].cold.1();
    }
    else
    {
      IMLogHandleForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CKSettingsMessagesController _shouldShowSatelliteDemoModeButton].cold.2();
    }

    goto LABEL_14;
  }
  return v3;
}

- (id)_satelliteDemoModeSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("SATELLITE_MESSAGING_TITLE_ID"), CFSTR("TRY_DEMO_MODE_BUTTON_ACTION_ID"), 0);
}

- (id)getMMSDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ctSubscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("MMS"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v5, v6, 0, 0);

  return v8;
}

- (id)isMMSEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ctSubscriptionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscriptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BE511B0];
    objc_msgSend(v7, "phoneNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "labelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "IMUniqueIdentifierForPhoneNumber:simID:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("MMSEnabled-"), v11);
  }
  else
  {
    v11 = 0;
    v12 = CFSTR("MMSEnabled");
  }
  keyExistsAndHasValidFormat = 0;
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportsMMS");

  v15 = CFPreferencesGetAppBooleanValue(v12, CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ctSubscriptionInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subscriptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "phoneNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "labelID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[CKSettingsMMSHelper mmsDefaultEnabledForPhoneNumber:simID:](CKSettingsMMSHelper, "mmsDefaultEnabledForPhoneNumber:simID:", v20, v21);

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v28 = v11;
      v29 = 2112;
      if ((v14 & v15) != 0)
        v23 = CFSTR("YES");
      v30 = v12;
      v31 = 2112;
      v32 = v23;
      _os_log_impl(&dword_2138BA000, v22, OS_LOG_TYPE_INFO, "isMMSEnabled for uniqueID %@ key %@: %@", buf, 0x20u);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14 & v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)setMMSEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  NSObject *v17;
  int v18;
  const __CFString *v19;
  NSObject *v20;
  int v21;
  const __CFString *v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ctSubscriptionInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subscriptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BE511B0];
    objc_msgSend(v11, "phoneNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "labelID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "IMUniqueIdentifierForPhoneNumber:simID:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("MMSEnabled-"), v15);
  }
  else
  {
    v15 = 0;
    v16 = CFSTR("MMSEnabled");
  }
  CFPreferencesSetAppValue(v16, v6, CFSTR("com.apple.MobileSMS"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(v6, "BOOLValue");
      v19 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v27 = v15;
      v28 = 2112;
      if (v18)
        v19 = CFSTR("YES");
      v29 = v16;
      v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_INFO, "setMMSEnabled for uniqueID %@ key %@: %@", buf, 0x20u);
    }

  }
  if ((objc_msgSend(v6, "BOOLValue") & 1) == 0
    && !-[CKSettingsMessagesController _isMadridAccountOperational](self, "_isMadridAccountOperational"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = objc_msgSend(v6, "BOOLValue");
        *(_DWORD *)buf = 138412802;
        v27 = v15;
        v28 = 2112;
        v29 = CFSTR("MMSShowSubject");
        if (v21)
          v22 = CFSTR("YES");
        else
          v22 = CFSTR("NO");
        v30 = 2112;
        v31 = v22;
        _os_log_impl(&dword_2138BA000, v20, OS_LOG_TYPE_INFO, "setShowSubject for uniqueID %@ key %@: %@", buf, 0x20u);
      }

    }
    CFPreferencesSetAppValue(CFSTR("MMSShowSubject"), v6, CFSTR("com.apple.MobileSMS"));
  }
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.MMSEnabled.changed"), 0, 0, 1u);
  -[CKSettingsMessagesController reloadSpecifiers](self, "reloadSpecifiers");
  -[CKSettingsMessagesController _syncManager](self, "_syncManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("MMSEnabled"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.MobileSMS"), v25);

}

- (id)willSendGroupMMS:(id)a3
{
  id v4;
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
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ctSubscriptionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BE511B0];
    objc_msgSend(v8, "phoneNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "labelID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "IMUniqueIdentifierForPhoneNumber:simID:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
  }
  else
  {
    -[CKSettingsMessagesController getMMSDictionary](self, "getMMSDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v12 = 0;
  }
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v8, &unk_24D094160, MEMORY[0x24BDBD1C0], MEMORY[0x24BDBD1C0]);
    v16 = (void *)objc_msgSend(v15, "BOOLValue");

  }
  else
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("GroupModeEnabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_9;
    objc_msgSend(v13, "objectForKey:", CFSTR("GroupModeEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "BOOLValue");
  }

LABEL_9:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = CFSTR("NO");
      if ((_DWORD)v16)
        v18 = CFSTR("YES");
      v21 = 138412546;
      v22 = v12;
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_INFO, "willSendGroupMMS for uniqueID %@ : %@", (uint8_t *)&v21, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)getRaiseToListenEnabled:(id)a3
{
  _BOOL8 v4;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  keyExistsAndHasValidFormat = 0;
  v4 = CFPreferencesGetAppBooleanValue(CFSTR("RaiseToListenEnabled"), CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
    v4 = -[CKSettingsMessagesController _isRaiseGestureSupported](self, "_isRaiseGestureSupported", v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setRaiseToListenEnabled:(id)a3 specifier:(id)a4
{
  __CFNotificationCenter *DarwinNotifyCenter;

  CFPreferencesSetAppValue(CFSTR("RaiseToListenEnabled"), a3, CFSTR("com.apple.MobileSMS"));
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.RaiseToListenEnabled.changed"), 0, 0, 1u);
}

+ (BOOL)currentMessageAutoKeepForType:(int)a3
{
  int AppBooleanValue;
  BOOL v4;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AutomaticallySaveAudioMessagesEnabled"), CFSTR("com.apple.imessage"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 1;
  return !v4;
}

+ (int)currentMessageAutoKeepOptionForType:(int)a3
{
  void *v3;
  int v4;

  if (!+[CKSettingsMessagesController currentMessageAutoKeepForType:](CKSettingsMessagesController, "currentMessageAutoKeepForType:", *(_QWORD *)&a3))return 0;
  +[CKSettingsMessagesController currentKeepMessages](CKSettingsMessagesController, "currentKeepMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "integerValue") == 30)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "integerValue") == 365)
  {
    v4 = 2;
  }
  else
  {
    v4 = 3;
  }

  return v4;
}

- (id)getAudioMessageAutoKeep:(id)a3
{
  CFPreferencesSynchronize(CFSTR("com.apple.imessage"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[CKSettingsMessagesController currentMessageAutoKeepOptionForType:](CKSettingsMessagesController, "currentMessageAutoKeepOptionForType:", 1));
}

- (void)setAudioMessageAutoKeep:(id)a3 specifier:(id)a4
{
  const void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(a3, "integerValue"))
    v5 = (const void *)MEMORY[0x24BDBD1C8];
  else
    v5 = (const void *)MEMORY[0x24BDBD1C0];
  CFPreferencesSetAppValue(CFSTR("AutomaticallySaveAudioMessagesEnabled"), v5, CFSTR("com.apple.imessage"));
  CFPreferencesSynchronize(CFSTR("com.apple.imessage"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  -[CKSettingsMessagesController _syncManager](self, "_syncManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("AutomaticallySaveAudioMessagesEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.imessage"), v6);

}

- (id)_syncManager
{
  objc_class *v2;

  v2 = (objc_class *)CUTWeakLinkClass();
  if (v2)
    v2 = (objc_class *)objc_alloc_init(v2);
  return v2;
}

- (BOOL)_isSMSDevice
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsSMS");

  return v3;
}

- (BOOL)_isMadridAccountOperational
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isServiceSupported") & 1) != 0)
  {
    -[CNFRegListController regController](self, "regController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isServiceEnabled");

    if (v5)
    {
      -[CNFRegListController regController](self, "regController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "accountState");

      return (v7 & 0x60000000) == 0x40000000;
    }
  }
  else
  {

  }
  return 0;
}

- (BOOL)_isMadridSwitchOn
{
  void *v3;
  char v4;
  void *v5;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isServiceEnabled") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[CNFRegListController regController](self, "regController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isAccountKeyCDPSyncingOrWaitingForUser");

  }
  return v4;
}

- (BOOL)shouldShowMadridSwitch
{
  void *v2;
  char v3;

  -[CNFRegListController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isServiceSupported");

  return v3;
}

- (id)madridSwitchSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("MADRID_ENABLED_GROUP"), CFSTR("MADRID_ENABLED_SWITCH"), 0);
}

- (id)isMadridEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CKSettingsMessagesController _isMadridSwitchOn](self, "_isMadridSwitchOn", a3));
}

- (void)setMadridEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  int v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  CNFRegSettingsController *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  __CFString *v37;
  CNFRegController *v38;
  uint8_t buf[4];
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  OSLogHandleForIDSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v6, "intValue");
    v10 = CFSTR("YES");
    if (!v9)
      v10 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v40 = v10;
    _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "setMadridEnabled: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v11 = objc_msgSend(v6, "intValue");
    v12 = CFSTR("YES");
    if (!v11)
      v12 = CFSTR("NO");
    v36 = v12;
    IMLogString();
  }
  v13 = objc_msgSend(v6, "BOOLValue", v36);
  if (!v13 || !-[CNFRegListController _showWiFiAlertIfNecessary](self, "_showWiFiAlertIfNecessary"))
  {
    -[CKSettingsMessagesController _clearMessagesAppExtensionSalt](self, "_clearMessagesAppExtensionSalt");
    -[CNFRegListController regController](self, "regController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetUserLoginIntent();
    if (!v13)
    {
      OSLogHandleForIDSCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v18, OS_LOG_TYPE_DEFAULT, "Deactivating accounts", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      -[CKSettingsMessagesController _setupAccountHandlersForDisabling](self, "_setupAccountHandlersForDisabling");
      objc_msgSend(v15, "deactivateAccounts");
      goto LABEL_32;
    }
    -[CKSettingsMessagesController _setupAccountHandlers](self, "_setupAccountHandlers");
    objc_msgSend(v15, "accounts");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    OSLogHandleForIDSCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v16;
      _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_DEFAULT, "Attempting to enable iMessage for accounts %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v37 = v16;
      IMLogString();
    }
    if (v16 && -[__CFString count](v16, "count"))
    {
      objc_msgSend(v15, "activateAccounts");

LABEL_32:
      -[CKSettingsMessagesController notifyThatConversationFilteringChanged](self, "notifyThatConversationFilteringChanged", v37);
      -[CKSettingsMessagesController reloadSpecifiers](self, "reloadSpecifiers");
LABEL_46:

      goto LABEL_47;
    }
    -[CNFRegListController regController](self, "regController", v37);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isConnected"))
    {
      if (!-[CKSettingsMessagesController _isSMSDevice](self, "_isSMSDevice"))
      {

LABEL_44:
        -[CKSettingsMessagesController _showMadridSetupIfNecessary:](self, "_showMadridSetupIfNecessary:", 0);
        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x24BE4FE08], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "supportsIdentification");

      if ((v21 & 1) == 0)
        goto LABEL_44;
    }
    else
    {

    }
    -[CNFRegListController regController](self, "regController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "serviceSupportsDeviceAliasEnablement") & 1) != 0)
    {
      -[CNFRegListController regController](self, "regController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "usableDeviceAliases");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count") == 0;

      if (!v25)
      {
        v38 = -[CNFRegController initWithServiceType:]([CNFRegController alloc], "initWithServiceType:", 1);
        -[CNFRegController connect:](v38, "connect:", 1);
        v26 = -[CNFRegListController initWithRegController:]([CNFRegSettingsController alloc], "initWithRegController:", v38);
        -[CKSettingsMessagesController rootController](self, "rootController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNFRegSettingsController setRootController:](v26, "setRootController:", v27);

        -[CNFRegSettingsController setParentController:](v26, "setParentController:", self);
        -[CKSettingsMessagesController specifier](self, "specifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNFRegListController setSpecifier:](v26, "setSpecifier:", v28);

        -[CNFRegSettingsController setShowEnableSwitch:](v26, "setShowEnableSwitch:", 0);
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v26);
        +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "navigationBarStyle");
        objc_msgSend(v29, "navigationBar");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setBarStyle:", v31);

        v33 = objc_msgSend(v30, "navigationBarIsTranslucent");
        objc_msgSend(v29, "navigationBar");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setTranslucent:", v33);

        -[CNFRegListController regController](self, "regController");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "connect:", 1);

        -[CKSettingsMessagesController presentModalViewController:withTransition:](self, "presentModalViewController:withTransition:", v29, 3);
        -[CKSettingsMessagesController reloadSpecifiers](self, "reloadSpecifiers");

LABEL_45:
        goto LABEL_46;
      }
    }
    else
    {

    }
    -[CKSettingsMessagesController reloadSpecifiers](self, "reloadSpecifiers");
    goto LABEL_45;
  }
  -[CKSettingsMessagesController reloadSpecifier:](self, "reloadSpecifier:", v7);
  OSLogHandleForIDSCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "No reasonable network found - not enabling iMessage", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
LABEL_47:

}

- (BOOL)_isIDSDelayRegistrationEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)_isRegistrationInProgress
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[CNFRegListController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "registrationStatus", (_QWORD)v14) >= 2)
          v7 |= objc_msgSend(v11, "CNFRegSignInComplete") ^ 1;
        v8 |= objc_msgSend(v11, "CNFRegSignInComplete");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
    v12 = v8 ^ 1u;
  }
  else
  {
    LOBYTE(v7) = 0;
    LOBYTE(v12) = 1;
  }

  return v7 & v12 & 1;
}

- (id)_failedAccounts
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[CNFRegListController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failedAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "registrationFailureReason", (_QWORD)v12) != 14)
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = (id)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

- (id)_registrationFailures
{
  int64_t v3;
  int64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  if (!-[CKSettingsMessagesController _isIDSDelayRegistrationEnabled](self, "_isIDSDelayRegistrationEnabled")
    || (v3 = -[CKSettingsMessagesController _debugFailureReason](self, "_debugFailureReason"), v3 == -1))
  {
    -[CKSettingsMessagesController _failedAccounts](self, "_failedAccounts");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = v7;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v12, "registrationFailureReason", (_QWORD)v16);
            if (-[CKSettingsMessagesController _isIDSDelayRegistrationEnabled](self, "_isIDSDelayRegistrationEnabled")
              || (objc_msgSend(v12, "isAccountKeyCDPSyncingOrWaitingForUser") & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "registrationFailureReason"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        }
        while (v9);
      }

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v21 = v7;
          v22 = 2112;
          v23 = v8;
          _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_INFO, "Failed accounts: %@ with registration failures: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      v8 = (id)MEMORY[0x24BDBD1A8];
    }
  }
  else
  {
    v4 = v3;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_INFO, "Using debug registration failure: %@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v25[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)_registrationFailures:(id)a3 containsFailure:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "containsObject:", v7);

  return (char)v5;
}

- (BOOL)_registrationFailures:(id)a3 areAllOfKind:(int64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          if ((int)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "intValue", (_QWORD)v13) != a4)
          {
            v11 = 0;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    v11 = 1;
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_switchFooterText:(unint64_t *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  char v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  _BOOL4 v24;

  CommunicationsSetupUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACETIME_SWITCH_STATUS_DEFAULT"), &stru_24D077260, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "supportsSMSIdentification");

    if (v9)
    {
      CommunicationsSetupUIBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FACETIME_SWITCH_STATUS_DEFAULT_WITH_WARNING"), &stru_24D077260, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
    }
  }
  v13 = -[CKSettingsMessagesController _isRegistrationInProgress](self, "_isRegistrationInProgress");
  -[CKSettingsMessagesController _registrationFailures](self, "_registrationFailures");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    CommunicationsSetupUIBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("FACETIME_SWITCH_STATUS_IN_PROGRESS"), &stru_24D077260, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v19 = 2;
LABEL_20:
      *a3 = v19;
    }
  }
  else if (objc_msgSend(v14, "count"))
  {
    if (-[CKSettingsMessagesController _registrationFailures:containsFailure:](self, "_registrationFailures:containsFailure:", v15, 28))
    {
      v20 = _os_feature_enabled_impl();
      CommunicationsSetupUIBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v20 & 1) != 0)
        v23 = CFSTR("UPDATE_APPLEID_DESCRIPTION_APPLEACCOUNT");
      else
        v23 = CFSTR("UPDATE_APPLEID_DESCRIPTION");
    }
    else
    {
      v24 = -[CKSettingsMessagesController _registrationFailures:containsFailure:](self, "_registrationFailures:containsFailure:", v15, 29);
      CommunicationsSetupUIBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        v23 = CFSTR("WAITING_FOR_ICLOUD_DESCRIPTION");
      else
        v23 = CFSTR("FACETIME_SWITCH_STATUS_FAILED");
    }
    objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_24D077260, v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v19 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    if (a3)
    {
      v19 = 1;
      v18 = v7;
      goto LABEL_20;
    }
    v18 = v7;
  }

  return v18;
}

- (void)_updateSwitchDelayed
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateSwitch, 0);
  -[CKSettingsMessagesController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateSwitch, 0, 0.75);
}

- (id)genericSettingsSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("GENERIC_SETTINGS"));
}

- (id)characterCountSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("CHARACTER_COUNT_SWITCH"));
}

- (BOOL)shouldShowBlocklistSettings
{
  return -[CKSettingsMessagesController _isSMSDevice](self, "_isSMSDevice")
      || -[CKSettingsMessagesController _isMadridAccountOperational](self, "_isMadridAccountOperational");
}

- (id)blocklistSettingsSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("BLOCKLIST_SETTINGS"));
}

- (BOOL)_isRaiseGestureSupported
{
  if (_isRaiseGestureSupported_once != -1)
    dispatch_once(&_isRaiseGestureSupported_once, &__block_literal_global_364);
  return _isRaiseGestureSupported_isRaiseGestureSupported;
}

void __56__CKSettingsMessagesController__isRaiseGestureSupported__block_invoke()
{
  uint64_t v0;
  id v1;

  if (objc_msgSend(MEMORY[0x24BDC13D8], "isGestureServiceAvailable"))
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    v0 = objc_msgSend(v1, "isProximityMonitoringEnabled");
    objc_msgSend(v1, "setProximityMonitoringEnabled:", 1);
    _isRaiseGestureSupported_isRaiseGestureSupported = objc_msgSend(v1, "isProximityMonitoringEnabled");
    objc_msgSend(v1, "setProximityMonitoringEnabled:", v0);

  }
}

- (id)raiseToListenSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("RAISE_TO_LISTEN_SWITCH"));
}

+ (id)getDefaultExtension
{
  return (id)(id)CFPreferencesCopyAppValue(CFSTR("spamFiltrationExtensionID"), CFSTR("com.apple.MobileSMS"));
}

- (void)notifyThatConversationFilteringChanged
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.IncomingMessageAlertFiltration.changed"), 0, 0, 1u);
}

- (void)endMatchingExtensions
{
  CKNSExtension *ckExtension;

  if (-[CKFilteringListController deviceSupportsSMSFilteringExtensions](self->_filteringController, "deviceSupportsSMSFilteringExtensions"))
  {
    -[CKNSExtension endMatchingExtensions](self->_ckExtension, "endMatchingExtensions");
    ckExtension = self->_ckExtension;
    self->_ckExtension = 0;

  }
}

- (void)findSpamExtensions
{
  CKNSExtension *v3;
  CKNSExtension *ckExtension;
  void *v5;
  _QWORD v6[5];

  if (-[CKFilteringListController deviceSupportsSMSFilteringExtensions](self->_filteringController, "deviceSupportsSMSFilteringExtensions"))
  {
    if (!self->_ckExtension)
    {
      v3 = objc_alloc_init(CKNSExtension);
      ckExtension = self->_ckExtension;
      self->_ckExtension = v3;

      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __50__CKSettingsMessagesController_findSpamExtensions__block_invoke;
      v6[3] = &unk_24D075ED8;
      v6[4] = self;
      v5 = (void *)MEMORY[0x2199B8E98](v6);
      -[CKNSExtension beginMatchingExtensions:](self->_ckExtension, "beginMatchingExtensions:", v5);

    }
  }
}

void __50__CKSettingsMessagesController_findSpamExtensions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CFPropertyListRef *v11;
  id v12;

  v5 = a3;
  +[CKSettingsMessagesController removeFirstPartyExtensionFromArrayIfNecessary:](CKSettingsMessagesController, "removeFirstPartyExtensionFromArrayIfNecessary:", a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "extensionIDArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToSet:", v9) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setExtensionIDArray:", v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setExtensionNameMapping:", v5);
    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "spamFilterState") == 1)
  {
    if (!objc_msgSend(v12, "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "disableSpamFiltering");
      objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "verifyCurrentExtensionIDValidity");
  }
  v10 = objc_msgSend(v12, "count");
  v11 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!v10)
    v11 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("MessageSpamFilteringExtensionInstalled"), *v11, CFSTR("com.apple.MobileSMS"));
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);

}

+ (id)removeFirstPartyExtensionFromArrayIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  char v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v26 = v4;
  if (objc_msgSend(a1, "shouldShowFirstPartyExtension"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.smsFilter.extension"));

          if (v14)
            v15 = v5;
          else
            v15 = v6;
          objc_msgSend(v15, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v9);
    }

    objc_msgSend(v5, "addObjectsFromArray:", v6);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v4;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v22, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.smsFilter.extension"));

          if ((v24 & 1) == 0)
            objc_msgSend(v5, "addObject:", v22);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v19);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void)messageFilteringTapped:(id)a3
{
  CKFilteringListController *filteringController;
  void *v5;

  -[CKFilteringListController setSpecifier:](self->_filteringController, "setSpecifier:", a3);
  filteringController = self->_filteringController;
  -[CKSettingsMessagesController rootController](self, "rootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFilteringListController setRootController:](filteringController, "setRootController:", v5);

  self->_showingChildViewController = 1;
  -[CKFilteringListController setShowingParentViewController:](self->_filteringController, "setShowingParentViewController:", 1);
  -[CKSettingsMessagesController showController:animate:](self, "showController:animate:", self->_filteringController, 1);
}

- (BOOL)shouldShowiMessageFilteringSettings:(id)a3
{
  return !a3 || objc_msgSend(a3, "count") == 0;
}

- (id)iMessageFilteringSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("MADRID_FILTER_SWITCH"), 0);
}

- (id)spamFilteringSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("SPAM_FILTERING"), 0);
}

- (id)junkConversationsRowIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("JUNK_CONVERSATIONS_BUTTON"), 0);
}

- (id)junkFilterReceiptsRowIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("JUNK_FILTERING_RECEIPTS_GROUP"), CFSTR("JUNK_FILTERING_RECEIPTS_SWITCH"), 0);
}

- (id)isConversationListFilteringEnabled:(id)a3
{
  int AppBooleanValue;
  BOOL v4;
  uint64_t v5;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("IncomingMessageAlertFiltration"), CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 1;
  v5 = !v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setConversationListFilteringEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  -[CKSettingsMessagesController sharedSettingsHelper](self, "sharedSettingsHelper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setConversationListFilteringEnabled:", v6);
}

- (BOOL)shouldShowJunkConversationsRow
{
  uint64_t (*v2)(void);

  v2 = (uint64_t (*)(void))CUTWeakLinkSymbol();
  if (v2)
    LOBYTE(v2) = v2();
  return (char)v2;
}

+ (BOOL)shouldShowFirstPartyExtension
{
  void *v2;
  char v3;
  uint64_t (*v4)(void);

  objc_msgSend(a1, "getDefaultExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.smsFilter.extension"));

  if ((v3 & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v4 = (uint64_t (*)(void))CUTWeakLinkSymbol();
    if (v4)
      LOBYTE(v4) = v4();
  }
  return (char)v4;
}

- (BOOL)shouldShowSiriSettings
{
  if (IMGetDomainBoolForKey())
    IMSetDomainBoolForKey();
  return 0;
}

- (BOOL)isPersonalCompanionEnabled
{
  return IMGetDomainBoolForKey();
}

- (id)siriSettingsIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("SIRI_GROUP"), CFSTR("SIRI_TONE_NOTIFICATION_SWITCH"), 0);
}

- (id)isSiriToneNotificationEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", IMGetDomainBoolForKey() ^ 1);
}

- (void)setSiriToneNotificationEnabled:(id)a3 specifier:(id)a4
{
  objc_msgSend(a3, "BOOLValue");
  IMSetDomainBoolForKey();
}

- (id)audioMessageSettingsSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("AUDIO_MESSAGES_GROUP"), CFSTR("EXPIRE_AUDIO_MESSAGES"), CFSTR("RAISE_TO_LISTEN_SWITCH"), 0);
}

- (BOOL)shouldShowContactPhotoSettings
{
  void *v2;
  uint64_t v3;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 1;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  v7 = v6;

  return v7 > 320.0;
}

- (id)contactPhotoSettingsSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("CONTACT_PHOTO_GROUP"), CFSTR("CONTACT_PHOTO_SWITCH"), 0);
}

- (id)nameAndPhotoSharingSpecifiers
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("NAME_AND_PHOTO_SHARING_GROUP");
  v3[1] = CFSTR("NAME_AND_PHOTO_SHARING_BUTTON");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)showiCloudNotSignedInAlertForNicknames
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)MEMORY[0x24BEBD3B0];
  MessagesSettingsLocalizedString(CFSTR("NAME_AND_PHOTO_SHARING_NOT_AVAILABLE_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MessagesSettingsLocalizedString(CFSTR("NAME_AND_PHOTO_SHARING_ACCOUNT_MISMATCH_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    if (_os_feature_enabled_impl())
      v6 = CFSTR("NAME_AND_PHOTO_SHARING_ICLOUD_NOT_SIGNED_IN_MESSAGE_APPLEACCOUNT");
    else
      v6 = CFSTR("NAME_AND_PHOTO_SHARING_ICLOUD_NOT_SIGNED_IN_MESSAGE");
    MessagesSettingsLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BEBD3B0];
    MessagesSettingsLocalizedString(CFSTR("NAME_AND_PHOTO_SHARING_NOT_AVAILABLE_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v7, 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v10;
  }
  v11 = (void *)MEMORY[0x24BEBD3A8];
  MessagesSettingsLocalizedString(CFSTR("NAME_AND_PHOTO_SHARING_ME_CARD_SETUP_PROMPT_OK"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v13);
  -[CKSettingsMessagesController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentViewController:animated:completion:", v15, 1, 0);

}

- (void)showMultiplePhoneNumbersAlertForNicknames
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (_os_feature_enabled_impl())
    v3 = CFSTR("NAME_AND_PHOTO_SHARING_MULTIPLE_PHONE_NUMBERS_MESSAGE_APPLEACCOUNT");
  else
    v3 = CFSTR("NAME_AND_PHOTO_SHARING_MULTIPLE_PHONE_NUMBERS_MESSAGE");
  MessagesSettingsLocalizedString(v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBD3B0];
  MessagesSettingsLocalizedString(CFSTR("NAME_AND_PHOTO_SHARING_NOT_AVAILABLE_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  MessagesSettingsLocalizedString(CFSTR("NAME_AND_PHOTO_SHARING_ME_CARD_SETUP_PROMPT_OK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v9);
  -[CKSettingsMessagesController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)nameAndPhotoSharingForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];

  objc_msgSend(MEMORY[0x24BE51220], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(MEMORY[0x24BE50338], "performSelector:withObject:", sel_iCloudSignedInToUseNicknames, 0))
  {
    -[CKSettingsMessagesController showiCloudNotSignedInAlertForNicknames](self, "showiCloudNotSignedInAlertForNicknames");
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    if (!objc_msgSend(MEMORY[0x24BE50338], "performSelector:withObject:", sel_multiplePhoneNumbersTiedToAppleID, 0))
      goto LABEL_13;
    -[CKSettingsMessagesController showMultiplePhoneNumbersAlertForNicknames](self, "showMultiplePhoneNumbersAlertForNicknames");
LABEL_12:
    objc_msgSend(v4, "setSharingEnabled:", 0);
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isAllowMultiplePhoneNumbersSNaPEnabled"))
  {
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
      goto LABEL_13;
    goto LABEL_10;
  }

LABEL_13:
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "userInterfaceIdiom"))
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom") == 1;

  }
  else
  {
    v11 = 1;
  }

  if (_os_feature_enabled_impl() && v11)
  {
    -[CKSettingsMessagesController showNicknameOnboardingOrEditFlowController](self, "showNicknameOnboardingOrEditFlowController");
  }
  else
  {
    v12 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke;
    v18[3] = &unk_24D0765C8;
    v18[4] = self;
    v13 = (void *)MEMORY[0x2199B8E98](v18);
    objc_msgSend(MEMORY[0x24BE50338], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke_3;
    v16[3] = &unk_24D076618;
    v17 = v13;
    v15 = v13;
    objc_msgSend(v14, "fetchPersonalNicknameWithCompletion:", v16);

  }
LABEL_20:

}

void __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke_2;
  v6[3] = &unk_24D075680;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v1, "showMeCardViewControllerWithNickname:");
  else
    return objc_msgSend(v1, "showNicknameOnboardingController");
}

void __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke_4;
  v6[3] = &unk_24D0765F0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)showNicknameOnboardingController
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)CUTWeakLinkClass();
  if (v3)
  {
    v4 = objc_alloc_init(v3);
    -[CKSettingsMessagesController setOnboardingController:](self, "setOnboardingController:", v4);

    -[CKSettingsMessagesController onboardingController](self, "onboardingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[CKSettingsMessagesController onboardingController](self, "onboardingController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentNicknameSharingSetupFlow");

  }
}

- (void)showNicknameOnboardingOrEditFlowController
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v3 = (objc_class *)CUTWeakLinkClass();
  if (v3)
  {
    v4 = objc_alloc_init(v3);
    -[CKSettingsMessagesController setOnboardingController:](self, "setOnboardingController:", v4);

    -[CKSettingsMessagesController onboardingController](self, "onboardingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[CKSettingsMessagesController onboardingController](self, "onboardingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CKSettingsMessagesController onboardingController](self, "onboardingController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "performSelector:", sel_presentNicknameOnboardingOrEditFlow);

    }
  }
}

- (void)onboardingControllerDidFinish:(id)a3
{
  -[CKSettingsMessagesController setOnboardingController:](self, "setOnboardingController:", 0);
  -[CKSettingsMessagesController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)showMeCardViewControllerWithNickname:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  unint64_t v11;
  CKSettingsMeCardSharingNicknameAvatarProvider *v12;
  void *v13;
  void *v14;
  CKSettingsMeCardSharingNicknameAvatarProvider *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BE511D0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE511D0], "keysForNicknameHandling");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchMeContactWithKeys:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKSettingsMeCardSharingNameProvider nameProviderForNickname:](CKSettingsMeCardSharingNameProvider, "nameProviderForNickname:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE511D0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getContactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[CKSettingsMessagesController _meCardSharingEnabled](self, "_meCardSharingEnabled");
    v11 = -[CKSettingsMessagesController _meCardSharingAudience](self, "_meCardSharingAudience");
    if (-[CKSettingsMessagesController _imageForkedFromMeCard](self, "_imageForkedFromMeCard"))
    {
      v12 = [CKSettingsMeCardSharingNicknameAvatarProvider alloc];
      objc_msgSend(v18, "avatar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CKSettingsMeCardSharingNicknameAvatarProvider initWithImageData:](v12, "initWithImageData:", v14);

    }
    else
    {
      v15 = (CKSettingsMeCardSharingNicknameAvatarProvider *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAEA8]), "initWithContact:", v6);
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAEB0]), "initWithContactStore:contact:avatarProvider:nameProvider:sharingEnabled:selectedSharingAudience:", v9, v6, v15, v7, v10, v11);
    objc_msgSend(v16, "setDelegate:", self);
    -[CKSettingsMessagesController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pushViewController:animated:", v16, 1);

  }
}

- (id)getNameAndPhotoSharingSpecifierSummary:(id)a3
{
  void *v4;
  unint64_t v5;
  __CFString *v6;

  if (!-[CKSettingsMessagesController _meCardSharingEnabled](self, "_meCardSharingEnabled", a3))
  {
    v6 = CFSTR("GENERAL_OFF");
LABEL_6:
    MessagesSettingsLocalizedString(v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  v4 = (void *)objc_opt_class();
  if (v4)
  {
    v5 = -[CKSettingsMessagesController _meCardSharingAudience](self, "_meCardSharingAudience");
    if (v5 > 2)
    {
      v4 = 0;
      return v4;
    }
    v6 = off_24D076638[v5];
    goto LABEL_6;
  }
  return v4;
}

- (id)getNameAndPhotoSharingFooterText
{
  unint64_t v3;
  const __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  if (-[CKSettingsMessagesController _meCardSharingEnabled](self, "_meCardSharingEnabled"))
  {
    if (!objc_opt_class())
    {
      v6 = &stru_24D077260;
      return v6;
    }
    v3 = -[CKSettingsMessagesController _meCardSharingAudience](self, "_meCardSharingAudience");
    v4 = CFSTR("NAME_AND_PHOTO_SHARING_EVERYONE_FOOTER");
    if (v3 == 1)
      v4 = CFSTR("NAME_AND_PHOTO_SHARING_CONTACTS_ONLY_FOOTER");
    if (v3 == 2)
      v5 = CFSTR("NAME_AND_PHOTO_SHARING_ALWAYS_ASK_FOOTER");
    else
      v5 = (__CFString *)v4;
  }
  else
  {
    v5 = CFSTR("NAME_AND_PHOTO_SHARING_NOT_SHARING_FOOTER");
  }
  MessagesSettingsLocalizedString(v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (void)_showSetupMeCardAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  MessagesSettingsLocalizedString(CFSTR("NAME_AND_PHOTO_SHARING_ME_CARD_SETUP_PROMPT_TITLE"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  MessagesSettingsLocalizedString(CFSTR("NAME_AND_PHOTO_SHARING_ME_CARD_SETUP_PROMPT_MESSAGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MessagesSettingsLocalizedString(CFSTR("NAME_AND_PHOTO_SHARING_ME_CARD_SETUP_PROMPT_OK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v6);

  -[CKSettingsMessagesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (BOOL)_meCardSharingEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MeCardSharingEnabled"), CFSTR("com.apple.messages.nicknames"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (unint64_t)_meCardSharingAudience
{
  CFIndex AppIntegerValue;
  uint64_t v3;
  BOOL v4;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("MeCardSharingAudience"), CFSTR("com.apple.messages.nicknames"), &keyExistsAndHasValidFormat);
  v3 = objc_opt_class();
  if (keyExistsAndHasValidFormat)
    v4 = 1;
  else
    v4 = v3 == 0;
  if (v4)
    return AppIntegerValue;
  else
    return 1;
}

- (BOOL)_imageForkedFromMeCard
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MeCardSharingImageForkedFromMeCard"), CFSTR("com.apple.messages.nicknames"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (id)sharedWithYouSettingsSpecifierIdentifiers
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("SHARED_WITH_YOU_GROUP");
  v3[1] = CFSTR("SHARED_WITH_YOU_BUTTON");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldShowSharedWithYouSettings
{
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  else
    return _os_feature_enabled_impl();
}

- (id)getSharedWithYouForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  MessagesSettingsLocalizedString(CFSTR("GENERAL_ON"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MessagesSettingsLocalizedString(CFSTR("GENERAL_OFF"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKSettingsMessagesController _sharedWithYouEnabled](self, "_sharedWithYouEnabled"))
    v6 = v4;
  else
    v6 = v5;
  v7 = v6;

  return v7;
}

- (BOOL)_sharedWithYouEnabled
{
  void *v3;
  char v4;

  if ((objc_msgSend(MEMORY[0x24BE511E8], "deviceIsLockedDown") & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x24BE511D8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getBoolFromDomain:forKey:", CFSTR("com.apple.SocialLayer"), CFSTR("SharedWithYouEnabled"));

  return v4;
}

- (id)_sharedWithYouViewController
{
  CKSettingsSharedWithYouController *v3;
  void *v4;

  v3 = objc_alloc_init(CKSettingsSharedWithYouController);
  -[CKSettingsSharedWithYouController setParentController:](v3, "setParentController:", self);
  -[CKSettingsMessagesController rootController](self, "rootController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingsSharedWithYouController setRootController:](v3, "setRootController:", v4);

  return v3;
}

- (id)inboxSummarySettingsSpecifierIdentifiers
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("INBOX_SUMMARY_GROUP");
  v3[1] = CFSTR("INBOX_SUMMARY_SWITCH");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldShowInboxSummarySettings
{
  void *v2;
  char v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    return 0;
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "generativeModelsAvailable");

  return v5;
}

- (id)isInboxSummarizationEnabled:(id)a3
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "summarizationUserPreferenceEnabled");

  }
  else
  {
    v6 = 1;
  }
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
}

- (void)setInboxSummarizationEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v4;
  void *v5;
  char v6;
  id v7;

  v4 = objc_msgSend(a3, "BOOLValue");
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSummarizationUserPreferenceEnabled:", v4);

  }
}

- (BOOL)shouldShowCheckInLocationHistorySettings
{
  const void *v3;
  const void *v4;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    v4 = v3;
    if (!CFEqual(v3, CFSTR("iPhone")))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = 138412290;
          v9 = v4;
          _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_INFO, "Check In not supported for device type: %@", (uint8_t *)&v8, 0xCu);
        }

      }
      CFRelease(v4);
      return 0;
    }
    CFRelease(v4);
  }
  if (-[CKSettingsMessagesController isCheckInAllowedInRegion](self, "isCheckInAllowedInRegion"))
  {
    if ((objc_msgSend(MEMORY[0x24BE83470], "hasUserCompletedOnboarding") & 1) != 0)
      return _os_feature_enabled_impl();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_INFO, "Check In onboarding not completed", (uint8_t *)&v8, 2u);
      }
LABEL_19:

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_INFO, "Check In not supported in region", (uint8_t *)&v8, 2u);
    }
    goto LABEL_19;
  }
  return 0;
}

- (id)checkInLocationHistorySettingsSpecifierIdentifiers
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("CHECK_IN_LOCATION_HISTORY_SECTION_ID");
  v3[1] = CFSTR("CHECK_IN_LOCATION_HISTORY_ID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getCheckInLocationHistorySetting:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  MessagesSettingsLocalizedString(CFSTR("CHECK_IN_LOCATION_HISTORY_ENABLED"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MessagesSettingsLocalizedString(CFSTR("CHECK_IN_LOCATION_HISTORY_DISABLED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE83470], "shareAllLocations"))
    v5 = v3;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (BOOL)isCheckInAllowedInRegion
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE7D058], "currentEstimates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x24BE7D058], "lastKnownEstimates");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v3, "count"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v16, OS_LOG_TYPE_INFO, "Unable to determine Check In availability", buf, 2u);
        }

      }
      v13 = 1;
      goto LABEL_23;
    }
    v2 = v3;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v2;
      _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_INFO, "Current regulatory domain: %@", buf, 0xCu);
    }

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = v2;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v6 = v5;
  if (v5)
  {
    v7 = *(_QWORD *)v18;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x2199B8CB8](v5);
        objc_msgSend(v9, "countryCode", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("KR"));

        if (v12)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v9;
              _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_INFO, "Check In not available in regulatory domain: %@", buf, 0xCu);
            }

          }
          objc_autoreleasePoolPop(v10);
          v13 = 0;
          goto LABEL_22;
        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_22:

LABEL_23:
  return v13;
}

- (void)configureCheckInSpecifiers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSRange v18;

  v4 = (void *)MEMORY[0x24BE6E430];
  v5 = a3;
  objc_msgSend(v4, "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.checkin"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "flow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedButtonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MessagesSettingsLocalizedString(CFSTR("CHECK_IN_LOCATION_HISTORY_FOOTER"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForID:", CFSTR("CHECK_IN_LOCATION_HISTORY_SECTION_ID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v12, *MEMORY[0x24BE75A30]);

  objc_msgSend(v10, "setProperty:forKey:", v9, *MEMORY[0x24BE75A58]);
  v18.location = objc_msgSend(v9, "rangeOfString:", v7);
  NSStringFromRange(v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v13, *MEMORY[0x24BE75A40]);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v14, *MEMORY[0x24BE75A50]);

  NSStringFromSelector(sel_presentCheckInPrivacySplashController);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v15, *MEMORY[0x24BE75A38]);

  objc_msgSend(v5, "specifierForID:", CFSTR("CHECK_IN_LOCATION_HISTORY_ID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
}

- (void)presentCheckInPrivacySplashController
{
  id v3;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.checkin"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)checkInPrivacySplashControllerDidRequestDismissal:(id)a3
{
  -[CKSettingsMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4
{
  id v4;

  CFPreferencesSetAppValue(CFSTR("MeCardSharingEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a4), CFSTR("com.apple.messages.nicknames"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x24BE50FA8], 0);

}

- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  id v4;

  CFPreferencesSetAppValue(CFSTR("MeCardSharingAudience"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4), CFSTR("com.apple.messages.nicknames"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x24BE50FA8], 0);

}

- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BE50338];
  v5 = a4;
  objc_msgSend(v4, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatePersonalNicknameIfNecessaryWithMeCardSharingResult:", v5);

}

- (id)_messagesForBusinessViewController
{
  CKSettingsMessagesForBusinessViewController *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(CKSettingsMessagesForBusinessViewController);
  -[CKSettingsMessagesController lazuliEnablementManager](self, "lazuliEnablementManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingsMessagesForBusinessViewController setLazuliEnablementManager:](v3, "setLazuliEnablementManager:", v4);

  -[CKSettingsMessagesForBusinessViewController setParentController:](v3, "setParentController:", self);
  -[CKSettingsMessagesController rootController](self, "rootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingsMessagesForBusinessViewController setRootController:](v3, "setRootController:", v5);

  return v3;
}

- (BOOL)shouldShowSMSRelaySettings
{
  void *v3;
  char v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsSMS");

  v5 = -[CKSettingsMessagesController hasPhoneNumber](self, "hasPhoneNumber");
  v6 = +[CKSettingSMSRelayController shouldShowSMSRelaySettings](CKSettingSMSRelayController, "shouldShowSMSRelaySettings");
  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE50370], "iMessageService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeAccountsForService:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "accountType", (_QWORD)v16) == 1)
        {
          LOBYTE(v11) = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  v14 = -[CKSettingsMessagesController _isMadridAccountOperational](self, "_isMadridAccountOperational");
  return v11 & v14 & v5 & v6 & v4;
}

- (BOOL)hasPhoneNumber
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDC2810]);
  v3 = (void *)objc_msgSend(v2, "initWithQueue:", MEMORY[0x24BDAC9B8]);
  v20 = 0;
  objc_msgSend(v3, "getSubscriptionInfoWithError:", &v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v20;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "subscriptions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "labelID");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "phoneNumber");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "length");

          if (v14)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

- (id)smsRelaySettingsSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("SMS_RELAY_GROUP"), CFSTR("SMS_RELAY_DEVICES"), 0);
}

- (BOOL)shouldShowReadReceipts
{
  void *v4;
  char v5;

  if (-[CKSettingsMessagesController _isMadridAccountOperational](self, "_isMadridAccountOperational"))
    return 1;
  -[CKSettingsMessagesController lazuliEnablementManager](self, "lazuliEnablementManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRCSEnabledForAnyActiveSubscription");

  return v5;
}

- (id)readReceiptSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("READ_RECEIPTS_GROUP"), CFSTR("READ_RECEIPTS_SWITCH"), 0);
}

- (id)areReadReceiptsEnabled:(id)a3
{
  int AppBooleanValue;
  BOOL v4;
  uint64_t v5;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesSynchronize(CFSTR("com.apple.madrid"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ReadReceiptsEnabled"), CFSTR("com.apple.madrid"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 1;
  v5 = !v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setReadReceiptsEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  -[CKSettingsMessagesController sharedSettingsHelper](self, "sharedSettingsHelper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setReadReceiptsEnabled:", v6);
}

- (BOOL)shouldShowJunkFilteringReceipts
{
  uint64_t (*v2)(void);

  v2 = (uint64_t (*)(void))CUTWeakLinkSymbol();
  if (v2)
    LOBYTE(v2) = v2();
  return (char)v2;
}

- (id)areJunkFilteringReceiptsEnabled:(id)a3
{
  int AppBooleanValue;
  BOOL v4;
  uint64_t v5;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesSynchronize(CFSTR("com.apple.madrid"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("JunkFilteringReceiptsEnabled"), CFSTR("com.apple.madrid"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 0;
  v5 = !v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setJunkFilteringReceiptsEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  MEMORY[0x2199B87F0](CFSTR("com.apple.madrid"), CFSTR("JunkFilteringReceiptsVersionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  if (v6)
    v7 = objc_msgSend(v6, "integerValue") + 1;
  else
    v7 = 1;
  CFPreferencesSetAppValue(CFSTR("JunkFilteringReceiptsVersionID"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7), CFSTR("com.apple.madrid"));
  CFPreferencesSetAppValue(CFSTR("JunkFilteringReceiptsEnabled"), v5, CFSTR("com.apple.madrid"));

  CFPreferencesSynchronize(CFSTR("com.apple.madrid"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.JunkFilteringReceiptsEnabled.changed"), 0, 0, 1u);
  notify_post("com.apple.MobileSMS.JunkFilteringReceiptsEnabled.shouldUpdateDevices");
  if (PSIsNanoMirroringDomain())
  {
    -[CKSettingsMessagesController _syncManager](self, "_syncManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("JunkFilteringReceiptsEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.madrid"), v10);

  }
}

- (BOOL)shouldShowiMessageApps
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSendMenuEnabled");

  if (!v4)
    return 0;
  -[CKSettingsMessagesController iMessageAppManager](self, "iMessageAppManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "haveDeletableApps");

  return v6;
}

- (id)iMessageAppsIdentifiers
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("IMESSAGE_APPS_GROUP");
  v3[1] = CFSTR("IMESSAGE_APPS_BUTTON");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_iMessageAppsViewController
{
  void *v3;
  CKSettingsiMessageAppsViewController *v4;
  void *v5;

  -[CKSettingsMessagesController iMessageAppManager](self, "iMessageAppManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKSettingsiMessageAppsViewController initWithAppManager:]([CKSettingsiMessageAppsViewController alloc], "initWithAppManager:", v3);
  -[CKSettingsiMessageAppsViewController setParentController:](v4, "setParentController:", self);
  -[CKSettingsMessagesController rootController](self, "rootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingsiMessageAppsViewController setRootController:](v4, "setRootController:", v5);

  return v4;
}

- (BOOL)shouldShowSendAsSMS
{
  _BOOL4 v3;

  v3 = -[CKSettingsMessagesController _isSMSDevice](self, "_isSMSDevice");
  if (v3)
    LOBYTE(v3) = -[CKSettingsMessagesController _isMadridAccountOperational](self, "_isMadridAccountOperational");
  return v3;
}

- (id)sendAsSMSIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("PRE_LAZULI_SEND_AS_SMS_GROUP"), CFSTR("SEND_AS_SMS_GROUP"), CFSTR("SEND_AS_SMS_SWITCH"), 0);
}

- (void)showMessagesInICloudSettings:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Messages"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v4, 0);

}

- (id)getMessagesInICloudEnabledSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  MessagesSettingsLocalizedString(CFSTR("GENERAL_ON"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MessagesSettingsLocalizedString(CFSTR("GENERAL_OFF"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKSettingsMessagesController _isMessagesInICloudEnabled](self, "_isMessagesInICloudEnabled"))
    v6 = v4;
  else
    v6 = v5;
  v7 = v6;

  return v7;
}

- (BOOL)_isMessagesInICloudEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE511D8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getBoolFromDomain:forKey:", CFSTR("com.apple.madrid"), CFSTR("CloudKitSyncingEnabled"));

  return v3;
}

- (BOOL)shouldShowMadridAccounts
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "serviceSupportsDeviceAliasEnablement"))
  {
    -[CNFRegListController regController](self, "regController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "usableDeviceAliases");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  if (-[CKSettingsMessagesController _isMadridAccountOperational](self, "_isMadridAccountOperational"))
    return 1;
  else
    return -[CKSettingsMessagesController _isMadridSwitchOn](self, "_isMadridSwitchOn") && v6;
}

- (id)madridEnabledSpecifierIdentifiers
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("MADRID_ACCOUNTS");
  v3[1] = CFSTR("MADRID_ACCOUNTS_BUTTON");
  v3[2] = CFSTR("MESSAGES_IN_ICLOUD");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getAccountSummaryForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  char v6;

  v6 = 0;
  -[CNFRegListController regController](self, "regController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aliasSummaryString:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldShowUpdateAppleID
{
  _BOOL4 v3;

  v3 = -[CKSettingsMessagesController shouldShowMadridSwitch](self, "shouldShowMadridSwitch");
  if (v3)
    LOBYTE(v3) = -[CKSettingsMessagesController _isAppleIDUpdateNeeded](self, "_isAppleIDUpdateNeeded");
  return v3;
}

- (void)showCKVSettings:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=TRANSPARENCY"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v4, 0);

}

- (BOOL)_isAppleIDUpdateNeeded
{
  CKSettingsMessagesController *v2;
  void *v3;

  v2 = self;
  -[CKSettingsMessagesController _registrationFailures](self, "_registrationFailures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CKSettingsMessagesController _registrationFailures:containsFailure:](v2, "_registrationFailures:containsFailure:", v3, 28);

  return (char)v2;
}

- (int64_t)_debugFailureReason
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.MobileSMS"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("userRegistrationKTFailure"));
  v4 = 28;
  if (v3 != 2)
    v4 = -1;
  if (v3 == 1)
    v5 = 29;
  else
    v5 = v4;

  return v5;
}

- (BOOL)shouldShowMadridSignin
{
  _BOOL4 v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!-[CKSettingsMessagesController _isMadridAccountOperational](self, "_isMadridAccountOperational"))
  {
    v3 = -[CKSettingsMessagesController _isMadridSwitchOn](self, "_isMadridSwitchOn");
    if (!v3)
      return v3;
    -[CNFRegListController regController](self, "regController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountsWithFilter:", 49156);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "count"))
    {
LABEL_16:

      LOBYTE(v3) = !-[CKSettingsMessagesController shouldShowMadridAccounts](self, "shouldShowMadridAccounts");
      return v3;
    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v5;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "registrationStatus", (_QWORD)v12) <= 3
            && !objc_msgSend(v10, "isAccountKeyCDPSyncingOrWaitingForUser"))
          {

            goto LABEL_16;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  LOBYTE(v3) = 0;
  return v3;
}

- (id)madridSigninSpecifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("MADRID_SIGNIN"), CFSTR("MADRID_SIGNIN_BUTTON"), 0);
}

- (id)madridSigninButtonTextForSpecifier:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = _os_feature_enabled_impl();
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = CFSTR("FACETIME_ACCOUNT_INFO_UNAVAILABLE_APPLEACCOUNT");
  else
    v6 = CFSTR("FACETIME_ACCOUNT_INFO_UNAVAILABLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D077260, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getPreviewTranscodingEnabled:(id)a3
{
  int AppBooleanValue;
  BOOL v4;
  uint64_t v5;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesSynchronize(CFSTR("com.apple.imessage"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PreviewTranscodingEnabled"), CFSTR("com.apple.imessage"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 1;
  v5 = !v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setPreviewTranscodingEnabled:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(CFSTR("PreviewTranscodingEnabled"), a3, CFSTR("com.apple.imessage"));
  CFPreferencesSetAppValue(CFSTR("PreviewTranscodingSelectedByUser"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.imessage"));
  CFPreferencesSynchronize(CFSTR("com.apple.imessage"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

- (id)getSMSRelayDevicesSummary:(id)a3
{
  unint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;

  v3 = +[CKSettingSMSRelayController numberOfActiveDevices](CKSettingSMSRelayController, "numberOfActiveDevices", a3);
  v4 = (void *)v3;
  if (v3)
  {
    if (v3 == 1)
      v5 = CFSTR("SMS_RELAY_SINGLE_DEVICE_LABEL");
    else
      v5 = CFSTR("SMS_RELAY_MULTIPLE_DEVICES_LABEL");
    MessagesSettingsLocalizedString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v6, v4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)currentKeepMessages
{
  return +[CKKeepMessagesPreferenceManager keepMessagesPreference](CKKeepMessagesPreferenceManager, "keepMessagesPreference");
}

- (id)getKeepMessages:(id)a3
{
  return +[CKSettingsMessagesController currentKeepMessages](CKSettingsMessagesController, "currentKeepMessages", a3);
}

- (void)setKeepMessages:(id)a3 specifier:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v8;

  v4 = a3;
  MEMORY[0x2199B87F0](CFSTR("com.apple.MobileSMS"), CFSTR("KeepMessagesVersionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v5)
    v6 = objc_msgSend(v5, "integerValue") + 1;
  else
    v6 = 1;
  CFPreferencesSetAppValue(CFSTR("KeepMessagesVersionID"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6), CFSTR("com.apple.MobileSMS"));
  CFPreferencesSetAppValue(CFSTR("KeepMessageForDays"), v4, CFSTR("com.apple.MobileSMS"));

  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  notify_post("com.apple.MobileSMS.KeepMessages.shouldUpdateDevices");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.KeepMessages.changed"), 0, 0, 1u);

}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  CNFAccountRegistrar *v27;
  void *v28;
  CNFAccountRegistrar *v29;
  NSObject *v30;
  NSObject *v31;
  dispatch_semaphore_t v33;
  _QWORD v34[5];
  NSObject *v35;
  __int128 *p_buf;
  uint8_t v37[4];
  void *v38;
  __int128 buf;
  uint64_t v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE0ABF0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE0ABD0]);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v16 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v40 = 0x2020000000;
    v41 = 0;
    if (v17)
      v20 = v18 == 0;
    else
      v20 = 1;
    if (v20)
      goto LABEL_40;
    OSLogHandleForIDSCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_2138BA000, v21, OS_LOG_TYPE_DEFAULT, "Obtained user/pass from AuthKit.", v37, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    -[CNFRegListController regController](self, "regController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "serviceType");

    if (v23)
    {
      if (v23 == 1)
      {
        objc_msgSend(MEMORY[0x24BE50370], "iMessageService");
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_27:
        v25 = (void *)v24;
        if (v24)
        {
          v33 = dispatch_semaphore_create(0);
          OSLogHandleForIDSCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v37 = 138412290;
            v38 = v25;
            _os_log_impl(&dword_2138BA000, v26, OS_LOG_TYPE_DEFAULT, "Registering for service: %@", v37, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            IMLogString();
          v27 = [CNFAccountRegistrar alloc];
          -[CNFRegListController regController](self, "regController");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[CNFAccountRegistrar initWithServiceType:presentationViewController:](v27, "initWithServiceType:presentationViewController:", objc_msgSend(v28, "serviceType"), self);

          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __114__CKSettingsMessagesController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke;
          v34[3] = &unk_24D075BC8;
          p_buf = &buf;
          v34[4] = self;
          v30 = v33;
          v35 = v30;
          -[CNFAccountRegistrar registerAccountWithUsername:password:service:completionBlock:](v29, "registerAccountWithUsername:password:service:completionBlock:", v17, v19, v25, v34);
          dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);

LABEL_39:
          v16 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
LABEL_40:
          _Block_object_dispose(&buf, 8);

          goto LABEL_41;
        }
LABEL_34:
        OSLogHandleForIDSCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v37 = 0;
          _os_log_impl(&dword_2138BA000, v31, OS_LOG_TYPE_DEFAULT, "Couldn't determine a service from the regController.", v37, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
        goto LABEL_39;
      }
      if (v23 != 2)
        goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x24BE50370], "facetimeService");
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  OSLogHandleForIDSCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "AuthKit had an error authenticating: %@", (uint8_t *)&buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  OSLogHandleForIDSCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "NOT registering.", (uint8_t *)&buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  v16 = 0;
LABEL_41:

  return v16;
}

void __114__CKSettingsMessagesController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Successfully registered.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (v5)
  {
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Failed registration. Showing alert.", v9, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(*(id *)(a1 + 32), "dismissModalViewControllerWithTransition:", 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_showSignInController
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(void);
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = objc_alloc_init(MEMORY[0x24BE0AE28]);
  objc_msgSend(v3, "setPresentingViewController:", self);
  v4 = _os_feature_enabled_impl();
  CommunicationsSetupUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v7 = CFSTR("FACETIME_SIGNIN_SETTINGS_BLURB_APPLEACCOUNT");
  else
    v7 = CFSTR("FACETIME_SIGNIN_SETTINGS_BLURB");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D077260, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReason:", v8);

  objc_msgSend(v3, "setShouldForceInteractiveAuth:", 1);
  -[CNFRegListController regController](self, "regController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "serviceType");

  if (v10 == 1)
    v11 = 4;
  else
    v11 = 5;
  objc_msgSend(v3, "setServiceType:", v11);
  v12 = (unsigned int (*)(void))CUTWeakLinkSymbol();
  if (v12 && v12())
    objc_msgSend(v3, "setIsUsernameEditable:", 0);
  v13 = objc_alloc_init((Class)CUTWeakLinkClass());
  objc_msgSend(v13, "aa_primaryAppleAccount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "username");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(v3, "setUsername:", v15);
    objc_msgSend(v3, "setReason:", v15);
    objc_msgSend(v3, "setShouldForceInteractiveAuth:", 0);
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__559;
  v22 = __Block_byref_object_dispose__560;
  v23 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  objc_msgSend((id)v19[5], "setDelegate:", self);
  v16 = (void *)v19[5];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __53__CKSettingsMessagesController__showSignInController__block_invoke;
  v17[3] = &unk_24D075BF0;
  v17[4] = &v18;
  objc_msgSend(v16, "authenticateWithContext:completion:", v3, v17);
  _Block_object_dispose(&v18, 8);

}

void __53__CKSettingsMessagesController__showSignInController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Error getting credentials using AuthKit: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }

}

- (void)_showMadridSetupIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  CNFRegWizardController *v17;
  CNFRegWizardController *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  if (!-[CKSettingsMessagesController _isSMSDevice](self, "_isSMSDevice") || v3)
  {
    v21 = v3;
    -[CNFRegListController regController](self, "regController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accounts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v6, "count");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "isActive");
          v10 |= v16;
          v11 |= v16 ^ 1;
          if ((unint64_t)(objc_msgSend(v15, "registrationStatus") + 1) <= 1)
            v12 = 1;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
    }

    v17 = -[CNFRegWizardController initWithServiceTypes:]([CNFRegWizardController alloc], "initWithServiceTypes:", 1);
    v18 = v17;
    if (v22 && (v11 & 1) != 0 && ((v10 | v12 ^ 1) & 1) != 0)
    {
      if (!v21)
        goto LABEL_22;
    }
    else if (!-[CNFRegWizardController shouldShowFirstRunController](v17, "shouldShowFirstRunController") && !v21)
    {
      goto LABEL_22;
    }
    -[PSSetupController setParentController:](v18, "setParentController:", self);
    -[CKSettingsMessagesController rootController](self, "rootController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSRootController setRootController:](v18, "setRootController:", v19);

    -[CNFRegWizardController setCanStartNested:](v18, "setCanStartNested:", 0);
    -[CNFRegWizardController setCanShowSplashScreen:](v18, "setCanShowSplashScreen:", 0);
    -[CNFRegWizardController setCanShowDisabledScreen:](v18, "setCanShowDisabledScreen:", 0);
    -[CNFRegWizardController setAllowCancel:](v18, "setAllowCancel:", 1);
    -[CNFRegWizardController setHideLearnMoreButton:](v18, "setHideLearnMoreButton:", 1);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegWizardController setShowSplashOnSignin:](v18, "setShowSplashOnSignin:", objc_msgSend(v20, "userInterfaceIdiom") == 1);

    -[CNFRegWizardController setFirstRunDelegate:](v18, "setFirstRunDelegate:", self);
    -[CKSettingsMessagesController showController:animate:](self, "showController:animate:", v18, 1);
    self->_showingChildViewController = 1;
LABEL_22:

  }
}

- (void)_showMadridSetupIfNecessary
{
  -[CKSettingsMessagesController _showMadridSetupIfNecessary:](self, "_showMadridSetupIfNecessary:", 0);
}

- (void)firstRunControllerDidFinish:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (v4)
  {
    -[CNFRegListController regController](self, "regController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setServiceEnabled:", 1);

  }
  -[CKSettingsMessagesController reloadSpecifiers](self, "reloadSpecifiers");
  objc_msgSend(v7, "dismiss");

}

- (void)_updateUIWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (!-[CKSettingsMessagesController _isMadridAccountOperational](self, "_isMadridAccountOperational"))
  {
    -[CKSettingsMessagesController _failedAccounts](self, "_failedAccounts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v17)
    {
      if (v5)
      {
        -[CNFRegListController regController](self, "regController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "shouldShowAlertForError:", v17);

        if (v7)
        {
          -[CKSettingsMessagesController _showMadridSetupIfNecessary](self, "_showMadridSetupIfNecessary");
          CommunicationsSetupUIBundle();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableName();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "localizedDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          CommunicationsSetupUIBundle();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableName();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v14, 0, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addAction:", v16);

          -[CKSettingsMessagesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
        }
      }
    }

  }
  -[CKSettingsMessagesController reloadSpecifiers](self, "reloadSpecifiers");

}

- (void)_setupAccountHandlers
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKSettingsMessagesController;
  -[CNFRegListController _setupEventHandlers](&v13, sel__setupEventHandlers);
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke;
  v12[3] = &unk_24D075180;
  v12[4] = self;
  objc_msgSend(v3, "setResetBlock:", v12);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_2;
  v11[3] = &unk_24D075C90;
  v11[4] = self;
  objc_msgSend(v3, "setAccountAddedBlock:", v11);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_3;
  v10[3] = &unk_24D075C90;
  v10[4] = self;
  objc_msgSend(v3, "setAccountRemovedBlock:", v10);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_4;
  v9[3] = &unk_24D075C90;
  v9[4] = self;
  objc_msgSend(v3, "setAccountActivationChangedBlock:", v9);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_5;
  v8[3] = &unk_24D075CB8;
  v8[4] = self;
  objc_msgSend(v3, "setAccountRegistrationBlock:", v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_6;
  v7[3] = &unk_24D075D08;
  v7[4] = self;
  objc_msgSend(v3, "setAliasStatusChangedBlock:", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_7;
  v6[3] = &unk_24D075CE0;
  v6[4] = self;
  objc_msgSend(v3, "setAliasAddedBlock:", v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_8;
  v5[3] = &unk_24D075CE0;
  v5[4] = self;
  objc_msgSend(v3, "setAliasRemovedBlock:", v5);

}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUIWithError:", 0);
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUIWithError:", 0);
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUIWithError:", 0);
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUIWithError:");
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUIWithError:");
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUIWithError:", 0);
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUIWithError:", 0);
}

- (BOOL)_allAccountsAreDeactivated
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CNFRegListController regController](self, "regController", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isActive") & 1) != 0 || objc_msgSend(v8, "registrationStatus") > 1)
        {
          v9 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 1;
  }
LABEL_13:

  return v9;
}

- (void)_setupAccountHandlersForDisabling
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKSettingsMessagesController;
  -[CNFRegListController _setupEventHandlers](&v7, sel__setupEventHandlers);
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKSettingsMessagesController _allAccountsAreDeactivated](self, "_allAccountsAreDeactivated"))
  {
    -[CKSettingsMessagesController _setupAccountHandlers](self, "_setupAccountHandlers");
  }
  else
  {
    -[CNFRegListController removeAllHandlers](self, "removeAllHandlers");
    v4 = MEMORY[0x24BDAC760];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65__CKSettingsMessagesController__setupAccountHandlersForDisabling__block_invoke;
    v6[3] = &unk_24D075C90;
    v6[4] = self;
    objc_msgSend(v3, "setAccountActivationChangedBlock:", v6);
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __65__CKSettingsMessagesController__setupAccountHandlersForDisabling__block_invoke_2;
    v5[3] = &unk_24D075CB8;
    v5[4] = self;
    objc_msgSend(v3, "setAccountRegistrationBlock:", v5);
  }

}

uint64_t __65__CKSettingsMessagesController__setupAccountHandlersForDisabling__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateSwitchDelayed");
  result = objc_msgSend(*(id *)(a1 + 32), "_allAccountsAreDeactivated");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupAccountHandlers");
    return objc_msgSend(*(id *)(a1 + 32), "_updateUIWithError:", 0);
  }
  return result;
}

uint64_t __65__CKSettingsMessagesController__setupAccountHandlersForDisabling__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateSwitchDelayed");
  result = objc_msgSend(*(id *)(a1 + 32), "_allAccountsAreDeactivated");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupAccountHandlers");
    return objc_msgSend(*(id *)(a1 + 32), "_updateUIWithError:", 0);
  }
  return result;
}

- (void)_clearMessagesAppExtensionSalt
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/var/mobile/Library/SMS/PluginMetaDataCache"));

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v4, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/SMS/PluginMetaDataCache"), &v7);
    v5 = v7;

    if (!v5)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.AppMetadataFolderDeleted"), 0, 0, 1u);
    }
  }
}

- (id)_madridSettingsController
{
  CNFRegSettingsController *v3;
  void *v4;
  CNFRegSettingsController *v5;
  void *v6;
  void *v7;

  v3 = [CNFRegSettingsController alloc];
  -[CNFRegListController regController](self, "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNFRegListController initWithRegController:](v3, "initWithRegController:", v4);

  -[CKSettingsMessagesController rootController](self, "rootController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSettingsController setRootController:](v5, "setRootController:", v6);

  -[CNFRegSettingsController setParentController:](v5, "setParentController:", self);
  -[CKSettingsMessagesController specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegListController setSpecifier:](v5, "setSpecifier:", v7);

  -[CNFRegSettingsController setShowEnableSwitch:](v5, "setShowEnableSwitch:", 0);
  return v5;
}

- (id)_smsRelayDevicesController
{
  CKSettingSMSRelayController *v3;
  void *v4;

  v3 = objc_alloc_init(CKSettingSMSRelayController);
  -[CKSettingSMSRelayController setParentController:](v3, "setParentController:", self);
  -[CKSettingsMessagesController rootController](self, "rootController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingSMSRelayController setRootController:](v3, "setRootController:", v4);

  return v3;
}

- (CKRCSController)rcsMessagingController
{
  CKRCSController *rcsMessagingController;
  CKRCSController *v4;
  void *v5;
  void *v6;
  CKRCSController *v7;

  rcsMessagingController = self->_rcsMessagingController;
  if (!rcsMessagingController)
  {
    v4 = objc_alloc_init(CKRCSController);
    -[CKRCSController setMultiSimHeaderKey:](v4, "setMultiSimHeaderKey:", CFSTR("RCS_MESSAGING_HEADER"));
    -[CKRCSController setControllerTitle:](v4, "setControllerTitle:", CFSTR("RCS_MESSAGING"));
    -[CKSettingsMessagesController lazuliEnablementManager](self, "lazuliEnablementManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRCSController setLazuliEnablementManager:](v4, "setLazuliEnablementManager:", v5);

    -[CKRCSController setParentController:](v4, "setParentController:", self);
    -[CKSettingsMessagesController rootController](self, "rootController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRCSController setRootController:](v4, "setRootController:", v6);

    v7 = self->_rcsMessagingController;
    self->_rcsMessagingController = v4;

    rcsMessagingController = self->_rcsMessagingController;
  }
  return rcsMessagingController;
}

- (CKMultipleCTSubscriptionsController)mmsMessagingController
{
  CKMultipleCTSubscriptionsController *mmsMessagingController;
  CKMMSMultipleCTSubscriptionsController *v4;
  void *v5;
  CKMultipleCTSubscriptionsController *v6;

  mmsMessagingController = self->_mmsMessagingController;
  if (!mmsMessagingController)
  {
    v4 = objc_alloc_init(CKMMSMultipleCTSubscriptionsController);
    -[CKMultipleCTSubscriptionsController setHeaderKey:](v4, "setHeaderKey:", CFSTR("MMS_MESSAGING_HEADER"));
    -[CKMultipleCTSubscriptionsController setDefaultsKey:](v4, "setDefaultsKey:", CFSTR("MMSEnabled-"));
    -[CKMultipleCTSubscriptionsController setControllerTitle:](v4, "setControllerTitle:", CFSTR("MMS_MESSAGING"));
    -[CKMMSMultipleCTSubscriptionsController setParentController:](v4, "setParentController:", self);
    -[CKSettingsMessagesController rootController](self, "rootController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMMSMultipleCTSubscriptionsController setRootController:](v4, "setRootController:", v5);

    v6 = self->_mmsMessagingController;
    self->_mmsMessagingController = &v4->super;

    mmsMessagingController = self->_mmsMessagingController;
  }
  return mmsMessagingController;
}

- (PSController)blackholeConversationListViewController
{
  PSController *blackholeConversationListViewController;
  PSController *v4;
  PSController *v5;

  blackholeConversationListViewController = self->_blackholeConversationListViewController;
  if (!blackholeConversationListViewController)
  {
    v4 = (PSController *)objc_alloc_init((Class)CUTWeakLinkClass());
    v5 = self->_blackholeConversationListViewController;
    self->_blackholeConversationListViewController = v4;

    blackholeConversationListViewController = self->_blackholeConversationListViewController;
  }
  return blackholeConversationListViewController;
}

- (id)controllerForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_20;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("MADRID_ACCOUNTS_BUTTON"));

  if (v7)
  {
    -[CNFRegListController regController](self, "regController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "connect:", 1);

    -[CKSettingsMessagesController _madridSettingsController](self, "_madridSettingsController");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("SMS_RELAY_DEVICES"));

    if (v11)
    {
      -[CKSettingsMessagesController _smsRelayDevicesController](self, "_smsRelayDevicesController");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("RCS_MESSAGING_CELL"));

      if (v13)
      {
        -[CKSettingsMessagesController rcsMessagingController](self, "rcsMessagingController");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v5, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("MMS_MESSAGING_CELL"));

        if (v15)
        {
          -[CKSettingsMessagesController mmsMessagingController](self, "mmsMessagingController");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v5, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("JUNK_CONVERSATIONS_BUTTON"));

          if (v17)
          {
            -[CKSettingsMessagesController blackholeConversationListViewController](self, "blackholeConversationListViewController");
            v9 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v5, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("SHARED_WITH_YOU_BUTTON"));

            if (v19)
            {
              -[CKSettingsMessagesController _sharedWithYouViewController](self, "_sharedWithYouViewController");
              v9 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v5, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("IMESSAGE_APPS_BUTTON"));

              if (v21)
              {
                -[CKSettingsMessagesController _iMessageAppsViewController](self, "_iMessageAppsViewController");
                v9 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v5, "identifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("BUSINESS_CHAT_BUTTON"));

                if (!v23)
                {
LABEL_20:
                  v26.receiver = self;
                  v26.super_class = (Class)CKSettingsMessagesController;
                  -[CKSettingsMessagesController controllerForSpecifier:](&v26, sel_controllerForSpecifier_, v5);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_21;
                }
                -[CKSettingsMessagesController _messagesForBusinessViewController](self, "_messagesForBusinessViewController");
                v9 = objc_claimAutoreleasedReturnValue();
              }
            }
          }
        }
      }
    }
  }
  v24 = (void *)v9;
  if (!v9)
    goto LABEL_20;
  self->_showingChildViewController = 1;
LABEL_21:

  return v24;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKSettingsMessagesController;
  v6 = a4;
  -[CKSettingsMessagesController tableView:cellForRowAtIndexPath:](&v13, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKSettingsMessagesController indexForIndexPath:](self, "indexForIndexPath:", v6, v13.receiver, v13.super_class);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("MADRID_SIGNIN_BUTTON"));

    if (v11)
      objc_msgSend(v7, "setAlignment:", 2);

  }
  return v7;
}

- (CKFilteringListController)filteringController
{
  return self->_filteringController;
}

- (void)setFilteringController:(id)a3
{
  objc_storeStrong((id *)&self->_filteringController, a3);
}

- (id)beginMappingID
{
  return objc_getProperty(self, a2, 1416, 1);
}

- (void)setBeginMappingID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (void)setSystemPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_systemPolicy, a3);
}

- (CKSettingsiMessageAppManager)iMessageAppManager
{
  return self->_iMessageAppManager;
}

- (void)setIMessageAppManager:(id)a3
{
  objc_storeStrong((id *)&self->_iMessageAppManager, a3);
}

- (CKLazuliEnablementManager)lazuliEnablementManager
{
  return self->_lazuliEnablementManager;
}

- (void)setLazuliEnablementManager:(id)a3
{
  objc_storeStrong((id *)&self->_lazuliEnablementManager, a3);
}

- (CKSharedSettingsHelper)sharedSettingsHelper
{
  return self->_sharedSettingsHelper;
}

- (void)setSharedSettingsHelper:(id)a3
{
  objc_storeStrong((id *)&self->_sharedSettingsHelper, a3);
}

- (void)setMmsMessagingController:(id)a3
{
  objc_storeStrong((id *)&self->_mmsMessagingController, a3);
}

- (void)setRcsMessagingController:(id)a3
{
  objc_storeStrong((id *)&self->_rcsMessagingController, a3);
}

- (IMCTXPCServiceSubscriptionInfo)ctSubscriptionInfo
{
  return self->_ctSubscriptionInfo;
}

- (void)setCtSubscriptionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_ctSubscriptionInfo, a3);
}

- (CKOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)setOnboardingController:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingController, a3);
}

- (void)setBlackholeConversationListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_blackholeConversationListViewController, a3);
}

- (CKNSExtension)ckExtension
{
  return self->_ckExtension;
}

- (void)setCkExtension:(id)a3
{
  objc_storeStrong((id *)&self->_ckExtension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckExtension, 0);
  objc_storeStrong((id *)&self->_blackholeConversationListViewController, 0);
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_ctSubscriptionInfo, 0);
  objc_storeStrong((id *)&self->_rcsMessagingController, 0);
  objc_storeStrong((id *)&self->_mmsMessagingController, 0);
  objc_storeStrong((id *)&self->_sharedSettingsHelper, 0);
  objc_storeStrong((id *)&self->_lazuliEnablementManager, 0);
  objc_storeStrong((id *)&self->_iMessageAppManager, 0);
  objc_storeStrong((id *)&self->_systemPolicy, 0);
  objc_storeStrong(&self->_beginMappingID, 0);
  objc_storeStrong((id *)&self->_filteringController, 0);
}

- (void)newDNDGlobalConfigurationService
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2138BA000, v0, v1, "Unable to create DNDGlobalConfigurationService", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__CKSettingsMessagesController_satelliteDemoModeTappedWithSpecifier___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2138BA000, a2, OS_LOG_TYPE_ERROR, "Request Satellite Demo error: %@", (uint8_t *)&v4, 0xCu);

}

- (void)_shouldShowSatelliteDemoModeButton
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2138BA000, v0, v1, "Unable to check if demo mode is allowed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
