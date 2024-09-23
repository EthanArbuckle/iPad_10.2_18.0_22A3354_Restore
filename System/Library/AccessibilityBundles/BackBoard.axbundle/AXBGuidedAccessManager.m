@implementation AXBGuidedAccessManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_2 != -1)
    dispatch_once(&initializeMonitor_onceToken_2, &__block_literal_global_6);
}

void __43__AXBGuidedAccessManager_initializeMonitor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)SharedManager;
  SharedManager = v0;

}

- (AXBGuidedAccessManager)init
{
  AXBGuidedAccessManager *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  AXBGuidedAccessManager *v6;
  uint64_t v7;
  id notificationToken;
  AXBGuidedAccessManager *v9;
  AXBGuidedAccessManager *v11;
  _QWORD v12[4];
  AXBGuidedAccessManager *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AXBGuidedAccessManager;
  v2 = -[AXBGuidedAccessManager init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BED2790];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __30__AXBGuidedAccessManager_init__block_invoke;
    v12[3] = &unk_250187D00;
    v6 = v2;
    v13 = v6;
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, v12);
    v7 = objc_claimAutoreleasedReturnValue();
    notificationToken = v6->_notificationToken;
    v6->_notificationToken = (id)v7;

    v11 = v6;
    AXPerformBlockOnMainThreadAfterDelay();
    v9 = v11;

  }
  return v2;
}

uint64_t __30__AXBGuidedAccessManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadBackboardServerBundle");
}

void __30__AXBGuidedAccessManager_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  if (_AXSGuidedAccessRequiresApplicationAccessibility())
    objc_msgSend(*(id *)(a1 + 32), "_loadBackboardServerBundle");
  dispatch_get_global_queue(21, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__AXBGuidedAccessManager_init__block_invoke_3;
  block[3] = &unk_250187618;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

}

void __30__AXBGuidedAccessManager_init__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63768]);
  _AXSSpeechSettingsSetDisabledByManagedConfiguration();

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerObserver:", *(_QWORD *)(a1 + 32));

}

- (id)_guidedAccessServer
{
  return self->_guidedAccessServer;
}

+ (BOOL)inGuidedAccess
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend((id)SharedManager, "_guidedAccessServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("isActive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("isInWorkspace"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "BOOLValue");

  }
  return v4;
}

+ (BOOL)allowsTripleClickSheet
{
  void *v2;
  char v3;

  objc_msgSend((id)SharedManager, "_guidedAccessServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("allowsTripleClickSheet"));

  return v3;
}

- (void)_loadBackboardServerBundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke;
  block[3] = &unk_250187618;
  block[4] = self;
  if (_loadBackboardServerBundle_onceToken != -1)
    dispatch_once(&_loadBackboardServerBundle_onceToken, block);
}

void __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v23[16];

  GAXLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_232455000, v2, OS_LOG_TYPE_INFO, "****************** Loading GAX Backboard Server Bundle ****************", v23, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/AccessibilityBundles/GAXBackboardServer.bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "loadAndReturnError:", 0) & 1) != 0)
    {
      v5 = (void *)objc_msgSend(v4, "principalClass");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "performSelector:withObject:", sel_sharedInstance, 0);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(NSObject **)(v7 + 16);
        *(_QWORD *)(v7 + 16) = v6;
      }
      else
      {
        GAXLogCommon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke_cold_2((uint64_t)v5, v8);
      }
    }
    else
    {
      GAXLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke_cold_3(v8, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    GAXLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63768]);
  _AXSSpeechSettingsSetDisabledByManagedConfiguration();

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_guidedAccessServer, 0);
  objc_storeStrong(&self->_notificationToken, 0);
}

void __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_232455000, a1, a3, "**** AX Error: Could not load GAXBackboardServer bundle. bundleWithPath came back nil", a5, a6, a7, a8, 0);
}

void __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_232455000, a2, OS_LOG_TYPE_ERROR, "**** AX Error: Could not initialize GAXBackboardServer instance: %@", (uint8_t *)&v2, 0xCu);
}

void __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_232455000, a1, a3, "**** AX Error: Accessibility: Could not load GAXBackboardServer bundle", a5, a6, a7, a8, 0);
}

@end
