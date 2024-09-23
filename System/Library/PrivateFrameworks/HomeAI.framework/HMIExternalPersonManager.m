@implementation HMIExternalPersonManager

- (HMIExternalPersonManager)initWithUUID:(id)a3 homeUUID:(id)a4
{
  HMIExternalPersonManager *v4;
  NSOperationQueue *v5;
  NSOperationQueue *operationQueue;
  uint64_t v7;
  HMFTimer *watchdogTimer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMIExternalPersonManager;
  v4 = -[HMIPersonManager initWithUUID:homeUUID:](&v10, sel_initWithUUID_homeUUID_, a3, a4);
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v4->_operationQueue;
    v4->_operationQueue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 28, 5.0);
    watchdogTimer = v4->_watchdogTimer;
    v4->_watchdogTimer = (HMFTimer *)v7;

    -[HMFTimer setDelegate:](v4->_watchdogTimer, "setDelegate:", v4);
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)setDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMIExternalPersonManager *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_dataSource, v4);
  os_unfair_lock_unlock(&self->_lock);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F148]), "initWithTimeout:", 0.0);
    objc_initWeak(location, v5);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__HMIExternalPersonManager_setDataSource___block_invoke;
    v11[3] = &unk_24DBE9F40;
    objc_copyWeak(&v13, location);
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v5, "addExecutionBlock:", v11);
    -[HMIExternalPersonManager operationQueue](self, "operationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addOperation:", v5);

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);

  }
  else
  {
    v7 = (void *)MEMORY[0x220735570]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v10;
      _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received nil data source", (uint8_t *)location, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __42__HMIExternalPersonManager_setDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)MEMORY[0x220735570]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching settings using data source: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__HMIExternalPersonManager_setDataSource___block_invoke_3;
  v10[3] = &unk_24DBECE38;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = WeakRetained;
  v9 = WeakRetained;
  objc_msgSend(v8, "fetchSettingsWithCompletion:", v10);

}

void __42__HMIExternalPersonManager_setDataSource___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateSettings:", v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x220735570]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error fetching settings: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  objc_msgSend(*(id *)(a1 + 40), "finish");

}

- (HMIExternalPersonManagerSettings)settings
{
  os_unfair_lock_s *p_lock;
  HMIExternalPersonManagerSettings *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_settings;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)handleUpdatedPerson:(id)a3
{
  id v4;
  void *v5;
  HMIExternalPersonManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleUpdatedPerson: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIExternalPersonManager watchdogTimer](v6, "watchdogTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)handleUpdatedPersonFaceCrop:(id)a3
{
  id v4;
  void *v5;
  HMIExternalPersonManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleUpdatedPersonFaceCrop: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIExternalPersonManager watchdogTimer](v6, "watchdogTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)handleUpdatedFaceprint:(id)a3
{
  id v4;
  void *v5;
  HMIExternalPersonManager *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleUpdatedFaceprint: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)handleUpdatedSettings:(id)a3
{
  id v4;
  void *v5;
  HMIExternalPersonManager *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_INFO, "%{public}@handleUpdatedSettings: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIExternalPersonManager _updateSettings:](v6, "_updateSettings:", v4);

}

- (void)handleRemovedPersonWithUUID:(id)a3
{
  id v4;
  void *v5;
  HMIExternalPersonManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleRemovedPersonWithUUID: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIExternalPersonManager watchdogTimer](v6, "watchdogTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)handleRemovedFaceCropWithUUID:(id)a3
{
  id v4;
  void *v5;
  HMIExternalPersonManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleRemovedFaceCropWithUUID: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIExternalPersonManager watchdogTimer](v6, "watchdogTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)handleRemovedFaceprintWithUUID:(id)a3
{
  id v4;
  void *v5;
  HMIExternalPersonManager *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleRemovedFaceprintWithUUID: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  HMIExternalPersonManager *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  HMIUpdatePersonsModelOperation *v12;
  void *v13;
  void *v14;
  HMIUpdatePersonsModelOperation *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = -[HMIPersonManager isPersonDataAvailableViaHomeKit](self, "isPersonDataAvailableViaHomeKit");
  v7 = (void *)MEMORY[0x220735570]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v11;
      _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_INFO, "%{public}@Timer fired, updating external persons model", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v12 = [HMIUpdatePersonsModelOperation alloc];
    -[HMIPersonManager UUID](v8, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIPersonManager homeUUID](v8, "homeUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMIUpdatePersonsModelOperation initWithSourceUUID:homeUUID:external:](v12, "initWithSourceUUID:homeUUID:external:", v13, v14, 1);

    -[HMIExternalPersonManager operationQueue](v8, "operationQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperation:", v15);

    -[HMIExternalPersonManager watchdogTimer](v8, "watchdogTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "suspend");

  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_INFO, "%{public}@Timer fired, but person data is not yet available, waiting...", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMIExternalPersonManager watchdogTimer](v8, "watchdogTimer");
    v15 = (HMIUpdatePersonsModelOperation *)objc_claimAutoreleasedReturnValue();
    -[HMIUpdatePersonsModelOperation resume](v15, "resume");
  }

  objc_autoreleasePoolPop(v5);
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMIPersonManager UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIPersonManager homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("UUID:%@ HomeUUID:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateSettings:(id)a3
{
  id v5;
  void *v6;
  HMIExternalPersonManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMIExternalPersonManager *v11;
  NSObject *v12;
  void *v13;
  HMIRemovePersonsModelOperation *v14;
  void *v15;
  HMIExternalPersonManager *v16;
  NSObject *v17;
  void *v18;
  HMIRemovePersonsModelOperation *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x220735570]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v9;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating with settings: %@", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&v7->_settings, a3);
  os_unfair_lock_unlock(&v7->_lock);
  if (v5 && (objc_msgSend(v5, "isImportingFromPhotoLibraryEnabled") & 1) != 0)
  {
    v10 = (void *)MEMORY[0x220735570]();
    v11 = v7;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v13;
      _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_INFO, "%{public}@Settings have enabled face classification, updating external persons model", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMIExternalPersonManager watchdogTimer](v11, "watchdogTimer");
    v14 = (HMIRemovePersonsModelOperation *)objc_claimAutoreleasedReturnValue();
    -[HMIRemovePersonsModelOperation resume](v14, "resume");
  }
  else
  {
    v15 = (void *)MEMORY[0x220735570]();
    v16 = v7;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v18;
      _os_log_impl(&dword_219D45000, v17, OS_LOG_TYPE_INFO, "%{public}@Settings have disabled face classification, removing external persons model", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v19 = [HMIRemovePersonsModelOperation alloc];
    -[HMIPersonManager UUID](v16, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIPersonManager homeUUID](v16, "homeUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMIRemovePersonsModelOperation initWithSourceUUID:homeUUID:external:](v19, "initWithSourceUUID:homeUUID:external:", v20, v21, 1);

    -[HMIExternalPersonManager operationQueue](v16, "operationQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addOperation:", v14);

  }
}

- (HMIExternalPersonManagerDataSource)dataSource
{
  return (HMIExternalPersonManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 64, 1);
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
