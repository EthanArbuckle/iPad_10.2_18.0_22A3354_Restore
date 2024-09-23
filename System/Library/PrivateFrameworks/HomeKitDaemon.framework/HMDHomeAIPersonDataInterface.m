@implementation HMDHomeAIPersonDataInterface

- (HMDHomeAIPersonDataInterface)initWithPersonManager:(id)a3 workQueue:(id)a4
{
  id v7;
  id v8;
  HMDHomeAIPersonDataInterface *v9;
  HMDHomeAIPersonDataInterface *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomeAIPersonDataInterface;
  v9 = -[HMDHomeAIPersonDataInterface init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a4);
    objc_storeStrong((id *)&v10->_personManager, a3);
  }

  return v10;
}

- (void)fetchAllPersonsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDHomeAIPersonDataInterface *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching all persons", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomeAIPersonDataInterface workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__HMDHomeAIPersonDataInterface_fetchAllPersonsWithCompletion___block_invoke;
  v11[3] = &unk_24E79C2B8;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeAIPersonDataInterface *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching persons with UUIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDHomeAIPersonDataInterface workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMDHomeAIPersonDataInterface_fetchPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24E79B440;
  v16 = v6;
  v17 = v7;
  block[4] = v9;
  v13 = v6;
  v14 = v7;
  dispatch_async(v12, block);

}

- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDHomeAIPersonDataInterface *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching all person face crops", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomeAIPersonDataInterface workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__HMDHomeAIPersonDataInterface_fetchAllPersonFaceCropsWithCompletion___block_invoke;
  v11[3] = &unk_24E79C2B8;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeAIPersonDataInterface *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching face crops for persons with UUIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDHomeAIPersonDataInterface workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__HMDHomeAIPersonDataInterface_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24E79B440;
  v16 = v6;
  v17 = v7;
  block[4] = v9;
  v13 = v6;
  v14 = v7;
  dispatch_async(v12, block);

}

- (void)fetchAllFaceprintsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDHomeAIPersonDataInterface *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching all faceprints", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomeAIPersonDataInterface workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__HMDHomeAIPersonDataInterface_fetchAllFaceprintsWithCompletion___block_invoke;
  v11[3] = &unk_24E79C2B8;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeAIPersonDataInterface *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching faceprints for face crops with UUIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDHomeAIPersonDataInterface workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__HMDHomeAIPersonDataInterface_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24E79B440;
  v16 = v6;
  v17 = v7;
  block[4] = v9;
  v13 = v6;
  v14 = v7;
  dispatch_async(v12, block);

}

- (void)performCloudPullWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDHomeAIPersonDataInterface *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Performing cloud pull", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomeAIPersonDataInterface workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__HMDHomeAIPersonDataInterface_performCloudPullWithCompletion___block_invoke;
  v11[3] = &unk_24E79C2B8;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)configureWithDataSource:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeAIPersonDataInterface *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHomeAIPersonDataInterface workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!v6)
    _HMFPreconditionFailure();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Configuring HomeAI person data interface", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDHomeAIPersonDataInterface setDataSource:](v10, "setDataSource:", v6);
  -[HMDHomeAIPersonDataInterface personManager](v10, "personManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDataSource:", v10);

}

- (void)handleUpdatedPerson:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[HMDHomeAIPersonDataInterface workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDHomeAIPersonDataInterface personManager](self, "personManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createHMIPerson");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "handleUpdatedPerson:", v7);
}

- (void)handleUpdatedPersonFaceCrop:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[HMDHomeAIPersonDataInterface workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDHomeAIPersonDataInterface personManager](self, "personManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createHMIPersonFaceCrop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "handleUpdatedPersonFaceCrop:", v7);
}

- (void)handleUpdatedFaceprint:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[HMDHomeAIPersonDataInterface workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDHomeAIPersonDataInterface personManager](self, "personManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createHMIFaceprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "handleUpdatedFaceprint:", v7);
}

- (void)handleRemovedPersonWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;

  v5 = a3;
  -[HMDHomeAIPersonDataInterface workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDHomeAIPersonDataInterface personManager](self, "personManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleRemovedPersonWithUUID:", v5);

}

- (void)handleRemovedFaceCropWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;

  v5 = a3;
  -[HMDHomeAIPersonDataInterface workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDHomeAIPersonDataInterface personManager](self, "personManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleRemovedFaceCropWithUUID:", v5);

}

- (void)handleRemovedFaceprintWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;

  v5 = a3;
  -[HMDHomeAIPersonDataInterface workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDHomeAIPersonDataInterface personManager](self, "personManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleRemovedFaceprintWithUUID:", v5);

}

- (void)handleUpdatedIsCurrentDeviceAvailableResident:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  HMDHomeAIPersonDataInterface *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeAIPersonDataInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDHomeAIPersonDataInterface personManager](self, "personManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsFaceClassification");

  if (v7 != v3)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeAIPersonDataInterface personManager](v9, "personManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "supportsFaceClassification");
      -[HMDHomeAIPersonDataInterface personManager](v9, "personManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v11;
      v18 = 1024;
      v19 = v13;
      v20 = 1024;
      v21 = v3;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating supportsFaceClassification from %d -> %d on %@", (uint8_t *)&v16, 0x22u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDHomeAIPersonDataInterface personManager](v9, "personManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSupportsFaceClassification:", v3);

  }
}

- (void)handleUpdatedIsDataSyncInProgress:(BOOL)a3
{
  int v3;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  HMDHomeAIPersonDataInterface *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeAIPersonDataInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDHomeAIPersonDataInterface personManager](self, "personManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPersonDataAvailableViaHomeKit");

  if (v7 == v3)
  {
    v8 = v3 ^ 1u;
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeAIPersonDataInterface personManager](v10, "personManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isPersonDataAvailableViaHomeKit");
      -[HMDHomeAIPersonDataInterface personManager](v10, "personManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v12;
      v19 = 1024;
      v20 = v14;
      v21 = 1024;
      v22 = v8;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating personDataAvailableViaHomeKit from %d -> %d on %@", (uint8_t *)&v17, 0x22u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDHomeAIPersonDataInterface personManager](v10, "personManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPersonDataAvailableViaHomeKit:", v8);

  }
}

- (HMIPersonManager)personManager
{
  return (HMIPersonManager *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDPersonDataSource)dataSource
{
  return (HMDPersonDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
}

void __63__HMDHomeAIPersonDataInterface_performCloudPullWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performCloudPull");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__HMDHomeAIPersonDataInterface_performCloudPullWithCompletion___block_invoke_2;
  v5[3] = &unk_24E792510;
  v6 = *(id *)(a1 + 40);
  v4 = (id)objc_msgSend(v3, "addCompletionBlock:", v5);

}

uint64_t __63__HMDHomeAIPersonDataInterface_performCloudPullWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__HMDHomeAIPersonDataInterface_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isDataAvailable") & 1) != 0)
  {
    objc_msgSend(v2, "faceprintsForFaceCropsWithUUIDs:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "na_map:", &__block_literal_global_15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch faceprints for face crops because data is not available", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

uint64_t __80__HMDHomeAIPersonDataInterface_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createHMIFaceprint");
}

void __65__HMDHomeAIPersonDataInterface_fetchAllFaceprintsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isDataAvailable") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65__HMDHomeAIPersonDataInterface_fetchAllFaceprintsWithCompletion___block_invoke_11;
    v10[3] = &unk_24E78DBF8;
    v11 = v3;
    v4 = v3;
    objc_msgSend(v2, "enumerateFaceprintsUsingBlock:", v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch all faceprints because data is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v4);
  }

}

void __65__HMDHomeAIPersonDataInterface_fetchAllFaceprintsWithCompletion___block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "createHMIFaceprint");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __77__HMDHomeAIPersonDataInterface_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isDataAvailable") & 1) != 0)
  {
    objc_msgSend(v2, "faceCropsForPersonsWithUUIDs:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "na_map:", &__block_literal_global_10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch face crops for persons because data is not available", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

uint64_t __77__HMDHomeAIPersonDataInterface_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createHMIPersonFaceCrop");
}

void __70__HMDHomeAIPersonDataInterface_fetchAllPersonFaceCropsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isDataAvailable") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__HMDHomeAIPersonDataInterface_fetchAllPersonFaceCropsWithCompletion___block_invoke_6;
    v10[3] = &unk_24E78DBD0;
    v11 = v3;
    v4 = v3;
    objc_msgSend(v2, "enumeratePersonFaceCropsUsingBlock:", v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch all person face crops because data is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v4);
  }

}

void __70__HMDHomeAIPersonDataInterface_fetchAllPersonFaceCropsWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "createHMIPersonFaceCrop");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __65__HMDHomeAIPersonDataInterface_fetchPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isDataAvailable") & 1) != 0)
  {
    objc_msgSend(v2, "personsWithUUIDs:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "na_map:", &__block_literal_global_13013);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch persons with UUIDs because data is not available", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

uint64_t __65__HMDHomeAIPersonDataInterface_fetchPersonsWithUUIDs_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createHMIPerson");
}

void __62__HMDHomeAIPersonDataInterface_fetchAllPersonsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isDataAvailable") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __62__HMDHomeAIPersonDataInterface_fetchAllPersonsWithCompletion___block_invoke_2;
    v10[3] = &unk_24E78DB80;
    v11 = v3;
    v4 = v3;
    objc_msgSend(v2, "enumeratePersonsUsingBlock:", v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch all persons because data is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v4);
  }

}

void __62__HMDHomeAIPersonDataInterface_fetchAllPersonsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "createHMIPerson");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
