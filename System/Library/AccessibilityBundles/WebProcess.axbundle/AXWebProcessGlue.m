@implementation AXWebProcessGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  objc_msgSend(a1, "_initializeAXRuntime");
}

void __49__AXWebProcessGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  +[UIAccessibilityLoader _accessibilityInitializeRuntimeOverrides](UIAccessibilityLoaderForWebKit, "_accessibilityInitializeRuntimeOverrides");
  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_185, &__block_literal_global_191, 0, &__block_literal_global_197);

}

uint64_t __49__AXWebProcessGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("WKAccessibilityWebPageObject"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKAccessibilityWebPageObject"), CFSTR("pageScale"), "d", 0);

  return 1;
}

uint64_t __49__AXWebProcessGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("WebProcess AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("WebProcess"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __49__AXWebProcessGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WKNSObjectAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WKAccessibilityWebPageObjectAccessibility"), 1);

}

+ (void)_initializeAXRuntime
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDFEA88], "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributeCallback:", &__block_literal_global_204);
  objc_msgSend(v3, "setParameterizedAttributeCallback:", &__block_literal_global_206);
  objc_msgSend(v3, "setSetAttributeCallback:", &__block_literal_global_208);
  objc_msgSend(v3, "setPerformActionCallback:", &__block_literal_global_210);
  objc_msgSend(v3, "setHitTestCallback:", &__block_literal_global_212);
  objc_msgSend(v3, "setApplicationElementCallback:", &__block_literal_global_215);
  objc_msgSend(v3, "setOutgoingValuePreprocessor:", &__block_literal_global_226);
  objc_msgSend(v3, "setClientObserverCallback:", &__block_literal_global_229);
  objc_msgSend(v3, "start");
  _UIAXInitializeConstantValues();
  +[UIAccessibilityLoader _performInitialAccessibilityBundleLoad:monitorForFutureLoadEvents:trackingMode:](UIAccessibilityLoaderForWebKit, "_performInitialAccessibilityBundleLoad:monitorForFutureLoadEvents:trackingMode:", 1, 1, 2);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("AccessibilityCategoryInstalled"), 0);

}

id __40__AXWebProcessGlue__initializeAXRuntime__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;

  _AXElementForAXUIElementUniqueId();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXServerCacheSetEnabled();
  objc_msgSend(v5, "_iosAccessibilityAttributeValue:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXServerCacheSetEnabled();

  return v6;
}

id __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  _AXElementForAXUIElementUniqueId();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXServerCacheSetEnabled();
  objc_msgSend(v7, "_iosAccessibilityAttributeValue:forParameter:", a4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  AXServerCacheSetEnabled();
  return v8;
}

void __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  id v7;

  v6 = a5;
  _AXElementForAXUIElementUniqueId();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  AXServerCacheSetEnabled();
  objc_msgSend(v7, "_iosAccessibilitySetValue:forAttribute:", v6, a4);

  AXServerCacheSetEnabled();
}

uint64_t __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v8;
  void *v9;
  uint64_t v10;

  v8 = a5;
  _AXElementForAXUIElementUniqueId();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AXServerCacheSetEnabled();
  v10 = objc_msgSend(v9, "_iosAccessibilityPerformAction:withValue:fencePort:", a4, v8, a6);

  AXServerCacheSetEnabled();
  return v10;
}

id __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_5(double a1, double a2)
{
  void *v4;
  NSObject *v5;
  void *v6;

  _AXElementForAXUIElementUniqueId();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_5_cold_1((uint64_t)v4, v5, a1, a2);

  AXServerCacheSetEnabled();
  objc_msgSend(v4, "accessibilityHitTest:", a1, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXServerCacheSetEnabled();

  return v6;
}

uint64_t __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_213()
{
  return objc_msgSend(MEMORY[0x24BDFEA78], "remoteElementForBlock:", &__block_literal_global_219);
}

BOOL __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_2_217(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  _BOOL8 v8;

  objc_msgSend(a2, "accessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2348C4A50](CFSTR("WKAccessibilityWebPageObject"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityRootObjectWrapper")),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    objc_msgSend(v4, "safeCGRectForKey:", CFSTR("accessibilityElementRect"));
    v8 = v7 > 0.0 && v6 > 0.0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_3_224()
{
  JUMPOUT(0x2348C4A20);
}

void __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_5_cold_1(uint64_t a1, NSObject *a2, double a3, double a4)
{
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  NSStringFromPoint(*(NSPoint *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a1;
  _os_log_debug_impl(&dword_230E4C000, a2, OS_LOG_TYPE_DEBUG, "Web hit test: %@ > %@", (uint8_t *)&v7, 0x16u);

}

@end
