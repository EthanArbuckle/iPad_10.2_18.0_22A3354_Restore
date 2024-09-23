@implementation GuidedAccessManager

void __40__GuidedAccessManager__isValidClientApp__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24FEDB860);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _isValidClientApp_IsValidClientApp = objc_msgSend(v2, "containsObject:", v1) ^ 1;

}

void __43__GuidedAccessManager_initializeMonitoring__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)initializeMonitoring_SharedManager;
  initializeMonitoring_SharedManager = v0;

}

- (GuidedAccessManager)init
{
  GuidedAccessManager *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  GuidedAccessManager *v6;
  uint64_t v7;
  id notificationToken;
  __CFNotificationCenter *DarwinNotifyCenter;
  GuidedAccessManager *v10;
  _QWORD v12[4];
  GuidedAccessManager *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GuidedAccessManager;
  v2 = -[GuidedAccessManager init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BED2790];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __27__GuidedAccessManager_init__block_invoke;
    v12[3] = &unk_24FED63B0;
    v6 = v2;
    v13 = v6;
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, v12);
    v7 = objc_claimAutoreleasedReturnValue();
    notificationToken = v6->_notificationToken;
    v6->_notificationToken = (id)v7;

    if (-[GuidedAccessManager applicationIsEntitledForUnmanagedASAM](v6, "applicationIsEntitledForUnmanagedASAM"))
    {
      -[GuidedAccessManager loadRequiredBundlesForUnmanagedASAM](v6, "loadRequiredBundlesForUnmanagedASAM");
    }
    else if (_AXSGuidedAccessRequiresApplicationAccessibility())
    {
      -[GuidedAccessManager _loadRequiredBundles](v6, "_loadRequiredBundles");
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_handleGuidedAccessActiveStatusDidChangeBroadcastNotification, CFSTR("AXGuidedAccessActiveStatusDidChangeBroadcastNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
    v10 = v6;

  }
  return v2;
}

- (BOOL)applicationIsEntitledForUnmanagedASAM
{
  __SecTask *v2;
  BOOL hasBooleanEntitlement;

  if (!-[GuidedAccessManager _isValidClientApp](self, "_isValidClientApp"))
    return 0;
  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  if (_hasBooleanEntitlement(v2, (void *)*MEMORY[0x24BED2670])
    || _hasBooleanEntitlement(v2, (void *)*MEMORY[0x24BED2668]))
  {
    hasBooleanEntitlement = 1;
    if (!v2)
      return hasBooleanEntitlement;
    goto LABEL_8;
  }
  hasBooleanEntitlement = _hasBooleanEntitlement(v2, (void *)*MEMORY[0x24BED2680]);
  if (v2)
LABEL_8:
    CFRelease(v2);
  return hasBooleanEntitlement;
}

- (BOOL)_isValidClientApp
{
  if (_isValidClientApp_onceToken != -1)
    dispatch_once(&_isValidClientApp_onceToken, &__block_literal_global_189_0);
  return _isValidClientApp_IsValidClientApp;
}

+ (void)initializeMonitoring
{
  if (initializeMonitoring_onceToken != -1)
    dispatch_once(&initializeMonitoring_onceToken, &__block_literal_global_1);
}

uint64_t __27__GuidedAccessManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadRequiredBundles");
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("AXGuidedAccessActiveStatusDidChangeBroadcastNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)GuidedAccessManager;
  -[GuidedAccessManager dealloc](&v4, sel_dealloc);
}

- (void)loadRequiredBundlesForUnmanagedASAM
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  -[GuidedAccessManager _loadRequiredBundles](self, "_loadRequiredBundles");
  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getAXReplayerClass_softClass;
  v9 = getAXReplayerClass_softClass;
  if (!getAXReplayerClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getAXReplayerClass_block_invoke;
    v5[3] = &unk_24FED6130;
    v5[4] = &v6;
    __getAXReplayerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "replayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replayWithName:attempts:interval:async:queue:replayBlock:completion:", CFSTR("Ping BackBoard for unmanaged ASAM"), 10, 1, MEMORY[0x24BDAC9B8], &__block_literal_global_186, &__block_literal_global_188_0, 0.5);

}

uint64_t __58__GuidedAccessManager_loadRequiredBundlesForUnmanagedASAM__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getAXBackBoardServerClass_softClass_1;
  v9 = getAXBackBoardServerClass_softClass_1;
  if (!getAXBackBoardServerClass_softClass_1)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getAXBackBoardServerClass_block_invoke_1;
    v5[3] = &unk_24FED6130;
    v5[4] = &v6;
    __getAXBackBoardServerClass_block_invoke_1((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "loadGAXBundleForUnmanagedASAM");

  return v3;
}

void __58__GuidedAccessManager_loadRequiredBundlesForUnmanagedASAM__block_invoke_2(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  if ((a2 & 1) == 0)
  {
    GAXLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __58__GuidedAccessManager_loadRequiredBundlesForUnmanagedASAM__block_invoke_2_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (void)_loadRequiredBundles
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_AXProcessIsSpringBoard(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 68, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_loadSpringboardServerBundle
{
  if (_loadSpringboardServerBundle_onceToken != -1)
    dispatch_once(&_loadSpringboardServerBundle_onceToken, &__block_literal_global_206);
}

void __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  GAXLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_230B0B000, v0, OS_LOG_TYPE_INFO, "****************** Loading GAX SpringBoard Server Bundle ****************", v14, 2u);
  }

  v1 = (void *)MEMORY[0x24BDD1488];
  AXSystemRootDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/System/Library/AccessibilityBundles/GAXSpringboardServer.bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    GAXLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke_cold_1();
    goto LABEL_11;
  }
  if ((objc_msgSend(v4, "loadAndReturnError:", 0) & 1) == 0)
  {
    GAXLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke_cold_3();
LABEL_11:

    goto LABEL_12;
  }
  v5 = (void *)objc_msgSend(v4, "principalClass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "performSelector:withObject:", sel_sharedInstance, 0);
  }
  else
  {
    GAXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke_cold_2((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  }
LABEL_12:

}

- (void)_loadClientBundle
{
  if (_loadClientBundle_onceToken != -1)
    dispatch_once(&_loadClientBundle_onceToken, &__block_literal_global_211);
}

void __40__GuidedAccessManager__loadClientBundle__block_invoke()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  GAXLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_230B0B000, v0, OS_LOG_TYPE_INFO, "****************** Loading GAX Client Bundle ****************", v14, 2u);
  }

  v1 = (void *)MEMORY[0x24BDD1488];
  AXSystemRootDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/System/Library/AccessibilityBundles/GAXClient.bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    GAXLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __40__GuidedAccessManager__loadClientBundle__block_invoke_cold_1();
    goto LABEL_11;
  }
  if ((objc_msgSend(v4, "loadAndReturnError:", 0) & 1) == 0)
  {
    GAXLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __40__GuidedAccessManager__loadClientBundle__block_invoke_cold_3();
LABEL_11:

    goto LABEL_12;
  }
  v5 = (void *)objc_msgSend(v4, "principalClass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "performSelector:", sel_sharedInstance);
  }
  else
  {
    GAXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __40__GuidedAccessManager__loadClientBundle__block_invoke_cold_2((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  }
LABEL_12:

}

- (id)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(id)a3
{
  objc_storeStrong(&self->_notificationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationToken, 0);
}

void __58__GuidedAccessManager_loadRequiredBundlesForUnmanagedASAM__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_230B0B000, a2, a3, "unable to ping BackBoard to load the GAX bundle: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_230B0B000, v0, v1, "**** AX Error: Could not load GAXSpringboard bundle. bundleWithPath came back nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_230B0B000, a2, a3, "**** AX Error: Could not initialize GAXSpringboard instance: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_230B0B000, v0, v1, "**** AX Error: Accessibility: Could not load GAXSpringboard bundle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40__GuidedAccessManager__loadClientBundle__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_230B0B000, v0, v1, "**** AX Error: Could not load GAX Client bundle. bundleWithPath came back nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40__GuidedAccessManager__loadClientBundle__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_230B0B000, a2, a3, "**** AX Error: Could not initialize GAX Client instance: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __40__GuidedAccessManager__loadClientBundle__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_230B0B000, v0, v1, "**** AX Error: Accessibility: Could not load GAX Client bundle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
