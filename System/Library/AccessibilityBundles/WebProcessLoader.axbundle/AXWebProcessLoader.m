@implementation AXWebProcessLoader

+ (void)_axUpdated:(id)a3
{
  dispatch_time_t v3;

  v3 = dispatch_time(0, 50000000);
  dispatch_after(v3, MEMORY[0x24BDAC9B8], &__block_literal_global);
}

void __33__AXWebProcessLoader__axUpdated___block_invoke()
{
  int v0;
  NSObject *v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = _AXSApplicationAccessibilityEnabled();
  AXLogCommon();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    v2[0] = 67109120;
    v2[1] = v0 != 0;
    _os_log_impl(&dword_230E51000, v1, OS_LOG_TYPE_INFO, "WebProcess loader updated: checking whether to load: %d", (uint8_t *)v2, 8u);
  }

  if (v0)
  {
    if (MACancelDownloadErrorDomain_block_invoke_onceToken != -1)
      dispatch_once(&MACancelDownloadErrorDomain_block_invoke_onceToken, &__block_literal_global_177);
  }
}

void __33__AXWebProcessLoader__axUpdated___block_invoke_176()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;

  if (_CFMZEnabled())
    AXAccessibilityMacCatalystBundlesDirectory();
  else
    AXAccessibilityBundlesDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("WebProcess.axbundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v4 = objc_msgSend(v3, "loadAndReturnError:", &v8);
  v5 = v8;
  if (v4)
  {
    v6 = (id)objc_msgSend((id)objc_msgSend(v3, "principalClass"), "safeValueForKey:", CFSTR("accessibilityInitializeBundle"));
  }
  else
  {
    AXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __33__AXWebProcessLoader__axUpdated___block_invoke_176_cold_1();

  }
}

+ (void)_registerForAccessibility
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel__axUpdated_, *MEMORY[0x24BED26E0], 0);

}

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__AXWebProcessLoader_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

uint64_t __32__AXWebProcessLoader_initialize__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = _AXSApplicationAccessibilityEnabled();
  AXLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v2 != 0;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_INFO, "WebProcess loader checking whether to load: %d", (uint8_t *)v5, 8u);
  }

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "_accessibilityLoadWebCoreAXBundle");
  objc_msgSend(*(id *)(a1 + 32), "_axUpdated:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_registerForAccessibility");
}

+ (void)_accessibilityLoadWebCoreAXBundle
{
  if (_accessibilityLoadWebCoreAXBundle_onceToken != -1)
    dispatch_once(&_accessibilityLoadWebCoreAXBundle_onceToken, &__block_literal_global_183);
}

void __55__AXWebProcessLoader__accessibilityLoadWebCoreAXBundle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (_CFMZEnabled())
    AXAccessibilityMacCatalystBundlesDirectory();
  else
    AXAccessibilityBundlesDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("WebCore.axbundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_230E51000, v4, OS_LOG_TYPE_INFO, "Loading WebCore bundle: %@", buf, 0xCu);
  }

  v9 = 0;
  v5 = objc_msgSend(v3, "loadAndReturnError:", &v9);
  v6 = v9;
  if (v5)
  {
    v7 = (id)objc_msgSend((id)objc_msgSend(v3, "principalClass"), "safeValueForKey:", CFSTR("accessibilityInitializeBundle"));
  }
  else
  {
    AXLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __33__AXWebProcessLoader__axUpdated___block_invoke_176_cold_1();

  }
}

void __33__AXWebProcessLoader__axUpdated___block_invoke_176_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230E51000, v0, v1, "Error loading bundle: %@ %@");
}

@end
