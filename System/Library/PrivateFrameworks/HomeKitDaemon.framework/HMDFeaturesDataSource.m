@implementation HMDFeaturesDataSource

- (BOOL)isPersistentBulletinRegistrationsFeatureEnabled
{
  return 1;
}

- (BOOL)isUserActivityStateDetectionFeatureEnabled
{
  return (_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("ActivityStateDetection"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) != 0;
}

- (BOOL)isResidentSelectionEnabledForHomeUUID:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDFeaturesDataSource *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDFeaturesDataSource *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (isInternalBuild())
    {
      objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferenceForKey:", CFSTR("HMDisableResidentSelection"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      if (v8)
      {
        v9 = (void *)MEMORY[0x227676638]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v12;
          v20 = 2112;
          v21 = v4;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Resident Selection disabled via defaults write for home:%@", (uint8_t *)&v18, 0x16u);

        }
LABEL_11:

        objc_autoreleasePoolPop(v9);
        v5 = v8 ^ 1;
        goto LABEL_12;
      }
      objc_msgSend(v4, "hmf_bytesAsData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = HMDTruncatedHash(v13);

      if ((v14 & 1) != 0)
      {
        v9 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543874;
          v19 = v16;
          v20 = 2112;
          v21 = v4;
          v22 = 2048;
          v23 = v14;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Resident Selection enabled for home: %@ based on home UUID hash: %tu", (uint8_t *)&v18, 0x20u);

        }
        goto LABEL_11;
      }
    }
    v5 = 0;
    goto LABEL_12;
  }
  v5 = 1;
LABEL_12:

  return v5;
}

- (BOOL)isHH2AutoMigrationEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isHH2MigrationDryRunEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isRestrictedGuestEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isNativeMatterEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)defaultDataSource
{
  if (defaultDataSource_onceToken != -1)
    dispatch_once(&defaultDataSource_onceToken, &__block_literal_global_224032);
  return (id)defaultDataSource_dataSource;
}

void __42__HMDFeaturesDataSource_defaultDataSource__block_invoke()
{
  HMDFeaturesDataSource *v0;
  void *v1;

  v0 = objc_alloc_init(HMDFeaturesDataSource);
  v1 = (void *)defaultDataSource_dataSource;
  defaultDataSource_dataSource = (uint64_t)v0;

}

@end
