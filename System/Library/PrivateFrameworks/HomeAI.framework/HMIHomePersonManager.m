@implementation HMIHomePersonManager

- (HMIHomePersonManager)initWithUUID:(id)a3 homeUUID:(id)a4
{
  HMIHomePersonManager *v4;
  NSOperationQueue *v5;
  NSOperationQueue *operationQueue;
  uint64_t v7;
  HMFTimer *watchdogTimer;
  uint64_t v9;
  HMFTimer *analyticsTimer;
  uint64_t v11;
  NSMutableDictionary *unknownFacesSavedCounts;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HMIHomePersonManager;
  v4 = -[HMIPersonManager initWithUUID:homeUUID:](&v14, sel_initWithUUID_homeUUID_, a3, a4);
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
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 12, 3600.0);
    analyticsTimer = v4->_analyticsTimer;
    v4->_analyticsTimer = (HMFTimer *)v9;

    -[HMFTimer setDelegate:](v4->_analyticsTimer, "setDelegate:", v4);
    -[HMFTimer resume](v4->_analyticsTimer, "resume");
    v4->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    unknownFacesSavedCounts = v4->_unknownFacesSavedCounts;
    v4->_unknownFacesSavedCounts = (NSMutableDictionary *)v11;

  }
  return v4;
}

- (void)setDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMIHomePersonManager *v8;
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
    v11[2] = __38__HMIHomePersonManager_setDataSource___block_invoke;
    v11[3] = &unk_24DBE9F40;
    objc_copyWeak(&v13, location);
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v5, "addExecutionBlock:", v11);
    -[HMIHomePersonManager operationQueue](self, "operationQueue");
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

void __38__HMIHomePersonManager_setDataSource___block_invoke(uint64_t a1)
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
  v10[2] = __38__HMIHomePersonManager_setDataSource___block_invoke_4;
  v10[3] = &unk_24DBE9F18;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = WeakRetained;
  v9 = WeakRetained;
  objc_msgSend(v8, "fetchSettingsWithCompletion:", v10);

}

void __38__HMIHomePersonManager_setDataSource___block_invoke_4(uint64_t a1, void *a2, void *a3)
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

- (HMIHomePersonManagerSettings)settings
{
  os_unfair_lock_s *p_lock;
  HMIHomePersonManagerSettings *v4;

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
  HMIHomePersonManager *v6;
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
  -[HMIHomePersonManager watchdogTimer](v6, "watchdogTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)handleUpdatedUnassociatedFaceCrop:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonManager *v6;
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
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleUpdatedUnassociatedFaceCrop: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)handleUpdatedPersonFaceCrop:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonManager *v6;
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
  -[HMIHomePersonManager watchdogTimer](v6, "watchdogTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)handleUpdatedFaceprint:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonManager *v6;
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
  HMIHomePersonManager *v6;
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
  -[HMIHomePersonManager _updateSettings:](v6, "_updateSettings:", v4);

}

- (void)handleRemovedPersonWithUUID:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonManager *v6;
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
  -[HMIHomePersonManager watchdogTimer](v6, "watchdogTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)handleRemovedFaceCropWithUUID:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonManager *v6;
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
  -[HMIHomePersonManager watchdogTimer](v6, "watchdogTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)handleRemovedFaceprintWithUUID:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonManager *v6;
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

- (void)handleMisclassifiedPersonForFaceCrop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMIHomePersonManager *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  int v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[HMITaskService taskServiceClient](HMITaskService, "taskServiceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = HMITaskTypeFaceMisclassificationTask;
  v18[0] = CFSTR("taskType");
  v18[1] = CFSTR("homeUUID");
  -[HMIPersonManager homeUUID](self, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = CFSTR("faceCrop");
  v19[1] = v6;
  v19[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__HMIHomePersonManager_handleMisclassifiedPersonForFaceCrop___block_invoke;
  v13[3] = &unk_24DBE9F68;
  v13[4] = self;
  v8 = objc_msgSend(v5, "submitTaskWithOptions:progressHandler:completionHandler:", v7, 0, v13);
  v9 = (void *)MEMORY[0x220735570]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v12;
    v16 = 1024;
    v17 = v8;
    _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_INFO, "%{public}@Submitted face misclassification task, taskID:%u", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v9);

}

void __61__HMIHomePersonManager_handleMisclassifiedPersonForFaceCrop___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resultCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HMITaskResultCodeAsString(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  v10 = (void *)MEMORY[0x220735570]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      v15 = "%{public}@Successfully handled face misclassification";
      v16 = v13;
      v17 = OS_LOG_TYPE_INFO;
      v18 = 12;
LABEL_6:
      _os_log_impl(&dword_219D45000, v16, v17, v15, (uint8_t *)&v19, v18);

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v14;
    v21 = 2112;
    v22 = v6;
    v15 = "%{public}@Error in handling face misclassification, error:%@";
    v16 = v13;
    v17 = OS_LOG_TYPE_ERROR;
    v18 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v10);
}

- (void)storeUnassociatedFaceCrop:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIStoreFaceCropOperation *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  -[HMIHomePersonManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[HMIStoreFaceCropOperation initWithDataSource:faceCrop:]([HMIStoreFaceCropOperation alloc], "initWithDataSource:faceCrop:", v8, v6);
    objc_initWeak(&location, v9);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__HMIHomePersonManager_storeUnassociatedFaceCrop_completion___block_invoke;
    v11[3] = &unk_24DBE9F90;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    -[HMIStoreFaceCropOperation setCompletionBlock:](v9, "setCompletionBlock:", v11);
    -[HMIHomePersonManager operationQueue](self, "operationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addOperation:", v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:", 1036);
    v9 = (HMIStoreFaceCropOperation *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, HMIStoreFaceCropOperation *))v7 + 2))(v7, v9);
  }

}

void __61__HMIHomePersonManager_storeUnassociatedFaceCrop_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

- (void)storeFaceprint:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIStoreFaceprintOperation *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  -[HMIHomePersonManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[HMIStoreFaceprintOperation initWithDataSource:faceprint:]([HMIStoreFaceprintOperation alloc], "initWithDataSource:faceprint:", v8, v6);
    objc_initWeak(&location, v9);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __50__HMIHomePersonManager_storeFaceprint_completion___block_invoke;
    v11[3] = &unk_24DBE9F90;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    -[HMIStoreFaceprintOperation setCompletionBlock:](v9, "setCompletionBlock:", v11);
    -[HMIHomePersonManager operationQueue](self, "operationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addOperation:", v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:", 1036);
    v9 = (HMIStoreFaceprintOperation *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, HMIStoreFaceprintOperation *))v7 + 2))(v7, v9);
  }

}

void __50__HMIHomePersonManager_storeFaceprint_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

- (void)handleNewFaceEvents:(id)a3
{
  __int128 v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  HMIHomePersonManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMIHomePersonManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  HMIHomePersonManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = a3;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v48;
    *(_QWORD *)&v4 = 138543874;
    v38 = v4;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v48 != v40)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v6, "faceRecognition", v38);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "classifications");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v46[0] = MEMORY[0x24BDAC760];
          v46[1] = 3221225472;
          v46[2] = __44__HMIHomePersonManager_handleNewFaceEvents___block_invoke;
          v46[3] = &unk_24DBE9FB8;
          v46[4] = self;
          objc_msgSend(v9, "na_firstObjectPassingTest:", v46);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            os_unfair_lock_lock_with_options();
            -[HMIHomePersonManager unknownFacesSavedCounts](self, "unknownFacesSavedCounts");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "sessionEntityUUID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
              v14 = objc_msgSend(v13, "intValue");
            else
              v14 = 0;

            os_unfair_lock_unlock(&self->_lock);
            if (v14 >= 0xA)
            {
              v32 = (void *)MEMORY[0x220735570]();
              v33 = self;
              HMFGetOSLogHandle();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "sessionEntityUUID");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMIPersonManager UUID](v33, "UUID");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v38;
                v52 = v35;
                v53 = 2112;
                v54 = v36;
                v55 = 2112;
                v56 = v37;
                _os_log_impl(&dword_219D45000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Reached face crop limit for sessionEntityUUID:%@ for HMIHomePersonManager.UUID:%@; not storing",
                  buf,
                  0x20u);

              }
              objc_autoreleasePoolPop(v32);
            }
            else
            {
              os_unfair_lock_lock_with_options();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14 + 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMIHomePersonManager unknownFacesSavedCounts](self, "unknownFacesSavedCounts");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "sessionEntityUUID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

              os_unfair_lock_unlock(&self->_lock);
              v23 = (void *)MEMORY[0x220735570]();
              v24 = self;
              HMFGetOSLogHandle();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "faceCrop");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "faceprint");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v38;
                v52 = v26;
                v53 = 2112;
                v54 = v27;
                v55 = 2112;
                v56 = v28;
                _os_log_impl(&dword_219D45000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Storing unknown to Home face crop:%@ and faceprint:%@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v23);
              objc_msgSend(v8, "faceCrop");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v44[0] = MEMORY[0x24BDAC760];
              v44[1] = 3221225472;
              v44[2] = __44__HMIHomePersonManager_handleNewFaceEvents___block_invoke_15;
              v44[3] = &unk_24DBE9FE0;
              v44[4] = v24;
              v30 = v8;
              v45 = v30;
              -[HMIHomePersonManager storeUnassociatedFaceCrop:completion:](v24, "storeUnassociatedFaceCrop:completion:", v29, v44);

              objc_msgSend(v30, "faceprint");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v42[0] = MEMORY[0x24BDAC760];
              v42[1] = 3221225472;
              v42[2] = __44__HMIHomePersonManager_handleNewFaceEvents___block_invoke_17;
              v42[3] = &unk_24DBE9FE0;
              v42[4] = v24;
              v43 = v30;
              -[HMIHomePersonManager storeFaceprint:completion:](v24, "storeFaceprint:completion:", v31, v42);

            }
          }
          else
          {
            v15 = (void *)MEMORY[0x220735570]();
            v16 = self;
            HMFGetOSLogHandle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMIPersonManager UUID](v16, "UUID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v38;
              v52 = v18;
              v53 = 2112;
              v54 = v19;
              v55 = 2112;
              v56 = v6;
              _os_log_impl(&dword_219D45000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Not storing face crop and faceprint for HMIHomePersonManager.UUID:%@ from face event:%@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v15);
          }

        }
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v41);
  }

}

uint64_t __44__HMIHomePersonManager_handleNewFaceEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "familiarity"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "sourceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", v6);

  }
  return v4;
}

void __44__HMIHomePersonManager_handleNewFaceEvents___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x220735570]();
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
      objc_msgSend(*(id *)(a1 + 40), "faceCrop");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      v10 = "%{public}@Error storing unassociated face crop:%@, error:%@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_219D45000, v11, v12, v10, (uint8_t *)&v14, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "faceCrop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v10 = "%{public}@Stored unassociated face crop:%@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __44__HMIHomePersonManager_handleNewFaceEvents___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x220735570]();
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
      objc_msgSend(*(id *)(a1 + 40), "faceprint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      v10 = "%{public}@Error storing faceprint:%@, error:%@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_219D45000, v11, v12, v10, (uint8_t *)&v14, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "faceprint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v10 = "%{public}@Stored faceprint:%@";
    v11 = v7;
    v12 = OS_LOG_TYPE_DEBUG;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  HMIHomePersonManager *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  void *v13;
  HMIHomePersonManager *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  HMIUpdatePersonsModelOperation *v18;
  void *v19;
  void *v20;
  HMIUpdatePersonsModelOperation *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  BOOL v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  void *v44;
  HMIHomePersonManager *v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  -[HMIHomePersonManager watchdogTimer](self, "watchdogTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v12 = -[HMIPersonManager isPersonDataAvailableViaHomeKit](self, "isPersonDataAvailableViaHomeKit");
    v13 = (void *)MEMORY[0x220735570]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v16)
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v17;
        _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_INFO, "%{public}@Timer fired, updating home persons model", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      v18 = [HMIUpdatePersonsModelOperation alloc];
      -[HMIPersonManager UUID](v14, "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIPersonManager homeUUID](v14, "homeUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HMIUpdatePersonsModelOperation initWithSourceUUID:homeUUID:external:](v18, "initWithSourceUUID:homeUUID:external:", v19, v20, 0);

      -[HMIHomePersonManager operationQueue](v14, "operationQueue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addOperation:", v21);

      -[HMIHomePersonManager watchdogTimer](v14, "watchdogTimer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "suspend");

    }
    else
    {
      if (v16)
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v38;
        _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_INFO, "%{public}@Timer fired, but person data is not yet available, waiting...", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      -[HMIHomePersonManager watchdogTimer](v14, "watchdogTimer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "resume");

    }
  }
  else
  {
    -[HMIHomePersonManager analyticsTimer](self, "analyticsTimer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v4)
    {
      v8 = (void *)MEMORY[0x220735570]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v11;
        v49 = 2112;
        v50 = v4;
        _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized timer: %@", buf, 0x16u);

      }
LABEL_20:

      objc_autoreleasePoolPop(v8);
      goto LABEL_21;
    }
    -[HMIHomePersonManager settings](self, "settings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isFaceClassificationEnabled");

    if (v25)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleForKey:", CFSTR("HMICoreAnalyticsVIPModelReportTime"));
      v28 = v27;

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceReferenceDate");
      v31 = v30 - v28 >= 86400.0;

      v8 = (void *)MEMORY[0x220735570]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
      if (!v31)
      {
        if (v32)
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v48 = v40;
          _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_INFO, "%{public}@Not triggering daily VIP Model Core Analytics event, last event was sent less than 1 day ago", buf, 0xCu);

        }
        goto LABEL_20;
      }
      if (v32)
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v33;
        _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_INFO, "%{public}@Triggering daily VIP Model Core Analytics event", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeIntervalSinceReferenceDate");
      objc_msgSend(v34, "setDouble:forKey:", CFSTR("HMICoreAnalyticsVIPModelReportTime"));

      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F148]), "initWithTimeout:", 0.0);
      objc_initWeak((id *)buf, v36);
      v41 = MEMORY[0x24BDAC760];
      v42 = 3221225472;
      v43 = __37__HMIHomePersonManager_timerDidFire___block_invoke;
      v44 = &unk_24DBEA030;
      objc_copyWeak(&v46, (id *)buf);
      v45 = v9;
      objc_msgSend(v36, "addExecutionBlock:", &v41);
      -[HMIHomePersonManager operationQueue](v9, "operationQueue", v41, v42, v43, v44);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addOperation:", v36);

      objc_destroyWeak(&v46);
      objc_destroyWeak((id *)buf);

    }
  }
LABEL_21:
  objc_autoreleasePoolPop(v5);

}

void __37__HMIHomePersonManager_timerDidFire___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[HMITaskService taskServiceClient](HMITaskService, "taskServiceClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = HMITaskTypePersonsModelsSummaryTask;
  v23[0] = CFSTR("taskType");
  v23[1] = CFSTR("homeUUID");
  objc_msgSend(*(id *)(a1 + 32), "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __37__HMIHomePersonManager_timerDidFire___block_invoke_2;
  v17[3] = &unk_24DBEA008;
  v17[4] = *(_QWORD *)(a1 + 32);
  v6 = WeakRetained;
  v18 = v6;
  v7 = objc_msgSend(v3, "submitTaskWithOptions:progressHandler:completionHandler:", v5, 0, v17);
  v8 = v7;
  v13 = (void *)MEMORY[0x220735570](v7, v9, v10, v11, v12);
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v16;
    v21 = 1024;
    v22 = v8;
    _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_INFO, "%{public}@Submitted persons model summary task, taskID:%u", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v13);

}

void __37__HMIHomePersonManager_timerDidFire___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resultCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HMITaskResultCodeAsString(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  v10 = (void *)MEMORY[0x220735570]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v14;
      _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully ran persons model summary task", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 40), "finish");
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to run persons model summary task, error:%@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 40), "cancelWithError:", v6);
  }

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
  HMIHomePersonManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMIHomePersonManager *v11;
  NSObject *v12;
  void *v13;
  HMIRemovePersonsModelOperation *v14;
  void *v15;
  HMIHomePersonManager *v16;
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
  if (v5 && (objc_msgSend(v5, "isFaceClassificationEnabled") & 1) != 0)
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
      _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_INFO, "%{public}@Settings have enabled face classification, updating home persons model", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMIHomePersonManager watchdogTimer](v11, "watchdogTimer");
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
      _os_log_impl(&dword_219D45000, v17, OS_LOG_TYPE_INFO, "%{public}@Settings have disabled face classification, removing home persons model", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v19 = [HMIRemovePersonsModelOperation alloc];
    -[HMIPersonManager UUID](v16, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIPersonManager homeUUID](v16, "homeUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMIRemovePersonsModelOperation initWithSourceUUID:homeUUID:external:](v19, "initWithSourceUUID:homeUUID:external:", v20, v21, 0);

    -[HMIHomePersonManager operationQueue](v16, "operationQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addOperation:", v14);

  }
}

- (HMIHomePersonManagerDataSource)dataSource
{
  return (HMIHomePersonManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 64, 1);
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 72, 1);
}

- (HMFTimer)analyticsTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableDictionary)unknownFacesSavedCounts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFacesSavedCounts, 0);
  objc_storeStrong((id *)&self->_analyticsTimer, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
