@implementation CSAssetManagerEnablePolicy

- (CSAssetManagerEnablePolicy)init
{
  CSAssetManagerEnablePolicy *v2;
  CSAssetManagerEnablePolicy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSAssetManagerEnablePolicy;
  v2 = -[CSPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSAssetManagerEnablePolicy _addAssetManagerEnabledConditions](v2, "_addAssetManagerEnabledConditions");
    -[CSAssetManagerEnablePolicy _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }
  return v3;
}

- (void)_subscribeEventMonitors
{
  id v3;

  if (-[CSAssetManagerEnablePolicy _shouldCheckNetworkAvailability](self, "_shouldCheckNetworkAvailability"))
  {
    objc_msgSend(MEMORY[0x1E0D19170], "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  }
}

- (void)_addAssetManagerEnabledConditions
{
  if (-[CSAssetManagerEnablePolicy _shouldCheckNetworkAvailability](self, "_shouldCheckNetworkAvailability"))
    -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_18906);
}

- (BOOL)_shouldCheckNetworkAvailability
{
  if ((CSIsIOS() & 1) != 0 || (CSIsWatch() & 1) != 0)
    return 1;
  else
    return CSIsHorseman();
}

uint64_t __63__CSAssetManagerEnablePolicy__addAssetManagerEnabledConditions__block_invoke()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19170], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isAvailable");

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSAssetManagerEnablePolicy _addAssetManagerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s AssetManager cannot be turned on since network is not available", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

@end
