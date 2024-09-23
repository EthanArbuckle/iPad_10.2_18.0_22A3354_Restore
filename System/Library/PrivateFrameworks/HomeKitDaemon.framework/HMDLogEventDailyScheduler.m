@implementation HMDLogEventDailyScheduler

- (HMDLogEventDailyScheduler)initWithIdentifier:(id)a3 preferencesKey:(id)a4 logEventSubmitter:(id)a5 xpcActivityInterface:(id)a6 dateFactory:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDLogEventDailyScheduler *v17;
  HMDLogEventDailyScheduler *v18;
  uint64_t v19;
  NSHashTable *mutableTaskRunners;
  void *v21;
  id dateFactory;
  void *v23;
  id v25;
  objc_super v26;

  v25 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HMDLogEventDailyScheduler;
  v17 = -[HMDLogEventDailyScheduler init](&v26, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_xpcActivityIdentifier, a3);
    objc_storeStrong((id *)&v18->_xpcActivityInterface, a6);
    objc_storeStrong((id *)&v18->_preferencesKey, a4);
    objc_storeStrong((id *)&v18->_logEventSubmitter, a5);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v19 = objc_claimAutoreleasedReturnValue();
    mutableTaskRunners = v18->_mutableTaskRunners;
    v18->_mutableTaskRunners = (NSHashTable *)v19;

    v21 = _Block_copy(v16);
    dateFactory = v18->_dateFactory;
    v18->_dateFactory = v21;

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      a5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a5, "objectForKey:", v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    objc_storeStrong((id *)&v18->_lastRunTime, v23);
    if (v13)
    {

    }
    -[HMDLogEventDailyScheduler _registerActivity](v18, "_registerActivity");
  }

  return v18;
}

- (id)_criteriaForActivity
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC600]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6B8], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC688], 1);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6F8], 1);
  return v2;
}

- (void)_registerActivity
{
  void *v3;
  HMDLogEventDailyScheduler *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLogEventDailyScheduler xpcActivityIdentifier](v4, "xpcActivityIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Registering XPC activity %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_initWeak((id *)buf, v4);
  -[HMDLogEventDailyScheduler xpcActivityInterface](v4, "xpcActivityInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLogEventDailyScheduler xpcActivityIdentifier](v4, "xpcActivityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__HMDLogEventDailyScheduler__registerActivity__block_invoke;
  v10[3] = &unk_24E78E680;
  objc_copyWeak(&v11, (id *)buf);
  objc_msgSend(v8, "registerXPCActivityWithActivityIdentifier:criteria:activityBlock:", v9, *MEMORY[0x24BDAC5A0], v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_handleCheckInForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDLogEventDailyScheduler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  void *v16;
  HMDLogEventDailyScheduler *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDLogEventDailyScheduler xpcActivityInterface](self, "xpcActivityInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "criteriaForXPCActivity:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLogEventDailyScheduler xpcActivityIdentifier](v8, "xpcActivityIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v6;
      v12 = "%{public}@Activity '%@' resurrected with criteria: %@";
      v13 = v9;
      v14 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v18, v14);

    }
  }
  else
  {
    -[HMDLogEventDailyScheduler xpcActivityInterface](self, "xpcActivityInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLogEventDailyScheduler _criteriaForActivity](self, "_criteriaForActivity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCriteria:forXPCActivity:", v16, v4);

    v7 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLogEventDailyScheduler xpcActivityIdentifier](v17, "xpcActivityIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      v12 = "%{public}@Activity '%@' created for the first time";
      v13 = v9;
      v14 = 22;
      goto LABEL_6;
    }
  }

  objc_autoreleasePoolPop(v7);
}

- (void)_runActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void (**v8)(void);
  void *v9;
  void *v10;
  double v11;
  void *v12;
  HMDXPCActivityRunReportLogEvent *v13;
  void *v14;
  HMDXPCActivityRunReportLogEvent *v15;
  void (**v16)(void);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDLogEventDailyScheduler xpcActivityInterface](self, "xpcActivityInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:forXPCActivity:", 4, v4);

  -[HMDLogEventDailyScheduler lastRunTime](self, "lastRunTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 86400.0;
  if (v6)
  {
    -[HMDLogEventDailyScheduler dateFactory](self, "dateFactory");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLogEventDailyScheduler lastRunTime](self, "lastRunTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v7 = v11;

  }
  -[HMDLogEventDailyScheduler logEventSubmitter](self, "logEventSubmitter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [HMDXPCActivityRunReportLogEvent alloc];
  -[HMDLogEventDailyScheduler xpcActivityIdentifier](self, "xpcActivityIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDXPCActivityRunReportLogEvent initWithActivityName:definedInterval:activityShouldWake:timeSinceLastRun:](v13, "initWithActivityName:definedInterval:activityShouldWake:timeSinceLastRun:", v14, 1, 86400.0, v7);
  objc_msgSend(v12, "submitLogEvent:", v15);

  if (v7 >= 72000.0)
  {
    -[HMDLogEventDailyScheduler dateFactory](self, "dateFactory");
    v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v16[2]();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLogEventDailyScheduler setLastRunTime:](self, "setLastRunTime:", v17);

    -[HMDLogEventDailyScheduler preferencesKey](self, "preferencesKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLogEventDailyScheduler lastRunTime](self, "lastRunTime");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLogEventDailyScheduler preferencesKey](self, "preferencesKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v20, v21);

    }
    v22 = (void *)MEMORY[0x227676638]();
    self = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLogEventDailyScheduler xpcActivityIdentifier](self, "xpcActivityIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v24;
      v29 = 2112;
      v30 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Running activity '%@'", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    -[HMDLogEventDailyScheduler runDailyTasks](self, "runDailyTasks");
  }
  -[HMDLogEventDailyScheduler xpcActivityInterface](self, "xpcActivityInterface");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setState:forXPCActivity:", 5, v4);

}

- (void)registerDailyTaskRunner:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSHashTable addObject:](self->_mutableTaskRunners, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)taskRunners
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSHashTable allObjects](self->_mutableTaskRunners, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)runDailyTasks
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  HMDLogEventDailyScheduler *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDLogEventDailyScheduler taskRunners](self, "taskRunners");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x227676638]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v19 = v12;
          v20 = 2112;
          v21 = v13;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Running daily task for '%@'", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v9);
        objc_msgSend(v8, "runDailyTask");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v5);
  }

}

- (void)runHomeutilTasks
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  void *v9;
  HMDLogEventDailyScheduler *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMDLogEventDailyScheduler taskRunners](self, "taskRunners");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v8 = objc_opt_respondsToSelector();
        v9 = (void *)MEMORY[0x227676638]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
        if ((v8 & 1) != 0)
        {
          if (v12)
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v23 = v13;
            v24 = 2112;
            v25 = v14;
            _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Running daily QA task for '%@'", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v9);
          objc_msgSend(v7, "runHomeutilTask");
        }
        else
        {
          if (v12)
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v23 = v15;
            v24 = 2112;
            v25 = v16;
            _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Running daily task for '%@'", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v9);
          objc_msgSend(v7, "runDailyTask");
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v4);
  }

}

- (id)statusSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("xpcActivityIdentifier");
  -[HMDLogEventDailyScheduler xpcActivityIdentifier](self, "xpcActivityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("lastRunTime");
  v9[0] = v3;
  -[HMDLogEventDailyScheduler lastRunTime](self, "lastRunTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[HMDLogEventDailyScheduler lastRunTime](self, "lastRunTime");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dateFactory
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setDateFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSDate)lastRunTime
{
  return self->_lastRunTime;
}

- (void)setLastRunTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastRunTime, a3);
}

- (NSString)xpcActivityIdentifier
{
  return self->_xpcActivityIdentifier;
}

- (NSString)preferencesKey
{
  return self->_preferencesKey;
}

- (NSHashTable)mutableTaskRunners
{
  return self->_mutableTaskRunners;
}

- (void)setMutableTaskRunners:(id)a3
{
  objc_storeStrong((id *)&self->_mutableTaskRunners, a3);
}

- (HMDXPCActivityInterfacing)xpcActivityInterface
{
  return self->_xpcActivityInterface;
}

- (void)setXpcActivityInterface:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityInterface, a3);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_xpcActivityInterface, 0);
  objc_storeStrong((id *)&self->_mutableTaskRunners, 0);
  objc_storeStrong((id *)&self->_preferencesKey, 0);
  objc_storeStrong((id *)&self->_xpcActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_lastRunTime, 0);
  objc_storeStrong(&self->_dateFactory, 0);
}

void __46__HMDLogEventDailyScheduler__registerActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
    v8 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "xpcActivityIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Activity '%@' handler ran after scheduler was deallocated", (uint8_t *)&v15, 0x16u);

    }
    goto LABEL_11;
  }
  objc_msgSend(WeakRetained, "xpcActivityInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "stateForXPCActivity:", v3);

  if (v7 == 2)
  {
    objc_msgSend(v5, "_runActivity:", v3);
    goto LABEL_12;
  }
  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = v5;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject xpcActivityIdentifier](v9, "xpcActivityIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2048;
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Activity '%@' callback with unhandled state: %ld", (uint8_t *)&v15, 0x20u);

    }
LABEL_11:

    objc_autoreleasePoolPop(v8);
    goto LABEL_12;
  }
  objc_msgSend(v5, "_handleCheckInForActivity:", v3);
LABEL_12:

}

+ (id)createSchedulerWithLogEventSubmitter:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HMDLogEventDailyScheduler_createSchedulerWithLogEventSubmitter___block_invoke;
  block[3] = &unk_24E79C240;
  v11 = v3;
  v4 = createSchedulerWithLogEventSubmitter__onceToken;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&createSchedulerWithLogEventSubmitter__onceToken, block);
    v7 = v11;
  }
  v8 = (id)createSchedulerWithLogEventSubmitter__result;

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11 != -1)
    dispatch_once(&logCategory__hmf_once_t11, &__block_literal_global_19);
  return (id)logCategory__hmf_once_v12;
}

void __40__HMDLogEventDailyScheduler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12;
  logCategory__hmf_once_v12 = v0;

}

void __66__HMDLogEventDailyScheduler_createSchedulerWithLogEventSubmitter___block_invoke(uint64_t a1)
{
  HMDLogEventDailyScheduler *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  HMDXPCActivityInterface *v6;

  v2 = [HMDLogEventDailyScheduler alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v6 = objc_alloc_init(HMDXPCActivityInterface);
  v4 = -[HMDLogEventDailyScheduler initWithIdentifier:preferencesKey:logEventSubmitter:xpcActivityInterface:dateFactory:](v2, "initWithIdentifier:preferencesKey:logEventSubmitter:xpcActivityInterface:dateFactory:", CFSTR("com.apple.homed.logEvent.dailyScheduler"), CFSTR("HMDLogEventDailySchedulerLastRunTimeKey"), v3, v6, &__block_literal_global_28684);
  v5 = (void *)createSchedulerWithLogEventSubmitter__result;
  createSchedulerWithLogEventSubmitter__result = v4;

}

uint64_t __66__HMDLogEventDailyScheduler_createSchedulerWithLogEventSubmitter___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "now");
}

@end
