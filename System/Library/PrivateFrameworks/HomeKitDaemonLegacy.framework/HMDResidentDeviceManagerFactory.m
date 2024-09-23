@implementation HMDResidentDeviceManagerFactory

+ (id)createManagerForHomeUUID:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  HMDResidentDeviceManagerLegacy *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Using legacy HMDResidentDeviceManager", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v7 = objc_alloc_init(HMDResidentDeviceManagerLegacy);

  return v7;
}

@end
