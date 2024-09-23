@implementation AssistiveTouchHelper

+ (void)initializeMonitoring
{
  if (initializeMonitoring_onceToken_0 != -1)
    dispatch_once(&initializeMonitoring_onceToken_0, &__block_literal_global_202);
}

void __44__AssistiveTouchHelper_initializeMonitoring__block_invoke()
{
  AssistiveTouchHelper *v0;
  void *v1;

  v0 = objc_alloc_init(AssistiveTouchHelper);
  v1 = (void *)initializeMonitoring_Helper;
  initializeMonitoring_Helper = (uint64_t)v0;

}

- (AssistiveTouchHelper)init
{
  AssistiveTouchHelper *v2;
  __CFNotificationCenter *LocalCenter;
  AssistiveTouchHelper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AssistiveTouchHelper;
  v2 = -[AssistiveTouchHelper init](&v6, sel_init);
  if (v2)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_accessibilityASTEnabled, (CFStringRef)*MEMORY[0x24BED26F0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[AssistiveTouchHelper enable](v2, "enable");
    v4 = v2;
  }

  return v2;
}

- (void)enable
{
  void *v3;
  void *v4;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  if (_AXSAssistiveTouchEnabled() && (soft_AXProcessIsAssistiveTouch() & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__AssistiveTouchHelper_enable__block_invoke;
    block[3] = &unk_24FED6218;
    block[4] = self;
    if (enable_onceToken != -1)
      dispatch_once(&enable_onceToken, block);
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v3 = getAXProcessIsSetupSymbolLoc_ptr_0;
    v9 = getAXProcessIsSetupSymbolLoc_ptr_0;
    if (!getAXProcessIsSetupSymbolLoc_ptr_0)
    {
      v4 = (void *)AccessibilityUtilitiesLibrary_3();
      v3 = dlsym(v4, "AXProcessIsSetup");
      v7[3] = (uint64_t)v3;
      getAXProcessIsSetupSymbolLoc_ptr_0 = v3;
    }
    _Block_object_dispose(&v6, 8);
    if (!v3)
      -[AccessibilitySettingsLoader _initializeDelayedAccessibilitySettings].cold.2();
    if (((unsigned int (*)(void))v3)())
      -[AssistiveTouchHelper loadBuddyBundles](self, "loadBuddyBundles");
  }
}

- (id)_astDispatchQueue
{
  if (_astDispatchQueue_onceToken != -1)
    dispatch_once(&_astDispatchQueue_onceToken, &__block_literal_global_6);
  return (id)_astDispatchQueue_bgQueue;
}

void __41__AssistiveTouchHelper__astDispatchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("ASTDispatch", 0);
  v1 = (void *)_astDispatchQueue_bgQueue;
  _astDispatchQueue_bgQueue = (uint64_t)v0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AssistiveTouchHelper;
  -[AssistiveTouchHelper dealloc](&v4, sel_dealloc);
}

- (void)_sendKeyboardStatusUpdate
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGRect soft_AXUIKeyboardScreenFrame(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 43, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_sendKeyboardStatusUpdateHidden
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), "init");
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x24BDBD268], CFSTR("visible"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", getpid());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("pid"));

  -[AssistiveTouchHelper _astDispatchQueue](self, "_astDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__AssistiveTouchHelper__sendKeyboardStatusUpdateHidden__block_invoke;
  block[3] = &unk_24FED6218;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __55__AssistiveTouchHelper__sendKeyboardStatusUpdateHidden__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)ASTNotificationCenter, "sendMessageName:userInfo:", CFSTR("UIAXASTKeyboardStatus"), *(_QWORD *)(a1 + 32));
}

- (void)_sendKeyboardStatusUpdate:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSObject *v7;
  _QWORD v8[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AssistiveTouchHelper _astDispatchQueue](self, "_astDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__AssistiveTouchHelper__sendKeyboardStatusUpdate___block_invoke;
  v8[3] = &__block_descriptor_64_e5_v8__0l;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  *(CGFloat *)&v8[6] = width;
  *(CGFloat *)&v8[7] = height;
  dispatch_async(v7, v8);

}

void __50__AssistiveTouchHelper__sendKeyboardStatusUpdate___block_invoke(NSRect *a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), "init");
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x24BDBD270], CFSTR("visible"));
  NSStringFromRect(a1[1]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, CFSTR("frame"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", getpid());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("pid"));

  objc_msgSend((id)ASTNotificationCenter, "sendMessageName:userInfo:", CFSTR("UIAXASTKeyboardStatus"), v4);
}

- (void)installKeyboardListener
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_AXProcessIsSpotlight(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 69, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

uint64_t __47__AssistiveTouchHelper_installKeyboardListener__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _AXSAssistiveTouchEnabled();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_sendKeyboardStatusUpdate");
  return result;
}

void __47__AssistiveTouchHelper_installKeyboardListener__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ASTLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_230B0B000, v4, OS_LOG_TYPE_INFO, "Home Screen displayed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__AssistiveTouchHelper_installKeyboardListener__block_invoke_193(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ASTLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_230B0B000, v4, OS_LOG_TYPE_INFO, "Home Screen displayed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__AssistiveTouchHelper_installKeyboardListener__block_invoke_194(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (_AXSAssistiveTouchEnabled())
  {
    ASTLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v15 = 138543362;
      v16 = v3;
      _os_log_impl(&dword_230B0B000, v4, OS_LOG_TYPE_INFO, "Keyboard shown notification: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDF7A20]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rectValue");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    objc_msgSend(*(id *)(a1 + 32), "_sendKeyboardStatusUpdate:", v8, v10, v12, v14);
  }

}

void __47__AssistiveTouchHelper_installKeyboardListener__block_invoke_195(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (_AXSAssistiveTouchEnabled())
  {
    ASTLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_230B0B000, v4, OS_LOG_TYPE_INFO, "Keyboard hidden notification: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_sendKeyboardStatusUpdateHidden");
  }

}

- (void)loadBuddyBundles
{
  if (loadBuddyBundles_onceToken != -1)
    dispatch_once(&loadBuddyBundles_onceToken, &__block_literal_global_196);
}

void __40__AssistiveTouchHelper_loadBuddyBundles__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1488];
  AXAccessibilityBundlesDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("/UIKit.axbundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isLoaded") & 1) == 0)
  {
    v10 = 0;
    v4 = objc_msgSend(v3, "loadAndReturnError:", &v10);
    v5 = v10;
    if (v4)
      v6 = v5 == 0;
    else
      v6 = 0;
    if (v6)
    {
      objc_msgSend(v3, "principalClass");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(v3, "principalClass"), "_accessibilityStartServer");
      ASTLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      v9 = (void *)objc_msgSend(v3, "principalClass");
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      v8 = v9;
      _os_log_impl(&dword_230B0B000, v7, OS_LOG_TYPE_INFO, "Loading: %{public}@", buf, 0xCu);
    }
    else
    {
      v7 = v5;
      ASTLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __50__AXInvertColorsController_loadInvertColorsBundle__block_invoke_cold_1((uint64_t)v3, (uint64_t)v7, v8);
    }

LABEL_13:
  }

}

uint64_t __30__AssistiveTouchHelper_enable__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE04768], "centerNamed:", CFSTR("UIASTNotificationCenter"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)ASTNotificationCenter;
  ASTNotificationCenter = v2;

  return objc_msgSend(*(id *)(a1 + 32), "installKeyboardListener");
}

@end
