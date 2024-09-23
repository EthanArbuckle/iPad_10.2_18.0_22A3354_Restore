@implementation MTFrameworkEnvironment

- (id)hostProcessBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processName");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (MTFrameworkEnvironment)sharedEnvironment
{
  return (MTFrameworkEnvironment *)(id)_sharedEnvironment;
}

- (BOOL)isInternalBuild
{
  return _isInternalBuild;
}

- (id)date
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

- (id)idCache
{
  MTFrameworkEnvironment *v2;
  MTIDCache *idCache;
  MTIDCache *v4;
  MTIDCache *v5;
  MTIDCache *v6;

  v2 = self;
  objc_sync_enter(v2);
  idCache = v2->_idCache;
  if (!idCache)
  {
    v4 = objc_alloc_init(MTIDCache);
    v5 = v2->_idCache;
    v2->_idCache = v4;

    idCache = v2->_idCache;
  }
  v6 = idCache;
  objc_sync_exit(v2);

  return v6;
}

- (id)secretStore
{
  MTFrameworkEnvironment *v2;
  MTIDSecretStore *secretStore;
  Class v4;
  Class v5;
  void *v6;
  objc_class *v7;
  MTIDSecretStore *v8;
  MTIDSecretStore *v9;
  MTIDSecretStore *v10;

  v2 = self;
  objc_sync_enter(v2);
  secretStore = v2->_secretStore;
  if (!secretStore)
  {
    v4 = NSClassFromString(CFSTR("MTIDCompositeSecretStore"));
    v5 = NSClassFromString(CFSTR("MTIDXPCSecretStore"));
    -[MTFrameworkEnvironment valueForEntitlement:](v2, "valueForEntitlement:", CFSTR("com.apple.security.exception.mach-lookup.global-name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsObject:", CFSTR("com.apple.AMPIDService")) & (v5 != 0)) != 0)
      v7 = v5;
    else
      v7 = v4;
    v8 = (MTIDSecretStore *)objc_alloc_init(v7);
    v9 = v2->_secretStore;
    v2->_secretStore = v8;

    secretStore = v2->_secretStore;
  }
  v10 = secretStore;
  objc_sync_exit(v2);

  return v10;
}

- (id)metricsKitBundleIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("MTMetricsKit")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)withEnvironment:(id)a3 execute:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  id v8;

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  objc_msgSend(a1, "sharedEnvironment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSharedEnvironment:", v7);

  v6[2](v6);
  objc_msgSend(a1, "setSharedEnvironment:", v8);

}

+ (void)setSharedEnvironment:(id)a3
{
  objc_storeStrong((id *)&_sharedEnvironment, a3);
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  v3 = (void *)_sharedEnvironment;
  _sharedEnvironment = v2;

  _isInternalBuild = MGGetBoolAnswer();
}

- (void)setLocalDataPath:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  NSString *localDataPath;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("file://")))
  {
    MTMetricsKitOSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_20D758000, v5, OS_LOG_TYPE_ERROR, "MetricsKit: Expected a path but got a full url for MTFrameworkEnvironment.setLocalDataPath. Please remove file:// from %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("//"), CFSTR("/"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  localDataPath = self->_localDataPath;
  self->_localDataPath = v8;

}

- (NSString)localDataPath
{
  NSString *localDataPath;
  _QWORD block[5];

  localDataPath = self->_localDataPath;
  if (!localDataPath)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__MTFrameworkEnvironment_localDataPath__block_invoke;
    block[3] = &unk_24C7A0748;
    block[4] = self;
    if (localDataPath_onceToken != -1)
      dispatch_once(&localDataPath_onceToken, block);
    localDataPath = (NSString *)localDataPath_defaultDataFolder;
  }
  return localDataPath;
}

void __39__MTFrameworkEnvironment_localDataPath__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 1, 0, 1, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  objc_msgSend(*(id *)(a1 + 32), "metricsKitBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "path");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)localDataPath_defaultDataFolder;
  localDataPath_defaultDataFolder = v7;

}

- (id)valueForEntitlement:(id)a3
{
  __CFString *v3;
  __SecTask *v4;
  __SecTask *v5;
  void *v6;
  NSObject *v7;
  CFErrorRef error;
  uint8_t buf[4];
  __CFString *v11;
  __int16 v12;
  CFErrorRef v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v4 = SecTaskCreateFromSelf(0);
  if (v4)
  {
    v5 = v4;
    error = 0;
    v6 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (error)
    {
      MTMetricsKitOSLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v11 = v3;
        v12 = 2112;
        v13 = error;
        _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to read entitlement %@ error: %@", buf, 0x16u);
      }

      CFRelease(error);
    }
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)useCloudKitSandbox
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[MTFrameworkEnvironment isInternalBuild](self, "isInternalBuild");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("MTMetricsKitContainerEnvironment"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[MTFrameworkEnvironment valueForEntitlement:](self, "valueForEntitlement:", CFSTR("com.apple.developer.icloud-container-environment"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Development"));

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idCache, 0);
  objc_storeStrong((id *)&self->_secretStore, 0);
  objc_storeStrong((id *)&self->_localDataPath, 0);
}

- (id)dateOfBirthComponents
{
  objc_class *v2;
  objc_class *v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (HealthKitFramework_sOnce != -1)
    dispatch_once(&HealthKitFramework_sOnce, &__block_literal_global_11);
  if (!HealthKitFramework_sHandle
    || (NSClassFromString(CFSTR("HKHealthStore")),
        (v2 = (objc_class *)(id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    MTMetricsKitOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v8 = "MetricsKit: HKHealthStore class is not found.";
      v9 = v4;
      v10 = OS_LOG_TYPE_ERROR;
LABEL_15:
      _os_log_impl(&dword_20D758000, v9, v10, v8, buf, 2u);
    }
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  v3 = v2;
  if ((-[objc_class isHealthDataAvailable](v2, "isHealthDataAvailable") & 1) == 0)
  {
    MTMetricsKitOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v8 = "MetricsKit: HealthKit health data is not available.";
      v9 = v4;
      v10 = OS_LOG_TYPE_INFO;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v4 = objc_alloc_init(v3);
  v12 = 0;
  -[NSObject dateOfBirthComponentsWithError:](v4, "dateOfBirthComponentsWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v6)
  {
    MTMetricsKitOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_ERROR, "MetricsKit: Date of birth retrieval from HealthKit failed with error: %@", buf, 0xCu);
    }

  }
LABEL_17:

  return v5;
}

@end
