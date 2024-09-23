@implementation FBKSSharedConstants

+ (void)initialize
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSuiteNamed:", CFSTR("group.com.apple.feedback"));

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("production"), CFSTR("environment"));
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDefaults:", v4);

}

+ (id)appleSeedURLFromDefaults:(id)a3 withEnvironment:(signed __int16)a4
{
  int v4;
  id v5;
  __CFString *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a4;
  v5 = a3;
  if ((v4 - 1) > 3)
  {
    v6 = CFSTR("https://fba.apple.com/");
  }
  else
  {
    if (FBKSHasInternalUI() && objc_msgSend((id)_overrideHostString, "length"))
    {
      v6 = (__CFString *)(id)_overrideHostString;
    }
    else
    {
      +[FBKSSharedConstants sharedUserDefaults](FBKSSharedConstants, "sharedUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringForKey:", CFSTR("developmentHost"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    FBKSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[FBKSSharedConstants appleSeedURLFromDefaults:withEnvironment:].cold.1((uint64_t)v6, v8);

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || (objc_msgSend(v9, "host"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://fba.apple.com/"));
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }

  return v10;
}

+ (id)appleSeedURL
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appleSeedURLFromDefaults:withEnvironment:", v3, objc_msgSend(a1, "environment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (signed)environment
{
  signed __int16 v2;
  void *v3;
  void *v4;

  v2 = _cachedEnvironment;
  if (_cachedEnvironment < 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringForKey:", CFSTR("environment"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    _cachedEnvironment = FBKSEnvironmentFromString(v4);
    return _cachedEnvironment;
  }
  return v2;
}

+ (void)overrideEnvironment:(signed __int16)a3 host:(id)a4
{
  int v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _cachedEnvironment = v5;
  objc_storeStrong((id *)&_overrideHostString, a4);
  FBKSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446978;
    v9 = "+[FBKSSharedConstants overrideEnvironment:host:]";
    v10 = 1024;
    v11 = v5;
    v12 = 1024;
    v13 = _cachedEnvironment;
    v14 = 2114;
    v15 = _overrideHostString;
    _os_log_impl(&dword_23B433000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: %hd -> [%hd] [%{public}@]", (uint8_t *)&v8, 0x22u);
  }

}

+ (NSString)overrideGeoCountryCode
{
  if (overrideGeoCountryCode_onceToken != -1)
    dispatch_once(&overrideGeoCountryCode_onceToken, &__block_literal_global_46);
  return (NSString *)(id)overrideGeoCountryCode_overrideValue;
}

void __45__FBKSSharedConstants_overrideGeoCountryCode__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (FBKSIsInternalInstall_onceToken != -1)
    dispatch_once(&FBKSIsInternalInstall_onceToken, &__block_literal_global);
  if (FBKSIsInternalInstall__isInternal)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "stringForKey:", CFSTR("geoOverride"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "uppercaseString");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)overrideGeoCountryCode_overrideValue;
    overrideGeoCountryCode_overrideValue = v2;

    if (overrideGeoCountryCode_overrideValue)
    {
      FBKSLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 138543362;
        v6 = overrideGeoCountryCode_overrideValue;
        _os_log_impl(&dword_23B433000, v4, OS_LOG_TYPE_DEFAULT, "Using geo override: %{public}@", (uint8_t *)&v5, 0xCu);
      }

    }
  }
}

+ (NSUserDefaults)sharedUserDefaults
{
  if (sharedUserDefaults_onceToken != -1)
    dispatch_once(&sharedUserDefaults_onceToken, &__block_literal_global_47);
  return (NSUserDefaults *)(id)sharedUserDefaults_userDefaults;
}

void __41__FBKSSharedConstants_sharedUserDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("group.com.apple.feedback"));
  v1 = (void *)sharedUserDefaults_userDefaults;
  sharedUserDefaults_userDefaults = v0;

}

+ (void)_deriveSystemVersion
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23B433000, log, OS_LOG_TYPE_ERROR, "**** ERROR **** Can't get version dictionary", v1, 2u);
}

+ (id)swVers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("BuildOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || (v5 = objc_msgSend(v4, "length"), v6 = v4, !v5))
  {
    v6 = (void *)_swVers;
    if (!_swVers)
    {
      objc_msgSend(a1, "_deriveSystemVersion");
      v6 = (void *)_swVers;
    }
  }
  v7 = v6;

  return v7;
}

+ (id)swTrain
{
  void *v2;

  v2 = (void *)_swTrain;
  if (!_swTrain)
  {
    objc_msgSend(a1, "_deriveSystemVersion");
    v2 = (void *)_swTrain;
  }
  return v2;
}

+ (id)productVersion
{
  void *v2;

  v2 = (void *)_productVersion;
  if (!_productVersion)
  {
    objc_msgSend(a1, "_deriveSystemVersion");
    v2 = (void *)_productVersion;
  }
  return v2;
}

+ (int64_t)platform
{
  return 1;
}

+ (void)appleSeedURLFromDefaults:(uint64_t)a1 withEnvironment:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_23B433000, a2, OS_LOG_TYPE_DEBUG, "Using non-production server: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
