@implementation COFeatureStatus

+ (BOOL)isCoordinationEnabled
{
  return 1;
}

+ (BOOL)isCOClusterEnabled
{
  return 1;
}

+ (BOOL)isGlobalMessagingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSharedCompanionLinkClientEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isGlobalTimersEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSlimBallotsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isOpalEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isFastFoldEnabled
{
  if (isFastFoldEnabled_onceToken != -1)
    dispatch_once(&isFastFoldEnabled_onceToken, &__block_literal_global_7);
  return isFastFoldEnabled_enabled;
}

void __36__COFeatureStatus_isFastFoldEnabled__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  isFastFoldEnabled_enabled = _os_feature_enabled_impl();
  +[CODefaults coordinationBundleID](CODefaults, "coordinationBundleID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CODefaults userDefaultsForIdentifer:](CODefaults, "userDefaultsForIdentifer:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKey:", CFSTR("fastFold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (isFastFoldEnabled_enabled)
      v4 = objc_msgSend(v2, "BOOLValue");
    else
      v4 = 0;
    isFastFoldEnabled_enabled = v4;
    COLogForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 67109632;
      v10 = isFastFoldEnabled_enabled;
      v11 = 1024;
      v12 = _os_feature_enabled_impl();
      v13 = 1024;
      v14 = objc_msgSend(v3, "BOOLValue");
      v6 = "Fast fold feature status = %d. FF = %d, defaults = %d";
      v7 = v5;
      v8 = 20;
      goto LABEL_9;
    }
  }
  else
  {
    COLogForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 67109376;
      v10 = isFastFoldEnabled_enabled;
      v11 = 1024;
      v12 = _os_feature_enabled_impl();
      v6 = "Fast fold feature status = %d. FF = %d";
      v7 = v5;
      v8 = 14;
LABEL_9:
      _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }

}

+ (BOOL)isIPDiscoveryDiffingEnabled
{
  if (isIPDiscoveryDiffingEnabled_onceToken != -1)
    dispatch_once(&isIPDiscoveryDiffingEnabled_onceToken, &__block_literal_global_9);
  return isIPDiscoveryDiffingEnabled_enabled;
}

void __46__COFeatureStatus_isIPDiscoveryDiffingEnabled__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  isIPDiscoveryDiffingEnabled_enabled = _os_feature_enabled_impl();
  +[CODefaults coordinationBundleID](CODefaults, "coordinationBundleID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CODefaults userDefaultsForIdentifer:](CODefaults, "userDefaultsForIdentifer:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKey:", CFSTR("ipDiffing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (isIPDiscoveryDiffingEnabled_enabled)
      v4 = objc_msgSend(v2, "BOOLValue");
    else
      v4 = 0;
    isIPDiscoveryDiffingEnabled_enabled = v4;
    COLogForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 67109632;
      v10 = isIPDiscoveryDiffingEnabled_enabled;
      v11 = 1024;
      v12 = _os_feature_enabled_impl();
      v13 = 1024;
      v14 = objc_msgSend(v3, "BOOLValue");
      v6 = "IP Diffing feature status = %d. FF = %d, defaults = %d";
      v7 = v5;
      v8 = 20;
      goto LABEL_9;
    }
  }
  else
  {
    COLogForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 67109376;
      v10 = isIPDiscoveryDiffingEnabled_enabled;
      v11 = 1024;
      v12 = _os_feature_enabled_impl();
      v6 = "IP Diffing feature status = %d. FF = %d";
      v7 = v5;
      v8 = 14;
LABEL_9:
      _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }

}

+ (BOOL)isNoDaemonMessageChannelEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isHomeKitUsingAlarmsAndTimersIDSService
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDistributedTimersEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDistributedTimersForHH1Enabled
{
  int v2;

  v2 = +[COFeatureStatus isDistributedTimersEnabled](COFeatureStatus, "isDistributedTimersEnabled");
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

@end
