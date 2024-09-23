@implementation HMDHH2FrameworkSwitchDefaultDataSource

- (BOOL)isHH2Enabled
{
  return CFPreferencesGetAppBooleanValue(CFSTR("isHH2Enabled"), CFSTR("com.apple.homed"), 0) != 0;
}

- (unint64_t)setupMode
{
  unint64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(CFSTR("HHTTSUMode"), CFSTR("com.apple.homed"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return 0;
  return result;
}

- (id)controller:(id)a3 cloudDatabaseWithContainerID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDHH2FrameworkSwitchDefaultDataSource *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[HMDDatabase defaultDatabase](HMDDatabase, "defaultDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4ECE8]), "initWithContainerID:", v7);
    objc_msgSend(v10, "setSubscriptionPushRegistrationAction:", 1);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4EC50]), "initWithLocalDatabase:configuration:", v9, v10);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get default local database", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

@end
