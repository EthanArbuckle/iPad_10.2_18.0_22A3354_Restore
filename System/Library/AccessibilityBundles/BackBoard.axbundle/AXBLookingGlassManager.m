@implementation AXBLookingGlassManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_8 != -1)
    dispatch_once(&initializeMonitor_onceToken_8, &__block_literal_global_15);
}

void __43__AXBLookingGlassManager_initializeMonitor__block_invoke()
{
  AXBLookingGlassManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXBLookingGlassManager);
  v1 = (void *)_SharedLookingGlassManager;
  _SharedLookingGlassManager = (uint64_t)v0;

}

+ (void)showLookingGlassMenu
{
  objc_msgSend((id)_SharedLookingGlassManager, "_showLookingGlassMenu");
}

- (AXBLookingGlassManager)init
{
  AXBLookingGlassManager *v2;
  NSObject *v3;
  const void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXBLookingGlassManager;
  v2 = -[AXBLookingGlassManager init](&v6, sel_init);
  if (v2)
  {
    AXLogLookingGlass();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[AXBLookingGlassManager init].cold.1(v3);

    v4 = (const void *)_AXSTripleClickCopyOptions();
    if (_AXSTripleClickContainsOption())
      -[AXBLookingGlassManager _updateLookingGlassServicesIfNeeded](v2, "_updateLookingGlassServicesIfNeeded");
    if (v4)
      CFRelease(v4);
  }
  return v2;
}

- (void)_updateLookingGlassServicesIfNeeded
{
  void *v2;

  if (!LookingGlassServicesLibraryCore_frameworkLibrary)
    LookingGlassServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (LookingGlassServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(getLookingGlassServicesClass(), "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateLookingGlassServices");

  }
}

- (void)_showLookingGlassMenu
{
  NSObject *v2;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!LookingGlassServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_2501883E0;
    v5 = 0;
    LookingGlassServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (LookingGlassServicesLibraryCore_frameworkLibrary)
  {
    AXLogLookingGlassUI();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v4) = 0;
      _os_log_impl(&dword_232455000, v2, OS_LOG_TYPE_DEFAULT, "About to show looking glass menu", (uint8_t *)&v4, 2u);
    }

    objc_msgSend(getLookingGlassServicesClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "showLookingGlassMenu");

  }
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_232455000, log, OS_LOG_TYPE_DEBUG, "Initializing monitor: AXBLookingGlassManager", v1, 2u);
}

@end
