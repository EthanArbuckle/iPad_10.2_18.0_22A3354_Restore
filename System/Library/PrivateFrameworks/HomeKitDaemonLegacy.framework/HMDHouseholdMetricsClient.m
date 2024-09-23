@implementation HMDHouseholdMetricsClient

- (HMDHouseholdMetricsClient)initWithCountersManager:(id)a3 dateProvider:(id)a4 remoteMessageDispatcher:(id)a5 requestCountProvider:(id)a6 logEventFactories:(id)a7
{
  return -[HMDHouseholdMetricsClient initWithCountersManager:dateProvider:remoteMessageDispatcher:requestCountProvider:logEventFactories:isDNUEnabledBlock:](self, "initWithCountersManager:dateProvider:remoteMessageDispatcher:requestCountProvider:logEventFactories:isDNUEnabledBlock:", a3, a4, a5, a6, a7, &__block_literal_global_2467);
}

- (HMDHouseholdMetricsClient)initWithCountersManager:(id)a3 dateProvider:(id)a4 remoteMessageDispatcher:(id)a5 requestCountProvider:(id)a6 logEventFactories:(id)a7 isDNUEnabledBlock:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDHouseholdMetricsClient *v20;
  HMDHouseholdMetricsClient *v21;
  void *v22;
  id isDNUEnabledBlock;
  HMDHouseholdMetricsClient *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v26 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HMDHouseholdMetricsClient;
  v20 = -[HMDHouseholdMetricsClient init](&v30, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_countersManager, a3);
    objc_storeStrong((id *)&v21->_dateProvider, a4);
    objc_storeWeak((id *)&v21->_remoteMessageDispatcher, v16);
    objc_storeWeak((id *)&v21->_requestCountProvider, v17);
    objc_storeStrong((id *)&v21->_logEventFactories, a7);
    v22 = _Block_copy(v19);
    isDNUEnabledBlock = v21->_isDNUEnabledBlock;
    v21->_isDNUEnabledBlock = v22;

    objc_initWeak(&location, v21);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __147__HMDHouseholdMetricsClient_initWithCountersManager_dateProvider_remoteMessageDispatcher_requestCountProvider_logEventFactories_isDNUEnabledBlock___block_invoke;
    v27[3] = &unk_1E89A25D0;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v16, "registerForMessage:messageHandler:", CFSTR("HMDHouseholdMetricsHomeDataLogEventRequest"), v27);
    v24 = v21;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v21;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteMessageDispatcher);
  objc_msgSend(WeakRetained, "deregisterForMessage:", CFSTR("HMDHouseholdMetricsHomeDataLogEventRequest"));

  v4.receiver = self;
  v4.super_class = (Class)HMDHouseholdMetricsClient;
  -[HMDHouseholdMetricsClient dealloc](&v4, sel_dealloc);
}

- (id)handleRequestMessageWithPayload:(id)a3 outError:(id *)a4
{
  char *v6;
  void *v7;
  HMDHouseholdMetricsClient *v8;
  NSObject *v9;
  void *v10;
  uint64_t (**v11)(void);
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMDHouseholdMetricsClient *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  HMDHouseholdMetricsClient *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDHouseholdMetricsClient *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  void *v40;
  _QWORD v41[5];
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = (uint64_t)v10;
    v45 = 2112;
    v46 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Processing request, payload=%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDHouseholdMetricsClient isDNUEnabledBlock](v8, "isDNUEnabledBlock");
  v11 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v12 = v11[2]();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeUUID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v16);
    else
      v17 = 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("date"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
    v25 = v24;

    if (v17 && v25)
    {
      -[HMDHouseholdMetricsClient householdMetricsForHomeWithUUID:associatedWithDate:](v8, "householdMetricsForHomeWithUUID:associatedWithDate:", v17, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __70__HMDHouseholdMetricsClient_handleRequestMessageWithPayload_outError___block_invoke;
      v41[3] = &unk_1E89BFBA8;
      v41[4] = v8;
      v27 = v13;
      v42 = v27;
      v28 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v41));
      v29 = v8;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v40 = v13;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = (uint64_t)v31;
        v45 = 2112;
        v46 = (const char *)v27;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Responding with payload=%@", buf, 0x16u);

        v13 = v40;
      }

      objc_autoreleasePoolPop(v28);
      v22 = (void *)objc_msgSend(v27, "copy");

    }
    else
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = v8;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v35;
        v37 = "home UUID and date";
        if (v25)
          v37 = "home UUID";
        v38 = "date";
        if (v25)
          v38 = "<impossible>";
        if (v17)
          v37 = v38;
        *(_DWORD *)buf = 138543618;
        v44 = v35;
        v45 = 2080;
        v46 = v37;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Missing %s in request, responding with error", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 20, 0);
        v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v8;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = (uint64_t)v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@DNU disabled, responding with error", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 17, 0);
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (id)householdMetricsForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  -[HMDHouseholdMetricsClient requestCountProvider](self, "requestCountProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "incrementRequestCountForHomeUUID:date:", v6, v7);

  v9 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[HMDHouseholdMetricsClient logEventFactories](self, "logEventFactories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  -[HMDHouseholdMetricsClient logEventFactories](self, "logEventFactories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__HMDHouseholdMetricsClient_householdMetricsForHomeWithUUID_associatedWithDate___block_invoke;
  v18[3] = &unk_1E89A25F8;
  v19 = v6;
  v20 = v7;
  v21 = v11;
  v13 = v11;
  v14 = v7;
  v15 = v6;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v18);

  v16 = (void *)objc_msgSend(v13, "copy");
  return v16;
}

- (void)deleteExpiredCounters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDHouseholdMetricsClient dateProvider](self, "dateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayByAddingDayCount:", -3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHouseholdMetricsClient dateProvider](self, "dateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayByAddingDayCount:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDHouseholdMetricsClient logEventFactories](self, "logEventFactories", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v13, "deleteCountersBeforeDate:", v4);
        objc_msgSend(v13, "deleteCountersAfterDate:", v6);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (HMDEventCountersManager)countersManager
{
  return self->_countersManager;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (HMDHouseholdMetricsMessaging)remoteMessageDispatcher
{
  return (HMDHouseholdMetricsMessaging *)objc_loadWeakRetained((id *)&self->_remoteMessageDispatcher);
}

- (HMDHouseholdMetricsRequestCountProvider)requestCountProvider
{
  return (HMDHouseholdMetricsRequestCountProvider *)objc_loadWeakRetained((id *)&self->_requestCountProvider);
}

- (NSDictionary)logEventFactories
{
  return self->_logEventFactories;
}

- (id)isDNUEnabledBlock
{
  return self->_isDNUEnabledBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isDNUEnabledBlock, 0);
  objc_storeStrong((id *)&self->_logEventFactories, 0);
  objc_destroyWeak((id *)&self->_requestCountProvider);
  objc_destroyWeak((id *)&self->_remoteMessageDispatcher);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_countersManager, 0);
}

void __80__HMDHouseholdMetricsClient_householdMetricsForHomeWithUUID_associatedWithDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "logEventsPopulatedForHomeWithUUID:associatedWithDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v5, v6);

}

void __70__HMDHouseholdMetricsClient_handleRequestMessageWithPayload_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "logEventFactories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "serializeLogEvents:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v9, 200) & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v5);
LABEL_15:

        goto LABEL_16;
      }
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v17;
        v23 = 2114;
        v24 = v5;
        v18 = "%{public}@Dropping %{public}@ because the metrics can't be serialized as a property list";
        v19 = v16;
        v20 = OS_LOG_TYPE_ERROR;
        goto LABEL_13;
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v17;
        v23 = 2114;
        v24 = v5;
        v18 = "%{public}@Factory didn't return serialized data for %{public}@";
        v19 = v16;
        v20 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
        _os_log_impl(&dword_1CD062000, v19, v20, v18, (uint8_t *)&v21, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v14);
    goto LABEL_15;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v13;
    v23 = 2114;
    v24 = v5;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Dropping %{public}@ because it's factory doesn't serialize", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
LABEL_16:

}

id __147__HMDHouseholdMetricsClient_initWithCountersManager_dateProvider_remoteMessageDispatcher_requestCountProvider_logEventFactories_isDNUEnabledBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleRequestMessageWithPayload:outError:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __129__HMDHouseholdMetricsClient_initWithCountersManager_dateProvider_remoteMessageDispatcher_requestCountProvider_logEventFactories___block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isDiagnosticSubmissionAllowed");

  return v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9 != -1)
    dispatch_once(&logCategory__hmf_once_t9, &__block_literal_global_19);
  return (id)logCategory__hmf_once_v10;
}

void __40__HMDHouseholdMetricsClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10;
  logCategory__hmf_once_v10 = v0;

}

@end
