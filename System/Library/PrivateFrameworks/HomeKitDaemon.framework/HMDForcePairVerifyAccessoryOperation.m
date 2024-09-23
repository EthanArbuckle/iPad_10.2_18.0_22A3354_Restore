@implementation HMDForcePairVerifyAccessoryOperation

+ (id)predicate
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_141605 != -1)
    dispatch_once(&logCategory__hmf_once_t4_141605, &__block_literal_global_141606);
  return (id)logCategory__hmf_once_v5_141607;
}

void __51__HMDForcePairVerifyAccessoryOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_141607;
  logCategory__hmf_once_v5_141607 = v0;

}

- (BOOL)mainWithError:(id *)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  void *v16;
  HMDForcePairVerifyAccessoryOperation *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = -[HMDAccessoryBackgroundOperation accessoryOperationStatus](self, "accessoryOperationStatus");
  v6 = (void *)objc_opt_class();
  -[HMDAccessoryBackgroundOperation accessoryUUID](self, "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation homeManager](self, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findAccessoryUsing:homeManager:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
    v13 = v5 == 0;
  else
    v13 = 1;
  v14 = !v13;
  if (v13)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryUUID](v17, "accessoryUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation accessoryIdentifier](v17, "accessoryIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBackgroundOperation homeUUID](v17, "homeUUID");
      v25 = v16;
      v22 = a3;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v21;
      v34 = 2112;
      v35 = v23;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to force Pair Verify with accessory : %@/%@, for Home: %@", buf, 0x2Au);

      a3 = v22;
      v16 = v25;

    }
    objc_autoreleasePoolPop(v16);
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (v5 != 1)
  {
    dispatch_get_global_queue(-32768, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __54__HMDForcePairVerifyAccessoryOperation_mainWithError___block_invoke;
    v26[3] = &unk_24E79BCC8;
    v26[4] = self;
    v27 = v12;
    objc_msgSend(v27, "establishLocalHAPConnectionWithQueue:completion:", v15, v26);

  }
  return v14;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDBackgroundOperation operationUUID](self, "operationUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __54__HMDForcePairVerifyAccessoryOperation_mainWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Force PV with accessory [%@] finished with error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

@end
