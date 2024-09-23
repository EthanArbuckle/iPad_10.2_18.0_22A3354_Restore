@implementation AXInvertColorsController

+ (void)initializeMonitoring
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_handleInvertColorsPreload, (CFStringRef)*MEMORY[0x24BED28C8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel__updateStatus, *MEMORY[0x24BDF7258], 0);

  objc_msgSend(a1, "_updateStatus");
}

+ (void)_updateStatus
{
  if (UIAccessibilityIsInvertColorsEnabled() || _AXSShouldLoadInvertBundles())
    objc_msgSend(a1, "loadInvertColorsBundle");
}

+ (void)loadInvertColorsBundle
{
  if (loadInvertColorsBundle_onceToken != -1)
    dispatch_once(&loadInvertColorsBundle_onceToken, &__block_literal_global_5);
}

void __50__AXInvertColorsController_loadInvertColorsBundle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  AXAccessibilityBundlesDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("InvertColorsManager.bundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogInvertColorsLoadBundles();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_230B0B000, v4, OS_LOG_TYPE_INFO, "Invert colors bundle %{public}@", buf, 0xCu);
  }

  if ((objc_msgSend(v3, "isLoaded") & 1) == 0)
  {
    v10 = 0;
    v5 = objc_msgSend(v3, "loadAndReturnError:", &v10);
    v6 = v10;
    v7 = v6;
    if (!v5 || v6)
    {
      AXLogInvertColorsLoadBundles();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __50__AXInvertColorsController_loadInvertColorsBundle__block_invoke_cold_1((uint64_t)v3, (uint64_t)v7, v9);
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v3, "principalClass"), "initialize");
      AXLogInvertColorsLoadBundles();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        goto LABEL_12;
      }
      v8 = (void *)objc_msgSend(v3, "principalClass");
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      v9 = v8;
      _os_log_impl(&dword_230B0B000, v7, OS_LOG_TYPE_INFO, "Loading: %{public}@", buf, 0xCu);
    }

    goto LABEL_11;
  }
LABEL_12:

}

void __50__AXInvertColorsController_loadInvertColorsBundle__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_230B0B000, log, OS_LOG_TYPE_ERROR, "Could not load: %{public}@ %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
