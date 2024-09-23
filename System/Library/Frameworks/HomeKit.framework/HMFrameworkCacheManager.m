@implementation HMFrameworkCacheManager

void __41__HMFrameworkCacheManager_sharedInstance__block_invoke()
{
  HMFrameworkCacheManager *v0;
  void *v1;

  v0 = -[HMFrameworkCacheManager initWithTimerFactory:]([HMFrameworkCacheManager alloc], "initWithTimerFactory:", &__block_literal_global_3);
  v1 = (void *)sharedInstance_cacheManager;
  sharedInstance_cacheManager = (uint64_t)v0;

}

- (HMFrameworkCacheManager)initWithTimerFactory:(id)a3
{
  id v4;
  void *v5;
  HMDiskCache *v6;
  HMFrameworkCacheManager *v7;
  HMFrameworkCacheManager *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HMCreateFrameworkCacheDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[HMDiskCache initWithCachePath:]([HMDiskCache alloc], "initWithCachePath:", v5);
    v13.receiver = self;
    v13.super_class = (Class)HMFrameworkCacheManager;
    v7 = -[HMCacheManager initWithTimerFactory:persistentCache:](&v13, sel_initWithTimerFactory_persistentCache_, v4, v6);

    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to resolve cache directory, not using cache", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

id __41__HMFrameworkCacheManager_sharedInstance__block_invoke_2()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 5.0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_20466);
  return (id)sharedInstance_cacheManager;
}

@end
