@implementation ARServer

- (ARServer)initWithDaemonConfiguration:(id)a3 spawnTime:(id)a4 sessionUUID:(id)a5 watchdogMonitor:(id)a6 executionManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  ARServer *v19;
  ARServer *v20;
  uint64_t v21;
  NSMutableArray *services;
  uint64_t v23;
  NSMutableDictionary *servicesByClass;
  uint64_t v25;
  NSMutableDictionary *servicesByPID;
  NSArray *servicesBeingAdded;
  uint64_t v28;
  OS_dispatch_queue *serviceQueue;
  uint64_t v30;
  NSMutableArray *batchedServices;
  dispatch_semaphore_t v32;
  OS_dispatch_semaphore *batchedServicesConfiguredSemaphore;
  ARControlListener *v34;
  ARControlListener *controlListener;
  ARDaemonStatusLogger *v36;
  ARDaemonStatusLogger *statusLogger;
  uint64_t v38;
  ARUserProfile *userProfile;
  objc_super v41;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  _ARLogDaemon_4();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ARServerInitialization", (const char *)&unk_235C5559A, buf, 2u);
  }

  v41.receiver = self;
  v41.super_class = (Class)ARServer;
  v19 = -[ARServer init](&v41, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_daemonConfiguration, a3);
    objc_storeStrong((id *)&v20->_spawnTime, a4);
    objc_storeStrong((id *)&v20->_sessionUUID, a5);
    v21 = objc_opt_new();
    services = v20->_services;
    v20->_services = (NSMutableArray *)v21;

    v23 = objc_opt_new();
    servicesByClass = v20->_servicesByClass;
    v20->_servicesByClass = (NSMutableDictionary *)v23;

    v25 = objc_opt_new();
    servicesByPID = v20->_servicesByPID;
    v20->_servicesByPID = (NSMutableDictionary *)v25;

    servicesBeingAdded = v20->_servicesBeingAdded;
    v20->_servicesBeingAdded = (NSArray *)MEMORY[0x24BDBD1A8];

    v20->_servicesLock._os_unfair_lock_opaque = 0;
    v20->_batchedServicesLock._os_unfair_lock_opaque = 0;
    ARCreateFixedPriorityDispatchQueue();
    v28 = objc_claimAutoreleasedReturnValue();
    serviceQueue = v20->_serviceQueue;
    v20->_serviceQueue = (OS_dispatch_queue *)v28;

    objc_msgSend(v16, "addQueue:hangPolicy:", v20->_serviceQueue, 0);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v30 = objc_claimAutoreleasedReturnValue();
    batchedServices = v20->_batchedServices;
    v20->_batchedServices = (NSMutableArray *)v30;

    v32 = dispatch_semaphore_create(0);
    batchedServicesConfiguredSemaphore = v20->_batchedServicesConfiguredSemaphore;
    v20->_batchedServicesConfiguredSemaphore = (OS_dispatch_semaphore *)v32;

    v34 = -[ARControlListener initWithDelegate:daemonConfiguration:]([ARControlListener alloc], "initWithDelegate:daemonConfiguration:", v20, v20->_daemonConfiguration);
    controlListener = v20->_controlListener;
    v20->_controlListener = v34;

    v36 = (ARDaemonStatusLogger *)objc_alloc_init(MEMORY[0x24BDFD920]);
    statusLogger = v20->_statusLogger;
    v20->_statusLogger = v36;

    +[ARUserProfile defaultProfile](ARUserProfile, "defaultProfile");
    v38 = objc_claimAutoreleasedReturnValue();
    userProfile = v20->_userProfile;
    v20->_userProfile = (ARUserProfile *)v38;

    -[ARServer _setupHealthReportLogTimer](v20, "_setupHealthReportLogTimer");
  }
  __95__ARServer_initWithDaemonConfiguration_spawnTime_sessionUUID_watchdogMonitor_executionManager___block_invoke();

  return v20;
}

void __95__ARServer_initWithDaemonConfiguration_spawnTime_sessionUUID_watchdogMonitor_executionManager___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _ARLogDaemon_4();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ARServerInitialization", (const char *)&unk_235C5559A, v1, 2u);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[ARServer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ARServer;
  -[ARServer dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *serviceQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARServer *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _ARLogDaemon_4();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_235C46000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Invalidating services", buf, 0x16u);

  }
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__ARServer_invalidate__block_invoke;
  block[3] = &unk_250702718;
  block[4] = self;
  dispatch_async_and_wait(serviceQueue, block);
}

void __22__ARServer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 112);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 16), "enumerateObjectsUsingBlock:", &__block_literal_global_9);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __22__ARServer_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (void)resume
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  ARServer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ARLogDaemon_4();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_235C46000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Resuming services", (uint8_t *)&v6, 0x16u);

  }
  os_unfair_lock_lock(&self->_servicesLock);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_services, "enumerateObjectsUsingBlock:", &__block_literal_global_10);
  os_unfair_lock_unlock(&self->_servicesLock);
}

uint64_t __18__ARServer_resume__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resume");
}

- (BOOL)servicesIsEmpty
{
  ARServer *v2;
  os_unfair_lock_s *p_servicesLock;

  v2 = self;
  p_servicesLock = &self->_servicesLock;
  os_unfair_lock_lock(&self->_servicesLock);
  LOBYTE(v2) = -[NSMutableArray count](v2->_services, "count") == 0;
  os_unfair_lock_unlock(p_servicesLock);
  return (char)v2;
}

- (void)suspend
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  ARServer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ARLogDaemon_4();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_235C46000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Suspending services", (uint8_t *)&v6, 0x16u);

  }
  os_unfair_lock_lock(&self->_servicesLock);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_services, "enumerateObjectsUsingBlock:", &__block_literal_global_11);
  os_unfair_lock_unlock(&self->_servicesLock);
}

uint64_t __19__ARServer_suspend__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "suspend");
}

- (id)daemonServiceForServiceNamed:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_services;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend((id)objc_opt_class(), "serviceName", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_addServices:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v28;
  os_log_t log;
  _BOOL4 v30;
  id v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  ARServer *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  _ARLogDaemon_4();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v6;
    v41 = 2048;
    v42 = self;
    v43 = 2112;
    v44 = v33;
    _os_log_impl(&dword_235C46000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Adding services '%@'", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_servicesLock);
  -[ARServer setServicesBeingAdded:](self, "setServicesBeingAdded:", v33);
  if (objc_msgSend(v32, "count"))
  {
    objc_msgSend(v32, "arrayByAddingObjectsFromArray:", self->_services);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v32, "componentsJoinedByString:", CFSTR(", "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("ARServer: Triggering algorithm update due to adding services: %@"), v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    _ARLogGeneral_1();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      _os_log_impl(&dword_235C46000, v9, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }

    _ARLogDaemon_4();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      _os_signpost_emit_with_name_impl(&dword_235C46000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ARKitTransitionUpdateWithServices", "%{public}@", buf, 0xCu);
    }

    v38 = 0;
    v30 = -[ARServer _updateWithServices:error:](self, "_updateWithServices:error:", log, &v38);
    v31 = v38;
    if (v30)
    {
      v11 = -[NSObject mutableCopy](log, "mutableCopy");
      -[ARServer setServices:](self, "setServices:", v11);

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v12 = v32;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v35 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_servicesByClass, "objectForKeyedSubscript:", objc_opt_class());
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              v17 = (void *)objc_opt_new();
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_servicesByClass, "setObject:forKeyedSubscript:", v17, objc_opt_class());
            }
            objc_msgSend(v17, "addObject:", v16);
            +[ARDaemonMetrics sharedDaemonMetrics](ARDaemonMetrics, "sharedDaemonMetrics");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_opt_class(), "serviceName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "clientBundleIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "reportServiceAddedWithName:clientBundleIdentifier:", v19, v20);

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
        }
        while (v13);
      }

    }
    __25__ARServer__addServices___block_invoke();

  }
  else
  {
    _ARLogDaemon_4();
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary allKeys](self->_servicesByClass, "allKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v40 = v22;
      v41 = 2048;
      v42 = self;
      v43 = 2112;
      v44 = v33;
      v45 = 2112;
      v46 = v23;
      _os_log_impl(&dword_235C46000, log, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No services to be added from %@ to %@", buf, 0x2Au);

    }
    v31 = 0;
    LOBYTE(v30) = 0;
  }

  -[ARServer setServicesBeingAdded:](self, "setServicesBeingAdded:", MEMORY[0x24BDBD1A8]);
  os_unfair_lock_unlock(&self->_servicesLock);
  if (v31)
  {
    _ARLogDaemon_4();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v26;
      v41 = 2048;
      v42 = self;
      v43 = 2112;
      v44 = v31;
      _os_log_impl(&dword_235C46000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error setting up service: %@", buf, 0x20u);

    }
    LOBYTE(v30) = 0;
  }

  return v30;
}

void __25__ARServer__addServices___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _ARLogDaemon_4();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ARKitTransitionUpdateWithServices", (const char *)&unk_235C5559A, v1, 2u);
  }

}

- (id)listenerEndPointForServiceNamed:(id)a3
{
  ARDaemonConfiguration *daemonConfiguration;
  id v5;
  void *v6;
  int v7;
  void *v8;

  daemonConfiguration = self->_daemonConfiguration;
  v5 = a3;
  objc_msgSend((id)-[ARDaemonConfiguration controlClass](daemonConfiguration, "controlClass"), "performSelector:", sel_serviceName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[ARControlListener endpoint](self->_controlListener, "endpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)statusDictionaryWithWaitEndOfTransition:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = CFSTR("pid");
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "processIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v6;
  v41 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v11);

  ARGetSystemBootTime();
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "timeSinceSnapshot:", self->_spawnTime);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDBCE60];
  -[ARSystemTimeSnapshot upTimeIncludingSleepAndDriftCorrection](self->_spawnTime, "upTimeIncludingSleepAndDriftCorrection");
  objc_msgSend(v16, "dateWithTimeIntervalSince1970:", v13 + v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "ar_timestampWithDate:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_spawn_time"), v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v20);

  v21 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v15, "upTime");
  objc_msgSend(v21, "ar_hoursMinutesSecondsWithTimeInterval:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_up_time"), v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, v23);

  v24 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v15, "upTimeIncludingSleep");
  objc_msgSend(v24, "ar_hoursMinutesSecondsWithTimeInterval:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_up_time_including_sleep"), v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, v26);

  v27 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v15, "upTimeIncludingSleepAndDriftCorrection");
  objc_msgSend(v27, "ar_hoursMinutesSecondsWithTimeInterval:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_up_time_including_sleep_and_drift_correction"), v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, v29);

  v30 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "ar_timestampWithDate:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("system_boot_time"));

  v33 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v14, "upTime");
  objc_msgSend(v33, "ar_hoursMinutesSecondsWithTimeInterval:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("system_up_time"));

  v35 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v14, "upTimeIncludingSleep");
  objc_msgSend(v35, "ar_hoursMinutesSecondsWithTimeInterval:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("system_up_time_including_sleep"));

  v37 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v14, "upTimeIncludingSleepAndDriftCorrection");
  objc_msgSend(v37, "ar_hoursMinutesSecondsWithTimeInterval:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("system_up_time_including_sleep_and_drift_correction"));

  return v4;
}

- (id)statusStringWithWaitEndOfTransition:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ARGetSystemBootTime();
  v8 = v7;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "timeSinceSnapshot:", self->_spawnTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCE60];
  -[ARSystemTimeSnapshot upTimeIncludingSleepAndDriftCorrection](self->_spawnTime, "upTimeIncludingSleepAndDriftCorrection");
  objc_msgSend(v11, "dateWithTimeIntervalSince1970:", v8 + v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@ pid: %d\n"), v6, objc_msgSend(v14, "processIdentifier"));

  objc_msgSend(MEMORY[0x24BDD17C8], "ar_timestampWithDate:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@ spawn time: %@\n"), v6, v15);

  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "upTime");
  objc_msgSend(v16, "ar_hoursMinutesSecondsWithTimeInterval:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@ up time: %@\n"), v6, v17);

  v18 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "upTimeIncludingSleep");
  objc_msgSend(v18, "ar_hoursMinutesSecondsWithTimeInterval:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@ up time (including sleep): %@\n"), v6, v19);

  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "upTimeIncludingSleepAndDriftCorrection");
  objc_msgSend(v20, "ar_hoursMinutesSecondsWithTimeInterval:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@ up time (including sleep and drift correction): %@\n"), v6, v21);

  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ar_timestampWithDate:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("System boot time: %@\n"), v24);

  v25 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "upTime");
  objc_msgSend(v25, "ar_hoursMinutesSecondsWithTimeInterval:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("System up time: %@\n"), v26);

  v27 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "upTimeIncludingSleep");
  objc_msgSend(v27, "ar_hoursMinutesSecondsWithTimeInterval:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("System up time (including sleep): %@\n"), v28);

  v29 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "upTimeIncludingSleepAndDriftCorrection");
  objc_msgSend(v29, "ar_hoursMinutesSecondsWithTimeInterval:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("System up time (including sleep and drift correction): %@\n"), v30);

  return v4;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (id)service:(id)a3 peerServiceOfType:(Class)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[ARServer _peerServicesOfService:](self, "_peerServicesOfService:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__ARServer_service_peerServiceOfType___block_invoke;
  v8[3] = &__block_descriptor_40_e32_B32__0__ARDaemonService_8Q16_B24lu32l8;
  v8[4] = a4;
  objc_msgSend(v5, "ar_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __38__ARServer_service_peerServiceOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "isMemberOfClass:", *(_QWORD *)(a1 + 32)))
    v4 = objc_msgSend(v3, "isActive");
  else
    v4 = 0;

  return v4;
}

- (int64_t)numberOfActiveConnectionsForService:(id)a3
{
  id v4;
  os_unfair_lock_s *p_servicesLock;
  void *v6;
  NSMutableArray *services;
  id v8;
  int64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  p_servicesLock = &self->_servicesLock;
  os_unfair_lock_lock(&self->_servicesLock);
  objc_msgSend((id)objc_opt_class(), "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  services = self->_services;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__ARServer_numberOfActiveConnectionsForService___block_invoke;
  v11[3] = &unk_250702988;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  -[NSMutableArray enumerateObjectsUsingBlock:](services, "enumerateObjectsUsingBlock:", v11);
  v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  os_unfair_lock_unlock(p_servicesLock);

  return v9;
}

void __48__ARServer_numberOfActiveConnectionsForService___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((_DWORD)v2)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (id)_peerServicesOfService:(id)a3
{
  id v4;
  os_unfair_lock_s *p_servicesLock;
  void *v6;
  NSMutableArray *services;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  p_servicesLock = &self->_servicesLock;
  os_unfair_lock_lock(&self->_servicesLock);
  v6 = (void *)objc_opt_new();
  services = self->_services;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __35__ARServer__peerServicesOfService___block_invoke;
  v13[3] = &unk_2507029B0;
  v8 = v4;
  v14 = v8;
  v9 = v6;
  v15 = v9;
  -[NSMutableArray enumerateObjectsUsingBlock:](services, "enumerateObjectsUsingBlock:", v13);
  v10 = v15;
  v11 = v9;

  os_unfair_lock_unlock(p_servicesLock);
  return v11;
}

void __35__ARServer__peerServicesOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    v7 = v3;
    v5 = objc_msgSend(v3, "clientProcessIdentifier");
    v6 = objc_msgSend(*(id *)(a1 + 32), "clientProcessIdentifier");
    v4 = v7;
    if (v5 == v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
      v4 = v7;
    }
  }

}

- (BOOL)_updateWithServices:(id)a3 error:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  -[ARServer _logDaemonStatus](self, "_logDaemonStatus");
  return 1;
}

- (void)_removeService:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  ARServer *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  _ARLogDaemon_4();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v7;
    v26 = 2048;
    v27 = self;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_235C46000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removing service '%@'", buf, 0x20u);

  }
  os_unfair_lock_lock(&self->_servicesLock);
  -[ARServer setServiceBeingRemoved:](self, "setServiceBeingRemoved:", v4);
  v8 = (void *)-[NSMutableArray mutableCopy](self->_services, "mutableCopy");
  if (objc_msgSend(v8, "containsObject:", v4))
  {
    objc_msgSend(v8, "removeObject:", v4);
  }
  else
  {
    _ARLogDaemon_4();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortenedServiceNameForLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v11;
      v26 = 2048;
      v27 = self;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_235C46000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Tried to remove service %@, but it was not found in active services", buf, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ARServer: Triggering algorithm update due to the removal of a service: %@"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _ARLogGeneral_1();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_log_impl(&dword_235C46000, v14, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
  }

  _ARLogDaemon_4();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ARKitTransitionUpdateWithServices", "%{public}@", buf, 0xCu);
  }

  v23 = 0;
  v16 = -[ARServer _updateWithServices:error:](self, "_updateWithServices:error:", v8, &v23);
  v17 = v23;
  if (v16)
  {
    -[ARServer setServices:](self, "setServices:", v8);
    -[ARServer _removeServiceFromServicesByClass:](self, "_removeServiceFromServicesByClass:", v4);
    +[ARDaemonMetrics sharedDaemonMetrics](ARDaemonMetrics, "sharedDaemonMetrics");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "serviceName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject reportServiceRemovedWithName:clientBundleIdentifier:](v18, "reportServiceRemovedWithName:clientBundleIdentifier:", v19, v20);

  }
  else
  {
    _ARLogDaemon_4();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v22;
      v26 = 2048;
      v27 = self;
      v28 = 2112;
      v29 = v4;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_235C46000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error removing service %@: %@", buf, 0x2Au);

    }
  }

  -[ARServer setServiceBeingRemoved:](self, "setServiceBeingRemoved:", 0);
  os_unfair_lock_unlock(&self->_servicesLock);
  __25__ARServer__addServices___block_invoke();

}

- (void)setServices:(id)a3
{
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  if (os_unfair_lock_trylock(&self->_servicesLock))
  {
    os_unfair_lock_unlock(&self->_servicesLock);
  }
  else
  {
    objc_storeStrong((id *)&self->_services, a3);
    -[ARServer _updateServicesByPID](self, "_updateServicesByPID");
  }

}

- (void)_updateServicesByPID
{
  void *v3;
  NSMutableArray *services;
  NSMutableDictionary *v5;
  NSMutableDictionary *servicesByPID;
  NSMutableDictionary *v7;
  _QWORD v8[4];
  NSMutableDictionary *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  if (os_unfair_lock_trylock(&self->_servicesLock))
  {
    os_unfair_lock_unlock(&self->_servicesLock);
  }
  else
  {
    v3 = (void *)objc_opt_new();
    services = self->_services;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__ARServer__updateServicesByPID__block_invoke;
    v8[3] = &unk_2507029D8;
    v5 = v3;
    v9 = v5;
    -[NSMutableArray enumerateObjectsUsingBlock:](services, "enumerateObjectsUsingBlock:", v8);
    servicesByPID = self->_servicesByPID;
    self->_servicesByPID = v5;
    v7 = v5;

  }
}

void __32__ARServer__updateServicesByPID__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v5, "processIdentifier"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

}

- (id)_fullDescription
{
  return -[ARServer fullDescriptionWithWaitEndOfTransition:](self, "fullDescriptionWithWaitEndOfTransition:", 0);
}

- (id)fullDescriptionWithWaitEndOfTransition:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v5 = (void *)MEMORY[0x24BDD16A8];
  -[ARServer description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARServer statusStringWithWaitEndOfTransition:](self, "statusStringWithWaitEndOfTransition:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("-Status: (%@)\n"), v8);

  objc_msgSend(v7, "appendFormat:", CFSTR("-Services: %@\n"), self->_services);
  -[NSMutableDictionary allKeys](self->_servicesByClass, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("-Service Classes: %@\n"), v9);

  return v7;
}

- (void)_removeServiceFromServicesByClass:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_servicesByClass, "objectForKeyedSubscript:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "removeObject:", v6);
    if (!objc_msgSend(v5, "count"))
      -[NSMutableDictionary removeObjectForKey:](self->_servicesByClass, "removeObjectForKey:", objc_opt_class());
  }

}

- (void)didDiscoverService:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  ARServer *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  v5 = _os_activity_create(&dword_235C46000, "Daemon service discovered", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v9);

  _ARLogDaemon_4();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v11 = v8;
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_235C46000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Service '%@' was discovered.", buf, 0x20u);

  }
  objc_msgSend(v4, "setDelegate:", self, v9.opaque[0], v9.opaque[1]);
  objc_msgSend(v4, "setDataSource:", self);
  -[ARServer _configureServiceForExecution:](self, "_configureServiceForExecution:", v4);
  os_activity_scope_leave(&v9);

}

- (BOOL)_shouldAddService:(Class)a3 forPID:(int)a4
{
  uint64_t v4;
  unint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  NSMutableDictionary *servicesByPID;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  ARServer *v27;
  __int16 v28;
  _BYTE v29[14];
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v4 = *(_QWORD *)&a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v7 = -[objc_class maximumConcurrentServicesPerClient](a3, "maximumConcurrentServicesPerClient");
  _ARLogGeneral_1();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v25 = v10;
    v26 = 2048;
    v27 = self;
    v28 = 1024;
    *(_DWORD *)v29 = v4;
    *(_WORD *)&v29[4] = 2112;
    *(_QWORD *)&v29[6] = a3;
    v30 = 2048;
    v31 = v7;
    _os_log_impl(&dword_235C46000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Checking pid %d: class %@ has maximum %ld concurrent services", buf, 0x30u);

  }
  servicesByPID = self->_servicesByPID;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](servicesByPID, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __37__ARServer__shouldAddService_forPID___block_invoke;
  v23[3] = &__block_descriptor_40_e32_B32__0__ARDaemonService_8Q16_B24lu32l8;
  v23[4] = a3;
  v14 = (void *)MEMORY[0x23B7DC638](v23);
  if (v13)
  {
    objc_msgSend(v13, "indexesOfObjectsPassingTest:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

  }
  else
  {
    v16 = 0;
  }
  os_unfair_lock_lock_with_options();
  -[NSMutableArray indexesOfObjectsPassingTest:](self->_batchedServices, "indexesOfObjectsPassingTest:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count") + v16;

  os_unfair_lock_unlock(&self->_batchedServicesLock);
  if (v18 >= v7)
  {
    _ARLogDaemon_4();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v25 = v21;
      v26 = 2048;
      v27 = self;
      v28 = 2114;
      *(_QWORD *)v29 = a3;
      *(_WORD *)&v29[8] = 1024;
      *(_DWORD *)&v29[10] = v4;
      v30 = 2048;
      v31 = v7;
      _os_log_impl(&dword_235C46000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Rejecting service %{public}@ for pid %d, exceeds maximum services of type per client (%ld)", buf, 0x30u);

    }
  }

  return v18 < v7;
}

BOOL __37__ARServer__shouldAddService_forPID___block_invoke(uint64_t a1)
{
  return objc_opt_class() == *(_QWORD *)(a1 + 32);
}

- (void)_configureServiceForExecution:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *serviceQueue;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22[2];
  uint8_t v23[16];
  _QWORD block[4];
  id v25;
  _BYTE *v26;
  id v27;
  id location;
  _BYTE buf[24];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  _ARLogDaemon_4();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    v30 = v4;
    _os_log_impl(&dword_235C46000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Configuring service '%{public}@' for execution", buf, 0x20u);

  }
  _ARLogDaemon_4();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (char *)os_signpost_id_generate(v8);

  _ARLogDaemon_4();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientProcessName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v14;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "AddServiceWaitServiceQueue", "%{public}@(%{public}@)", buf, 0x16u);

  }
  objc_initWeak(&location, self);
  if (self->_numServicesToBatchCommit)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v30) = 0;
    serviceQueue = self->_serviceQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__ARServer__configureServiceForExecution___block_invoke;
    block[3] = &unk_250702A00;
    objc_copyWeak(&v27, &location);
    v16 = v4;
    v25 = v16;
    v26 = buf;
    dispatch_async_and_wait(serviceQueue, block);
    os_unfair_lock_lock_with_options();
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      --self->_numServicesToBatchCommit;
    else
      -[NSMutableArray addObject:](self->_batchedServices, "addObject:", v16);
    if (-[NSMutableArray count](self->_batchedServices, "count") >= self->_numServicesToBatchCommit)
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_batchedServicesConfiguredSemaphore);
    os_unfair_lock_unlock(&self->_batchedServicesLock);
    _ARLogDaemon_4();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_235C46000, v19, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "AddServiceWaitServiceQueue", (const char *)&unk_235C5559A, v23, 2u);
    }

    objc_destroyWeak(&v27);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v17 = self->_serviceQueue;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __42__ARServer__configureServiceForExecution___block_invoke_77;
    v20[3] = &unk_250702A48;
    objc_copyWeak(v22, &location);
    v22[1] = v9;
    v21 = v4;
    dispatch_async_and_wait(v17, v20);

    objc_destroyWeak(v22);
  }
  objc_destroyWeak(&location);

}

void __42__ARServer__configureServiceForExecution___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(WeakRetained, "_shouldAddService:forPID:", objc_opt_class(), objc_msgSend(*(id *)(a1 + 32), "clientProcessIdentifier")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientService");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDFD840], 501, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "serviceConfiguredWithError:", v3);

    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __42__ARServer__configureServiceForExecution___block_invoke_77(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _ARLogDaemon_4();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v4, OS_SIGNPOST_INTERVAL_END, v5, "AddServiceWaitServiceQueue", (const char *)&unk_235C5559A, buf, 2u);
  }

  if ((objc_msgSend(WeakRetained, "_shouldAddService:forPID:", objc_opt_class(), objc_msgSend(*(id *)(a1 + 32), "clientProcessIdentifier")) & 1) != 0)
  {
    _ARLogDaemon_4();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 48);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clientProcessName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v11;
      _os_signpost_emit_with_name_impl(&dword_235C46000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AddService", "%{public}@(%{public}@)", buf, 0x16u);

    }
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __42__ARServer__configureServiceForExecution___block_invoke_78;
    v14[3] = &__block_descriptor_40_e5_v8__0l;
    v14[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(WeakRetained, "updateAlgorithmConfigurationWithService:", *(_QWORD *)(a1 + 32));
    __42__ARServer__configureServiceForExecution___block_invoke_78((uint64_t)v14);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "clientService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDFD840], 501, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serviceConfiguredWithError:", v13);

    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

void __42__ARServer__configureServiceForExecution___block_invoke_78(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  _ARLogDaemon_4();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v3, OS_SIGNPOST_INTERVAL_END, v4, "AddService", (const char *)&unk_235C5559A, v5, 2u);
  }

}

- (BOOL)commitServices:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *serviceQueue;
  BOOL v17;
  _QWORD v19[6];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t v25[4];
  void *v26;
  __int16 v27;
  ARServer *v28;
  __int16 v29;
  id v30;
  _BYTE buf[24];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  _ARLogDaemon_4();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    v32 = v4;
    _os_log_impl(&dword_235C46000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Committing batched services: %{public}@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v32) = 0;
  v8 = objc_msgSend(v4, "count");
  self->_numServicesToBatchCommit = v8;
  if (v8)
  {
    _ARLogDaemon_4();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v25 = 138543874;
      v26 = v11;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = v4;
      _os_log_impl(&dword_235C46000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Preparing to start sorted batched services: %{public}@", v25, 0x20u);

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "_startService");
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_batchedServicesConfiguredSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    serviceQueue = self->_serviceQueue;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __27__ARServer_commitServices___block_invoke;
    v19[3] = &unk_250702A70;
    v19[4] = self;
    v19[5] = buf;
    dispatch_async_and_wait(serviceQueue, v19);
  }
  v17 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v17;
}

void __27__ARServer_commitServices___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 72);
  os_unfair_lock_lock(v2);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "updateAlgorithmConfigurationWithServices:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  }
  else
  {
    _ARLogDaemon_4();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v5;
      v9 = 2048;
      v10 = v6;
      _os_log_impl(&dword_235C46000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No batched services available. Skipping algorithm configuration update.", (uint8_t *)&v7, 0x16u);

    }
  }
  os_unfair_lock_unlock(v2);
}

- (BOOL)updateAlgorithmConfigurationWithService:(id)a3
{
  ARServer *v3;
  NSObject *serviceQueue;
  id v5;
  void *v6;
  _QWORD v8[2];

  v3 = self;
  v8[1] = *MEMORY[0x24BDAC8D0];
  serviceQueue = self->_serviceQueue;
  v5 = a3;
  dispatch_assert_queue_V2(serviceQueue);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = -[ARServer updateAlgorithmConfigurationWithServices:](v3, "updateAlgorithmConfigurationWithServices:", v6);
  return (char)v3;
}

- (BOOL)updateAlgorithmConfigurationWithServices:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  ARServer *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  v5 = -[ARServer _addServices:](self, "_addServices:", v4);
  _ARLogGeneral_1();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v9;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = v4;
      _os_log_impl(&dword_235C46000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Updated algorithms for service: %{public}@", buf, 0x20u);

    }
    v10 = 0;
  }
  else
  {
    if (v7)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v12;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = v4;
      _os_log_impl(&dword_235C46000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Failed to update algorithms for services: %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDFD840], 501, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "clientService", (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "serviceConfiguredWithError:", v10);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return v10 == 0;
}

- (void)didDiscoverControl:(id)a3
{
  objc_msgSend(a3, "setServer:", self);
}

- (void)serviceDidInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *serviceQueue;
  id v10;
  _QWORD block[5];
  id v12;
  os_signpost_id_t v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  _ARLogDaemon_4();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  _ARLogDaemon_4();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "TransitionQueueDelaySync", "service invalidated %{public}@", buf, 0xCu);
  }

  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ARServer_serviceDidInvalidate___block_invoke;
  block[3] = &unk_250702A98;
  v12 = v4;
  v13 = v6;
  block[4] = self;
  v10 = v4;
  dispatch_async_and_wait(serviceQueue, block);

}

uint64_t __33__ARServer_serviceDidInvalidate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  _ARLogDaemon_4();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v3, OS_SIGNPOST_INTERVAL_END, v4, "TransitionQueueDelaySync", (const char *)&unk_235C5559A, v6, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_removeService:", *(_QWORD *)(a1 + 40));
}

- (void)serviceDidInterrupt:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *serviceQueue;
  id v10;
  _QWORD block[5];
  id v12;
  os_signpost_id_t v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  _ARLogDaemon_4();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  _ARLogDaemon_4();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "TransitionQueueDelaySync", "service interrupted %{public}@", buf, 0xCu);
  }

  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__ARServer_serviceDidInterrupt___block_invoke;
  block[3] = &unk_250702A98;
  v12 = v4;
  v13 = v6;
  block[4] = self;
  v10 = v4;
  dispatch_async_and_wait(serviceQueue, block);

}

uint64_t __32__ARServer_serviceDidInterrupt___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  _ARLogDaemon_4();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_235C46000, v3, OS_SIGNPOST_INTERVAL_END, v4, "TransitionQueueDelaySync", (const char *)&unk_235C5559A, v6, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_removeService:", *(_QWORD *)(a1 + 40));
}

- (void)_logDaemonStatus
{
  ARDaemonStatusLogger *statusLogger;
  void *v4;
  void *v5;
  id v6;

  statusLogger = self->_statusLogger;
  -[ARServer statusDictionaryWithWaitEndOfTransition:](self, "statusDictionaryWithWaitEndOfTransition:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARDaemonStatusLogger logStatusUpdateWithDictionary:forServerObject:andProcessName:](statusLogger, "logStatusUpdateWithDictionary:forServerObject:andProcessName:", v6, self, v5);

}

- (void)_setupHealthReportLogTimer
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *healthReportLogQueue;
  OS_dispatch_source *v9;
  OS_dispatch_source *healthReportLogTimer;
  NSObject *v11;
  objc_class *v12;
  int v13;
  void *v14;
  __int16 v15;
  ARServer *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_healthReportLogTimer)
  {
    _ARLogGeneral_1();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      return;
    }
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v5;
    v15 = 2048;
    v16 = self;
    v6 = "%{public}@ <%p>: Timer already exists.";
LABEL_4:
    _os_log_impl(&dword_235C46000, v3, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v13, 0x16u);

    goto LABEL_5;
  }
  ARCreateNonFixedPriorityDispatchQueue();
  v7 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  healthReportLogQueue = self->_healthReportLogQueue;
  self->_healthReportLogQueue = v7;

  v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, (dispatch_queue_t)self->_healthReportLogQueue);
  healthReportLogTimer = self->_healthReportLogTimer;
  self->_healthReportLogTimer = v9;

  v11 = self->_healthReportLogTimer;
  if (!v11)
  {
    _ARLogGeneral_1();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v5;
    v15 = 2048;
    v16 = self;
    v6 = "%{public}@ <%p>: Could not create timer";
    goto LABEL_4;
  }
  dispatch_source_set_timer(v11, 0, 0xDF8475800uLL, 0);
  objc_initWeak((id *)&v13, self);
  dispatch_source_set_event_handler((dispatch_source_t)self->_healthReportLogTimer, &__block_literal_global_82);
  dispatch_activate((dispatch_object_t)self->_healthReportLogTimer);
  objc_destroyWeak((id *)&v13);
}

- (ARAlgorithmConfiguration)currentConfiguration
{
  return (ARAlgorithmConfiguration *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCurrentConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSArray)servicesBeingAdded
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setServicesBeingAdded:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (ARDaemonService)serviceBeingRemoved
{
  return (ARDaemonService *)objc_getProperty(self, a2, 168, 1);
}

- (void)setServiceBeingRemoved:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (BOOL)isKeybagUnlocked
{
  return self->_isKeybagUnlocked;
}

- (void)setIsKeybagUnlocked:(BOOL)a3
{
  self->_isKeybagUnlocked = a3;
}

- (ARUserProfile)userProfile
{
  return self->_userProfile;
}

- (void)setUserProfile:(id)a3
{
  objc_storeStrong((id *)&self->_userProfile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userProfile, 0);
  objc_storeStrong((id *)&self->_serviceBeingRemoved, 0);
  objc_storeStrong((id *)&self->_servicesBeingAdded, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_statusLogger, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_spawnTime, 0);
  objc_storeStrong((id *)&self->_healthReportLogTimer, 0);
  objc_storeStrong((id *)&self->_healthReportLogQueue, 0);
  objc_storeStrong((id *)&self->_controlListener, 0);
  objc_storeStrong((id *)&self->_batchedServicesConfiguredSemaphore, 0);
  objc_storeStrong((id *)&self->_batchedServices, 0);
  objc_storeStrong((id *)&self->_latestTaskErrorMap, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_servicesByPID, 0);
  objc_storeStrong((id *)&self->_servicesByClass, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_daemonConfiguration, 0);
}

@end
