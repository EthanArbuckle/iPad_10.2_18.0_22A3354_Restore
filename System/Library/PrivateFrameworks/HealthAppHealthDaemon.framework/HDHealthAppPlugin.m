@implementation HDHealthAppPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)CFSTR("com.apple.health.HealthAppPlugin");
}

- (NSString)schemaName
{
  return (NSString *)CFSTR("HealthAppDatabaseSchema");
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
    return 0;
  else
    return 17200;
}

+ (NSString)pluginIdentifier
{
  return (NSString *)CFSTR("com.apple.health.HealthAppPlugin");
}

- (id)extensionForHealthDaemon:(id)a3
{
  id v3;
  HDHealthAppDaemonExtension *v4;

  v3 = a3;
  v4 = -[HDHealthAppDaemonExtension initWithDaemon:]([HDHealthAppDaemonExtension alloc], "initWithDaemon:", v3);

  return v4;
}

- (id)extensionForProfile:(id)a3
{
  id v3;
  HDHealthAppProfileExtension *v4;

  v3 = a3;
  if (objc_msgSend(v3, "profileType") == 1)
    v4 = -[HDHealthAppProfileExtension initWithProfile:]([HDHealthAppProfileExtension alloc], "initWithProfile:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)handleDatabaseObliteration
{
  HDHAHealthPluginHostFeedGenerator *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(HDHAHealthPluginHostFeedGenerator);
  -[HDHAHealthPluginHostFeedGenerator invalidateStoreCache](v2, "invalidateStoreCache");
  v3 = objc_alloc(MEMORY[0x24BDF88B8]);
  v4 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:", *MEMORY[0x24BDD4608]);
  objc_msgSend(v4, "removeAllPendingNotificationRequests");
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3048];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3048], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v7 = v9;
    _os_log_impl(&dword_23DB70000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removed all pending UserNotification requests", (uint8_t *)&v8, 0xCu);

  }
}

- (id)stateSyncEntityClasses
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", objc_opt_class());
  return v3;
}

- (id)taskServerClasses
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", objc_opt_class());
  return v3;
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a3 == 1)
  {
    v5[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v3;
}

@end
