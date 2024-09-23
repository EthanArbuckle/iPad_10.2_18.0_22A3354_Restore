@implementation MTSSystemCommissionerPairingManager

- (MTSSystemCommissionerPairingManager)init
{
  MTSXPCServerProxy *v3;
  MTSSystemCommissionerPairingManager *v4;

  v3 = objc_alloc_init(MTSXPCServerProxy);
  v4 = -[MTSSystemCommissionerPairingManager initWithServerProxy:](self, "initWithServerProxy:", v3);

  return v4;
}

- (MTSSystemCommissionerPairingManager)initWithServerProxy:(id)a3
{
  id v5;
  void *v6;
  MTSSystemCommissionerPairingManager *v7;
  MTSSystemCommissionerPairingManager *v8;
  MTSSystemCommissionerPairingManager *result;
  MTSSystemCommissionerPairingManager *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)MTSSystemCommissionerPairingManager;
    v7 = -[MTSSystemCommissionerPairingManager init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_serverProxy, a3);

    return v8;
  }
  else
  {
    v10 = (MTSSystemCommissionerPairingManager *)_HMFPreconditionFailure();
    -[MTSSystemCommissionerPairingManager dealloc](v10, v11);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[MTSXPCServerProxy invalidate](self->_serverProxy, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MTSSystemCommissionerPairingManager;
  -[MTSSystemCommissionerPairingManager dealloc](&v3, sel_dealloc);
}

- (void)fetchPairingsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MTSSystemCommissionerPairingManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Fetch system commissioner pairings"));
  v7 = (void *)MEMORY[0x23493F978]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_2344FE000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching system commissioner pairings", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[MTSSystemCommissionerPairingManager serverProxy](v8, "serverProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __74__MTSSystemCommissionerPairingManager_fetchPairingsWithCompletionHandler___block_invoke;
  v16[3] = &unk_250599D40;
  v16[4] = v8;
  v17 = v6;
  v18 = v5;
  v14 = v5;
  v15 = v6;
  objc_msgSend(v13, "fetchSystemCommissionerPairingsWithCompletionHandler:", v16);

}

- (void)removePairingWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MTSSystemCommissionerPairingManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Remove system commissioner pairing"));
  v10 = (void *)MEMORY[0x23493F978]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v13;
    v24 = 2114;
    v25 = v15;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_2344FE000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing system commissioner pairing with UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[MTSSystemCommissionerPairingManager serverProxy](v11, "serverProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __79__MTSSystemCommissionerPairingManager_removePairingWithUUID_completionHandler___block_invoke;
  v19[3] = &unk_250599D68;
  v19[4] = v11;
  v20 = v9;
  v21 = v8;
  v17 = v8;
  v18 = v9;
  objc_msgSend(v16, "removeSystemCommissionerPairingWithUUID:completionHandler:", v6, v19);

}

- (MTSXPCServerProxy)serverProxy
{
  return (MTSXPCServerProxy *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverProxy, 0);
}

void __79__MTSSystemCommissionerPairingManager_removePairingWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v8;
      v19 = 2114;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      v11 = "%{public}@[%{public}@] Failed to remove system commissioner pairing: %@";
      v12 = v7;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
LABEL_6:
      _os_log_impl(&dword_2344FE000, v12, v13, v11, (uint8_t *)&v17, v14);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    v11 = "%{public}@[%{public}@] Successfully removed system commissioner pairing";
    v12 = v7;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3, v15, v16);

}

void __74__MTSSystemCommissionerPairingManager_fetchPairingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x23493F978]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v11;
      v20 = 2114;
      v21 = v13;
      v22 = 2048;
      v23 = objc_msgSend(v5, "count");
      v14 = "%{public}@[%{public}@] Fetched %ld system commissioner pairings";
      v15 = v10;
      v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_2344FE000, v15, v16, v14, (uint8_t *)&v18, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v11;
    v20 = 2114;
    v21 = v13;
    v22 = 2112;
    v23 = (uint64_t)v6;
    v14 = "%{public}@[%{public}@] Failed to fetch system commissioner pairings: %@";
    v15 = v10;
    v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v6, v17);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6 != -1)
    dispatch_once(&logCategory__hmf_once_t6, &__block_literal_global_756);
  return (id)logCategory__hmf_once_v7;
}

void __50__MTSSystemCommissionerPairingManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7;
  logCategory__hmf_once_v7 = v0;

}

@end
