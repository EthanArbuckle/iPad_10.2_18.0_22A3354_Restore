@implementation CLKUIAnalogHandFactoryCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_9);
  return (id)sharedInstance_cache;
}

void __45__CLKUIAnalogHandFactoryCache_sharedInstance__block_invoke()
{
  void *v0;
  void *v1;
  CLKUIAnalogHandFactoryCache *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D01938], "optionsWithContainerPathProvider:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[CLKUIAnalogHandFactoryCache initWithUniqueIdentifier:options:]([CLKUIAnalogHandFactoryCache alloc], "initWithUniqueIdentifier:options:", CFSTR("com.apple.ClockKitUI.configurableHands"), v1);
  v3 = (void *)sharedInstance_cache;
  sharedInstance_cache = (uint64_t)v2;

  CLKBuildVersion();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("HandFactoryCachedBuild"), (CFStringRef)*MEMORY[0x1E0C94020]);
  if (!v5 || (objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
  {
    CLKLoggingObjectForDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1CB9A4000, v6, OS_LOG_TYPE_DEFAULT, "Clearing hand cache (%@ -> %@)", buf, 0x16u);
    }

    v7 = (void *)sharedInstance_cache;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__CLKUIAnalogHandFactoryCache_sharedInstance__block_invoke_49;
    v8[3] = &unk_1E86E0670;
    v9 = v4;
    objc_msgSend(v7, "removeAllImagesWithCompletion:", v8);

  }
}

void __45__CLKUIAnalogHandFactoryCache_sharedInstance__block_invoke_49(uint64_t a1)
{
  CFPreferencesSetAppValue(CFSTR("HandFactoryCachedBuild"), *(CFPropertyListRef *)(a1 + 32), (CFStringRef)*MEMORY[0x1E0C94020]);
}

+ (void)purge
{
  id v2;

  objc_msgSend(a1, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllImagesWithCompletion:", 0);

}

@end
