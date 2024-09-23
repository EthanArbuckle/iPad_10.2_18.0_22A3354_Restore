@implementation HMDCompositeSettingsLegacyDatabaseAdapter

- (HMDCompositeSettingsLegacyDatabaseAdapter)initWithZoneManager:(id)a3 modelClass:(Class)a4
{
  id v6;
  HMDCompositeSettingsLegacyDatabaseAdapter *v7;
  HMDCompositeSettingsLegacyDatabaseAdapter *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCompositeSettingsLegacyDatabaseAdapter;
  v7 = -[HMDCompositeSettingsLegacyDatabaseAdapter init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_zoneManager, v6);
    objc_storeStrong((id *)&v8->_modelClass, a4);
    objc_msgSend(v6, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak(&v8->_rawDatabase, v6);
  }

  return v8;
}

- (void)startWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCompositeSettingsLegacyDatabaseAdapter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)startObservingModelWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMDCompositeSettingsLegacyDatabaseAdapter *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCompositeSettingsLegacyDatabaseAdapter zoneManager](self, "zoneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__HMDCompositeSettingsLegacyDatabaseAdapter_startObservingModelWithID___block_invoke;
    v12[3] = &unk_24E79C268;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Nil zone manager while starting observation", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)stopObservingModelWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMDCompositeSettingsLegacyDatabaseAdapter *v9;
  NSObject *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  HMDCompositeSettingsLegacyDatabaseAdapter *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCompositeSettingsLegacyDatabaseAdapter zoneManager](self, "zoneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__HMDCompositeSettingsLegacyDatabaseAdapter_stopObservingModelWithID___block_invoke;
    block[3] = &unk_24E79BBD0;
    v13 = v6;
    v14 = self;
    v15 = v4;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Nil zone manager while stopping observation", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (id)fetchModelWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCompositeSettingsLegacyDatabaseAdapter *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCompositeSettingsLegacyDatabaseAdapter zoneManager](self, "zoneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "localZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchModelWithModelID:ofType:error:", v4, -[HMDCompositeSettingsLegacyDatabaseAdapter modelClass](self, "modelClass"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
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
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Nil zone manager while fetching model", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (void)addModel:(id)a3 withOptionsLabel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  HMDCompositeSettingsLegacyDatabaseAdapter *v15;
  NSObject *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  HMDCompositeSettingsLegacyDatabaseAdapter *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDCompositeSettingsLegacyDatabaseAdapter zoneManager](self, "zoneManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__HMDCompositeSettingsLegacyDatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke;
    block[3] = &unk_24E799A68;
    v19 = v9;
    v20 = v12;
    v21 = v8;
    v22 = self;
    v23 = v10;
    dispatch_async(v13, block);

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Nil zone manager while adding model", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (id)emptyModelWithID:(id)a3 parentModelID:(id)a4 modelClass:(Class)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  char v14;
  void *v15;
  id v16;
  HMDCompositeSettingsLegacyDatabaseAdapter *v18;
  SEL v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend([a5 alloc], "initWithModelID:parentModelID:", v7, v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(v12, "conformsToProtocol:", &unk_255825FB0);
    v14 = v13;
    if (v13)
      v15 = v12;
    else
      v15 = 0;
    v16 = v15;

    if ((v14 & 1) != 0)
    {

      return v12;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v18 = (HMDCompositeSettingsLegacyDatabaseAdapter *)_HMFPreconditionFailure();
  return -[HMDCompositeSettingsLegacyDatabaseAdapter localZone:didProcessModelCreation:](v18, v19, v20, v21);
}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDCompositeSettingsLegacyDatabaseAdapter *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_255825FB0))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[HMDCompositeSettingsLegacyDatabaseAdapter queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __79__HMDCompositeSettingsLegacyDatabaseAdapter_localZone_didProcessModelCreation___block_invoke;
    v18[3] = &unk_24E79C268;
    v18[4] = self;
    v19 = v10;
    dispatch_async(v11, v18);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid model creation object, ignoring %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

  return 0;
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDCompositeSettingsLegacyDatabaseAdapter *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_255825FB0))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[HMDCompositeSettingsLegacyDatabaseAdapter queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __77__HMDCompositeSettingsLegacyDatabaseAdapter_localZone_didProcessModelUpdate___block_invoke;
    v18[3] = &unk_24E79C268;
    v18[4] = self;
    v19 = v10;
    dispatch_async(v11, v18);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid model update object, ignoring %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

  return 0;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDCompositeSettingsLegacyDatabaseAdapter *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_255825FB0))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[HMDCompositeSettingsLegacyDatabaseAdapter queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __79__HMDCompositeSettingsLegacyDatabaseAdapter_localZone_didProcessModelDeletion___block_invoke;
    v18[3] = &unk_24E79C268;
    v18[4] = self;
    v19 = v10;
    dispatch_async(v11, v18);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid model deletion object, ignoring %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)rawDatabase
{
  return objc_loadWeakRetained(&self->_rawDatabase);
}

- (HMDCompositeSettingsDatabaseAdapterDelegate)delegate
{
  return (HMDCompositeSettingsDatabaseAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMDCompositeSettingsZoneManager)zoneManager
{
  return (HMDCompositeSettingsZoneManager *)objc_loadWeakRetained((id *)&self->_zoneManager);
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_destroyWeak((id *)&self->_zoneManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_rawDatabase);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __79__HMDCompositeSettingsLegacyDatabaseAdapter_localZone_didProcessModelDeletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "database:didProcessDeletionForModel:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __77__HMDCompositeSettingsLegacyDatabaseAdapter_localZone_didProcessModelUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "database:didProcessUpdateForModel:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __79__HMDCompositeSettingsLegacyDatabaseAdapter_localZone_didProcessModelCreation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "database:didProcessCreationForModel:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __82__HMDCompositeSettingsLegacyDatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  v12[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addModels:options:", v6, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __82__HMDCompositeSettingsLegacyDatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke_2;
  v10[3] = &unk_24E7950A0;
  v8 = *(void **)(a1 + 64);
  v10[4] = *(_QWORD *)(a1 + 56);
  v11 = v8;
  v9 = (id)objc_msgSend(v7, "addCompletionBlock:", v10);

}

void __82__HMDCompositeSettingsLegacyDatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__HMDCompositeSettingsLegacyDatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke_3;
  v8[3] = &unk_24E79C2B8;
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(v5, v8);

}

uint64_t __82__HMDCompositeSettingsLegacyDatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __70__HMDCompositeSettingsLegacyDatabaseAdapter_stopObservingModelWithID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "localZone");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:forModelWithID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __71__HMDCompositeSettingsLegacyDatabaseAdapter_startObservingModelWithID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "zoneManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:forModelWithID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
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
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting legacy database adapter with delegate %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "zoneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, v7);
  objc_msgSend(v7, "configurationFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke_6;
  v13[3] = &unk_24E795078;
  objc_copyWeak(&v14, (id *)buf);
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "addSuccessBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke_3;
  v12[3] = &unk_24E79BD80;
  v12[4] = *(_QWORD *)(a1 + 32);
  v11 = (id)objc_msgSend(v10, "addFailureBlock:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

void __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke_2;
  block[3] = &unk_24E79C240;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v3, block);

}

void __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database:didConfigureWithError:", *(_QWORD *)(a1 + 32), v4);

}

void __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "database:didConfigureWithError:", *(_QWORD *)(a1 + 32), 0);

}

@end
