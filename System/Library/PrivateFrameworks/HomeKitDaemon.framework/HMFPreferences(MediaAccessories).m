@implementation HMFPreferences(MediaAccessories)

+ (uint64_t)loadEnableMediaAccessoriesPreferences
{
  objc_msgSend(MEMORY[0x24BE3F248], "loadEnableAppleMediaAccessories");
  +[HMDMediaPreference loadEnableMediaAccessories](HMDMediaPreference, "loadEnableMediaAccessories");
  return +[HMDAirPlay2Preference loadEnableAirPlay2Accessories](HMDAirPlay2Preference, "loadEnableAirPlay2Accessories");
}

+ (void)loadEnableAppleMediaAccessories
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass");

  if (v3 == 6)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = a1;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Overriding support for Apple media accessories", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x24BE3F248], "setDefaultValue:forPreferenceKey:", MEMORY[0x24BDBD1C8], CFSTR("enableAppleMedia"));
  }
}

@end
