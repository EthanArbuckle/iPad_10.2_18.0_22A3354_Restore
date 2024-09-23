@implementation HMDResidentDeviceManagerFactory

+ (id)createManagerForHomeUUID:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  __objc2_class **v10;
  void *v11;
  id v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[HMDFeaturesDataSource defaultDataSource](HMDFeaturesDataSource, "defaultDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isResidentSelectionEnabledForHomeUUID:", v3);

  v6 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Using ROAR V3 HMDResidentDeviceManager", (uint8_t *)&v14, 0xCu);

    }
    v10 = off_24E762700;
  }
  else
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Using ROAR HMDResidentDeviceManager", (uint8_t *)&v14, 0xCu);

    }
    v10 = off_24E7626F8;
  }

  objc_autoreleasePoolPop(v6);
  v12 = objc_alloc_init(*v10);

  return v12;
}

@end
