@implementation HMDMTSDeviceSetupServer

- (HMDMTSDeviceSetupServer)initWithAccessorySetupManager:(id)a3
{
  id v5;
  void *v6;
  HMDMTSDeviceSetupServer *v7;
  HMDMTSDeviceSetupServer *v8;
  HMDMTSDeviceSetupServer *result;
  HMDMTSDeviceSetupServer *v10;
  SEL v11;
  id v12;
  id v13;
  id v14;
  objc_super v15;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v15.receiver = self;
    v15.super_class = (Class)HMDMTSDeviceSetupServer;
    v7 = -[HMDMTSDeviceSetupServer init](&v15, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_accessorySetupManager, a3);

    return v8;
  }
  else
  {
    v10 = (HMDMTSDeviceSetupServer *)_HMFPreconditionFailure();
    -[HMDMTSDeviceSetupServer clientProxy:performDeviceSetupUsingRequest:completionHandler:](v10, v11, v12, v13, v14);
  }
  return result;
}

- (void)clientProxy:(id)a3 performDeviceSetupUsingRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDMTSDeviceSetupServer *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Performing Matter ecosystem device setup using request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDMTSDeviceSetupServer accessorySetupManager](v12, "accessorySetupManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __88__HMDMTSDeviceSetupServer_clientProxy_performDeviceSetupUsingRequest_completionHandler___block_invoke;
  v17[3] = &unk_24E79B3A0;
  v17[4] = v12;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest:clientProxy:completionHandler:", v9, v8, v17);

}

- (HMDAccessorySetupManager)accessorySetupManager
{
  return (HMDAccessorySetupManager *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySetupManager, 0);
}

void __88__HMDMTSDeviceSetupServer_clientProxy_performDeviceSetupUsingRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
      v15 = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      v9 = "%{public}@Matter ecosystem device setup failed with error %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v15, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v8;
    v9 = "%{public}@Matter ecosystem device setup completed successfully!";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v13, v14);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_67867 != -1)
    dispatch_once(&logCategory__hmf_once_t3_67867, &__block_literal_global_67868);
  return (id)logCategory__hmf_once_v4_67869;
}

void __38__HMDMTSDeviceSetupServer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_67869;
  logCategory__hmf_once_v4_67869 = v0;

}

@end
