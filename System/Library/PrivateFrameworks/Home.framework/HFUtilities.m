@implementation HFUtilities

+ (id)comparatorWithSortedObjects:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__HFUtilities_comparatorWithSortedObjects___block_invoke;
  aBlock[3] = &unk_1EA727F78;
  v9 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  v6 = _Block_copy(v5);

  return v6;
}

+ (BOOL)isInternalTest
{
  Class v2;
  Class v3;
  SEL v4;
  void *v5;
  void *v6;
  char v8;

  v8 = 0;
  v2 = NSClassFromString(CFSTR("XCTestProbe"));
  if (v2)
  {
    v3 = v2;
    v4 = NSSelectorFromString(CFSTR("isTesting"));
    -[objc_class methodSignatureForSelector:](v3, "methodSignatureForSelector:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelector:", v4);
    objc_msgSend(v6, "invokeWithTarget:", v3);
    objc_msgSend(v6, "getReturnValue:", &v8);

    LOBYTE(v2) = v8 != 0;
  }
  return (char)v2;
}

uint64_t __43__HFUtilities_comparatorWithSortedObjects___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "indexOfObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v6);

  if (v7 == v8)
    return 0;
  result = -1;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v7 < v8)
      v10 = -1;
    else
      v10 = 1;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      return 1;
    else
      return v10;
  }
  return result;
}

+ (BOOL)hasInternalDiagnostics
{
  if (qword_1ED378C70 != -1)
    dispatch_once(&qword_1ED378C70, &__block_literal_global_35);
  return byte_1ED378C59;
}

+ (BOOL)isDetailedSignpostLoggingEnabled
{
  int v2;

  v2 = objc_msgSend(a1, "isInternalInstall");
  if (v2)
  {
    if (qword_1ED378CA0 != -1)
      dispatch_once(&qword_1ED378CA0, &__block_literal_global_64);
    LOBYTE(v2) = byte_1ED378C5D != 0;
  }
  return v2;
}

+ (BOOL)isInternalInstall
{
  if (qword_1ED378C68 != -1)
    dispatch_once(&qword_1ED378C68, &__block_literal_global_13);
  return _MergedGlobals_215;
}

+ (BOOL)isAnIPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

+ (BOOL)useMacIdiom
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 5;

  return v3;
}

+ (BOOL)isRunningInStoreDemoMode
{
  if (qword_1ED378CD0 != -1)
    dispatch_once(&qword_1ED378CD0, &__block_literal_global_73_0);
  return byte_1ED378C61;
}

+ (BOOL)isPressDemoModeEnabled
{
  if (qword_1ED378CA8 != -1)
    dispatch_once(&qword_1ED378CA8, &__block_literal_global_65_0);
  return byte_1ED378C5E;
}

+ (BOOL)shouldSuppressAllErrorsForDemo
{
  if (qword_1ED378CC0 != -1)
    dispatch_once(&qword_1ED378CC0, &__block_literal_global_69);
  if (byte_1ED378C5F)
    return 1;
  else
    return objc_msgSend(a1, "isPressDemoModeEnabled");
}

+ (BOOL)shouldUseControlCenterMaterials
{
  void *v2;
  uint64_t v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess");

  return v3 == 3 || v3 == 100;
}

+ (BOOL)shouldHideBanners
{
  if (qword_1ED378C98 != -1)
    dispatch_once(&qword_1ED378C98, &__block_literal_global_51);
  return byte_1ED378C5C;
}

+ (BOOL)isAVisionPro
{
  return 0;
}

+ (id)wallpaperURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isAMac") & 1) != 0)
    objc_msgSend(a1, "applicationSupportDirectoryURL");
  else
    objc_msgSend(a1, "sharedApplicationSupportDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("com.apple.Home"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Wallpapers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isReadableFileAtPath:", v7);

  if ((v8 & 1) == 0)
  {
    HFLogForCategory(0x47uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Unable to access wallpaper directory at path \"%@\", buf, 0xCu);

    }
  }
  objc_msgSend(v5, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v11 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v17);
  v12 = v17;

  if ((v11 & 1) == 0)
  {
    HFLogForCategory(0x47uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v16;
      _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "Unable to create wallpaper directory at path\"%@\", buf, 0xCu);

    }
  }

  return v5;
}

+ (BOOL)supportsAccessorySetup
{
  return objc_msgSend(a1, "isAMac") ^ 1;
}

+ (id)sharedApplicationSupportDirectoryURL
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(a1, "sharedLibraryDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Application Support"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    HFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Unable to access sharedApplicationSupportDirectoryURL", v6, 2u);
    }

  }
  return v3;
}

+ (id)sharedLibraryDirectoryURL
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(a1, "sharedUserDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    HFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Unable to access sharedLibraryDirectoryURL", v6, 2u);
    }

  }
  return v3;
}

+ (id)sharedUserDirectoryURL
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CPSharedResourcesDirectory(), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    HFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "Unable to access sharedUserDirectoryURL", v5, 2u);
    }

  }
  return v2;
}

+ (int64_t)gridCellTitleLabelMaxLineCount
{
  if (qword_1ED378C90 != -1)
    dispatch_once(&qword_1ED378C90, &__block_literal_global_47);
  return qword_1ED378C88;
}

+ (BOOL)isAnIPhone
{
  void *v2;
  char v3;

  v2 = (void *)MGGetStringAnswer();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone"));

  return v3;
}

uint64_t __39__HFUtilities_isRunningInStoreDemoMode__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode");
  byte_1ED378C61 = result;
  return result;
}

+ (void)warmUpStaticPreferences
{
  objc_msgSend(a1, "enabledPerformanceUpgrades");
  objc_msgSend(a1, "isInternalInstall");
  objc_msgSend(a1, "isPressDemoModeEnabled");
  objc_msgSend(a1, "shouldSuppressAllErrorsForDemo");
  objc_msgSend(a1, "isRunningInStoreDemoMode");
  objc_msgSend(a1, "hasInternalDiagnostics");
}

+ (unint64_t)enabledPerformanceUpgrades
{
  if (qword_1ED378CB8 != -1)
    dispatch_once(&qword_1ED378CB8, &__block_literal_global_68);
  return qword_1ED378CB0;
}

CFIndex __41__HFUtilities_enabledPerformanceUpgrades__block_invoke()
{
  CFIndex result;

  result = CFPreferencesGetAppIntegerValue(CFSTR("HFEnabledPerfUpgradesKey"), CFSTR("com.apple.Home"), 0);
  qword_1ED378CB0 = result;
  return result;
}

uint64_t __45__HFUtilities_shouldSuppressAllErrorsForDemo__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("HFSuppressAllErrorsForDemoKey"), CFSTR("com.apple.Home"), 0);
  byte_1ED378C5F = (_DWORD)result != 0;
  return result;
}

uint64_t __37__HFUtilities_isPressDemoModeEnabled__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("HFEnablePressDemoModeKey"), CFSTR("com.apple.Home"), 0);
  byte_1ED378C5E = (_DWORD)result != 0;
  return result;
}

uint64_t __47__HFUtilities_isDetailedSignpostLoggingEnabled__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("HFEnableDetailedSignpostLoggingKey"), CFSTR("com.apple.Home"), 0);
  byte_1ED378C5D = (_DWORD)result != 0;
  return result;
}

uint64_t __32__HFUtilities_shouldHideBanners__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("hideBanners"), CFSTR("com.apple.Home"), 0);
  byte_1ED378C5C = (_DWORD)result != 0;
  return result;
}

uint64_t __32__HFUtilities_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _MergedGlobals_215 = result;
  if ((_DWORD)result)
  {
    result = HFForceNonInternalInstallBehavior();
    if ((_DWORD)result)
      _MergedGlobals_215 = 0;
  }
  return result;
}

unint64_t __45__HFUtilities_gridCellTitleLabelMaxLineCount__block_invoke()
{
  unint64_t result;
  uint64_t v1;

  result = CFPreferencesGetAppIntegerValue(CFSTR("gridCellTitleLabelMaxLineCount"), CFSTR("com.apple.Home"), 0);
  if (result <= 1)
    v1 = 1;
  else
    v1 = result;
  if (v1 <= 1)
    v1 = 1;
  qword_1ED378C88 = v1;
  return result;
}

void __37__HFUtilities_hasInternalDiagnostics__block_invoke()
{
  NSObject *v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  byte_1ED378C59 = os_variant_has_internal_diagnostics();
  HFLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1[0] = 67109120;
    v1[1] = byte_1ED378C59;
    _os_log_impl(&dword_1DD34E000, v0, OS_LOG_TYPE_INFO, "hasInternalDiagnostics: %{BOOL}d", (uint8_t *)v1, 8u);
  }

}

+ (BOOL)shouldShowReachabilityErrors
{
  return objc_msgSend(a1, "shouldSuppressAllErrorsForDemo") ^ 1;
}

+ (id)comparatorWithSortedClasses:(id)a3 secondaryComparator:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__HFUtilities_comparatorWithSortedClasses_secondaryComparator___block_invoke;
  v12[3] = &unk_1EA727F50;
  v13 = v5;
  v14 = v6;
  v7 = v6;
  v8 = v5;
  v9 = _Block_copy(v12);
  v10 = _Block_copy(v9);

  return v10;
}

uint64_t __63__HFUtilities_comparatorWithSortedClasses_secondaryComparator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_opt_class());
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_opt_class());
  if (v7 == v8)
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      v10 = (*(uint64_t (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
    else
      v10 = 0;
  }
  else
  {
    v11 = -1;
    if (v7 < v8)
      v12 = -1;
    else
      v12 = 1;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      v11 = v12;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = 1;
    else
      v10 = v11;
  }

  return v10;
}

+ (BOOL)useWLANInsteadOfWiFi
{
  return MGGetBoolAnswer();
}

+ (BOOL)isMonitoredInterfaceWifiOrEthernet
{
  void *default_evaluator;
  NSObject *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  default_evaluator = (void *)nw_path_create_default_evaluator();
  v3 = nw_path_evaluator_copy_path();
  v4 = nw_path_uses_interface_type(v3, nw_interface_type_wifi);
  v5 = nw_path_uses_interface_type(v3, nw_interface_type_wired);
  HFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "+[HFUtilities isMonitoredInterfaceWifiOrEthernet]";
    v10 = 1024;
    v11 = v4;
    v12 = 1024;
    v13 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "%s, isConnectedOverWiFi: %d, isConnectedOverEthernet: %d", (uint8_t *)&v8, 0x18u);
  }

  return v4 || v5;
}

+ (BOOL)invertCellTaps
{
  if (qword_1ED378C78 != -1)
    dispatch_once(&qword_1ED378C78, &__block_literal_global_43);
  return byte_1ED378C5A;
}

uint64_t __29__HFUtilities_invertCellTaps__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("invertCellTaps"), CFSTR("com.apple.Home"), 0);
  byte_1ED378C5A = (_DWORD)result != 0;
  return result;
}

+ (BOOL)wallpaperTransition
{
  if (qword_1ED378C80 != -1)
    dispatch_once(&qword_1ED378C80, &__block_literal_global_46_0);
  return byte_1ED378C5B;
}

uint64_t __34__HFUtilities_wallpaperTransition__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("wallpaperTransition"), CFSTR("com.apple.Home"), 0);
  byte_1ED378C5B = (_DWORD)result != 0;
  return result;
}

+ (BOOL)shouldUseLegacyQuickControlPresentation
{
  return +[HFExecutionEnvironment isSpringBoard](HFExecutionEnvironment, "isSpringBoard")
      && !_os_feature_enabled_impl();
}

+ (BOOL)useDefaultAccentColor
{
  return +[HFUtilities isAMac](HFUtilities, "isAMac") && (_os_feature_enabled_impl() & 1) != 0;
}

+ (BOOL)supportsMediaPicker
{
  return objc_msgSend(a1, "isAMac") ^ 1;
}

+ (BOOL)supportsAnalytics
{
  return objc_msgSend(a1, "isAMac") ^ 1;
}

+ (BOOL)supportsEditView
{
  return objc_msgSend(a1, "isAMac") ^ 1;
}

+ (BOOL)supportsThreadService
{
  int AppBooleanValue;

  if ((_os_feature_enabled_impl() & 1) != 0
    || (AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)) != 0)
  {
    LOBYTE(AppBooleanValue) = MGGetBoolAnswer();
  }
  return AppBooleanValue;
}

+ (BOOL)supportsBeingCurrentLocationDevice
{
  return objc_msgSend(a1, "isAMac") ^ 1;
}

+ (BOOL)perfUpgradeIsEnabled:(unint64_t)a3
{
  return (objc_msgSend(a1, "enabledPerformanceUpgrades") & a3) != 0;
}

+ (BOOL)shouldShowFakeContentForPerformanceTesting
{
  int v2;

  v2 = objc_msgSend(a1, "isInternalInstall");
  if (v2)
  {
    if (qword_1ED378CC8 != -1)
      dispatch_once(&qword_1ED378CC8, &__block_literal_global_72);
    LOBYTE(v2) = byte_1ED378C60 != 0;
  }
  return v2;
}

uint64_t __57__HFUtilities_shouldShowFakeContentForPerformanceTesting__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("HFEnableShowFakeContentForPerformanceKey"), CFSTR("com.apple.Home"), 0);
  byte_1ED378C60 = (_DWORD)result != 0;
  return result;
}

+ (BOOL)isHostProcessHCSTestApp
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 103;

  return v3;
}

+ (BOOL)isHostProcessProxControl
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 104;

  return v3;
}

+ (BOOL)isHostProcessProxViewService
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 105;

  return v3;
}

+ (BOOL)isProxHandOffV2Config
{
  if ((objc_msgSend(a1, "isHostProcessProxControl") & 1) != 0
    || (objc_msgSend(a1, "isHostProcessProxViewService") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isHostProcessHCSTestApp");
  }
}

+ (BOOL)shouldUseProxHandOffMaterials
{
  if ((objc_msgSend(a1, "isHostProcessProxControl") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isHostProcessHCSTestApp");
}

+ (BOOL)isInAirplaneMode
{
  return MGGetBoolAnswer();
}

+ (BOOL)isCloudPhotosOn
{
  id v2;
  void *v3;
  char v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabledForDataclass:", *MEMORY[0x1E0C8EE60]);

  return v4;
}

+ (BOOL)isUsingiCloud
{
  void *v2;
  char v3;

  +[HFMediaDispatcher sharedDispatcher](HFMediaDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUsingiCloud");

  return v3;
}

+ (BOOL)isSiriForiCloudEnabled
{
  void *v2;
  id v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1DF0DABF0](a1, a2);
  v3 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabledForDataclass:", *MEMORY[0x1E0C8F420]);

  objc_autoreleasePoolPop(v2);
  return v5;
}

+ (void)updateSiriForiCloudEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  BOOL v22;
  uint8_t buf[4];
  const __CFString *v24;
  uint64_t v25;

  v4 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[HFMediaDispatcher sharedDispatcher](HFMediaDispatcher, "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isUsingiCloud");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1DF0DABF0]();
    v9 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    objc_msgSend(v9, "aa_primaryAppleAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (!v4 || (objc_msgSend(v10, "isProvisionedForDataclass:", *MEMORY[0x1E0C8F3B8]) & 1) != 0)
      {
        HFLogForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = CFSTR("disabled");
          if (v4)
            v13 = CFSTR("enabled");
          *(_DWORD *)buf = 138412290;
          v24 = v13;
          _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Updating Siri iCloud setting to %@", buf, 0xCu);
        }

        objc_msgSend(v11, "setEnabled:forDataclass:", v4, *MEMORY[0x1E0C8F420]);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __60__HFUtilities_updateSiriForiCloudEnabled_completionHandler___block_invoke;
        v20[3] = &unk_1EA728148;
        v22 = v4;
        v21 = v5;
        objc_msgSend(v9, "saveVerifiedAccount:withCompletionHandler:", v11, v20);
        v14 = v21;
        goto LABEL_21;
      }
      HFLogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_ERROR, "Unable to enable Siri iCloud switch for account. Account currently unprovisioned for data class Siri", buf, 2u);
      }

      if (!v5)
        goto LABEL_22;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = 97;
    }
    else
    {
      HFLogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Failed to update Siri iCloud setting, there is no primary account", buf, 2u);
      }

      if (!v5)
        goto LABEL_22;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = 30;
    }
    objc_msgSend(v17, "hf_errorWithCode:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v5 + 2))(v5, v14);
LABEL_21:

LABEL_22:
    objc_autoreleasePoolPop(v8);
    goto LABEL_23;
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 79);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v5 + 2))(v5, v15);

  }
LABEL_23:

}

void __60__HFUtilities_updateSiriForiCloudEnabled_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  _QWORD v10[4];
  __CFString *v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 40))
        v8 = CFSTR("enabled");
      else
        v8 = CFSTR("disabled");
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Saved account setting change for Siri iCloud setting, new value: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Failed to save iCloud setting with error: %@", buf, 0xCu);
  }

  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__HFUtilities_updateSiriForiCloudEnabled_completionHandler___block_invoke_84;
    v10[3] = &unk_1EA728120;
    v12 = v9;
    v11 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __60__HFUtilities_updateSiriForiCloudEnabled_completionHandler___block_invoke_84(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BOOL)isCurrentAccount2FAEnabled
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authKitAccountWithAltDSID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7 = objc_msgSend(v4, "securityLevelForAccount:", v6);
    HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = v7;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "primary iCloud account level: %lu", (uint8_t *)&v12, 0xCu);
    }

    v9 = v7 > 2;
  }
  else
  {
    HFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "Failed to find a primary iCloud account, there is no primary account", (uint8_t *)&v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

+ (id)deviceAirDropIdentifier
{
  return (id)(id)CFPreferencesCopyValue(CFSTR("AirDropID"), CFSTR("com.apple.sharingd"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

+ (id)sanitizeAutoGeneratedHomeKitName:(id)a3
{
  __CFString *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x1E0CB3780], "alphanumericCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[__CFString rangeOfCharacterFromSet:options:](v3, "rangeOfCharacterFromSet:options:", v4, 129);
  if (v5 >= -[__CFString length](v3, "length"))
  {
    HFLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 136315394;
      v19 = "+[HFUtilities sanitizeAutoGeneratedHomeKitName:]";
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_INFO, "%s attempted to sanitize a name consisting exlusively of invalid characters: %@, returning an empty string", (uint8_t *)&v18, 0x16u);
    }

    v15 = &stru_1EA741FF8;
    v14 = v3;
  }
  else
  {
    -[__CFString substringFromIndex:](v3, "substringFromIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addCharactersInString:", CFSTR("."));
    objc_msgSend(v4, "invertedSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formUnionWithCharacterSet:", v9);

    objc_msgSend(v4, "addCharactersInString:", CFSTR("’',-&#"));
    objc_msgSend(v4, "invertedSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_map:", &__block_literal_global_100);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13;
    v15 = v14;
  }

  return v15;
}

id __48__HFUtilities_sanitizeAutoGeneratedHomeKitName___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0CB3500];
  v3 = a2;
  objc_msgSend(v2, "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)sanitizeUserEnteredHomeKitName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)uniqueHomeKitNameForName:(id)a3 allNames:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;

  v5 = a3;
  objc_msgSend(a4, "na_map:", &__block_literal_global_103);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "containsObject:", v8);

  v16 = v7;
  if (v9)
  {
    v17 = 2;
    v18 = v7;
    do
    {
      HFLocalizedStringWithFormat(CFSTR("HFUniqueNameFormat"), CFSTR("%@ %ld"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      ++v17;
      objc_msgSend(v16, "lowercaseString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v6, "containsObject:", v19);

      v18 = v16;
    }
    while ((v20 & 1) != 0);
  }

  return v16;
}

uint64_t __49__HFUtilities_uniqueHomeKitNameForName_allNames___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lowercaseString");
}

+ (id)libraryDirectoryURL
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    HFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Unable to access libraryDirectoryURL", v7, 2u);
    }

  }
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)applicationSupportDirectoryURL
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    HFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Unable to access applicationSupportDirectoryURL", v7, 2u);
    }

  }
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)cachesDirectoryURL
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    HFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Unable to access cachesDirectoryURL", v7, 2u);
    }

  }
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)documentsDirectoryURL
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "count"))
  {
    HFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Unable to access documentsDirectoryURL", v7, 2u);
    }

  }
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sharedAnnouncementsDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(a1, "sharedLibraryDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Caches"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("com.apple.announce"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Unable to access sharedCachesDirectoryURL", v7, 2u);
    }

  }
  return v4;
}

+ (id)demoModeDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sharedApplicationSupportDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("com.apple.Home"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("demoMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v10 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v14);
    v8 = v14;

    if ((v10 & 1) == 0)
    {
      HFLogForCategory(0x20uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "Unable to create demoMode directory at %@", buf, 0xCu);

      }
    }
  }

  return v4;
}

+ (BOOL)isDeviceUnlocked
{
  int v2;

  v2 = MKBGetDeviceLockState();
  return !v2 || v2 == 3;
}

+ (id)preferredNameFromUserID:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C966D0];
  v13[0] = *MEMORY[0x1E0C967A0];
  v13[1] = v4;
  v13[2] = *MEMORY[0x1E0C966C0];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hf_isEmail"))
  {
    +[HFContactStore defaultStore](HFContactStore, "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactForEmailAddress:withKeys:", v3, v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "hf_isPhoneNumber"))
    {
LABEL_9:
      v11 = v3;
      goto LABEL_10;
    }
    +[HFContactStore defaultStore](HFContactStore, "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactForPhoneNumber:withKeys:", v3, v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  if (!v9)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v9, 1000);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v9, "givenName");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (id)v10;

LABEL_10:
  return v11;
}

+ (id)voiceInfoFromSettingLanguageValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "outputVoiceGenderCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "outputGenderFromString:", v5);

  objc_msgSend(v4, "voiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outputVoiceLanguageCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "voiceNamesForOutputLanguageCode:gender:", v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v13 = objc_alloc(MEMORY[0x1E0CFEAC0]);
  objc_msgSend(v4, "outputVoiceLanguageCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", v14, v6, 0, v9, 0, 0, 0);

  return v15;
}

+ (int64_t)outputGenderFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("m")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("f")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n")) & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("?")) & 1) == 0)
      NSLog(CFSTR("Unknown gender option %@"), v3);
    v4 = 0;
  }

  return v4;
}

+ (id)networkSSID
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BA50]), "initWithServiceType:", 3);
  objc_msgSend(v2, "resume");
  objc_msgSend(v2, "networkName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v2 || !objc_msgSend(v3, "length"))
  {
    HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "networkName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v2;
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Can't find WiFi network SSID name: interface = %@, name = %@", (uint8_t *)&v8, 0x16u);

    }
  }
  objc_msgSend(v2, "invalidate");

  return v4;
}

+ (id)itemIdentifierForAccessories:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_139);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __44__HFUtilities_itemIdentifierForAccessories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)narrowNoBreakSpaceString
{
  if (qword_1ED378CE0 != -1)
    dispatch_once(&qword_1ED378CE0, &__block_literal_global_140);
  return (id)qword_1ED378CD8;
}

void __39__HFUtilities_narrowNoBreakSpaceString__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &narrowNoBreakSpaceString_narrowNoBreakSpaceUnichar, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378CD8;
  qword_1ED378CD8 = v0;

}

+ (BOOL)showEducationTip
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("showEnergyEducationTip"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("showEnergyEducationTip"));
  else
    v4 = 1;
  HFLogForCategory(0x23uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[HFUtilities showEducationTip]";
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%s Show education tip? --> %{BOOL}d", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

+ (void)setShowEducationTip:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("showEnergyEducationTip"));
  }
  else
  {
    HFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "+[HFUtilities setShowEducationTip:]";
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to fetch shared app suite user defaults!", (uint8_t *)&v7, 0xCu);
    }

  }
}

+ (BOOL)forceTestUtilityMode
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("forceShowQAUtility1"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("forceShowQAUtility1"));
    else
      v4 = 0;
    HFLogForCategory(0x23uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "+[HFUtilities forceTestUtilityMode]";
      v9 = 1024;
      v10 = v4;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%s Force Utility to QAUtility1 --> %{BOOL}d", (uint8_t *)&v7, 0x12u);
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

+ (id)utilityOverride
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dictionaryForKey:", CFSTR("utilityOverride"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x21uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "+[HFUtilities utilityOverride]";
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%s Override Utility --> %@", (uint8_t *)&v6, 0x16u);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)utilityLookupOverride
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dictionaryForKey:", CFSTR("utilityLookupOverride"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x21uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "+[HFUtilities utilityLookupOverride]";
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%s Override Utility Lookup --> %@", (uint8_t *)&v6, 0x16u);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)OAuthURLOverride
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isInternalInstall"))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("OAuthURLOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v2, "stringForKey:", CFSTR("OAuthURLOverride"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  HFLogForCategory(0x21uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "+[HFUtilities OAuthURLOverride]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%s OAuthURL --> %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

+ (id)sortedLockAccessoryArrayForSetup:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLogForCategory(0x42uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "+[HFUtilities sortedLockAccessoryArrayForSetup:]";
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) accessories = %@", (uint8_t *)&v13, 0x16u);
  }

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (_os_feature_enabled_impl())
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("supportsUWBUnlock"), 0);
    objc_msgSend(v5, "addObject:", v6);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("supportsWalletKey"), 0);
  objc_msgSend(v5, "addObject:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("supportsAccessCodes"), 0);
  objc_msgSend(v5, "addObject:", v8);

  objc_msgSend(v3, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingDescriptors:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x42uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "+[HFUtilities sortedLockAccessoryArrayForSetup:]";
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "(%s) result = %@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

@end
