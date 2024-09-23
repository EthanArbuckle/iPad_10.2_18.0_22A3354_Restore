@implementation FSFUtils

+ (id)getBase64EncodedStrFromData:(id)a3
{
  return (id)objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
}

+ (id)getDataFromBase64EncodedStr:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDBCE50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBase64EncodedString:options:", v4, 0);

  return v5;
}

+ (BOOL)isPlatformiOS
{
  return 1;
}

+ (BOOL)isEnabledOnMacOS
{
  return 1;
}

+ (BOOL)isPlatformMacOS
{
  return 0;
}

+ (BOOL)isPlatformWatchOS
{
  return 0;
}

+ (BOOL)isPlatformtvOS
{
  return 0;
}

+ (BOOL)isSupportedPlatform
{
  return +[FSFUtils isPlatformiOS](FSFUtils, "isPlatformiOS")
      || +[FSFUtils isPlatformtvOS](FSFUtils, "isPlatformtvOS")
      || +[FSFUtils isPlatformWatchOS](FSFUtils, "isPlatformWatchOS")
      || +[FSFUtils isPlatformMacOS](FSFUtils, "isPlatformMacOS")
      && +[FSFUtils isEnabledOnMacOS](FSFUtils, "isEnabledOnMacOS");
}

+ (BOOL)isSupportedUser
{
  void *v2;
  char v3;

  NSUserName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("mobile"));

  return v3;
}

+ (id)getBaseLocalPath
{
  void *v3;
  void *v4;
  _BYTE v5[1024];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (+[FSFUtils isPlatformiOS](FSFUtils, "isPlatformiOS")
    || +[FSFUtils isPlatformWatchOS](FSFUtils, "isPlatformWatchOS")
    || +[FSFUtils isPlatformtvOS](FSFUtils, "isPlatformtvOS"))
  {
    return CFSTR("/private/var/mobile/Library/Logs/com.apple.FeatureStore/");
  }
  if (!+[FSFUtils isEnabledOnMacOS](FSFUtils, "isEnabledOnMacOS")
    || !+[FSFUtils isPlatformMacOS](FSFUtils, "isPlatformMacOS"))
  {
    return 0;
  }
  geteuid();
  bzero(v5, 0x400uLL);
  if (__user_local_dirname())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSHomeDirectory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[FSFUtils getBaseLocalPath].cold.1((uint64_t)v3);
  }
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("com.apple.FeatureStore/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)getStreamPath
{
  void *v2;
  void *v3;

  +[FSFUtils getBaseLocalPath](FSFUtils, "getBaseLocalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("biomeStream/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getStreamURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  +[FSFUtils getStreamPath](FSFUtils, "getStreamPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)availableStreams
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getStreamPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "getStreamPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_212552000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Cannot get contents of stream path: %@ error: %@", buf, 0x16u);

  }
  return v5;
}

+ (BOOL)isUnderLegalRestriction
{
  BOOL v2;
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v9;
  uint8_t buf[2];

  if (+[FSFDeviceInfo isRunningOnInternalBuild](FSFDeviceInfo, "isRunningOnInternalBuild"))
    return 0;
  if (!+[FSFSiriPreferenceUtil isOptedIn](FSFSiriPreferenceUtil, "isOptedIn"))
  {
    v2 = 1;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      return v2;
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x24BDACB70];
    v6 = "It is not opted in.";
    v7 = buf;
    goto LABEL_9;
  }
  +[FSFCallKitUtil sharedInstance](FSFCallKitUtil, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOnCall");

  if (v4)
  {
    v2 = 1;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      return v2;
    v9 = 0;
    v5 = MEMORY[0x24BDACB70];
    v6 = "It is on call.";
    v7 = (uint8_t *)&v9;
LABEL_9:
    _os_log_impl(&dword_212552000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
    return v2;
  }
  return 0;
}

+ (unint64_t)biomeMaxStreamSizeInBytes
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (!os_variant_allows_internal_security_policies())
    return 52428800;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("FeatureStoreMaxStreamSizeInMB"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 52428800;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("FeatureStoreMaxStreamSizeInMB"));

  return v5 << 20;
}

+ (id)biomeStoreConfig
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE0C9C0];
  objc_msgSend(a1, "getStreamPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "newPrivateStreamDefaultConfigurationWithStoreBasePath:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C9B8]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 1, 1, objc_msgSend(a1, "biomeMaxStreamSizeInBytes"), 1209600.0);
  objc_msgSend(v5, "setPruningPolicy:", v6);

  return v5;
}

+ (void)getBaseLocalPath
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_212552000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not get user dir. Returning %@", (uint8_t *)&v1, 0xCu);
}

@end
