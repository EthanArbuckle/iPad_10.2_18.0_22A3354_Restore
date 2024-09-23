@implementation ASIdentifierManager

+ (ASIdentifierManager)sharedManager
{
  return objc_alloc_init(ASIdentifierManager);
}

- (BOOL)isAdvertisingTrackingEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  NSObject *v9;
  BOOL v10;
  _QWORD block[4];
  id v13;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.AdSupport"));
  objc_msgSend(v4, "objectForKey:", CFSTR("LastRegionalEnforcementCheck"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ShouldEnforceATP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = objc_msgSend(v4, "BOOLForKey:", CFSTR("ShouldEnforceATP")) ^ 1;
  else
    v7 = 0;

  if (!v5 || (objc_msgSend(v3, "timeIntervalSinceDate:", v5), v8 > 300.0))
  {
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("LastRegionalEnforcementCheck"));
    objc_msgSend(v4, "synchronize");
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__ASIdentifierManager_isAdvertisingTrackingEnabled__block_invoke;
    block[3] = &unk_24D52B9A0;
    v13 = v4;
    dispatch_async(v9, block);

  }
  if (v7)
    v10 = -[ASIdentifierManager isUserOptedIn](self, "isUserOptedIn");
  else
    v10 = 0;

  return v10;
}

- (NSUUID)advertisingIdentifier
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE639A0]);

  if (v3
    || (objc_msgSend(MEMORY[0x24BEBF268], "sharedManager"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isSharedIPad"),
        v4,
        v5))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceIdentifierForAdvertising");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSUUID *)v6;
}

uint64_t __51__ASIdentifierManager_isAdvertisingTrackingEnabled__block_invoke(uint64_t a1)
{
  uint64_t v3;

  v3 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setBool:forKey:", objc_msgSend(MEMORY[0x24BDB6698], "shouldEnforceTrackingWithReasonCode:", &v3), CFSTR("ShouldEnforceATP"));
  return objc_msgSend(*(id *)(a1 + 32), "synchronize");
}

- (BOOL)isUserOptedIn
{
  void *v2;
  int v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63978]);

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x24BE639A0]);

  return v3 == 1 && v5 != 1;
}

@end
