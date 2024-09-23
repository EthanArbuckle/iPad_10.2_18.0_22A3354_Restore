@implementation HMDBackgroundTaskManager

- (HMDBackgroundTaskManager)init
{
  void *v3;
  HMDDate *v4;
  HMDBackgroundTaskLogger *v5;
  HMDBackgroundTaskManager *v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(HMDDate);
  v5 = objc_alloc_init(HMDBackgroundTaskLogger);
  v6 = -[HMDBackgroundTaskManager initWithNotificationCenter:dateProvider:logger:](self, "initWithNotificationCenter:dateProvider:logger:", v3, v4, v5);

  return v6;
}

- (HMDBackgroundTaskManager)initWithNotificationCenter:(id)a3 dateProvider:(id)a4 logger:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDBackgroundTaskManager *v12;
  HMDBackgroundTaskManager *v13;
  uint64_t v14;
  NSMutableDictionary *tasksByIdentifier;
  uint64_t v16;
  NSMutableDictionary *pendingTaskDateByIdentifier;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDBackgroundTaskManager;
  v12 = -[HMDBackgroundTaskManager init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    tasksByIdentifier = v13->_tasksByIdentifier;
    v13->_tasksByIdentifier = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    pendingTaskDateByIdentifier = v13->_pendingTaskDateByIdentifier;
    v13->_pendingTaskDateByIdentifier = (NSMutableDictionary *)v16;

    objc_storeStrong((id *)&v13->_dateProvider, a4);
    objc_storeStrong((id *)&v13->_logger, a5);
    objc_storeStrong((id *)&v13->_notificationCenter, a3);
  }

  return v13;
}

- (BOOL)scheduleTaskWithIdentifier:(id)a3 fireDate:(id)a4 onObserver:(id)a5 selector:(SEL)a6 error:(id *)a7
{
  HMDBackgroundTask *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HMDBackgroundTask *v23;
  void *v24;
  HMDBackgroundTaskManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDBackgroundTaskManager *v30;
  NSObject *v31;
  void *v32;
  int v34;
  void *v35;
  __int16 v36;
  HMDBackgroundTask *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v12 = (HMDBackgroundTask *)a3;
  v13 = a4;
  v14 = a5;
  -[HMDBackgroundTaskManager notificationCenter](self, "notificationCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObserver:name:object:", v14, CFSTR("HMD.BGTM.NN"), 0);

  -[HMDBackgroundTaskManager notificationCenter](self, "notificationCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", v14, a6, CFSTR("HMD.BGTM.NN"), 0);

  -[HMDBackgroundTaskManager dateProvider](self, "dateProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock_with_options();
  -[HMDBackgroundTaskManager _handlePendingTaskWithIdentifier:date:](self, "_handlePendingTaskWithIdentifier:date:", v12, v18);
  -[HMDBackgroundTaskManager tasksByIdentifier](self, "tasksByIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HMDBackgroundTaskManager logger](self, "logger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "submitNotFiredLogEventForTask:", v20);

  }
  os_unfair_lock_unlock(&self->_lock);
  v22 = objc_msgSend(v13, "compare:", v18);
  if (v22 == -1)
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543874;
      v35 = v32;
      v36 = 2112;
      v37 = v12;
      v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to schedule task for identifier %@ with fire date in the past: %@", (uint8_t *)&v34, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[HMDBackgroundTaskManager _unregisterEventWithIdentifier:](self, "_unregisterEventWithIdentifier:", v12);
    v23 = -[HMDBackgroundTask initWithIdentifier:expectedFireDate:scheduledDate:]([HMDBackgroundTask alloc], "initWithIdentifier:expectedFireDate:scheduledDate:", v12, v13, v18);
    v24 = (void *)MEMORY[0x227676638](-[HMDBackgroundTaskManager _setTask:forIdentifier:](self, "_setTask:forIdentifier:", v23, v12));
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v18);
      v34 = 138543874;
      v35 = v27;
      v36 = 2112;
      v37 = v23;
      v38 = 2048;
      v39 = v28;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Scheduling task %@ (in %fs)", (uint8_t *)&v34, 0x20u);

    }
    objc_autoreleasePoolPop(v24);
    -[HMDBackgroundTaskManager _registerEventWithIdentifier:fireDate:](v25, "_registerEventWithIdentifier:fireDate:", v12, v13);

  }
  return v22 != -1;
}

- (void)cancelTaskWithIdentifier:(id)a3 onObserver:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDBackgroundTaskManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
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
    v18 = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Cancelling task with identifier: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDBackgroundTaskManager notificationCenter](v9, "notificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:name:object:", v7, CFSTR("HMD.BGTM.NN"), 0);

  os_unfair_lock_lock_with_options();
  -[HMDBackgroundTaskManager pendingTaskDateByIdentifier](v9, "pendingTaskDateByIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v6);

  -[HMDBackgroundTaskManager tasksByIdentifier](v9, "tasksByIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HMDBackgroundTaskManager logger](v9, "logger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "submitNotFiredLogEventForTask:", v15);

  }
  -[HMDBackgroundTaskManager tasksByIdentifier](v9, "tasksByIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, v6);

  os_unfair_lock_unlock(&v9->_lock);
  -[HMDBackgroundTaskManager _unregisterEventWithIdentifier:](v9, "_unregisterEventWithIdentifier:", v6);

}

- (BOOL)hasOutstandingTaskWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[HMDBackgroundTaskManager _taskForIdentifier:](self, "_taskForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)expectedFireDateForTaskWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDBackgroundTaskManager _taskForIdentifier:](self, "_taskForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "expectedFireDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)configure
{
  _QWORD handler[5];

  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __37__HMDBackgroundTaskManager_configure__block_invoke;
  handler[3] = &unk_24E785EC8;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.alarm", 0, handler);
}

- (void)_handleEvent:(id)a3
{
  id v4;
  const char *string;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  HMDBackgroundTaskManager *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  HMDBackgroundTaskManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDBackgroundTaskManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDBackgroundTaskManager *v30;
  NSObject *v31;
  void *v32;
  os_unfair_lock_s *p_lock;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x24BDACF50]);
  if (string)
  {
    v6 = string;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HMDBackgroundTaskManager _taskForIdentifier:](self, "_taskForIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackgroundTaskManager _setTask:forIdentifier:](self, "_setTask:forIdentifier:", 0, v7);
      -[HMDBackgroundTaskManager _unregisterEventWithIdentifier:](self, "_unregisterEventWithIdentifier:", v7);
      -[HMDBackgroundTaskManager dateProvider](self, "dateProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "now");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v8, "expectedFireDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceDate:", v10);
        v13 = v12 > 10.0;

        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v13)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "expectedFireDate");
            v19 = (char *)objc_claimAutoreleasedReturnValue();
            v37 = 138543874;
            v38 = v18;
            v39 = 2112;
            v40 = v19;
            v41 = 2112;
            v42 = v7;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Not executing task because xpc event was delivered too late, expected fire date: %@, identifier: %@", (uint8_t *)&v37, 0x20u);

          }
          objc_autoreleasePoolPop(v14);
          -[HMDBackgroundTaskManager logger](v15, "logger");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "submitNotFiredLogEventForTask:", v8);

        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 138543618;
            v38 = v35;
            v39 = 2112;
            v40 = (const char *)v8;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Executing task %@", (uint8_t *)&v37, 0x16u);

          }
          objc_autoreleasePoolPop(v14);
          -[HMDBackgroundTaskManager _postNotificationWithIdentifier:](v15, "_postNotificationWithIdentifier:", v7);
          -[HMDBackgroundTaskManager logger](v15, "logger");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "submitLogEventForTask:", v8);

        }
      }
      else
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 138543618;
          v38 = v32;
          v39 = 2112;
          v40 = (const char *)v7;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Pausing scheduled task until observer is added, identifier: %@", (uint8_t *)&v37, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        p_lock = &v30->_lock;
        os_unfair_lock_lock_with_options();
        -[HMDBackgroundTaskManager pendingTaskDateByIdentifier](v30, "pendingTaskDateByIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v10, v7);

        os_unfair_lock_unlock(p_lock);
      }

    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543618;
        v38 = v28;
        v39 = 2080;
        v40 = v6;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to execute task with missing identifier for event key name: %s", (uint8_t *)&v37, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543362;
      v38 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to execute task because xpc event key name is missing", (uint8_t *)&v37, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)_handlePendingTaskWithIdentifier:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  HMDBackgroundTaskManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDBackgroundTaskManager *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDBackgroundTaskManager pendingTaskDateByIdentifier](self, "pendingTaskDateByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v9, "timeIntervalSinceDate:", v7);
    if (v11 <= 10.0)
    {
      -[HMDBackgroundTaskManager pendingTaskDateByIdentifier](self, "pendingTaskDateByIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v6);

      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v20;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Executing pending task identifier: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDBackgroundTaskManager _postNotificationWithIdentifier:](v18, "_postNotificationWithIdentifier:", v6);
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638](v10);
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v15;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Not executing pending task because client was registered too late, expected fire date: %@, identifier: %@", (uint8_t *)&v21, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
    }
  }

}

- (void)_postNotificationWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__HMDBackgroundTaskManager__postNotificationWithIdentifier___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_registerEventWithIdentifier:(id)a3 fireDate:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  xpc_object_t v9;
  int64_t value;
  id v11;
  xpc_object_t xdict;

  v5 = a4;
  v6 = a3;
  xdict = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v5, "timeIntervalSince1970");
  v8 = v7;

  v9 = xpc_date_create(1000000000 * (uint64_t)v8);
  value = xpc_date_get_value(v9);
  xpc_dictionary_set_date(xdict, "Date", value);
  xpc_dictionary_set_BOOL(xdict, "UserVisible", 1);
  v11 = objc_retainAutorelease(v6);
  objc_msgSend(v11, "UTF8String");

  xpc_set_event();
}

- (void)_unregisterEventWithIdentifier:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  xpc_set_event();
}

- (void)_setTask:(id)a3 forIdentifier:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDBackgroundTaskManager tasksByIdentifier](self, "tasksByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);

  os_unfair_lock_unlock(p_lock);
}

- (id)_taskForIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDBackgroundTaskManager tasksByIdentifier](self, "tasksByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSMutableDictionary)tasksByIdentifier
{
  return self->_tasksByIdentifier;
}

- (NSMutableDictionary)pendingTaskDateByIdentifier
{
  return self->_pendingTaskDateByIdentifier;
}

- (HMDBackgroundTaskLogger)logger
{
  return self->_logger;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMDDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_pendingTaskDateByIdentifier, 0);
  objc_storeStrong((id *)&self->_tasksByIdentifier, 0);
}

void __60__HMDBackgroundTaskManager__postNotificationWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v5 = CFSTR("HMD.BGTM.NK");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("HMD.BGTM.NN"), 0, v4);

}

uint64_t __37__HMDBackgroundTaskManager_configure__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleEvent:", a2);
}

+ (HMDBackgroundTaskManager)sharedManager
{
  if (sharedManager__hmf_once_t0 != -1)
    dispatch_once(&sharedManager__hmf_once_t0, &__block_literal_global_121352);
  return (HMDBackgroundTaskManager *)(id)sharedManager__hmf_once_v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_121347 != -1)
    dispatch_once(&logCategory__hmf_once_t18_121347, &__block_literal_global_16_121348);
  return (id)logCategory__hmf_once_v19_121349;
}

void __39__HMDBackgroundTaskManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19_121349;
  logCategory__hmf_once_v19_121349 = v0;

}

void __41__HMDBackgroundTaskManager_sharedManager__block_invoke()
{
  HMDBackgroundTaskManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMDBackgroundTaskManager);
  v1 = (void *)sharedManager__hmf_once_v1;
  sharedManager__hmf_once_v1 = (uint64_t)v0;

}

@end
