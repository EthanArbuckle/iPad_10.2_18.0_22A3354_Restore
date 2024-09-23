@implementation AMSMetrics

id __30__AMSMetrics__modifiedEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v4, "setProperty:forBodyKey:", v3, 0x1E255B7C0);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __39__AMSMetrics_internalInstanceUsingBag___block_invoke(uint64_t a1)
{
  AMSMetrics *v1;
  void *v2;

  v1 = -[AMSMetrics initWithContainerID:bag:]([AMSMetrics alloc], "initWithContainerID:bag:", CFSTR("com.apple.AppleMediaServices"), *(_QWORD *)(a1 + 32));
  v2 = (void *)qword_1ECEAD668;
  qword_1ECEAD668 = (uint64_t)v1;

}

+ (void)setFlushTimerEnabled:(BOOL)a3
{
  id v3;

  atomic_store(a3, _global_flush_timer_enabled);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("AMSFlushTimerEnabledNotificationName"), 0);

}

- (void)setFlushTimerEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_flushModeLock;
  id v6;

  p_flushModeLock = &self->_flushModeLock;
  os_unfair_lock_lock_with_options();
  self->_flushTimerEnabled = a3;
  os_unfair_lock_unlock(p_flushModeLock);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("AMSFlushTimerEnabledNotificationName"), 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("AMSFlushTimerEnabledNotificationName"), 0);

  v5.receiver = self;
  v5.super_class = (Class)AMSMetrics;
  -[AMSMetrics dealloc](&v5, sel_dealloc);
}

id __33__AMSMetrics_enqueueAsyncEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!+[AMSEphemeralDefaults suppressEngagement](AMSEphemeralDefaults, "suppressEngagement"))
  {
    objc_msgSend(*(id *)(a1 + 32), "engagement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v10, "suppressEngagement", (_QWORD)v16) & 1) == 0)
          {
            objc_msgSend(v10, "underlyingDictionary");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (id)objc_msgSend(v4, "enqueueData:", v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_enqueueFigaroEvents:", v3, (_QWORD)v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "promiseAdapter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (AMSEngagement)engagement
{
  os_unfair_lock_s *p_engagementLock;
  AMSEngagement *engagement;
  AMSEngagement *v5;
  void *v6;
  AMSEngagement *v7;
  AMSEngagement *v8;
  AMSEngagement *v9;

  p_engagementLock = &self->_engagementLock;
  os_unfair_lock_lock(&self->_engagementLock);
  engagement = self->_engagement;
  if (!engagement)
  {
    v5 = [AMSEngagement alloc];
    -[AMSMetrics bag](self, "bag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AMSEngagement initWithBag:](v5, "initWithBag:", v6);
    v8 = self->_engagement;
    self->_engagement = v7;

    engagement = self->_engagement;
  }
  v9 = engagement;
  os_unfair_lock_unlock(p_engagementLock);
  return v9;
}

- (AMSMetrics)initWithContainerID:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  AMSMetrics *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[AMSMetrics initWithContainerID:bag:flushTaskClass:](self, "initWithContainerID:bag:flushTaskClass:", v7, v6, objc_opt_class());

  return v8;
}

- (AMSMetrics)initWithContainerID:(id)a3 bag:(id)a4 flushTaskClass:(Class)a5
{
  id v9;
  id v10;
  AMSMetrics *v11;
  AMSMetrics *v12;
  AMSMetricsDatabaseDataSource *v13;
  AMSMetricsDatabaseDataSource *databaseSource;
  uint64_t v15;
  NSMutableArray *enqueuedOperations;
  AMSTreatmentStore *v17;
  AMSTreatmentStore *treatmentStore;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  id v27;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AMSMetrics;
  v11 = -[AMSMetrics init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bag, a4);
    objc_storeStrong((id *)&v12->_containerId, a3);
    v13 = -[AMSMetricsDatabaseDataSource initWithContainerIdentifier:]([AMSMetricsDatabaseDataSource alloc], "initWithContainerIdentifier:", v9);
    databaseSource = v12->_databaseSource;
    v12->_databaseSource = v13;

    v12->_destination = 0;
    v12->_engagementLock._os_unfair_lock_opaque = 0;
    atomic_store(0, (unsigned __int8 *)&v12->_flushingDisabled);
    v12->_flushTimerEnabled = 1;
    *(_OWORD *)&v12->_maxBatchSize = xmmword_18CF5CB00;
    v15 = objc_opt_new();
    enqueuedOperations = v12->_enqueuedOperations;
    v12->_enqueuedOperations = (NSMutableArray *)v15;

    *(_QWORD *)&v12->_enqueuedOperationsLock._os_unfair_lock_opaque = 0;
    v12->_flushTaskClass = a5;
    v12->_bagLock._os_unfair_lock_opaque = 0;
    v17 = -[AMSTreatmentStore initWithCachePolicy:]([AMSTreatmentStore alloc], "initWithCachePolicy:", 0);
    treatmentStore = v12->_treatmentStore;
    v12->_treatmentStore = v17;

    v12->_includeMMeClientInfoAndDeviceHeaders = 0;
    v12->_metricsSigningFlavour = 0;
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "executableName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("StoreKitUIService"));

    v12->_monitorsLifecycleEvents = v21 ^ 1;
    dispatch_get_global_queue(9, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__AMSMetrics_initWithContainerID_bag_flushTaskClass___block_invoke;
    block[3] = &unk_1E253DBD8;
    v27 = v10;
    dispatch_async(v22, block);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v12, sel__applicationDidBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v12, sel__flushTimerEnabledChanged, CFSTR("AMSFlushTimerEnabledNotificationName"), 0);

    -[AMSMetrics _beginFlushIntervalWithStyle:events:](v12, "_beginFlushIntervalWithStyle:events:", 2, 0);
  }

  return v12;
}

- (id)_enqueueFigaroEvents:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  const __CFString *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v33 = v3;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
  if (!v6)
    goto LABEL_30;
  v7 = v6;
  v8 = *(_QWORD *)v41;
  v9 = 0x1E0C99000uLL;
  v34 = v4;
  v35 = v5;
  do
  {
    v10 = 0;
    v36 = v7;
    do
    {
      if (*(_QWORD *)v41 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
      if ((objc_msgSend(v11, "engagementEvent") & 1) == 0)
      {
        v54 = CFSTR("engagementMetrics");
        objc_msgSend(*(id *)(v9 + 3360), "arrayWithObjects:count:", &v54, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removePropertiesForKeys:", v12);

        objc_msgSend(v11, "diagnosticsSubmissionBugType");
        v13 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v13;
        if ((objc_msgSend(v11, "checkDiagnosticsAndUsageSetting") & 1) != 0 || v13)
        {
          if (+[AMSMetrics diagnosticsSubmissionAllowed](AMSMetrics, "diagnosticsSubmissionAllowed"))
          {
            if (!v13
              || +[AMSMetrics recordAppAnalyticsForEvent:bugType:](AMSMetrics, "recordAppAnalyticsForEvent:bugType:", v11, v13))
            {
              goto LABEL_10;
            }
            +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v22)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v22, "OSLogObject");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v24 = objc_opt_class();
              AMSLogKey();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "topic");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v45 = v24;
              v9 = 0x1E0C99000;
              v46 = 2114;
              v47 = v25;
              v48 = 2114;
              v49 = v26;
              _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dropping event due to failed recording of event flagged for appAnalytics recording. Topic: %{public}@", buf, 0x20u);

            }
          }
          else
          {
            +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v22)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v22, "OSLogObject");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v27 = objc_opt_class();
              AMSLogKey();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "topic");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v45 = v27;
              v46 = 2114;
              v47 = v28;
              v48 = 2114;
              v49 = v29;
              _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dropping event due to D&U. Topic: %{public}@", buf, 0x20u);

              v9 = 0x1E0C99000;
            }
          }

        }
        else
        {
LABEL_10:
          +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v14, "OSLogObject");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v16 = (void *)objc_opt_class();
            v38 = v16;
            AMSLogKey();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[AMSMetrics containerId](self, "containerId");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "topic");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "clientEventID");
            v20 = v8;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v45 = (uint64_t)v16;
            v9 = 0x1E0C99000;
            v46 = 2114;
            v47 = v17;
            v48 = 2114;
            v49 = v18;
            v50 = 2114;
            v51 = v19;
            v52 = 2114;
            v53 = v21;
            _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Enqueueing event (%{public}@) topic: %{public}@ id: %{public}@", buf, 0x34u);

            v8 = v20;
            v7 = v36;

            v4 = v34;
            v5 = v35;

          }
          objc_msgSend(v4, "addObject:", v11);
        }

      }
      ++v10;
    }
    while (v7 != v10);
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
  }
  while (v7);
LABEL_30:

  -[AMSMetrics databaseSource](self, "databaseSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "enqueueEvents:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSMetrics _beginFlushIntervalWithStyle:events:](self, "_beginFlushIntervalWithStyle:events:", 1, v4);
  v3 = v33;
LABEL_32:

  return v31;
}

- (void)_beginFlushIntervalWithStyle:(int64_t)a3 events:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  if (-[AMSMetrics _scheduledFlushAllowedForStyle:](self, "_scheduledFlushAllowedForStyle:", a3))
  {
    -[AMSMetrics bag](self, "bag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetricsFigaroBagConfguration configurationPromiseWithBag:](AMSMetricsFigaroBagConfguration, "configurationPromiseWithBag:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__AMSMetrics__beginFlushIntervalWithStyle_events___block_invoke;
    v9[3] = &unk_1E25432E0;
    v9[4] = self;
    v11 = a3;
    v10 = v6;
    objc_msgSend(v8, "addFinishBlock:", v9);

  }
}

- (AMSBagProtocol)bag
{
  os_unfair_lock_s *p_bagLock;
  AMSBagProtocol *v4;

  p_bagLock = &self->_bagLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_bag;
  os_unfair_lock_unlock(p_bagLock);
  return v4;
}

- (void)enqueueEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSMetrics enqueueEvents:](self, "enqueueEvents:", v6, v7, v8);
}

- (AMSMetricsDatabaseDataSource)databaseSource
{
  return self->_databaseSource;
}

- (void)enqueueEvents:(id)a3
{
  id v3;

  v3 = -[AMSMetrics promiseForEnqueueingEvents:](self, "promiseForEnqueueingEvents:", a3);
}

- (id)promiseForEnqueueingEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (void *)objc_msgSend(v11, "copy", (_QWORD)v16);
          objc_msgSend(v12, "setTopic:", CFSTR("xp_amp_ams_error_log"));
          objc_msgSend(v5, "addObject:", v12);

        }
        v13 = (void *)objc_msgSend(v11, "copy", (_QWORD)v16);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[AMSMetrics enqueueAsyncEvents:](self, "enqueueAsyncEvents:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)enqueueAsyncEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[AMSMetrics _modifiedEvents:](self, "_modifiedEvents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__AMSMetrics_enqueueAsyncEvents___block_invoke;
    v9[3] = &unk_1E253D638;
    v9[4] = self;
    objc_msgSend(v5, "thenWithBlock:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "binaryPromiseAdapter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_modifiedEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[AMSMetrics treatmentStore](self, "treatmentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__AMSMetrics__modifiedEvents___block_invoke;
  v10[3] = &unk_1E2543380;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v4, "ams_mapWithTransform:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (AMSTreatmentStore)treatmentStore
{
  return self->_treatmentStore;
}

+ (id)serverTimeFromTimeInterval:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)(a3 * 1000.0));
}

+ (id)serverTimeFromDate:(id)a3
{
  objc_msgSend(a3, "timeIntervalSince1970");
  return (id)objc_msgSend(a1, "serverTimeFromTimeInterval:");
}

id __30__AMSMetrics__modifiedEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeExperimentDataForTopic:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__AMSMetrics__modifiedEvents___block_invoke_2;
  v10[3] = &unk_1E2543358;
  v11 = v3;
  v7 = v3;
  objc_msgSend(v6, "continueWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_flushTimerEnabledChanged
{
  -[AMSMetrics _beginFlushIntervalWithStyle:events:](self, "_beginFlushIntervalWithStyle:events:", 2, 0);
}

- (id)flush
{
  void *v3;
  void *v4;

  -[AMSMetrics databaseSource](self, "databaseSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetrics _flushDataSource:topic:](self, "_flushDataSource:topic:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_flushDataSource:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableArray *enqueuedOperations;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  -[AMSMetrics _determineFlushStrategyWithDataSource:topic:](self, "_determineFlushStrategyWithDataSource:topic:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock_with_options();
  enqueuedOperations = self->_enqueuedOperations;
  +[AMSMetricsOperation flushOperationWithStrategy:promise:](AMSMetricsOperation, "flushOperationWithStrategy:promise:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](enqueuedOperations, "addObject:", v11);

  os_unfair_lock_unlock(&self->_enqueuedOperationsLock);
  -[AMSMetrics _processOperationQueue](self, "_processOperationQueue");

  return v8;
}

- (void)_processOperationQueue
{
  os_unfair_lock_s *p_enqueuedOperationsLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *enqueuedOperations;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  p_enqueuedOperationsLock = &self->_enqueuedOperationsLock;
  os_unfair_lock_lock_with_options();
  if (self->_currentFlushOperation)
  {
    os_unfair_lock_unlock(p_enqueuedOperationsLock);
    return;
  }
  if (!-[NSMutableArray count](self->_enqueuedOperations, "count"))
  {
    os_unfair_lock_unlock(p_enqueuedOperationsLock);
    -[AMSMetrics _beginFlushIntervalWithStyle:events:](self, "_beginFlushIntervalWithStyle:events:", 2, 0);
    return;
  }
  if (-[AMSMetrics flushingDisabled](self, "flushingDisabled"))
  {
    -[NSMutableArray indexesOfObjectsPassingTest:](self->_enqueuedOperations, "indexesOfObjectsPassingTest:", &__block_literal_global_47_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectsAtIndexes:](self->_enqueuedOperations, "objectsAtIndexes:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectsAtIndexes:](self->_enqueuedOperations, "removeObjectsAtIndexes:", v4);

  }
  else
  {
    v5 = 0;
  }
  -[NSMutableArray firstObject](self->_enqueuedOperations, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AMSMetrics databaseSource](self, "databaseSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeAllEvents");

    }
    v8 = -[NSMutableArray indexOfObjectPassingTest:](self->_enqueuedOperations, "indexOfObjectPassingTest:", &__block_literal_global_49_0);
    enqueuedOperations = self->_enqueuedOperations;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray removeObjectsInRange:](enqueuedOperations, "removeObjectsInRange:", 0);
      -[NSMutableArray firstObject](self->_enqueuedOperations, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_enqueuedOperations, "removeObjectAtIndex:", 0);
      objc_storeStrong((id *)&self->_currentFlushOperation, v10);
      goto LABEL_15;
    }
    -[NSMutableArray removeAllObjects](enqueuedOperations, "removeAllObjects");
  }
  v10 = 0;
LABEL_15:
  os_unfair_lock_unlock(p_enqueuedOperationsLock);
  +[AMSMetrics sharedTimerQueue](AMSMetrics, "sharedTimerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AMSMetrics__processOperationQueue__block_invoke_3;
  block[3] = &unk_1E253DBD8;
  block[4] = self;
  dispatch_async(v11, block);

  if (objc_msgSend(v5, "count"))
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v14;
      v45 = 2114;
      v46 = v15;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Flushing disabled", buf, 0x16u);

    }
    AMSError(11, CFSTR("Metrics Flush Failed"), CFSTR("Flush disabled"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v17 = v5;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "promise");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "finishWithError:", v16);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
      }
      while (v19);
    }

  }
  if (v10)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_opt_class();
      v34 = v25;
      AMSLogKey();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMetrics containerId](self, "containerId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = (uint64_t)v25;
      v45 = 2114;
      v46 = v26;
      v47 = 2114;
      v48 = v27;
      _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Flushing events for container: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v10, "strategy");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "performFlush");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __36__AMSMetrics__processOperationQueue__block_invoke_54;
    v36[3] = &unk_1E253D688;
    v36[4] = self;
    v31 = v10;
    v37 = v31;
    objc_msgSend(v29, "thenWithBlock:", v36);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v30;
    v35[1] = 3221225472;
    v35[2] = __36__AMSMetrics__processOperationQueue__block_invoke_59;
    v35[3] = &unk_1E253DF98;
    v35[4] = self;
    objc_msgSend(v32, "addFinishBlock:", v35);
    objc_msgSend(v31, "promise");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "finishWithPromise:", v32);

  }
}

- (BOOL)flushingDisabled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_flushingDisabled);
  return v2 & 1;
}

- (id)_determineFlushStrategyWithDataSource:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  objc_class *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (-[AMSMetrics destination](self, "destination"))
  {
    v8 = 0;
  }
  else
  {
    v9 = -[objc_class alloc](self->_flushTaskClass, "alloc");
    -[AMSMetrics bag](self, "bag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[objc_class initWithDataSource:bag:](v9, "initWithDataSource:bag:", v6, v10);

    -[objc_class setMaxBatchSize:](v8, "setMaxBatchSize:", -[AMSMetrics maxBatchSize](self, "maxBatchSize"));
    -[objc_class setMaxRequestCount:](v8, "setMaxRequestCount:", -[AMSMetrics maxRequestCount](self, "maxRequestCount"));
    -[objc_class setTopic:](v8, "setTopic:", v7);
    -[objc_class setIncludeMMeClientInfoAndDeviceHeaders:](v8, "setIncludeMMeClientInfoAndDeviceHeaders:", -[AMSMetrics includeMMeClientInfoAndDeviceHeaders](self, "includeMMeClientInfoAndDeviceHeaders"));
    -[objc_class setMetricsSigningFlavour:](v8, "setMetricsSigningFlavour:", -[AMSMetrics metricsSigningFlavour](self, "metricsSigningFlavour"));
  }

  return v8;
}

- (unint64_t)metricsSigningFlavour
{
  return self->_metricsSigningFlavour;
}

- (int64_t)maxRequestCount
{
  return self->_maxRequestCount;
}

- (int64_t)maxBatchSize
{
  return self->_maxBatchSize;
}

- (BOOL)includeMMeClientInfoAndDeviceHeaders
{
  return self->_includeMMeClientInfoAndDeviceHeaders;
}

- (int64_t)destination
{
  return self->_destination;
}

+ (void)setDisableBackgroundMetrics:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "internalInstanceUsingBag:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlushingDisabled:", v3);

}

- (void)setFlushingDisabled:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_flushingDisabled);
}

id __53__AMSMetrics_initWithContainerID_bag_flushTaskClass___block_invoke(uint64_t a1)
{
  return +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", *(_QWORD *)(a1 + 32));
}

+ (id)internalInstanceUsingBag:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v10;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AMSMetrics_internalInstanceUsingBag___block_invoke;
  block[3] = &unk_1E253DBD8;
  v4 = v3;
  v5 = v4;
  v10 = v4;
  if (_MergedGlobals_127 == -1)
  {
    v6 = v4;
  }
  else
  {
    dispatch_once(&_MergedGlobals_127, block);
    v6 = v10;
  }
  v7 = (id)qword_1ECEAD668;

  if (v5)
    objc_msgSend(v7, "setBag:", v5);

  return v7;
}

- (void)setBag:(id)a3
{
  id v5;
  AMSBagProtocol *v6;

  v6 = (AMSBagProtocol *)a3;
  os_unfair_lock_lock_with_options();
  if (self->_bag == v6)
  {
    os_unfair_lock_unlock(&self->_bagLock);
  }
  else
  {
    objc_storeStrong((id *)&self->_bag, a3);
    os_unfair_lock_unlock(&self->_bagLock);
    v5 = (id)objc_msgSend((id)objc_opt_class(), "internalInstanceUsingBag:", v6);
    -[AMSMetrics _beginFlushIntervalWithStyle:events:](self, "_beginFlushIntervalWithStyle:events:", 2, 0);
  }

}

- (void)_flushIntervalInvalidate
{
  NSObject *v3;
  void *v4;
  void *v5;

  +[AMSMetrics sharedTimerQueue](AMSMetrics, "sharedTimerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[AMSMetrics flushIntervalBlock](self, "flushIntervalBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSMetrics flushIntervalBlock](self, "flushIntervalBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v5);

    -[AMSMetrics setFlushIntervalBlock:](self, "setFlushIntervalBlock:", 0);
  }
}

- (id)flushIntervalBlock
{
  return self->_flushIntervalBlock;
}

- (BOOL)_scheduledFlushAllowedForStyle:(int64_t)a3
{
  os_unfair_lock_s *p_flushModeLock;
  _BOOL4 v6;

  p_flushModeLock = &self->_flushModeLock;
  os_unfair_lock_lock_with_options();
  if (!self->_flushTimerEnabled || !+[AMSMetrics flushTimerEnabled](AMSMetrics, "flushTimerEnabled"))
    goto LABEL_7;
  switch(a3)
  {
    case 0:
      LOBYTE(v6) = 1;
      break;
    case 1:
      LOBYTE(v6) = +[AMSMetrics flushDelayEnabled](AMSMetrics, "flushDelayEnabled");
      break;
    case 2:
      v6 = !+[AMSMetrics flushDelayEnabled](AMSMetrics, "flushDelayEnabled");
      break;
    default:
LABEL_7:
      LOBYTE(v6) = 0;
      break;
  }
  os_unfair_lock_unlock(p_flushModeLock);
  return v6;
}

+ (BOOL)flushTimerEnabled
{
  unsigned __int8 v2;

  v2 = atomic_load(_global_flush_timer_enabled);
  return v2 & 1;
}

void __50__AMSMetrics__beginFlushIntervalWithStyle_events___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    +[AMSMetrics sharedTimerQueue](AMSMetrics, "sharedTimerQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__AMSMetrics__beginFlushIntervalWithStyle_events___block_invoke_62;
    v10[3] = &unk_1E25432B8;
    v5 = *(_QWORD *)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v13 = v5;
    v11 = v3;
    v12 = *(id *)(a1 + 40);
    dispatch_async(v4, v10);

  }
  else
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "containerId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to get Figaro bag configuration", buf, 0x16u);

    }
  }

}

+ (OS_dispatch_queue)sharedTimerQueue
{
  if (qword_1ECEAD690 != -1)
    dispatch_once(&qword_1ECEAD690, &__block_literal_global_74_0);
  return (OS_dispatch_queue *)(id)qword_1ECEAD698;
}

+ (BOOL)flushDelayEnabled
{
  unsigned __int8 v2;

  v2 = atomic_load(_global_flush_delay_enabled);
  return v2 & 1;
}

- (NSString)containerId
{
  return self->_containerId;
}

- (double)_flushIntervalWithConfiguration:(id)a3 forEvents:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  void *v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v7)
    goto LABEL_17;
  v8 = v7;
  v9 = *(_QWORD *)v20;
  v10 = 0.0;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(v5, "modifierForEvent:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "flushInterval");
      if ((v10 > v13 || v10 == 0.0) && v13 > 0.0)
        v10 = v13;

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v8);
  if (v10 == 0.0)
  {
LABEL_17:
    objc_msgSend(v5, "modifierForEvent:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "flushInterval");
    v10 = v17;

  }
  return v10;
}

+ (double)timeIntervalFromServerTime:(id)a3
{
  double v3;

  objc_msgSend(a3, "doubleValue");
  return v3 / 1000.0;
}

+ (BOOL)diagnosticsSubmissionAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDiagnosticSubmissionAllowed");

  return v3;
}

- (void)setMonitorsLifecycleEvents:(BOOL)a3
{
  self->_monitorsLifecycleEvents = a3;
}

- (void)setMaxBatchSize:(int64_t)a3
{
  self->_maxBatchSize = a3;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

void __30__AMSMetrics_sharedTimerQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.AppleMediaServices.metricsTimer", v2);
  v1 = (void *)qword_1ECEAD698;
  qword_1ECEAD698 = (uint64_t)v0;

}

uint64_t __36__AMSMetrics__processOperationQueue__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushIntervalInvalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentStore, 0);
  objc_storeStrong((id *)&self->_flushIntervalStartTime, 0);
  objc_storeStrong(&self->_flushIntervalBlock, 0);
  objc_storeStrong(&self->_flushOnDidBecomeActiveBlock, 0);
  objc_storeStrong((id *)&self->_databaseSource, 0);
  objc_storeStrong((id *)&self->_containerId, 0);
  objc_storeStrong((id *)&self->_engagement, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_currentFlushOperation, 0);
  objc_storeStrong((id *)&self->_enqueuedOperations, 0);
}

- (void)setFlushIntervalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

void __34__AMSMetrics_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD688;
  qword_1ECEAD688 = (uint64_t)CFSTR("1");

}

void __27__AMSMetrics_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD678;
  qword_1ECEAD678 = (uint64_t)CFSTR("AMSCore");

}

+ (NSString)bagSubProfile
{
  if (qword_1ECEAD670 != -1)
    dispatch_once(&qword_1ECEAD670, &__block_literal_global_39_1);
  return (NSString *)(id)qword_1ECEAD678;
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD680 != -1)
    dispatch_once(&qword_1ECEAD680, &__block_literal_global_42_1);
  return (NSString *)(id)qword_1ECEAD688;
}

uint64_t __36__AMSMetrics__processOperationQueue__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)appAnalyticsAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppAnalyticsAllowed");

  return v3;
}

+ (BOOL)disableBackgroundMetrics
{
  void *v2;
  char v3;

  objc_msgSend(a1, "internalInstanceUsingBag:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "flushingDisabled");

  return v3;
}

- (int64_t)eventCount
{
  void *v2;
  int64_t v3;

  -[AMSMetrics databaseSource](self, "databaseSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventCount");

  return v3;
}

- (BOOL)flushTimerEnabled
{
  return -[AMSMetrics _scheduledFlushAllowedForStyle:](self, "_scheduledFlushAllowedForStyle:", 0);
}

- (void)setEngagement:(id)a3
{
  AMSEngagement *v4;
  AMSEngagement *engagement;

  v4 = (AMSEngagement *)a3;
  os_unfair_lock_lock_with_options();
  engagement = self->_engagement;
  self->_engagement = v4;

  os_unfair_lock_unlock(&self->_engagementLock);
}

+ (void)setFlushDelayEnabled:(BOOL)a3
{
  atomic_store(a3, _global_flush_delay_enabled);
}

- (void)cancel
{
  os_unfair_lock_s *p_enqueuedOperationsLock;
  AMSMetricsFlushOperation *v4;
  AMSMetricsFlushOperation *currentFlushOperation;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_enqueuedOperationsLock = &self->_enqueuedOperationsLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_currentFlushOperation;
  currentFlushOperation = self->_currentFlushOperation;
  self->_currentFlushOperation = 0;

  -[NSMutableArray indexesOfObjectsPassingTest:](self->_enqueuedOperations, "indexesOfObjectsPassingTest:", &__block_literal_global_85);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectsAtIndexes:](self->_enqueuedOperations, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](self->_enqueuedOperations, "removeObjectsAtIndexes:", v6);
  os_unfair_lock_unlock(p_enqueuedOperationsLock);
  -[AMSMetricsFlushOperation strategy](v4, "strategy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "promise", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cancel");

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[AMSMetrics _processOperationQueue](self, "_processOperationQueue");
  -[AMSMetrics bag](self, "bag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cancel");

}

uint64_t __20__AMSMetrics_cancel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)dropEvents
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSMutableArray *enqueuedOperations;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Requested to drop all events from database", (uint8_t *)&v9, 0x16u);

  }
  os_unfair_lock_lock_with_options();
  enqueuedOperations = self->_enqueuedOperations;
  +[AMSMetricsOperation dropEventsOperation](AMSMetricsOperation, "dropEventsOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](enqueuedOperations, "addObject:", v8);

  os_unfair_lock_unlock(&self->_enqueuedOperationsLock);
  -[AMSMetrics _processOperationQueue](self, "_processOperationQueue");
}

- (id)flushTopic:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AMSMetrics databaseSource](self, "databaseSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetrics _flushDataSource:topic:](self, "_flushDataSource:topic:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)flushEvents:(id)a3
{
  id v4;
  AMSMetricsMemoryDataSource *v5;
  void *v6;

  v4 = a3;
  v5 = -[AMSMetricsMemoryDataSource initWithEvents:]([AMSMetricsMemoryDataSource alloc], "initWithEvents:", v4);

  -[AMSMetrics _flushDataSource:topic:](self, "_flushDataSource:topic:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)recordAppAnalyticsForEvent:(id)a3 bugType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "dictionaryForPosting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v7))
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    if (v9)
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v19 = v12;
        v20 = 2114;
        v21 = v9;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to generate JSON for OSA log submission. %{public}@", buf, 0x16u);
      }

    }
    if (v8)
    {
      objc_msgSend(v5, "topic");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v8;
      v14 = v8;
      LOBYTE(v8) = OSAWriteLogForSubmission();

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

uint64_t __49__AMSMetrics_recordAppAnalyticsForEvent_bugType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeData:", *(_QWORD *)(a1 + 32));
}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __36__AMSMetrics__processOperationQueue__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __36__AMSMetrics__processOperationQueue__block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v10;
  _QWORD v11[5];
  id v12;

  v3 = a2;
  if (!+[AMSMetrics flushTimerEnabled](AMSMetrics, "flushTimerEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != *(void **)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "strategy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isCancelled");

      if (!v7)
      {
        objc_msgSend(v5, "flush");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __36__AMSMetrics__processOperationQueue__block_invoke_2_55;
        v11[3] = &unk_1E253D820;
        v11[4] = *(_QWORD *)(a1 + 32);
        v12 = v3;
        objc_msgSend(v10, "continueWithBlock:", v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_6;
      }
    }

  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

id __36__AMSMetrics__processOperationQueue__block_invoke_2_55(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a2)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to flush internal metrics. Error: %{public}@", (uint8_t *)&v12, 0x20u);

    }
  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __36__AMSMetrics__processOperationQueue__block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544130;
      v21 = v10;
      v22 = 2114;
      v23 = v12;
      v24 = 2112;
      v25 = v5;
      v26 = 2114;
      v27 = v6;
      v13 = "%{public}@: [%{public}@] Flush failed. count: %@ error: %{public}@";
      v14 = v9;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 42;
LABEL_10:
      _os_log_impl(&dword_18C849000, v14, v15, v13, (uint8_t *)&v20, v16);

    }
  }
  else
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      v11 = v17;
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v17;
      v22 = 2114;
      v23 = v12;
      v24 = 2112;
      v25 = v5;
      v13 = "%{public}@: [%{public}@] Successfully flushed %@ events";
      v14 = v9;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 32;
      goto LABEL_10;
    }
  }

  os_unfair_lock_lock_with_options();
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 16);
  *(_QWORD *)(v18 + 16) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_processOperationQueue");

}

void __50__AMSMetrics__beginFlushIntervalWithStyle_events___block_invoke_62(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  uint64_t v17;
  dispatch_block_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  dispatch_time_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  _QWORD block[4];
  id v38[2];
  id location;
  _BYTE buf[24];
  void *v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "_scheduledFlushAllowedForStyle:", *(_QWORD *)(a1 + 56)))
    return;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[17])
    return;
  objc_msgSend(v2, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v29, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "containerId");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v32;
      _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to schedule interval (no bag). ", buf, 0x16u);

    }
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "_flushIntervalWithConfiguration:forEvents:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (v4 == 0.0)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v29, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "containerId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v34;
      _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to schedule interval (no interval)", buf, 0x16u);

    }
LABEL_21:

    return;
  }
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 144))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
    v9 = v8;

    if (v9 <= v5)
      return;
    v6 = *(_QWORD *)(a1 + 32);
  }
  v10 = *(void **)(v6 + 136);
  if (v10)
    dispatch_block_cancel(v10);
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "containerId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 56);
    v16 = v5;
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2048;
    v41 = v15;
    LOWORD(v42) = 2048;
    *(double *)((char *)&v42 + 2) = v16;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Flush scheduled. (style: %ld, time: %.3f)", buf, 0x2Au);

  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v17 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AMSMetrics__beginFlushIntervalWithStyle_events___block_invoke_64;
  block[3] = &unk_1E2543290;
  objc_copyWeak(v38, &location);
  v38[1] = *(id *)(a1 + 56);
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
  v19 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = v18;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 144);
  *(_QWORD *)(v21 + 144) = v20;

  +[AMSMetrics sharedTimerQueue](AMSMetrics, "sharedTimerQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v25 = v23;
  v26 = v24;
  AMSLogKey();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 * 1000000000.0 <= 9.22337204e18)
    v28 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  else
    v28 = -1;
  *(_QWORD *)buf = v17;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __AMSDispatchAfter_block_invoke_3;
  v41 = &unk_1E253DC28;
  *(_QWORD *)&v42 = v27;
  *((_QWORD *)&v42 + 1) = v26;
  v35 = v26;
  v36 = v27;
  dispatch_after(v28, v25, buf);

  objc_destroyWeak(v38);
  objc_destroyWeak(&location);
}

void __50__AMSMetrics__beginFlushIntervalWithStyle_events___block_invoke_64(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleFlushIntervalWithStyle:", *(_QWORD *)(a1 + 40));
    v3 = (void *)v4[17];
    v4[17] = 0;

    WeakRetained = v4;
  }

}

- (void)_handleFlushIntervalWithStyle:(int64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  Class v14;
  void *v15;
  id v16;
  _QWORD *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  void (**v23)(_QWORD);
  Class v24;
  _QWORD aBlock[4];
  id v26[2];
  id location;
  _BYTE buf[24];
  void *v29;
  id v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[AMSMetrics sharedTimerQueue](AMSMetrics, "sharedTimerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = AMSSetLogKey(0);
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Scheduled flush fired", buf, 0x16u);

  }
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__AMSMetrics__handleFlushIntervalWithStyle___block_invoke;
  aBlock[3] = &unk_1E2543290;
  objc_copyWeak(v26, &location);
  v26[1] = (id)a3;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  v14 = NSClassFromString(CFSTR("UIApplication"));
  NSSelectorFromString(CFSTR("sharedApplication"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = (void *)MEMORY[0x1E0C80D38];
    v16 = MEMORY[0x1E0C80D38];
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __44__AMSMetrics__handleFlushIntervalWithStyle___block_invoke_2;
    v22[3] = &unk_1E2543330;
    v22[4] = self;
    v24 = v14;
    v23 = v13;
    v17 = v22;
    v18 = v15;
    AMSLogKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v12;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_3;
    v29 = &unk_1E253DC28;
    v30 = v19;
    v31 = v17;
    v20 = v19;
    v21 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], buf);

  }
  else
  {
    v13[2](v13);
  }

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

void __44__AMSMetrics__handleFlushIntervalWithStyle___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "_scheduledFlushAllowedForStyle:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(WeakRetained, "flush");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__AMSMetrics__handleFlushIntervalWithStyle___block_invoke_66;
    v9[3] = &unk_1E2543308;
    objc_copyWeak(&v10, v2);
    objc_msgSend(v4, "addFinishBlock:", v9);
    objc_destroyWeak(&v10);
  }
  else
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_opt_class();
      v7 = v6;
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping flush trigger", buf, 0x16u);

    }
  }

}

void __44__AMSMetrics__handleFlushIntervalWithStyle___block_invoke_66(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_beginFlushIntervalWithStyle:events:", 2, 0);

}

void __44__AMSMetrics__handleFlushIntervalWithStyle___block_invoke_2(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _BYTE v16[24];
  void *v17;
  id v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1[4], "monitorsLifecycleEvents"))
    goto LABEL_9;
  objc_msgSend(a1[6], "sharedApplication");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_9;
  v3 = (void *)v2;
  objc_msgSend(a1[6], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "applicationState");

  if (v5)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v16 = 138543618;
      *(_QWORD *)&v16[4] = v8;
      *(_WORD *)&v16[12] = 2114;
      *(_QWORD *)&v16[14] = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Scheduled flush unable to run while app is inactive", v16, 0x16u);

    }
    objc_msgSend(a1[4], "setFlushOnDidBecomeActiveBlock:", a1[5]);
  }
  else
  {
LABEL_9:
    +[AMSMetrics sharedTimerQueue](AMSMetrics, "sharedTimerQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = a1[5];
    AMSLogKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v16 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v16[8] = 3221225472;
    *(_QWORD *)&v16[16] = __AMSDispatchAsync_block_invoke_3;
    v17 = &unk_1E253DC28;
    v18 = v13;
    v19 = v12;
    v14 = v13;
    v15 = v12;
    dispatch_async(v11, v16);

  }
}

- (AMSMetrics)initWithContainerId:(id)a3 bagContract:(id)a4
{
  id v6;
  id v7;
  AMSContractBagShim *v8;
  AMSMetrics *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v6);

  v9 = -[AMSMetrics initWithContainerID:bag:](self, "initWithContainerID:bag:", v7, v8);
  return v9;
}

- (AMSMetricsBagContract)bagContract
{
  AMSDeprecatedBagContract *v3;
  void *v4;
  AMSDeprecatedBagContract *v5;

  v3 = [AMSDeprecatedBagContract alloc];
  -[AMSMetrics bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSDeprecatedBagContract initWithBag:](v3, "initWithBag:", v4);

  return (AMSMetricsBagContract *)v5;
}

- (void)setBagContract:(id)a3
{
  id v4;
  AMSContractBagShim *v5;

  v4 = a3;
  v5 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v4);

  -[AMSMetrics setBag:](self, "setBag:", v5);
}

- (void)setIncludeMMeClientInfoAndDeviceHeaders:(BOOL)a3
{
  self->_includeMMeClientInfoAndDeviceHeaders = a3;
}

- (void)setMaxRequestCount:(int64_t)a3
{
  self->_maxRequestCount = a3;
}

- (void)setMetricsSigningFlavour:(unint64_t)a3
{
  self->_metricsSigningFlavour = a3;
}

- (BOOL)monitorsLifecycleEvents
{
  return self->_monitorsLifecycleEvents;
}

- (void)setDatabaseSource:(id)a3
{
  objc_storeStrong((id *)&self->_databaseSource, a3);
}

- (void)setDestination:(int64_t)a3
{
  self->_destination = a3;
}

- (os_unfair_lock_s)engagementLock
{
  return self->_engagementLock;
}

- (void)setEngagementLock:(os_unfair_lock_s)a3
{
  self->_engagementLock = a3;
}

- (id)flushOnDidBecomeActiveBlock
{
  return self->_flushOnDidBecomeActiveBlock;
}

- (void)setFlushOnDidBecomeActiveBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDate)flushIntervalStartTime
{
  return self->_flushIntervalStartTime;
}

- (void)setFlushIntervalStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_flushIntervalStartTime, a3);
}

- (void)setTreatmentStore:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentStore, a3);
}

- (void)_applicationDidBecomeActive:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AMSMetrics flushOnDidBecomeActiveBlock](self, "flushOnDidBecomeActiveBlock", a3);
  v4 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      v8 = v7;
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running deferred flush after app became active", (uint8_t *)&v10, 0x16u);

    }
    -[AMSMetrics setFlushOnDidBecomeActiveBlock:](self, "setFlushOnDidBecomeActiveBlock:", 0);
    v4[2](v4);
  }

}

@end
