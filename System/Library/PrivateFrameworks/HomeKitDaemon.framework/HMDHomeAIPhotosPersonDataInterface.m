@implementation HMDHomeAIPhotosPersonDataInterface

- (HMDHomeAIPhotosPersonDataInterface)initWithPersonManagerUUID:(id)a3 homeUUID:(id)a4 workQueue:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDHomeAIPhotosPersonDataInterface *v13;

  v8 = (objc_class *)MEMORY[0x24BE4D1C8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithUUID:homeUUID:", v11, v10);

  v13 = -[HMDHomeAIPhotosPersonDataInterface initWithPhotosPersonManager:workQueue:](self, "initWithPhotosPersonManager:workQueue:", v12, v9);
  return v13;
}

- (HMDHomeAIPhotosPersonDataInterface)initWithPhotosPersonManager:(id)a3 workQueue:(id)a4
{
  id v7;
  HMDHomeAIPhotosPersonDataInterface *v8;
  HMDHomeAIPhotosPersonDataInterface *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDHomeAIPhotosPersonDataInterface;
  v8 = -[HMDHomeAIPersonDataInterface initWithPersonManager:workQueue:](&v11, sel_initWithPersonManager_workQueue_, v7, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_photosPersonManager, a3);

  return v9;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDHomeAIPhotosPersonDataInterface photosPersonManager](self, "photosPersonManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)fetchSettingsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomeAIPersonDataInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__HMDHomeAIPhotosPersonDataInterface_fetchSettingsWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleUpdatedSettings:(id)a3 mirrorOutputFuture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDHomeAIPhotosPersonDataInterface *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHomeAIPersonDataInterface workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "createHMIExternalPersonManagerSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HMDHomeAIPhotosPersonDataInterface photosPersonManager](self, "photosPersonManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleUpdatedSettings:", v9);

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Updated settings could not be converted into HMIExternalPersonManagerSettings: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (HMIExternalPersonManager)photosPersonManager
{
  return (HMIExternalPersonManager *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosPersonManager, 0);
}

void __66__HMDHomeAIPhotosPersonDataInterface_fetchSettingsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Fetching settings", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "createHMIExternalPersonManagerSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetched settings could not be converted into HMIExternalPersonManagerSettings: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_76018 != -1)
    dispatch_once(&logCategory__hmf_once_t0_76018, &__block_literal_global_76019);
  return (id)logCategory__hmf_once_v1_76020;
}

void __49__HMDHomeAIPhotosPersonDataInterface_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_76020;
  logCategory__hmf_once_v1_76020 = v0;

}

@end
