@implementation HMDHH2AutoMigrationMonitor

- (HMDHH2AutoMigrationMonitor)initWithHomeManager:(id)a3 eligibilityChecker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDBackgroundSystemTaskScheduler *v9;
  HMDFeaturesDataSource *v10;
  void *v11;
  HMDHH2AutoMigrationMonitor *v12;

  v6 = a4;
  v7 = a3;
  +[HMDFMFHandler sharedHandler](HMDFMFHandler, "sharedHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(HMDBackgroundSystemTaskScheduler);
  v10 = objc_alloc_init(HMDFeaturesDataSource);
  objc_msgSend(v7, "logEventSubmitter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDHH2AutoMigrationMonitor initWithHomeManager:fmfHandler:backgroundTaskScheduler:eligibilityChecker:featuresDataSource:logEventSubmitter:](self, "initWithHomeManager:fmfHandler:backgroundTaskScheduler:eligibilityChecker:featuresDataSource:logEventSubmitter:", v7, v8, v9, v6, v10, v11);

  return v12;
}

- (HMDHH2AutoMigrationMonitor)initWithHomeManager:(id)a3 fmfHandler:(id)a4 backgroundTaskScheduler:(id)a5 eligibilityChecker:(id)a6 featuresDataSource:(id)a7 logEventSubmitter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HMDHH2AutoMigrationMonitor *v21;
  HMDHH2AutoMigrationMonitor *v22;
  HMDHH2AutoMigrationMonitor *result;
  HMDHH2AutoMigrationMonitor *v24;
  SEL v25;
  id obj;
  id v27;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  obj = a7;
  v18 = a7;
  v27 = a8;
  v19 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v15)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v16)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v17)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v18)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  v20 = v19;
  if (!v19)
  {
LABEL_15:
    v24 = (HMDHH2AutoMigrationMonitor *)_HMFPreconditionFailure();
    -[HMDHH2AutoMigrationMonitor startMonitoring](v24, v25);
    return result;
  }
  v28.receiver = self;
  v28.super_class = (Class)HMDHH2AutoMigrationMonitor;
  v21 = -[HMDHH2AutoMigrationMonitor init](&v28, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_homeManager, v14);
    objc_storeStrong((id *)&v22->_fmfHandler, a4);
    objc_storeStrong((id *)&v22->_taskScheduler, a5);
    objc_storeStrong((id *)&v22->_eligibilityChecker, a6);
    objc_storeStrong((id *)&v22->_featuresDataSource, obj);
    objc_storeStrong((id *)&v22->_logEventSubmitter, v27);
  }

  return v22;
}

- (void)startMonitoring
{
  void *v3;
  HMDHH2AutoMigrationMonitor *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  id Property;
  void *v9;
  HMDHH2AutoMigrationMonitor *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Asked to start monitoring for HH2 auto-migration", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  if (v4)
    Property = objc_getProperty(v4, v7, 16, 1);
  else
    Property = 0;
  if (objc_msgSend(Property, "isThisDesignatedFMFDevice"))
  {
    -[HMDHH2AutoMigrationMonitor _registerForBackgroundTask]((uint64_t)v4);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v4;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Not registering for background task because this device is not designated FMF device", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v15 = objc_getProperty(v4, v13, 16, 1);
  else
    v15 = 0;
  objc_msgSend(v14, "addObserver:selector:name:object:", v4, sel_handleFMFStatusUpdatedNotification_, CFSTR("HMDFMFStatusUpdateNotification"), v15);

}

- (void)stopMonitoring
{
  void *v3;
  HMDHH2AutoMigrationMonitor *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  void *v8;
  id Property;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Asked to stop monitoring for HH2 auto-migration", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    Property = objc_getProperty(v4, v7, 16, 1);
  else
    Property = 0;
  objc_msgSend(v8, "removeObserver:name:object:", v4, CFSTR("HMDFMFStatusUpdateNotification"), Property);

  -[HMDHH2AutoMigrationMonitor _unregisterForBackgroundTask]((uint64_t)v4);
}

- (void)attemptAutoMigrationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  HMDHH2AutoMigrationMonitor *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to attempt auto migration", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHH2AutoMigrationMonitor _attemptAutoMigrationWithCompletionHandler:](v6, v4);

}

- (void)handleFMFStatusUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDHH2AutoMigrationMonitor *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDFMF fmfStatusWithDict:](HMDFMF, "fmfStatusWithDict:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@FMF status changed to %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (objc_msgSend(v6, "value") == 2)
      -[HMDHH2AutoMigrationMonitor _registerForBackgroundTask]((uint64_t)v8);
    else
      -[HMDHH2AutoMigrationMonitor _unregisterForBackgroundTask]((uint64_t)v8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find FMF status in notification user info: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_eligibilityChecker, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_fmfHandler, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (void)_registerForBackgroundTask
{
  id WeakRetained;
  NSObject *v3;
  _QWORD block[5];

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__HMDHH2AutoMigrationMonitor__registerForBackgroundTask__block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = a1;
    dispatch_async(v3, block);

  }
}

- (void)_unregisterForBackgroundTask
{
  id WeakRetained;
  NSObject *v3;
  _QWORD block[5];

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__HMDHH2AutoMigrationMonitor__unregisterForBackgroundTask__block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = a1;
    dispatch_async(v3, block);

  }
}

void __58__HMDHH2AutoMigrationMonitor__unregisterForBackgroundTask__block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  char v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 24, 1);
  v15 = 0;
  v4 = objc_msgSend(Property, "cancelTaskRequestWithIdentifier:error:", CFSTR("com.apple.homed.hh2.auto.migration"), &v15);
  v5 = v15;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = CFSTR("com.apple.homed.hh2.auto.migration");
      v11 = "%{public}@Canceled background task request with identifier: %@";
      v12 = v9;
      v13 = OS_LOG_TYPE_INFO;
      v14 = 22;
LABEL_8:
      _os_log_impl(&dword_1CD062000, v12, v13, v11, buf, v14);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v10;
    v18 = 2112;
    v19 = CFSTR("com.apple.homed.hh2.auto.migration");
    v20 = 2112;
    v21 = v5;
    v11 = "%{public}@Failed to cancel background task request with identifier %@: %@";
    v12 = v9;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 32;
    goto LABEL_8;
  }

  objc_autoreleasePoolPop(v6);
}

void __56__HMDHH2AutoMigrationMonitor__registerForBackgroundTask__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  id Property;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;
  __CFString *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  HMDBackgroundSystemTaskRequest *v19;
  double v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  id v26;
  char v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v5;
    v37 = 2114;
    v38 = CFSTR("com.apple.homed.hh2.auto.migration");
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Registering for background task with identifier: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  Property = *(id *)(a1 + 32);
  if (Property)
  {
    Property = objc_getProperty(Property, v6, 24, 1);
    v8 = *(id **)(a1 + 32);
  }
  else
  {
    v8 = 0;
  }
  v9 = Property;
  -[HMDHH2AutoMigrationMonitor homeManager](v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "workQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __56__HMDHH2AutoMigrationMonitor__registerForBackgroundTask__block_invoke_22;
  v34[3] = &unk_1E89B9460;
  v34[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.homed.hh2.auto.migration"), v11, v34);

  v13 = *(id *)(a1 + 32);
  if (v13)
    v13 = objc_getProperty(v13, v12, 24, 1);
  objc_msgSend(v13, "taskRequestForIdentifier:", CFSTR("com.apple.homed.hh2.auto.migration"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v18;
      v37 = 2114;
      v38 = v14;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Background task request already exists: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }
  else
  {
    v19 = -[HMDBackgroundSystemTaskRequest initWithIdentifier:]([HMDBackgroundSystemTaskRequest alloc], "initWithIdentifier:", CFSTR("com.apple.homed.hh2.auto.migration"));
    -[HMDBackgroundSystemTaskRequest setRequiresInexpensiveNetworkConnectivity:](v19, "setRequiresInexpensiveNetworkConnectivity:", 1);
    -[HMDBackgroundSystemTaskRequest setRequiresSignificantUserInactivity:](v19, "setRequiresSignificantUserInactivity:", 1);
    -[HMDBackgroundSystemTaskRequest setInterval:](v19, "setInterval:", 86400.0);
    -[HMDBackgroundSystemTaskRequest interval](v19, "interval");
    v21 = (void *)MEMORY[0x1D17BA0A0](-[HMDBackgroundSystemTaskRequest setMinDurationBetweenInstances:](v19, "setMinDurationBetweenInstances:", v20 * 0.8));
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v24;
      v37 = 2114;
      v38 = (const __CFString *)v19;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Submitting background task request: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v26 = *(id *)(a1 + 32);
    if (v26)
      v26 = objc_getProperty(v26, v25, 24, 1);
    v33 = 0;
    v27 = objc_msgSend(v26, "submitTaskRequest:error:", v19, &v33);
    v28 = v33;
    if ((v27 & 1) == 0)
    {
      v29 = (void *)MEMORY[0x1D17BA0A0]();
      v30 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v32;
        v37 = 2114;
        v38 = (const __CFString *)v19;
        v39 = 2114;
        v40 = v28;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to submit task request %{public}@: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v29);
    }

  }
}

- (id)homeManager
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
  return WeakRetained;
}

void __56__HMDHH2AutoMigrationMonitor__registerForBackgroundTask__block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  HMDXPCActivityRunReportLogEvent *v5;
  id Property;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v5 = -[HMDXPCActivityRunReportLogEvent initWithActivityName:definedInterval:activityShouldWake:timeSinceLastRun:]([HMDXPCActivityRunReportLogEvent alloc], "initWithActivityName:definedInterval:activityShouldWake:timeSinceLastRun:", CFSTR("com.apple.homed.hh2.auto.migration"), 0, 86400.0, 0.0);
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v4, 48, 1);
  objc_msgSend(Property, "submitLogEvent:", v5);
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HMDHH2AutoMigrationMonitor__registerForBackgroundTask__block_invoke_2;
  v9[3] = &unk_1E89C02B8;
  v10 = v3;
  v8 = v3;
  -[HMDHH2AutoMigrationMonitor _attemptAutoMigrationWithCompletionHandler:](v7, v9);

}

uint64_t __56__HMDHH2AutoMigrationMonitor__registerForBackgroundTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTaskCompleted");
}

- (void)_attemptAutoMigrationWithCompletionHandler:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  SEL v8;
  id Property;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = a1;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting auto migration", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    Property = objc_getProperty(v5, v8, 32, 1);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__HMDHH2AutoMigrationMonitor__attemptAutoMigrationWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E89B9488;
    v10[4] = v5;
    v11 = v3;
    objc_msgSend(Property, "fetchIsCurrentUserEligibleForAutoMigrationWithCompletion:", v10);

  }
}

void __73__HMDHH2AutoMigrationMonitor__attemptAutoMigrationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  BOOL v22;
  _BOOL4 v23;
  void *v24;
  const char *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  const char *v36;
  id Property;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  __CFString *v72;
  id v73;
  _QWORD v74[5];
  id v75;
  _QWORD v76[5];
  id v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[HMDHH2AutoMigrationMonitor homeManager](*(id **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v29;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Not starting HH2 migration because home manager reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    -[HMDHH2AutoMigrationMonitor submitStartMigrationEventWithAutoMigration:](*(void **)(a1 + 32), 1);
    v30 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v31 = objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  if ((objc_msgSend(v3, "isEligible") & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v35;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Not starting HH2 migration because current user is not eligible, but will check whether we can do dry run or not", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v36, 40, 1);
    if ((objc_msgSend(Property, "isHH2MigrationDryRunEnabled") & 1) != 0)
    {
      objc_msgSend(v4, "homes");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count");

      if (v39)
      {
        -[HMDHH2AutoMigrationMonitor submitStartMigrationEventWithAutoMigration:](*(void **)(a1 + 32), 0);
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __73__HMDHH2AutoMigrationMonitor__attemptAutoMigrationWithCompletionHandler___block_invoke_29;
        v76[3] = &unk_1E89BFC88;
        v40 = *(void **)(a1 + 40);
        v76[4] = *(_QWORD *)(a1 + 32);
        v77 = v40;
        objc_msgSend(v4, "dryRunHH2MigrationWithCompletionHandler:", v76);
        v41 = v77;
        goto LABEL_44;
      }
      v68 = (void *)MEMORY[0x1D17BA0A0]();
      v69 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v71;
        _os_log_impl(&dword_1CD062000, v70, OS_LOG_TYPE_INFO, "%{public}@Not running dry run on empty account as it will fail in absence of keyed archive", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v68);
      -[HMDHH2AutoMigrationMonitor submitStartMigrationEventWithAutoMigration:](*(void **)(a1 + 32), 0);
      v46 = *(void **)(a1 + 32);
      v47 = (void *)MEMORY[0x1E0CB35C8];
      v48 = 2720;
    }
    else
    {
      v42 = (void *)MEMORY[0x1D17BA0A0]();
      v43 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v45;
        _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@Not starting \"HH2 Dry Run Migration\" because Dry Run is disabled", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v42);
      -[HMDHH2AutoMigrationMonitor submitStartMigrationEventWithAutoMigration:](*(void **)(a1 + 32), 0);
      v46 = *(void **)(a1 + 32);
      v47 = (void *)MEMORY[0x1E0CB35C8];
      v48 = 2724;
    }
    objc_msgSend(v47, "hmPrivateErrorWithCode:", v48);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v46;
    v65 = 0;
    goto LABEL_49;
  }
  v5 = *(void **)(a1 + 32);
  if (!v5)
  {
    v23 = 0;
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "softwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v49 = (void *)MEMORY[0x1D17BA0A0]();
    v50 = v5;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v52;
      _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_FAULT, "%{public}@Should not get here, skipping auto migration due to missing build version", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v49);
    v23 = 1;
    goto LABEL_35;
  }
  +[HMDHH2MigrationStateLogger autoMigrationAttempt](HMDHH2MigrationStateLogger, "autoMigrationAttempt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v53 = (void *)MEMORY[0x1D17BA0A0]();
    v54 = v5;
    HMFGetOSLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v56 = v3;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = v57;
      v80 = 2114;
      v81 = v8;
      _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_INFO, "%{public}@First auto migration attempt for build %{public}@", buf, 0x16u);

      v3 = v56;
    }

    objc_autoreleasePoolPop(v53);
    v23 = 0;
    goto LABEL_34;
  }
  v73 = v3;
  v10 = isInternalBuild();
  v11 = CFSTR("hh2AutoMigrationMaxAttempts");
  if (v10)
    v11 = CFSTR("hh2InternalAutoMigrationMaxAttempts");
  v12 = v11;
  v13 = objc_msgSend(v9, "integerValue");
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v12;
  objc_msgSend(v14, "preferenceForKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = v5;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  v22 = v13 < v17;
  v23 = v13 >= v17;
  if (v22)
  {
    if (v21)
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v79 = v24;
      v80 = 2114;
      v81 = v9;
      v82 = 2114;
      v83 = v8;
      v25 = "%{public}@Last auto migration attempt count %{public}@ for current build %{public}@";
      goto LABEL_32;
    }
  }
  else if (v21)
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v79 = v24;
    v80 = 2114;
    v81 = v9;
    v82 = 2114;
    v83 = v8;
    v25 = "%{public}@Maximum auto migration attempts (%{public}@) reached for current build %{public}@";
LABEL_32:
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, v25, buf, 0x20u);

  }
  objc_autoreleasePoolPop(v18);

  v3 = v73;
LABEL_34:

LABEL_35:
LABEL_36:
  v58 = (void *)MEMORY[0x1D17BA0A0]();
  v59 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = os_log_type_enabled(v60, OS_LOG_TYPE_INFO);
  if (v23)
  {
    if (v61)
    {
      HMFGetLogIdentifier();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v62;
      _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_INFO, "%{public}@Will not perform HH2 auto migration since we are at maximum number of attempts", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v58);
    -[HMDHH2AutoMigrationMonitor submitStartMigrationEventWithAutoMigration:](*(void **)(a1 + 32), 1);
    v30 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2733);
    v31 = objc_claimAutoreleasedReturnValue();
LABEL_40:
    v63 = (void *)v31;
    v64 = v30;
    v65 = 1;
LABEL_49:
    -[HMDHH2AutoMigrationMonitor submitEndMigrationEventWithAutoMigration:error:](v64, v65, v63);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_50;
  }
  if (v61)
  {
    HMFGetLogIdentifier();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v79 = v66;
    _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_INFO, "%{public}@Starting HH2 migration because current user is eligible", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v58);
  -[HMDHH2AutoMigrationMonitor submitStartMigrationEventWithAutoMigration:](*(void **)(a1 + 32), 1);
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __73__HMDHH2AutoMigrationMonitor__attemptAutoMigrationWithCompletionHandler___block_invoke_31;
  v74[3] = &unk_1E89BFC88;
  v67 = *(void **)(a1 + 40);
  v74[4] = *(_QWORD *)(a1 + 32);
  v75 = v67;
  objc_msgSend(v4, "autoMigrateToHH2WithCompletionHandler:", v74);
  v41 = v75;
LABEL_44:

LABEL_50:
}

- (void)submitStartMigrationEventWithAutoMigration:(void *)a1
{
  SEL v3;
  id v4;

  if (a1)
  {
    v4 = -[HMDHH2MigrationDailyTotalsLogEvent initStartWithAutoMigration:dryRun:attemptCount:]([HMDHH2MigrationDailyTotalsLogEvent alloc], "initStartWithAutoMigration:dryRun:attemptCount:", a2, a2 ^ 1, 0);
    objc_msgSend(objc_getProperty(a1, v3, 48, 1), "submitLogEvent:", v4);

  }
}

- (void)submitEndMigrationEventWithAutoMigration:(void *)a3 error:
{
  id v5;
  HMDHH2MigrationDailyTotalsLogEvent *v6;
  void *v7;
  SEL v8;
  id v9;

  if (a1)
  {
    v5 = a3;
    v6 = [HMDHH2MigrationDailyTotalsLogEvent alloc];
    +[HMDHH2MigrationStateLogger autoMigrationAttempt](HMDHH2MigrationStateLogger, "autoMigrationAttempt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDHH2MigrationDailyTotalsLogEvent initEndWithAutoMigration:dryRun:attemptCount:error:](v6, "initEndWithAutoMigration:dryRun:attemptCount:error:", a2, a2 ^ 1, v7, v5);

    objc_msgSend(objc_getProperty(a1, v8, 48, 1), "submitLogEvent:", v9);
  }
}

void __73__HMDHH2AutoMigrationMonitor__attemptAutoMigrationWithCompletionHandler___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
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
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to start HH2 dry run migration: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDHH2AutoMigrationMonitor submitEndMigrationEventWithAutoMigration:error:](*(void **)(a1 + 32), 0, v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully started HH2 Dry run migration", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __73__HMDHH2AutoMigrationMonitor__attemptAutoMigrationWithCompletionHandler___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void (*v16)(void);
  void *v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v3;
    v7 = v6;
    if (!v5)
      goto LABEL_16;
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB8C70]);

    if (!v9)
      goto LABEL_16;
    v10 = objc_msgSend(v7, "code");
    if ((unint64_t)(v10 - 2704) > 0x17)
      goto LABEL_16;
    if (((1 << (v10 + 112)) & 0xC00102) != 0)
    {

      goto LABEL_18;
    }
    if (v10 == 2704)
    {
      objc_msgSend(v7, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      v21 = isTransientCloudKitError(v20);
      if ((v21 & 1) != 0)
      {
LABEL_18:
        v22 = (void *)MEMORY[0x1D17BA0A0](v11);
        v23 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543618;
          v27 = v25;
          v28 = 2114;
          v29 = v7;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to start HH2 migration: %{public}@", (uint8_t *)&v26, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        -[HMDHH2AutoMigrationMonitor submitEndMigrationEventWithAutoMigration:error:](*(void **)(a1 + 32), 1, v7);
        v16 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        goto LABEL_21;
      }
    }
    else
    {
LABEL_16:

    }
    v11 = +[HMDHH2MigrationStateLogger incrementAutoMigrationAttempt](HMDHH2MigrationStateLogger, "incrementAutoMigrationAttempt");
    goto LABEL_18;
  }
  v12 = (void *)MEMORY[0x1D17BA0A0](+[HMDHH2MigrationStateLogger incrementAutoMigrationAttempt](HMDHH2MigrationStateLogger, "incrementAutoMigrationAttempt"));
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543362;
    v27 = v15;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Successfully started HH2 migration", (uint8_t *)&v26, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
  v16 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_21:
  v16();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28_144963 != -1)
    dispatch_once(&logCategory__hmf_once_t28_144963, &__block_literal_global_144964);
  return (id)logCategory__hmf_once_v29_144965;
}

void __41__HMDHH2AutoMigrationMonitor_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v29_144965;
  logCategory__hmf_once_v29_144965 = v0;

}

@end
