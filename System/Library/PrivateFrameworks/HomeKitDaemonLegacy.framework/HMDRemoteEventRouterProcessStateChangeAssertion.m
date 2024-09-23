@implementation HMDRemoteEventRouterProcessStateChangeAssertion

- (HMDRemoteEventRouterProcessStateChangeAssertion)initWithQueue:(id)a3 timerProvider:(id)a4 applicationsAndIntervals:(id)a5 dataSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDRemoteEventRouterProcessStateChangeAssertion *v15;
  HMDRemoteEventRouterProcessStateChangeAssertion *v16;
  HMFCancellable *eventRouterActiveAssertion;
  uint64_t v18;
  NSMutableSet *foregroundProcesses;
  uint64_t v20;
  NSMutableDictionary *backgroundProcesses;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDRemoteEventRouterProcessStateChangeAssertion;
  v15 = -[HMDRemoteEventRouterProcessStateChangeAssertion init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeWeak((id *)&v16->_timerProvider, v12);
    objc_storeStrong((id *)&v16->_applicationsAndIntervals, a5);
    objc_storeWeak((id *)&v16->_dataSource, v14);
    eventRouterActiveAssertion = v16->_eventRouterActiveAssertion;
    v16->_eventRouterActiveAssertion = 0;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v13, "count"));
    foregroundProcesses = v16->_foregroundProcesses;
    v16->_foregroundProcesses = (NSMutableSet *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v13, "count"));
    backgroundProcesses = v16->_backgroundProcesses;
    v16->_backgroundProcesses = (NSMutableDictionary *)v20;

  }
  return v16;
}

- (void)foregroundStateChangedWithBundleIdentifier:(id)a3 applicationState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMDRemoteEventRouterProcessStateChangeAssertion *v11;
  NSObject *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  _QWORD block[5];
  id v17;
  unint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDRemoteEventRouterProcessStateChangeAssertion applicationsAndIntervals](self, "applicationsAndIntervals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDRemoteEventRouterProcessStateChangeAssertion queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__HMDRemoteEventRouterProcessStateChangeAssertion_foregroundStateChangedWithBundleIdentifier_applicationState___block_invoke;
    block[3] = &unk_1E89BE2F0;
    block[4] = self;
    v17 = v6;
    v18 = a4;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 > 4)
        v14 = CFSTR("unknown");
      else
        v14 = off_1E89B7558[a4];
      v15 = v14;
      *(_DWORD *)buf = 138543874;
      v20 = v13;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Ignoring foreground state change for application %@ with state: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (id)_enableBackgroundTimerWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  HMDRemoteEventRouterProcessStateChangeAssertion *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  HMDRemoteEventRouterProcessStateChangeAssertion *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDRemoteEventRouterProcessStateChangeAssertion queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDRemoteEventRouterProcessStateChangeAssertion applicationsAndIntervals](self, "applicationsAndIntervals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  -[HMDRemoteEventRouterProcessStateChangeAssertion timerProvider](self, "timerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProcessStateChangeAssertion queue](self, "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __94__HMDRemoteEventRouterProcessStateChangeAssertion__enableBackgroundTimerWithBundleIdentifier___block_invoke;
  v28 = &unk_1E89C2328;
  v29 = self;
  v12 = v4;
  v30 = v12;
  objc_msgSend(v10, "timerWithQueue:interval:timerFireHandler:", v11, &v25, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1D17BA0A0](v14, v15, v16, v17, v18);
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9, v25, v26, v27, v28, v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v22;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v23;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Starting backgroundTimer: %@ interval: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v19);
  objc_msgSend(v13, "resume");

  return v13;
}

- (void)_removeBackgroundTimer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDRemoteEventRouterProcessStateChangeAssertion *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDRemoteEventRouterProcessStateChangeAssertion queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Remove backgroundTimer: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "suspend");

  }
}

- (void)_backgroundTimerDidExpire:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDRemoteEventRouterProcessStateChangeAssertion *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDRemoteEventRouterProcessStateChangeAssertion *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  HMDRemoteEventRouterProcessStateChangeAssertion *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDRemoteEventRouterProcessStateChangeAssertion queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDRemoteEventRouterProcessStateChangeAssertion backgroundProcesses](self, "backgroundProcesses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543874;
    v32 = v11;
    v33 = 2112;
    v34 = v4;
    v35 = 2112;
    v36 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@bundleIdentifier: %@ backgroundTimer: %@ expired.", (uint8_t *)&v31, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    -[HMDRemoteEventRouterProcessStateChangeAssertion _removeBackgroundTimer:](v9, "_removeBackgroundTimer:", v7);
    -[HMDRemoteEventRouterProcessStateChangeAssertion backgroundProcesses](v9, "backgroundProcesses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v4);

  }
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = v9;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteEventRouterProcessStateChangeAssertion foregroundProcesses](v14, "foregroundProcesses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteEventRouterProcessStateChangeAssertion backgroundProcesses](v14, "backgroundProcesses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543874;
    v32 = v16;
    v33 = 2112;
    v34 = v17;
    v35 = 2112;
    v36 = v18;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@foregroundProcesses %@, backgroundProcesses %@", (uint8_t *)&v31, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDRemoteEventRouterProcessStateChangeAssertion foregroundProcesses](v14, "foregroundProcesses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "hmf_isEmpty"))
  {
    -[HMDRemoteEventRouterProcessStateChangeAssertion backgroundProcesses](v14, "backgroundProcesses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count") != 0;

  }
  else
  {
    v21 = 1;
  }

  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = v14;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteEventRouterProcessStateChangeAssertion eventRouterActiveAssertion](v23, "eventRouterActiveAssertion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543874;
    v32 = v25;
    v33 = 2112;
    v34 = v27;
    v35 = 2112;
    v36 = v28;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@self.isProcessForeground %@, isProcessForeground %@", (uint8_t *)&v31, 0x20u);

  }
  objc_autoreleasePoolPop(v22);
  if (!v21)
  {
    -[HMDRemoteEventRouterProcessStateChangeAssertion eventRouterActiveAssertion](v23, "eventRouterActiveAssertion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[HMDRemoteEventRouterProcessStateChangeAssertion eventRouterActiveAssertion](v23, "eventRouterActiveAssertion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "cancel");

      -[HMDRemoteEventRouterProcessStateChangeAssertion setEventRouterActiveAssertion:](v23, "setEventRouterActiveAssertion:", 0);
    }
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMETimerProvider)timerProvider
{
  return (HMETimerProvider *)objc_loadWeakRetained((id *)&self->_timerProvider);
}

- (HMDRemoteEventRouterProcessStateChangeAssertionDataSource)dataSource
{
  return (HMDRemoteEventRouterProcessStateChangeAssertionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSDictionary)applicationsAndIntervals
{
  return self->_applicationsAndIntervals;
}

- (NSMutableSet)foregroundProcesses
{
  return self->_foregroundProcesses;
}

- (NSMutableDictionary)backgroundProcesses
{
  return self->_backgroundProcesses;
}

- (HMFCancellable)eventRouterActiveAssertion
{
  return self->_eventRouterActiveAssertion;
}

- (void)setEventRouterActiveAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_eventRouterActiveAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventRouterActiveAssertion, 0);
  objc_storeStrong((id *)&self->_backgroundProcesses, 0);
  objc_storeStrong((id *)&self->_foregroundProcesses, 0);
  objc_storeStrong((id *)&self->_applicationsAndIntervals, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_timerProvider);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __94__HMDRemoteEventRouterProcessStateChangeAssertion__enableBackgroundTimerWithBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundTimerDidExpire:", *(_QWORD *)(a1 + 40));
}

void __111__HMDRemoteEventRouterProcessStateChangeAssertion_foregroundStateChangedWithBundleIdentifier_applicationState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    if (v6 > 4)
      v8 = CFSTR("unknown");
    else
      v8 = off_1E89B7558[v6];
    v9 = v8;
    v36 = 138543874;
    v37 = v5;
    v38 = 2112;
    v39 = v7;
    v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Application %@ state changed to %@", (uint8_t *)&v36, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  if ((*(_QWORD *)(a1 + 48) | 2) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "foregroundProcesses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "backgroundProcesses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "_removeBackgroundTimer:", v12);
      objc_msgSend(*(id *)(a1 + 32), "backgroundProcesses");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    }
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "eventRouterActiveAssertion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543618;
      v37 = v17;
      v38 = 2112;
      v39 = v19;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@self.isProcessForeground %@, isProcessForeground YES", (uint8_t *)&v36, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(*(id *)(a1 + 32), "eventRouterActiveAssertion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "createEventRouterAssertion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setEventRouterActiveAssertion:", v22);

LABEL_16:
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "foregroundProcesses");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "backgroundProcesses");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_17;
    objc_msgSend(*(id *)(a1 + 32), "_enableBackgroundTimerWithBundleIdentifier:", *(_QWORD *)(a1 + 40));
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v12 = (void *)v25;
      objc_msgSend(*(id *)(a1 + 32), "backgroundProcesses");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v12, *(_QWORD *)(a1 + 40));
      goto LABEL_16;
    }
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543362;
      v37 = v35;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable background timer.", (uint8_t *)&v36, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
    v12 = 0;
  }
LABEL_17:

  v26 = (void *)MEMORY[0x1D17BA0A0]();
  v27 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "foregroundProcesses");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "backgroundProcesses");
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v36 = 138543874;
    v37 = v29;
    v38 = 2112;
    v39 = v30;
    v40 = 2112;
    v41 = v31;
    _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@foregroundProcesses %@, backgroundProcesses %@", (uint8_t *)&v36, 0x20u);

  }
  objc_autoreleasePoolPop(v26);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_121577 != -1)
    dispatch_once(&logCategory__hmf_once_t10_121577, &__block_literal_global_121578);
  return (id)logCategory__hmf_once_v11_121579;
}

void __62__HMDRemoteEventRouterProcessStateChangeAssertion_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_121579;
  logCategory__hmf_once_v11_121579 = v0;

}

@end
