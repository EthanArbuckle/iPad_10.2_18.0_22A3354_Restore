@implementation HMDMatterUARPUploader

- (BOOL)accessoryReachable:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  HMDMatterUARPUploader *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v9;
    v13 = 2080;
    v14 = "-[HMDMatterUARPUploader accessoryReachable:error:]";
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@%s: accessory %@ is now reachable.", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v6);

  return 1;
}

- (BOOL)accessoryUnreachable:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  HMDMatterUARPUploader *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v9;
    v13 = 2080;
    v14 = "-[HMDMatterUARPUploader accessoryUnreachable:error:]";
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@%s: accessory %@ is now unreachable.", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v6);

  return 1;
}

- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  HMDMatterUARPUploader *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2080;
    v17 = "-[HMDMatterUARPUploader recvDataFromAccessory:data:error:]";
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v9);

  return 0;
}

- (BOOL)offerAssetToAccessory:(id)a3 asset:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  HMDMatterUARPUploader *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2080;
    v17 = "-[HMDMatterUARPUploader offerAssetToAccessory:asset:error:]";
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v9);

  return 0;
}

- (BOOL)applyStagedAssetsForAccessory:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  HMDMatterUARPUploader *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2080;
    v14 = "-[HMDMatterUARPUploader applyStagedAssetsForAccessory:error:]";
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);

  return 0;
}

- (BOOL)rescindStagedAssetsForAccessory:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  HMDMatterUARPUploader *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2080;
    v14 = "-[HMDMatterUARPUploader rescindStagedAssetsForAccessory:error:]";
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);

  return 0;
}

- (BOOL)pauseAssetTransfersForAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDMatterUARPUploader *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2080;
    v13 = "-[HMDMatterUARPUploader pauseAssetTransfersForAccessory:]";
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

  return 0;
}

- (BOOL)resumeAssetTransfersForAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDMatterUARPUploader *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2080;
    v13 = "-[HMDMatterUARPUploader resumeAssetTransfersForAccessory:]";
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

  return 0;
}

- (BOOL)cancelAssetStagingForAccessory:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMatterUARPUploader *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2080;
    v16 = "-[HMDMatterUARPUploader cancelAssetStagingForAccessory:asset:]";
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

  return 0;
}

@end
