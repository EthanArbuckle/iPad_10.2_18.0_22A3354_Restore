@implementation HMMCoreAnalyticsLogEventObserver

- (HMMCoreAnalyticsLogEventObserver)initWithDelegate:(id)a3 filters:(id)a4
{
  HMMCoreAnalyticsLogEventObserver *v6;
  _QWORD v8[4];
  HMMCoreAnalyticsLogEventObserver *v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__HMMCoreAnalyticsLogEventObserver_initWithDelegate_filters___block_invoke;
  v8[3] = &unk_1E898A718;
  v9 = self;
  v6 = -[HMMCoreAnalyticsLogEventObserver initWithDelegate:filters:submissionBlock:](v9, "initWithDelegate:filters:submissionBlock:", a3, a4, v8);

  return v6;
}

- (HMMCoreAnalyticsLogEventObserver)initWithDelegate:(id)a3 filters:(id)a4 submissionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMMCoreAnalyticsLogEventObserver *v11;
  HMMCoreAnalyticsLogEventObserver *v12;
  uint64_t v13;
  NSHashTable *filters;
  uint64_t v15;
  id submissionBlock;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HMMCoreAnalyticsLogEventObserver;
  v11 = -[HMMCoreAnalyticsLogEventObserver init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    filters = v12->_filters;
    v12->_filters = (NSHashTable *)v13;

    v15 = MEMORY[0x1D17B7A7C](v10);
    submissionBlock = v12->_submissionBlock;
    v12->_submissionBlock = (id)v15;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v17 = v9;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          -[NSHashTable addObject:](v12->_filters, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v21++), (_QWORD)v23);
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v19);
    }

  }
  return v12;
}

- (void)addHomeSummaryForLogEvent:(id)a3 toEventDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMMCoreAnalyticsLogEventObserver *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMMCoreAnalyticsLogEventObserver delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "coreAnalyticsEventOptions") & 1) != 0)
    objc_msgSend(v8, "addAggregatedHomeDimensionsToEventDictionary:", v7);
  if ((objc_msgSend(v6, "coreAnalyticsEventOptions") & 2) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "homeUUID");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v8, "addDimensionsForHome:toEventDictionary:", v9, v7);

      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1D17B78FC]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v14;
        v17 = 2114;
        v18 = objc_opt_class();
        _os_log_impl(&dword_1CD029000, v13, OS_LOG_TYPE_ERROR, "%{public}@Core Analytics event uses home UUID but doesn't define homeUUID property: %{public}@", (uint8_t *)&v15, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }
  }

}

- (void)addAccessoryDetailsForLogEvent:(id)a3 toEventDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMMCoreAnalyticsLogEventObserver *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "coreAnalyticsEventOptions") & 4) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMMCoreAnalyticsLogEventObserver delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessoryIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addDimensionsForAccessoryIdentifier:toEventDictionary:", v9, v7);

      if ((objc_msgSend(v6, "coreAnalyticsEventOptions") & 0x80000000) != 0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("accessoryManufacturer"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("cameraManufacturer"));

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("accessoryModel"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("cameraModel"));

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("accessoryFirmwareVersion"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("cameraFirmware"));

      }
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17B78FC]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v16;
        v19 = 2114;
        v20 = objc_opt_class();
        _os_log_impl(&dword_1CD029000, v15, OS_LOG_TYPE_ERROR, "%{public}@Core Analytics event uses accessory identifier but doesn't define accessoryIdentifier property: %{public}@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }
  }

}

- (void)addErrorDetailsForLogEvent:(id)a3 toEventDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMMCoreAnalyticsLogEventObserver *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17B78FC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v12;
      v21 = 2114;
      v22 = objc_opt_class();
      v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_1CD029000, v11, OS_LOG_TYPE_INFO, "%{public}@[CA] Adding error details from %{public}@: %{public}@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "code"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("errorCode"));

    objc_msgSend(v8, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("errorDomain"));

    objc_msgSend(v8, "underlyingErrors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "code"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("underlyingErrorCode"));

      objc_msgSend(v16, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("underlyingErrorDomain"));

    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E8991F30, CFSTR("numErrorEvents"));

  }
}

- (id)dictionaryFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMMCoreAnalyticsLogEventObserver *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "coreAnalyticsEventDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[HMMCoreAnalyticsLogEventObserver delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addCommonDimensionsToEventDictionary:", v6);
  -[HMMCoreAnalyticsLogEventObserver addErrorDetailsForLogEvent:toEventDictionary:](self, "addErrorDetailsForLogEvent:toEventDictionary:", v4, v6);
  -[HMMCoreAnalyticsLogEventObserver addAccessoryDetailsForLogEvent:toEventDictionary:](self, "addAccessoryDetailsForLogEvent:toEventDictionary:", v4, v6);
  objc_msgSend(v4, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1D17B78FC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v13;
      v20 = 2114;
      v21 = objc_opt_class();
      v22 = 2112;
      v23 = v6;
      v14 = v12;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_1CD029000, v14, v15, "%{public}@[CA] Submitting event: %{public}@/%@", (uint8_t *)&v18, 0x20u);

    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v13;
    v20 = 2114;
    v21 = objc_opt_class();
    v22 = 2112;
    v23 = v6;
    v14 = v12;
    v15 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v9);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E8991F30, CFSTR("numEvents"));
  -[HMMCoreAnalyticsLogEventObserver addHomeSummaryForLogEvent:toEventDictionary:](v10, "addHomeSummaryForLogEvent:toEventDictionary:", v4, v6);
  v16 = (void *)objc_msgSend(v6, "copy");

  return v16;
}

- (BOOL)filterAcceptsEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMMCoreAnalyticsLogEventObserver filters](self, "filters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "isEventInSample:", v4))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4;
  void *v5;
  HMMCoreAnalyticsLogEventObserver *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  HMMCoreAnalyticsLogEventObserver *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B78FC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v8;
    v21 = 2114;
    v22 = objc_opt_class();
    _os_log_impl(&dword_1CD029000, v7, OS_LOG_TYPE_INFO, "%{public}@[CA] Received event from dispatcher: %{public}@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend(v11, "coreAnalyticsEventName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMMCoreAnalyticsLogEventObserver filterAcceptsEvent:](v6, "filterAcceptsEvent:", v11))
    {
      -[HMMCoreAnalyticsLogEventObserver submissionBlock](v6, "submissionBlock");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[HMMCoreAnalyticsLogEventObserver dictionaryFromEvent:](v6, "dictionaryFromEvent:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v13)[2](v13, v12, v14);

    }
    else
    {
      v15 = (void *)MEMORY[0x1D17B78FC]();
      v16 = v6;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v18;
        v21 = 2114;
        v22 = (uint64_t)v12;
        _os_log_impl(&dword_1CD029000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Event %{public}@ is not submitted due to filtering.", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
}

- (HMMCoreAnalyticsLogEventObserverDelegate)delegate
{
  return (HMMCoreAnalyticsLogEventObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSHashTable)filters
{
  return self->_filters;
}

- (id)submissionBlock
{
  return self->_submissionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_submissionBlock, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__HMMCoreAnalyticsLogEventObserver_initWithDelegate_filters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((AnalyticsSendEventLazy() & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D17B78FC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v10;
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1CD029000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Event %{public}@ was not in the CoreAnalytics config and was dropped", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

id __61__HMMCoreAnalyticsLogEventObserver_initWithDelegate_filters___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_986 != -1)
    dispatch_once(&logCategory__hmf_once_t9_986, &__block_literal_global_987);
  return (id)logCategory__hmf_once_v10_988;
}

void __47__HMMCoreAnalyticsLogEventObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_988;
  logCategory__hmf_once_v10_988 = v0;

}

@end
