@implementation HMMTRAccessoryConnectionRequest

- (HMMTRAccessoryConnectionRequest)initWithQueue:(id)a3 server:(id)a4 highPriority:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  HMMTRAccessoryConnectionRequest *v14;
  HMMTRAccessoryConnectionRequest *v15;
  uint64_t v16;
  NSNumber *nodeID;
  uint64_t v18;
  NSNumber *fabricID;
  NSMutableArray *v20;
  NSMutableArray *pendingOperations;
  NSMutableArray *v22;
  void *v23;
  uint64_t v24;
  HMFTimer *idleTimer;
  uint64_t v26;
  HMFTimer *idleReadTimer;
  uint64_t v28;
  HMFTimer *idleWriteTimer;
  uint64_t v30;
  HMFTimer *lifeTimer;
  objc_super v33;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)HMMTRAccessoryConnectionRequest;
  v14 = -[HMMTRAccessoryConnectionRequest init](&v33, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_server, v12);
    objc_msgSend(v12, "nodeID");
    v16 = objc_claimAutoreleasedReturnValue();
    nodeID = v15->_nodeID;
    v15->_nodeID = (NSNumber *)v16;

    objc_msgSend(v12, "fabricID");
    v18 = objc_claimAutoreleasedReturnValue();
    fabricID = v15->_fabricID;
    v15->_fabricID = (NSNumber *)v18;

    objc_storeStrong((id *)&v15->_workQueue, a3);
    objc_storeWeak((id *)&v15->_parentFabricRequest, 0);
    v15->_connectionPriority = v7;
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingOperations = v15->_pendingOperations;
    v15->_pendingOperations = v20;

    v22 = v15->_pendingOperations;
    v23 = (void *)MEMORY[0x242656B10](v13);
    -[NSMutableArray addObject:](v22, "addObject:", v23);

    v15->_connectionIdleTime = 0;
    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 7.5);
    idleTimer = v15->_idleTimer;
    v15->_idleTimer = (HMFTimer *)v24;

    -[HMFTimer setDelegateQueue:](v15->_idleTimer, "setDelegateQueue:", v11);
    -[HMFTimer setDelegate:](v15->_idleTimer, "setDelegate:", v15);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 60.0);
    idleReadTimer = v15->_idleReadTimer;
    v15->_idleReadTimer = (HMFTimer *)v26;

    -[HMFTimer setDelegateQueue:](v15->_idleReadTimer, "setDelegateQueue:", v11);
    -[HMFTimer setDelegate:](v15->_idleReadTimer, "setDelegate:", v15);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 60.0);
    idleWriteTimer = v15->_idleWriteTimer;
    v15->_idleWriteTimer = (HMFTimer *)v28;

    -[HMFTimer setDelegateQueue:](v15->_idleWriteTimer, "setDelegateQueue:", v11);
    -[HMFTimer setDelegate:](v15->_idleWriteTimer, "setDelegate:", v15);
    v30 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 60.0);
    lifeTimer = v15->_lifeTimer;
    v15->_lifeTimer = (HMFTimer *)v30;

    -[HMFTimer setDelegateQueue:](v15->_lifeTimer, "setDelegateQueue:", v11);
    -[HMFTimer setDelegate:](v15->_lifeTimer, "setDelegate:", v15);
    -[HMFTimer resume](v15->_lifeTimer, "resume");
  }

  return v15;
}

- (double)_getIdleAccessoryConnectionTimeoutWEDShort
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("hmmtr.thread.wed.idletimer.short"), (CFStringRef)*MEMORY[0x24BDBD580]);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 7.5;
  }

  return v5;
}

- (double)_getIdleAccessoryConnectionTimeoutWEDShortRead
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("hmmtr.thread.wed.idletimer.shortread"), (CFStringRef)*MEMORY[0x24BDBD580]);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 2.0;
  }

  return v5;
}

- (double)_getIdleAccessoryConnectionTimeoutWEDShortWrite
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("hmmtr.thread.wed.idletimer.shortwrite"), (CFStringRef)*MEMORY[0x24BDBD580]);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 15.0;
  }

  return v5;
}

- (void)updateConnectionIdleTime:(unsigned __int8)a3
{
  uint64_t v3;
  double v5;
  HMMTRAccessoryConnectionRequest *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = a3;
  if (-[HMMTRAccessoryConnectionRequest connectionIdleTime](self, "connectionIdleTime") != a3)
  {
    -[HMMTRAccessoryConnectionRequest setConnectionIdleTime:](self, "setConnectionIdleTime:", v3);
    if ((_DWORD)v3 == 2)
    {
      -[HMMTRAccessoryConnectionRequest _restartConnectionIdleTimer:](self, "_restartConnectionIdleTimer:", 30.0);
      v5 = 60.0;
      v6 = self;
      v7 = 60.0;
    }
    else
    {
      if ((_DWORD)v3 != 1)
      {
        -[HMMTRAccessoryConnectionRequest _restartConnectionIdleTimer:](self, "_restartConnectionIdleTimer:", 7.5);
        return;
      }
      -[HMMTRAccessoryConnectionRequest _getIdleAccessoryConnectionTimeoutWEDShort](self, "_getIdleAccessoryConnectionTimeoutWEDShort");
      -[HMMTRAccessoryConnectionRequest _restartConnectionIdleTimer:](self, "_restartConnectionIdleTimer:");
      -[HMMTRAccessoryConnectionRequest _getIdleAccessoryConnectionTimeoutWEDShortRead](self, "_getIdleAccessoryConnectionTimeoutWEDShortRead");
      v9 = v8;
      -[HMMTRAccessoryConnectionRequest _getIdleAccessoryConnectionTimeoutWEDShortWrite](self, "_getIdleAccessoryConnectionTimeoutWEDShortWrite");
      v7 = v10;
      v6 = self;
      v5 = v9;
    }
    -[HMMTRAccessoryConnectionRequest _restartReadWriteIdleTimersWithReadInterval:writeInterval:](v6, "_restartReadWriteIdleTimersWithReadInterval:writeInterval:", v5, v7);
  }
}

- (void)_restartConnectionIdleTimer:(double)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  HMMTRAccessoryConnectionRequest *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryConnectionRequest idleTimer](self, "idleTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunning");

  -[HMMTRAccessoryConnectionRequest idleTimer](self, "idleTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suspend");

  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v11;
    v19 = 2048;
    v20 = a3;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Updating AccessoryConnectionRequest Idle time to: %f", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, a3);
  -[HMMTRAccessoryConnectionRequest setIdleTimer:](v9, "setIdleTimer:", v12);

  -[HMMTRAccessoryConnectionRequest workQueue](v9, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryConnectionRequest idleTimer](v9, "idleTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegateQueue:", v13);

  -[HMMTRAccessoryConnectionRequest idleTimer](v9, "idleTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", v9);

  if (v6)
  {
    -[HMMTRAccessoryConnectionRequest idleTimer](v9, "idleTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resume");

  }
}

- (void)_restartReadWriteIdleTimersWithReadInterval:(double)a3 writeInterval:(double)a4
{
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  HMMTRAccessoryConnectionRequest *v14;
  NSObject *v15;
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
  int v27;
  void *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryConnectionRequest idleReadTimer](self, "idleReadTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRunning");

  -[HMMTRAccessoryConnectionRequest idleWriteTimer](self, "idleWriteTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isRunning");

  -[HMMTRAccessoryConnectionRequest idleReadTimer](self, "idleReadTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "suspend");

  -[HMMTRAccessoryConnectionRequest idleWriteTimer](self, "idleWriteTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "suspend");

  v13 = (void *)MEMORY[0x242656984]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543874;
    v28 = v16;
    v29 = 2048;
    v30 = a3;
    v31 = 2048;
    v32 = a4;
    _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Updating AccessoryConnectionRequest read/write idle time to: read: %f, write: %f", (uint8_t *)&v27, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, a3);
  -[HMMTRAccessoryConnectionRequest setIdleReadTimer:](v14, "setIdleReadTimer:", v17);

  -[HMMTRAccessoryConnectionRequest workQueue](v14, "workQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryConnectionRequest idleReadTimer](v14, "idleReadTimer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDelegateQueue:", v18);

  -[HMMTRAccessoryConnectionRequest idleReadTimer](v14, "idleReadTimer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", v14);

  if (v8)
  {
    -[HMMTRAccessoryConnectionRequest idleReadTimer](v14, "idleReadTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "resume");

  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, a4);
  -[HMMTRAccessoryConnectionRequest setIdleWriteTimer:](v14, "setIdleWriteTimer:", v22);

  -[HMMTRAccessoryConnectionRequest workQueue](v14, "workQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryConnectionRequest idleWriteTimer](v14, "idleWriteTimer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDelegateQueue:", v23);

  -[HMMTRAccessoryConnectionRequest idleWriteTimer](v14, "idleWriteTimer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDelegate:", v14);

  if (v10)
  {
    -[HMMTRAccessoryConnectionRequest idleWriteTimer](v14, "idleWriteTimer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "resume");

  }
}

- (unint64_t)_numPendingOperations
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[NSMutableArray count](self->_pendingOperations, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_getAllPendingOperations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_pendingOperations);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeAllObjects](self->_pendingOperations, "removeAllObjects");
  -[HMMTRAccessoryConnectionRequest setConnectionPriority:](self, "setConnectionPriority:", 0);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)mergeAccessoryConnectionRequest:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryConnectionRequest *v6;
  NSObject *v7;
  void *v8;
  NSMutableArray *pendingOperations;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v8;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@mergeAccessoryConnectionRequest", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  if (objc_msgSend(v4, "connectionPriority") == 1)
    -[HMMTRAccessoryConnectionRequest setConnectionPriority:](v6, "setConnectionPriority:", 1);
  pendingOperations = v6->_pendingOperations;
  objc_msgSend(v4, "_getAllPendingOperations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](pendingOperations, "addObjectsFromArray:", v10);

  os_unfair_lock_unlock(&v6->_lock);
  -[HMMTRAccessoryConnectionRequest lifeTimer](v6, "lifeTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resume");

}

- (void)executeAllPendingOperations
{
  void *v3;
  HMMTRAccessoryConnectionRequest *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@executeAllPendingOperations", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = -[HMMTRAccessoryConnectionRequest connectionPriority](v4, "connectionPriority");
  -[HMMTRAccessoryConnectionRequest _getAllPendingOperations](v4, "_getAllPendingOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[HMMTRAccessoryConnectionRequest idleTimer](v4, "idleTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "suspend");

    if (v7 == 1)
    {
      -[HMMTRAccessoryConnectionRequest idleWriteTimer](v4, "idleWriteTimer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "suspend");

    }
    -[HMMTRAccessoryConnectionRequest idleReadTimer](v4, "idleReadTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "suspend");

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16) + 16))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16));
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    -[HMMTRAccessoryConnectionRequest kickIdleTimer](v4, "kickIdleTimer", (_QWORD)v19);
    if (v7 == 1)
    {
      -[HMMTRAccessoryConnectionRequest idleWriteTimer](v4, "idleWriteTimer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "resume");

    }
    -[HMMTRAccessoryConnectionRequest idleReadTimer](v4, "idleReadTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resume");

  }
}

- (void)abortAllPendingOperations:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryConnectionRequest *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@abortAllPendingOperations", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTRAccessoryConnectionRequest _getAllPendingOperations](v6, "_getAllPendingOperations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryConnectionRequest idleTimer](v6, "idleTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suspend");

  -[HMMTRAccessoryConnectionRequest idleWriteTimer](v6, "idleWriteTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "suspend");

  -[HMMTRAccessoryConnectionRequest idleReadTimer](v6, "idleReadTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "suspend");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17) + 16))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17));
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  -[HMMTRAccessoryConnectionRequest parentFabricRequest](v6, "parentFabricRequest", (_QWORD)v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "operationsCompletedForAccessoryConnectionRequest:", v6);

}

- (void)kickIdleTimer
{
  void *v3;
  HMMTRAccessoryConnectionRequest *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@kickIdleTimer", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRAccessoryConnectionRequest idleTimer](v4, "idleTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");

}

- (void)_handleReadWriteTimerDidFire:(id)a3 altTimer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  int v10;
  void *v11;
  HMMTRAccessoryConnectionRequest *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMMTRAccessoryConnectionRequest *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMMTRAccessoryConnectionRequest server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isReadyToReadFromMTRDevice");

  if ((v9 & 1) != 0)
  {
    v10 = objc_msgSend(v7, "isRunning");
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v15;
        _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@handleReadWriteTimerDidFire - pending read or write", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v20;
        _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@handleReadWriteTimerDidFire - no pending read/writes, mark connection as idle", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      -[HMMTRAccessoryConnectionRequest idleTimer](v12, "idleTimer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fire");

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v19;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_DEBUG, "%{public}@handleReadWriteTimerDidFire - sub not yet establish, kick timer", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v6, "resume");
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  HMMTRAccessoryConnectionRequest *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMMTRAccessoryConnectionRequest *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMMTRAccessoryConnectionRequest idleTimer](self, "idleTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v14 = (void *)MEMORY[0x242656984]();
    v10 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v16;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@No activity for accessory, releasing connection", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[HMMTRAccessoryConnectionRequest idleWriteTimer](v10, "idleWriteTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "suspend");

    -[HMMTRAccessoryConnectionRequest idleReadTimer](v10, "idleReadTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suspend");
    goto LABEL_11;
  }
  -[HMMTRAccessoryConnectionRequest idleWriteTimer](self, "idleWriteTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v19 = (void *)MEMORY[0x242656984]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v22;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_DEBUG, "%{public}@timerDidFire - idleWriteTimer", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    -[HMMTRAccessoryConnectionRequest idleWriteTimer](v20, "idleWriteTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryConnectionRequest idleReadTimer](v20, "idleReadTimer");
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  -[HMMTRAccessoryConnectionRequest idleReadTimer](self, "idleReadTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    v24 = (void *)MEMORY[0x242656984]();
    v20 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v26;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_DEBUG, "%{public}@timerDidFire - idleReadTimer", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    -[HMMTRAccessoryConnectionRequest idleReadTimer](v20, "idleReadTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryConnectionRequest idleWriteTimer](v20, "idleWriteTimer");
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v27 = (void *)v23;
    -[HMMTRAccessoryConnectionRequest _handleReadWriteTimerDidFire:altTimer:](v20, "_handleReadWriteTimerDidFire:altTimer:", v18, v23);

    goto LABEL_19;
  }
  -[HMMTRAccessoryConnectionRequest lifeTimer](self, "lifeTimer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v12;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Lifetime of the accessory connection request expired, releasing connection", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 13);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryConnectionRequest abortAllPendingOperations:](v10, "abortAllPendingOperations:", v13);
LABEL_11:

    -[HMMTRAccessoryConnectionRequest parentFabricRequest](v10, "parentFabricRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "operationsCompletedForAccessoryConnectionRequest:", v10);
LABEL_19:

  }
}

- (BOOL)hasPendingHighPriorityConnectionRequest
{
  return -[HMMTRAccessoryConnectionRequest connectionPriority](self, "connectionPriority") == 1;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMMTRAccessoryConnectionRequest nodeID](self, "nodeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryConnectionRequest fabricID](self, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)privateDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryConnectionRequest nodeID](self, "nodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryConnectionRequest fabricID](self, "fabricID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ [%@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRAccessoryConnectionRequest nodeID](self, "nodeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("NodeID"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRAccessoryConnectionRequest fabricID](self, "fabricID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("FabricID"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HMMTRAccessoryConnectionRequest *v4;
  HMMTRAccessoryConnectionRequest *v5;
  HMMTRAccessoryConnectionRequest *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HMMTRAccessoryConnectionRequest *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if (self == v4)
  {
    v12 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[HMMTRAccessoryConnectionRequest nodeID](v6, "nodeID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryConnectionRequest nodeID](self, "nodeID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      -[HMMTRAccessoryConnectionRequest fabricID](v6, "fabricID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryConnectionRequest fabricID](self, "fabricID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
LABEL_6:
    v12 = 0;
  }
LABEL_10:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMMTRAccessoryConnectionRequest nodeID](self, "nodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMMTRAccessoryConnectionRequest fabricID](self, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (HMMTRFabricConnectionRequest)parentFabricRequest
{
  return (HMMTRFabricConnectionRequest *)objc_loadWeakRetained((id *)&self->_parentFabricRequest);
}

- (void)setParentFabricRequest:(id)a3
{
  objc_storeWeak((id *)&self->_parentFabricRequest, a3);
}

- (HMMTRAccessoryServer)server
{
  return (HMMTRAccessoryServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (unsigned)connectionIdleTime
{
  return self->_connectionIdleTime;
}

- (void)setConnectionIdleTime:(unsigned __int8)a3
{
  self->_connectionIdleTime = a3;
}

- (BOOL)wedConnectionPending
{
  return self->_wedConnectionPending;
}

- (void)setWedConnectionPending:(BOOL)a3
{
  self->_wedConnectionPending = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMFTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimer, a3);
}

- (HMFTimer)idleReadTimer
{
  return self->_idleReadTimer;
}

- (void)setIdleReadTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleReadTimer, a3);
}

- (HMFTimer)idleWriteTimer
{
  return self->_idleWriteTimer;
}

- (void)setIdleWriteTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleWriteTimer, a3);
}

- (HMFTimer)lifeTimer
{
  return self->_lifeTimer;
}

- (unint64_t)connectionPriority
{
  return self->_connectionPriority;
}

- (void)setConnectionPriority:(unint64_t)a3
{
  self->_connectionPriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifeTimer, 0);
  objc_storeStrong((id *)&self->_idleWriteTimer, 0);
  objc_storeStrong((id *)&self->_idleReadTimer, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_destroyWeak((id *)&self->_parentFabricRequest);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16 != -1)
    dispatch_once(&logCategory__hmf_once_t16, &__block_literal_global_949);
  return (id)logCategory__hmf_once_v17;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __46__HMMTRAccessoryConnectionRequest_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17;
  logCategory__hmf_once_v17 = v0;

}

@end
