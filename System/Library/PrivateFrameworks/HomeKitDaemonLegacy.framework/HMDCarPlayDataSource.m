@implementation HMDCarPlayDataSource

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_7396 != -1)
    dispatch_once(&logCategory__hmf_once_t1_7396, &__block_literal_global_7397);
  return (id)logCategory__hmf_once_v2_7398;
}

void __35__HMDCarPlayDataSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_7398;
  logCategory__hmf_once_v2_7398 = v0;

}

- (BOOL)synchronouslyFetchIsCarPlayConnectedStatus
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D340]), "initAndWaitUntilSessionUpdated");
  objc_msgSend(v2, "currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPaired");

  return v4;
}

- (BOOL)synchronouslyFetchIsConnectedToCarPlayNetwork
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMDCarPlayDataSource *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D1BA50]);
  objc_msgSend(v3, "activate");
  objc_msgSend(v3, "currentKnownNetworkProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "isCarPlay");
  else
    v6 = 0;
  v7 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v3, "invalidate"));
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@CWFNetworkProfile isCarPlay: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);

  return v6;
}

@end
