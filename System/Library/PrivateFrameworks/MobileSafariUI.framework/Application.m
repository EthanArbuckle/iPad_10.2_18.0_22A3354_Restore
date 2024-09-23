@implementation Application

+ (id)sharedApplication
{
  return (id)*MEMORY[0x1E0DC4730];
}

- (WBTabGroupManager)tabGroupManager
{
  WBTabGroupManager *tabGroupManager;
  id v4;
  void *v5;
  void *v6;
  WBTabGroupManager *v7;
  WBTabGroupManager *v8;
  WBTabGroupManager *v9;
  void *v10;
  void *v11;

  tabGroupManager = self->_tabGroupManager;
  if (!tabGroupManager)
  {
    v4 = objc_alloc(MEMORY[0x1E0DCCB60]);
    -[Application tabCollectionConfiguration](self, "tabCollectionConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithConfiguration:openDatabase:", v5, 1);

    v7 = (WBTabGroupManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0DCCB78]), "initWithCollection:", v6);
    v8 = self->_tabGroupManager;
    self->_tabGroupManager = v7;

    v9 = self->_tabGroupManager;
    objc_msgSend(MEMORY[0x1E0DCCB80], "sharedProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager addTabGroupObserver:](v9, "addTabGroupObserver:", v10);

    -[WBTabGroupManager addTabGroupObserver:](self->_tabGroupManager, "addTabGroupObserver:", self);
    objc_msgSend(MEMORY[0x1E0DCCB80], "sharedProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager setSyncAgentProxy:](self->_tabGroupManager, "setSyncAgentProxy:", v11);

    tabGroupManager = self->_tabGroupManager;
  }
  return tabGroupManager;
}

- (id)webExtensionsControllerForProfileServerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_profileServerIDToWebExtensionsControllers, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[Application _createExtensionControllersIfNeededForProfileServerID:](self, "_createExtensionControllersIfNeededForProfileServerID:", v4);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_profileServerIDToWebExtensionsControllers, "objectForKeyedSubscript:", v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXProfiles();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[Application webExtensionsControllerForProfileServerID:].cold.1();
    v9 = 0;
  }

  return v9;
}

- (id)_extendLaunchTest
{
  if (gExtendedLaunchPageLoad == 1)
    return CFSTR("pageLoad");
  else
    return 0;
}

- (void)userDefaultsDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)Application;
  -[Application userDefaultsDidChange:](&v4, sel_userDefaultsDidChange_, a3);
  if (self->_finishedLaunching)
  {
    if (-[Application isSuspended](self, "isSuspended"))
      self->_shouldReadDefaultsOnResume = 1;
    else
      -[Application _readDefaults](self, "_readDefaults");
  }
}

- (void)_readDefaults
{
  if (!self->_isReadingDefaults)
  {
    self->_isReadingDefaults = 1;
    -[BrowserWindowController updateCloudTabUpdatesEnabled](self->_browserWindowController, "updateCloudTabUpdatesEnabled");
    self->_isReadingDefaults = 0;
  }
}

- (BOOL)hasPointerDevice
{
  BOOL v3;
  NSMutableSet *v4;

  if (!SFDeviceSupportsPointerInteractions())
    return 0;
  if ((objc_msgSend(MEMORY[0x1E0CD1198], "isHoverActive") & 1) != 0)
    return 1;
  os_unfair_lock_lock(&self->_pointerDeviceLock);
  v4 = self->_pointerDevices;
  os_unfair_lock_unlock(&self->_pointerDeviceLock);
  v3 = -[NSMutableSet count](v4, "count") != 0;

  return v3;
}

uint64_t __34__Application__pruneExpiredScenes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "persistentIdentifier");
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  NSObject *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFNotificationCenter *DarwinNotifyCenter;
  PinnedTabsManager *v40;
  void *v41;
  BrowserWindowController *v42;
  int v43;
  void *v44;
  BrowserWindowController *v45;
  BrowserWindowController *browserWindowController;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  id v64;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v66;
  uint64_t v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  void *v75;
  CFLocaleRef v76;
  void *v77;
  void *v78;
  WBTabGroupManager *tabGroupManager;
  void *v80;
  NSMutableSet *v81;
  NSMutableSet *pointerDevices;
  void *v83;
  BSInvalidatable *v84;
  BSInvalidatable *pointerDeviceObserverToken;
  id v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t j;
  void *v93;
  id v94;
  void *v95;
  WBSFormAutoFillCorrectionsHistoryObserver *v96;
  WBSFormAutoFillCorrectionsHistoryObserver *formAutoFillCorrectionsHistoryObserver;
  WBTabGroupManager *v98;
  void *v99;
  void *v100;
  void *v101;
  WBSOfflineSearchSuggestionsModelUpdateManager *v102;
  WBSOfflineSearchSuggestionsModelUpdateManager *offlineSearchSuggestionsModelUpdateManager;
  void *v104;
  id v105;
  WBSBackgroundImageAssetController *v106;
  WBSBackgroundImageAssetController *backgroundImageAssetController;
  void *v108;
  CompletionListVendorForHistoryService *v109;
  CompletionListVendorForHistoryService *completionListVendorForHistoryService;
  void *v111;
  id v113;
  id v114;
  PinnedTabsManager *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  _QWORD v123[4];
  id v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD v130[4];
  id v131;
  _QWORD v132[5];
  _QWORD v133[5];
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint8_t buf[8];
  id location;
  _BYTE v140[128];
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v113 = a3;
  v114 = a4;
  objc_initWeak(&location, self);
  v6 = WBS_LOG_CHANNEL_PREFIXSignposts();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LaunchToFirstLoad", (const char *)&unk_1D7ED143D, buf, 2u);
  }
  v7 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "supportsMultipleScenes");
  objc_msgSend(MEMORY[0x1E0D4EF28], "setShouldMergeAllWindowsIfNeeded:", v7 ^ 1u);
  +[WebBookmarkCollection observeDatabaseVacuumNotification]();
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8AB30], "overrideSystemProxiesIfNeeded:", v8);
  objc_msgSend(MEMORY[0x1E0D8AD60], "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performDelayedLaunchOperations");
  v121 = (void *)v8;

  v10 = objc_alloc(MEMORY[0x1E0D4EF88]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariInjectedBundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E98];
  _SFSafariIconImageCacheDirectoryPath();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:isDirectory:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = (void *)objc_msgSend(v10, "initWithInjectedBundleURL:imageCacheDirectoryURL:cacheIsReadOnly:metadataType:", v11, v14, 0, 383);

  objc_msgSend(MEMORY[0x1E0D4EF88], "setSharedSiteMetadataManager:", v120);
  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "webui_applySafariCookieAcceptPolicy");

  objc_msgSend(MEMORY[0x1E0CD57A0], "loadSystemLanguageProperties");
  v16 = +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v17 = (void *)MEMORY[0x1E0D89D08];
  objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUpSharedObserverWithSearchProviderContext:", v18);

  v19 = *MEMORY[0x1E0D89E20];
  -[Application webExtensionsControllerForProfileServerID:](self, "webExtensionsControllerForProfileServerID:", *MEMORY[0x1E0D89E20]);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0CD5748]);
  -[Application tabGroupManager](self, "tabGroupManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = (void *)objc_msgSend(v20, "initWithExtensionsController:profileProvider:", v116, v21);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_notificationNameForUserDefaultsKey:", *MEMORY[0x1E0D89E38]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObserver:selector:name:object:", self, sel__didEnableCustomizationSync, v23, 0);

  -[Application tabGroupManager](self, "tabGroupManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "defaultProfile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[Application _loadExtensionsInProfile:](self, "_loadExtensionsInProfile:", v25);

  -[Application webExtensionsControllerForProfileServerID:](self, "webExtensionsControllerForProfileServerID:", v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4EBE8], "sharedProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWebExtensionsController:", v26);

  -[Application tabGroupManager](self, "tabGroupManager");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  objc_msgSend(v122, "namedProfiles");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v134, v141, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v135;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v135 != v30)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v134 + 1) + 8 * i), "identifierForExtensions");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[Application _createExtensionControllersIfNeededForProfileServerID:](self, "_createExtensionControllersIfNeededForProfileServerID:", v32);

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v134, v141, 16);
    }
    while (v29);
  }

  -[Application _setWKWebsiteDataStoreDelegate](self, "_setWKWebsiteDataStoreDelegate");
  v33 = (void *)MEMORY[0x1E0D4ED48];
  -[Application proxy](self, "proxy");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setApplicationProxy:", v34);

  -[Application _readFocusConfigurationKeys](self, "_readFocusConfigurationKeys");
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_notificationNameForUserDefaultsKey:", *MEMORY[0x1E0D89F00]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObserver:selector:name:object:", self, sel__profileFocusConfigurationChanged, v36, 0);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_notificationNameForUserDefaultsKey:", *MEMORY[0x1E0D89FC0]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObserver:selector:name:object:", self, sel__tabGroupFocusConfigurationChanged, v38, 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)deviceDidLock, CFSTR("com.apple.springboard.lockcomplete"), 0, (CFNotificationSuspensionBehavior)1024);
  -[Application updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing](self, "updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing");
  if ((objc_msgSend(v122, "hasCompletedMigration") & 1) == 0 && objc_msgSend(v122, "isPersistent"))
    +[SharedDataMigration migrateTabDatabaseIfNeeded](SharedDataMigration, "migrateTabDatabaseIfNeeded");
  objc_msgSend(v122, "browserState");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = [PinnedTabsManager alloc];
  objc_msgSend(v122, "tabCollection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = -[PinnedTabsManager initWithBrowserState:tabCollection:](v40, "initWithBrowserState:tabCollection:", v119, v41);

  v42 = [BrowserWindowController alloc];
  v43 = -[Application supportsMultipleScenes](self, "supportsMultipleScenes");
  objc_msgSend((id)objc_opt_class(), "browserControllerUIDelegateProvider");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[BrowserWindowController initWithTabGroupManager:browserState:pinnedTabsManager:perSitePreferencesVendor:shouldMergeAllWindowsIfNeeded:browserControllerUIDelegateProvider:](v42, "initWithTabGroupManager:browserState:pinnedTabsManager:perSitePreferencesVendor:shouldMergeAllWindowsIfNeeded:browserControllerUIDelegateProvider:", v122, v119, v115, v117, v43 ^ 1u, v44);
  browserWindowController = self->_browserWindowController;
  self->_browserWindowController = v45;

  -[Application _pruneExpiredScenes](self, "_pruneExpiredScenes");
  -[BrowserWindowController browserControllers](self->_browserWindowController, "browserControllers");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "count");

  if (v48)
  {
    -[BrowserWindowController browserControllers](self->_browserWindowController, "browserControllers");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "firstObject");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "processPool");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "_warmInitialProcess");

  }
  v52 = *MEMORY[0x1E0D4F4B8];
  v53 = v121;
  objc_msgSend(v121, "objectForKey:", *MEMORY[0x1E0D4F4B8]);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    if ((objc_msgSend(v118, "BOOLValue") & 1) == 0)
    {
      objc_msgSend(v117, "sharedUserMediaPermissionController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "cameraMediaCapturePreference");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setDefaultValue:ofPreference:completionHandler:", &unk_1E9D61FC0, v55, 0);

      objc_msgSend(v54, "microphoneMediaCapturePreference");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setDefaultValue:ofPreference:completionHandler:", &unk_1E9D61FC0, v56, 0);

      objc_msgSend(MEMORY[0x1E0CB35B0], "_sf_postPerSitePreferencesDidChangeDistributedNotification");
      v53 = v121;
    }
    objc_msgSend(v53, "removeObjectForKey:", v52);
  }
  -[Application _prewarmAutomationControllerIfEnabled](self, "_prewarmAutomationControllerIfEnabled");
  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setUsesOpportunisticPushTopic:", 0);

  if ((objc_msgSend(v121, "BOOLForKey:", CFSTR("didMigrateHistoryToCoreSpotlightAfterUpgrade")) & 1) == 0)
    -[Application performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__export30DaysWorthOfHistoryAfterUpgrade, 0, 60.0);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v58, "registerObserver:", self);
  else
    objc_msgSend(v58, "addObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__applicationWillResignActive_, *MEMORY[0x1E0DC4868], self);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], self);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], self);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], self);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__updateKeyboardCorrectionLearningAllowed, *MEMORY[0x1E0DC4E70], 0);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__historyHostnamesWereRemoved_, *MEMORY[0x1E0D8B0D0], 0);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__historyWasCleared_, *MEMORY[0x1E0D8B0F8], 0);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__historyItemsWereRemoved_, *MEMORY[0x1E0D8B0E8], 0);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__frequentlyVisitedSitesWereChanged_, *MEMORY[0x1E0D8B0A8], 0);
  -[Application _clearInvalidCertificateBypassesOlderThanOneWeek](self, "_clearInvalidCertificateBypassesOlderThanOneWeek");
  v60 = *MEMORY[0x1E0D4F490];
  if ((objc_msgSend(v121, "BOOLForKey:", *MEMORY[0x1E0D4F490]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD5730], "clearOldCertificateBypasses");
    objc_msgSend(v121, "setBool:forKey:", 1, v60);
  }
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = *MEMORY[0x1E0DC5738];
  v133[0] = MEMORY[0x1E0C809B0];
  v133[1] = 3221225472;
  v133[2] = __57__Application_application_didFinishLaunchingWithOptions___block_invoke;
  v133[3] = &unk_1E9CF1A68;
  v133[4] = self;
  v63 = (id)objc_msgSend(v59, "addObserverForName:object:queue:usingBlock:", v62, self, v61, v133);
  v64 = (id)objc_msgSend(v59, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0D8AF10], 0, 0, &__block_literal_global_146);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_localeChanged, (CFStringRef)*MEMORY[0x1E0C9B070], 0, (CFNotificationSuspensionBehavior)1025);
  v66 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)_carrierBundledChanged, (CFStringRef)*MEMORY[0x1E0CA7488], 0, (CFNotificationSuspensionBehavior)1024);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__appleKeyboardsChanged_, CFSTR("AppleKeyboardsPreferencesChangedNotification"), 0);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)_autoFillStateChanged, CFSTR("com.apple.mobilesafari.AutoFillStateChanged"), 0, (CFNotificationSuspensionBehavior)1024);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)_quickWebsiteSearchProvidersChanged, CFSTR("com.apple.mobilesafari.QuickWebsiteSearchProvidersDidChange"), 0, (CFNotificationSuspensionBehavior)1024);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)_webFilterSettingsDidChange, (CFStringRef)*MEMORY[0x1E0DCCBE0], 0, (CFNotificationSuspensionBehavior)1024);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)siriSuggestionsStateDidChange, CFSTR("com.apple.suggestions.settingsChanged"), 0, (CFNotificationSuspensionBehavior)1024);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)screenTimeRestrictionsStateDidChange, (CFStringRef)screenTimeManagementStateDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1024);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)screenTimeRestrictionsStateDidChange, (CFStringRef)screenTimePasscodeStateDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1024);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)safariSettingsChangedExtensionSettings, CFSTR("com.apple.mobilesafari.SafariSettingsChangedExtensionSettings"), 0, (CFNotificationSuspensionBehavior)1024);
  v67 = *MEMORY[0x1E0D8B718];
  v68 = (id)objc_msgSend(v59, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0D8B718], 0, v61, &__block_literal_global_153);
  v69 = (id)objc_msgSend(v59, "addObserverForName:object:queue:usingBlock:", v67, 0, v61, &__block_literal_global_154);
  v70 = (id)objc_msgSend(v59, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0D8B040], 0, v61, &__block_literal_global_154);
  v71 = (id)objc_msgSend(v59, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0D8B058], 0, v61, &__block_literal_global_154);
  v72 = (id)objc_msgSend(v59, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0D8B060], 0, v61, &__block_literal_global_154);
  v73 = *MEMORY[0x1E0D8B3F8];
  v132[0] = MEMORY[0x1E0C809B0];
  v132[1] = 3221225472;
  v132[2] = __57__Application_application_didFinishLaunchingWithOptions___block_invoke_8;
  v132[3] = &unk_1E9CF1A68;
  v132[4] = self;
  v74 = (id)objc_msgSend(v59, "addObserverForName:object:queue:usingBlock:", v73, 0, v61, v132);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObserver:selector:name:object:", self, sel__updateCloudFeatureAvailability, *MEMORY[0x1E0DCCBF0], 0);

  -[Application _updateCloudFeatureAvailability](self, "_updateCloudFeatureAvailability");
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)contentBlockerDidChange, (CFStringRef)*MEMORY[0x1E0CD5808], 0, (CFNotificationSuspensionBehavior)1028);
  v76 = CFLocaleCopyCurrent();
  +[History localeChanged:](History, "localeChanged:", v76);
  CFRelease(v76);
  objc_msgSend(MEMORY[0x1E0DD9738], "scheduleEmptyDatabaseRemoval");
  -[Application _readDefaults](self, "_readDefaults");
  -[Application setReceivesMemoryWarnings:](self, "setReceivesMemoryWarnings:", 1);
  objc_msgSend(MEMORY[0x1E0D4ED80], "sharedTracker");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "load");

  objc_msgSend(MEMORY[0x1E0D4ECA0], "sharedTracker");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "load");

  objc_msgSend(MEMORY[0x1E0D8ACA0], "warmUp");
  tabGroupManager = self->_tabGroupManager;
  objc_msgSend(MEMORY[0x1E0D8ACA0], "defaultManager");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager addTabGroupObserver:](tabGroupManager, "addTabGroupObserver:", v80);

  -[Application _showSearchEngineAlertIfNeeded](self, "_showSearchEngineAlertIfNeeded");
  if (SFDeviceSupportsPointerInteractions())
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v81 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    pointerDevices = self->_pointerDevices;
    self->_pointerDevices = v81;

    self->_pointerDeviceLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D00D78], "sharedInstance");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "addPointerDeviceObserver:", self);
    v84 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    pointerDeviceObserverToken = self->_pointerDeviceObserverToken;
    self->_pointerDeviceObserverToken = v84;

  }
  self->_finishedLaunching = 1;
  v86 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v130[0] = MEMORY[0x1E0C809B0];
  v130[1] = 3221225472;
  v130[2] = __57__Application_application_didFinishLaunchingWithOptions___block_invoke_10;
  v130[3] = &unk_1E9CF19F8;
  v87 = v86;
  v131 = v87;
  performBlockForBrowserControllers(v130);
  -[Application tabGroupManager](self, "tabGroupManager");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addTabGroupObserver:", self);

  -[Application prewarmAndRemoveOrphanedProfileDataStores](self, "prewarmAndRemoveOrphanedProfileDataStores");
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  -[WBTabGroupManager allSyncedTabGroupsExceptRemoteUnnamedTabGroups](self->_tabGroupManager, "allSyncedTabGroupsExceptRemoteUnnamedTabGroups");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v126, v140, 16);
  if (v90)
  {
    v91 = *(_QWORD *)v127;
    do
    {
      for (j = 0; j != v90; ++j)
      {
        if (*(_QWORD *)v127 != v91)
          objc_enumerationMutation(v89);
        objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * j), "tabsUUIDSet");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "unionSet:", v93);

      }
      v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v126, v140, 16);
    }
    while (v90);
  }

  +[TabSnapshotCache removeSavedSnapshotsKeepingSnapshotsWithIdentifiers:](TabSnapshotCache, "removeSavedSnapshotsKeepingSnapshotsWithIdentifiers:", v87);
  v94 = objc_alloc(MEMORY[0x1E0D8A930]);
  objc_msgSend(MEMORY[0x1E0D8A938], "standardStore");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (WBSFormAutoFillCorrectionsHistoryObserver *)objc_msgSend(v94, "initWithCorrectionsStore:", v95);
  formAutoFillCorrectionsHistoryObserver = self->_formAutoFillCorrectionsHistoryObserver;
  self->_formAutoFillCorrectionsHistoryObserver = v96;

  -[Application _addDefaultsObserver](self, "_addDefaultsObserver");
  v98 = self->_tabGroupManager;
  objc_msgSend(v120, "tabGroupIconProvider");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager addTabGroupObserver:](v98, "addTabGroupObserver:", v99);

  -[Application _reportLaunchAnalyticsSoon](self, "_reportLaunchAnalyticsSoon");
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "hasInternalContent"))
    -[Application _connectToCyclerIfNecessary](self, "_connectToCyclerIfNecessary");
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__webBookmarksDidReload, *MEMORY[0x1E0DCCC00], 0);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__webBookmarksDidReload, CFSTR("bookmarkCollectionHasBecomeAvailableNotification"), 0);
  objc_msgSend(MEMORY[0x1E0DCCB80], "sharedProxy");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "scheduleSyncIfNeeded");

  objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setExtraDownloadDelegate:", self);

  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__downloadDidStartNotification_, *MEMORY[0x1E0CD5890], 0);
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__downloadDidStopNotification_, *MEMORY[0x1E0CD5898], 0);
  objc_msgSend(MEMORY[0x1E0D4EF70], "registerBookmarkCollectionFactory:", &__block_literal_global_176);
  v102 = (WBSOfflineSearchSuggestionsModelUpdateManager *)objc_alloc_init(MEMORY[0x1E0D8AA40]);
  offlineSearchSuggestionsModelUpdateManager = self->_offlineSearchSuggestionsModelUpdateManager;
  self->_offlineSearchSuggestionsModelUpdateManager = v102;

  +[LaunchStateController sharedController](LaunchStateController, "sharedController");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = __57__Application_application_didFinishLaunchingWithOptions___block_invoke_12;
  v123[3] = &unk_1E9CF1BF8;
  objc_copyWeak(&v125, &location);
  v105 = v121;
  v124 = v105;
  objc_msgSend(v104, "doAfterUIBecomesActive:", v123);

  -[Application lockPrivateBrowsing](self, "lockPrivateBrowsing");
  v106 = (WBSBackgroundImageAssetController *)objc_alloc_init(MEMORY[0x1E0D8A7B8]);
  backgroundImageAssetController = self->_backgroundImageAssetController;
  self->_backgroundImageAssetController = v106;

  -[WBSBackgroundImageAssetController setDelegate:](self->_backgroundImageAssetController, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v101) = objc_msgSend(v108, "BOOLForKey:", *MEMORY[0x1E0D8B020]);

  if ((_DWORD)v101)
  {
    v109 = -[WBSCompletionListVendorForHistoryService initWithDataSource:]([CompletionListVendorForHistoryService alloc], "initWithDataSource:", self);
    completionListVendorForHistoryService = self->_completionListVendorForHistoryService;
    self->_completionListVendorForHistoryService = v109;

  }
  objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setIndexDelegate:", self);

  -[Application _showExtensionPermissionBannerIfNecessary](self, "_showExtensionPermissionBannerIfNecessary");
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel_reloadContentBlockers, *MEMORY[0x1E0D89E88], 0);

  objc_destroyWeak(&v125);
  objc_destroyWeak(&location);

  return 1;
}

- (void)updateLockedPrivateBrowsingState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(&dword_1D7CA3000, v0, v1, "Private Browsing unlocked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (BOOL)_shouldLockPrivateBrowsing
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x1E0D89BE8], "isLockedPrivateBrowsingEnabled");
  if (v3)
  {
    v3 = -[Application privateBrowsingRequiresAuthentication](self, "privateBrowsingRequiresAuthentication");
    if (v3)
    {
      v3 = -[Application _hasLockablePrivateTabsOpenInAnyWindow](self, "_hasLockablePrivateTabsOpenInAnyWindow");
      if (v3)
        LOBYTE(v3) = self->_shouldPrivateBrowsingBeLockedIfPossible;
    }
  }
  return v3;
}

- (BOOL)privateBrowsingRequiresAuthentication
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D8B210]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v3, "BOOLValue"))
    v4 = 0;
  else
    v4 = objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D8B2C8]);

  return v4;
}

- (HistoryController)historyController
{
  HistoryController *historyController;
  HistoryController *v4;
  HistoryController *v5;

  historyController = self->_historyController;
  if (!historyController)
  {
    v4 = objc_alloc_init(HistoryController);
    v5 = self->_historyController;
    self->_historyController = v4;

    historyController = self->_historyController;
  }
  return historyController;
}

- (void)updateTabCount
{
  performBlockForBrowserControllers(&__block_literal_global_91);
}

- (void)clearCachedTabCompletionData
{
  -[WBSBrowserTabCompletionProvider invalidate](self->_tabCompletionProvider, "invalidate");
}

- (NSArray)browserControllers
{
  return -[BrowserWindowController browserControllers](self->_browserWindowController, "browserControllers");
}

void __47__Application__numberOfTabsForPrivateBrowsing___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v3, "privateTabs");
  else
    objc_msgSend(v3, "normalTabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v4, "count");

}

void __29__Application_updateTabCount__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "tabController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTabCount");

}

- (void)lockPrivateBrowsing
{
  if (!self->_privateBrowsingLocked)
  {
    self->_shouldPrivateBrowsingBeLockedIfPossible = 1;
    -[Application updateLockedPrivateBrowsingState](self, "updateLockedPrivateBrowsingState");
  }
}

- (void)_showSearchEngineAlertIfNeeded
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _Unwind_Exception *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D4F110];
  objc_msgSend(v2, "stringForKey:", *MEMORY[0x1E0D4F110]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MGCopyAnswer();
  objc_msgSend(v2, "setObject:forKey:", v5, v3);
  if (_SFDeviceRegionCodeIsRussia() && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    if (!v4)
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v6 = getDMGetUserDataDispositionSymbolLoc_ptr;
      v21 = getDMGetUserDataDispositionSymbolLoc_ptr;
      if (!getDMGetUserDataDispositionSymbolLoc_ptr)
      {
        v7 = (void *)DataMigrationLibrary();
        v6 = dlsym(v7, "DMGetUserDataDisposition");
        v19[3] = (uint64_t)v6;
        getDMGetUserDataDispositionSymbolLoc_ptr = v6;
      }
      _Block_object_dispose(&v18, 8);
      if (v6)
      {
        v9 = ((uint64_t (*)(uint64_t))v6)(v8);
        v18 = 0;
        v19 = &v18;
        v20 = 0x2020000000;
        v10 = getDMGetPreviousBuildVersionSymbolLoc_ptr;
        v21 = getDMGetPreviousBuildVersionSymbolLoc_ptr;
        if (!getDMGetPreviousBuildVersionSymbolLoc_ptr)
        {
          v11 = (void *)DataMigrationLibrary();
          v10 = dlsym(v11, "DMGetPreviousBuildVersion");
          v19[3] = (uint64_t)v10;
          getDMGetPreviousBuildVersionSymbolLoc_ptr = v10;
        }
        _Block_object_dispose(&v18, 8);
        if (v10)
        {
          v13 = (void *)((uint64_t (*)(uint64_t))v10)(v12);
          v14 = v13;
          if ((v9 & 2) != 0 && v13)
          {
            v15 = objc_msgSend(v13, "compare:options:", CFSTR("18F0"), 64, v18);

            if (v15 == -1)
              goto LABEL_16;
          }
          else
          {

          }
          goto LABEL_15;
        }
      }
      else
      {
        -[Application _showSearchEngineAlertIfNeeded].cold.1();
      }
      v17 = (_Unwind_Exception *)-[Application _showSearchEngineAlertIfNeeded].cold.1();
      _Block_object_dispose(&v18, 8);
      _Unwind_Resume(v17);
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0D4ED88], "searchEngineSettingAlert", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scheduleWithCompletionBlock:", &__block_literal_global_217);

  }
LABEL_16:

}

+ (id)browserControllerUIDelegateProvider
{
  const void *v2;

  if (browserControllerUIDelegateProvider)
    v2 = (const void *)browserControllerUIDelegateProvider;
  else
    v2 = &__block_literal_global_298;
  return _Block_copy(v2);
}

- (SystemNoteTakingController)systemNoteTakingController
{
  SystemNoteTakingController *systemNoteTakingController;
  SystemNoteTakingController *v4;
  SystemNoteTakingController *v5;

  systemNoteTakingController = self->_systemNoteTakingController;
  if (!systemNoteTakingController)
  {
    v4 = objc_alloc_init(SystemNoteTakingController);
    v5 = self->_systemNoteTakingController;
    self->_systemNoteTakingController = v4;

    -[WBSSystemNoteTakingController setDelegate:](self->_systemNoteTakingController, "setDelegate:", self);
    systemNoteTakingController = self->_systemNoteTakingController;
  }
  return systemNoteTakingController;
}

- (BOOL)needsFocusedTabGroupUpdate
{
  return self->_needsFocusedTabGroupUpdate;
}

- (BOOL)needsFocusProfileUpdate
{
  return self->_needsFocusProfileUpdate;
}

- (void)_pruneExpiredScenes
{
  void *v3;
  id v4;

  -[Application openSessions](self, "openSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_238);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[BrowserWindowController removeWindowsNotMatchingSceneIDs:supportsMultipleScenes:](self->_browserWindowController, "removeWindowsNotMatchingSceneIDs:supportsMultipleScenes:", v4, -[Application supportsMultipleScenes](self, "supportsMultipleScenes"));
}

- (void)_showExtensionPermissionBannerIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  -[Application webExtensionsControllerForProfileServerID:](self, "webExtensionsControllerForProfileServerID:", *MEMORY[0x1E0D89E20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composedIdentifiersOfExtensionsWithAutomaticallyGrantedPermissions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__Application__showExtensionPermissionBannerIfNecessary__block_invoke;
  v9[3] = &unk_1E9CF22E8;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    -[Application browserControllers](self, "browserControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showExtensionPermissionBannerForExtensions:", v5);

  }
}

uint64_t __91__Application_updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 != 2)
  {
    v3 = v2 == 0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D8AEA0]);

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", *(unsigned __int8 *)(a1 + 56), *MEMORY[0x1E0D8B210]);

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInteger:forKey:", *(_QWORD *)(a1 + 48), *MEMORY[0x1E0D8AEA8]);

  return objc_msgSend(*(id *)(a1 + 32), "updateLockedPrivateBrowsingState");
}

- (void)_createExtensionControllersIfNeededForProfileServerID:(id)a3
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
  NSMutableDictionary *v15;
  NSMutableDictionary *profileServerIDToWebExtensionsControllers;
  NSMutableDictionary *v17;
  NSMutableDictionary *profileServerIDToContentBlockerManagers;
  char v19;
  id v20;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_profileServerIDToWebExtensionsControllers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_profileServerIDToContentBlockerManagers, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v19 = objc_msgSend(MEMORY[0x1E0D8ADC8], "isProfileServerIDForDefaultProfile:", v4);
      -[Application _userContentControllerForProfileServerID:](self, "_userContentControllerForProfileServerID:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EF08]), "initWithProfileServerID:userContentController:", v4, v7);
      objc_msgSend(v8, "setDelegate:", self);
      objc_msgSend(v8, "setProfileDelegate:", self);
      -[Application processPoolForProfileIdentifier:](self, "processPoolForProfileIdentifier:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setProcessPool:", v9);
      _SFApplicationNameForUserAgent();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setApplicationNameForUserAgent:", v10);

      objc_msgSend(v8, "setNavigationIntentHandler:", self);
      objc_msgSend(v8, "initializeWebKitControllerIfNeededFromSettings:", 0);
      objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addProvider:", v8);

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD55C8]), "initWithUserContentController:webExtensionsController:", v7, v8);
      objc_msgSend(v12, "setWebExtensionsController:", v8);
      objc_msgSend(v12, "setDelegate:", self);
      objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addProvider:", v12);

      if ((v19 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CD55C8], "contentBlockerStore");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v7;
        WBSLoadBuiltInContentBlockersWithStore();

      }
      if (!self->_profileServerIDToWebExtensionsControllers)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        profileServerIDToWebExtensionsControllers = self->_profileServerIDToWebExtensionsControllers;
        self->_profileServerIDToWebExtensionsControllers = v15;

      }
      if (!self->_profileServerIDToContentBlockerManagers)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        profileServerIDToContentBlockerManagers = self->_profileServerIDToContentBlockerManagers;
        self->_profileServerIDToContentBlockerManagers = v17;

      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_profileServerIDToWebExtensionsControllers, "setObject:forKeyedSubscript:", v8, v4);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_profileServerIDToContentBlockerManagers, "setObject:forKeyedSubscript:", v12, v4);
      objc_msgSend(v8, "findExtensions");

    }
  }

}

void __57__Application__suspendOrResumeWallpaperAnimationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 632), a2);
}

- (void)loadExtensionsInProfileIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "identifierForExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[Application webExtensionsControllerForProfileServerID:](self, "webExtensionsControllerForProfileServerID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "loadEnabledExtensionsWasCalled");

  if ((v6 & 1) == 0)
    -[Application _loadExtensionsInProfile:](self, "_loadExtensionsInProfile:", v7);

}

- (BOOL)shouldRestoreStateForPPT
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = -[Application isRunningPPT](self, "isRunningPPT");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("shouldRestoreStateForPPT"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)isRunningPPT
{
  if ((-[Application launchedToTest](self, "launchedToTest") & 1) != 0)
    return 1;
  else
    return -[Application isRunningTest](self, "isRunningTest");
}

- (id)tabCollectionConfiguration
{
  void *v3;

  if (-[Application shouldRestoreStateForPPT](self, "shouldRestoreStateForPPT"))
    objc_msgSend(MEMORY[0x1E0DCCB18], "pptTabCollectionConfiguration");
  else
    objc_msgSend(MEMORY[0x1E0DCCB18], "safariTabCollectionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaximumTabsPerTabGroup:", -[Application maximumTabCountAllowingMoreTabs:](self, "maximumTabCountAllowingMoreTabs:", 1));
  return v3;
}

- (unint64_t)maximumTabCount
{
  return -[Application maximumTabCountAllowingMoreTabs:](self, "maximumTabCountAllowingMoreTabs:", 0);
}

- (BOOL)canAddNewTabForPrivateBrowsing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  unint64_t v7;

  v3 = a3;
  if (a3)
  {
    -[Application primaryBrowserController](self, "primaryBrowserController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPrivateBrowsingAvailable");

    if (!v6)
      return 0;
  }
  v7 = -[Application _numberOfTabsForPrivateBrowsing:](self, "_numberOfTabsForPrivateBrowsing:", v3);
  return v7 < -[Application maximumTabCount](self, "maximumTabCount");
}

- (unint64_t)_numberOfTabsForPrivateBrowsing:(BOOL)a3
{
  unint64_t v3;
  _QWORD v5[5];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__Application__numberOfTabsForPrivateBrowsing___block_invoke;
  v5[3] = &unk_1E9CF1A20;
  v5[4] = &v7;
  v6 = a3;
  performBlockForBrowserControllers(v5);
  v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_12(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  char v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  BookmarkImporter *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  SpotlightBookmarksDonationWriter *v14;
  id v15;
  void *v16;
  id *v17;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v17 = WeakRetained;
    objc_msgSend(WeakRetained, "_didEnableCustomizationSync");
    v3 = *MEMORY[0x1E0D89EF0];
    v4 = objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", *MEMORY[0x1E0D89EF0]);
    v5 = objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", *MEMORY[0x1E0D89E40]);
    if ((v4 & 1) == 0 && v5 && v17[114])
    {
      objc_msgSend(*(id *)(a1 + 32), "setBool:forKey:", 1, v3);
      objc_msgSend(v17[114], "syncPerSiteSettingsUpWithCompletion:", &__block_literal_global_178);
      objc_msgSend(v17[114], "syncPerSiteSettingsDownWithCompletion:", &__block_literal_global_179);
    }
    +[SafariCloudBookmarksMigrationCoordinator migrationCoordinator](SafariCloudBookmarksMigrationCoordinator, "migrationCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startCoordinatingMigration");

    objc_msgSend(v17[98], "checkForModelUpdatesOrRemoteDisablementIfNeeded");
    objc_msgSend(MEMORY[0x1E0D4ED58], "sharedVoiceUtilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAvailableVoiceLanguages");

    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BookmarkImporter initWithBookmarkCollection:]([BookmarkImporter alloc], "initWithBookmarkCollection:", v8);
    -[BookmarkImporter importBuiltinBookmarks](v9, "importBuiltinBookmarks");
    objc_msgSend(v8, "bookmarksInFavoritesList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_prefixWithMaxLength:", 60);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scheduleLowPriorityRequestForBookmarks:", v12);

    objc_msgSend(MEMORY[0x1E0D89CF8], "sharedStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShouldWarmDataStoreAfterReset:", 1);

    v14 = objc_alloc_init(SpotlightBookmarksDonationWriter);
    v15 = v17[100];
    v17[100] = v14;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v16, "BOOLForKey:", *MEMORY[0x1E0D8AFE8]);

    if ((v12 & 1) == 0)
      objc_msgSend(v17[100], "donateAllBookmarks");

    WeakRetained = v17;
  }

}

- (void)_frequentlyVisitedSitesWereChanged:(id)a3
{
  NSMutableSet *pendingFrequentlyVisitedSites;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    pendingFrequentlyVisitedSites = self->_pendingFrequentlyVisitedSites;
    if (!pendingFrequentlyVisitedSites)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v6 = self->_pendingFrequentlyVisitedSites;
      self->_pendingFrequentlyVisitedSites = v5;

      pendingFrequentlyVisitedSites = self->_pendingFrequentlyVisitedSites;
    }
    -[NSMutableSet addObject:](pendingFrequentlyVisitedSites, "addObject:", v7);
  }

}

- (id)sfWebExtensionsController:(id)a3 windowWithID:(double)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[Application browserControllers](self, "browserControllers", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "webExtensionWindowWithID:", a4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)enumerateContentBlockerManagersUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[Application allContentBlockerManagers](self, "allContentBlockerManagers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)sfWebExtensionsControllerContentBlockerListDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "profileServerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[Application contentBlockerManagerForProfileServerID:](self, "contentBlockerManagerForProfileServerID:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "informObserversThatContentBlockerManagerExtensionListDidChange");
}

- (void)_loadExtensionsInProfile:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v19 = 138477827;
    v20 = v4;
    _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_INFO, "Loading extensions in profile %{private}@", (uint8_t *)&v19, 0xCu);
  }
  objc_msgSend(v4, "identifierForExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[Application webExtensionsControllerForProfileServerID:](self, "webExtensionsControllerForProfileServerID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D8ADB0];
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "migrateStorageToPerProfileFormatIfNecessaryWithDefaults:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D8ADC0]);
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safari_settingsDirectoryURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithUserDefaults:safariContainerSettingsDirectoryURL:", v11, v13);

  objc_msgSend(v14, "migrateSQLiteStorageToWebKitIfNecessary");
  objc_msgSend(v7, "loadEnabledExtensions");
  if (objc_msgSend(v7, "hasDiscoveredExtensions"))
    objc_msgSend(v7, "loadSuitableDiscoveredExtensions");
  v15 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1D7CA3000, v15, OS_LOG_TYPE_INFO, "Creating SFContentBlockerManager", (uint8_t *)&v19, 2u);
  }
  objc_msgSend(v4, "identifierForExtensions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[Application contentBlockerManagerForProfileServerID:](self, "contentBlockerManagerForProfileServerID:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = 138477827;
    v20 = v17;
    _os_log_impl(&dword_1D7CA3000, v18, OS_LOG_TYPE_INFO, "Calling reloadUserContentControllerReadingStateFromDisk on: %{private}@", (uint8_t *)&v19, 0xCu);
  }
  objc_msgSend(v17, "reloadUserContentControllerReadingStateFromDisk:", 0);

}

- (id)contentBlockerManagerForProfileServerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_profileServerIDToContentBlockerManagers, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[Application _createExtensionControllersIfNeededForProfileServerID:](self, "_createExtensionControllersIfNeededForProfileServerID:", v4);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_profileServerIDToContentBlockerManagers, "objectForKeyedSubscript:", v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXProfiles();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[Application contentBlockerManagerForProfileServerID:].cold.1();
    v9 = 0;
  }

  return v9;
}

- (id)allContentBlockerManagers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[Application tabGroupManager](self, "tabGroupManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "namedProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "identifierForExtensions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[Application _createExtensionControllersIfNeededForProfileServerID:](self, "_createExtensionControllersIfNeededForProfileServerID:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary allValues](self->_profileServerIDToContentBlockerManagers, "allValues");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allWebExtensionsControllers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[Application tabGroupManager](self, "tabGroupManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "namedProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "identifierForExtensions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[Application _createExtensionControllersIfNeededForProfileServerID:](self, "_createExtensionControllersIfNeededForProfileServerID:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary allValues](self->_profileServerIDToWebExtensionsControllers, "allValues");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setObject:(id)a3 forInjectedBundleParameter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[Application allProcessPools](self, "allProcessPools", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_setObject:forBundleParameter:", v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)processPoolForProfileIdentifier:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    -[Application _initializeProcessPoolForProfileIdentifier:](self, "_initializeProcessPoolForProfileIdentifier:", v4);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_processPools, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSArray)allProcessPools
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[Application tabGroupManager](self, "tabGroupManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[Application _initializeProcessPoolForProfileIdentifier:](self, "_initializeProcessPoolForProfileIdentifier:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary allValues](self->_processPools, "allValues");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_initializeProcessPoolForProfileIdentifier:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *processPools;
  WKProcessPool *v7;
  id v8;

  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_processPools, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (!self->_processPools)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      processPools = self->_processPools;
      self->_processPools = v5;

    }
    v7 = +[BrowserController newProcessPool](BrowserController, "newProcessPool");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processPools, "setObject:forKeyedSubscript:", v7, v8);

  }
}

- (void)_readFocusConfigurationKeys
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Missing FTG UUID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (HighlightManager)highlightManager
{
  HighlightManager *highlightManager;
  HighlightManager *v4;
  HighlightManager *v5;

  highlightManager = self->_highlightManager;
  if (!highlightManager)
  {
    v4 = objc_alloc_init(HighlightManager);
    v5 = self->_highlightManager;
    self->_highlightManager = v4;

    highlightManager = self->_highlightManager;
  }
  return highlightManager;
}

uint64_t __47__Application__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isPrivateBrowsingLocked");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_hasPrivateBrowserControllerActiveInAnyWindow");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "authenticateToUnlockPrivateBrowsingWithCompletionHandler:", 0);
  }
  return result;
}

- (void)updateShouldLockPrivateBrowsingWithTimerIfNecessary
{
  void *v3;
  BOOL v4;
  int v5;
  void *v6;
  NSTimer *lockPrivateBrowsingInBackgroundTimer;
  void *v8;
  double v9;
  double v10;
  NSTimer *v11;
  NSTimer *v12;
  void *v13;
  NSTimer *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D8AEA8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v15, "intValue") != 2;
  if (-[Application _hasPrivateBrowserControllerActiveInAnyWindow](self, "_hasPrivateBrowserControllerActiveInAnyWindow")|| -[Application isPrivateBrowsingLocked](self, "isPrivateBrowsingLocked"))
  {
    v5 = 0;
  }
  else
  {
    v5 = !-[Application _mediaIsPlayingInPrivateBrowsing](self, "_mediaIsPlayingInPrivateBrowsing");
  }
  v6 = v15;
  if (v4)
  {
    lockPrivateBrowsingInBackgroundTimer = self->_lockPrivateBrowsingInBackgroundTimer;
    if (v5)
    {
      if (!lockPrivateBrowsingInBackgroundTimer)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_doubleForKey:defaultValue:", *MEMORY[0x1E0D8AFD0], 30.0);
        v10 = v9;

        objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_lockPrivateBrowsing, 0, 0, v10);
        v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        v12 = self->_lockPrivateBrowsingInBackgroundTimer;
        self->_lockPrivateBrowsingInBackgroundTimer = v11;

        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addTimer:forMode:", self->_lockPrivateBrowsingInBackgroundTimer, *MEMORY[0x1E0C99748]);

LABEL_16:
        v6 = v15;
      }
    }
    else if (lockPrivateBrowsingInBackgroundTimer)
    {
      -[NSTimer invalidate](lockPrivateBrowsingInBackgroundTimer, "invalidate");
      v14 = self->_lockPrivateBrowsingInBackgroundTimer;
      self->_lockPrivateBrowsingInBackgroundTimer = 0;

      goto LABEL_16;
    }
  }
  else if (v5)
  {
    -[Application lockPrivateBrowsing](self, "lockPrivateBrowsing");
    goto LABEL_16;
  }

}

- (BOOL)isPrivateBrowsingLocked
{
  return self->_privateBrowsingLocked;
}

- (BOOL)_mediaIsPlayingInPrivateBrowsing
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[Application browserControllers](self, "browserControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v27;
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v7, "tabController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "privateTabDocuments");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              if ((objc_msgSend(v15, "isAudible") & 1) != 0)
                goto LABEL_22;
              objc_msgSend(v7, "tabDocumentPlayingPIPVideo");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15 == v16)
                goto LABEL_22;
              objc_msgSend(v15, "webView");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v17, "cameraCaptureState") == 1)
              {

LABEL_22:
                v19 = 1;
                goto LABEL_23;
              }
              v18 = objc_msgSend(v17, "microphoneCaptureState");

              if (v18 == 1)
                goto LABEL_22;
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            v5 = v21;
            if (v12)
              continue;
            break;
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v19 = 0;
    }
    while (v4);
  }
  else
  {
    v19 = 0;
  }
LABEL_23:

  return v19;
}

- (BOOL)_hasPrivateBrowserControllerActiveInAnyWindow
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[Application browserControllers](self, "browserControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isShowingPrivateTabs")
          && (objc_msgSend(v6, "activeWindowIsForeground") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (void)prewarmAndRemoveOrphanedProfileDataStores
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[Application tabGroupManager](self, "tabGroupManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allNamedProfileIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = (id)objc_msgSend(MEMORY[0x1E0CEF650], "safari_dataStoreForProfileWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v11 = (void *)MEMORY[0x1E0CEF650];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__Application_prewarmAndRemoveOrphanedProfileDataStores__block_invoke;
  v16[3] = &unk_1E9CF1C48;
  v17 = v4;
  v12 = v4;
  objc_msgSend(v11, "_fetchAllIdentifiers:", v16);
  v13 = (void *)MEMORY[0x1E0D8AB00];
  -[Application tabGroupManager](self, "tabGroupManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allProfileIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clearCachedDataForProfilesWithIdentifiersNotInSet:", v15);

}

- (void)_didEnableCustomizationSync
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  SafariSettingsSyncEngine *v7;
  SafariSettingsSyncEngine *settingsSyncEngine;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D89E38]);

  if ((v4 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E0D89E40]),
        v5,
        v6))
  {
    if (self->_settingsSyncEngine)
      return;
    v7 = objc_alloc_init(SafariSettingsSyncEngine);
    settingsSyncEngine = self->_settingsSyncEngine;
    self->_settingsSyncEngine = v7;
LABEL_8:

    return;
  }
  settingsSyncEngine = self->_settingsSyncEngine;
  if (settingsSyncEngine)
  {
    self->_settingsSyncEngine = 0;
    goto LABEL_8;
  }
}

- (void)_clearInvalidCertificateBypassesOlderThanOneWeek
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D8A818], "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearCertificateBypassesCreatedBeforeDate:", v2);

}

- (void)startCommandLineTest
{
  void *v3;
  id v4;
  uint64_t v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (gTestOptions && objc_msgSend((id)gTestOptions, "count"))
  {
    v3 = (void *)gTestOptions;
    gTestOptions = 0;
    v4 = v3;

    objc_msgSend(v4, "objectForKey:", CFSTR("testName"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = (__CFString *)v5;
    else
      v6 = CFSTR("PLT");
    -[Application runTest:options:](self, "runTest:options:", v6, v4);

  }
  if (gTestController)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend((id)gTestController, "setDelegate:", gTestController);
    v7 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = 138543362;
      v10 = objc_opt_class();
      _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_DEFAULT, "Running %{public}@", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend((id)gTestController, "runTestsAndStoreResultsIn:completionHandler:", gTestResults, &__block_literal_global_2);
  }
}

- (SFWebExtensionsController)defaultWebExtensionsController
{
  void *v2;
  void *v3;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webExtensionsControllerForProfileServerID:", *MEMORY[0x1E0D89E20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFWebExtensionsController *)v3;
}

- (BrowserWindowController)browserWindowController
{
  return self->_browserWindowController;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_DEFAULT, "Application will enter foreground", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPrivateBrowsingWindow");

  +[WBSParsecDSession sendLaunchFeedbackWithEvent:isPrivate:usesLoweredSearchBar:](MEMORY[0x1E0D8AA78], 7, v6, -[Application usesLoweredSearchBar](self, "usesLoweredSearchBar"));
  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsesOpportunisticPushTopic:", 0);

  -[BrowserWindowController updateCloudTabsForEnteringForeground](self->_browserWindowController, "updateCloudTabsForEnteringForeground");
  if (objc_msgSend(MEMORY[0x1E0D8A7A8], "shouldCloseTabsAutomaticallyWhenEnteringForeground"))
  {
    objc_msgSend(MEMORY[0x1E0D8A7A8], "clearMostDistantLastViewedTime");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[BrowserWindowController browserControllers](self->_browserWindowController, "browserControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "tabController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "closeTabsAutomaticallyIfNecessary");

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }

  }
  +[ApplicationShortcutController updateShortcutItemsIfNeeded](ApplicationShortcutController, "updateShortcutItemsIfNeeded");
  -[Application updateShouldLockPrivateBrowsingWithTimerIfNecessary](self, "updateShouldLockPrivateBrowsingWithTimerIfNecessary");
  +[LaunchStateController sharedController](LaunchStateController, "sharedController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__Application__applicationWillEnterForeground___block_invoke;
  v17[3] = &unk_1E9CF1900;
  v17[4] = self;
  objc_msgSend(v14, "doAfterUIBecomesActive:", v17);

  +[AppStoreReviewController sharedController](AppStoreReviewController, "sharedController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applicationDidEnterForeground");

  -[Application tabGroupManager](self, "tabGroupManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "enableDevicePresenceReporting");

}

- (BOOL)usesLoweredSearchBar
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredCapsuleLayoutStyle") != 2;

  return v3;
}

- (void)_reportLaunchAnalyticsSoon
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  _QWORD v7[5];
  id v8;
  char v9;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrivateBrowsingWindow");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__Application__reportLaunchAnalyticsSoon__block_invoke;
  v7[3] = &unk_1E9CF1D28;
  v9 = v5;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v6, "performOnAnalyticsQueueWithDelay:block:", 5, v7);

}

- (void)_applicationDidBecomeActive:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_DEFAULT, "Application did become active", buf, 2u);
  }
  -[Application _suspendOrResumeWallpaperAnimationIfNeeded](self, "_suspendOrResumeWallpaperAnimationIfNeeded");
  if (self->_resigningActive)
  {
    self->_resigningActive = 0;
    self->_willEnterSuspendedState = 0;
    if (self->_shouldReadDefaultsOnResume)
      -[Application _readDefaults](self, "_readDefaults");
    objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSuspended:", 0);

    v6 = MEMORY[0x1E0D8AA78];
    objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSParsecDSession sendLaunchFeedbackWithEvent:isPrivate:usesLoweredSearchBar:](v6, 26, objc_msgSend(v7, "hasPrivateBrowsingWindow"), -[Application usesLoweredSearchBar](self, "usesLoweredSearchBar"));

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[BrowserWindowController browserControllers](self->_browserWindowController, "browserControllers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "scene");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            ++v11;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    v15 = -[Application _numberOfTabsForPrivateBrowsing:](self, "_numberOfTabsForPrivateBrowsing:", 0);
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reportNumberOfWindows:", v11);
    objc_msgSend(v16, "reportNumberOfTabs:", v15);
    if (v11)
      v17 = (uint64_t)(float)((float)v15 / (float)v11);
    else
      v17 = 0;
    objc_msgSend(v16, "reportNumberOfTabsPerWindow:", v17);
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLForKey:", *MEMORY[0x1E0D89E38]);

    if ((v19 & 1) != 0)
    {
      v20 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v21, "BOOLForKey:", *MEMORY[0x1E0D89E40]);

    }
    objc_msgSend(v16, "reportCustomizationSyncEnablement:", v20);

  }
}

- (void)_suspendOrResumeWallpaperAnimationIfNeeded
{
  char v3;
  SBSAssertion *wallpaperSuspensionAssertion;

  v3 = -[Application isSuspended](self, "isSuspended");
  wallpaperSuspensionAssertion = self->_wallpaperSuspensionAssertion;
  if ((v3 & 1) != 0)
  {
    self->_wallpaperSuspensionAssertion = 0;

  }
  else if (!wallpaperSuspensionAssertion)
  {
    SBSAcquireWallpaperAnimationSuspensionAssertion();
  }
}

void __98__Application__determineIfAuthenticationIsAvailableForLockedPrivateBrowsingWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CD5710], "sharedObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "doesUserHavePasscodeSet");

  objc_msgSend(MEMORY[0x1E0CD5710], "sharedObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "biometryTypeCurrentlyAvailableForDevice");

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D8B2C8]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CD5710], "sharedObserver");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isUserEnrolledInBiometricAuthentication");

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __91__Application_updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing__block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v8;
  _QWORD v9[7];
  char v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __91__Application_updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing__block_invoke_2;
    v9[3] = &unk_1E9CF1C98;
    v10 = a2;
    v9[5] = a3;
    v9[6] = a4;
    v9[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], v9);
  }

}

+ (void)initialize
{
  char v2;

  if ((id)objc_opt_class() == a1)
  {
    if ((MGGetBoolAnswer() & 1) != 0)
      v2 = 1;
    else
      v2 = MGGetBoolAnswer();
    highTabCapacityDevice = v2;
    screenTimeManagementStateDidChangeNotification = (uint64_t)CFStringCreateWithCString(0, (const char *)*MEMORY[0x1E0D8C078], 0x600u);
    screenTimePasscodeStateDidChangeNotification = (uint64_t)CFStringCreateWithCString(0, (const char *)*MEMORY[0x1E0D8C080], 0x600u);
  }
}

void __66__Application__getBookmarksDataClassEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v3, "aa_primaryAppleAccountWithPreloadedDataclasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isEnabledForDataclass:", *MEMORY[0x1E0C8F368]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __46__Application__updateCloudFeatureAvailability__block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__Application__updateCloudFeatureAvailability__block_invoke_2;
  v2[3] = &unk_1E9CF1EE8;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __46__Application__updateCloudFeatureAvailability__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  _QWORD *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];

  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudHistorySyncAvailable");

  v4 = *(_QWORD **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    objc_msgSend(v4, "_resetCloudHistoryAccountIfNeeded");
    +[History sharedHistory](History, "sharedHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "releaseCloudHistory:", &__block_literal_global_273);

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 544);
    *(_QWORD *)(v7 + 544) = 0;

  }
  else if (v4[68])
  {
    objc_msgSend(v4, "_resetCloudHistoryAccountIfNeeded");
  }
  else
  {
    +[History sharedHistory](History, "sharedHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CloudHistoryConfiguration sharedConfiguration](CloudHistoryConfiguration, "sharedConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__Application__updateCloudFeatureAvailability__block_invoke_3;
    v14[3] = &unk_1E9CF1EA0;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "initializeCloudHistoryWithConfiguration:completionHandler:", v11, v14);

  }
  if (+[WBUFeatureManager accessLevel](FeatureManager, "accessLevel") == 2)
  {
    +[CloudTabStore sharedCloudTabStore](CloudTabStore, "sharedCloudTabStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __46__Application__updateCloudFeatureAvailability__block_invoke_2_cold_1();
    objc_msgSend(v12, "synchronizeCloudTabDevices");

  }
}

- (void)_resetCloudHistoryAccountIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DCCC38];
  v5 = v3;
  if (objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0DCCC38]))
  {
    objc_msgSend(v5, "removeObjectForKey:", v4);
    -[WBSCloudHistoryServiceProtocol resetForAccountChangeWithCompletionHandler:](self->_cloudHistory, "resetForAccountChangeWithCompletionHandler:", &__block_literal_global_265);
  }

}

- (void)_getBookmarksDataClassEnabledWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v3 = a3;
  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCloudSyncAvailable");

  if ((v5 & 1) != 0)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__Application__getBookmarksDataClassEnabledWithCompletionHandler___block_invoke;
    block[3] = &unk_1E9CF1950;
    v8 = v3;
    dispatch_async(v6, block);

  }
  else if (v3)
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

- (void)_updateCloudFeatureAvailability
{
  void *v3;
  int v4;
  _QWORD v5[5];

  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCloudSyncAvailable");

  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__Application__updateCloudFeatureAvailability__block_invoke;
    v5[3] = &unk_1E9CF16A0;
    v5[4] = self;
    -[Application _getBookmarksDataClassEnabledWithCompletionHandler:](self, "_getBookmarksDataClassEnabledWithCompletionHandler:", v5);
  }
}

- (void)_setWKWebsiteDataStoreDelegate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(MEMORY[0x1E0CEF650], "safari_allPersistentDataStores", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "set_delegate:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_prewarmAutomationControllerIfEnabled
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *developerPreferencesDidChangeNotificationToken;
  _QWORD v8[5];

  if (objc_msgSend(MEMORY[0x1E0CD5648], "isSystemRemoteAutomationEnabled"))
  {
    v3 = -[Application automationController](self, "automationController");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0CD5870];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__Application__prewarmAutomationControllerIfEnabled__block_invoke;
    v8[3] = &unk_1E9CF1A68;
    v8[4] = self;
    objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, 0, 0, v8);
    v6 = objc_claimAutoreleasedReturnValue();
    developerPreferencesDidChangeNotificationToken = self->_developerPreferencesDidChangeNotificationToken;
    self->_developerPreferencesDidChangeNotificationToken = v6;

  }
}

- (void)updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __91__Application_updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing__block_invoke;
  v3[3] = &unk_1E9CF1CC0;
  objc_copyWeak(&v4, &location);
  -[Application _determineIfAuthenticationIsAvailableForLockedPrivateBrowsingWithCompletionHandler:](self, "_determineIfAuthenticationIsAvailableForLockedPrivateBrowsingWithCompletionHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_determineIfAuthenticationIsAvailableForLockedPrivateBrowsingWithCompletionHandler:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__Application__determineIfAuthenticationIsAvailableForLockedPrivateBrowsingWithCompletionHandler___block_invoke;
  block[3] = &unk_1E9CF1950;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

BrowserControllerDefaultUIDelegate *__50__Application_browserControllerUIDelegateProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BrowserControllerDefaultUIDelegate *v3;

  v2 = a2;
  v3 = -[BrowserControllerDefaultUIDelegate initWithBrowserController:]([BrowserControllerDefaultUIDelegate alloc], "initWithBrowserController:", v2);

  return v3;
}

- (void)_connectToCyclerIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Multiple cyclers enabled. Only one will be used.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_addDefaultsObserver
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  const __CFString *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v4 = *MEMORY[0x1E0D4F118];
  v50 = *MEMORY[0x1E0D4EFB8];
  v51 = v4;
  v5 = *MEMORY[0x1E0D4F178];
  v52 = *MEMORY[0x1E0D4F128];
  v53 = v5;
  v6 = *MEMORY[0x1E0D4F1C8];
  v54 = *MEMORY[0x1E0D4F180];
  v55 = v6;
  v7 = *MEMORY[0x1E0D4F318];
  v56 = *MEMORY[0x1E0D4F310];
  v57 = v7;
  v8 = *MEMORY[0x1E0D4F328];
  v58 = *MEMORY[0x1E0D4F320];
  v59 = v8;
  v9 = *MEMORY[0x1E0D4F338];
  v60 = *MEMORY[0x1E0D4F330];
  v61 = v9;
  v10 = *MEMORY[0x1E0D4F348];
  v62 = *MEMORY[0x1E0D4F340];
  v63 = v10;
  v11 = *MEMORY[0x1E0D89FD8];
  v64 = *MEMORY[0x1E0D4F350];
  v65 = v11;
  v12 = *MEMORY[0x1E0D4F528];
  v66 = *MEMORY[0x1E0D4F398];
  v67 = v12;
  v13 = *MEMORY[0x1E0D4F690];
  v68 = *MEMORY[0x1E0D4F530];
  v69 = v13;
  v14 = *MEMORY[0x1E0D4F6C0];
  v70 = CFSTR("DebugBarCollapsingBehavior");
  v71 = v14;
  v15 = *MEMORY[0x1E0D4F1F0];
  v72 = CFSTR("SpeculativeLoading");
  v73 = v15;
  v16 = *MEMORY[0x1E0D8B2C8];
  v74 = *MEMORY[0x1E0D89E40];
  v75 = v16;
  v76 = *MEMORY[0x1E0D4EFD8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v44;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v21++), 3, userDefaultsObserverContext);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v19);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariSharedDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v23 = *MEMORY[0x1E0D4F5C8];
  v50 = *MEMORY[0x1E0D4F658];
  v51 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v40;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(v22, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v28++), 3, userDefaultsObserverContext);
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v26);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "webui_defaults");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v50 = *MEMORY[0x1E0DD9958];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(v29, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v34++), 3, userDefaultsObserverContext);
      }
      while (v32 != v34);
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v32);
  }

}

void __56__Application_prewarmAndRemoveOrphanedProfileDataStores__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138543362;
    v13 = v5;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "UUIDString", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10) & 1) == 0)
        {
          v11 = WBS_LOG_CHANNEL_PREFIXOther();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v13;
            v21 = v10;
            _os_log_fault_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_FAULT, "WKWebsiteDataStore with identifier %{public}@ does not correspond to any Safari profile, deleting", buf, 0xCu);
          }
          v12 = (void *)MEMORY[0x1E0CEF650];
          v14[0] = v8;
          v14[1] = 3221225472;
          v14[2] = __56__Application_prewarmAndRemoveOrphanedProfileDataStores__block_invoke_190;
          v14[3] = &unk_1E9CF1C20;
          v15 = v10;
          objc_msgSend(v12, "safari_removeDataStoreForProfileWithIdentifier:completionHandler:", v15, v14);

        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v6);
  }

}

- (BrowserController)primaryBrowserController
{
  void *v2;
  void *v3;

  -[Application browserControllers](self, "browserControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BrowserController *)v3;
}

- (BOOL)usesDefaultBrowsingModeInAllWindows
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[Application browserControllers](self, "browserControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isPrivateBrowsingEnabled") & 1) != 0
          || (objc_msgSend(v7, "isControlledByAutomation") & 1) != 0)
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 1;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 1;
  }
LABEL_13:

  return v8;
}

- (BOOL)usesPrivateBrowsingModeInAnyWindow
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[Application browserControllers](self, "browserControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isPrivateBrowsingEnabled") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_hasLockablePrivateTabsOpenInAnyWindow
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[Application browserControllers](self, "browserControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "tabController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pinnedTabsManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "privatePinnedTabs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {
LABEL_19:

          v16 = 1;
          goto LABEL_21;
        }
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v7, "privateTabs", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              if (!objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "isBlank"))
              {

                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v16 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_21:

  return v16;
}

- (void)setPrivateBrowsingRequiresAuthentication:(BOOL)a3
{
  if (a3)
    self->_shouldPrivateBrowsingBeLockedIfPossible = 1;
  -[Application updateLockedPrivateBrowsingState](self, "updateLockedPrivateBrowsingState");
}

- (void)unlockPrivateBrowsing
{
  if (self->_privateBrowsingLocked)
  {
    self->_shouldPrivateBrowsingBeLockedIfPossible = 0;
    -[Application updateLockedPrivateBrowsingState](self, "updateLockedPrivateBrowsingState");
  }
}

- (void)authenticateToUnlockPrivateBrowsingWithCompletionHandler:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *lockedPrivateBrowsingAuthenticationCompletionHandlers;
  NSMutableArray *v7;
  void *v8;
  LAContext **p_lockedPrivateBrowsingAuthenticationContext;
  NSObject *v10;
  LAContext *v11;
  LAContext *v12;
  LAContext *v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  NSObject *v20;
  LAContext *v21;
  NSObject *v22;
  NSMutableArray *v23;
  LAContext *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_lockedPrivateBrowsingAuthenticationCompletionHandlers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    lockedPrivateBrowsingAuthenticationCompletionHandlers = self->_lockedPrivateBrowsingAuthenticationCompletionHandlers;
    self->_lockedPrivateBrowsingAuthenticationCompletionHandlers = v5;

  }
  if (v4)
  {
    v7 = self->_lockedPrivateBrowsingAuthenticationCompletionHandlers;
    v8 = _Block_copy(v4);
    -[NSMutableArray addObject:](v7, "addObject:", v8);

  }
  p_lockedPrivateBrowsingAuthenticationContext = &self->_lockedPrivateBrowsingAuthenticationContext;
  if (self->_lockedPrivateBrowsingAuthenticationContext)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXPrivateBrowsing();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[Application authenticateToUnlockPrivateBrowsingWithCompletionHandler:].cold.3();
  }
  else
  {
    v11 = (LAContext *)objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v12 = *p_lockedPrivateBrowsingAuthenticationContext;
    *p_lockedPrivateBrowsingAuthenticationContext = v11;

    v13 = *p_lockedPrivateBrowsingAuthenticationContext;
    v26 = 0;
    v14 = -[LAContext canEvaluatePolicy:error:](v13, "canEvaluatePolicy:error:", 2, &v26);
    v15 = v26;
    v16 = v15;
    if (v14)
    {
      v27[0] = &unk_1E9D61F90;
      _WBSLocalizedString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = &unk_1E9D61FA8;
      v28[0] = v17;
      _WBSLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      v20 = WBS_LOG_CHANNEL_PREFIXPrivateBrowsing();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[Application authenticateToUnlockPrivateBrowsingWithCompletionHandler:].cold.1();
      v21 = *p_lockedPrivateBrowsingAuthenticationContext;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __72__Application_authenticateToUnlockPrivateBrowsingWithCompletionHandler___block_invoke;
      v25[3] = &unk_1E9CF1858;
      v25[4] = self;
      -[LAContext evaluatePolicy:options:reply:](v21, "evaluatePolicy:options:reply:", 2, v19, v25);
    }
    else
    {
      if (v15)
      {
        v22 = WBS_LOG_CHANNEL_PREFIXOther();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[Application authenticateToUnlockPrivateBrowsingWithCompletionHandler:].cold.2(v22);
      }
      -[NSMutableArray firstObject](self->_lockedPrivateBrowsingAuthenticationCompletionHandlers, "firstObject");
      v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v23 = self->_lockedPrivateBrowsingAuthenticationCompletionHandlers;
      self->_lockedPrivateBrowsingAuthenticationCompletionHandlers = 0;

      v24 = *p_lockedPrivateBrowsingAuthenticationContext;
      *p_lockedPrivateBrowsingAuthenticationContext = 0;

      if (v19)
        v19[2](v19, 0);
    }

  }
}

void __72__Application_authenticateToUnlockPrivateBrowsingWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__Application_authenticateToUnlockPrivateBrowsingWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E9CF1830;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __72__Application_authenticateToUnlockPrivateBrowsingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 752);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 752);
  *(_QWORD *)(v3 + 752) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 744);
  *(_QWORD *)(v5 + 744) = 0;

  v7 = (_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 40))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __72__Application_authenticateToUnlockPrivateBrowsingWithCompletionHandler___block_invoke_2_cold_1((uint64_t)v7, v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "unlockPrivateBrowsing");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v2;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13), *v7 == 0);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)applicationWillSuspend
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)Application;
  -[Application applicationWillSuspend](&v3, sel_applicationWillSuspend);
  self->_shouldReadDefaultsOnResume = 0;
  self->_willEnterSuspendedState = 1;
}

- (void)saveChangesToCloudHistoryStore
{
  -[WBSCloudHistoryServiceProtocol saveChangesBypassingThrottler:completionHandler:](self->_cloudHistory, "saveChangesBypassingThrottler:completionHandler:", +[WBUFeatureManager accessLevel](FeatureManager, "accessLevel") == 2, &__block_literal_global_0);
}

void __45__Application_saveChangesToCloudHistoryStore__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __45__Application_saveChangesToCloudHistoryStore__block_invoke_cold_1(v3);
  }

}

- (void)_updateKeyboardCorrectionLearningAllowed
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  id v5;

  -[Application browserControllers](self, "browserControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_firstObjectPassingTest:", &__block_literal_global_37);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCorrectionLearningAllowed:", v4);

}

uint64_t __55__Application__updateKeyboardCorrectionLearningAllowed__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsKeyboardCorrectionLearning") ^ 1;

  return v3;
}

- (void)_applicationWillResignActive:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_DEFAULT, "Application will resign active", v6, 2u);
  }
  if (!self->_resigningActive)
  {
    self->_resigningActive = 1;
    -[Application saveChangesToCloudHistoryStore](self, "saveChangesToCloudHistoryStore");
    objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSuspended:", 1);

  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *activeDownloads;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[8];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_DEFAULT, "Application did enter background", buf, 2u);
  }
  +[ApplicationShortcutController updateShortcutItemsIfNeeded](ApplicationShortcutController, "updateShortcutItemsIfNeeded");
  -[Application _performBookmarksDatabaseTasksInBackground](self, "_performBookmarksDatabaseTasksInBackground");
  -[Application _reportBookmarksDatabaseHealth](self, "_reportBookmarksDatabaseHealth");
  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsesOpportunisticPushTopic:", 1);

  v6 = MEMORY[0x1E0D8AA78];
  objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSParsecDSession sendSuspendFeedbackWithEvent:isPrivate:](v6, 23, objc_msgSend(v7, "hasPrivateBrowsingWindow"));

  -[BrowserWindowController updateCloudTabsForEnteringBackground](self->_browserWindowController, "updateCloudTabsForEnteringBackground");
  -[Application _suspendOrResumeWallpaperAnimationIfNeeded](self, "_suspendOrResumeWallpaperAnimationIfNeeded");
  objc_msgSend(MEMORY[0x1E0CD57E8], "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "savePendingChanges");

  objc_msgSend(MEMORY[0x1E0D4EC68], "applicationDidEnterBackground");
  v9 = self->_activeDownloads;
  activeDownloads = self->_activeDownloads;
  self->_activeDownloads = 0;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v9;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
        objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "shouldExcludeDownloadFromList:", v16);

        if (v18)
          objc_msgSend(v16, "cancel");
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v13);
  }

  -[Application updateShouldLockPrivateBrowsingWithTimerIfNecessary](self, "updateShouldLockPrivateBrowsingWithTimerIfNecessary");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[Application allWebExtensionsControllers](self, "allWebExtensionsControllers", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v23++), "didDeactivateWindow");
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v21);
  }

  -[Application tabGroupManager](self, "tabGroupManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "disableDevicePresenceReporting");

  objc_msgSend(MEMORY[0x1E0D8AC68], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "donatePendingTabDataNowWithCompletionHandler:", 0);

}

- (void)_reportBookmarksDatabaseHealth
{
  BookmarksDatabaseHealthReporter *bookmarksDatabaseHealthReporter;
  BookmarksDatabaseHealthReporter *v4;
  BookmarksDatabaseHealthReporter *v5;

  bookmarksDatabaseHealthReporter = self->_bookmarksDatabaseHealthReporter;
  if (!bookmarksDatabaseHealthReporter)
  {
    v4 = objc_alloc_init(BookmarksDatabaseHealthReporter);
    v5 = self->_bookmarksDatabaseHealthReporter;
    self->_bookmarksDatabaseHealthReporter = v4;

    bookmarksDatabaseHealthReporter = self->_bookmarksDatabaseHealthReporter;
  }
  -[BookmarksDatabaseHealthReporter reportDatabaseHealth](bookmarksDatabaseHealthReporter, "reportDatabaseHealth");
}

- (void)_performBookmarksDatabaseTasksInBackground
{
  uint64_t v3;
  void *v4;
  NSObject *v6;
  WBDatabaseLockAcquisitor *v7;
  WBDatabaseLockAcquisitor *bookmarksDatabaseBackgroundTaskLockAcquisitor;
  void *v9;
  void *v10;
  int v11;
  double v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (self->_bookmarksDatabaseBackgroundTaskIdentifier == *MEMORY[0x1E0DC4878] && v3 != 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_DEFAULT, "Performing bookmarks database background tasks", buf, 2u);
    }
    v7 = (WBDatabaseLockAcquisitor *)objc_msgSend(objc_alloc(MEMORY[0x1E0DCCB20]), "initWithWebBookmarkCollectionClass:", objc_opt_class());
    bookmarksDatabaseBackgroundTaskLockAcquisitor = self->_bookmarksDatabaseBackgroundTaskLockAcquisitor;
    self->_bookmarksDatabaseBackgroundTaskLockAcquisitor = v7;

    -[WBDatabaseLockAcquisitor setDelegate:](self->_bookmarksDatabaseBackgroundTaskLockAcquisitor, "setDelegate:", self);
    v9 = (void *)*MEMORY[0x1E0DC4730];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__Application__performBookmarksDatabaseTasksInBackground__block_invoke;
    v15[3] = &unk_1E9CF1900;
    v15[4] = self;
    self->_bookmarksDatabaseBackgroundTaskIdentifier = objc_msgSend(v9, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.mobilesafari.PerformBookmarksDatabaseTasks"), v15);
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasInMemoryChanges");

    v12 = 0.0;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didEnterBackgroundWithBookmarksInMemory");

      v12 = 10.0;
    }
    v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v12;
      _os_log_impl(&dword_1D7CA3000, v14, OS_LOG_TYPE_DEFAULT, "Attempting to acquire bookmark lock to perform background tasks with timeout %f", buf, 0xCu);
    }
    -[WBDatabaseLockAcquisitor acquireLockWithTimeout:](self->_bookmarksDatabaseBackgroundTaskLockAcquisitor, "acquireLockWithTimeout:", v12);
    -[Application _saveFrequentlyVisitedListsToDatabaseIfNeeded](self, "_saveFrequentlyVisitedListsToDatabaseIfNeeded");
  }

}

uint64_t __57__Application__performBookmarksDatabaseTasksInBackground__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t v4;

  v2 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __57__Application__performBookmarksDatabaseTasksInBackground__block_invoke_cold_1();
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "releaseLock");
  v4 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 520) != *MEMORY[0x1E0DC4878])
  {
    result = objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520) = v4;
  }
  return result;
}

- (void)databaseLockAcquisitor:(id)a3 acquiredLock:(BOOL)a4
{
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD aBlock[5];

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__Application_databaseLockAcquisitor_acquiredLock___block_invoke;
  aBlock[3] = &unk_1E9CF1900;
  aBlock[4] = self;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4)
  {
    objc_msgSend(v8, "applyInMemoryChangesToDatabase");

    -[Application reloadReadingListWidgetIfNeeded](self, "reloadReadingListWidgetIfNeeded");
    v7[2](v7);
  }
  else
  {
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __51__Application_databaseLockAcquisitor_acquiredLock___block_invoke_2;
    v10[3] = &unk_1E9CF1950;
    v11 = v7;
    objc_msgSend(v9, "persistChangesWithCompletion:", v10);

  }
}

uint64_t __51__Application_databaseLockAcquisitor_acquiredLock___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "releaseLock");
  v3 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 520) != *MEMORY[0x1E0DC4878])
  {
    result = objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520) = v3;
  }
  return result;
}

uint64_t __51__Application_databaseLockAcquisitor_acquiredLock___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didSaveInMemoryBookmarksToSideFile");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_saveFrequentlyVisitedListsToDatabaseIfNeeded
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSMutableSet *pendingFrequentlyVisitedSites;
  _QWORD block[5];
  _QWORD v15[4];
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_pendingFrequentlyVisitedSites)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v3 = MEMORY[0x1E0C809B0];
    v4 = (void *)*MEMORY[0x1E0DC4730];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke;
    v21[3] = &unk_1E9CF1780;
    v21[4] = &v22;
    v5 = objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.mobilesafari.PerformFrequentlyVisitedSitesTasks"), v21);
    v23[3] = v5;
    v6 = dispatch_group_create();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_pendingFrequentlyVisitedSites;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          dispatch_group_enter(v6);
          v15[0] = v3;
          v15[1] = 3221225472;
          v15[2] = __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke_65;
          v15[3] = &unk_1E9CF1900;
          v16 = v6;
          objc_msgSend(v11, "saveFrequentlyVisitedSitesToBookmarksDBWithCompletion:", v15);

        }
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
      }
      while (v8);
    }

    -[Application tabGroupManager](self, "tabGroupManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "disableSuddenTerminationForPendingChanges");

    pendingFrequentlyVisitedSites = self->_pendingFrequentlyVisitedSites;
    self->_pendingFrequentlyVisitedSites = 0;

    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke_2;
    block[3] = &unk_1E9CF1780;
    block[4] = &v22;
    dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(&v22, 8);
  }
}

void __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  v2 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke_cold_1();
  v3 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  }
}

void __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke_65(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    v2 = result;
    result = objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = v1;
  }
  return result;
}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  performBlockForBrowserControllers(&__block_literal_global_67);
  v3.receiver = self;
  v3.super_class = (Class)Application;
  -[Application didReceiveMemoryWarning](&v3, sel_didReceiveMemoryWarning);
}

uint64_t __38__Application_didReceiveMemoryWarning__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReceiveMemoryWarning");
}

+ (unint64_t)systemMemorySize
{
  if (systemMemorySize___once != -1)
    dispatch_once(&systemMemorySize___once, &__block_literal_global_70);
  return systemMemorySize_systemPhysicalMemorySize;
}

void __31__Application_systemMemorySize__block_invoke()
{
  host_t v0;
  mach_error_t v1;
  NSObject *v2;
  double v3;
  mach_msg_type_number_t host_info_outCnt;
  integer_t host_info_out[4];
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  *(_OWORD *)host_info_out = 0u;
  v0 = MEMORY[0x1D82A1A1C]();
  host_info_outCnt = 12;
  v1 = host_info(v0, 1, host_info_out, &host_info_outCnt);
  mach_port_deallocate(*MEMORY[0x1E0C83DA0], v0);
  if (v1)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __31__Application_systemMemorySize__block_invoke_cold_1(v2, v1);
  }
  v3 = log2((double)*((unint64_t *)&v7 + 1));
  systemMemorySize_systemPhysicalMemorySize = (unint64_t)exp2(ceil(v3));
}

- (void)handleKeyUIEvent:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (useUIResponderMethodsForModifierFlags_onceToken != -1)
    dispatch_once(&useUIResponderMethodsForModifierFlags_onceToken, &__block_literal_global_994);
  if (!useUIResponderMethodsForModifierFlags_flag)
    self->_currentKeyboardModifierFlags = objc_msgSend(v4, "_modifierFlags");
  v5.receiver = self;
  v5.super_class = (Class)Application;
  -[Application handleKeyUIEvent:](&v5, sel_handleKeyUIEvent_, v4);

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (useUIResponderMethodsForModifierFlags_onceToken != -1)
    dispatch_once(&useUIResponderMethodsForModifierFlags_onceToken, &__block_literal_global_994);
  if (useUIResponderMethodsForModifierFlags_flag)
    self->_currentKeyboardModifierFlags = objc_msgSend(v7, "modifierFlags");
  v8.receiver = self;
  v8.super_class = (Class)Application;
  -[Application pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (useUIResponderMethodsForModifierFlags_onceToken != -1)
    dispatch_once(&useUIResponderMethodsForModifierFlags_onceToken, &__block_literal_global_994);
  if (useUIResponderMethodsForModifierFlags_flag)
    self->_currentKeyboardModifierFlags = objc_msgSend(v7, "modifierFlags");
  v8.receiver = self;
  v8.super_class = (Class)Application;
  -[Application pressesChanged:withEvent:](&v8, sel_pressesChanged_withEvent_, v6, v7);

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (useUIResponderMethodsForModifierFlags_onceToken != -1)
    dispatch_once(&useUIResponderMethodsForModifierFlags_onceToken, &__block_literal_global_994);
  if (useUIResponderMethodsForModifierFlags_flag)
    self->_currentKeyboardModifierFlags = objc_msgSend(v7, "modifierFlags");
  v8.receiver = self;
  v8.super_class = (Class)Application;
  -[Application pressesEnded:withEvent:](&v8, sel_pressesEnded_withEvent_, v6, v7);

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (useUIResponderMethodsForModifierFlags_onceToken != -1)
    dispatch_once(&useUIResponderMethodsForModifierFlags_onceToken, &__block_literal_global_994);
  if (useUIResponderMethodsForModifierFlags_flag)
    self->_currentKeyboardModifierFlags = objc_msgSend(v7, "modifierFlags");
  v8.receiver = self;
  v8.super_class = (Class)Application;
  -[Application pressesCancelled:withEvent:](&v8, sel_pressesCancelled_withEvent_, v6, v7);

}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)Application;
  -[Application buildMenuWithBuilder:](&v8, sel_buildMenuWithBuilder_, v4);
  objc_msgSend(v4, "system");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39F0], "mainSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(MEMORY[0x1E0D4EBE8], "sharedProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMenusForSafariWithBuilder:", v4);

  }
}

- (void)_reloadSearchEngines
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSearchEngines");

}

- (void)_managedProfileConfigurationDidUpdate
{
  performBlockForBrowserControllers(&__block_literal_global_88);
}

void __52__Application__managedProfileConfigurationDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "updateJavaScriptPreferences");
  objc_msgSend(v2, "fraudWarningsToggled");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  Application *v17;
  objc_super v18;

  v10 = a3;
  if ((void *)userDefaultsObserverContext == a6)
  {
    v12 = *MEMORY[0x1E0CB2CC8];
    v13 = a5;
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v14 = objc_claimAutoreleasedReturnValue();

    if (v11 | v14 && (objc_msgSend((id)v11, "isEqual:", v14) & 1) == 0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __62__Application_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v15[3] = &unk_1E9CF1830;
      v16 = v10;
      v17 = self;
      dispatch_async(MEMORY[0x1E0C80D38], v15);

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)Application;
    v11 = (uint64_t)a5;
    -[Application observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
  }

}

void __62__Application_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD v4[4];
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D89FD8]))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0D8B5B0], 0);
LABEL_3:

    return;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D4F658])
    || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D4F5C8]))
  {
    objc_msgSend(*(id *)(a1 + 40), "_reloadSearchEngines");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D89E40]))
  {
    objc_msgSend(*(id *)(a1 + 40), "_didEnableCustomizationSync");
  }
  else
  {
    v2 = *MEMORY[0x1E0D8B2C8];
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D8B2C8]))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setPrivateBrowsingRequiresAuthentication:", objc_msgSend(v3, "BOOLForKey:", v2));
      goto LABEL_3;
    }
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__Application_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v4[3] = &unk_1E9CF19F8;
    v5 = *(id *)(a1 + 32);
    performBlockForBrowserControllers(v4);

  }
}

uint64_t __62__Application_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userDefaultsDidChangeValueForKey:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)maximumTabCountAllowingMoreTabs:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  BOOL v6;
  unint64_t v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("DebugOverrideTabCapacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D89BE8], "hasInternalContent"))
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    if (highTabCapacityDevice)
    {
      if (+[WBUFeatureManager accessLevel](FeatureManager, "accessLevel") == 2)
      {
        v7 = 200;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "allowsUnlimitedTabs") & v3) != 0)
          v7 = 5000;
        else
          v7 = 500;

      }
    }
    else
    {
      v7 = 36;
    }
  }
  else if (objc_msgSend(v5, "integerValue") == -1)
  {
    v7 = -1;
  }
  else
  {
    v7 = objc_msgSend(v5, "integerValue");
  }

  return v7;
}

- (AutomationController)automationController
{
  AutomationController *automationController;
  AutomationController *v4;
  AutomationController *v5;

  automationController = self->_automationController;
  if (!automationController)
  {
    v4 = objc_alloc_init(AutomationController);
    v5 = self->_automationController;
    self->_automationController = v4;

    automationController = self->_automationController;
  }
  return automationController;
}

id __52__Application__prewarmAutomationControllerIfEnabled__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[90])
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 720), *MEMORY[0x1E0CD5870], 0);

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 720);
    *(_QWORD *)(v4 + 720) = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  return (id)objc_msgSend(v2, "automationController");
}

- (void)_handleHIDEvent:(__IOHIDEvent *)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)Application;
  -[Application _handleHIDEvent:](&v8, sel__handleHIDEvent_);
  -[AutomationController automationSession](self->_automationController, "automationSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[objc_class sharedTouchEventGenerator](NSClassFromString((NSString *)CFSTR("_WKTouchEventGenerator")), "sharedTouchEventGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "receivedHIDEvent:", a3);

  }
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "_systemNavigationAction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    performBlockForBrowserControllers(&__block_literal_global_145);
}

uint64_t __57__Application_application_didFinishLaunchingWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateSourceApplication");
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  dispatch_get_global_queue(17, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__Application_application_didFinishLaunchingWithOptions___block_invoke_4;
  block[3] = &unk_1E9CF1900;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  FILE *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D8AF18]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    SafariHistoryCloudBackupIndicatorFileURL();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "BOOLValue"))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeItemAtURL:error:", v2, 0);

    }
    else
    {
      v4 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v2), "fileSystemRepresentation"), "w");
      fclose(v4);
    }

  }
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_BOOLForKey:", *MEMORY[0x1E0D8B720]);

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0D8B8D8], 0);

  }
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_6()
{
  performBlockForBrowserControllers(&__block_literal_global_155);
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "activeWebExtensionWindow");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "validateExtensionToolbarItemsInWindow:", v3);

}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a2;
  objc_msgSend(v11, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x1E0D8B3B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v11, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_stringForKey:", *MEMORY[0x1E0D8B3B8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "webExtensionsControllerForProfileServerID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "webExtensionForComposedIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "browserControllers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __57__Application_application_didFinishLaunchingWithOptions___block_invoke_9;
      v12[3] = &unk_1E9CF1B50;
      v13 = v6;
      objc_msgSend(v9, "safari_firstObjectPassingTest:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "webExtensionWasRemotelyEnabled:", v8);
        objc_msgSend(v7, "remotelyEnabledExtensionBannerWasShownForComposedIdentifier:", v4);
      }

    }
  }

}

uint64_t __57__Application_application_didFinishLaunchingWithOptions___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "activeProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifierForExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
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
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "tabCollectionViewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allSnapshotIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v4, "windowState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localTabGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tabsUUIDSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v10);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v4, "windowState");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "privateTabGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tabsUUIDSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v13);

}

uint64_t __57__Application_application_didFinishLaunchingWithOptions___block_invoke_11()
{
  return objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
}

- (void)tabGroupManager:(id)a3 didInsertProfileWithIdentifier:(id)a4
{
  -[Application prewarmAndRemoveOrphanedProfileDataStores](self, "prewarmAndRemoveOrphanedProfileDataStores", a3, a4);
  -[Application _setWKWebsiteDataStoreDelegate](self, "_setWKWebsiteDataStoreDelegate");
}

void __56__Application_prewarmAndRemoveOrphanedProfileDataStores__block_invoke_190(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __56__Application_prewarmAndRemoveOrphanedProfileDataStores__block_invoke_190_cold_1(a1, v4);
  }

}

- (WKProcessPool)defaultProcessPool
{
  return (WKProcessPool *)-[Application processPoolForProfileIdentifier:](self, "processPoolForProfileIdentifier:", *MEMORY[0x1E0D89E20]);
}

- (id)_userContentControllerForProfileServerID:(id)a3
{
  id v4;
  NSMutableDictionary *profileServerIDToUserContentController;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  profileServerIDToUserContentController = self->_profileServerIDToUserContentController;
  if (!profileServerIDToUserContentController)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_profileServerIDToUserContentController;
    self->_profileServerIDToUserContentController = v6;

    profileServerIDToUserContentController = self->_profileServerIDToUserContentController;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](profileServerIDToUserContentController, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D89E20]) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEF608], "safari_userContentController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CEF608]);
    }
    v8 = v9;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_profileServerIDToUserContentController, "setObject:forKeyedSubscript:", v9, v4);
  }
  v10 = v8;

  return v10;
}

uint64_t __69__Application__createExtensionControllersIfNeededForProfileServerID___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addContentRuleList:", a2);
  return result;
}

- (void)_deleteExtensionControllersForProfileServerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[Application webExtensionsControllerForProfileServerID:](self, "webExtensionsControllerForProfileServerID:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[Application contentBlockerManagerForProfileServerID:](self, "contentBlockerManagerForProfileServerID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unloadAndDeleteStateForAllExtensions");
  objc_msgSend(v5, "unloadAndDeleteStateForAllExtensions");
  objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeProvider:", v7);
  objc_msgSend(v6, "removeProvider:", v5);
  objc_msgSend(v6, "localExtensionStateDidChange");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_profileServerIDToWebExtensionsControllers, "setObject:forKeyedSubscript:", 0, v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_profileServerIDToContentBlockerManagers, "setObject:forKeyedSubscript:", 0, v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_profileServerIDToUserContentController, "setObject:forKeyedSubscript:", 0, v4);

}

- (id)webExtensionsControllerForTabWithPrivateBrowsingEnabled:(BOOL)a3 profile:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (v4 || !v6)
  {
    -[Application webExtensionsControllerForProfileServerID:](self, "webExtensionsControllerForProfileServerID:", *MEMORY[0x1E0D89E20]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "identifierForExtensions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[Application webExtensionsControllerForProfileServerID:](self, "webExtensionsControllerForProfileServerID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)reloadContentBlockers
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_INFO, "Reloading content blockers due to distributed notification", buf, 2u);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[Application allContentBlockerManagers](self, "allContentBlockerManagers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "reloadUserContentControllerReadingStateFromDisk:", 1);
        objc_msgSend(v9, "informObserversThatContentBlockerManagerExtensionListDidChange");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)notifyExtensionControllersThatSettingsWereUpdatedExternallyFromSettingsApp
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[Application allWebExtensionsControllers](self, "allWebExtensionsControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "extensionSettingsWereUpdatedExternallyFromSettingsApp:", 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __45__Application__showSearchEngineAlertIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=SAFARI&path=SEARCH_ENGINE_SETTING"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

  }
}

void __41__Application__reportLaunchAnalyticsSoon__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD block[4];
  id v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  +[WBSParsecDSession sendLaunchFeedbackWithEvent:isPrivate:usesLoweredSearchBar:](MEMORY[0x1E0D8AA78], 7, *(_BYTE *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "usesLoweredSearchBar"));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_normalizedVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerSafariVersion:persona:", v4, 3);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__Application__reportLaunchAnalyticsSoon__block_invoke_2;
  block[3] = &unk_1E9CF1830;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v46 = v5;
  v47 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_sf_javaScriptEnabled");
  v9 = objc_msgSend(v7, "BOOLForKey:", *MEMORY[0x1E0D4F690]);
  v39 = v7;
  v10 = objc_msgSend(v7, "BOOLForKey:", CFSTR("DisableWebsiteSpecificSearch")) ^ 1;
  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "webui_safariCookieAcceptPolicyEnumValue");

  v40 = a1;
  objc_msgSend(*(id *)(a1 + 40), "reportUserPreferencesOnLaunchForJavaScriptEnabled:safeBrowsingEnabled:siteSpecificSearchEnabled:trackingPolicy:", v8, v9, v10, v12);
  v13 = (void *)objc_msgSend(&unk_1E9D626D0, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(MEMORY[0x1E0CEF5F0], "_experimentalFeatures");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v20, "key");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "safari_keyForWebKitFeature:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "key");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, v25);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v17);
  }

  v38 = *(void **)(v40 + 40);
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("WebXREnabled"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("WebXRGamepadsModuleEnabled"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "BOOLValue");
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("WebXRHandInputModuleEnabled"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "BOOLValue");
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ModelElementEnabled"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "reportExperimentalFeaturesOnLaunchForWebXREnabled:webXRGamepadsModuleEnabled:webXRHandInputModuleEnabled:modelElementEnabled:", v27, v29, v31, objc_msgSend(v32, "BOOLValue"));

  objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "preferredCapsuleLayoutStyle");

  v35 = objc_msgSend(v39, "BOOLForKey:", *MEMORY[0x1E0D4F118]);
  if ((_SFDeviceIsPad() & 1) == 0)
    objc_msgSend(*(id *)(v40 + 40), "_sf_reportCapsuleLayoutStyle:backgroundColorInTabBarEnabled:", v34, v35 ^ 1u);
  v36 = *(void **)(v40 + 40);
  objc_msgSend(*(id *)(v40 + 32), "webExtensionsControllerForProfileServerID:", *MEMORY[0x1E0D89E20]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_sf_performExtensionsReportIfNecessaryWithExtensionsController:", v37);

  objc_msgSend(*(id *)(v40 + 40), "schedulePeriodicTabGroupsReport");
  objc_msgSend(*(id *)(v40 + 40), "schedulePeriodicPrivateBrowsingReport");
  objc_msgSend(*(id *)(v40 + 40), "schedulePeriodicSettingsReport");
  objc_msgSend(*(id *)(v40 + 40), "schedulePeriodicWebClipsReport");
  objc_msgSend(*(id *)(v40 + 40), "scheduleBrowsingAssistantReport");
  if (WBSIsiPad())
    objc_msgSend(*(id *)(v40 + 40), "schedulePeriodicStandaloneTabBarReport");

}

uint64_t __41__Application__reportLaunchAnalyticsSoon__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D8A7A8], "automaticTabClosingInterval");
  WBSAutomaticTabClosingIntervalAnalyticsTitle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportAutomaticTabClosingInterval:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0D89D18]);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 712);
  *(_QWORD *)(v5 + 712) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 712), "setDelegate:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 712), "schedulePeriodicReport");
}

- (void)applicationWillTerminate
{
  void *v3;
  void *v4;
  void *v5;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[BrowserWindowController saveBrowserState](self->_browserWindowController, "saveBrowserState");
  objc_msgSend(MEMORY[0x1E0D8AB58], "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "savePendingChangesBeforeTermination");

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "unregisterObserver:", self);
  else
    objc_msgSend(v4, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("AppleKeyboardsPreferencesChangedNotification"), 0);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E0C9B070], 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0CA7488], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobilesafari.AutoFillStateChanged"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobilesafari.QuickWebsiteSearchProvidersDidChange"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0CD5808], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)screenTimeManagementStateDidChangeNotification, 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)screenTimePasscodeStateDidChangeNotification, 0);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  +[WebBookmarkCollection stopObservingDatabaseVacuumNotification]();
  -[WBSFormAutoFillCorrectionsHistoryObserver flushPendingChangesAndDisconnectFromStoreAndHistory](self->_formAutoFillCorrectionsHistoryObserver, "flushPendingChangesAndDisconnectFromStoreAndHistory");
  v9 = MEMORY[0x1E0D8AA78];
  objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSParsecDSession sendSuspendFeedbackWithEvent:isPrivate:](v9, 1, objc_msgSend(v10, "hasPrivateBrowsingWindow"));

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUsesOpportunisticPushTopic:", 1);

  -[WBSBackgroundImageAssetController savePendingChangesBeforeTermination](self->_backgroundImageAssetController, "savePendingChangesBeforeTermination");
  objc_msgSend(MEMORY[0x1E0D8A880], "standardStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "closeDatabase");

  objc_msgSend(MEMORY[0x1E0CD57E8], "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "savePendingChangesBeforeTermination");

  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "savePendingProviderChangesBeforeTermination");

  objc_msgSend(MEMORY[0x1E0DD98F8], "sharedCreditCardDataController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "savePendingChangesBeforeTermination");

  objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "savePendingChangesBeforeTermination");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[Application allContentBlockerManagers](self, "allContentBlockerManagers", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v21++), "savePendingChangesBeforeTermination");
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v19);
  }

  objc_msgSend(MEMORY[0x1E0D8A818], "sharedManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "savePendingChangesBeforeTermination");

}

- (ReadingListLeadImageCache)readingListLeadImageCache
{
  ReadingListLeadImageCache *readingListImageCache;
  ReadingListLeadImageCache *v4;
  void *v5;
  void *v6;
  void *v7;
  ReadingListLeadImageCache *v8;
  ReadingListLeadImageCache *v9;

  readingListImageCache = self->_readingListImageCache;
  if (!readingListImageCache)
  {
    v4 = [ReadingListLeadImageCache alloc];
    v5 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0DCCBA0], "bookmarkImagesDirectoryPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:isDirectory:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ReadingListLeadImageCache initWithDirectoryURL:](v4, "initWithDirectoryURL:", v7);
    v9 = self->_readingListImageCache;
    self->_readingListImageCache = v8;

    readingListImageCache = self->_readingListImageCache;
  }
  return readingListImageCache;
}

- (void)_export30DaysWorthOfHistoryAfterUpgrade
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Failed to donate 30 days of history to Core Spotlight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __54__Application__export30DaysWorthOfHistoryAfterUpgrade__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0D8AC68], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "historiesForProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__Application__export30DaysWorthOfHistoryAfterUpgrade__block_invoke_2;
  v4[3] = &unk_1E9CF16A0;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "export30DaysWorthOfHistoryToCoreSpotlightForProfiles:completionHandler:", v3, v4);

}

uint64_t __54__Application__export30DaysWorthOfHistoryAfterUpgrade__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setBool:forKey:", 1, CFSTR("didMigrateHistoryToCoreSpotlightAfterUpgrade"));
  return result;
}

- (void)_downloadDidStartNotification:(id)a3
{
  uint64_t v4;
  NSMutableArray *activeDownloads;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = objc_claimAutoreleasedReturnValue();
  activeDownloads = self->_activeDownloads;
  v8 = (id)v4;
  if (activeDownloads)
  {
    -[NSMutableArray addObject:](activeDownloads, "addObject:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_activeDownloads;
    self->_activeDownloads = v6;

  }
}

- (void)_downloadDidStopNotification:(id)a3
{
  NSMutableArray *activeDownloads;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](self->_activeDownloads, "removeObject:");
  if (!-[NSMutableArray count](self->_activeDownloads, "count"))
  {
    activeDownloads = self->_activeDownloads;
    self->_activeDownloads = 0;

  }
}

- (id)savedAccountContextForWebPageID:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];

  -[Application browserControllers](self, "browserControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__Application_savedAccountContextForWebPageID___block_invoke;
  v10[3] = &__block_descriptor_40_e27_B16__0__BrowserController_8l;
  v10[4] = a3;
  objc_msgSend(v4, "safari_firstObjectPassingTest:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "isInDefaultProfile") & 1) == 0)
  {
    v7 = objc_alloc(MEMORY[0x1E0D89CE8]);
    objc_msgSend(v5, "activeProfileIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithSafariProfileIdentifier:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D89CE8], "defaultContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

BOOL __47__Application_savedAccountContextForWebPageID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v8[5];

  objc_msgSend(a2, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabDocuments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__Application_savedAccountContextForWebPageID___block_invoke_2;
  v8[3] = &__block_descriptor_40_e21_B16__0__TabDocument_8l;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "safari_firstObjectPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

BOOL __47__Application_savedAccountContextForWebPageID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "webPageID") == *(_QWORD *)(a1 + 32);
}

- (id)createRecommendationMediatorOrReuseExistingOneIfPossible
{
  ForYouRecommendationMediator *v3;
  ForYouRecommendationMediator *v4;
  void *v5;
  void *v6;
  ForYouRecommendationMediator *v7;

  -[Application existingForYouRecommendationMediator](self, "existingForYouRecommendationMediator");
  v3 = (ForYouRecommendationMediator *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [ForYouRecommendationMediator alloc];
    +[Application contextClient](Application, "contextClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[ForYouRecommendationMediator initWithContextClient:featureManager:historyProvider:](v4, "initWithContextClient:featureManager:historyProvider:", v5, v6, &__block_literal_global_246);

    -[Application setExistingForYouRecommendationMediator:](self, "setExistingForYouRecommendationMediator:", v3);
  }
  v7 = v3;

  return v7;
}

id __71__Application_createRecommendationMediatorOrReuseExistingOneIfPossible__block_invoke()
{
  return +[History sharedHistory](History, "sharedHistory");
}

- (WBSForYouRecentParsecResultsManager)forYouRecentParsecResultsManager
{
  WBSForYouRecentParsecResultsManager *forYouRecentParsecResultsManager;
  WBSForYouRecentParsecResultsManager *v4;
  WBSForYouRecentParsecResultsManager *v5;

  forYouRecentParsecResultsManager = self->_forYouRecentParsecResultsManager;
  if (!forYouRecentParsecResultsManager)
  {
    v4 = (WBSForYouRecentParsecResultsManager *)objc_alloc_init(MEMORY[0x1E0D8A920]);
    v5 = self->_forYouRecentParsecResultsManager;
    self->_forYouRecentParsecResultsManager = v4;

    forYouRecentParsecResultsManager = self->_forYouRecentParsecResultsManager;
  }
  return forYouRecentParsecResultsManager;
}

- (NSSet)historiesForProfiles
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[WBTabGroupManager allProfileIdentifiers](self->_tabGroupManager, "allProfileIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__Application_historiesForProfiles__block_invoke;
  v6[3] = &unk_1E9CF1E10;
  v6[4] = self;
  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

id __35__Application_historiesForProfiles__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "historyController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "historyForProfileIdentifier:loadIfNeeded:", v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setUpSuggestionManagersIfNeeded
{
  NSMutableDictionary *v3;
  NSMutableDictionary *profileIdentifiersToSuggestionsManagers;
  id v5;
  WBSStartPageSuggestionsProviderBroadcaster *v6;
  WBSStartPageSuggestionsProviderBroadcaster *highlightManagerSuggestionsProviderBroadcaster;
  id v8;

  if (!self->_profileIdentifiersToSuggestionsManagers)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    profileIdentifiersToSuggestionsManagers = self->_profileIdentifiersToSuggestionsManagers;
    self->_profileIdentifiersToSuggestionsManagers = v3;

    v5 = objc_alloc(MEMORY[0x1E0D8ACE0]);
    -[Application highlightManager](self, "highlightManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (WBSStartPageSuggestionsProviderBroadcaster *)objc_msgSend(v5, "initWithSuggestionsProvider:", v8);
    highlightManagerSuggestionsProviderBroadcaster = self->_highlightManagerSuggestionsProviderBroadcaster;
    self->_highlightManagerSuggestionsProviderBroadcaster = v6;

  }
}

- (id)sectionManagerForProfileWithIdentifier:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D89E20]);
  v6 = objc_alloc(MEMORY[0x1E0D8ACC8]);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithStorage:", v7);
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0D8AB40]);
    -[Application tabGroupManager](self, "tabGroupManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "initWithProfileIdentifier:tabGroupManager:", v4, v7);
    v8 = (void *)objc_msgSend(v6, "initWithStorage:", v10);

  }
  return v8;
}

- (id)suggestionsManagerForProfileIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_profileIdentifiersToSuggestionsManagers, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[Application _setUpSuggestionManagersIfNeeded](self, "_setUpSuggestionManagersIfNeeded");
      v6 = objc_alloc(MEMORY[0x1E0D8ACD8]);
      -[Application sectionManagerForProfileWithIdentifier:](self, "sectionManagerForProfileWithIdentifier:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v6, "initWithSectionManager:", v7);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_profileIdentifiersToSuggestionsManagers, "setObject:forKeyedSubscript:", v5, v4);
      -[Application historyController](self, "historyController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frequentlyVisitedSitesControllerForProfileIdentifier:loadIfNeeded:", v4, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "registerProvider:", v9);

      -[WBSStartPageSuggestionsProviderBroadcaster createSuggestionProviderProxy](self->_highlightManagerSuggestionsProviderBroadcaster, "createSuggestionProviderProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "registerProvider:", v10);

    }
    v11 = v5;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (WBSSafariScribbleFeedbackSyncEngine)scribbleFeedbackSyncEngine
{
  WBSSafariScribbleFeedbackSyncEngine *scribbleFeedbackSyncEngine;
  WBSSafariScribbleFeedbackSyncEngine *v4;
  WBSSafariScribbleFeedbackSyncEngine *v5;

  scribbleFeedbackSyncEngine = self->_scribbleFeedbackSyncEngine;
  if (!scribbleFeedbackSyncEngine)
  {
    v4 = (WBSSafariScribbleFeedbackSyncEngine *)objc_alloc_init(MEMORY[0x1E0D8ABD0]);
    v5 = self->_scribbleFeedbackSyncEngine;
    self->_scribbleFeedbackSyncEngine = v4;

    scribbleFeedbackSyncEngine = self->_scribbleFeedbackSyncEngine;
  }
  return scribbleFeedbackSyncEngine;
}

- (WBTabGroupManager)ephemeralTabGroupManager
{
  WBTabGroupManager *ephemeralTabGroupManager;
  WBTabGroupManager *v4;
  WBTabGroupManager *v5;

  ephemeralTabGroupManager = self->_ephemeralTabGroupManager;
  if (!ephemeralTabGroupManager)
  {
    objc_msgSend(MEMORY[0x1E0DCCB78], "ephemeralTabGroupManager");
    v4 = (WBTabGroupManager *)objc_claimAutoreleasedReturnValue();
    v5 = self->_ephemeralTabGroupManager;
    self->_ephemeralTabGroupManager = v4;

    ephemeralTabGroupManager = self->_ephemeralTabGroupManager;
  }
  return ephemeralTabGroupManager;
}

- (WBSScribbleQuirksManager)scribbleQuirksManager
{
  WBSScribbleQuirksManager *scribbleQuirksManager;
  WBSScribbleQuirksManager *v4;
  WBSScribbleQuirksManager *v5;

  scribbleQuirksManager = self->_scribbleQuirksManager;
  if (!scribbleQuirksManager)
  {
    v4 = (WBSScribbleQuirksManager *)objc_opt_new();
    v5 = self->_scribbleQuirksManager;
    self->_scribbleQuirksManager = v4;

    scribbleQuirksManager = self->_scribbleQuirksManager;
  }
  return scribbleQuirksManager;
}

- (WBSUserDefinedContentBlockerManager)userDefinedContentBlockerManager
{
  WBSUserDefinedContentBlockerManager *userDefinedContentBlockerManager;
  id v4;
  void *v5;
  WBSUserDefinedContentBlockerManager *v6;
  WBSUserDefinedContentBlockerManager *v7;

  userDefinedContentBlockerManager = self->_userDefinedContentBlockerManager;
  if (!userDefinedContentBlockerManager)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8AD90]);
    objc_msgSend(MEMORY[0x1E0D8AD98], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (WBSUserDefinedContentBlockerManager *)objc_msgSend(v4, "initWithDataStore:", v5);
    v7 = self->_userDefinedContentBlockerManager;
    self->_userDefinedContentBlockerManager = v6;

    userDefinedContentBlockerManager = self->_userDefinedContentBlockerManager;
  }
  return userDefinedContentBlockerManager;
}

- (WBSPrivateBrowsingUserDefinedContentBlockerManager)userDefinedContentBlockerManagerForPrivateBrowsing
{
  WBSPrivateBrowsingUserDefinedContentBlockerManager *userDefinedContentBlockerManagerForPrivateBrowsing;
  id v4;
  void *v5;
  WBSPrivateBrowsingUserDefinedContentBlockerManager *v6;
  WBSPrivateBrowsingUserDefinedContentBlockerManager *v7;
  void *v8;

  userDefinedContentBlockerManagerForPrivateBrowsing = self->_userDefinedContentBlockerManagerForPrivateBrowsing;
  if (!userDefinedContentBlockerManagerForPrivateBrowsing)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8AB20]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AD98]), "initWithDatabaseURL:", 0);
    v6 = (WBSPrivateBrowsingUserDefinedContentBlockerManager *)objc_msgSend(v4, "initWithDataStore:", v5);
    v7 = self->_userDefinedContentBlockerManagerForPrivateBrowsing;
    self->_userDefinedContentBlockerManagerForPrivateBrowsing = v6;

    -[Application userDefinedContentBlockerManager](self, "userDefinedContentBlockerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSPrivateBrowsingUserDefinedContentBlockerManager setNormalBrowsingUserDefinedContentBlockerManager:](self->_userDefinedContentBlockerManagerForPrivateBrowsing, "setNormalBrowsingUserDefinedContentBlockerManager:", v8);

    userDefinedContentBlockerManagerForPrivateBrowsing = self->_userDefinedContentBlockerManagerForPrivateBrowsing;
  }
  return userDefinedContentBlockerManagerForPrivateBrowsing;
}

- (NSArray)cachedUserContentControllersForAllProfiles
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_profileServerIDToUserContentController, "allValues");
}

- (void)downloadDidFinish:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  tabDocumentForDownload(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downloadDidFinish:", v3);

}

- (void)downloadDidFail:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  tabDocumentForDownload(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downloadDidFail:", v3);

}

- (void)downloadDidStart:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  tabDocumentForDownload(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downloadDidStart:", v3);

}

- (void)downloadDidReceiveResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "explicitlySaved"))
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mimeType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uti");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sf_didBeginDownloadWithMIMEType:uti:downloadType:promptType:browserPersona:", v4, v5, 1, 0, 0);

  }
}

- (void)downloadShouldContinueAfterReceivingResponse:(id)a3 decisionHandler:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  tabDocumentForDownload(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "downloadShouldContinueAfterReceivingResponse:decisionHandler:", v11, v5);
  }
  else
  {
    if ((objc_msgSend(v11, "explicitlySaved") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mimeType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uti");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_sf_didBeginDownloadWithMIMEType:uti:downloadType:promptType:browserPersona:", v9, v10, 0, 0, 0);

    }
    v5[2](v5, 1);
  }

}

- (BOOL)isCloudHistoryEnabled
{
  return self->_cloudHistory != 0;
}

void __48__Application__resetCloudHistoryAccountIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __48__Application__resetCloudHistoryAccountIfNeeded__block_invoke_cold_1(v3);
  }

}

- (void)_updateProfileLocalIdentifiersToServerIdentifiersMapInCloudHistory
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_cloudHistory)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[Application tabGroupManager](self, "tabGroupManager", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "namedProfiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "bookmark");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "serverID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v10, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    -[WBSCloudHistoryServiceProtocol updateProfileLocalIdentifiersToServerIdentifiersMap:completionHandler:](self->_cloudHistory, "updateProfileLocalIdentifiersToServerIdentifiersMap:completionHandler:", v3, &__block_literal_global_266);
  }
}

void __81__Application__updateProfileLocalIdentifiersToServerIdentifiersMapInCloudHistory__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __81__Application__updateProfileLocalIdentifiersToServerIdentifiersMapInCloudHistory__block_invoke_cold_1(v3);
  }

}

- (void)tabGroupManager:(id)a3 didRemoveProfileWithIdentifier:(id)a4
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
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "profileWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifierForExtensions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[Application _deleteExtensionControllersForProfileServerID:](self, "_deleteExtensionControllersForProfileServerID:", v9);
  -[BrowserWindowController perSitePreferencesVendor](self->_browserWindowController, "perSitePreferencesVendor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profilePreferenceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D8A9B8], "sharedController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeIgnoredSiriSuggestedSitesInProfile:", v7);

    objc_msgSend(v11, "profilePreference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__Application_tabGroupManager_didRemoveProfileWithIdentifier___block_invoke;
    v17[3] = &unk_1E9CF1E78;
    v18 = v11;
    v19 = v13;
    v20 = v6;
    v21 = v7;
    v22 = v14;
    v15 = v14;
    v16 = v13;
    objc_msgSend(v18, "getAllDomainsConfiguredForPreference:usingBlock:", v16, v17);

  }
}

void __62__Application_tabGroupManager_didRemoveProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "valueOfPreference:forDomain:", *(_QWORD *)(a1 + 40), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "profileWithIdentifier:", *(_QWORD *)(a1 + 56));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "serverID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "isEqualToString:", v11);

        if (v12)
          objc_msgSend(*(id *)(a1 + 64), "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "removePreferenceValuesForDomains:fromPreference:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), 0);

}

void __46__Application__updateCloudFeatureAvailability__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__Application__updateCloudFeatureAvailability__block_invoke_3_cold_1(v7);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__Application__updateCloudFeatureAvailability__block_invoke_270;
    v8[3] = &unk_1E9CF1830;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __46__Application__updateCloudFeatureAvailability__block_invoke_270(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 544), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateProfileLocalIdentifiersToServerIdentifiersMapInCloudHistory");
  return objc_msgSend(*(id *)(a1 + 32), "_resetCloudHistoryAccountIfNeeded");
}

void __46__Application__updateCloudFeatureAvailability__block_invoke_2_272(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __46__Application__updateCloudFeatureAvailability__block_invoke_2_272_cold_1(v3);
  }

}

- (WBSAllowedLegacyTLSHostManager)legacyTLSHostManager
{
  WBSAllowedLegacyTLSHostManager *cachedLegacyTLSHostManager;
  id v4;
  void *v5;
  WBSAllowedLegacyTLSHostManager *v6;
  WBSAllowedLegacyTLSHostManager *v7;

  cachedLegacyTLSHostManager = self->_cachedLegacyTLSHostManager;
  if (!cachedLegacyTLSHostManager)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8A750]);
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (WBSAllowedLegacyTLSHostManager *)objc_msgSend(v4, "initWithBrowserDefaults:", v5);
    v7 = self->_cachedLegacyTLSHostManager;
    self->_cachedLegacyTLSHostManager = v6;

    cachedLegacyTLSHostManager = self->_cachedLegacyTLSHostManager;
  }
  return cachedLegacyTLSHostManager;
}

- (void)_historyWasCleared:(id)a3
{
  id v3;

  -[Application legacyTLSHostManager](self, "legacyTLSHostManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearAllLegacyTLSHosts");

}

- (void)_historyItemsWereRemoved:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D8B0D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_setByApplyingBlock:", &__block_literal_global_277);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "userVisibleQueryFromSearchURL:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[RecentWebSearchesController sharedController](RecentWebSearchesController, "sharedController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "clearRecentSearch:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

uint64_t __40__Application__historyItemsWereRemoved___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "url");
}

- (void)_historyHostnamesWereRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[Application legacyTLSHostManager](self, "legacyTLSHostManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearLegacyTLSForHosts:", v8);

  v9 = (void *)MEMORY[0x1E0D8AB08];
  objc_msgSend(v4, "object");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeHostnames:", v10);
}

+ (CKContextClient)contextClient
{
  if (contextClient_onceToken != -1)
    dispatch_once(&contextClient_onceToken, &__block_literal_global_282);
  return (CKContextClient *)(id)contextClient_instance;
}

void __28__Application_contextClient__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getCKContextClientClass_softClass;
  v8 = getCKContextClientClass_softClass;
  if (!getCKContextClientClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getCKContextClientClass_block_invoke;
    v4[3] = &unk_1E9CF1780;
    v4[4] = &v5;
    __getCKContextClientClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  objc_msgSend(v1, "clientWithDefaultRequestType:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)contextClient_instance;
  contextClient_instance = v2;

}

- (void)dispatchNavigationIntent:(id)a3
{
  -[Application handleNavigationIntent:completion:](self, "handleNavigationIntent:completion:", a3, 0);
}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
  -[BrowserWindowController handleNavigationIntent:completion:](self->_browserWindowController, "handleNavigationIntent:completion:", a3, a4);
}

- (void)extensionsController:(id)a3 closeOpenExtensionTabsWithBaseURI:(id)a4 composedIdentifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a4, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[Application browserControllers](self, "browserControllers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[Application _allTabsWithExtensionContentLoadedForBrowserController:extensionHost:composedIdentifier:](self, "_allTabsWithExtensionContentLoadedForBrowserController:extensionHost:composedIdentifier:", v14, v8, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(v14, "tabController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "closeTabs:animated:allowAddingToRecentlyClosedTabs:showAutoCloseTabsAlert:", v15, 1, 0, 0);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (id)_allTabsWithExtensionContentLoadedForBrowserController:(id)a3 extensionHost:(id)a4 composedIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "tabController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "normalAndPrivateTabs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __103__Application__allTabsWithExtensionContentLoadedForBrowserController_extensionHost_composedIdentifier___block_invoke;
  v15[3] = &unk_1E9CF1F70;
  v16 = v7;
  v17 = v8;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __103__Application__allTabsWithExtensionContentLoadedForBrowserController_extensionHost_composedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "urlForExtensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safari_isSafariWebExtensionURL"))
  {
    objc_msgSend(v3, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)extensionsController:(id)a3 closeOpenExtensionTabsInPrivateBrowsingWithBaseURI:(id)a4 composedIdentifier:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a4, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[Application browserControllers](self, "browserControllers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[Application _allTabsWithExtensionContentLoadedForBrowserController:extensionHost:composedIdentifier:](self, "_allTabsWithExtensionContentLoadedForBrowserController:extensionHost:composedIdentifier:", v13, v8, v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "safari_filterObjectsUsingBlock:", &__block_literal_global_284);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(v13, "tabController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "closeTabs:animated:allowAddingToRecentlyClosedTabs:showAutoCloseTabsAlert:", v15, 1, 0, 0);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

uint64_t __106__Application_extensionsController_closeOpenExtensionTabsInPrivateBrowsingWithBaseURI_composedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPrivate");
}

- (id)sfWebExtensionsController:(id)a3 tabWithID:(double)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[Application browserControllers](self, "browserControllers", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "tabController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tabWithIDForWebExtensions:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (id)sfWebExtensionsController:(id)a3 reusableTabWithID:(double)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  +[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__Application_sfWebExtensionsController_reusableTabWithID___block_invoke;
  v9[3] = &unk_1E9CF1FD8;
  *(double *)&v9[5] = a4;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateReusableTabDocuments:", v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __59__Application_sfWebExtensionsController_reusableTabWithID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "idForWebExtensions");
  if (v6 == *(double *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)sfWebExtensionsController:(id)a3 tabForWebView:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "webExtensionWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "webExtensionTabs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "containsObject:", v5))
        v9 = v5;
      else
        v9 = 0;
      v10 = v9;

    }
    else
    {
      v10 = v5;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)sfWebExtensionsController:(id)a3 createNewTabInWindow:(id)a4 tabIndex:(id)a5 url:(id)a6 makeActive:(BOOL)a7 completionHandler:(id)a8
{
  if (a4)
    objc_msgSend(a4, "createNewTabAtIndex:url:makeActive:completionHandler:", a5, a6, a7, a8);
  else
    (*((void (**)(id, _QWORD))a8 + 2))(a8, 0);
}

- (id)sfWebExtensionsController:(id)a3 duplicateTab:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(v4, "browserController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "duplicateTab:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)sfWebExtensionsController:(id)a3 relateParentTab:(id)a4 toTab:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  id v12;

  v6 = a4;
  v7 = a5;
  v12 = v6;
  objc_msgSend(v7, "browserController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "browserController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {
    v10 = objc_msgSend(v7, "isPrivate");
    v11 = objc_msgSend(v12, "isPrivate");

    if (v10 == v11)
      objc_msgSend(v7, "updateAncestryWithParentTab:", v12);
  }
  else
  {

  }
}

- (BOOL)sfWebExtensionsController:(id)a3 canSendMessageFromWebView:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  int v7;

  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "browserController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isContinuousReadingDocument:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (void)sfWebExtensionsController:(id)a3 captureVisibleTab:(id)a4 format:(id)a5 quality:(double)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  double v20;

  v10 = a5;
  v11 = a7;
  v12 = a4;
  objc_msgSend(v12, "browserController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tabCollectionViewProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__Application_sfWebExtensionsController_captureVisibleTab_format_quality_completionHandler___block_invoke;
  v17[3] = &unk_1E9CF2000;
  v18 = v10;
  v19 = v11;
  v20 = a6;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v14, "requestSnapshotForTabDocument:completion:", v12, v17);

}

void __92__Application_sfWebExtensionsController_captureVisibleTab_format_quality_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  UIImage *image;

  image = a2;
  if (image)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D8B708]))
      UIImagePNGRepresentation(image);
    else
      UIImageJPEGRepresentation(image, *(double *)(a1 + 48) / 100.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "safari_stringByBase64EncodingData:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("data:image/%@;base64,%@"), v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)sfWebExtensionsController:(id)a3 windowForWebView:(id)a4 extension:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "backgroundWebView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    -[Application sfWebExtensionsControllerLastFocusedWindow:](self, "sfWebExtensionsControllerLastFocusedWindow:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "toolbarItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "popupWebView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "isEqual:", v15);

    if (v16)
    {
      objc_msgSend(v14, "windowDisplayingPopupWebView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "webExtensionWindow");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v13;
}

- (id)sfWebExtensionsController:(id)a3 navigationIntentUUIDForWindow:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "browserController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sfWebExtensionsControllerAllWindows:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[Application browserControllers](self, "browserControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "webExtensionWindows");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (id)sfWebExtensionsControllerLastFocusedWindow:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[Application browserControllers](self, "browserControllers", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_292);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "activeWebExtensionWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __58__Application_sfWebExtensionsControllerLastFocusedWindow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activeWebExtensionWindowIsFocused");
}

- (void)sfWebExtensionsControllerDidChangeExtensionForPermissionBanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  -[Application browserControllers](self, "browserControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentExtensionForPermissionBanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EEF8]), "initWithExtension:", v7);
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__Application_sfWebExtensionsControllerDidChangeExtensionForPermissionBanner___block_invoke;
    v16[3] = &unk_1E9CF2048;
    v10 = v7;
    v17 = v10;
    objc_msgSend(v8, "setOpenActionHandler:", v16);
    v11 = v9;
    v12 = 3221225472;
    v13 = __78__Application_sfWebExtensionsControllerDidChangeExtensionForPermissionBanner___block_invoke_2;
    v14 = &unk_1E9CF2048;
    v15 = v10;
    objc_msgSend(v8, "setDismissButtonHandler:", &v11);
    objc_msgSend(v6, "showWebExtensionBanner:", v8, v11, v12, v13, v14);

  }
  else
  {
    objc_msgSend(v6, "showWebExtensionBanner:", 0);
  }

}

uint64_t __78__Application_sfWebExtensionsControllerDidChangeExtensionForPermissionBanner___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAlertForPendingPermissionRequests");
}

uint64_t __78__Application_sfWebExtensionsControllerDidChangeExtensionForPermissionBanner___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "permissionRequestBannerWasDismissed");
}

- (void)sfWebExtensionsController:(id)a3 showPopupForExtension:(id)a4 inWindow:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  id v12;
  void *v13;
  id v14;

  v14 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD))a6;
  -[Application sfWebExtensionsControllerLastFocusedWindow:](self, "sfWebExtensionsControllerLastFocusedWindow:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v10)
  {
    objc_msgSend(v10, "browserController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "showPopupForWebExtension:", v14);

  }
  v11[2](v11);

}

- (id)sfWebExtensionsController:(id)a3 forProfileServerID:(id)a4
{
  return -[Application webExtensionsControllerForProfileServerID:](self, "webExtensionsControllerForProfileServerID:", a4);
}

- (id)sfWebExtensionsControllerContentBlockerManager:(id)a3 forProfileServerID:(id)a4
{
  return -[Application contentBlockerManagerForProfileServerID:](self, "contentBlockerManagerForProfileServerID:", a4);
}

- (id)sfWebExtensionsControllerDomainForDefaultSearchProvider:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultSearchEngineForPrivateBrowsing:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchURLForUserTypedString:", CFSTR("a"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_highLevelDomainFromHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)setBrowserControllerUIDelegateProvider:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)browserControllerUIDelegateProvider;
  browserControllerUIDelegateProvider = v3;

}

- (void)mousePointerDevicesDidConnect:(id)a3
{
  os_unfair_lock_s *p_pointerDeviceLock;
  id v5;

  p_pointerDeviceLock = &self->_pointerDeviceLock;
  v5 = a3;
  os_unfair_lock_lock(p_pointerDeviceLock);
  -[NSMutableSet unionSet:](self->_pointerDevices, "unionSet:", v5);

  os_unfair_lock_unlock(p_pointerDeviceLock);
}

- (void)mousePointerDevicesDidDisconnect:(id)a3
{
  os_unfair_lock_s *p_pointerDeviceLock;
  id v5;

  p_pointerDeviceLock = &self->_pointerDeviceLock;
  v5 = a3;
  os_unfair_lock_lock(p_pointerDeviceLock);
  -[NSMutableSet minusSet:](self->_pointerDevices, "minusSet:", v5);

  os_unfair_lock_unlock(p_pointerDeviceLock);
}

- (void)noteTakingController:(id)a3 addHighlightForUserActivity:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v7 = a4;
  v8 = (void (**)(id, id, _QWORD))a5;
  v25 = v7;
  objc_msgSend(v7, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  +[Application sharedApplication](Application, "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "browserControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v15)
        objc_enumerationMutation(v12);
      objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v16), "tabController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activeTabDocument");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "userActivity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_uniqueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqual:", v10);

      if ((v21 & 1) != 0)
        break;

      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v14)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    if (!v18)
      goto LABEL_13;
    v22 = v26;
    v23 = v25;
    if ((objc_msgSend(v26, "isNoteTakingSupportedWithPrivateBrowsing:", objc_msgSend(v18, "isPrivateBrowsingEnabled")) & 1) != 0)
    {
      objc_msgSend(v18, "setLinkAddedToUserActivityCallback:", v8);
      objc_msgSend(v18, "addAppHighlightCreatingLink:", 0);
    }
    else
    {
      v24 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D7CA3000, v24, OS_LOG_TYPE_INFO, "Not adding highlight to user activity because the tab is Private and Quick Note is disabled in Private Browsing", buf, 2u);
      }
      v8[2](v8, v25, 0);
    }

  }
  else
  {
LABEL_9:

LABEL_13:
    v23 = v25;
    v8[2](v8, v25, 0);
    v22 = v26;
  }

}

- (void)notifyAddedLinkPreviewMetadata:(id)a3 toUserActivity:(id)a4 webView:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  id v17;
  _QWORD v18[4];
  id v19;

  v17 = a3;
  v7 = a4;
  v8 = a5;
  +[Application sharedApplication](Application, "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "browserControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__Application_notifyAddedLinkPreviewMetadata_toUserActivity_webView___block_invoke;
  v18[3] = &unk_1E9CF1B50;
  v19 = v8;
  v11 = v8;
  objc_msgSend(v10, "safari_firstObjectPassingTest:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "tabController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activeTabDocument");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "linkAddedToUserActivityCallback");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v14, "linkAddedToUserActivityCallback");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v16)[2](v16, v7, v17);

    objc_msgSend(v14, "setLinkAddedToUserActivityCallback:", 0);
  }

}

BOOL __69__Application_notifyAddedLinkPreviewMetadata_toUserActivity_webView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTabDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == *(void **)(a1 + 32);

  return v6;
}

- (BOOL)isNoteTakingControllerSupportedInPrivateBrowsing:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D8B190]);

  return v4;
}

- (WBSUnifiedBarAnalyticsProviding)unifiedBarAnalyticsProvider
{
  void *v2;
  void *v3;
  void *v4;

  -[Application browserControllers](self, "browserControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_303);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSUnifiedBarAnalyticsProviding *)v4;
}

uint64_t __42__Application_unifiedBarAnalyticsProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "activationState"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "usingUnifiedBar");

  }
  return v4;
}

- (WebBookmarkCollection)bookmarkCollection
{
  WebBookmarkCollection *bookmarkCollection;
  WebBookmarkCollection *v4;
  WebBookmarkCollection *v5;

  bookmarkCollection = self->_bookmarkCollection;
  if (!bookmarkCollection)
  {
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v4 = (WebBookmarkCollection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bookmarkCollection;
    self->_bookmarkCollection = v4;

    bookmarkCollection = self->_bookmarkCollection;
  }
  return bookmarkCollection;
}

- (void)_webBookmarksDidReload
{
  WebBookmarkCollection *v3;
  WebBookmarkCollection *bookmarkCollection;

  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v3 = (WebBookmarkCollection *)objc_claimAutoreleasedReturnValue();
  bookmarkCollection = self->_bookmarkCollection;
  self->_bookmarkCollection = v3;

}

- (id)_sortedBrowserControllers
{
  void *v2;
  void *v3;

  -[Application browserControllers](self, "browserControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_305);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __40__Application__sortedBrowserControllers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "scene");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scene");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v5 && !v6)
  {
LABEL_3:
    v7 = -1;
    goto LABEL_17;
  }
  if (!v5 && v6)
    goto LABEL_6;
  if (!(v5 | v6))
  {
    v7 = 0;
    goto LABEL_17;
  }
  if ((objc_msgSend((id)v5, "_isKeyWindowScene") & 1) != 0)
    goto LABEL_3;
  if ((objc_msgSend((id)v6, "_isKeyWindowScene") & 1) != 0)
  {
LABEL_6:
    v7 = 1;
    goto LABEL_17;
  }
  v8 = objc_msgSend((id)v5, "activationState");
  v9 = objc_msgSend((id)v6, "activationState");
  if (v9)
    v10 = -1;
  else
    v10 = 0;
  if (v8)
    v7 = v9 == 0;
  else
    v7 = v10;
LABEL_17:

  return v7;
}

- (UIScene)currentScene
{
  void *v2;
  void *v3;
  void *v4;

  -[Application _sortedBrowserControllers](self, "_sortedBrowserControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScene *)v4;
}

- (id)_tabCompletionProvider
{
  WBSBrowserTabCompletionProvider *tabCompletionProvider;
  WBSBrowserTabCompletionProvider *v4;
  WBSBrowserTabCompletionProvider *v5;

  tabCompletionProvider = self->_tabCompletionProvider;
  if (!tabCompletionProvider)
  {
    v4 = (WBSBrowserTabCompletionProvider *)objc_alloc_init(MEMORY[0x1E0D8A7E8]);
    v5 = self->_tabCompletionProvider;
    self->_tabCompletionProvider = v4;

    -[WBSBrowserTabCompletionProvider setDataSource:](self->_tabCompletionProvider, "setDataSource:", self);
    tabCompletionProvider = self->_tabCompletionProvider;
  }
  return tabCompletionProvider;
}

- (void)tabEntitiesMatchingQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[Application _tabCompletionProvider](self, "_tabCompletionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__Application_tabEntitiesMatchingQuery_completionHandler___block_invoke;
  v10[3] = &unk_1E9CF2150;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "tabCompletionMatchesForQuery:completionHandler:", v7, v10);

}

void __58__Application_tabEntitiesMatchingQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_308);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __58__Application_tabEntitiesMatchingQuery_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x1E0D8ACF8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "tabUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalURLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v4, "initWithUUID:title:address:isPrivate:", v5, v6, v7, 0);
  return v8;
}

- (NSArray)allTabEntities
{
  void *v2;
  void *v3;
  void *v4;

  -[Application _tabCompletionProvider](self, "_tabCompletionProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_311);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

id __29__Application_allTabEntities__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x1E0D8ACF8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithUUID:title:address:isPrivate:", v5, v6, v8, 0);

  return v9;
}

- (id)tabEntityWithUUID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[BrowserWindowController tabWithUUID:](self->_browserWindowController, "tabWithUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8ACF8]);
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithUUID:title:address:isPrivate:", v5, v6, v8, objc_msgSend(v3, "isPrivateBrowsingEnabled"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_browserControllerForTabWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[Application browserControllers](self, "browserControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__Application__browserControllerForTabWithUUID___block_invoke;
  v9[3] = &unk_1E9CF1B50;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "safari_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __48__Application__browserControllerForTabWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabWithUUID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)sceneForTabWithUUID:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void (**v12)(id, _QWORD);
  _QWORD v13[4];
  id v14;

  v12 = (void (**)(id, _QWORD))a4;
  -[Application _browserControllerForTabWithUUID:](self, "_browserControllerForTabWithUUID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[Application openSessions](self, "openSessions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__Application_sceneForTabWithUUID_completionHandler___block_invoke;
    v13[3] = &unk_1E9CF21B8;
    v8 = v6;
    v14 = v8;
    objc_msgSend(v7, "safari_anyObjectPassingTest:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[Application supportsMultipleScenes](self, "supportsMultipleScenes") && !v9)
    {
      v12[2](v12, 0);
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(v8, "scene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      ((void (**)(id, void *))v12)[2](v12, v10);
      if (!objc_msgSend(v10, "activationState"))
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(v8, "setIntentSceneConfigurationCompletion:", v12);
    }
    v11 = objc_alloc_init(MEMORY[0x1E0DC3BD0]);
    -[Application requestSceneSessionActivation:userActivity:options:errorHandler:](self, "requestSceneSessionActivation:userActivity:options:errorHandler:", v9, 0, v11, &__block_literal_global_314);

LABEL_11:
    goto LABEL_12;
  }
  v12[2](v12, 0);
LABEL_13:

}

uint64_t __53__Application_sceneForTabWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "persistentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "windowState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

void __53__Application_sceneForTabWithUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXSiriLink();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __53__Application_sceneForTabWithUUID_completionHandler___block_invoke_2_cold_1(v3);

}

- (id)sceneForTabGroupWithUUIDString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[Application _sortedBrowserControllers](self, "_sortedBrowserControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__Application_sceneForTabGroupWithUUIDString___block_invoke;
  v10[3] = &unk_1E9CF1B50;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "safari_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __46__Application_sceneForTabGroupWithUUIDString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTabGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v6;
}

- (WBProfile)focusProfile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  WBTabGroupManager *tabGroupManager;
  NSObject *v8;
  _BOOL4 v9;

  -[Application focusProfileIdentifier](self, "focusProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabGroupManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "profileWithIdentifier:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      tabGroupManager = self->_tabGroupManager;
      v8 = WBS_LOG_CHANNEL_PREFIXSiriLink();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (tabGroupManager)
      {
        if (v9)
          -[Application focusProfile].cold.2();
      }
      else if (v9)
      {
        -[Application focusProfile].cold.1();
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return (WBProfile *)v6;
}

- (void)_profileFocusConfigurationChanged
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *focusProfileIdentifier;
  Application *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSString *v22;
  id obj;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  NSString *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXSiriLink();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_DEFAULT, "Received profile focus change notification", buf, 2u);
  }
  -[Application _readFocusConfigurationKeys](self, "_readFocusConfigurationKeys");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[Application browserControllers](self, "browserControllers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "tabController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dismissOpenTabGroupAlertIfNeeded");
        objc_msgSend(v8, "scene");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && (!objc_msgSend(v10, "activationState") || objc_msgSend(v11, "activationState") == 1))
        {
          focusProfileIdentifier = self->_focusProfileIdentifier;
          objc_msgSend(v8, "activeProfileIdentifier");
          v13 = self;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(focusProfileIdentifier) = -[NSString isEqualToString:](focusProfileIdentifier, "isEqualToString:", v14);

          self = v13;
          if ((_DWORD)focusProfileIdentifier)
          {
            v18 = WBS_LOG_CHANNEL_PREFIXSiriLink();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = v18;
              objc_msgSend(v8, "windowState");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "uuid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v13->_focusProfileIdentifier;
              *(_DWORD *)buf = 138543618;
              v30 = v21;
              v31 = 2114;
              v32 = v22;
              _os_log_impl(&dword_1D7CA3000, v19, OS_LOG_TYPE_DEFAULT, "Foreground window %{public}@ already has focus profile %{public}@ open", buf, 0x16u);

            }
            -[Application setNeedsFocusProfileUpdate:](v13, "setNeedsFocusProfileUpdate:", 0);

            return;
          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v5)
        continue;
      break;
    }
  }

  if (-[Application needsFocusProfileUpdate](self, "needsFocusProfileUpdate")
    && -[Application applicationState](self, "applicationState") != 2)
  {
    if (-[Application prefersSingleWindow](self, "prefersSingleWindow"))
    {
      -[Application _sortedBrowserControllers](self, "_sortedBrowserControllers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tabController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __48__Application__profileFocusConfigurationChanged__block_invoke;
      v24[3] = &unk_1E9CF16A0;
      v24[4] = self;
      objc_msgSend(v17, "openFocusProfileWithCompletionHandler:", v24);

    }
  }
}

void __48__Application__profileFocusConfigurationChanged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsFocusProfileUpdate:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 867))
  {
    v3 = *(void **)(v2 + 936);
    *(_QWORD *)(v2 + 936) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 867) = 0;
  }
}

- (void)setNeedsFocusProfileUpdate:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_needsFocusProfileUpdate != a3)
  {
    v3 = a3;
    self->_needsFocusProfileUpdate = a3;
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D89E90]);

    v5 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Updated needsFocusProfileUpdate to %i", (uint8_t *)v6, 8u);
    }
  }
}

- (void)_tabGroupFocusConfigurationChanged
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_2(&dword_1D7CA3000, v0, v1, "Couldn't find FTG %{public}@ on focus change", v2);
  OUTLINED_FUNCTION_10();
}

uint64_t __49__Application__tabGroupFocusConfigurationChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsFocusedTabGroupUpdate:", 0);
}

- (BOOL)prefersSingleWindow
{
  void *v2;
  int v3;

  -[Application openSessions](self, "openSessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
    LOBYTE(v3) = 1;
  else
    v3 = _SFDeviceIsPad() ^ 1;

  return v3;
}

- (void)setNeedsFocusedTabGroupUpdate:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_needsFocusedTabGroupUpdate != a3)
  {
    v3 = a3;
    self->_needsFocusedTabGroupUpdate = a3;
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D89E98]);

    v5 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Updated needsFTGUpdate to %i", (uint8_t *)v6, 8u);
    }
  }
}

- (id)tabInfosForBrowserTabCompletionProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  Application *v29;
  uint64_t v30;
  id v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[Application openSessions](self, "openSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_315);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[Application _sortedBrowserControllers](self, "_sortedBrowserControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    v29 = self;
    v30 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isPrivateBrowsingEnabled", v29, v30) & 1) == 0)
        {
          if (!-[Application supportsMultipleScenes](self, "supportsMultipleScenes")
            || (objc_msgSend(v11, "windowState"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v12, "sceneID"),
                v13 = (void *)objc_claimAutoreleasedReturnValue(),
                v14 = objc_msgSend(v32, "containsObject:", v13),
                v13,
                v12,
                v14))
          {
            objc_msgSend(v11, "tabController");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "activeTabGroup");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v4, "containsObject:", v16) & 1) == 0)
            {
              objc_msgSend(v4, "addObject:", v16);
              v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
              objc_msgSend(v16, "uuid");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = (void *)objc_msgSend(v17, "initWithUUIDString:", v18);

              objc_msgSend(v16, "displayTitle");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "tabController");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "currentTabs");
              v22 = v8;
              v23 = v6;
              v24 = v4;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v33[0] = MEMORY[0x1E0C809B0];
              v33[1] = 3221225472;
              v33[2] = __55__Application_tabInfosForBrowserTabCompletionProvider___block_invoke_2;
              v33[3] = &unk_1E9CF2220;
              v33[4] = v11;
              v34 = v19;
              v35 = v20;
              v36 = v31;
              v26 = v20;
              v27 = v19;
              objc_msgSend(v25, "enumerateObjectsUsingBlock:", v33);

              v4 = v24;
              v6 = v23;
              v8 = v22;

              self = v29;
              v9 = v30;

            }
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v8);
  }

  return v31;
}

uint64_t __55__Application_tabInfosForBrowserTabCompletionProvider___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "persistentIdentifier");
}

void __55__Application_tabInfosForBrowserTabCompletionProvider___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D8A7D8]);
    objc_msgSend(v13, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v13, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v6, "initWithUUID:windowUUID:tabGroupUUID:tabGroupTitle:tabIndex:url:title:pageStatus:", v7, v8, v9, v10, a3, v5, v11, objc_msgSend(v13, "pageStatus"));

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
  }

}

- (id)selectedTabInfoForBrowserTabCompletionProvider:(id)a3
{
  return 0;
}

- (void)setReadingListWidgetNeedsReload
{
  self->_readingListWidgetNeedsReloading = 1;
}

- (void)reloadReadingListWidgetIfNeeded
{
  if (self->_readingListWidgetNeedsReloading)
  {
    self->_readingListWidgetNeedsReloading = 0;
    WBSReloadReadingListWidget();
  }
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5;
  NSObject *v6;
  SpotlightBookmarksDonationWriter *bookmarksDonationWriter;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_INFO, "Received request from CoreSpotlight to reindex all searchable items", buf, 2u);
  }
  bookmarksDonationWriter = self->_bookmarksDonationWriter;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__Application_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke;
  v9[3] = &unk_1E9CF2270;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[SpotlightBookmarksDonationWriter getBookmarksToDonateWithCompletionHandler:](bookmarksDonationWriter, "getBookmarksToDonateWithCompletionHandler:", v9);

}

void __83__Application_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__Application_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke_2;
  block[3] = &unk_1E9CF2248;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __83__Application_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D8AC68], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "historiesForProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reindexAllBookmarkAndHistoryItems:historiesForProfiles:withAcknowledgementHandler:", v2, v3, *(_QWORD *)(a1 + 48));

}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  SpotlightBookmarksDonationWriter *bookmarksDonationWriter;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  Application *v15;
  id v16;
  uint8_t buf[16];

  v7 = a4;
  v8 = a5;
  v9 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_INFO, "Received request from CoreSpotlight to reindex searchable items with identifiers.", buf, 2u);
  }
  bookmarksDonationWriter = self->_bookmarksDonationWriter;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__Application_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke;
  v13[3] = &unk_1E9CF22C0;
  v14 = v7;
  v15 = self;
  v16 = v8;
  v11 = v8;
  v12 = v7;
  -[SpotlightBookmarksDonationWriter getBookmarksToDonateWithCompletionHandler:](bookmarksDonationWriter, "getBookmarksToDonateWithCompletionHandler:", v13);

}

void __92__Application_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__Application_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_2;
  v6[3] = &unk_1E9CF2298;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v4 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __92__Application_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D8AC68], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "historiesForProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reindexBookmarkAndHistoryItemsWithIdentifiers:allBookmarks:historiesForProfiles:withAcknowledgementHandler:", v2, v3, v4, *(_QWORD *)(a1 + 56));

}

uint64_t __56__Application__showExtensionPermissionBannerIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "webExtensionForComposedIdentifier:", a2);
}

- (void)websiteDataStore:(id)a3 domain:(id)a4 didOpenDomainViaWindowOpen:(id)a5 withProperty:(int64_t)a6 directly:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  void *v12;
  id v13;

  v7 = a7;
  v13 = a4;
  v11 = a5;
  if (objc_msgSend(a3, "isPersistent"))
  {
    objc_msgSend(MEMORY[0x1E0D8A7C0], "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "donateWindowProxyWithDomain:openedDomain:windowProxyProperty:accessedPropertyDirectly:", v13, v11, a6, v7);

  }
}

- (id)_createBookmarkWithTitle:(id)a3 url:(id)a4 parentBookmark:(id)a5
{
  void *v7;
  void (**v8)(id, void *);
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;

  v7 = (void *)MEMORY[0x1E0DCCBA0];
  v8 = (void (**)(id, void *))a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "mainBookmarkCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0DCCB98]);
  objc_msgSend(v9, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithTitle:address:collectionType:", v10, v13, objc_msgSend(v14, "collectionType"));

  v8[2](v8, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0DCCBA0], "isLockedSync") & 1) != 0)
  {
    objc_msgSend(v11, "moveBookmark:toFolderWithID:", v15, objc_msgSend(v16, "identifier"));
    objc_msgSend(v11, "saveBookmark:", v15);
  }
  else if ((objc_msgSend(MEMORY[0x1E0DCCBA0], "lockSync") & 1) != 0
         || (objc_msgSend(v15, "isInserted") & 1) != 0
         || (objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager"),
             v17 = (void *)objc_claimAutoreleasedReturnValue(),
             v18 = objc_msgSend(v17, "isInMemoryBookmarkChangeTrackingAvailable"),
             v17,
             !v18))
  {
    objc_msgSend(v11, "moveBookmark:toFolderWithID:", v15, objc_msgSend(v16, "identifier"));
    objc_msgSend(v11, "saveBookmark:", v15);
    objc_msgSend(MEMORY[0x1E0DCCBA0], "unlockSync");
  }
  else
  {
    objc_msgSend(v11, "addBookmarkInMemory:toFolderWithID:", v15, objc_msgSend(v16, "identifier"));
  }

  return v15;
}

- (id)createBookmarkWithTitle:(id)a3 url:(id)a4
{
  return -[Application _createBookmarkWithTitle:url:parentBookmark:](self, "_createBookmarkWithTitle:url:parentBookmark:", a3, a4, &__block_literal_global_323);
}

uint64_t __43__Application_createBookmarkWithTitle_url___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rootBookmark");
}

- (void)deleteBookmarksWithUUIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[4];
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    *(_QWORD *)&v7 = 138543362;
    v15 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "bookmarkWithUUID:", v11, v15, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if ((objc_msgSend(v4, "deleteBookmark:", v12) & 1) == 0)
          {
            v13 = WBS_LOG_CHANNEL_PREFIXSiriLink();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[Application deleteBookmarksWithUUIDs:].cold.1(v20, v13, v12, &v21);
          }
        }
        else
        {
          v14 = WBS_LOG_CHANNEL_PREFIXSiriLink();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v23 = v11;
            _os_log_error_impl(&dword_1D7CA3000, v14, OS_LOG_TYPE_ERROR, "Can't find bookmark %{public}@", buf, 0xCu);
          }
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v8);
  }

}

- (id)createNewTab
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
}

- (id)createNewTabWithURL:(id)a3 isPrivate:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", a3, a4);
}

- (void)moveTabsWithUUIDs:(id)a3 toTabGroupWithUUID:(id)a4
{
  void *v6;
  WBTabGroupManager *tabGroupManager;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v10 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__Application_moveTabsWithUUIDs_toTabGroupWithUUID___block_invoke;
  v11[3] = &unk_1E9CF2350;
  v11[4] = self;
  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    tabGroupManager = self->_tabGroupManager;
    objc_msgSend(v10, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager tabGroupWithUUID:](tabGroupManager, "tabGroupWithUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[WBTabGroupManager moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:](self->_tabGroupManager, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v6, v9, 0, 0);

  }
}

id __52__Application_moveTabsWithUUIDs_toTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 624);
  objc_msgSend(a2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)moveTabsWithUUIDs:(id)a3 toWindowWithIdentifier:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v13 = a3;
  browserControllerWithEntityIdentifier(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "tabController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeTabGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__Application_moveTabsWithUUIDs_toWindowWithIdentifier___block_invoke;
    v14[3] = &unk_1E9CF2378;
    v14[4] = self;
    v11 = v10;
    v15 = v11;
    objc_msgSend(v13, "safari_mapAndFilterObjectsUsingBlock:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
      -[WBTabGroupManager moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:](self->_tabGroupManager, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v12, v9, 0, 0);

  }
}

id __56__Application_moveTabsWithUUIDs_toWindowWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a1;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 624);
  objc_msgSend(a2, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tabGroupUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v6, "safari_isCaseInsensitiveEqualToString:", *(_QWORD *)(v2 + 40));

  if ((v2 & 1) != 0)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)navigateTabWithUUID:(id)a3 toURL:(id)a4
{
  BrowserWindowController *browserWindowController;
  id v6;
  id v7;

  browserWindowController = self->_browserWindowController;
  v6 = a4;
  -[BrowserWindowController tabWithUUID:](browserWindowController, "tabWithUUID:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadURL:title:skipSyncableTabUpdates:", v6, &stru_1E9CFDBB0, 0);

}

- (id)createNewTabGroupWithTitle:(id)a3
{
  return 0;
}

- (void)deleteTabGroupsWithUUIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[WBTabGroupManager tabGroupWithUUID:](self->_tabGroupManager, "tabGroupWithUUID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          -[WBTabGroupManager removeTabGroup:](self->_tabGroupManager, "removeTabGroup:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSString)lastActiveProfileIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", *MEMORY[0x1E0D4F170]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)allWindowEntities
{
  void *v2;
  void *v3;

  -[Application browserControllers](self, "browserControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_328);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __32__Application_allWindowEntities__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isPrivateBrowsingEnabled") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    windowEntityForBrowserController(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)windowEntityWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  browserControllerWithEntityIdentifier(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    windowEntityForBrowserController(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)createNewWindowWithRequestIdentifier:(id)a3 isPrivate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[Application supportsMultipleScenes](self, "supportsMultipleScenes"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[Application browserControllers](self, "browserControllers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "proxy");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "appIntentRequestIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v6);

          if ((v15 & 1) != 0)
          {
            objc_msgSend(v12, "setPrivateBrowsingEnabled:", v4);
            entityIdentifierForBrowserController(v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_13:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)closeWindowsWithIdentifiers:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[5];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__Application_closeWindowsWithIdentifiers___block_invoke;
  v13[3] = &unk_1E9CF23E0;
  v13[4] = self;
  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[Application requestSceneSessionDestruction:options:errorHandler:](self, "requestSceneSessionDestruction:options:errorHandler:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0, &__block_literal_global_330);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

id __43__Application_closeWindowsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "openSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__Application_closeWindowsWithIdentifiers___block_invoke_2;
  v8[3] = &unk_1E9CF21B8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "safari_anyObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __43__Application_closeWindowsWithIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "persistentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __43__Application_closeWindowsWithIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXTabs();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __43__Application_closeWindowsWithIdentifiers___block_invoke_3_cold_1(v3);

}

- (void)showWindowWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[Application openSessions](self, "openSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__Application_showWindowWithIdentifier___block_invoke;
  v8[3] = &unk_1E9CF21B8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "safari_anyObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[Application requestSceneSessionActivation:userActivity:options:errorHandler:](self, "requestSceneSessionActivation:userActivity:options:errorHandler:", v6, 0, 0, 0);

}

uint64_t __40__Application_showWindowWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "persistentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)recentsStoreForProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D89E20]))
  {
    -[Application _recentsStoreForDefaultProfile](self, "_recentsStoreForDefaultProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabGroupManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "profileWithIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recentsStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AB90]), "initWithCloudTabDeviceProvider:", v7);
      objc_msgSend(v10, "setActiveProfileIdentifier:", v4);
      v11 = objc_alloc(MEMORY[0x1E0D8ABB0]);
      objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithSiteMetadataManager:", v12);

      objc_msgSend(v13, "registerProvider:", v10);
      objc_msgSend(v8, "setRecentsStore:", v13);

    }
    objc_msgSend(v8, "recentsStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_recentsStoreForDefaultProfile
{
  if (_recentsStoreForDefaultProfile_onceToken != -1)
    dispatch_once(&_recentsStoreForDefaultProfile_onceToken, &__block_literal_global_333);
  return (id)_recentsStoreForDefaultProfile_store;
}

void __45__Application__recentsStoreForDefaultProfile__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = objc_alloc(MEMORY[0x1E0D8AB90]);
  +[CloudTabStore sharedCloudTabStore](CloudTabStore, "sharedCloudTabStore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v0, "initWithCloudTabDeviceProvider:", v1);

  objc_msgSend(v6, "setActiveProfileIdentifier:", *MEMORY[0x1E0D89E20]);
  v2 = objc_alloc(MEMORY[0x1E0D8ABB0]);
  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithSiteMetadataManager:", v3);
  v5 = (void *)_recentsStoreForDefaultProfile_store;
  _recentsStoreForDefaultProfile_store = v4;

  objc_msgSend((id)_recentsStoreForDefaultProfile_store, "registerProvider:", v6);
}

- (int64_t)currentKeyboardModifierFlags
{
  return self->_currentKeyboardModifierFlags;
}

- (ForYouRecommendationMediator)existingForYouRecommendationMediator
{
  return (ForYouRecommendationMediator *)objc_loadWeakRetained((id *)&self->_existingForYouRecommendationMediator);
}

- (void)setExistingForYouRecommendationMediator:(id)a3
{
  objc_storeWeak((id *)&self->_existingForYouRecommendationMediator, a3);
}

- (SafariSettingsSyncEngine)settingsSyncEngine
{
  return self->_settingsSyncEngine;
}

- (WBSBackgroundImageAssetController)backgroundImageAssetController
{
  return self->_backgroundImageAssetController;
}

- (NSString)focusedTabGroupUUIDString
{
  return self->_focusedTabGroupUUIDString;
}

- (NSString)focusProfileIdentifier
{
  return self->_focusProfileIdentifier;
}

- (void)setFocusProfileIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 936);
}

- (BOOL)focusProfileUpdateIsForInactiveFocusMode
{
  return self->_focusProfileUpdateIsForInactiveFocusMode;
}

- (void)setFocusProfileUpdateIsForInactiveFocusMode:(BOOL)a3
{
  self->_focusProfileUpdateIsForInactiveFocusMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_focusedTabGroupUUIDString, 0);
  objc_storeStrong((id *)&self->_backgroundImageAssetController, 0);
  objc_storeStrong((id *)&self->_settingsSyncEngine, 0);
  objc_destroyWeak((id *)&self->_existingForYouRecommendationMediator);
  objc_storeStrong((id *)&self->_browserWindowController, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
  objc_storeStrong((id *)&self->_automationController, 0);
  objc_storeStrong((id *)&self->_scribbleFeedbackSyncEngine, 0);
  objc_storeStrong((id *)&self->_highlightManagerSuggestionsProviderBroadcaster, 0);
  objc_storeStrong((id *)&self->_profileIdentifiersToSuggestionsManagers, 0);
  objc_storeStrong((id *)&self->_userDefinedContentBlockerManagerForPrivateBrowsing, 0);
  objc_storeStrong((id *)&self->_userDefinedContentBlockerManager, 0);
  objc_storeStrong((id *)&self->_scribbleQuirksManager, 0);
  objc_storeStrong((id *)&self->_completionListVendorForHistoryService, 0);
  objc_storeStrong((id *)&self->_bookmarksDonationWriter, 0);
  objc_storeStrong((id *)&self->_offlineSearchSuggestionsModelUpdateManager, 0);
  objc_storeStrong((id *)&self->_profileServerIDToUserContentController, 0);
  objc_storeStrong((id *)&self->_profileServerIDToContentBlockerManagers, 0);
  objc_storeStrong((id *)&self->_profileServerIDToWebExtensionsControllers, 0);
  objc_storeStrong((id *)&self->_lockedPrivateBrowsingAuthenticationCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_lockedPrivateBrowsingAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_lockPrivateBrowsingInBackgroundTimer, 0);
  objc_storeStrong((id *)&self->_developerPreferencesDidChangeNotificationToken, 0);
  objc_storeStrong((id *)&self->_unifiedBarAnalyticsRecorder, 0);
  objc_storeStrong((id *)&self->_systemNoteTakingController, 0);
  objc_storeStrong((id *)&self->_cachedLegacyTLSHostManager, 0);
  objc_storeStrong((id *)&self->_processPools, 0);
  objc_storeStrong((id *)&self->_pendingFrequentlyVisitedSites, 0);
  objc_storeStrong((id *)&self->_historyController, 0);
  objc_storeStrong((id *)&self->_highlightManager, 0);
  objc_storeStrong((id *)&self->_pointerDeviceObserverToken, 0);
  objc_storeStrong((id *)&self->_pointerDevices, 0);
  objc_storeStrong((id *)&self->_wallpaperSuspensionAssertion, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_tabCompletionProvider, 0);
  objc_storeStrong((id *)&self->_readingListImageCache, 0);
  objc_storeStrong((id *)&self->_formAutoFillCorrectionsHistoryObserver, 0);
  objc_storeStrong((id *)&self->_forYouRecommendationMediator, 0);
  objc_storeStrong((id *)&self->_forYouRecentParsecResultsManager, 0);
  objc_storeStrong((id *)&self->_ephemeralTabGroupManager, 0);
  objc_storeStrong((id *)&self->_cyclerConnectionManager, 0);
  objc_storeStrong((id *)&self->_cloudHistory, 0);
  objc_storeStrong((id *)&self->_bookmarksDatabaseHealthReporter, 0);
  objc_storeStrong((id *)&self->_bookmarksDatabaseBackgroundTaskLockAcquisitor, 0);
  objc_storeStrong((id *)&self->_activeDownloads, 0);
}

- (id)_browserControllerForApplicationTesting
{
  void *v3;
  void *v4;
  void *v5;

  +[LaunchStateController sharedController](LaunchStateController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceMarkUIBecomeActiveForTesting");

  -[Application browserControllers](self, "browserControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)commandLineTestOption:(int)a3 arg:(const char *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", a4, 4);
  else
    v5 = 0;
  v14 = v5;
  if (!gTestOptions)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)gTestOptions;
    gTestOptions = (uint64_t)v6;

    v5 = v14;
  }
  if (a3 == 84 && v5)
  {
    objc_msgSend((id)gTestOptions, "setObject:forKey:", v5, CFSTR("testName"));
LABEL_19:
    v5 = v14;
    goto LABEL_20;
  }
  if (a3 == 85)
  {
    objc_msgSend((id)gTestOptions, "objectForKey:", CFSTR("URLs"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend((id)gTestOptions, "setObject:forKey:", v8, CFSTR("URLs"));
    }
    if (v14)
      objc_msgSend(v8, "addObject:", v14);

    goto LABEL_19;
  }
  if (a3 == 80)
  {
    if (v5)
    {
      v9 = objc_msgSend(v5, "rangeOfString:", CFSTR(":"));
      v5 = v14;
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = v9;
        v11 = (void *)gTestOptions;
        objc_msgSend(v14, "substringFromIndex:", v9 + 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "substringToIndex:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v12, v13);

        goto LABEL_19;
      }
    }
  }
LABEL_20:

}

void __55__Application_ApplicationTesting__startCommandLineTest__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = WBS_LOG_CHANNEL_PREFIXTest();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = v0;
    v3 = 138543362;
    v4 = objc_opt_class();
    _os_log_impl(&dword_1D7CA3000, v1, OS_LOG_TYPE_DEFAULT, "Completed %{public}@", (uint8_t *)&v3, 0xCu);

  }
  v2 = (void *)gTestController;
  gTestController = 0;

}

+ (BOOL)prepareTestControllerWithType:(id)a3 suiteURL:(id)a4 bundleNames:(id)a5 outputURL:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v23;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id v30;
  stat v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = WBS_LOG_CHANNEL_PREFIXTest();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v31.st_dev = 138413058;
    *(_QWORD *)&v31.st_mode = v9;
    WORD2(v31.st_ino) = 2112;
    *(__darwin_ino64_t *)((char *)&v31.st_ino + 6) = (__darwin_ino64_t)v10;
    HIWORD(v31.st_gid) = 2112;
    *(_QWORD *)&v31.st_rdev = v11;
    LOWORD(v31.st_atimespec.tv_sec) = 2112;
    *(__darwin_time_t *)((char *)&v31.st_atimespec.tv_sec + 2) = (__darwin_time_t)v12;
    _os_log_debug_impl(&dword_1D7CA3000, v13, OS_LOG_TYPE_DEBUG, "Preparing test controller: type = %@, suiteURL = %@, bundle names = %@, output URL = %@", (uint8_t *)&v31, 0x2Au);
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("autofill")))
  {
    gTestFileURLs = 1;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8A798]), "initWithSuiteURL:bundleNames:", v10, v11);
    v15 = (void *)gTestController;
    gTestController = v14;

    memset(&v31, 0, sizeof(v31));
    v16 = objc_retainAutorelease(v12);
    if (!stat((const char *)objc_msgSend(v16, "fileSystemRepresentation"), &v31) && (v31.st_mode & 0x1000) != 0)
    {
      v30 = 0;
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8A900]), "initWithFifoURL:error:", v16, &v30);
      v18 = v30;
      v26 = (void *)gTestResults;
      gTestResults = v25;

      v27 = gTestResults;
      v28 = WBS_LOG_CHANNEL_PREFIXTest();
      if (v27 && !v18)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          +[Application(ApplicationTesting) prepareTestControllerWithType:suiteURL:bundleNames:outputURL:].cold.3();
        goto LABEL_10;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        +[Application(ApplicationTesting) prepareTestControllerWithType:suiteURL:bundleNames:outputURL:].cold.4();
    }
    else
    {
      v29 = 0;
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8A800]), "initWithFileURL:error:", v16, &v29);
      v18 = v29;
      v19 = (void *)gTestResults;
      gTestResults = v17;

      v20 = gTestResults;
      v21 = WBS_LOG_CHANNEL_PREFIXTest();
      if (v20 && !v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          +[Application(ApplicationTesting) prepareTestControllerWithType:suiteURL:bundleNames:outputURL:].cold.1();
LABEL_10:
        v22 = 1;
LABEL_17:

        goto LABEL_18;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[Application(ApplicationTesting) prepareTestControllerWithType:suiteURL:bundleNames:outputURL:].cold.2();
    }
    v22 = 0;
    goto LABEL_17;
  }
  v23 = WBS_LOG_CHANNEL_PREFIXTest();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    +[Application(ApplicationTesting) prepareTestControllerWithType:suiteURL:bundleNames:outputURL:].cold.5();
  v22 = 0;
LABEL_18:

  return v22;
}

- (BOOL)overrideBrowserStateForTestNamed:(id)a3 browserController:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PPTTestBrowserWindowSettings *v21;
  void *v22;
  void *v23;
  BOOL v24;
  PinnedTabsManager *v25;
  void *v26;
  void *v27;
  PinnedTabsManager *v28;
  void *v29;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("TabOverview")) & 1) != 0
    || (objc_msgSend(v5, "hasPrefix:", CFSTR("SplitView")) & 1) != 0
    || (objc_msgSend(v5, "hasPrefix:", CFSTR("TabBar")) & 1) != 0
    || objc_msgSend(v5, "hasPrefix:", CFSTR("Memory")))
  {
    v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("TabOverviewOpenNewTab"));
    v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("TabBarSwitchTab"));
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MemoryAndLiveTabs")) & 1) != 0)
      goto LABEL_12;
    v9 = 64;
    if (v7)
      v9 = 8;
    v10 = v8 ? 1 : v9;
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("IOAndLiveTabs")))
    {
LABEL_12:
      objc_msgSend((id)gTabMemoryAndIOTestRunner, "testPageURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 200;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      v13 = objc_alloc(MEMORY[0x1E0DCCB30]);
      objc_msgSend(v6, "tabController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "deviceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v13, "initWithTitle:url:deviceIdentifier:", 0, v11, v15);

      objc_msgSend(v12, "addObject:", v16);
      --v10;
    }
    while (v10);
    v17 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v6, "windowState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localTabGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTabs:", v17);

    v20 = (void *)MEMORY[0x1E0D4EF30];
    v21 = objc_alloc_init(PPTTestBrowserWindowSettings);
    objc_msgSend(v20, "setSharedSettings:", v21);

    objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 1;
    objc_msgSend(v22, "setIsShowingTabView:forWindowWithUUID:", 1, v23);

    v25 = [PinnedTabsManager alloc];
    objc_msgSend(v6, "tabGroupManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tabCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[PinnedTabsManager initWithBrowserState:tabCollection:](v25, "initWithBrowserState:tabCollection:", 0, v27);
    objc_msgSend(v6, "tabController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPinnedTabsManager:", v28);

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)checkExtendedLaunchPageLoad:(id)a3 forTabDocument:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  PageLoadTestStatistics *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (gExtendedLaunchPageLoad == -1)
  {
    v6 = (void *)*MEMORY[0x1E0DC4730];
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "_launchTestName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isRunningTest:", v7) & 1) != 0)
    {
      objc_msgSend(v11, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("about:blank"));

      if ((v9 & 1) == 0)
      {
        v10 = -[PageLoadTestStatistics initWithCallback:]([PageLoadTestStatistics alloc], "initWithCallback:", &__block_literal_global_110);
        objc_msgSend(v5, "setPageLoadStatistics:", v10);
        gExtendedLaunchPageLoad = 1;

        goto LABEL_7;
      }
    }
    else
    {

    }
    gExtendedLaunchPageLoad = 0;
  }
LABEL_7:

}

void __78__Application_ApplicationTesting__checkExtendedLaunchPageLoad_forTabDocument___block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)*MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "_launchTestName");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "finishedTest:", v1);

}

- (id)_numberOption:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  objc_msgSend((id)gTestOptions, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_15;
    v5 = v3;
    if (objc_msgSend(v5, "compare:options:", CFSTR("yes"), 1))
    {
      if (objc_msgSend(v5, "compare:options:", CFSTR("no"), 1))
      {
        if (objc_msgSend(v5, "length"))
        {
          v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("."));
          v7 = (void *)MEMORY[0x1E0CB37E8];
          if (v6 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "intValue"));
          }
          else
          {
            objc_msgSend(v5, "doubleValue");
            objc_msgSend(v7, "numberWithDouble:");
          }
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }

LABEL_15:
        v4 = 0;
        goto LABEL_16;
      }
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = 0;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = 1;
    }
    objc_msgSend(v9, "numberWithBool:", v10);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v4 = (id)v8;

    goto LABEL_16;
  }
  v4 = v3;
LABEL_16:

  return v4;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __objc2_class *v12;
  uint64_t v13;
  ZoomTestProcessor *v14;
  BOOL v15;
  void *v16;
  ZoomTestProcessor *v17;
  void *v19;
  void *v20;
  __objc2_class *v21;
  void *v22;
  __objc2_class *v23;
  void *v24;
  void *v25;
  double v26;
  int v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  NSObject *v31;
  Application *v32;
  uint64_t v33;
  objc_super v34;

  v7 = a3;
  v8 = a4;
  if (gRunner)
    objc_msgSend((id)gRunner, "finish");
  gTestFileURLs = 1;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v8);
  v10 = (void *)gTestOptions;
  gTestOptions = v9;

  objc_msgSend((id)gTestOptions, "setObject:forKey:", v7, CFSTR("testName"));
  objc_storeStrong((id *)&gCurrentTestName, a3);
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("PLT")))
  {
    v12 = PurplePageLoadTestRunner;
LABEL_9:
    v13 = objc_msgSend([v12 alloc], "initWithTestName:browserController:", v7, v11);
LABEL_10:
    v14 = (ZoomTestProcessor *)v13;
    goto LABEL_11;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("Alexa")))
  {
    v12 = AlexaTestRunner;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("WhiteTabs")))
  {
    v12 = WhiteTabsTestRunner;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("ZoomTest")))
  {
    v14 = -[ZoomTestProcessor initWithTestName:browserController:]([ZoomTestProcessor alloc], "initWithTestName:browserController:", v7, v11);
    objc_msgSend((id)gTestOptions, "safari_stringForKey:", CFSTR("iterations"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContentInteractionTestRunner setIterations:](v14, "setIterations:", objc_msgSend(v19, "intValue"));

    objc_msgSend((id)gTestOptions, "safari_stringForKey:", CFSTR("stepsPerZoom"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ZoomTestProcessor setStepsPerZoom:](v14, "setStepsPerZoom:", objc_msgSend(v20, "intValue"));
LABEL_24:

    goto LABEL_11;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("ZoomAnimationTest")))
  {
    v21 = ZoomAnimationTestProcessor;
LABEL_21:
    v14 = (ZoomTestProcessor *)objc_msgSend([v21 alloc], "initWithTestName:browserController:", v7, v11);
    objc_msgSend((id)gTestOptions, "safari_stringForKey:", CFSTR("iterations"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContentInteractionTestRunner setIterations:](v14, "setIterations:", objc_msgSend(v20, "intValue"));
    goto LABEL_24;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("ScrollTest")))
  {
    v14 = -[ScrollTestProcessor initWithTestName:browserController:]([ScrollTestProcessor alloc], "initWithTestName:browserController:", v7, v11);
    objc_msgSend((id)gTestOptions, "safari_stringForKey:", CFSTR("iterations"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContentInteractionTestRunner setIterations:](v14, "setIterations:", objc_msgSend(v22, "intValue"));

    objc_msgSend((id)gTestOptions, "safari_stringForKey:", CFSTR("scrollDelta"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ZoomTestProcessor setScrollDelta:](v14, "setScrollDelta:", objc_msgSend(v20, "intValue"));
    goto LABEL_24;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("ScrollDecelerationTest")))
  {
    v21 = ScrollDecelerationTestProcessor;
    goto LABEL_21;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("RotationTest")))
  {
    v21 = RotationTestProcessor;
    goto LABEL_21;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("ScrollPerf")))
  {
    v23 = ScrollPerfTestRunner;
LABEL_31:
    v13 = objc_msgSend([v23 alloc], "initRenderTestWithName:browserController:showRenderTime:showFPS:", v7, v11, 0, 1);
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("PageLoadUsageofMemory")))
  {
    v12 = PurplePageMemoryTestRunner;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("FlowManagedPageLoadTest")))
  {
    v12 = PurpleFlowManagedPageLoadTestRunner;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("ContentAnimation")))
  {
    v23 = ContentAnimationTestRunner;
    goto LABEL_31;
  }
  if (!objc_msgSend(v7, "hasPrefix:", CFSTR("ScaleTest:")))
  {
    if (objc_msgSend(v7, "rangeOfString:", CFSTR("ShowHideBookmarksTest")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v7, "rangeOfString:", CFSTR("CanvasTest")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("url"));
        v17 = (ZoomTestProcessor *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(v8, "objectForKey:", CFSTR("URLs"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndex:", 0);
          v17 = (ZoomTestProcessor *)objc_claimAutoreleasedReturnValue();

        }
        v15 = -[Application startCanvasTest:](self, "startCanvasTest:", v17);
        goto LABEL_13;
      }
      if (objc_msgSend(v7, "rangeOfString:", CFSTR("TabViewBringUpTest")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[Application prepareTabViewBringUpTest](self, "prepareTabViewBringUpTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "rangeOfString:", CFSTR("TabViewRotateTest")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[Application prepareTabViewRotationTest](self, "prepareTabViewRotationTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "rangeOfString:", CFSTR("TabViewOpenTest")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[Application prepareTabViewOpenTest](self, "prepareTabViewOpenTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "rangeOfString:", CFSTR("TabViewSelectTest")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[Application prepareTabViewSelectTest](self, "prepareTabViewSelectTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "rangeOfString:", CFSTR("TabViewCloseTest")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[Application prepareTabViewCloseTest](self, "prepareTabViewCloseTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "rangeOfString:", CFSTR("KeyboardSplitAndMerge")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[Application startKeyboardSplitAndMergeTest](self, "startKeyboardSplitAndMergeTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "rangeOfString:", CFSTR("KeyboardBringup")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[Application startKeyboardBringupTest](self, "startKeyboardBringupTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "rangeOfString:", CFSTR("KeyboardRotation")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[Application startKeyboardRotationTest](self, "startKeyboardRotationTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "rangeOfString:", CFSTR("LargeFormFocus")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[Application runLargeFormFocusTest](self, "runLargeFormFocusTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "rangeOfString:", CFSTR("LargeFormTyping")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[Application runLargeFormTypingTest](self, "runLargeFormTypingTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "rangeOfString:", CFSTR("GeneratePassword")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[Application runGeneratePasswordTest](self, "runGeneratePasswordTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("TabOverview")))
      {
        -[Application runTabOverviewTest](self, "runTabOverviewTest");
LABEL_76:
        v15 = 1;
        goto LABEL_16;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("TabSnapshotCacheStressTest")))
      {
        -[Application runTabSnapshotCacheStressTest](self, "runTabSnapshotCacheStressTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("BookmarksView")))
      {
        -[Application runBookmarksViewTest](self, "runBookmarksViewTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("SplitView")))
      {
        v31 = WBS_LOG_CHANNEL_PREFIXPerformanceTest();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[Application(ApplicationTesting) runTest:options:].cold.1(v31);
        goto LABEL_15;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("SearchPerformanceUnifiedFieldKeyTimeTest")))
      {
        -[Application startSearchPerformanceUnifiedFieldKeyTimeTest](self, "startSearchPerformanceUnifiedFieldKeyTimeTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("SearchPerformanceDetailed")))
      {
        -[Application startSearchPerformanceDetailedTestWithCF:](self, "startSearchPerformanceDetailedTestWithCF:", objc_msgSend(v7, "hasPrefix:", CFSTR("SearchPerformanceDetailedWithCF")));
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("SearchPerformance")))
      {
        -[Application startSearchPerformanceTest](self, "startSearchPerformanceTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("SidebarOpen")))
      {
        v29 = -[Application startSidebarTest](self, "startSidebarTest");
        goto LABEL_61;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("TabBar")))
      {
        v29 = -[Application startTabBarTest](self, "startTabBarTest");
        goto LABEL_61;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("History")))
      {
        v29 = -[Application startHistoryTest](self, "startHistoryTest");
        goto LABEL_61;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("Memory")))
      {
        v32 = self;
        v33 = 0;
LABEL_100:
        v29 = -[Application runMemoryOrIOTestWithType:](v32, "runMemoryOrIOTestWithType:", v33);
        goto LABEL_61;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("IO")))
      {
        v32 = self;
        v33 = 1;
        goto LABEL_100;
      }
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("TabViewScroll")))
      {
        -[Application prepareTabViewScrollTest](self, "prepareTabViewScrollTest");
        goto LABEL_76;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("Resize")))
      {
        v29 = -[Application _startResizeTestWithName:](self, "_startResizeTestWithName:", v7);
      }
      else
      {
        v34.receiver = self;
        v34.super_class = (Class)Application;
        v29 = -[Application runTest:options:](&v34, sel_runTest_options_, v7, v8);
      }
    }
    else
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("iterations"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      gShowBookmarksTestIterations = objc_msgSend(v28, "intValue");

      v29 = -[Application prepareBookmarksTest](self, "prepareBookmarksTest");
    }
LABEL_61:
    v15 = v29;
    goto LABEL_16;
  }
  v14 = (ZoomTestProcessor *)-[PurplePageLoadTestRunner initRenderTestWithName:browserController:showRenderTime:showFPS:]([ScaleTestProcessor alloc], "initRenderTestWithName:browserController:showRenderTime:showFPS:", v7, v11, 1, 0);
  objc_msgSend(v8, "objectForKey:", CFSTR("scale"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v27 = 0;
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("max")) & 1) == 0
      && (objc_msgSend(v25, "isEqualToString:", CFSTR(".5max")) & 1) == 0)
    {
      objc_msgSend(v25, "floatValue");
      v27 = LODWORD(v26);
    }
    LODWORD(v26) = v27;
    -[ZoomTestProcessor setZoomScale:](v14, "setZoomScale:", v26);
  }

LABEL_11:
  if (!v14)
  {
    NSLog((NSString *)CFSTR("Could not run test '%@'"), v7);
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  v15 = 1;
  gRunningPurpleTest = 1;
  v16 = (void *)gRunner;
  gRunner = (uint64_t)v14;
  v17 = v14;

  objc_msgSend((id)gRunner, "setDelegate:", self);
  -[PageLoadTestRunner setTestOptions:](v17, "setTestOptions:", v8);
  -[PageLoadTestRunner start](v17, "start");
LABEL_13:

LABEL_16:
  return v15;
}

- (void)_observeNotificationOnce:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a3;
  objc_msgSend(v6, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__Application_ApplicationTesting___observeNotificationOnce_handler___block_invoke;
  v13[3] = &unk_1E9CF27F0;
  v14 = v5;
  v15 = &v16;
  v10 = v5;
  objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v7, 0, v9, v13);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v17[5];
  v17[5] = v11;

  _Block_object_dispose(&v16, 8);
}

void __68__Application_ApplicationTesting___observeNotificationOnce_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v3 = (void *)MEMORY[0x1E0CB37D0];
    v7 = a2;
    objc_msgSend(v3, "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)startKeyboardSplitAndMergeTest
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__Application_ApplicationTesting__startKeyboardSplitAndMergeTest__block_invoke;
  v8[3] = &unk_1E9CF1900;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __65__Application_ApplicationTesting__startKeyboardSplitAndMergeTest__block_invoke_2;
  v6[3] = &unk_1E9CF1900;
  v7 = v9;
  v5 = v9;
  -[Application runTestForKeyboardSplitAndMergeWithName:withShowKeyboardBlock:withExtraResultsBlock:withCleanupBlock:](self, "runTestForKeyboardSplitAndMergeWithName:withShowKeyboardBlock:withExtraResultsBlock:withCleanupBlock:", CFSTR("KeyboardSplitAndMerge"), v8, 0, v6);

}

uint64_t __65__Application_ApplicationTesting__startKeyboardSplitAndMergeTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFavoritesFieldFocused:animated:", 1, 0);
}

uint64_t __65__Application_ApplicationTesting__startKeyboardSplitAndMergeTest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelFavorites");
}

- (void)startKeyboardBringupTest
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[Application loadBlankPageforKeyboardTests](self, "loadBlankPageforKeyboardTests");
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__Application_ApplicationTesting__startKeyboardBringupTest__block_invoke;
  v10[3] = &unk_1E9CF1900;
  v11 = v3;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __59__Application_ApplicationTesting__startKeyboardBringupTest__block_invoke_2;
  v8[3] = &unk_1E9CF1900;
  v9 = v11;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __59__Application_ApplicationTesting__startKeyboardBringupTest__block_invoke_3;
  v6[3] = &unk_1E9CF1900;
  v7 = v9;
  v5 = v9;
  -[Application runTestForKeyboardBringupAndDismissalWithName:withShowKeyboardBlock:withHideKeyboardBlock:withExtraResultsBlock:withCleanupBlock:](self, "runTestForKeyboardBringupAndDismissalWithName:withShowKeyboardBlock:withHideKeyboardBlock:withExtraResultsBlock:withCleanupBlock:", CFSTR("KeyboardBringup"), v10, v8, 0, v6);

}

uint64_t __59__Application_ApplicationTesting__startKeyboardBringupTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFavoritesFieldFocused:animated:", 1, 0);
}

uint64_t __59__Application_ApplicationTesting__startKeyboardBringupTest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelFavorites");
}

void __59__Application_ApplicationTesting__startKeyboardBringupTest__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tabController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "closeAllOpenTabsAnimated:", 0);

}

- (void)startKeyboardRotationTest
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  Application *v8;
  _QWORD v9[4];
  id v10;

  -[Application loadBlankPageforKeyboardTests](self, "loadBlankPageforKeyboardTests");
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__Application_ApplicationTesting__startKeyboardRotationTest__block_invoke;
  v9[3] = &unk_1E9CF1900;
  v10 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __60__Application_ApplicationTesting__startKeyboardRotationTest__block_invoke_2;
  v6[3] = &unk_1E9CF1830;
  v7 = v10;
  v8 = self;
  v5 = v10;
  -[Application runTestForKeyboardRotationWithName:fromOrientation:withShowKeyboardBlock:withExtraResultsBlock:withCleanupBlock:](self, "runTestForKeyboardRotationWithName:fromOrientation:withShowKeyboardBlock:withExtraResultsBlock:withCleanupBlock:", CFSTR("KeyboardRotation"), 1, v9, 0, v6);

}

uint64_t __60__Application_ApplicationTesting__startKeyboardRotationTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFavoritesFieldFocused:animated:", 1, 0);
}

void __60__Application_ApplicationTesting__startKeyboardRotationTest__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cancelFavorites");
  objc_msgSend(*(id *)(a1 + 40), "rotateIfNeeded:", 1);
  objc_msgSend(*(id *)(a1 + 32), "tabController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeAllOpenTabsAnimated:", 0);

}

- (void)loadBlankPageforKeyboardTests
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeAllOpenTabsAnimated:", 0);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("about:blank"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v7, "loadURLInNewTab:inBackground:", v3, 0);

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 2.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runUntilDate:", v6);

}

- (void)_loadAlternateHTMLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[Application loadBlankPageforKeyboardTests](self, "loadBlankPageforKeyboardTests");
  v8 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__Application_ApplicationTesting___loadAlternateHTMLString_completionHandler___block_invoke;
  block[3] = &unk_1E9CF2248;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);

}

void __78__Application_ApplicationTesting___loadAlternateHTMLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_browserControllerForApplicationTesting");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tabController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeTabDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAllowsProgrammaticFocusToBeginInputSession:", 1);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("about:blank"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("about:blank"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadAlternateHTMLString:baseURL:forUnreachableURL:", v4, v5, v6);

  v7 = dispatch_time(0, 4000000000);
  dispatch_after(v7, MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 48));

}

- (void)_loadLargeForm:(id)a3
{
  -[Application _loadAlternateHTMLString:completionHandler:](self, "_loadAlternateHTMLString:completionHandler:", CFSTR("<html><head><script>function populate(){var f=document.getElementById(\"form\");for (var i=0; i<1000; ++i) {var input = document.createElement('input');input.type = \"text\";input.name = \"firstname \" + i;f.appendChild(input);}}</script></head><body onload=\"populate()\"><form id=\"form\" action=\"/action_page.php\">First name:<br><input type=\"text\" name=\"firstname\" value=\"Test\"><br>Last name:<br><input type=\"text\" name=\"lastname\" value=\"Name\"><br><br><input type=\"submit\" value=\"Submit\"></form> </body></html>"),
    a3);
}

- (void)runLargeFormFocusTest
{
  _QWORD v2[5];
  __CFString *v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__Application_ApplicationTesting__runLargeFormFocusTest__block_invoke;
  v2[3] = &unk_1E9CF1830;
  v2[4] = self;
  v3 = CFSTR("document.getElementsByName(\"firstname 500\")[0].focus();");
  -[Application _loadLargeForm:](self, "_loadLargeForm:", v2);

}

void __56__Application_ApplicationTesting__runLargeFormFocusTest__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__Application_ApplicationTesting__runLargeFormFocusTest__block_invoke_2;
  v7[3] = &unk_1E9CF1A68;
  v7[4] = v2;
  objc_msgSend(v2, "_observeNotificationOnce:handler:", CFSTR("WebFormElementDidFocusNotification"), v7);
  objc_msgSend(*(id *)(a1 + 32), "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", gCurrentTestName);
  objc_msgSend(v5, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "evaluateJavaScript:completionHandler:", *(_QWORD *)(a1 + 40), 0);

}

uint64_t __56__Application_ApplicationTesting__runLargeFormFocusTest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:", gCurrentTestName);
}

- (void)_typeTextInForm:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = gCurrentTestName;
  v8 = a3;
  -[Application startedSubTest:forTest:withMetrics:](self, "startedSubTest:forTest:withMetrics:", CFSTR("TypeLetter"), v7, &unk_1E9D62748);
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tabController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeTabDocument");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "_responderForKeyEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertText:", v8);

  objc_msgSend(v11, "webView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__Application_ApplicationTesting___typeTextInForm_completionHandler___block_invoke;
  v15[3] = &unk_1E9CF2818;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v13, "evaluateJavaScript:completionHandler:", CFSTR("null;"), v15);

}

uint64_t __69__Application_ApplicationTesting___typeTextInForm_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("TypeLetter"), gCurrentTestName);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_runFormTypingTextWithSetupScript:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  _QWORD aBlock[4];
  __CFString *v13;
  Application *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *(*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[4];

  v4 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__222;
  v21 = __Block_byref_object_dispose__223;
  v22 = 0;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke;
  aBlock[3] = &unk_1E9CF2868;
  v13 = CFSTR("Hello World");
  v14 = self;
  v15 = v23;
  v16 = &v17;
  v6 = _Block_copy(aBlock);
  v7 = (void *)v18[5];
  v18[5] = (uint64_t)v6;

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke_3;
  v9[3] = &unk_1E9CF28B8;
  v9[4] = self;
  v8 = v4;
  v10 = v8;
  v11 = &v17;
  -[Application _loadLargeForm:](self, "_loadLargeForm:", v9);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v23, 8);

}

void __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  __int128 v8;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v2 >= objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "finishedTest:", gCurrentTestName);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke_2;
    v7[3] = &unk_1E9CF2840;
    v8 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v4, "_typeTextInForm:completionHandler:", v3, v7);

  }
}

uint64_t __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke_2(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
}

void __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  objc_msgSend(*(id *)(a1 + 32), "_browserControllerForApplicationTesting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTabDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke_4;
  v8[3] = &unk_1E9CF2890;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = v7;
  objc_msgSend(v5, "evaluateJavaScript:completionHandler:", v6, v8);

}

void __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", gCurrentTestName);
  v2 = dispatch_time(0, 1000000000);
  dispatch_after(v2, MEMORY[0x1E0C80D38], *(dispatch_block_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)runLargeFormTypingTest
{
  const __CFString *v3;

  if ((objc_msgSend((id)gCurrentTestName, "hasSuffix:", CFSTR("Insert")) & 1) != 0)
  {
    v3 = CFSTR("var field=document.getElementsByName(\"firstname 500\")[0];field.oninput=function() { var insertedElement=document.createElement('input');insertedElement.type='text';insertedElement.value='Hello World';field.parentNode.insertBefore(insertedElement,field);};field.focus();");
  }
  else if ((objc_msgSend((id)gCurrentTestName, "hasSuffix:", CFSTR("Delete")) & 1) != 0)
  {
    v3 = CFSTR("var field=document.getElementsByName(\"firstname 500\")[0];field.oninput=function(){field.parentNode.removeChild(field.previousSibling);};field.focus();");
  }
  else if (objc_msgSend((id)gCurrentTestName, "hasSuffix:", CFSTR("Reorder")))
  {
    v3 = CFSTR("var field=document.getElementsByName(\"firstname 500\")[0];field.oninput=function(){field.parentNode.insertBefore(field.previousSibling, null);};field.focus();");
  }
  else
  {
    v3 = CFSTR("document.getElementsByName(\"firstname 500\")[0].focus();");
  }
  -[Application _runFormTypingTextWithSetupScript:](self, "_runFormTypingTextWithSetupScript:", v3);
}

- (void)runGeneratePasswordTest
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__Application_ApplicationTesting__runGeneratePasswordTest__block_invoke;
  v2[3] = &unk_1E9CF1900;
  v2[4] = self;
  -[Application _loadAlternateHTMLString:completionHandler:](self, "_loadAlternateHTMLString:completionHandler:", CFSTR("<html><body>Username: <input type=\"text\" name=\"username\"><br>Password: <input type=\"password\" name=\"password\"><br>Confirm Password: <input type=\"password\" name=\"confirm_password\"></body></html>"), v2);
}

void __58__Application_ApplicationTesting__runGeneratePasswordTest__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0DC4E70];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__Application_ApplicationTesting__runGeneratePasswordTest__block_invoke_2;
  v8[3] = &unk_1E9CF1A68;
  v8[4] = v2;
  objc_msgSend(v2, "_observeNotificationOnce:handler:", v3, v8);
  objc_msgSend(*(id *)(a1 + 32), "_browserControllerForApplicationTesting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTabDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", gCurrentTestName);
  objc_msgSend(v6, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evaluateJavaScript:completionHandler:", CFSTR("document.getElementsByName(\"password\")[0].focus();"),
    0);

}

uint64_t __58__Application_ApplicationTesting__runGeneratePasswordTest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:", gCurrentTestName);
}

- (void)loadTabsForTesting:(unint64_t)a3 presentTabView:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E98];
  _SFSafariTestContentDirectoryPath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Apple.webarchive"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:isDirectory:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "closeAllOpenTabsAnimated:", 1);
  for (; a3; --a3)
    v11 = (id)objc_msgSend(v16, "loadURLInNewTab:inBackground:", v10, 0);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 20.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "runUntilDate:", v13);

  objc_msgSend(v16, "tabCollectionViewProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tabThumbnailCollectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    objc_msgSend(v15, "presentAnimated:", 1);
  else
    objc_msgSend(v15, "dismissAnimated:", 1);

}

- (void)loadTabsForTesting:(unint64_t)a3 presentTabView:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v8 = a5;
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tabController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "closeAllOpenTabsAnimated:", 1);
  -[Application _loadTabsForTesting:presentTabView:completion:](self, "_loadTabsForTesting:presentTabView:completion:", a3, v5, v8);

}

- (void)_preparePageLoadTestControllerParameters
{
  void *v2;
  id v3;

  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processPool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setObject:forBundleParameter:", MEMORY[0x1E0C9AAB0], CFSTR("enablePageLoadMeasurementCollection"));

}

- (void)_loadTabsForTesting:(unint64_t)a3 presentTabView:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
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
  dispatch_time_t v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  unint64_t v23;
  BOOL v24;
  _QWORD v25[3];
  char v26;

  v5 = a4;
  v8 = a5;
  -[Application _preparePageLoadTestControllerParameters](self, "_preparePageLoadTestControllerParameters");
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tabController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    _SFSafariTestContentDirectoryPath();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("Apple.webarchive"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:isDirectory:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "insertNewBlankTabDocumentAnimated:", 0);
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = 0;
    objc_msgSend(v10, "activeTabDocument");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __81__Application_ApplicationTesting___loadTabsForTesting_presentTabView_completion___block_invoke;
    v20[3] = &unk_1E9CF2908;
    v22 = v25;
    v23 = a3;
    v20[4] = self;
    v24 = v5;
    v21 = v8;
    objc_msgSend(v15, "loadTestURL:withCallback:", v14, v20);

    objc_msgSend(v10, "activeTabDocument");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pageLoadStatistics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPageLoadingTimeoutInterval:", 5.0);

    _Block_object_dispose(v25, 8);
  }
  else
  {
    objc_msgSend(v9, "tabCollectionViewProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tabThumbnailCollectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v14, "presentAnimated:", 1);
    else
      objc_msgSend(v14, "dismissAnimated:", 1);
    v19 = dispatch_time(0, 5000000000);
    dispatch_after(v19, MEMORY[0x1E0C80D38], v8);
  }

}

void __81__Application_ApplicationTesting___loadTabsForTesting_presentTabView_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  dispatch_time_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  char v9;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    v3 = dispatch_time(0, 300000000);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[2] = __81__Application_ApplicationTesting___loadTabsForTesting_presentTabView_completion___block_invoke_2;
    v6[3] = &unk_1E9CF28E0;
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v8 = v4;
    v6[1] = 3221225472;
    v9 = *(_BYTE *)(a1 + 64);
    v7 = v5;
    dispatch_after(v3, MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __81__Application_ApplicationTesting___loadTabsForTesting_presentTabView_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadTabsForTesting:presentTabView:completion:", *(_QWORD *)(a1 + 48) - 1, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)prepareTabViewBringUpTest
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__Application_ApplicationTesting__prepareTabViewBringUpTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __60__Application_ApplicationTesting__prepareTabViewBringUpTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareTabViewBringUpTest");
}

- (void)_prepareTabViewBringUpTest
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[Application loadTabsForTesting:presentTabView:](self, "loadTabsForTesting:presentTabView:", 8, 0);
  v3 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__Application_ApplicationTesting___prepareTabViewBringUpTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

void __61__Application_ApplicationTesting___prepareTabViewBringUpTest__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "startTabViewBringUpTest");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishedSubTest:forTest:", CFSTR("TabViewBringUpAnimationBeginSubTest"), gCurrentTestName);

}

- (void)startTabViewBringUpTest
{
  void *v3;
  void *v4;
  id v5;

  -[Application startedTest:](self, "startedTest:", gCurrentTestName);
  -[Application startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("TabViewBringUpAnimationBeginSubTest"), gCurrentTestName);
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabCollectionViewProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tabThumbnailCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentAnimated:", 1);

}

- (void)prepareTabViewOpenTest
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__Application_ApplicationTesting__prepareTabViewOpenTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __57__Application_ApplicationTesting__prepareTabViewOpenTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareTabViewOpenTest");
}

- (void)_prepareTabViewOpenTest
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[Application loadTabsForTesting:presentTabView:](self, "loadTabsForTesting:presentTabView:", 8, 1);
  v3 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__Application_ApplicationTesting___prepareTabViewOpenTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

void __58__Application_ApplicationTesting___prepareTabViewOpenTest__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "startTabViewOpenTest");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishedSubTest:forTest:", CFSTR("TabViewOpenAnimationBeginSubTest"), gCurrentTestName);

}

- (void)startTabViewOpenTest
{
  void *v3;
  void *v4;
  id v5;

  -[Application startedTest:](self, "startedTest:", gCurrentTestName);
  -[Application startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("TabViewOpenAnimationBeginSubTest"), gCurrentTestName);
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabCollectionViewProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tabThumbnailCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentAnimated:", 1);

}

- (void)prepareTabViewSelectTest
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__Application_ApplicationTesting__prepareTabViewSelectTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __59__Application_ApplicationTesting__prepareTabViewSelectTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareTabViewSelectTest");
}

- (void)_prepareTabViewSelectTest
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[Application loadTabsForTesting:presentTabView:](self, "loadTabsForTesting:presentTabView:", 8, 1);
  v3 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__Application_ApplicationTesting___prepareTabViewSelectTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

void __60__Application_ApplicationTesting___prepareTabViewSelectTest__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "startTabViewSelectTest");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishedSubTest:forTest:", CFSTR("TabViewSelectAnimationBeginSubTest"), gCurrentTestName);

}

- (void)startTabViewSelectTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[Application startedTest:](self, "startedTest:", gCurrentTestName);
  -[Application startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("TabViewSelectAnimationBeginSubTest"), gCurrentTestName);
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabCollectionViewProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tabOverview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_dismissWithItem:", v6);
}

- (void)prepareTabViewCloseTest
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__Application_ApplicationTesting__prepareTabViewCloseTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __58__Application_ApplicationTesting__prepareTabViewCloseTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareTabViewCloseTest");
}

- (void)_prepareTabViewCloseTest
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[Application loadTabsForTesting:presentTabView:](self, "loadTabsForTesting:presentTabView:", 8, 1);
  v3 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__Application_ApplicationTesting___prepareTabViewCloseTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __59__Application_ApplicationTesting___prepareTabViewCloseTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startTabViewCloseTest");
}

- (void)startTabViewCloseTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabCollectionViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[Application startedTest:](self, "startedTest:", gCurrentTestName);
  -[Application startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("TabViewSelectAnimationBeginSubTest"), gCurrentTestName);
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentTabDocuments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "closeTabDocument:animated:", v8, 1);

  v9 = gCurrentTestName;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__Application_ApplicationTesting__startTabViewCloseTest__block_invoke;
  v11[3] = &unk_1E9CF1900;
  v12 = v4;
  v10 = v4;
  -[Application finishedTest:waitForCommit:extraResults:withTeardownBlock:](self, "finishedTest:waitForCommit:extraResults:withTeardownBlock:", v9, 1, 0, v11);

}

void __56__Application_ApplicationTesting__startTabViewCloseTest__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__Application_ApplicationTesting__startTabViewCloseTest__block_invoke_2;
  block[3] = &unk_1E9CF1900;
  v2 = *(id *)(a1 + 32);
  dispatch_after(1uLL, MEMORY[0x1E0C80D38], block);

}

void __56__Application_ApplicationTesting__startTabViewCloseTest__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tabThumbnailCollectionView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissAnimated:", 1);

}

- (void)prepareTabViewRotationTest
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__Application_ApplicationTesting__prepareTabViewRotationTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __61__Application_ApplicationTesting__prepareTabViewRotationTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareTabViewRotationTest");
}

- (void)_prepareTabViewRotationTest
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[Application loadTabsForTesting:presentTabView:](self, "loadTabsForTesting:presentTabView:", 8, 1);
  v3 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__Application_ApplicationTesting___prepareTabViewRotationTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __62__Application_ApplicationTesting___prepareTabViewRotationTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startTabViewRotationTest");
}

- (void)startTabViewRotationTest
{
  uint64_t *v3;
  Application *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  Application *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  Application *v15;

  -[Application startedTest:](self, "startedTest:", gCurrentTestName);
  if (objc_msgSend((id)gCurrentTestName, "rangeOfString:", CFSTR("Landscape")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __59__Application_ApplicationTesting__startTabViewRotationTest__block_invoke_2;
    v9 = &unk_1E9CF16A0;
    v10 = self;
    v3 = &v6;
    v4 = self;
    v5 = 3;
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __59__Application_ApplicationTesting__startTabViewRotationTest__block_invoke;
    v14 = &unk_1E9CF16A0;
    v15 = self;
    v3 = &v11;
    v4 = self;
    v5 = 1;
  }
  -[Application rotateIfNeeded:completion:](v4, "rotateIfNeeded:completion:", v5, v3, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t __59__Application_ApplicationTesting__startTabViewRotationTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:waitForCommit:extraResults:", gCurrentTestName, 1, 0);
}

uint64_t __59__Application_ApplicationTesting__startTabViewRotationTest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:waitForCommit:extraResults:", gCurrentTestName, 1, 0);
}

- (void)prepareTabViewScrollTest
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__Application_ApplicationTesting__prepareTabViewScrollTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __59__Application_ApplicationTesting__prepareTabViewScrollTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareTabViewScrollTest");
}

- (void)_prepareTabViewScrollTest
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__Application_ApplicationTesting___prepareTabViewScrollTest__block_invoke;
  v2[3] = &unk_1E9CF1900;
  v2[4] = self;
  -[Application loadTabsForTesting:presentTabView:completion:](self, "loadTabsForTesting:presentTabView:completion:", 20, 1, v2);
}

void __60__Application_ApplicationTesting___prepareTabViewScrollTest__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "_browserControllerForApplicationTesting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabCollectionViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "tabThumbnailCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "test_scrollToTopWithoutAnimation");
  v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__Application_ApplicationTesting___prepareTabViewScrollTest__block_invoke_2;
  v6[3] = &unk_1E9CF1900;
  v6[4] = v5;
  objc_msgSend(v5, "installCACommitCompletionBlock:", v6);

}

uint64_t __60__Application_ApplicationTesting___prepareTabViewScrollTest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startTabViewScrollTest");
}

- (void)startTabViewScrollTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  CGRect v8;
  CGRect v9;

  if (objc_msgSend(getRPTTestRunnerClass(), "isRecapAvailable"))
  {
    -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tabCollectionViewProvider");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "tabThumbnailCollectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bounds");
    v9 = CGRectInset(v8, 0.0, 100.0);
    -[Application _scrollContentWithTestName:scrollingBounds:amplitude:completionHandler:](self, "_scrollContentWithTestName:scrollingBounds:amplitude:completionHandler:", gCurrentTestName, 0, v9.origin.x, v9.origin.y, v9.size.width, v9.size.height, v9.size.height + v9.size.height);

  }
  else
  {
    -[Application failedTest:withFailure:](self, "failedTest:withFailure:", gCurrentTestName, CFSTR("Recap not available"));
  }
}

- (void)_scrollContentWithTestName:(id)a3 scrollingBounds:(CGRect)a4 amplitude:(double)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = a6;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v14 = (void *)getRPTScrollViewTestParametersClass_softClass;
  v22 = getRPTScrollViewTestParametersClass_softClass;
  if (!getRPTScrollViewTestParametersClass_softClass)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getRPTScrollViewTestParametersClass_block_invoke;
    v18[3] = &unk_1E9CF1780;
    v18[4] = &v19;
    __getRPTScrollViewTestParametersClass_block_invoke((uint64_t)v18);
    v14 = (void *)v20[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v19, 8);
  v16 = [v15 alloc];
  v17 = (void *)objc_msgSend(v16, "initWithTestName:scrollBounds:amplitude:direction:completionHandler:", gCurrentTestName, 1, 0, x, y, width, height, a5);
  objc_msgSend(getRPTTestRunnerClass(), "runTestWithParameters:", v17);

}

- (BOOL)startSidebarTest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  dispatch_time_t v7;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBool:forKey:", 0, CFSTR("ShowSidebar"));

  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("about:blank"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "loadURLInNewTab:inBackground:animated:", v5, 0, 0);

  v7 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__Application_ApplicationTesting__startSidebarTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);

  return 1;
}

uint64_t __51__Application_ApplicationTesting__startSidebarTest__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__Application_ApplicationTesting__startSidebarTest__block_invoke_2;
  v3[3] = &unk_1E9CF16A0;
  v3[4] = v1;
  return objc_msgSend(v1, "rotateIfNeeded:completion:", 3, v3);
}

uint64_t __51__Application_ApplicationTesting__startSidebarTest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runSidebarTest");
}

- (void)_runSidebarTest
{
  __CFString **v3;
  void *v4;
  id v5;

  if ((objc_msgSend((id)gCurrentTestName, "isEqualToString:", CFSTR("SidebarOpenBookmarks")) & 1) != 0)
  {
    v3 = kCollectionTypeBookmarks;
LABEL_5:
    +[BookmarksNavigationController test_setSavedStateCollection:](BookmarksNavigationController, "test_setSavedStateCollection:", *v3);
    goto LABEL_6;
  }
  if (objc_msgSend((id)gCurrentTestName, "isEqualToString:", CFSTR("SidebarOpenReadingList")))
  {
    v3 = kCollectionTypeReadingList;
    goto LABEL_5;
  }
LABEL_6:
  -[Application _populateInMemoryBookmarksDBForTestNamed:](self, "_populateInMemoryBookmarksDBForTestNamed:", gCurrentTestName);
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[Application _observeNotificationOnce:handler:](self, "_observeNotificationOnce:handler:", CFSTR("SidebarWillPresentNotification"), &__block_literal_global_249);
  -[Application _observeNotificationOnce:handler:](self, "_observeNotificationOnce:handler:", CFSTR("SidebarDidPresentNotification"), &__block_literal_global_259);
  -[Application startedTest:](self, "startedTest:", gCurrentTestName);
  -[Application startedSubTest:forTest:withMetrics:](self, "startedSubTest:forTest:withMetrics:", CFSTR("Delay"), gCurrentTestName, &unk_1E9D62778);
  objc_msgSend(v5, "sidebarUIProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowingSidebar:completion:", 1, 0);

  +[BookmarksNavigationController test_setSavedStateCollection:](BookmarksNavigationController, "test_setSavedStateCollection:", 0);
}

void __50__Application_ApplicationTesting___runSidebarTest__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "installCACommitCompletionBlock:", &__block_literal_global_250);

}

void __50__Application_ApplicationTesting___runSidebarTest__block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "finishedSubTest:forTest:", CFSTR("Delay"), gCurrentTestName);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startedSubTest:forTest:withMetrics:", CFSTR("Animation"), gCurrentTestName, &unk_1E9D62760);

}

void __50__Application_ApplicationTesting___runSidebarTest__block_invoke_3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "finishedSubTest:forTest:", CFSTR("Animation"), gCurrentTestName);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishedTest:extraResults:", gCurrentTestName, 0);

}

- (void)startedPurpleTest
{
  id v3;

  gRunningPurpleTest = 1;
  objc_msgSend((id)gTestOptions, "objectForKey:", CFSTR("testName"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[Application startedTest:](self, "startedTest:", v3);

}

- (void)finishedPurpleTest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)gTestOptions, "objectForKey:", CFSTR("testName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[Application isRunningTest:](self, "isRunningTest:", v4))
  {
    -[Application finishedTest:extraResults:](self, "finishedTest:extraResults:", v4, v5);
    gRunningPurpleTest = 0;
  }

}

- (void)failedPurpleTestWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)gTestOptions, "objectForKey:", CFSTR("testName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[Application isRunningTest:](self, "isRunningTest:", v4))
  {
    if (v5)
      NSLog((NSString *)CFSTR("Failed test %@: %@"), v4, v5);
    -[Application failedTest:](self, "failedTest:", v4);
    gRunningPurpleTest = 0;
  }

}

- (BOOL)startCanvasTest:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  self->_isRunningCanvasTest = 1;
  v4 = (objc_class *)MEMORY[0x1E0C99E98];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", v5);

  -[Application startedPurpleTest](self, "startedPurpleTest");
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeTabDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "loadTestURL:withCallback:", v6, 0);
  -[Application performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__pollCanvasTest_, 0, 5.0);

  return 1;
}

- (void)_pollCanvasTest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTabDocument");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("results.html"));

  if (v8)
    -[Application finishedCanvasTestWithURL:forTabDocument:](self, "finishedCanvasTestWithURL:forTabDocument:", v6, v9);
  else
    -[Application performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__pollCanvasTest_, 0, 5.0);

}

- (void)finishedCanvasTestWithURL:(id)a3 forTabDocument:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  id v24;
  Application *v25;
  void *v26;
  void *v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v28 = a4;
  v25 = self;
  self->_isRunningCanvasTest = 0;
  objc_msgSend(a3, "fragment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByRemovingPercentEncoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v7;
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v34 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v34;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(obj);
        v14 = (void *)MEMORY[0x1E0C99D20];
        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v13), "objectForKey:", CFSTR("averageTestFPS"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        objc_msgSend(v15, "numberWithFloat:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "arrayWithObjects:", v17, CFSTR("fps"), 0, v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("averageTestFPS"), CFSTR("averageTestFPSUnits"), 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v18, v19);
        objc_msgSend(v9, "addEntriesFromDictionary:", v20);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v11);
  }

  -[Application finishedPurpleTest:](v25, "finishedPurpleTest:", v9);
  -[Application _browserControllerForApplicationTesting](v25, "_browserControllerForApplicationTesting");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "tabController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "closeTabDocument:animated:", v28, 0);
  objc_msgSend(v22, "activeTabDocument");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "closeTabDocument:animated:", v23, 0);

}

- (id)_syntheticHTMLString
{
  return CFSTR("<html><head><script>function f(){var text='';for (var i=0;i<100;++i){text+=\"<div>\";for (var j=0;j<100;++j){text += \"<span>&#x1F603;</span>\"}text += \"</div>\";} document.getElementById('t').innerHTML=text;}</script></head><body onload=\"f()\"><div id=\"t\"></div></body></html>");
}

- (BOOL)startTabBarTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v18;
  Application *v19;
  id v20;

  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "tabCollectionViewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gTestOptions, "objectForKeyedSubscript:", CFSTR("testName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[Application overrideBrowserStateForTestNamed:browserController:](self, "overrideBrowserStateForTestNamed:browserController:", v6, v7);

  if (v8)
  {
    objc_msgSend(v4, "readState");
    objc_msgSend(v5, "tabThumbnailCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissAnimated:", 0);

  }
  objc_msgSend(v4, "activeTabDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[Application _syntheticHTMLString](self, "_syntheticHTMLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("data:text/html,"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loadAlternateHTMLString:baseURL:forUnreachableURL:", v11, v12, 0);

  v13 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__Application_ApplicationTesting__startTabBarTest__block_invoke;
  block[3] = &unk_1E9CF2990;
  v18 = v4;
  v19 = self;
  v20 = v6;
  v14 = v6;
  v15 = v4;
  dispatch_after(v13, MEMORY[0x1E0C80D38], block);

  return 1;
}

void __50__Application_ApplicationTesting__startTabBarTest__block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = 8;
  do
  {
    objc_msgSend(a1[4], "insertNewBlankTabDocumentAnimated:", 0);
    objc_msgSend(a1[4], "activeTabDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "_syntheticHTMLString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("data:text/html,"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadAlternateHTMLString:baseURL:forUnreachableURL:", v4, v5, 0);

    --v2;
  }
  while (v2);
  objc_msgSend(a1[5], "_browserControllerForApplicationTesting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFavoritesState:", 0);

  v7 = dispatch_time(0, 5000000000);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__Application_ApplicationTesting__startTabBarTest__block_invoke_2;
  v10[3] = &unk_1E9CF1830;
  v8 = a1[6];
  v9 = a1[5];
  v11 = v8;
  v12 = v9;
  dispatch_after(v7, MEMORY[0x1E0C80D38], v10);

}

uint64_t __50__Application_ApplicationTesting__startTabBarTest__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  char IsPad;
  void *v4;
  _QWORD v5[5];

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("TabBarSwitchTab"));
  if ((_DWORD)result)
  {
    IsPad = _SFDeviceIsPad();
    v4 = *(void **)(a1 + 40);
    if ((IsPad & 1) != 0)
    {
      return objc_msgSend(v4, "_runTabBarSwitchTabTest");
    }
    else
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __50__Application_ApplicationTesting__startTabBarTest__block_invoke_3;
      v5[3] = &unk_1E9CF16A0;
      v5[4] = v4;
      return objc_msgSend(v4, "rotateIfNeeded:completion:", 3, v5);
    }
  }
  return result;
}

uint64_t __50__Application_ApplicationTesting__startTabBarTest__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runTabBarSwitchTabTest");
}

- (void)_runTabBarSwitchTabTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "tabDocuments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__Application_ApplicationTesting___runTabBarSwitchTabTest__block_invoke;
  v13[3] = &unk_1E9CF1A68;
  v13[4] = self;
  -[Application _observeNotificationOnce:handler:](self, "_observeNotificationOnce:handler:", CFSTR("TabBarDidSwitchTabNotification"), v13);
  -[Application startedTest:](self, "startedTest:", gCurrentTestName);
  v7 = objc_msgSend(v5, "indexOfObject:", v6);
  if (v7 + 1 == objc_msgSend(v5, "count"))
    v8 = 0;
  else
    v8 = v7 + 1;
  objc_msgSend(v5, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabCollectionViewProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tabBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tabBarItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_activateItemIfNeeded:", v12);

}

uint64_t __58__Application_ApplicationTesting___runTabBarSwitchTabTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", gCurrentTestName, 0);
}

- (void)runTabOverviewTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD v14[5];

  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "tabCollectionViewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gTestOptions, "objectForKeyedSubscript:", CFSTR("testName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[Application overrideBrowserStateForTestNamed:browserController:](self, "overrideBrowserStateForTestNamed:browserController:", v6, v7);

  if (v8)
  {
    objc_msgSend(v4, "readState");
    objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isShowingTabViewForWindowWithUUID:", v11);

    if (v12)
    {
      objc_msgSend(v5, "tabThumbnailCollectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "presentAnimated:", 0);

    }
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TabOverviewScroll")))
  {
    -[Application _runTabOverviewScrollPerfTest](self, "_runTabOverviewScrollPerfTest");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("TabOverviewOpenClose")))
  {
    -[Application _runTabOverviewPresentingAndDismissalTest](self, "_runTabOverviewPresentingAndDismissalTest");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("TabOverviewOpenNewTab")))
  {
    if ((_SFDeviceIsPad() & 1) != 0)
    {
      -[Application _runTabOverviewOpenNewTabTest](self, "_runTabOverviewOpenNewTabTest");
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __53__Application_ApplicationTesting__runTabOverviewTest__block_invoke;
      v14[3] = &unk_1E9CF16A0;
      v14[4] = self;
      -[Application rotateIfNeeded:completion:](self, "rotateIfNeeded:completion:", 3, v14);
    }
  }

}

uint64_t __53__Application_ApplicationTesting__runTabOverviewTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runTabOverviewOpenNewTabTest");
}

- (void)_runTabOverviewOpenNewTabTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  objc_msgSend((id)gTestOptions, "objectForKeyedSubscript:", CFSTR("testName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tabCollectionViewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabThumbnailCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);
  v8 = dispatch_time(0, 2000000000);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__Application_ApplicationTesting___runTabOverviewOpenNewTabTest__block_invoke;
  v13[3] = &unk_1E9CF29E0;
  v14 = v7;
  v9 = v7;
  objc_copyWeak(&v18, &location);
  v15 = v3;
  v16 = v6;
  v17 = v5;
  v10 = v5;
  v11 = v6;
  v12 = v3;
  dispatch_after(v8, MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __64__Application_ApplicationTesting___runTabOverviewOpenNewTabTest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__Application_ApplicationTesting___runTabOverviewOpenNewTabTest__block_invoke_2;
  v4[3] = &unk_1E9CF29B8;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  +[TabCollectionViewBlockObserver beginObservingTabView:steadyStateBlock:](TabCollectionViewBlockObserver, "beginObservingTabView:steadyStateBlock:", v2, v4);
  v3 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "startedTest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*v3, "startedSubTest:forTest:withMetrics:", CFSTR("Delay"), *(_QWORD *)(a1 + 40), &unk_1E9D62790);
  objc_msgSend(*(id *)(a1 + 56), "openNewTabWithOptions:completionHandler:", 0, 0);
  objc_msgSend(*v3, "startedSubTest:forTest:withMetrics:", CFSTR("Animation"), *(_QWORD *)(a1 + 40), &unk_1E9D627A8);

  objc_destroyWeak(&v7);
}

void __64__Application_ApplicationTesting___runTabOverviewOpenNewTabTest__block_invoke_2(id *a1, char a2)
{
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id v7;
  char v8;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__Application_ApplicationTesting___runTabOverviewOpenNewTabTest__block_invoke_3;
  v5[3] = &unk_1E9CF1D28;
  v8 = a2;
  v6 = a1[4];
  v7 = a1[5];
  +[TabCollectionViewBlockObserver performIgnoringObservationForTabView:block:](TabCollectionViewBlockObserver, "performIgnoringObservationForTabView:block:", WeakRetained, v5);

}

void __64__Application_ApplicationTesting___runTabOverviewOpenNewTabTest__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;

  if (*(_BYTE *)(a1 + 48)
    || (objc_msgSend((id)*MEMORY[0x1E0DC4730], "finishedSubTest:forTest:", CFSTR("Delay"), *(_QWORD *)(a1 + 32)),
        *(_BYTE *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 40), "tabThumbnailCollectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "presentationState");

    if (!v3)
    {
      v4 = (id *)MEMORY[0x1E0DC4730];
      objc_msgSend((id)*MEMORY[0x1E0DC4730], "finishedSubTest:forTest:", CFSTR("Animation"), *(_QWORD *)(a1 + 32));
      objc_msgSend(*v4, "finishedTest:extraResults:", *(_QWORD *)(a1 + 32), 0);
    }
  }
}

- (void)_runTabOverviewPresentingAndDismissalTest
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, char);
  void *v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  id v20[2];
  id location;
  _QWORD v22[4];
  _QWORD v23[3];
  char v24;

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  objc_msgSend((id)gTestOptions, "objectForKeyedSubscript:", CFSTR("testName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gTestOptions, "safari_stringForKey:", CFSTR("iterations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (v5 <= 2)
    v6 = 2;
  else
    v6 = v5;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "startedTest:", v3);
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tabCollectionViewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tabThumbnailCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __76__Application_ApplicationTesting___runTabOverviewPresentingAndDismissalTest__block_invoke;
  v16 = &unk_1E9CF2A30;
  objc_copyWeak(v20, &location);
  v18 = v22;
  v11 = v3;
  v17 = v11;
  v19 = v23;
  v20[1] = (id)v6;
  +[TabCollectionViewBlockObserver beginObservingTabView:steadyStateBlock:](TabCollectionViewBlockObserver, "beginObservingTabView:steadyStateBlock:", v10, &v13);
  objc_msgSend(v9, "tabSwitcherViewController", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applyContentIfNeeded");

  objc_msgSend(v10, "dismissAnimated:", 1);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
}

void __76__Application_ApplicationTesting___runTabOverviewPresentingAndDismissalTest__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__Application_ApplicationTesting___runTabOverviewPresentingAndDismissalTest__block_invoke_2;
  v10[3] = &unk_1E9CF2A08;
  v16 = a2;
  v5 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v12 = WeakRetained;
  v8 = *(_QWORD *)(a1 + 64);
  v14 = v7;
  v15 = v8;
  v9 = WeakRetained;
  +[TabCollectionViewBlockObserver performIgnoringObservationForTabView:block:](TabCollectionViewBlockObserver, "performIgnoringObservationForTabView:block:", v9, v10);

}

uint64_t __76__Application_ApplicationTesting___runTabOverviewPresentingAndDismissalTest__block_invoke_2(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (_QWORD *)result;
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24);
  if (*(_BYTE *)(result + 72))
  {
    v3 = (id *)MEMORY[0x1E0DC4730];
    if (v2 >= 1)
      objc_msgSend((id)*MEMORY[0x1E0DC4730], "finishedSubTest:forTest:", CFSTR("openClose"), *(_QWORD *)(result + 32));
    v4 = (void *)v1[5];
    if (*(_BYTE *)(*(_QWORD *)(v1[7] + 8) + 24))
      result = objc_msgSend(v4, "dismissAnimated:", 1);
    else
      result = objc_msgSend(v4, "presentAnimated:", 1);
    *(_BYTE *)(*(_QWORD *)(v1[7] + 8) + 24) ^= 1u;
    v5 = *(_QWORD *)(v1[6] + 8);
    v6 = *(_QWORD *)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v6 + 1;
    if (v6 >= v1[8])
      return objc_msgSend(*v3, "finishedTest:extraResults:", v1[4], 0);
  }
  else if (v2 >= 1)
  {
    return objc_msgSend((id)*MEMORY[0x1E0DC4730], "startedSubTest:forTest:", CFSTR("openClose"), *(_QWORD *)(result + 32));
  }
  return result;
}

- (void)_runTabOverviewScrollPerfTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  CGRect v9;
  CGRect v10;

  objc_msgSend((id)gTestOptions, "objectForKeyedSubscript:", CFSTR("testName"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabCollectionViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabThumbnailCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bounds");
  v10 = CGRectInset(v9, 0.0, 100.0);
  -[Application _scrollContentWithTestName:scrollingBounds:amplitude:completionHandler:](self, "_scrollContentWithTestName:scrollingBounds:amplitude:completionHandler:", v8, 0, v10.origin.x, v10.origin.y, v10.size.width, v10.size.height, v10.size.height + v10.size.height);

}

- (BOOL)prepareBookmarksTest
{
  void *v3;

  self->_isRunningShowBookmarksTest = 1;
  self->_startedBookmarksTest = 0;
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPresentingModalBookmarksController"))
    objc_msgSend(v3, "setPresentingModalBookmarksController:withExclusiveCollection:bookmarkUUIDString:animated:", 0, 0, 0, 0);
  else
    -[Application startBookmarksTest](self, "startBookmarksTest");

  return 1;
}

- (void)startBookmarksTest
{
  void *v3;
  id v4;

  self->_startedBookmarksTest = 1;
  +[Application sharedApplication](Application, "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startedPurpleTest");

  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSelector:withObject:afterDelay:", sel_toggleBookmarksPresentation, 0, 0.0);

}

- (void)finishedBookmarksTest
{
  int v2;
  void *v4;
  id v5;

  v2 = --gShowBookmarksTestIterations;
  if (self->_isRunningShowBookmarksTest)
  {
    if (v2)
    {
      -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "performSelector:withObject:afterDelay:", sel_toggleBookmarksPresentation, 0, 0.0);

    }
    else
    {
      +[Application sharedApplication](Application, "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "finishedPurpleTest:", 0);

      self->_isRunningShowBookmarksTest = 0;
    }
  }
}

- (void)_populateInMemoryBookmarksDBForTestNamed:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  uint64_t k;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  +[WebBookmarkCollection test_overrideMainBookmarkCollection]();
  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isEqualToString:", CFSTR("BookmarksViewFavoritesScroll")))
  {
    objc_msgSend(v3, "favoritesFolder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0DCCB98]);
      objc_msgSend(v3, "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v5, "initFolderWithParentID:collectionType:", 0, objc_msgSend(v6, "collectionType"));

      objc_msgSend(v3, "setFavoritesFolder:localOnly:", v4, 1);
      objc_msgSend(v3, "saveBookmark:", v4);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 250; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Test_Favorites_#%lu"), i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("http://www.apple.com/#%ld"), i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc(MEMORY[0x1E0DCCB98]);
      objc_msgSend(v3, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithTitle:address:collectionType:", v9, v10, objc_msgSend(v12, "collectionType"));

      objc_msgSend(v3, "moveBookmark:toFolderWithID:", v13, objc_msgSend(v4, "identifier"));
      objc_msgSend(v7, "addObject:", v13);

    }
    objc_msgSend(v3, "saveBookmarks:postNotification:", v7, 1);

    goto LABEL_7;
  }
  if ((objc_msgSend(v24, "isEqualToString:", CFSTR("BookmarksViewReadingListsScroll")) & 1) != 0
    || objc_msgSend(v24, "isEqualToString:", CFSTR("SidebarOpenReadingList")))
  {
    for (j = 0; j != 150; ++j)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Test_ReadingList_#%lu"), j);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("http://www.testfakereadinglist_favorites_bookmark_address.com/readinglist/id=#%ld"), j);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithDataAsString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection saveReadingListBookmarkWithTitle:address:previewText:thumbnailURL:siteName:tabDocument:didFetchPage:updateController:savedBookmarkID:shouldFetchMetadata:](v3, v15, v17, CFSTR("Lorem ipsum dolor sit amet, pellentesque augue nonummy, neque lacinia velit vulputate ipsum, metus libero id pede, auctor felis metus."), 0, CFSTR("testSite"), 0, 1, 0, 0, 0);

    }
  }
  else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("BookmarksViewBookmarksScroll")) & 1) != 0
         || objc_msgSend(v24, "isEqualToString:", CFSTR("SidebarOpenBookmarks")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    for (k = 0; k != 250; ++k)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Test_Bookmarks_#%lu"), k);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("http://www.testfakereadinglist_favorites_bookmark_address.com/bookmarks/id=#%ld"), k);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc(MEMORY[0x1E0DCCB98]);
      objc_msgSend(v3, "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithTitle:address:collectionType:", v19, v20, objc_msgSend(v22, "collectionType"));

      objc_msgSend(v4, "addObject:", v23);
    }
    objc_msgSend(v3, "saveBookmarks:postNotification:", v4, 0);
LABEL_7:

  }
}

- (id)_scrollViewForTestNamed:(id)a3
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

  v4 = a3;
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bookmarksNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BookmarksViewBookmarksScroll")))
  {
    objc_msgSend(v6, "topBookmarksTableViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = v7;
    objc_msgSend(v7, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("BookmarksViewFavoritesScroll")))
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("BookmarksViewReadingListsScroll")))
    {
      v12 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v6, "topReadingListViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "catalogViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "startPageViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "test_scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
LABEL_9:

  return v12;
}

- (void)_switchToBookmarksCollectionForTestNamed:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookmarksNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("BookmarksViewBookmarksScroll")))
  {
    objc_msgSend(v5, "setCurrentCollection:", CFSTR("BookmarksCollection"));
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("BookmarksViewReadingListsScroll")))
  {
    v6 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 0);
    objc_msgSend(v5, "setCurrentCollection:", CFSTR("ReadingListCollection"));
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", v6);
  }

}

- (void)runBookmarksViewTest
{
  void *v3;
  void *v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[5];
  id v13;
  uint64_t v14;

  objc_msgSend((id)gTestOptions, "safari_stringForKey:", CFSTR("testName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[Application _populateInMemoryBookmarksDBForTestNamed:](self, "_populateInMemoryBookmarksDBForTestNamed:", v3);
  objc_msgSend((id)gTestOptions, "safari_stringForKey:", CFSTR("iterations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("BookmarksViewFavoritesScroll"));
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7, "setFavoritesState:", 4);

  }
  else
  {
    objc_msgSend(v7, "showBookmarksPanelWithNonAnimatedTransition");

    -[Application _switchToBookmarksCollectionForTestNamed:](self, "_switchToBookmarksCollectionForTestNamed:", v3);
  }
  if (v5 <= 2)
    v9 = 2;
  else
    v9 = v5;
  v10 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__Application_ApplicationTesting__runBookmarksViewTest__block_invoke;
  block[3] = &unk_1E9CF2A58;
  block[4] = self;
  v13 = v3;
  v14 = v9;
  v11 = v3;
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);

}

void __55__Application_ApplicationTesting__runBookmarksViewTest__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_scrollViewForTestNamed:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_performScrollTest:iterations:delta:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), 10);

}

- (BOOL)isRunningShowBookmarksTest
{
  return self->_isRunningShowBookmarksTest;
}

- (BOOL)isRunningCanvasTest
{
  return self->_isRunningCanvasTest;
}

- (BOOL)didStartBookmarksTest
{
  return self->_startedBookmarksTest;
}

+ (id)sharedTestRunner
{
  return (id)gRunner;
}

- (void)startSearchPerformanceTest
{
  -[Application startSearchPerformanceTestWithTestStrings:](self, "startSearchPerformanceTestWithTestStrings:", &unk_1E9D627C0);
}

- (id)searchParametersWithCFEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  id v5;
  id v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D8AC38]);
    objc_msgSend(v5, "setIsCFSearch:", 1);
    objc_msgSend(v5, "setEnableCompletionListHistoryDeduplicationValue:", 0);
    objc_msgSend(v5, "setEnableCompletionListHistoryDeduplicationSwitchToTabValue:", 0);
    objc_msgSend(v4, "addObject:", v5);

  }
  v6 = objc_alloc_init(MEMORY[0x1E0D8AC38]);
  objc_msgSend(v6, "setIsCFSearch:", 0);
  objc_msgSend(v6, "setEnableCompletionListHistoryDeduplicationValue:", 1);
  objc_msgSend(v6, "setEnableCompletionListHistoryDeduplicationSwitchToTabValue:", 1);
  objc_msgSend(v4, "addObject:", v6);

  return v4;
}

- (void)startSearchPerformanceDetailedTestWithCF:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8A998]);
  v6 = (void *)gHistoryServiceConnection;
  gHistoryServiceConnection = (uint64_t)v5;

  v7 = objc_alloc_init(MEMORY[0x1E0D8A830]);
  v8 = (void *)gHistoryPushConnection;
  gHistoryPushConnection = (uint64_t)v7;

  objc_msgSend((id)gHistoryServiceConnection, "queryMemoryFootprintWithError:", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)gInitialHistoryServiceMemoryFootprint;
  gInitialHistoryServiceMemoryFootprint = v9;

  objc_msgSend((id)gHistoryPushConnection, "queryMemoryFootprintWithError:", 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)gInitialHistoryPushAgentMemoryFootprint;
  gInitialHistoryPushAgentMemoryFootprint = v11;

  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D89C10]), "initWithError:", 0);
  v14 = (void *)gInitialSafariMemoryFootprint;
  gInitialSafariMemoryFootprint = v13;

  -[Application startSearchPerformanceTestWithTestStrings:perQuery:withCF:](self, "startSearchPerformanceTestWithTestStrings:perQuery:withCF:", &unk_1E9D627D8, 1, v3);
}

- (void)startSearchPerformanceTestWithTestStrings:(id)a3
{
  -[Application startSearchPerformanceTestWithTestStrings:perQuery:withCF:](self, "startSearchPerformanceTestWithTestStrings:perQuery:withCF:", a3, 0, 0);
}

- (void)startSearchPerformanceTestWithTestStrings:(id)a3 perQuery:(BOOL)a4 withCF:(BOOL)a5
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  NSObject *v26;
  BOOL v27;
  BOOL v28;
  _QWORD block[4];
  id v30;
  Application *v31;
  void *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD aBlock[5];
  id v46;
  void *v47;
  BOOL v48;

  v22 = a3;
  -[Application startedPurpleTest](self, "startedPurpleTest");
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke;
  aBlock[3] = &unk_1E9CF2A80;
  v48 = a4;
  aBlock[4] = self;
  v23 = v9;
  v46 = v23;
  v47 = v8;
  v10 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__1;
  v43[4] = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("completionProviderDidStart"), 0, v12, v10);
  v44 = (id)objc_claimAutoreleasedReturnValue();

  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__1;
  v41[4] = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("completionProviderDidFinish"), 0, v13, v10);
  v42 = (id)objc_claimAutoreleasedReturnValue();

  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__1;
  v39[4] = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("catalogViewControllerDidStart"), 0, v14, v10);
  v40 = (id)objc_claimAutoreleasedReturnValue();

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__1;
  v37[4] = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("catalogViewControllerDidFinish"), 0, v15, v10);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke_2;
  block[3] = &unk_1E9CF2AA8;
  v34 = v41;
  v35 = v39;
  v36 = v37;
  v30 = v11;
  v31 = self;
  v32 = v8;
  v33 = v43;
  v17 = v11;
  v18 = MEMORY[0x1E0C80D38];
  dispatch_group_notify(v7, MEMORY[0x1E0C80D38], block);
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke_4;
  v24[3] = &unk_1E9CF2AD0;
  v27 = a4;
  v28 = a5;
  v24[4] = self;
  v25 = v22;
  v26 = v7;
  v19 = v7;
  v20 = v22;
  dispatch_async(v18, v24);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

}

void __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  objc_class *v9;
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
  uint64_t v21;
  int v22;
  void *v23;
  int v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  uint64_t v39;
  const __CFString *v40;
  void *v41;
  id v42;

  v42 = a2;
  objc_msgSend(v42, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("completionProviderDidStart")) & 1) == 0)
  {
    objc_msgSend(v42, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isEqualToString:", CFSTR("completionProviderDidFinish"));

  }
  objc_msgSend(v42, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("completionProviderDidStart")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v42, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", CFSTR("catalogViewControllerDidStart"));

  }
  objc_msgSend(v42, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("query"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("time"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_browserControllerForApplicationTesting");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rootViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "catalogViewController");
    v16 = v10;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "completionList");
    v18 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "searchParametersList");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = a1;
    v22 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isCFSearch");
    v25 = CFSTR("normal - ");
    if (v24)
      v25 = CFSTR("cf - ");
    v40 = v25;

    v6 = v22;
    a1 = v21;

    v12 = v18;
    v10 = v16;

  }
  else
  {
    v40 = &stru_1E9CFDBB0;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v6)
  {
    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v27, v10);
    }
    v28 = v41;
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v41, v12);
    goto LABEL_20;
  }
  objc_msgSend(v26, "objectForKeyedSubscript:", v12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v27 || !v29)
  {

    v28 = v41;
LABEL_20:
    v37 = (__CFString *)v40;
    goto LABEL_23;
  }
  v31 = (void *)MEMORY[0x1E0CB37E8];
  v28 = v41;
  objc_msgSend(v41, "doubleValue");
  v33 = v32;
  objc_msgSend(v30, "doubleValue");
  objc_msgSend(v31, "numberWithDouble:", v33 - v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v10;
  v37 = (__CFString *)v40;
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@'%@' - %@ completion time"), v40, v12, v10);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@ completion time"), v40, v10, v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v35, v38);

  v10 = v36;
LABEL_23:

}

void __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  __int128 v3;
  _QWORD block[4];
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke_3;
  block[3] = &unk_1E9CF2AA8;
  v5 = *(id *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 56);
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

void __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  v11 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  if (gInitialSafariMemoryFootprint)
  {
    objc_msgSend(*(id *)(a1 + 40), "_generateMemoryFootprintResults:", v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishedPurpleTest:", v12);

  }
  else
  {
    objc_msgSend(v11, "finishedPurpleTest:", v10);
  }
}

void __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_browserControllerForApplicationTesting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFavoritesFieldFocused:animated:", 1, 1);

  objc_msgSend(*(id *)(a1 + 32), "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "catalogViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v7, "_ensureCompletionListAndParsecSession");
    objc_msgSend(*(id *)(a1 + 32), "searchParametersWithCFEnabled:", *(unsigned __int8 *)(a1 + 57));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "completionList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSearchParametersList:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "_doSearchTestOnCVC:WithTestStrings:andDispatchGroup:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)startSearchPerformanceUnifiedFieldKeyTimeTest
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  NSObject *v8;
  _QWORD block[5];

  -[Application startedPurpleTest](self, "startedPurpleTest");
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__Application_ApplicationTesting__startSearchPerformanceUnifiedFieldKeyTimeTest__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  v5 = MEMORY[0x1E0C80D38];
  dispatch_group_notify(v3, MEMORY[0x1E0C80D38], block);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __80__Application_ApplicationTesting__startSearchPerformanceUnifiedFieldKeyTimeTest__block_invoke_3;
  v7[3] = &unk_1E9CF1830;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __80__Application_ApplicationTesting__startSearchPerformanceUnifiedFieldKeyTimeTest__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__Application_ApplicationTesting__startSearchPerformanceUnifiedFieldKeyTimeTest__block_invoke_2;
  block[3] = &unk_1E9CF1900;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

uint64_t __80__Application_ApplicationTesting__startSearchPerformanceUnifiedFieldKeyTimeTest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPurpleTest:", 0);
}

void __80__Application_ApplicationTesting__startSearchPerformanceUnifiedFieldKeyTimeTest__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  PPTUniversalCompletionProvider *v6;
  void *v7;
  PPTUniversalCompletionProvider *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_browserControllerForApplicationTesting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFavoritesFieldFocused:animated:", 1, 1);

  v14 = (id)objc_msgSend(&unk_1E9D627F0, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "_browserControllerForApplicationTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "catalogViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_ensureCompletionListAndParsecSession");
  v6 = [PPTUniversalCompletionProvider alloc];
  +[FrequentlyVisitedSitesController sharedController](FrequentlyVisitedSitesController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UniversalSearchCompletionProvider initWithFrequentlyVisitedSitesController:](v6, "initWithFrequentlyVisitedSitesController:", v7);

  objc_msgSend(v5, "completionList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompletionProvider setDelegate:](v8, "setDelegate:", v9);

  objc_msgSend(v5, "completionList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUniversalSearchProvider:", v8);

  v11 = -[SearchSuggestionProvider initForPrivateBrowsing:]([PPTSearchSuggestionProvider alloc], "initForPrivateBrowsing:", 0);
  objc_msgSend(v5, "completionList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", v12);

  objc_msgSend(v5, "completionList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSuggestionProvider:", v11);

  objc_msgSend(*(id *)(a1 + 32), "_doSearchTestOnCVC:WithTestStrings:andDispatchGroup:", v5, v14, *(_QWORD *)(a1 + 40));
}

- (void)_doSearchTestOnCVC:(id)a3 WithTestStrings:(id)a4 andDispatchGroup:(id)a5
{
  id v7;
  id v8;
  id v9;
  dispatch_group_t v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  dispatch_group_t v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = dispatch_group_create();
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__Application_ApplicationTesting___doSearchTestOnCVC_WithTestStrings_andDispatchGroup___block_invoke;
  v16[3] = &unk_1E9CF2AF8;
  v17 = v8;
  v18 = v10;
  v19 = v7;
  v20 = v9;
  v12 = v9;
  v13 = v7;
  v14 = v10;
  v15 = v8;
  dispatch_async(v11, v16);

}

void __87__Application_ApplicationTesting___doSearchTestOnCVC_WithTestStrings_andDispatchGroup___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v18;
    v7 = MEMORY[0x1E0C80D38];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        block[0] = v4;
        block[1] = 3221225472;
        block[2] = __87__Application_ApplicationTesting___doSearchTestOnCVC_WithTestStrings_andDispatchGroup___block_invoke_2;
        block[3] = &unk_1E9CF2990;
        v14 = *(id *)(a1 + 48);
        v15 = v9;
        v16 = *(id *)(a1 + 40);
        dispatch_async(v7, block);
        dispatch_group_wait(*(dispatch_group_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  v10 = dispatch_time(0, 1000000000);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __87__Application_ApplicationTesting___doSearchTestOnCVC_WithTestStrings_andDispatchGroup___block_invoke_3;
  v11[3] = &unk_1E9CF1900;
  v12 = *(id *)(a1 + 56);
  dispatch_after(v10, MEMORY[0x1E0C80D38], v11);

}

uint64_t __87__Application_ApplicationTesting___doSearchTestOnCVC_WithTestStrings_andDispatchGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "test_simulateTyping:inGroup:startIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

void __87__Application_ApplicationTesting___doSearchTestOnCVC_WithTestStrings_andDispatchGroup___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)_resetHistoryWithCompressedDatabaseAtURL:(id)a3 error:(id *)a4
{
  id v5;
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
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  void (*v27)(uint64_t);
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  objc_method *ClassMethod;
  BOOL v34;
  NSObject *v35;
  NSObject *v36;
  id v38;
  uint64_t block;
  uint64_t p_block;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  uint64_t *v55;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_settingsDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_ensureDirectoryExists:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("History-%@.db"), gCurrentTestName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safari_settingsDirectoryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("History-%@.db-wal"), gCurrentTestName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safari_settingsDirectoryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("History-%@.db-shm"), gCurrentTestName);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeItemAtURL:error:", v10, 0);
  objc_msgSend(v6, "removeItemAtURL:error:", v13, 0);
  objc_msgSend(v6, "removeItemAtURL:error:", v16, 0);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 0, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    v35 = WBS_LOG_CHANNEL_PREFIXPerformanceTest();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[Application(ApplicationTesting) _resetHistoryWithCompressedDatabaseAtURL:error:].cold.1();
    goto LABEL_15;
  }
  objc_msgSend(v17, "safari_dataByDecompressingData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "writeToURL:options:error:", v10, 0, a4);

  if ((v20 & 1) == 0)
  {
    v36 = WBS_LOG_CHANNEL_PREFIXPerformanceTest();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[Application(ApplicationTesting) _resetHistoryWithCompressedDatabaseAtURL:error:].cold.2();
LABEL_15:
    v34 = 0;
    goto LABEL_16;
  }
  v38 = v5;
  v21 = v10;
  v22 = dispatch_queue_create("rebaseHistoryVisitTimesOfDatabaseAt", 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC0]), "initWithURL:queue:", v21, v22);

  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 1;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__1;
  v54 = __Block_byref_object_dispose__1;
  v55 = 0;
  block = MEMORY[0x1E0C809B0];
  p_block = 3221225472;
  v41 = (uint64_t)__rebaseHistoryVisitTimesOfDatabaseAt_block_invoke;
  v42 = &unk_1E9CF2B88;
  v44 = &v46;
  v24 = v23;
  v43 = v24;
  v45 = &v50;
  dispatch_sync(v22, &block);
  v25 = *((unsigned __int8 *)v47 + 24);
  if (a4 && !*((_BYTE *)v47 + 24))
    *a4 = objc_retainAutorelease(*(id *)(v51 + 40));

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v46, 8);

  if (v25)
  {
    block = 0;
    p_block = (uint64_t)&block;
    v41 = 0x3020000000;
    LOBYTE(v44) = 0;
    +[History sharedHistory](History, "sharedHistory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = MEMORY[0x1E0C809B0];
    v51 = 3221225472;
    v52 = (uint64_t)__waitUntilHistoryFinishLoading_block_invoke;
    v53 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E9CF2BB0;
    v27 = v26;
    v54 = v27;
    v55 = &block;
    objc_msgSend(v27, "performBlockAfterHistoryHasLoaded:", &v50);
    if (!*(_BYTE *)(p_block + 40))
    {
      v28 = *MEMORY[0x1E0C99748];
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.01);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "runMode:beforeDate:", v28, v30);

      }
      while (!*(_BYTE *)(p_block + 40));
    }

    _Block_object_dispose(&block, 8);
    +[History sharedHistory](History, "sharedHistory");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_unload");

    v32 = (objc_class *)objc_opt_class();
    ClassMethod = class_getClassMethod(v32, sel_historyDatabaseURL);
    method_setImplementation(ClassMethod, (IMP)pptHistoryOverride);
    objc_storeStrong((id *)&pptHistoryURL, v10);
    v34 = 1;
    v5 = v38;
  }
  else
  {
    v34 = 0;
    v5 = v38;
  }
LABEL_16:

  return v34;
}

- (BOOL)startHistoryTest
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  id v23;

  v3 = objc_alloc_init(MEMORY[0x1E0D8A998]);
  v4 = (void *)gHistoryServiceConnection;
  gHistoryServiceConnection = (uint64_t)v3;

  v5 = objc_alloc_init(MEMORY[0x1E0D8A830]);
  v6 = (void *)gHistoryPushConnection;
  gHistoryPushConnection = (uint64_t)v5;

  objc_msgSend((id)gHistoryServiceConnection, "queryMemoryFootprintWithError:", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)gInitialHistoryServiceMemoryFootprint;
  gInitialHistoryServiceMemoryFootprint = v7;

  objc_msgSend((id)gHistoryPushConnection, "queryMemoryFootprintWithError:", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)gInitialHistoryPushAgentMemoryFootprint;
  gInitialHistoryPushAgentMemoryFootprint = v9;

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D89C10]), "initWithError:", 0);
  v12 = (void *)gInitialSafariMemoryFootprint;
  gInitialSafariMemoryFootprint = v11;

  v13 = (void *)MEMORY[0x1D82A1AF4]();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/var/mobile/Library/Safari/History-Large.db.z"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v15 = -[Application _resetHistoryWithCompressedDatabaseAtURL:error:](self, "_resetHistoryWithCompressedDatabaseAtURL:error:", v14, &v23);
  v16 = v23;

  if (v15)
  {
    objc_autoreleasePoolPop(v13);
    if (objc_msgSend((id)gCurrentTestName, "isEqualToString:", CFSTR("HistoryLoad")))
    {
      v17 = -[Application startHistoryLoadTest](self, "startHistoryLoadTest");
    }
    else
    {
      +[History sharedHistory](History, "sharedHistory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __51__Application_ApplicationTesting__startHistoryTest__block_invoke;
      v22[3] = &unk_1E9CF1900;
      v22[4] = self;
      objc_msgSend(v20, "performBlockAfterHistoryHasLoaded:", v22);

      v17 = 1;
    }
  }
  else
  {
    v18 = gCurrentTestName;
    objc_msgSend(v16, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[Application failedTest:withFailure:](self, "failedTest:withFailure:", v18, v19);

    objc_autoreleasePoolPop(v13);
    v17 = 0;
  }

  return v17;
}

void __51__Application_ApplicationTesting__startHistoryTest__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__Application_ApplicationTesting__startHistoryTest__block_invoke_2;
  block[3] = &unk_1E9CF1900;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __51__Application_ApplicationTesting__startHistoryTest__block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend((id)gCurrentTestName, "isEqualToString:", CFSTR("HistorySearchPerformance"));
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "startSearchPerformanceTestWithTestStrings:", &unk_1E9D62808);
  else
    return objc_msgSend(v3, "failedTest:withFailure:", gCurrentTestName, CFSTR("Unknown test name"));
}

- (id)_generateMemoryFootprintResults:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  double v61;
  void *v62;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C10]), "initWithError:", 0);
  objc_msgSend((id)gHistoryServiceConnection, "queryMemoryFootprintWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gHistoryPushConnection, "queryMemoryFootprintWithError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v3;
  if (v3)
  {
    v7 = objc_msgSend(v3, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  v9 = objc_msgSend((id)gInitialSafariMemoryFootprint, "dirtySize");
  v10 = objc_msgSend((id)gInitialHistoryServiceMemoryFootprint, "dirtySize") + v9;
  v11 = (double)(unint64_t)(v10 + objc_msgSend((id)gInitialHistoryPushAgentMemoryFootprint, "dirtySize"));
  v12 = objc_msgSend(v4, "dirtySize");
  v13 = objc_msgSend(v5, "dirtySize");
  v14 = (double)(unint64_t)(v13 + objc_msgSend(v6, "dirtySize") + v12);
  v15 = objc_msgSend((id)gInitialSafariMemoryFootprint, "residentSize");
  v16 = objc_msgSend((id)gInitialHistoryServiceMemoryFootprint, "residentSize") + v15;
  v17 = (double)(unint64_t)(v16 + objc_msgSend((id)gInitialHistoryPushAgentMemoryFootprint, "residentSize"));
  v18 = objc_msgSend(v4, "residentSize");
  v19 = objc_msgSend(v5, "residentSize");
  v20 = (double)(unint64_t)(v19 + objc_msgSend(v6, "residentSize") + v18);
  objc_msgSend((id)gInitialSafariMemoryFootprint, "defaultMallocZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "sizeInUse");
  objc_msgSend((id)gInitialHistoryServiceMemoryFootprint, "defaultMallocZone");
  v23 = v6;
  v24 = v5;
  v60 = v5;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "sizeInUse") + v22;
  objc_msgSend((id)gInitialHistoryPushAgentMemoryFootprint, "defaultMallocZone");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (double)(unint64_t)(v26 + objc_msgSend(v27, "sizeInUse"));

  v28 = v4;
  objc_msgSend(v4, "defaultMallocZone");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "sizeInUse");
  objc_msgSend(v24, "defaultMallocZone");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "sizeInUse");
  objc_msgSend(v23, "defaultMallocZone");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (double)(unint64_t)(v32 + objc_msgSend(v33, "sizeInUse") + v30);

  objc_msgSend((id)gInitialSafariMemoryFootprint, "defaultMallocZone");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "sizeAllocated");
  objc_msgSend((id)gInitialHistoryServiceMemoryFootprint, "defaultMallocZone");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "sizeAllocated") + v36;
  objc_msgSend((id)gInitialHistoryPushAgentMemoryFootprint, "defaultMallocZone");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (double)(unint64_t)(v38 + objc_msgSend(v39, "sizeAllocated"));

  objc_msgSend(v28, "defaultMallocZone");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "sizeAllocated");
  objc_msgSend(v60, "defaultMallocZone");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "sizeAllocated");
  objc_msgSend(v23, "defaultMallocZone");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (double)(unint64_t)(v44 + objc_msgSend(v45, "sizeAllocated") + v42);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 * 0.000000953674316);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v47, CFSTR("MemoryDirtyBegin"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("MemoryDirtyBeginUnits"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 * 0.000000953674316);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v48, CFSTR("MemoryDirtyEnd"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("MemoryDirtyEndUnits"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v14 - v11) * 0.000000953674316);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v49, CFSTR("MemoryDirtyDiff"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("MemoryDirtyDiffUnits"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17 * 0.000000953674316);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v50, CFSTR("MemoryResidentBegin"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("MemoryResidentBeginUnits"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20 * 0.000000953674316);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v51, CFSTR("MemoryResidentEnd"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("MemoryResidentEndUnits"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v20 - v17) * 0.000000953674316);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v52, CFSTR("MemoryResidentDiff"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("MemoryResidentDiffUnits"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v61 * 0.000000953674316);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v53, CFSTR("MemoryMallocUsedBegin"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("MemoryMallocUsedBeginUnits"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34 * 0.000000953674316);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v54, CFSTR("MemoryMallocUsedEnd"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("MemoryMallocUsedEndUnits"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v34 - v61) * 0.000000953674316);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v55, CFSTR("MemoryMallocUsedDiff"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("MemoryMallocUsedDiffUnits"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40 * 0.000000953674316);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v56, CFSTR("MemoryMallocAllocatedBegin"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("MemoryMallocAllocatedBeginUnits"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46 * 0.000000953674316);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v57, CFSTR("MemoryMallocAllocatedEnd"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("MemoryMallocAllocatedEndUnits"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v46 - v40) * 0.000000953674316);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v58, CFSTR("MemoryMallocAllocatedDiff"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("MemoryMallocAllocatedDiffUnits"));
  return v8;
}

- (BOOL)startHistoryLoadTest
{
  void *v3;
  _QWORD v5[5];

  -[Application startedTest:](self, "startedTest:", gCurrentTestName);
  +[History sharedHistory](History, "sharedHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__Application_ApplicationTesting__startHistoryLoadTest__block_invoke;
  v5[3] = &unk_1E9CF1900;
  v5[4] = self;
  objc_msgSend(v3, "performBlockAfterHistoryHasLoaded:", v5);

  return 1;
}

void __55__Application_ApplicationTesting__startHistoryLoadTest__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__Application_ApplicationTesting__startHistoryLoadTest__block_invoke_2;
  block[3] = &unk_1E9CF1900;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __55__Application_ApplicationTesting__startHistoryLoadTest__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = gCurrentTestName;
  objc_msgSend(v1, "_generateMemoryFootprintResults:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishedTest:extraResults:", v2, v3);

}

- (BOOL)runMemoryOrIOTestWithType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MemoryAndIOTestRunner *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];

  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabCollectionViewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[Application overrideBrowserStateForTestNamed:browserController:](self, "overrideBrowserStateForTestNamed:browserController:", gCurrentTestName, v5))
  {
    objc_msgSend(v6, "readState");
    objc_msgSend(v7, "tabThumbnailCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissAnimated:", 0);

  }
  -[Application _preparePageLoadTestControllerParameters](self, "_preparePageLoadTestControllerParameters");
  -[Application startedTest:](self, "startedTest:", gCurrentTestName);
  v9 = [MemoryAndIOTestRunner alloc];
  v10 = -[MemoryAndIOTestRunner initWithTestName:browserController:type:](v9, "initWithTestName:browserController:type:", gCurrentTestName, v5, a3);
  v11 = (void *)gTabMemoryAndIOTestRunner;
  gTabMemoryAndIOTestRunner = v10;

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__Application_ApplicationTesting__runMemoryOrIOTestWithType___block_invoke;
  v13[3] = &unk_1E9CF2B20;
  v13[4] = self;
  objc_msgSend((id)gTabMemoryAndIOTestRunner, "runTestWithCompletion:", v13);

  return 1;
}

uint64_t __61__Application_ApplicationTesting__runMemoryOrIOTestWithType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", gCurrentTestName, a2);
}

- (BOOL)_startResizeTestWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  -[Application _browserControllerForApplicationTesting](self, "_browserControllerForApplicationTesting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v8 = (void *)getRPTResizeTestParametersClass_softClass;
    v16 = getRPTResizeTestParametersClass_softClass;
    if (!getRPTResizeTestParametersClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getRPTResizeTestParametersClass_block_invoke;
      v12[3] = &unk_1E9CF1780;
      v12[4] = &v13;
      __getRPTResizeTestParametersClass_block_invoke((uint64_t)v12);
      v8 = (void *)v14[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v13, 8);
    v10 = (void *)objc_msgSend([v9 alloc], "initWithTestName:window:completionHandler:", v4, v7, 0);
    objc_msgSend(v10, "setMinimumWindowSize:", 300.0, 300.0);
    objc_msgSend(v10, "setMaximumWindowSize:", 750.0, 950.0);
    objc_msgSend(getRPTTestRunnerClass(), "runTestWithParameters:", v10);

  }
  else
  {
    -[Application failedTest:withFailure:](self, "failedTest:withFailure:", v4, CFSTR("No window available"));
  }

  return v7 != 0;
}

- (void)pageLoadTestRunnerFinished:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((id)gRunner == v3)
  {
    gRunner = 0;
    v4 = v3;

    v3 = v4;
    gRunningPurpleTest = 0;
  }

}

+ (void)postTestNotificationName:(id)a3 object:(id)a4
{
  objc_msgSend(a1, "postTestNotificationName:object:userInfo:", a3, a4, 0);
}

+ (void)postTestNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "launchedToTest"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", v10, v7, v8);

  }
}

- (void)runTabSnapshotCacheStressTest
{
  TabSnapshotCacheStressTestRunner *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = objc_alloc_init(TabSnapshotCacheStressTestRunner);
  v4 = (void *)gTabSnapshotCacheStressTestRunner;
  gTabSnapshotCacheStressTestRunner = (uint64_t)v3;

  objc_msgSend((id)gTestOptions, "objectForKeyedSubscript:", CFSTR("iterations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
    v6 = objc_msgSend(v5, "integerValue");
  else
    v6 = 10;
  objc_msgSend((id)gTabSnapshotCacheStressTestRunner, "setMaxIterations:", v6);
  objc_msgSend((id)gTabSnapshotCacheStressTestRunner, "setDelegate:", self);
  -[Application startedPurpleTest](self, "startedPurpleTest");
  objc_msgSend((id)gTabSnapshotCacheStressTestRunner, "start");

}

- (void)tabSnapshotCacheStressTestRunnerDidFinish:(id)a3
{
  void *v4;

  v4 = (void *)gTabSnapshotCacheStressTestRunner;
  gTabSnapshotCacheStressTestRunner = 0;

  -[Application finishedPurpleTest:](self, "finishedPurpleTest:", 0);
}

- (void)authenticateToUnlockPrivateBrowsingWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(&dword_1D7CA3000, v0, v1, "Attempting to authenticate to unlock private browsing with context: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)authenticateToUnlockPrivateBrowsingWithCompletionHandler:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v3, v4, "Encountered error when determining can evaluate policy: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)authenticateToUnlockPrivateBrowsingWithCompletionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(&dword_1D7CA3000, v0, v1, "Already trying to authenticate to unlock private browsing with context: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __72__Application_authenticateToUnlockPrivateBrowsingWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v5, v6, "Encountered error when evaluating authentication policy: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_3();
}

void __45__Application_saveChangesToCloudHistoryStore__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v3, v4, "Failed to save changes: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __57__Application__performBookmarksDatabaseTasksInBackground__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Background task expired while waiting for MobileSafari to perform bookmarks database tasks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Background task expired while waiting for MobileSafari to save frequently visited sites.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __31__Application_systemMemorySize__block_invoke_cold_1(void *a1, mach_error_t a2)
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  mach_error_t v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = 136315650;
  v5 = "+[Application systemMemorySize]_block_invoke";
  v6 = 1024;
  v7 = a2;
  v8 = 2080;
  v9 = mach_error_string(a2);
  _os_log_error_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_ERROR, "%s : host_info(%d) : %s.\n", (uint8_t *)&v4, 0x1Cu);

}

void __56__Application_prewarmAndRemoveOrphanedProfileDataStores__block_invoke_190_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v3;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1D7CA3000, v2, OS_LOG_TYPE_ERROR, "Unable to delete orphaned WKWebsiteDataStore with identifier %{public}@. Error: %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)webExtensionsControllerForProfileServerID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12(&dword_1D7CA3000, v0, v1, "Requested a profile web extensions controller with empty server ID %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)contentBlockerManagerForProfileServerID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12(&dword_1D7CA3000, v0, v1, "Requested a profile content blocker manager with empty server ID %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (uint64_t)_showSearchEngineAlertIfNeeded
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[Application _export30DaysWorthOfHistoryAfterUpgrade].cold.1(v0);
}

void __48__Application__resetCloudHistoryAccountIfNeeded__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v3, v4, "Failed to reset account: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __81__Application__updateProfileLocalIdentifiersToServerIdentifiersMapInCloudHistory__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v3, v4, "Failed to update profile identifier map: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __46__Application__updateCloudFeatureAvailability__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(&dword_1D7CA3000, v0, v1, "Synchronizing for education user when updating feature availability", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __46__Application__updateCloudFeatureAvailability__block_invoke_3_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v3, v4, "Failed to initialize cloud history: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __46__Application__updateCloudFeatureAvailability__block_invoke_2_272_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v3, v4, "Failed to release cloud history: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __53__Application_sceneForTabWithUUID_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v3, v4, "Unable to open session: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)focusProfile
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_2(&dword_1D7CA3000, v0, v1, "Couldn't find focus profile %{public}@ on focus change.", v2);
  OUTLINED_FUNCTION_10();
}

- (void)deleteBookmarksWithUUIDs:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "privacyPreservingDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_1D7CA3000, v7, OS_LOG_TYPE_ERROR, "Failed to delete bookmark %{public}@", a1, 0xCu);

}

void __43__Application_closeWindowsWithIdentifiers___block_invoke_3_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v3, v4, "Failed to destroy scene: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

@end
