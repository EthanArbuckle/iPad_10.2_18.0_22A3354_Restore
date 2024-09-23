@implementation MTSDeviceSetupManager

- (MTSDeviceSetupManager)init
{
  MTSXPCServerProxy *v3;
  MTSDeviceSetupManager *v4;

  v3 = objc_alloc_init(MTSXPCServerProxy);
  v4 = -[MTSDeviceSetupManager initWithServerProxy:](self, "initWithServerProxy:", v3);

  return v4;
}

- (MTSDeviceSetupManager)initWithServerProxy:(id)a3
{
  id v5;
  void *v6;
  MTSDeviceSetupManager *v7;
  MTSDeviceSetupManager *v8;
  MTSDeviceSetupManager *result;
  MTSDeviceSetupManager *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)MTSDeviceSetupManager;
    v7 = -[MTSDeviceSetupManager init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_serverProxy, a3);

    return v8;
  }
  else
  {
    v10 = (MTSDeviceSetupManager *)_HMFPreconditionFailure();
    -[MTSDeviceSetupManager dealloc](v10, v11);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[MTSXPCServerProxy invalidate](self->_serverProxy, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MTSDeviceSetupManager;
  -[MTSDeviceSetupManager dealloc](&v3, sel_dealloc);
}

- (void)performDeviceSetupUsingRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MTSDeviceSetupManager *v11;
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
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Performing Matter device setup"));
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
    _os_log_impl(&dword_2344FE000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Performing Matter device setup using request: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[MTSDeviceSetupManager serverProxy](v11, "serverProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __74__MTSDeviceSetupManager_performDeviceSetupUsingRequest_completionHandler___block_invoke;
  v19[3] = &unk_250599D68;
  v19[4] = v11;
  v20 = v9;
  v21 = v8;
  v17 = v8;
  v18 = v9;
  objc_msgSend(v16, "performDeviceSetupUsingRequest:completionHandler:", v6, v19);

}

- (MTSXPCServerProxy)serverProxy
{
  return (MTSXPCServerProxy *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverProxy, 0);
}

void __74__MTSDeviceSetupManager_performDeviceSetupUsingRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
      v16 = 138543874;
      v17 = v8;
      v18 = 2114;
      v19 = v10;
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_2344FE000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to perform Matter device setup setup: %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "mts_errorWithCode:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_2344FE000, v7, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully performed Matter device setup setup", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3 != -1)
    dispatch_once(&logCategory__hmf_once_t3, &__block_literal_global_529);
  return (id)logCategory__hmf_once_v4;
}

void __36__MTSDeviceSetupManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4;
  logCategory__hmf_once_v4 = v0;

}

@end
