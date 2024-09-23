@implementation HMDRemoteDeviceMonitor

- (HMDRemoteDeviceMonitor)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDRemoteDeviceMonitor)initWithAccountRegistry:(id)a3 activityObserver:(id)a4 accountManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  HMDRemoteDeviceMonitor *v25;
  HMDRemoteDeviceMonitor *v26;
  void *v27;
  HMDRemoteDeviceMonitor *v28;
  NSObject *v29;
  void *v30;
  HMDAssertionLogEvent *v31;
  void *v32;
  void *v33;
  HMDRemoteDeviceMonitor *v34;
  NSObject *v35;
  id v36;
  void *v37;
  HMDAssertionLogEvent *v38;
  void *v39;
  void *v40;
  HMDRemoteDeviceMonitor *v41;
  NSObject *v42;
  id v43;
  void *v44;
  HMDAssertionLogEvent *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v30;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: IDSService is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    v31 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("IDSService is nil"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "submitLogEvent:", v31);

  }
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "modernService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v36 = v8;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v37;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: IDSService for Modern Transport is nil", buf, 0xCu);

      v8 = v36;
    }

    objc_autoreleasePoolPop(v33);
    v38 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("IDSService for Modern Transport is nil"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "submitLogEvent:", v38);

  }
  if (objc_msgSend(v12, "isEqual:", v14))
  {
    v40 = (void *)MEMORY[0x1D17BA0A0]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v43 = v8;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v44;
      _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: IDSService for Modern Transport and legacy transport is the same", buf, 0xCu);

      v8 = v43;
    }

    objc_autoreleasePoolPop(v40);
    v45 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("IDSService for Modern Transport and legacy transport is the same"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "submitLogEvent:", v45);

    if (v12)
      goto LABEL_5;
  }
  else if (v12)
  {
LABEL_5:
    HMDispatchQueueNameString();
    v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v51, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v15, v16);
    +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
    v18 = v14;
    v19 = v12;
    v20 = v10;
    v21 = v9;
    v22 = v8;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28610]), "initWithNetAddress:", 0);
    v25 = -[HMDRemoteDeviceMonitor initWithAccountRegistry:activityObserver:queue:service:modernService:accountManager:remoteAccountManager:netMonitor:factory:](self, "initWithAccountRegistry:activityObserver:queue:service:modernService:accountManager:remoteAccountManager:netMonitor:factory:", v22, v21, v17, v19, v18, v20, v23, v24, self);

    v8 = v22;
    v9 = v21;
    v10 = v20;
    v12 = v19;
    v14 = v18;

    v26 = v25;
    goto LABEL_18;
  }
  v47 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = self;
  HMFGetOSLogHandle();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v53 = v49;
    _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_ERROR, "%{public}@An IDS service is not available", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v47);
  v26 = 0;
LABEL_18:

  return v26;
}

- (HMDRemoteDeviceMonitor)initWithAccountRegistry:(id)a3 activityObserver:(id)a4 queue:(id)a5 service:(id)a6 modernService:(id)a7 accountManager:(id)a8 remoteAccountManager:(id)a9 netMonitor:(id)a10 factory:(id)a11
{
  id v18;
  id v19;
  id v20;
  HMDRemoteDeviceMonitor *v21;
  HMDRemoteDeviceMonitor *v22;
  void *v23;
  OS_dispatch_queue **p_queue;
  NSOperationQueue *v25;
  id v26;
  NSOperationQueue *operationQueue;
  uint64_t v28;
  NSMapTable *deviceInformationByDevice;
  uint64_t v30;
  HMFTimer *initialDeviceHealthTimer;
  uint64_t v32;
  HMFTimer *deviceHealthTimer;
  void *v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id obj;
  objc_super v43;

  v41 = a3;
  v40 = a4;
  v39 = a5;
  v38 = a6;
  v37 = a7;
  v18 = a8;
  obj = a9;
  v19 = a10;
  v20 = a11;
  v43.receiver = self;
  v43.super_class = (Class)HMDRemoteDeviceMonitor;
  v21 = -[HMDRemoteDeviceMonitor init](&v43, sel_init);
  v22 = v21;
  if (v21)
  {
    v23 = v18;
    p_queue = &v21->_queue;
    objc_storeStrong((id *)&v21->_queue, a5);
    v25 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v26 = v19;
    operationQueue = v22->_operationQueue;
    v22->_operationQueue = v25;

    -[NSOperationQueue setName:](v22->_operationQueue, "setName:", CFSTR("HMDRemoteDeviceMonitor"));
    -[NSOperationQueue setQualityOfService:](v22->_operationQueue, "setQualityOfService:", 9);
    -[NSOperationQueue setUnderlyingQueue:](v22->_operationQueue, "setUnderlyingQueue:", *p_queue);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v28 = objc_claimAutoreleasedReturnValue();
    deviceInformationByDevice = v22->_deviceInformationByDevice;
    v22->_deviceInformationByDevice = (NSMapTable *)v28;

    objc_storeStrong((id *)&v22->_accountRegistry, a3);
    objc_storeStrong((id *)&v22->_activityObserver, a4);
    objc_storeStrong((id *)&v22->_service, a6);
    objc_storeStrong((id *)&v22->_modernService, a7);
    objc_storeWeak((id *)&v22->_accountManager, v23);
    objc_storeWeak((id *)&v22->_remoteAccountManager, obj);
    objc_storeStrong((id *)&v22->_netMonitor, a10);
    -[HMFNetMonitor setDelegate:](v22->_netMonitor, "setDelegate:", v22);
    objc_storeWeak((id *)&v22->_factory, v20);
    v30 = objc_msgSend(v20, "newInitialDeviceHealthTimer");
    initialDeviceHealthTimer = v22->_initialDeviceHealthTimer;
    v22->_initialDeviceHealthTimer = (HMFTimer *)v30;

    -[HMFTimer setDelegateQueue:](v22->_initialDeviceHealthTimer, "setDelegateQueue:", *p_queue);
    -[HMFTimer setDelegate:](v22->_initialDeviceHealthTimer, "setDelegate:", v22);
    -[HMFTimer resume](v22->_initialDeviceHealthTimer, "resume");
    v32 = objc_msgSend(v20, "newRepeatingDeviceHealthTimer");
    deviceHealthTimer = v22->_deviceHealthTimer;
    v22->_deviceHealthTimer = (HMFTimer *)v32;

    -[HMFTimer setDelegateQueue:](v22->_deviceHealthTimer, "setDelegateQueue:", *p_queue);
    -[HMFTimer setDelegate:](v22->_deviceHealthTimer, "setDelegate:", v22);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v22, sel_handleCurrentDeviceUpdate_, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), v23);

    v18 = v23;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v22, sel_handleAccountRemoved_, CFSTR("HMDAccountRegistryRemovedAccountNotification"), v23);

    v19 = v26;
    v22->_reachable = __HMDRemoteDeviceMonitorReachable(v22);
  }

  return v22;
}

- (id)dumpState
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDRemoteDeviceMonitor devices]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "description", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDRemoteDeviceMonitor;
  -[HMDRemoteDeviceMonitor dealloc](&v4, sel_dealloc);
}

- (HMDModernTransportDeviceReachabilityObserver)transportReachabilityObserver
{
  os_unfair_lock_s *p_lock;
  HMDModernTransportDeviceReachabilityObserver *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_transportReachabilityObserver;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setTransportReachabilityObserver:(id)a3
{
  HMDModernTransportDeviceReachabilityObserver *v4;
  HMDModernTransportDeviceReachabilityObserver *transportReachabilityObserver;

  v4 = (HMDModernTransportDeviceReachabilityObserver *)a3;
  os_unfair_lock_lock_with_options();
  transportReachabilityObserver = self->_transportReachabilityObserver;
  self->_transportReachabilityObserver = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__HMDRemoteDeviceMonitor_start__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isReachable
{
  HMDRemoteDeviceMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSArray)unreachableDevices
{
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  id Property;
  uint64_t v12;
  id WeakRetained;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDRemoteDeviceMonitor devices]((char *)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v5)
    goto LABEL_14;
  v7 = v5;
  v8 = *(_QWORD *)v18;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v4);
      v10 = *(_BYTE **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      if (v10)
      {
        if ((v10[8] & 1) != 0)
          goto LABEL_10;
        Property = objc_getProperty(v10, v6, 16, 1);
      }
      else
      {
        Property = 0;
      }
      objc_msgSend(v3, "addObject:", Property, (_QWORD)v17);
LABEL_10:
      ++v9;
    }
    while (v7 != v9);
    v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    v7 = v12;
  }
  while (v12);
LABEL_14:

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "device", (_QWORD)v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && !-[HMDRemoteDeviceMonitor isReachable](self, "isReachable"))
    objc_msgSend(v3, "addObject:", v14);
  objc_msgSend(v3, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (void)startMonitoringDevice:(id)a3 withInitialReachability:(id)a4 forClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__HMDRemoteDeviceMonitor_startMonitoringDevice_withInitialReachability_forClient___block_invoke;
  v15[3] = &unk_1E89C07B8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)stopMonitoringDevice:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__HMDRemoteDeviceMonitor_stopMonitoringDevice_forClient___block_invoke;
    block[3] = &unk_1E89C20C8;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(queue, block);

  }
}

- (void)_handleGlobalReachabilityChange
{
  char *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  char *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  id Property;
  void *v21;
  void *v22;
  char *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  char *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v2 = (char *)self;
  v58 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (__HMDRemoteDeviceMonitorReachable(v2))
  {
    -[HMDRemoteDeviceMonitor setReachable:]((uint64_t)v2, 1);
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[HMDRemoteDeviceMonitor devices](v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (!v6)
      goto LABEL_43;
    v9 = v6;
    v10 = *(_QWORD *)v49;
    *(_QWORD *)&v8 = 138543618;
    v40 = v8;
    v42 = v2;
    v43 = v5;
    v41 = *(_QWORD *)v49;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v11);
        if (v12)
        {
          if ((objc_msgSend(objc_getProperty(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v11), v7, 16, 1), "isCurrentDevice") & 1) != 0)
            goto LABEL_22;
          v13 = *(_BYTE *)(v12 + 8) & 1;
          v14 = *(_QWORD *)(v12 + 40);
          if ((v14 & 8) != 0)
            goto LABEL_15;
        }
        else
        {
          if ((objc_msgSend(0, "isCurrentDevice") & 1) != 0)
            goto LABEL_22;
          LOBYTE(v14) = 0;
          v13 = 0;
        }
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        v16 = v2;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            Property = objc_getProperty((id)v12, v18, 16, 1);
          else
            Property = 0;
          objc_msgSend(Property, "shortDescription", v40);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v40;
          v54 = v19;
          v55 = 2114;
          v56 = v21;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Marking formerly unreachable device as reachable now that we are reachable: %{public}@", buf, 0x16u);

          v10 = v41;
          v2 = v42;
        }

        objc_autoreleasePoolPop(v15);
        -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:](v16, 1, (void *)v12, 5uLL, 0);
        v5 = v43;
LABEL_15:
        if ((v13 & 1) == 0 && (v14 & 1) != 0)
        {
          v22 = (void *)MEMORY[0x1D17BA0A0]();
          v23 = v2;
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              v27 = objc_getProperty((id)v12, v25, 16, 1);
            else
              v27 = 0;
            objc_msgSend(v27, "shortDescription", v40);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v40;
            v54 = v26;
            v55 = 2114;
            v56 = v28;
            _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Confirming device due to network change: %{public}@", buf, 0x16u);

            v10 = v41;
            v2 = v42;
          }

          objc_autoreleasePoolPop(v22);
          -[HMDRemoteDeviceMonitor _confirmDevice:timeout:completionHandler:]((uint64_t)v23, (void *)v12, 0, 65.0);
          v5 = v43;
        }
LABEL_22:
        ++v11;
      }
      while (v9 != v11);
      v29 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      v9 = v29;
      if (!v29)
        goto LABEL_43;
    }
  }
  -[HMDRemoteDeviceMonitor setReachable:]((uint64_t)v2, 0);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[HMDRemoteDeviceMonitor devices](v2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectEnumerator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v32)
  {
    v34 = v32;
    v35 = *(_QWORD *)v45;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v45 != v35)
          objc_enumerationMutation(v5);
        v37 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v36);
        if (v37)
          v38 = objc_getProperty(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v36), v33, 16, 1);
        else
          v38 = 0;
        if ((objc_msgSend(v38, "isCurrentDevice") & 1) == 0)
          -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:](v2, 0, v37, 5uLL, 0);
        ++v36;
      }
      while (v34 != v36);
      v39 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      v34 = v39;
    }
    while (v39);
  }
LABEL_43:

}

- (void)confirmDevice:(id)a3 forClient:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  NSObject *queue;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  double v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD))v12;
  if (v10)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__HMDRemoteDeviceMonitor_confirmDevice_forClient_timeout_completionHandler___block_invoke;
    block[3] = &unk_1E89BB0A0;
    block[4] = self;
    v17 = v10;
    v18 = v11;
    v20 = a5;
    v19 = v13;
    dispatch_async(queue, block);

  }
  else if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v15);

  }
}

- (void)handleCurrentDeviceUpdate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDRemoteDeviceMonitor *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HMDRemoteDeviceMonitor_handleCurrentDeviceUpdate___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)handleDeviceRemovedFromAccount:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDRemoteDeviceMonitor *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HMDRemoteDeviceMonitor_handleDeviceRemovedFromAccount___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)handleAccountRemoved:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDRemoteDeviceMonitor *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__HMDRemoteDeviceMonitor_handleAccountRemoved___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)newInitialDeviceHealthTimer
{
  int v3;
  uint32_t v4;
  int v5;
  int v6;
  void *v7;
  HMDRemoteDeviceMonitor *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (int)*(double *)&remoteDeviceMonitorHealthTimerTimeInterval;
  v4 = arc4random_uniform((int)*(double *)&remoteDeviceMonitorHealthTimerTimeInterval);
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  v6 = v4 + (v5 >> 1);
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 1024;
    v15 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Initial health timer interval is %d seconds", (uint8_t *)&v12, 0x12u);

  }
  objc_autoreleasePoolPop(v7);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, (double)v6);
}

- (id)newRepeatingDeviceHealthTimer
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0D286C8]);
  return (id)objc_msgSend(v2, "initWithTimeInterval:options:", 4, *(double *)&remoteDeviceMonitorHealthTimerTimeInterval);
}

- (id)newDeviceMonitoringTimer
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0D28578]);
  return (id)objc_msgSend(v2, "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", remoteDeviceMonitorRetryTimerFactor, 0, *(double *)&remoteDeviceMonitorRetryTimerMinimumTimeInterval, *(double *)&remoteDeviceMonitorRetryTimerMaximumTimeInterval);
}

- (id)newSendMessageOperationWithMessage:(id)a3
{
  id v4;
  HMDIDSSendMessageOperation *v5;
  HMDIDSService *service;
  HMDIDSSendMessageOperation *v7;

  v4 = a3;
  v5 = [HMDIDSSendMessageOperation alloc];
  if (self)
    service = self->_service;
  else
    service = 0;
  v7 = -[HMDIDSSendMessageOperation initWithMessage:service:](v5, "initWithMessage:service:", v4, service);

  return v7;
}

- (id)newConfirmationHandlerWithTimeout:(double)a3 workQueue:(id)a4 handler:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  HMDRemoteDeviceConfirmationHandler *v11;

  v7 = (objc_class *)MEMORY[0x1E0D286C8];
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithTimeInterval:options:", 0, a3);
  v11 = -[HMDRemoteDeviceConfirmationHandler initWithTimeoutTimer:workQueue:handler:]([HMDRemoteDeviceConfirmationHandler alloc], "initWithTimeoutTimer:workQueue:handler:", v10, v9, v8);

  return v11;
}

- (void)networkMonitorIsReachable:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HMDRemoteDeviceMonitor_networkMonitorIsReachable___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)networkMonitorIsUnreachable:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMDRemoteDeviceMonitor_networkMonitorIsUnreachable___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)timerDidFire:(id)a3
{
  HMFTimer *v4;
  HMFTimer *v5;
  HMFTimer *initialDeviceHealthTimer;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HMFTimer *v13;
  uint64_t v14;
  void *v15;
  HMDRemoteDeviceMonitor *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDRemoteDeviceMonitor *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void *v30;
  HMDRemoteDeviceMonitor *v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  id Property;
  HMFTimer *v36;
  char *v37;
  char *v38;
  char v39;
  void *v40;
  HMDRemoteDeviceMonitor *v41;
  NSObject *v42;
  void *v43;
  SEL v44;
  HMFTimer *v45;
  uint64_t v46;
  void *v47;
  HMDRemoteDeviceMonitor *v48;
  NSObject *v49;
  const char *v50;
  void *v51;
  id v52;
  HMFTimer *v53;
  void *v54;
  HMDRemoteDeviceMonitor *v55;
  NSObject *v56;
  const char *v57;
  void *v58;
  HMFTimer *v59;
  id v60;
  HMFTimer *v61;
  void *v62;
  HMDRemoteDeviceMonitor *v63;
  NSObject *v64;
  const char *v65;
  void *v66;
  id v67;
  HMFTimer *v68;
  void *v69;
  HMDRemoteDeviceMonitor *v70;
  NSObject *v71;
  const char *v72;
  void *v73;
  id v74;
  HMFTimer *v75;
  HMFTimer *v76;
  id obj;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[128];
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  HMFTimer *v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = (HMFTimer *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = self->_deviceHealthTimer;
  if (v5 == v4)
  {

    goto LABEL_19;
  }
  initialDeviceHealthTimer = self->_initialDeviceHealthTimer;

  if (initialDeviceHealthTimer == v4)
  {
LABEL_19:
    v76 = v4;
    v19 = (void *)MEMORY[0x1D17BA0A0](-[HMFTimer resume](self->_deviceHealthTimer, "resume"));
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v88 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Confirming all reachable devices", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    -[HMDRemoteDeviceMonitor devices]((char *)v20);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v83;
      v26 = &OBJC_IVAR___HMDUnpairedHAPAccessoryPairingInformation__setupCodeProviderCompletionHandler;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v83 != v25)
            objc_enumerationMutation(obj);
          v28 = *(char **)(*((_QWORD *)&v82 + 1) + 8 * v27);
          if (v28)
            v29 = *(_QWORD *)&v28[v26[555]];
          else
            LOBYTE(v29) = 0;
          if (-[HMDRemoteDeviceMonitor isReachable](v20, "isReachable") || (v29 & 0xA) != 0)
          {
            v37 = v28;
            v38 = v37;
            if (v20 && v28)
            {
              v39 = v37[8];

              if ((v39 & 1) != 0)
              {
                v40 = (void *)MEMORY[0x1D17BA0A0]();
                v41 = v20;
                HMFGetOSLogHandle();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(objc_getProperty(v38, v44, 16, 1), "shortDescription");
                  v45 = (HMFTimer *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v88 = v43;
                  v89 = 2114;
                  v90 = v45;
                  _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Trying reachability health check to device: %{public}@", buf, 0x16u);

                  v26 = &OBJC_IVAR___HMDUnpairedHAPAccessoryPairingInformation__setupCodeProviderCompletionHandler;
                }

                objc_autoreleasePoolPop(v40);
                -[HMDRemoteDeviceMonitor _sendPingToDevice:]((dispatch_queue_t *)v41, v38);
              }
            }
            else
            {

            }
          }
          else
          {
            v30 = (void *)MEMORY[0x1D17BA0A0]();
            v31 = v20;
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (v28)
                Property = objc_getProperty(v28, v33, 16, 1);
              else
                Property = 0;
              objc_msgSend(Property, "shortDescription");
              v36 = (HMFTimer *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v88 = v34;
              v89 = 2114;
              v90 = v36;
              _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Deferring ping to device while we are unreachable: %{public}@", buf, 0x16u);

              v26 = &OBJC_IVAR___HMDUnpairedHAPAccessoryPairingInformation__setupCodeProviderCompletionHandler;
            }

            objc_autoreleasePoolPop(v30);
            -[HMDRemoteDeviceInformation addState:]((uint64_t)v28, 1);
          }
          ++v27;
        }
        while (v24 != v27);
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
        v24 = v46;
      }
      while (v46);
    }

    v4 = v76;
    goto LABEL_71;
  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  -[HMDRemoteDeviceMonitor devices]((char *)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v79;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v79 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v11);
        if (v12)
          v13 = *(HMFTimer **)(v12 + 64);
        else
          v13 = 0;
        if (v13 == v4)
        {
          v47 = (void *)MEMORY[0x1D17BA0A0]();
          v48 = self;
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              v52 = objc_getProperty((id)v12, v50, 16, 1);
            else
              v52 = 0;
            objc_msgSend(v52, "shortDescription");
            v53 = (HMFTimer *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v88 = v51;
            v89 = 2114;
            v90 = v53;
            _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_DEBUG, "%{public}@Timer fired for device: %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v47);
          if (-[HMDRemoteDeviceMonitor isReachable](v48, "isReachable"))
          {
            if (!v12 || (*(_BYTE *)(v12 + 40) & 1) == 0)
            {
              v54 = (void *)MEMORY[0x1D17BA0A0]();
              v55 = v48;
              HMFGetOSLogHandle();
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = v4;
                if (v12)
                  v60 = objc_getProperty((id)v12, v57, 16, 1);
                else
                  v60 = 0;
                objc_msgSend(v60, "shortDescription");
                v61 = (HMFTimer *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v88 = v58;
                v89 = 2114;
                v90 = v61;
                _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_INFO, "%{public}@Timer fired but should confirm is not set for device: %{public}@", buf, 0x16u);

                v4 = v59;
              }

              objc_autoreleasePoolPop(v54);
            }
            v62 = (void *)MEMORY[0x1D17BA0A0]();
            v63 = v48;
            HMFGetOSLogHandle();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
                v67 = objc_getProperty((id)v12, v65, 16, 1);
              else
                v67 = 0;
              objc_msgSend(v67, "shortDescription");
              v68 = (HMFTimer *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v88 = v66;
              v89 = 2114;
              v90 = v68;
              _os_log_impl(&dword_1CD062000, v64, OS_LOG_TYPE_INFO, "%{public}@Retrying ping to device: %{public}@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v62);
            -[HMDRemoteDeviceMonitor _sendPingToDevice:]((dispatch_queue_t *)v63, (void *)v12);
          }
          else
          {
            v69 = (void *)MEMORY[0x1D17BA0A0]();
            v70 = v48;
            HMFGetOSLogHandle();
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
                v74 = objc_getProperty((id)v12, v72, 16, 1);
              else
                v74 = 0;
              objc_msgSend(v74, "shortDescription");
              v75 = (HMFTimer *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v88 = v73;
              v89 = 2114;
              v90 = v75;
              _os_log_impl(&dword_1CD062000, v71, OS_LOG_TYPE_INFO, "%{public}@Deferring ping while unreachable to device: %{public}@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v69);
            -[HMDRemoteDeviceInformation addState:](v12, 1);
          }

          goto LABEL_71;
        }
        ++v11;
      }
      while (v9 != v11);
      v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
      v9 = v14;
      if (v14)
        continue;
      break;
    }
  }

  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v88 = v18;
    v89 = 2112;
    v90 = v4;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unhandled timer: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
LABEL_71:

}

- (void)account:(id)a3 isActiveChanged:(BOOL)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  HMDRemoteDeviceMonitor *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDRemoteDeviceMonitor iCloudAccount]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if ((v7 & 1) != 0)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@IDS Account active state changed to %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDRemoteDeviceMonitor _handleGlobalReachabilityChange](v9, "_handleGlobalReachabilityChange");
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Ignoring IDS Account active state change on non-iCloud account", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)account:(id)a3 loginChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDRemoteDeviceMonitor *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDRemoteDeviceMonitor iCloudAccount]((id *)&self->super.super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v6);

  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if ((v10 & 1) != 0)
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@IDS Account login changed", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDRemoteDeviceMonitor _handleGlobalReachabilityChange](v12, "_handleGlobalReachabilityChange");
  }
  else
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Ignoring IDS Account login change on non-iCloud account", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDRemoteDeviceMonitor *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  id *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *context;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@IDS Service active accounts changed", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "iCloudAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&v9->_iCloudAccount);
  if (v12 && (objc_msgSend(v12, "isEqual:", WeakRetained) & 1) == 0)
  {
    context = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v9;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = v7;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@iCloud account changed, updating delegate", buf, 0xCu);

      v7 = v17;
    }

    objc_autoreleasePoolPop(context);
    objc_msgSend(WeakRetained, "removeDelegate:", v14);
    objc_msgSend(WeakRetained, "removeRegistrationDelegate:", v14);
    objc_msgSend(v12, "addDelegate:queue:", v14, self->_queue);
    objc_msgSend(v12, "addRegistrationDelegate:queue:", v14, self->_queue);
    objc_storeWeak(v14 + 9, v12);
  }
  -[HMDRemoteDeviceMonitor _handleGlobalReachabilityChange](v9, "_handleGlobalReachabilityChange", v17);

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  HMDRemoteDeviceMonitor *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDRemoteDeviceMonitor *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v28 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serviceIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v20;
    v31 = 2112;
    v32 = v16;
    v33 = 2114;
    v34 = v21;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Received incoming message from: %@, on service: %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v17);
  -[HMDRemoteDeviceMonitor accountRegistry](v18, "accountRegistry");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "deviceForHandle:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23 && !objc_msgSend(v23, "isCurrentDevice"))
  {
    -[HMDRemoteDeviceMonitor _handleIncomingMessageForDevice:](v18, "_handleIncomingMessageForDevice:", v23);
  }
  else
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v18;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v27;
      v31 = 2112;
      v32 = v23;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring incoming message from device because it is nil or it is the current device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
  }

}

- (void)_handleIncomingMessageForDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  HMDRemoteDeviceMonitor *v9;
  NSObject *v10;
  void *v11;
  SEL v12;
  void *v13;
  void *v14;
  HMDRemoteDeviceMonitor *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDRemoteDeviceMonitor _startMonitoringDevice:withInitialReachability:forClient:]((uint64_t)self, v4, 0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    -[HMDRemoteDeviceInformation completeConfirmationsWithError:](v5, 0);
    v7 = v6;
    if (*((_QWORD *)v7 + 8))
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(objc_getProperty(v7, v12, 16, 1), "shortDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v11;
        v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Stopping actively monitoring device: %{public}@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(*((id *)v7 + 8), "suspend");
      objc_storeStrong((id *)v7 + 8, 0);
    }

    dispatch_assert_queue_V2(*((dispatch_queue_t *)v7 + 3));
    dispatch_assert_queue_V2(*((dispatch_queue_t *)v7 + 3));
    *((_QWORD *)v7 + 5) &= 0xFFFFFFFFFFFFFFF0;
    -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:](self, 1, v7, 0, 0);
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v17;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring incoming message from device %@ because no clients have registered to monitor it", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)observer:(id)a3 didUpdateDevice:(id)a4 isOnline:(BOOL)a5
{
  id v8;
  void *v9;
  HMDIDSActivityMonitorObserver *activityObserver;
  NSObject *queue;
  _QWORD block[5];
  id v13;
  BOOL v14;

  v8 = a4;
  v9 = v8;
  if (self)
    activityObserver = self->_activityObserver;
  else
    activityObserver = 0;
  if (activityObserver == a3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__HMDRemoteDeviceMonitor_observer_didUpdateDevice_isOnline___block_invoke;
    block[3] = &unk_1E89C0898;
    block[4] = self;
    v13 = v8;
    v14 = a5;
    dispatch_async(queue, block);

  }
}

- (void)modernTransportDeviceReachabilityObserverDidUpdate:(id)a3 isReachable:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDRemoteDeviceMonitor *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDRemoteDeviceMonitor accountRegistry](self, "accountRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceForAddress:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4 && v8)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Transport detects device %{public}@ might be unreachable, confirming...", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDRemoteDeviceMonitor confirmDevice:forClient:timeout:completionHandler:](v10, "confirmDevice:forClient:timeout:completionHandler:", v8, v10, 0, 65.0);
  }

}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDeviceHealthTimer, 0);
  objc_storeStrong((id *)&self->_deviceHealthTimer, 0);
  objc_storeStrong((id *)&self->_deviceInformationByDevice, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_netMonitor, 0);
  objc_destroyWeak((id *)&self->_remoteAccountManager);
  objc_destroyWeak((id *)&self->_accountManager);
  objc_storeStrong((id *)&self->_activityObserver, 0);
  objc_destroyWeak((id *)&self->_iCloudAccount);
  objc_storeStrong((id *)&self->_modernService, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_transportReachabilityObserver, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __60__HMDRemoteDeviceMonitor_observer_didUpdateDevice_isOnline___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  const __CFString *v9;
  HMDRemoteDeviceReachabilityChangeLogEvent *v10;
  void *v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    if (v8)
      v9 = CFSTR("Connected");
    else
      v9 = CFSTR("Disconnected");
    v32 = v5;
    v33 = 2114;
    v34 = v6;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received IDS Activity update for device %{public}@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v10 = -[HMDRemoteDeviceReachabilityChangeLogEvent initWithReason:reachable:targetSupportsIDSPresence:]([HMDRemoteDeviceReachabilityChangeLogEvent alloc], "initWithReason:reachable:targetSupportsIDSPresence:", 4, *(unsigned __int8 *)(a1 + 48), 1);
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitLogEvent:", v10);

  v12 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  -[HMDRemoteDeviceMonitor _deviceInformationForDevice:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v13 = objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v12);
  if (!v13)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v19;
      v33 = 2114;
      v34 = (uint64_t)v20;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@No Device Information found for device: %{public}@", buf, 0x16u);

    }
    goto LABEL_10;
  }
  if (*(_BYTE *)(a1 + 48) == (*(_BYTE *)(v13 + 8) & 1))
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v17;
      v33 = 2114;
      v34 = (uint64_t)v18;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Server reachability is the same as our reachability for device: %{public}@", buf, 0x16u);

    }
LABEL_10:

    objc_autoreleasePoolPop(v14);
    goto LABEL_17;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v13 + 24));
  *(_QWORD *)(v13 + 40) &= ~8uLL;
  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v24;
    v33 = 2114;
    v34 = (uint64_t)v25;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Confirming device %{public}@ because server reachability is different from our reachability", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(*(id *)(v13 + 64), "suspend");
  v26 = *(void **)(v13 + 64);
  *(_QWORD *)(v13 + 64) = 0;

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __60__HMDRemoteDeviceMonitor_observer_didUpdateDevice_isOnline___block_invoke_174;
  v28[3] = &unk_1E89C21C0;
  v27 = *(void **)(a1 + 40);
  v29 = *(_QWORD *)(a1 + 32);
  v30 = v27;
  -[HMDRemoteDeviceMonitor _confirmDevice:timeout:completionHandler:](v29, (void *)v13, v28, 65.0);

LABEL_17:
}

- (id)_deviceInformationForDevice:(uint64_t)a1
{
  uint64_t v2;
  id v3;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v2 + 8));
    objc_msgSend(*(id *)(v2 + 120), "objectForKey:", v3);
    v2 = objc_claimAutoreleasedReturnValue();

  }
  return (id)v2;
}

void __60__HMDRemoteDeviceMonitor_observer_didUpdateDevice_isOnline___block_invoke_174(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("Success");
    v11 = 138543874;
    v12 = v7;
    if (v3)
      v10 = v3;
    v13 = 2114;
    v14 = v8;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Ping result due to IDS Activity for device %{public}@: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

- (void)_confirmDevice:(void *)a3 timeout:(double)a4 completionHandler:
{
  dispatch_queue_t *v7;
  void (**v8)(id, _QWORD);
  int v9;
  const char *v10;
  id Property;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    os_unfair_lock_lock_with_options();
    v9 = *(unsigned __int8 *)(a1 + 41);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v9)
    {
      if (v7)
        Property = objc_getProperty(v7, v10, 16, 1);
      else
        Property = 0;
      v12 = Property;
      if ((objc_msgSend((id)a1, "isReachable") & 1) != 0)
      {
        if (objc_msgSend(v12, "isCurrentDevice"))
        {
          v13 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = (id)a1;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = 138543362;
            v41 = v16;
            _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Confirming ourselves, returning success", (uint8_t *)&v40, 0xCu);

          }
          objc_autoreleasePoolPop(v13);
          if (v8)
            v8[2](v8, 0);
          goto LABEL_19;
        }
        if (v7)
        {
          v27 = ((unint64_t)v7[5] & 0xA) == 0;
          if (((_BYTE)v7[1] & 1) == 0 && ((unint64_t)v7[5] & 0xA) != 0)
          {
            v28 = (void *)MEMORY[0x1D17BA0A0]();
            v29 = (id)a1;
            HMFGetOSLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "shortDescription");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = 138543618;
              v41 = v31;
              v42 = 2114;
              v43 = v32;
              _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@The device is already unreachable: %{public}@", (uint8_t *)&v40, 0x16u);

            }
            objc_autoreleasePoolPop(v28);
            dispatch_assert_queue_V2(v7[3]);
            v7[5] = (dispatch_queue_t)((unint64_t)v7[5] | 1);
            if (!v8)
              goto LABEL_19;
            goto LABEL_18;
          }
        }
        else
        {
          v27 = 1;
        }
        if (v8)
          -[HMDRemoteDeviceInformation queueConfirmationHandler:timeout:]((uint64_t)v7, v8, a4);
        if (v27)
        {
          -[HMDRemoteDeviceMonitor _sendPingToDevice:]((dispatch_queue_t *)a1, v7);
        }
        else
        {
          v33 = (void *)MEMORY[0x1D17BA0A0]();
          v34 = (id)a1;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v7)
              v38 = objc_getProperty(v7, v36, 16, 1);
            else
              v38 = 0;
            objc_msgSend(v38, "shortDescription");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = 138543618;
            v41 = v37;
            v42 = 2114;
            v43 = v39;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@The device is already being confirmed: %{public}@", (uint8_t *)&v40, 0x16u);

          }
          objc_autoreleasePoolPop(v33);
        }
        goto LABEL_19;
      }
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = (id)a1;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "shortDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138543618;
        v41 = v24;
        v42 = 2114;
        v43 = v25;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@We are currently unreachable, so failing confirm for device: %{public}@", (uint8_t *)&v40, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      if (!v8)
        goto LABEL_19;
LABEL_18:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 54);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v8)[2](v8, v26);

      goto LABEL_19;
    }
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = (id)a1;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543362;
      v41 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot confirm device before monitor has started", (uint8_t *)&v40, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, id))v8)[2](v8, v12);
LABEL_19:

    }
  }

}

- (void)_sendPingToDevice:(dispatch_queue_t *)a1
{
  id *v3;
  const char *v4;
  void *v5;
  id *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  SEL v12;
  void *v13;
  dispatch_queue_t *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  SEL v25;
  void *v26;
  void *v27;
  id *v28;
  NSObject *v29;
  void *v30;
  dispatch_queue_t *v31;
  SEL v32;
  void *v33;
  id WeakRetained;
  void *v35;
  dispatch_queue_t *v36;
  void *v37;
  id *v38;
  NSObject *v39;
  id v40;
  void *v41;
  SEL v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD aBlock[4];
  dispatch_queue_t *v47;
  id v48;
  id location;
  id v50;
  id from;
  _BYTE buf[24];
  void *v53;
  dispatch_queue_t *v54;
  id v55;
  id v56[4];

  v56[2] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    if (v3)
    {
      if (objc_msgSend(objc_getProperty(v3, v4, 16, 1), "isCurrentDevice"))
      {
        v5 = (void *)MEMORY[0x1D17BA0A0]();
        v6 = a1;
        HMFGetOSLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v8;
          _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to send ping to ourselves", buf, 0xCu);

        }
LABEL_6:

        objc_autoreleasePoolPop(v5);
        goto LABEL_24;
      }
      v9 = ((unint64_t)v3[5] & 2) == 0;
      v5 = (void *)MEMORY[0x1D17BA0A0]();
      v6 = a1;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      v7 = v10;
      if (!v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(objc_getProperty(v3, v25, 16, 1), "shortDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v26;
          _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Already pinging to device: %{public}@", buf, 0x16u);

        }
        goto LABEL_6;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(objc_getProperty(v3, v12, 16, 1), "shortDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Sending ping to device: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(v3[8], "suspend");
      objc_initWeak(&location, v6);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __44__HMDRemoteDeviceMonitor__sendPingToDevice___block_invoke;
      aBlock[3] = &unk_1E89BF250;
      objc_copyWeak(&v48, &location);
      v14 = v3;
      v47 = v14;
      v45 = _Block_copy(aBlock);
      v15 = 65.0;
      if ((_pingTimeoutAdjustedForIDSPushBlackout_isPushAvailable & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "systemUptime");
        v18 = v17;

        v19 = 120.0 - v18;
        if (v19 <= 0.0)
        {
          v27 = (void *)MEMORY[0x1D17BA0A0]();
          v28 = v6;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v30;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = 0x4050400000000000;
            _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Push is available, using default ping timeout: %f", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v27);
          _pingTimeoutAdjustedForIDSPushBlackout_isPushAvailable = 1;
        }
        else
        {
          v20 = (void *)MEMORY[0x1D17BA0A0]();
          v21 = v6;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          v15 = v19 + 65.0;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v19 + 65.0;
            _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Push is unavailable, using extended ping timeout: %f", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v20);
        }
      }
      -[HMDRemoteDeviceInformation queueConfirmationHandler:timeout:]((uint64_t)v14, v45, v15);
      dispatch_assert_queue_V2(v14[3]);
      v14[5] = (dispatch_queue_t)((unint64_t)v14[5] | 2);
      dispatch_assert_queue_V2(v14[3]);
      v14[5] = (dispatch_queue_t)((unint64_t)v14[5] & 0xFFFFFFFFFFFFFFFBLL);
      v31 = v14;
      +[HMDRemoteDeviceMonitor pingMessageForDevice:timeout:restriction:](HMDRemoteDeviceMonitor, "pingMessageForDevice:timeout:restriction:", objc_getProperty(v31, v32, 16, 1), 0, v15);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained(v6 + 14);
      v35 = (void *)objc_msgSend(WeakRetained, "newSendMessageOperationWithMessage:", v33);
      objc_initWeak(&from, v6);
      objc_initWeak(&v50, v35);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __61__HMDRemoteDeviceMonitor__createRemotePingOperation_timeout___block_invoke;
      v53 = &unk_1E89BF2A0;
      objc_copyWeak(&v55, &from);
      objc_copyWeak(v56, &v50);
      v36 = v31;
      v54 = v36;
      objc_msgSend(v35, "setCompletionBlock:", buf);

      objc_destroyWeak(v56);
      objc_destroyWeak(&v55);
      objc_destroyWeak(&v50);
      objc_destroyWeak(&from);

      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = v6;
      HMFGetOSLogHandle();
      v39 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "shortDescription");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_getProperty(v36, v42, 16, 1);
        objc_msgSend(v43, "shortDescription");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v41;
        *(_WORD *)&buf[22] = 2114;
        v53 = v44;
        _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Starting ping operation %{public}@ for device: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v37);
      objc_msgSend(v38[3], "addOperation:", v35);

      objc_destroyWeak(&v48);
      objc_destroyWeak(&location);
    }
  }
LABEL_24:

}

void __44__HMDRemoteDeviceMonitor__sendPingToDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v5;
  void *v6;
  dispatch_queue_t *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  id Property;
  void *v12;
  uint64_t v13;
  void *v14;
  dispatch_queue_t *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  dispatch_queue_t *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[2]);
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v9, 16, 1);
      objc_msgSend(Property, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543874;
      v33 = v10;
      v34 = 2114;
      v35 = v12;
      v36 = 2112;
      v37 = v3;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Confirmation completed for device %{public}@ with error: %@", (uint8_t *)&v32, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    if (!v3)
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = v7;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(id *)(a1 + 32);
        if (v29)
          v29 = objc_getProperty(v29, v27, 16, 1);
        objc_msgSend(v29, "shortDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v28;
        v34 = 2114;
        v35 = v30;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Confirmation succeeded to reachable device: %{public}@", (uint8_t *)&v32, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:](v25, 1, *(void **)(a1 + 32), 1uLL, 0);
      goto LABEL_27;
    }
    v13 = *(_QWORD *)(a1 + 32);
    if (!v13 || (*(_BYTE *)(v13 + 8) & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = v7;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(id *)(a1 + 32);
        if (v19)
          v19 = objc_getProperty(v19, v17, 16, 1);
        objc_msgSend(v19, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543874;
        v33 = v18;
        v34 = 2114;
        v35 = v20;
        v36 = 2112;
        v37 = v3;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Confirmation failed to unreachable device %{public}@ with error: %@", (uint8_t *)&v32, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }
    objc_msgSend(v3, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqual:", *MEMORY[0x1E0D27FC8]))
    {
      v22 = objc_msgSend(v3, "code");

      if (v22 == 13)
      {
        v23 = 3;
LABEL_24:
        -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:](v7, 0, *(void **)(a1 + 32), v23, 0);
        -[HMDRemoteDeviceInformation addState:](*(_QWORD *)(a1 + 32), 8);
        v31 = *(_QWORD *)(a1 + 32);
        if (v31 && (*(_BYTE *)(v31 + 40) & 4) != 0)
        {
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v31 + 24));
          *(_QWORD *)(v31 + 40) &= ~2uLL;
        }
LABEL_27:
        -[HMDRemoteDeviceInformation completeConfirmationsWithError:](*(_QWORD *)(a1 + 32), v3);
        goto LABEL_28;
      }
    }
    else
    {

    }
    v23 = 2;
    goto LABEL_24;
  }
LABEL_28:

}

void __61__HMDRemoteDeviceMonitor__createRemotePingOperation_timeout___block_invoke(id *a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__HMDRemoteDeviceMonitor__createRemotePingOperation_timeout___block_invoke_2;
    block[3] = &unk_1E89C20C8;
    block[4] = WeakRetained;
    v8 = v4;
    v9 = a1[4];
    v6 = v4;
    dispatch_async(v5, block);

  }
}

void __61__HMDRemoteDeviceMonitor__createRemotePingOperation_timeout___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  id Property;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id WeakRetained;
  id v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  id *v36;
  NSObject *v37;
  _BOOL4 v38;
  const char *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  const char *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  int v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 40);
    Property = *(id *)(a1 + 48);
    if (Property)
      Property = objc_getProperty(Property, v5, 16, 1);
    objc_msgSend(Property, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 138543874;
    v51 = v6;
    v52 = 2112;
    v53 = v8;
    v54 = 2114;
    v55 = v9;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Operation completed with error %@ to device %{public}@", (uint8_t *)&v50, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v10 = *(_QWORD *)(a1 + 48);
  if (v10 && (*(_BYTE *)(v10 + 40) & 2) != 0)
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(id *)(a1 + 48);
        if (v18)
          v18 = objc_getProperty(v18, v16, 16, 1);
        objc_msgSend(v18, "shortDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 40);
        v50 = 138543874;
        v51 = v17;
        v52 = 2114;
        v53 = v19;
        v54 = 2112;
        v55 = v20;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to send ping to device %{public}@ with error: %@", (uint8_t *)&v50, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDRemoteDeviceInformation completeConfirmationsWithError:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 40));
      v22 = *(_QWORD *)(a1 + 32);
      if (v22)
        WeakRetained = objc_loadWeakRetained((id *)(v22 + 96));
      else
        WeakRetained = 0;
      v25 = *(_QWORD *)(a1 + 40);
      v24 = *(id *)(a1 + 48);
      if (v24)
        v24 = objc_getProperty(v24, v21, 16, 1);
      objc_msgSend(v24, "remoteDestinationString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "__handleSendMessageFailureWithError:destination:", v25, v26);

      -[HMDRemoteDeviceInformation addState:](*(_QWORD *)(a1 + 48), 1);
      -[HMDRemoteDeviceInformation clearState:](*(_QWORD *)(a1 + 48));
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(id *)(a1 + 48);
        if (v29)
          v29 = objc_getProperty(v29, v27, 16, 1);
        objc_msgSend(v29, "shortDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 138543618;
        v51 = v28;
        v52 = 2114;
        v53 = v30;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully sent ping to device: %{public}@", (uint8_t *)&v50, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDRemoteDeviceInformation addState:](*(_QWORD *)(a1 + 48), 4);
    }
    v31 = *(void **)(a1 + 32);
    v32 = *(id *)(a1 + 48);
    v33 = v32;
    if (!v31)
      goto LABEL_33;
    if (v32)
      v34 = v32[8];
    else
      v34 = 0;
    v35 = (void *)MEMORY[0x1D17BA0A0]();
    v36 = v31;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
    if (v34)
    {
      if (v38)
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
          v41 = objc_getProperty(v33, v39, 16, 1);
        else
          v41 = 0;
        objc_msgSend(v41, "shortDescription");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 138543618;
        v51 = v40;
        v52 = 2114;
        v53 = v42;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Resuming actively monitoring device: %{public}@", (uint8_t *)&v50, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      if (v33)
      {
LABEL_31:
        v43 = (void *)v33[8];
LABEL_32:
        objc_msgSend(v43, "resume");
LABEL_33:

        return;
      }
    }
    else
    {
      if (v38)
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
          v46 = objc_getProperty(v33, v44, 16, 1);
        else
          v46 = 0;
        objc_msgSend(v46, "shortDescription");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 138543618;
        v51 = v45;
        v52 = 2114;
        v53 = v47;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Starting to actively monitor device: %{public}@", (uint8_t *)&v50, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      v48 = objc_loadWeakRetained(v36 + 14);
      v49 = (void *)objc_msgSend(v48, "newDeviceMonitoringTimer");

      objc_msgSend(v49, "setDelegateQueue:", v36[2]);
      objc_msgSend(v49, "setDelegate:", v36);
      -[HMDRemoteDeviceInformation setRetryTimer:]((uint64_t)v33, v49);

      if (v33)
        goto LABEL_31;
    }
    v43 = 0;
    goto LABEL_32;
  }
}

- (void)handleReachabilityChange:(void *)a3 deviceInformation:(unint64_t)a4 reason:(char)a5 didStartMonitoringDevice:
{
  char *v9;
  dispatch_queue_t *v10;
  _BYTE *v11;
  __CFString *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  SEL v17;
  SEL v18;
  void *v19;
  uint64_t v20;
  HMDRemoteDeviceReachabilityChangeLogEvent *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  __CFString *v28;
  id v29;
  const char *v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  id Property;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (dispatch_queue_t *)v9;
  if (a1)
  {
    if (a4 < 5)
    {
      if (!v9)
        goto LABEL_6;
      v11 = v9 + 9;
      goto LABEL_5;
    }
    if (a4 != 6 || !v9)
    {
LABEL_6:
      v12 = off_1E89AD420[a4];
      if (v10)
      {
        if ((*((_BYTE *)v10 + 10) & 1) != 0 && a4 == 5 && (*((_BYTE *)v10 + 9) & 1) == 0)
        {
          v13 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = a1;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = 138543874;
            v37 = v16;
            v38 = 2114;
            v39 = v12;
            v40 = 2112;
            Property = objc_getProperty(v10, v17, 16, 1);
            _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping updating reachability with reason: %{public}@ because initial reachability is set and waiting for non-network reachability changes for device: %@", (uint8_t *)&v36, 0x20u);

          }
          objc_autoreleasePoolPop(v13);
          if ((a5 & 1) == 0)
            goto LABEL_24;
          goto LABEL_16;
        }
        if ((a5 & 1) != 0 || ((_BYTE)v10[1] & 1) != (_DWORD)a2)
        {
LABEL_16:
          dispatch_assert_queue_V2(v10[3]);
          objc_msgSend(objc_getProperty(v10, v18, 16, 1), "capabilities");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "supportsIDSActivityMonitorPresence");

          v21 = -[HMDRemoteDeviceReachabilityChangeLogEvent initWithReason:reachable:targetSupportsIDSPresence:]([HMDRemoteDeviceReachabilityChangeLogEvent alloc], "initWithReason:reachable:targetSupportsIDSPresence:", a4, a2, v20);
          +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "submitLogEvent:", v21);

          *((_BYTE *)v10 + 8) = a2;
LABEL_17:
          v23 = (void *)MEMORY[0x1D17BA0A0]();
          v24 = a1;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            HMFBooleanToString();
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v10)
              v29 = objc_getProperty(v10, v27, 16, 1);
            else
              v29 = 0;
            v36 = 138544130;
            v37 = v26;
            v38 = 2114;
            v39 = v28;
            v40 = 2114;
            Property = v12;
            v42 = 2112;
            v43 = v29;
            _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Updating reachability to %{public}@ with reason: %{public}@, for device: %@", (uint8_t *)&v36, 0x2Au);

          }
          objc_autoreleasePoolPop(v23);
          if (v10)
            v31 = objc_getProperty(v10, v30, 16, 1);
          else
            v31 = 0;
          -[HMDRemoteDeviceMonitor notifyDeviceReachabilityChange:forDevice:](v24, a2, v31);
        }
      }
      else if ((a2 & 1) != 0 || (a5 & 1) != 0)
      {
        goto LABEL_17;
      }
LABEL_24:

      goto LABEL_25;
    }
    v11 = v9 + 10;
    if ((v9[10] & 1) == 0 && (v9[9] & 1) == 0)
    {
LABEL_5:
      *v11 = 1;
      goto LABEL_6;
    }
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = a1;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543362;
      v37 = v35;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Skipping updating reachability with initial reachability reason", (uint8_t *)&v36, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
  }
LABEL_25:

}

- (void)notifyDeviceReachabilityChange:(void *)a3 forDevice:
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = a1;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Notifying clients of reachability change, %@, for device: %{public}@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a2)
    v14 = CFSTR("HMDRemoteDeviceIsReachableNotification");
  else
    v14 = CFSTR("HMDRemoteDeviceIsNotReachableNotification");
  objc_msgSend(v12, "postNotificationName:object:", v14, v5);

}

- (HMDRemoteDeviceInformation)_startMonitoringDevice:(void *)a3 withInitialReachability:(void *)a4 forClient:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDRemoteDeviceInformation *v18;
  HMDRemoteDeviceInformation *v20;
  const char *v21;
  HMDRemoteDeviceInformation *v22;
  void *v23;
  id WeakRetained;
  id v25;
  id v26;
  void *v27;
  HMDRemoteDeviceInformation *v28;
  uint64_t v29;
  NSMutableArray *confirmationHandlers;
  uint64_t v31;
  NSHashTable *clients;
  id v33;
  NSHashTable *v34;
  NSHashTable *v35;
  const char *v36;
  id Property;
  void *v38;
  uint64_t v39;
  os_unfair_lock_s *v40;
  NSObject *v41;
  const char *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  id *v51;
  NSObject *v52;
  const char *v53;
  void *v54;
  id v55;
  void *v56;
  const char *v57;
  id v58;
  id v59;
  unint64_t v60;
  void *context;
  unsigned int obj;
  id v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  _QWORD v69[5];
  id v70;
  char v71;
  _BYTE buf[22];
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v68 = a3;
  v8 = a4;
  if (!a1 || (dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16)), !v7))
  {
    v18 = 0;
    goto LABEL_11;
  }
  v67 = v8;
  v71 = 0;
  objc_msgSend((id)a1, "accountRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceForDevice:exists:", v7, &v71);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isCurrentDevice") & 1) == 0)
  {
    objc_msgSend(v10, "handles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hmf_isEmpty");

    if (!v12)
    {
      os_unfair_lock_lock_with_options();
      -[HMDRemoteDeviceMonitor _deviceInformationForDevice:](a1, v10);
      v20 = (HMDRemoteDeviceInformation *)objc_claimAutoreleasedReturnValue();
      v22 = v20;
      if (v20)
      {
        objc_setProperty_atomic(v20, v21, v10, 16);
        v18 = v22;
      }
      else
      {
        v18 = [HMDRemoteDeviceInformation alloc];
        v23 = *(void **)(a1 + 16);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
        v25 = v10;
        v65 = v23;
        v26 = WeakRetained;
        v27 = v26;
        v63 = v25;
        if (v18)
        {
          if (!v25 || !v65 || !v26)
          {
            _HMFPreconditionFailure();
            __break(1u);
          }
          *(_QWORD *)buf = v18;
          *(_QWORD *)&buf[8] = HMDRemoteDeviceInformation;
          v28 = (HMDRemoteDeviceInformation *)objc_msgSendSuper2((objc_super *)buf, sel_init);
          v18 = v28;
          if (v28)
          {
            objc_storeStrong((id *)&v28->_device, v10);
            objc_storeStrong((id *)&v18->_workQueue, v23);
            objc_storeWeak((id *)&v18->_factory, v27);
            v18->_reachable = 1;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v29 = objc_claimAutoreleasedReturnValue();
            confirmationHandlers = v18->_confirmationHandlers;
            v18->_confirmationHandlers = (NSMutableArray *)v29;

            objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
            v31 = objc_claimAutoreleasedReturnValue();
            clients = v18->_clients;
            v18->_clients = (NSHashTable *)v31;

          }
        }

        v33 = *(id *)(a1 + 120);
        objc_msgSend(v33, "setObject:forKey:", v18, v63);

      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      if (v67)
      {
        os_unfair_lock_lock_with_options();
        if (v18)
          v34 = v18->_clients;
        else
          v34 = 0;
        v35 = v34;
        -[NSHashTable addObject:](v35, "addObject:", v67);

        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      }
      if (v22)
      {
        if (v68 && (objc_msgSend(v68, "BOOLValue") & 1) == 0)
          -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:]((void *)a1, objc_msgSend(v68, "BOOLValue"), v18, 6uLL, 1);
      }
      else
      {
        v18 = v18;
        v64 = v68;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
        if (v18)
          Property = objc_getProperty(v18, v36, 16, 1);
        else
          Property = 0;
        objc_msgSend(Property, "account");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (v66)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObserver:selector:name:object:", a1, sel_handleDeviceRemovedFromAccount_, CFSTR("HMDAccountRemovedDeviceNotification"), v66);

        }
        obj = objc_msgSend((id)a1, "isReachable");
        if (v64 && (objc_msgSend(v64, "BOOLValue") & 1) == 0)
        {
          obj = objc_msgSend(v64, "BOOLValue");
          v39 = 6;
        }
        else
        {
          v39 = 5;
        }
        v60 = v39;
        context = (void *)MEMORY[0x1D17BA0A0]();
        v40 = (os_unfair_lock_s *)(id)a1;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            v44 = objc_getProperty(v18, v42, 16, 1);
          else
            v44 = 0;
          objc_msgSend(v44, "shortDescription");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v43;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v45;
          v73 = 2112;
          v74 = v46;
          _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_INFO, "%{public}@Marking newly added device: %{public}@ with reachability: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(context);
        -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:](v40, obj, v18, v60, 1);

        os_unfair_lock_lock_with_options();
        v47 = BYTE1(v40[10]._os_unfair_lock_opaque);
        os_unfair_lock_unlock(v40 + 2);
        if (v47 && !isWatch())
        {
          -[HMDRemoteDeviceInformation addState:]((uint64_t)v18, 1);
          v69[0] = MEMORY[0x1E0C809B0];
          v69[1] = 3221225472;
          v69[2] = __83__HMDRemoteDeviceMonitor__startMonitoringDevice_withInitialReachability_forClient___block_invoke;
          v69[3] = &unk_1E89C21C0;
          v69[4] = v40;
          v70 = v10;
          -[HMDRemoteDeviceMonitor _confirmDevice:timeout:completionHandler:]((uint64_t)v40, v18, v69, 65.0);

        }
        v48 = *(void **)&v40[8]._os_unfair_lock_opaque;
        objc_msgSend(v10, "deviceAddress");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addListener:forDeviceAddress:", v40, v49);

        v50 = (void *)MEMORY[0x1D17BA0A0]();
        v51 = v40;
        HMFGetOSLogHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            v55 = objc_getProperty(v18, v53, 16, 1);
          else
            v55 = 0;
          objc_msgSend(v55, "shortDescription");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v54;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v56;
          _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Starting IDS Activity for device: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v50);
        v58 = v51[10];
        if (v18)
          v59 = objc_getProperty(v18, v57, 16, 1);
        else
          v59 = 0;
        objc_msgSend(v58, "startObservingPresenceForDevice:", v59);

      }
      goto LABEL_9;
    }
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = (id)a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      v73 = 2112;
      v74 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot monitor a device without any handles: %@, device found in account register: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
  }
  v18 = 0;
LABEL_9:

  v8 = v67;
LABEL_11:

  return v18;
}

void __83__HMDRemoteDeviceMonitor__startMonitoringDevice_withInitialReachability_forClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Determined newly monitored device is unreachable: %{public}@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

- (id)iCloudAccount
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 9);
  return WeakRetained;
}

- (id)devices
{
  id *v1;
  os_unfair_lock_s *v2;
  NSMapTable *v3;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v3 = (NSMapTable *)v1[15];
    NSAllMapTableValues(v3);
    v1 = (id *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v2);
  }
  return v1;
}

uint64_t __54__HMDRemoteDeviceMonitor_networkMonitorIsUnreachable___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@NetworkMonitor status changed to disconnected", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_handleGlobalReachabilityChange");
}

uint64_t __52__HMDRemoteDeviceMonitor_networkMonitorIsReachable___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@NetworkMonitor status changed to connected", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_handleGlobalReachabilityChange");
}

void __47__HMDRemoteDeviceMonitor_handleAccountRemoved___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDAccountNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping monitoring account: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v5, "devices", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          -[HMDRemoteDeviceMonitor _stopMonitoringDevice:](*(_QWORD *)(a1 + 40), *(void **)(*((_QWORD *)&v16 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
}

- (void)_stopMonitoringDevice:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  SEL v11;
  void *v12;
  id v13;
  SEL v14;
  id v15;
  SEL v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      v4 = *(id *)(a1 + 120);
      objc_msgSend(v4, "objectForKey:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = *(id *)(a1 + 120);
        objc_msgSend(v6, "removeObjectForKey:", v3);

        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        v7 = (void *)MEMORY[0x1D17BA0A0]();
        v8 = (id *)(id)a1;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(objc_getProperty(v5, v11, 16, 1), "shortDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138543618;
          v20 = v10;
          v21 = 2114;
          v22 = v12;
          _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Stopping monitoring of device: %{public}@", (uint8_t *)&v19, 0x16u);

        }
        objc_autoreleasePoolPop(v7);
        v13 = v8[10];
        objc_msgSend(v13, "stopObservingPresenceForDevice:", objc_getProperty(v5, v14, 16, 1));

        v15 = v8[4];
        objc_msgSend(objc_getProperty(v5, v16, 16, 1), "deviceAddress");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeListener:forDeviceAddress:", v8, v17);

        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDRemoteDeviceInformation completeConfirmationsWithError:]((uint64_t)v5, v18);

      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      }

    }
  }

}

void __57__HMDRemoteDeviceMonitor_handleDeviceRemovedFromAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v6 = v4;

  v5 = v6;
  if (v6)
  {
    -[HMDRemoteDeviceMonitor _stopMonitoringDevice:](*(_QWORD *)(a1 + 40), v6);
    v5 = v6;
  }

}

void __52__HMDRemoteDeviceMonitor_handleCurrentDeviceUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[HMDRemoteDeviceMonitor _stopMonitoringDevice:](*(_QWORD *)(a1 + 40), v5);
  objc_msgSend(*(id *)(a1 + 40), "_handleGlobalReachabilityChange");

}

void __76__HMDRemoteDeviceMonitor_confirmDevice_forClient_timeout_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HMDRemoteDeviceMonitor _startMonitoringDevice:withInitialReachability:forClient:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0, *(void **)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    -[HMDRemoteDeviceMonitor _confirmDevice:timeout:completionHandler:](*(_QWORD *)(a1 + 32), v2, *(void **)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain device information even after monitoring was started for device: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
  }

}

- (void)setReachable:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    if (*(unsigned __int8 *)(a1 + 40) == a2)
    {
      os_unfair_lock_unlock(v4);
    }
    else
    {
      *(_BYTE *)(a1 + 40) = a2;
      os_unfair_lock_unlock(v4);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
      objc_msgSend(WeakRetained, "device");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = (void *)MEMORY[0x1D17BA0A0]();
        v8 = (id)a1;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v10;
          v12 = "unreachable";
          if (a2)
            v12 = "reachable";
          v13 = 138543618;
          v14 = v10;
          v15 = 2080;
          v16 = v12;
          _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Marking current device as %s", (uint8_t *)&v13, 0x16u);

        }
        objc_autoreleasePoolPop(v7);
        -[HMDRemoteDeviceMonitor notifyDeviceReachabilityChange:forDevice:](v8, a2, v6);
        logAndPostNotification(CFSTR("HMDRemoteDeviceMonitorReachableNotification"), v8, 0);
      }

    }
  }
}

void __57__HMDRemoteDeviceMonitor_stopMonitoringDevice_forClient___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  _QWORD *v3;
  _QWORD *v4;
  id *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  SEL v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[15];
  v4 = v3;
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (id *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5[7];
    objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 48));

    v7 = v5[7];
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      os_unfair_lock_unlock(v2);
      -[HMDRemoteDeviceMonitor _stopMonitoringDevice:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
      goto LABEL_10;
    }
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v5[7];
      v14 = objc_msgSend(v13, "count");
      v16 = objc_getProperty(v5, v15, 16, 1);
      objc_msgSend(v16, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v12;
      v20 = 2048;
      v21 = v14;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@There are still %lu clients monitoring device: %{public}@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }
  os_unfair_lock_unlock(v2);
LABEL_10:

}

id __82__HMDRemoteDeviceMonitor_startMonitoringDevice_withInitialReachability_forClient___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[6];
    v9 = 138543874;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Received request to start monitoring device: %{public}@ with initial reachability: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return -[HMDRemoteDeviceMonitor _startMonitoringDevice:withInitialReachability:forClient:]((uint64_t)a1[4], a1[5], a1[6], a1[7]);
}

void __31__HMDRemoteDeviceMonitor_start__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  id Property;
  void *v28;
  _QWORD *v29;
  const char *v30;
  _QWORD *v31;
  id v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 56);
  else
    v7 = 0;
  objc_msgSend(v7, "addDelegate:queue:", v6, *(_QWORD *)(v6 + 16));
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 64);
  else
    v9 = 0;
  objc_msgSend(v9, "addDelegate:queue:", v8, *(_QWORD *)(v8 + 16));
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    v11 = *(void **)(v10 + 56);
  else
    v11 = 0;
  objc_msgSend(v11, "iCloudAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v12, "addRegistrationDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v13 = *(_QWORD *)(a1 + 32);
  v39 = v12;
  if (v13 && (objc_storeWeak((id *)(v13 + 72), v12), (v14 = *(_QWORD *)(a1 + 32)) != 0))
    v15 = *(void **)(v14 + 80);
  else
    v15 = 0;
  objc_msgSend(v15, "addObserver:forSubActivity:");
  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v16 + 16));
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(v16 + 41) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 8));
    v17 = *(void **)(a1 + 32);
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v17, "_handleGlobalReachabilityChange");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[HMDRemoteDeviceMonitor devices](*(char **)(a1 + 32));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v18)
  {
    v19 = v18;
    v41 = *(_QWORD *)v43;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v43 != v41)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v20);
        v22 = (void *)MEMORY[0x1D17BA0A0]();
        v23 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            Property = objc_getProperty(v21, v25, 16, 1);
          else
            Property = 0;
          objc_msgSend(Property, "shortDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v26;
          v48 = 2114;
          v49 = v28;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Initializing IDS Activity for device: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        v29 = *(_QWORD **)(a1 + 32);
        if (v29)
          v29 = (_QWORD *)v29[10];
        v31 = v29;
        if (v21)
          v32 = objc_getProperty(v21, v30, 16, 1);
        else
          v32 = 0;
        objc_msgSend(v31, "startObservingPresenceForDevice:", v32);

        objc_msgSend(*(id *)(a1 + 32), "transportReachabilityObserver");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(a1 + 32);
        if (v21)
          v36 = objc_getProperty(v21, v33, 16, 1);
        else
          v36 = 0;
        objc_msgSend(v36, "deviceAddress");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addListener:forDeviceAddress:", v35, v37);

        if (!isWatch())
        {
          -[HMDRemoteDeviceInformation addState:]((uint64_t)v21, 1);
          -[HMDRemoteDeviceMonitor _confirmDevice:timeout:completionHandler:](*(_QWORD *)(a1 + 32), v21, 0, 65.0);
        }
        ++v20;
      }
      while (v19 != v20);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      v19 = v38;
    }
    while (v38);
  }

}

+ (id)pingMessageForDevice:(id)a3 timeout:(double)a4 restriction:(unint64_t)a5
{
  id v7;
  HMDRemoteDeviceMessageDestination *v8;
  void *v9;
  HMDRemoteDeviceMessageDestination *v10;
  void *v11;
  HMDHomeKitVersion *v12;
  int v13;
  HMDRemoteMessage *v14;
  const __CFString *v15;
  HMDRemoteMessage *v16;

  v7 = a3;
  v8 = [HMDRemoteDeviceMessageDestination alloc];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  v10 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v8, "initWithTarget:device:", v9, v7);

  objc_msgSend(v7, "version");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("3.0"));
  v13 = objc_msgSend(v11, "isAtLeastVersion:", v12);

  v14 = [HMDRemoteMessage alloc];
  if (v13)
    v15 = CFSTR("kPingInternalRequestKey");
  else
    v15 = CFSTR("kElectDeviceForIDSSessionKey");
  v16 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:restriction:](v14, "initWithName:destination:payload:type:timeout:secure:restriction:", v15, v10, 0, 0, 0, a5, a4);

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t59_153809 != -1)
    dispatch_once(&logCategory__hmf_once_t59_153809, &__block_literal_global_153810);
  return (id)logCategory__hmf_once_v60_153811;
}

void __37__HMDRemoteDeviceMonitor_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v60_153811;
  logCategory__hmf_once_v60_153811 = v0;

}

@end
