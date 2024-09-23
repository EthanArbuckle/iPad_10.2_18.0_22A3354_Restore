@implementation HMDMTSPairingServer

- (HMDMTSPairingServer)initWithAccessoryBrowser:(id)a3
{
  void *v4;
  void *v5;
  HMDMTSPairingServer *v6;

  objc_msgSend(a3, "chipAccessoryServerBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemCommissionerPairingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDMTSPairingServer initWithSystemCommissionerPairingManager:](self, "initWithSystemCommissionerPairingManager:", v5);

  return v6;
}

- (HMDMTSPairingServer)initWithSystemCommissionerPairingManager:(id)a3
{
  id v5;
  void *v6;
  HMDMTSPairingServer *v7;
  HMDMTSPairingServer *v8;
  HMDMTSPairingServer *result;
  HMDMTSPairingServer *v10;
  SEL v11;
  id v12;
  id v13;
  objc_super v14;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)HMDMTSPairingServer;
    v7 = -[HMDMTSPairingServer init](&v14, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_systemCommissionerPairingManager, a3);

    return v8;
  }
  else
  {
    v10 = (HMDMTSPairingServer *)_HMFPreconditionFailure();
    -[HMDMTSPairingServer fetchDevicePairingsForSystemCommissionerPairingUUID:completionHandler:](v10, v11, v12, v13);
  }
  return result;
}

- (void)fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMTSPairingServer *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching all device pairings for system commissioner device pairing with UUID: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMTSPairingServer systemCommissionerPairingManager](v9, "systemCommissionerPairingManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", v6, v7);

}

- (void)removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDMTSPairingServer *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing device pairing with UUID: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDMTSPairingServer systemCommissionerPairingManager](v12, "systemCommissionerPairingManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeDevicePairingWithUUID:forSystemCommissionerPairingUUID:completionHandler:", v8, v9, v10);

}

- (void)removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMTSPairingServer *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing all device pairings for system commissioner pairing UUID: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMTSPairingServer systemCommissionerPairingManager](v9, "systemCommissionerPairingManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", v6, v7);

}

- (void)openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDMTSPairingServer *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v13;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Opening commissioning window for system commissioner pairing UUID: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDMTSPairingServer systemCommissionerPairingManager](v11, "systemCommissionerPairingManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "openCommissioningWindowForSystemCommissionerPairingUUID:duration:completionHandler:", v8, v9, a4);

}

- (void)readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMTSPairingServer *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Reading commissioning window status for system commissioner pairing UUID: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMTSPairingServer systemCommissionerPairingManager](v9, "systemCommissionerPairingManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "readCommissioningWindowStatusForSystemCommissionerPairingUUID:completionHandler:", v6, v7);

}

- (void)fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  HMDMTSPairingServer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching system commissioner device pairings", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMTSPairingServer systemCommissionerPairingManager](v6, "systemCommissionerPairingManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchSystemCommissionerPairingsWithCompletionHandler:", v4);

}

- (void)removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMTSPairingServer *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing system commissioner device pairing with UUID: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMTSPairingServer systemCommissionerPairingManager](v9, "systemCommissionerPairingManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeSystemCommissionerPairingWithUUID:completionHandler:", v6, v7);

}

- (HMMTRSystemCommissionerPairingManager)systemCommissionerPairingManager
{
  return (HMMTRSystemCommissionerPairingManager *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemCommissionerPairingManager, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_118946 != -1)
    dispatch_once(&logCategory__hmf_once_t7_118946, &__block_literal_global_118947);
  return (id)logCategory__hmf_once_v8_118948;
}

void __34__HMDMTSPairingServer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_118948;
  logCategory__hmf_once_v8_118948 = v0;

}

@end
