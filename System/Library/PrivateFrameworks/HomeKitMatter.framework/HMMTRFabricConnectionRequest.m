@implementation HMMTRFabricConnectionRequest

- (HMMTRFabricConnectionRequest)initWithQueue:(id)a3 browser:(id)a4 fabricID:(id)a5 systemCommissionerFabric:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  HMMTRFabricConnectionRequest *v14;
  HMMTRFabricConnectionRequest *v15;
  uint64_t v16;
  NSNumber *fabricID;
  uint64_t v18;
  NSMutableOrderedSet *activeIPConnectionRequests;
  uint64_t v20;
  NSMutableOrderedSet *activeThreadConnectionRequests;
  uint64_t v22;
  NSMutableOrderedSet *activeThreadWEDConnectionRequests;
  uint64_t v24;
  NSMutableOrderedSet *pendingConnectionRequests;
  uint64_t v26;
  HMFTimer *idleTimer;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HMMTRFabricConnectionRequest;
  v14 = -[HMMTRFabricConnectionRequest init](&v29, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_workQueue, a3);
    objc_storeWeak((id *)&v15->_browser, v12);
    v15->_active = 0;
    v16 = objc_msgSend(v13, "copy");
    fabricID = v15->_fabricID;
    v15->_fabricID = (NSNumber *)v16;

    v15->_systemCommissionerFabric = a6;
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v18 = objc_claimAutoreleasedReturnValue();
    activeIPConnectionRequests = v15->_activeIPConnectionRequests;
    v15->_activeIPConnectionRequests = (NSMutableOrderedSet *)v18;

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v20 = objc_claimAutoreleasedReturnValue();
    activeThreadConnectionRequests = v15->_activeThreadConnectionRequests;
    v15->_activeThreadConnectionRequests = (NSMutableOrderedSet *)v20;

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v22 = objc_claimAutoreleasedReturnValue();
    activeThreadWEDConnectionRequests = v15->_activeThreadWEDConnectionRequests;
    v15->_activeThreadWEDConnectionRequests = (NSMutableOrderedSet *)v22;

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v24 = objc_claimAutoreleasedReturnValue();
    pendingConnectionRequests = v15->_pendingConnectionRequests;
    v15->_pendingConnectionRequests = (NSMutableOrderedSet *)v24;

    v15->_fabricIdleTime = 0;
    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 15.0);
    idleTimer = v15->_idleTimer;
    v15->_idleTimer = (HMFTimer *)v26;

    -[HMFTimer setDelegateQueue:](v15->_idleTimer, "setDelegateQueue:", v11);
    -[HMFTimer setDelegate:](v15->_idleTimer, "setDelegate:", v15);
  }

  return v15;
}

- (void)_calculateFabricIdleTime
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMMTRFabricConnectionRequest activeThreadWEDConnectionRequests](self, "activeThreadWEDConnectionRequests", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "connectionIdleTime") == 2)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  -[HMMTRFabricConnectionRequest _updateConnectionIdleTime:](self, "_updateConnectionIdleTime:", v4);
}

- (void)_updateConnectionIdleTime:(unsigned __int8)a3
{
  uint64_t v3;
  double v5;

  v3 = a3;
  if (-[HMMTRFabricConnectionRequest fabricIdleTime](self, "fabricIdleTime") != a3
    && -[HMMTRFabricConnectionRequest _hasActiveAccessoryConnections](self, "_hasActiveAccessoryConnections"))
  {
    -[HMMTRFabricConnectionRequest setFabricIdleTime:](self, "setFabricIdleTime:", v3);
    v5 = 35.0;
    if ((_DWORD)v3 != 1)
      v5 = 15.0;
    -[HMMTRFabricConnectionRequest _restartConnectionIdleTimer:](self, "_restartConnectionIdleTimer:", v5);
  }
}

- (void)_restartConnectionIdleTimer:(double)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  HMMTRFabricConnectionRequest *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  HMFTimer *idleTimer;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMMTRFabricConnectionRequest idleTimer](self, "idleTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunning");

  -[HMMTRFabricConnectionRequest idleTimer](self, "idleTimer");
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
    v16 = 138543618;
    v17 = v11;
    v18 = 2048;
    v19 = a3;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Updating FabricConnectionRequest Idle time to: %f", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, a3);
  idleTimer = v9->_idleTimer;
  v9->_idleTimer = (HMFTimer *)v12;

  -[HMMTRFabricConnectionRequest workQueue](v9, "workQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFTimer setDelegateQueue:](v9->_idleTimer, "setDelegateQueue:", v14);

  -[HMFTimer setDelegate:](v9->_idleTimer, "setDelegate:", v9);
  if (v6)
  {
    -[HMMTRFabricConnectionRequest idleTimer](v9, "idleTimer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resume");

  }
}

- (id)activeIPConnectionRequests
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x24BDBCE30];
  -[NSMutableOrderedSet array](self->_activeIPConnectionRequests, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_addToActiveIPConnections:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableOrderedSet *activeIPConnectionRequests;
  void *v7;
  void *v8;
  void *v9;
  HMMTRFabricConnectionRequest *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = -[NSMutableOrderedSet indexOfObject:](self->_activeIPConnectionRequests, "indexOfObject:", v4);
  activeIPConnectionRequests = self->_activeIPConnectionRequests;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableOrderedSet addObject:](activeIPConnectionRequests, "addObject:", v4);
    v7 = 0;
  }
  else
  {
    -[NSMutableOrderedSet objectAtIndex:](activeIPConnectionRequests, "objectAtIndex:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mergeAccessoryConnectionRequest:", v4);
  }
  os_unfair_lock_unlock(&self->_lock);
  -[HMMTRFabricConnectionRequest idleTimer](self, "idleTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspend");

  if (v7)
  {
    objc_msgSend(v7, "executeAllPendingOperations");
  }
  else
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nodeID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Adding active IP connection for request: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v4, "updateConnectionIdleTime:", 0);
    -[HMMTRFabricConnectionRequest _calculateFabricIdleTime](v10, "_calculateFabricIdleTime");
    objc_msgSend(v4, "executeAllPendingOperations");
  }
  -[HMMTRFabricConnectionRequest _kickIdleTimer](self, "_kickIdleTimer");

}

- (BOOL)_removeFromActiveIPConnections:(id)a3
{
  id v4;
  int v5;
  void *v6;
  HMMTRFabricConnectionRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = -[NSMutableOrderedSet containsObject:](self->_activeIPConnectionRequests, "containsObject:", v4);
  if (v5)
  {
    -[NSMutableOrderedSet removeObject:](self->_activeIPConnectionRequests, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)MEMORY[0x242656984]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nodeID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed active IP connection for accessory %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  return v5;
}

- (id)activeThreadConnectionRequests
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x24BDBCE30];
  -[NSMutableOrderedSet array](self->_activeThreadConnectionRequests, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_addToActiveThreadConnections:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableOrderedSet *activeThreadConnectionRequests;
  void *v7;
  void *v8;
  void *v9;
  HMMTRFabricConnectionRequest *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = -[NSMutableOrderedSet indexOfObject:](self->_activeThreadConnectionRequests, "indexOfObject:", v4);
  activeThreadConnectionRequests = self->_activeThreadConnectionRequests;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableOrderedSet addObject:](activeThreadConnectionRequests, "addObject:", v4);
    v7 = 0;
  }
  else
  {
    -[NSMutableOrderedSet objectAtIndex:](activeThreadConnectionRequests, "objectAtIndex:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mergeAccessoryConnectionRequest:", v4);
  }
  os_unfair_lock_unlock(&self->_lock);
  -[HMMTRFabricConnectionRequest idleTimer](self, "idleTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspend");

  if (v7)
  {
    objc_msgSend(v7, "executeAllPendingOperations");
  }
  else
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nodeID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Adding active thread connection for request: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v4, "updateConnectionIdleTime:", 0);
    -[HMMTRFabricConnectionRequest _calculateFabricIdleTime](v10, "_calculateFabricIdleTime");
    objc_msgSend(v4, "server");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "triggerEstablishingMatterSubscription");

    objc_msgSend(v4, "executeAllPendingOperations");
  }
  -[HMMTRFabricConnectionRequest _kickIdleTimer](self, "_kickIdleTimer");

}

- (BOOL)_removeFromActiveThreadConnections:(id)a3
{
  id v4;
  int v5;
  void *v6;
  HMMTRFabricConnectionRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = -[NSMutableOrderedSet containsObject:](self->_activeThreadConnectionRequests, "containsObject:", v4);
  if (v5)
  {
    -[NSMutableOrderedSet removeObject:](self->_activeThreadConnectionRequests, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)MEMORY[0x242656984]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nodeID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed active thread connection for accessory %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  return v5;
}

- (id)activeThreadWEDConnectionRequests
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x24BDBCE30];
  -[NSMutableOrderedSet array](self->_activeThreadWEDConnectionRequests, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_addToActiveThreadWEDConnections:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableOrderedSet *activeThreadWEDConnectionRequests;
  void *v7;
  void *v8;
  void *v9;
  HMMTRFabricConnectionRequest *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMMTRFabricConnectionRequest *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = -[NSMutableOrderedSet indexOfObject:](self->_activeThreadWEDConnectionRequests, "indexOfObject:", v4);
  activeThreadWEDConnectionRequests = self->_activeThreadWEDConnectionRequests;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableOrderedSet addObject:](activeThreadWEDConnectionRequests, "addObject:", v4);
    v7 = 0;
  }
  else
  {
    -[NSMutableOrderedSet objectAtIndex:](activeThreadWEDConnectionRequests, "objectAtIndex:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mergeAccessoryConnectionRequest:", v4);
  }
  os_unfair_lock_unlock(&self->_lock);
  -[HMMTRFabricConnectionRequest idleTimer](self, "idleTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspend");

  if (v7)
  {
    if (objc_msgSend(v4, "wedConnectionPending"))
    {
      v9 = (void *)MEMORY[0x242656984]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "nodeID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v12;
        v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@WED connection is still pending for request: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }
    else
    {
      objc_msgSend(v7, "executeAllPendingOperations");
      -[HMMTRFabricConnectionRequest _kickIdleTimer](self, "_kickIdleTimer");
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x242656984]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nodeID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      v28 = 2112;
      v29 = v18;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Adding active thread WED connection for request: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v4, "setWedConnectionPending:", 1);
    objc_msgSend(v4, "updateConnectionIdleTime:", 2);
    -[HMMTRFabricConnectionRequest _calculateFabricIdleTime](v15, "_calculateFabricIdleTime");
    objc_msgSend(v4, "kickIdleTimer");
    -[HMMTRFabricConnectionRequest _kickIdleTimer](v15, "_kickIdleTimer");
    objc_msgSend(v4, "server");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "eMACAddress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dataUsingEncoding:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMMTRFabricConnectionRequest browser](v15, "browser");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "threadRadioManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __65__HMMTRFabricConnectionRequest__addToActiveThreadWEDConnections___block_invoke;
    v24[3] = &unk_250F23E18;
    v24[4] = v15;
    v25 = v4;
    objc_msgSend(v23, "connectToAccessoryWithExtendedMACAddress:completion:", v21, v24);

  }
}

- (void)_updateActiveThreadWEDConnectionsIdleTime:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMMTRFabricConnectionRequest activeThreadWEDConnectionRequests](self, "activeThreadWEDConnectionRequests", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "updateConnectionIdleTime:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[HMMTRFabricConnectionRequest _calculateFabricIdleTime](self, "_calculateFabricIdleTime");
}

- (BOOL)_removeFromActiveThreadWEDConnections:(id)a3
{
  id v4;
  int v5;
  void *v6;
  HMMTRFabricConnectionRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  HMMTRFabricConnectionRequest *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = -[NSMutableOrderedSet containsObject:](self->_activeThreadWEDConnectionRequests, "containsObject:", v4);
  if (v5)
  {
    -[NSMutableOrderedSet removeObject:](self->_activeThreadWEDConnectionRequests, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)MEMORY[0x242656984]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v9;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed active thread WED connection for accessory %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10 || (objc_msgSend(v10, "hasPreferredLocalLink") & 1) != 0)
      goto LABEL_12;
    -[HMMTRFabricConnectionRequest browser](v7, "browser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "connectionRequestSuspended") & 1) != 0)
    {
      -[HMMTRFabricConnectionRequest browser](v7, "browser");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "server");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isOperationAllowedForAccessoryServer:", v14);

      if ((v15 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    objc_msgSend(v11, "handleWEDDisconnectedWhileNotPairing");
LABEL_12:

    -[HMMTRFabricConnectionRequest browser](v7, "browser");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "threadRadioManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __70__HMMTRFabricConnectionRequest__removeFromActiveThreadWEDConnections___block_invoke;
    v22 = &unk_250F23E18;
    v23 = v7;
    v24 = v4;
    objc_msgSend(v17, "connectToAccessoryWithExtendedMACAddress:completion:", 0, &v19);

    -[HMMTRFabricConnectionRequest _calculateFabricIdleTime](v7, "_calculateFabricIdleTime", v19, v20, v21, v22, v23);
    goto LABEL_13;
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_13:

  return v5;
}

- (BOOL)_tryMergeIntoExistingConnection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = -[NSMutableOrderedSet indexOfObject:](self->_activeIPConnectionRequests, "indexOfObject:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL
    && (-[NSMutableOrderedSet objectAtIndex:](self->_activeIPConnectionRequests, "objectAtIndex:", v5),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (v7 = -[NSMutableOrderedSet indexOfObject:](self->_activeThreadConnectionRequests, "indexOfObject:", v4),
        v7 != 0x7FFFFFFFFFFFFFFFLL)
    && (-[NSMutableOrderedSet objectAtIndex:](self->_activeThreadConnectionRequests, "objectAtIndex:", v7),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = 1;
    goto LABEL_9;
  }
  v9 = -[NSMutableOrderedSet indexOfObject:](self->_activeThreadWEDConnectionRequests, "indexOfObject:", v4);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableOrderedSet objectAtIndex:](self->_activeThreadWEDConnectionRequests, "objectAtIndex:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "wedConnectionPending");
    if (v6)
    {
      v8 = v10 ^ 1;
LABEL_9:
      os_unfair_lock_unlock(&self->_lock);
      objc_msgSend(v6, "mergeAccessoryConnectionRequest:", v4);
      if (v8)
        objc_msgSend(v6, "executeAllPendingOperations");
      goto LABEL_15;
    }
  }
  v11 = -[NSMutableOrderedSet indexOfObject:](self->_pendingConnectionRequests, "indexOfObject:", v4);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_unfair_lock_unlock(&self->_lock);
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  -[NSMutableOrderedSet objectAtIndex:](self->_pendingConnectionRequests, "objectAtIndex:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
    goto LABEL_16;
  objc_msgSend(v6, "mergeAccessoryConnectionRequest:", v4);
LABEL_15:
  -[HMMTRFabricConnectionRequest _kickIdleTimer](self, "_kickIdleTimer");

  v12 = 1;
LABEL_17:

  return v12;
}

- (id)pendingConnectionRequests
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x24BDBCE30];
  -[NSMutableOrderedSet array](self->_pendingConnectionRequests, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_addToPendingConnections:(id)a3
{
  id v4;
  void *v5;
  HMMTRFabricConnectionRequest *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  if ((-[NSMutableOrderedSet containsObject:](self->_pendingConnectionRequests, "containsObject:", v4) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    -[NSMutableOrderedSet addObject:](self->_pendingConnectionRequests, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    v5 = (void *)MEMORY[0x242656984]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Pending connection to accessory: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (void)_removeFromPendingConnections:(id)a3
{
  id v4;
  void *v5;
  HMMTRFabricConnectionRequest *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableOrderedSet containsObject:](self->_pendingConnectionRequests, "containsObject:", v4))
  {
    -[NSMutableOrderedSet removeObject:](self->_pendingConnectionRequests, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    v5 = (void *)MEMORY[0x242656984]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Removed pending connection to accessory: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (BOOL)hasPendingHighPriorityConnectionRequest
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMMTRFabricConnectionRequest pendingConnectionRequests](self, "pendingConnectionRequests", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasPendingHighPriorityConnectionRequest") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)connectToAccessoryWhenAllowed:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__HMMTRFabricConnectionRequest_connectToAccessoryWhenAllowed___block_invoke;
  v6[3] = &unk_250F22458;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HMMTRFabricConnectionRequest dispatchBlock:](self, "dispatchBlock:", v6);

}

- (void)_connectPendingConnections
{
  BOOL v3;
  void *v4;
  HMMTRFabricConnectionRequest *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  HMMTRFabricConnectionRequest *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = -[HMMTRFabricConnectionRequest active](self, "active");
  v4 = (void *)MEMORY[0x242656984]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v24;
      v41 = 2112;
      v42 = v5;
      v25 = "%{public}@Fabric is currently inactive, do not connect any pending connections: %@";
      v26 = v7;
      v27 = OS_LOG_TYPE_INFO;
      v28 = 22;
LABEL_27:
      _os_log_impl(&dword_23E95B000, v26, v27, v25, buf, v28);

    }
LABEL_28:

    objc_autoreleasePoolPop(v4);
    return;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v8;
    v41 = 2112;
    v42 = v5;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Connecting pending connections for fabric %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[HMMTRFabricConnectionRequest pendingConnectionRequests](v5, "pendingConnectionRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = v5;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v24;
      v25 = "%{public}@No more pending connections";
      v26 = v7;
      v27 = OS_LOG_TYPE_DEBUG;
      v28 = 12;
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[HMMTRFabricConnectionRequest pendingConnectionRequests](v5, "pendingConnectionRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v17, "hasPendingHighPriorityConnectionRequest"))
        {
          -[HMMTRFabricConnectionRequest _removeFromPendingConnections:](v5, "_removeFromPendingConnections:", v17);
          -[HMMTRFabricConnectionRequest connectToAccessoryWhenAllowed:](v5, "connectToAccessoryWhenAllowed:", v17);
        }
        else
        {
          objc_msgSend(v11, "addObject:", v17);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v14);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        -[HMMTRFabricConnectionRequest _removeFromPendingConnections:](v5, "_removeFromPendingConnections:", v23, (_QWORD)v29);
        -[HMMTRFabricConnectionRequest connectToAccessoryWhenAllowed:](v5, "connectToAccessoryWhenAllowed:", v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v20);
  }

}

- (void)operationsCompletedForAccessoryConnectionRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__HMMTRFabricConnectionRequest_operationsCompletedForAccessoryConnectionRequest___block_invoke;
  v6[3] = &unk_250F22458;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HMMTRFabricConnectionRequest dispatchBlock:](self, "dispatchBlock:", v6);

}

- (BOOL)_hasActiveAccessoryConnections
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v9;

  -[HMMTRFabricConnectionRequest activeIPConnectionRequests](self, "activeIPConnectionRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 1;
  -[HMMTRFabricConnectionRequest activeThreadConnectionRequests](self, "activeThreadConnectionRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    return 1;
  -[HMMTRFabricConnectionRequest activeThreadWEDConnectionRequests](self, "activeThreadWEDConnectionRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "count") != 0;

  return v7;
}

- (BOOL)_hasPendingAccessoryConnections
{
  void *v2;
  BOOL v3;

  -[HMMTRFabricConnectionRequest pendingConnectionRequests](self, "pendingConnectionRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_kickIdleTimer
{
  void *v3;
  HMMTRFabricConnectionRequest *v4;
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
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@_kickIdleTimer", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRFabricConnectionRequest idleTimer](v4, "idleTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMMTRFabricConnectionRequest *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMMTRFabricConnectionRequest *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  HMMTRFabricConnectionRequest *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v8;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@No activity on fabric, releasing connection", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = (void *)MEMORY[0x242656984]();
  v10 = v6;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_DEBUG, "%{public}@%@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRFabricConnectionRequest abortAllOperationsWithReason:](v10, "abortAllOperationsWithReason:", v13);

}

- (void)startOperations
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __47__HMMTRFabricConnectionRequest_startOperations__block_invoke;
  v2[3] = &unk_250F23DF0;
  v2[4] = self;
  -[HMMTRFabricConnectionRequest dispatchBlock:](self, "dispatchBlock:", v2);
}

- (void)stopOperations
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __46__HMMTRFabricConnectionRequest_stopOperations__block_invoke;
  v2[3] = &unk_250F23DF0;
  v2[4] = self;
  -[HMMTRFabricConnectionRequest dispatchBlock:](self, "dispatchBlock:", v2);
}

- (void)suspendOperations
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __49__HMMTRFabricConnectionRequest_suspendOperations__block_invoke;
  v2[3] = &unk_250F23DF0;
  v2[4] = self;
  -[HMMTRFabricConnectionRequest dispatchBlock:](self, "dispatchBlock:", v2);
}

- (void)retryOperations
{
  void *v3;
  HMMTRFabricConnectionRequest *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  HMMTRFabricConnectionRequest *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[HMMTRFabricConnectionRequest active](self, "active"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__HMMTRFabricConnectionRequest_retryOperations__block_invoke;
    v7[3] = &unk_250F23DF0;
    v7[4] = self;
    -[HMMTRFabricConnectionRequest dispatchBlock:](self, "dispatchBlock:", v7);
  }
  else
  {
    v3 = (void *)MEMORY[0x242656984]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v9 = v6;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalid state, expecting to be active for retryOperations for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
  }
}

- (BOOL)abortOperationsForConnectionRequest:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRFabricConnectionRequest *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nodeID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@abortOperationsForConnectionRequest for accessoryConnectionRequest for nodeID: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  os_unfair_lock_lock_with_options();
  v13 = -[NSMutableOrderedSet indexOfObject:](v9->_activeIPConnectionRequests, "indexOfObject:", v6);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL
    || (-[NSMutableOrderedSet objectAtIndex:](v9->_activeIPConnectionRequests, "objectAtIndex:", v13),
        (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v15 = -[NSMutableOrderedSet indexOfObject:](v9->_activeThreadConnectionRequests, "indexOfObject:", v6);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL
      || (-[NSMutableOrderedSet objectAtIndex:](v9->_activeThreadConnectionRequests, "objectAtIndex:", v15),
          (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v16 = -[NSMutableOrderedSet indexOfObject:](v9->_activeThreadWEDConnectionRequests, "indexOfObject:", v6);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL
        || (-[NSMutableOrderedSet objectAtIndex:](v9->_activeThreadWEDConnectionRequests, "objectAtIndex:", v16),
            (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v19 = -[NSMutableOrderedSet indexOfObject:](v9->_pendingConnectionRequests, "indexOfObject:", v6);
        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        {
          os_unfair_lock_unlock(&v9->_lock);
        }
        else
        {
          -[NSMutableOrderedSet objectAtIndex:](v9->_pendingConnectionRequests, "objectAtIndex:", v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          os_unfair_lock_unlock(&v9->_lock);
          if (v14)
            goto LABEL_10;
        }
        v18 = 0;
        goto LABEL_15;
      }
    }
  }
  os_unfair_lock_unlock(&v9->_lock);
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "abortAllPendingOperations:", v17);

  v18 = 1;
LABEL_15:

  return v18;
}

- (void)abortAllOperationsWithReason:(id)a3
{
  id v4;
  void *v5;
  HMMTRFabricConnectionRequest *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFabricConnectionRequest fabricID](v6, "fabricID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@abortAllOperations for fabricID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTRFabricConnectionRequest setActive:](v6, "setActive:", 0);
  -[HMMTRFabricConnectionRequest idleTimer](v6, "idleTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suspend");

  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[NSMutableOrderedSet array](v6->_pendingConnectionRequests, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

  -[NSMutableOrderedSet array](v6->_activeIPConnectionRequests, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v13);

  -[NSMutableOrderedSet array](v6->_activeThreadConnectionRequests, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v14);

  -[NSMutableOrderedSet array](v6->_activeThreadWEDConnectionRequests, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v15);

  os_unfair_lock_unlock(&v6->_lock);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "abortAllPendingOperations:", v21);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v17);
  }

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __61__HMMTRFabricConnectionRequest_abortAllOperationsWithReason___block_invoke;
  v23[3] = &unk_250F22458;
  v23[4] = v6;
  v24 = v4;
  v22 = v4;
  -[HMMTRFabricConnectionRequest dispatchBlock:](v6, "dispatchBlock:", v23);

}

- (void)updateAllConnectionIdleTimeoutsToMinimum
{
  void *v3;
  HMMTRFabricConnectionRequest *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFabricConnectionRequest fabricID](v4, "fabricID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@updateAllConnectionIdleTimeoutsToMinimum for fabricID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &v4->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableOrderedSet array](v4->_pendingConnectionRequests, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v10);

  -[NSMutableOrderedSet array](v4->_activeIPConnectionRequests, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v11);

  -[NSMutableOrderedSet array](v4->_activeThreadConnectionRequests, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v12);

  -[NSMutableOrderedSet array](v4->_activeThreadWEDConnectionRequests, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v13);

  os_unfair_lock_unlock(p_lock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "updateConnectionIdleTime:", 0, (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (void)dispatchBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[HMMTRFabricConnectionRequest workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMMTRFabricConnectionRequest fabricID](self, "fabricID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMMTRFabricConnectionRequest systemCommissionerFabric](self, "systemCommissionerFabric");
  v6 = &stru_250F24B08;
  if (v5)
    v6 = CFSTR("/ system commissioner");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)privateDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRFabricConnectionRequest fabricID](self, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabricConnectionRequest fabricID](self, "fabricID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("FabricID"), v22);
  v23[0] = v21;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabricConnectionRequest systemCommissionerFabric](self, "systemCommissionerFabric");
  HMFBooleanToString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("SystemCommissionerFabric"), v20);
  v23[1] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabricConnectionRequest activeIPConnectionRequests](self, "activeIPConnectionRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("ActiveIPRequests:"), v7);
  v23[2] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabricConnectionRequest activeThreadConnectionRequests](self, "activeThreadConnectionRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("ActiveThreadRequests:"), v10);
  v23[3] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabricConnectionRequest activeThreadWEDConnectionRequests](self, "activeThreadWEDConnectionRequests");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("ActiveThreadWEDRequests:"), v13);
  v23[4] = v14;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabricConnectionRequest pendingConnectionRequests](self, "pendingConnectionRequests");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("PendingRequests:"), v16);
  v23[5] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  HMMTRFabricConnectionRequest *v4;
  HMMTRFabricConnectionRequest *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HMMTRFabricConnectionRequest *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HMMTRFabricConnectionRequest fabricID](v5, "fabricID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFabricConnectionRequest fabricID](self, "fabricID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
LABEL_5:
    v8 = 0;
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMTRFabricConnectionRequest fabricID](self, "fabricID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (BOOL)systemCommissionerFabric
{
  return self->_systemCommissionerFabric;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (unsigned)fabricIdleTime
{
  return self->_fabricIdleTime;
}

- (void)setFabricIdleTime:(unsigned __int8)a3
{
  self->_fabricIdleTime = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMFTimer)idleTimer
{
  return self->_idleTimer;
}

- (HMMTRAccessoryServerBrowser)browser
{
  return (HMMTRAccessoryServerBrowser *)objc_loadWeakRetained((id *)&self->_browser);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_pendingConnectionRequests, 0);
  objc_storeStrong((id *)&self->_activeThreadWEDConnectionRequests, 0);
  objc_storeStrong((id *)&self->_activeThreadConnectionRequests, 0);
  objc_storeStrong((id *)&self->_activeIPConnectionRequests, 0);
}

void __61__HMMTRFabricConnectionRequest_abortAllOperationsWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "browser");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_operationsCompletedForFabricConnectionRequest:reason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __47__HMMTRFabricConnectionRequest_retryOperations__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v5;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@retryOperations", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = (void *)MEMORY[0x242656984]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 32), "browser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "operationsStartedForFabricConnectionRequest:", *(_QWORD *)(a1 + 32));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "server", (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "triggerEstablishingMatterSubscription");

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_connectPendingConnections");
}

void __49__HMMTRFabricConnectionRequest_suspendOperations__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v5;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@suspendOperations", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = (void *)MEMORY[0x242656984]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v13 = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
  if ((objc_msgSend(*(id *)(a1 + 32), "_hasActiveAccessoryConnections") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "idleTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "suspend");

    objc_msgSend(*(id *)(a1 + 32), "idleTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fire");

  }
}

void __46__HMMTRFabricConnectionRequest_stopOperations__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v5;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@stopOperations", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = (void *)MEMORY[0x242656984]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v12 = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
  objc_msgSend(*(id *)(a1 + 32), "idleTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "suspend");

}

uint64_t __47__HMMTRFabricConnectionRequest_startOperations__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v5;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@startOperations", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = (void *)MEMORY[0x242656984]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v13 = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 32), "browser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "operationsStartedForFabricConnectionRequest:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "setActive:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_connectPendingConnections");
}

void __81__HMMTRFabricConnectionRequest_operationsCompletedForAccessoryConnectionRequest___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "nodeID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Marking operation complete for accessory request: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if ((objc_msgSend(*(id *)(a1 + 32), "_removeFromActiveIPConnections:", *(_QWORD *)(a1 + 40)) & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "_removeFromActiveThreadConnections:", *(_QWORD *)(a1 + 40)) & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "_removeFromActiveThreadWEDConnections:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removeFromPendingConnections:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "idleTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isRunning") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "_hasActiveAccessoryConnections") & 1) != 0)
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "_connectPendingConnections");
    return;
  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "_hasPendingAccessoryConnections");

  if ((v8 & 1) != 0)
    goto LABEL_10;
  v9 = (void *)MEMORY[0x242656984]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v12;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Marking fabric as idle due to all pending accessory lifeTimer expiring", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  v13 = *(void **)(a1 + 32);
  objc_msgSend(v13, "idleTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timerDidFire:", v14);

}

void __62__HMMTRFabricConnectionRequest_connectToAccessoryWhenAllowed___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  char v43;
  unint64_t v44;
  void *v45;
  int v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  const char *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  id v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  id v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  NSObject *v107;
  void *v108;
  void *v109;
  const char *v110;
  int v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint8_t buf[4];
  void *v123;
  __int16 v124;
  unint64_t v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  void *v129;
  __int16 v130;
  void *v131;
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "nodeID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v123 = v5;
    v124 = 2112;
    v125 = (unint64_t)v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@connectToAccessoryWhenAllowed - nodeID = %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v123 = v10;
    v124 = 2112;
    v125 = v11;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 40), "setParentFabricRequest:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 32), "_tryMergeIntoExistingConnection:", *(_QWORD *)(a1 + 40)))
  {
    v12 = (void *)MEMORY[0x242656984]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v123 = v15;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@merged into existing connection", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "active") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
    {
      v32 = (void *)MEMORY[0x242656984]();
      v33 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "nodeID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v123 = v35;
        v124 = 2112;
        v125 = (unint64_t)v36;
        _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_INFO, "%{public}@Accessory server disappeared, aborting all requests for nodeID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      v23 = *(void **)(a1 + 40);
      v24 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BE3EBB0];
      v26 = 2;
      goto LABEL_21;
    }
    if (objc_msgSend(v16, "isDisabled"))
    {
      v18 = (void *)MEMORY[0x242656984]();
      v19 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "nodeID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v123 = v21;
        v124 = 2112;
        v125 = (unint64_t)v22;
        _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@Accessory server is disabled, aborting all requests for nodeID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v23 = *(void **)(a1 + 40);
      v24 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BE3EBB0];
      v26 = 12;
LABEL_21:
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, v26, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "abortAllPendingOperations:", v37);
LABEL_22:

LABEL_23:
      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "browser");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "server");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isOperationAllowedForAccessoryServer:", v39);

    if ((v40 & 1) == 0)
    {
      v47 = (void *)MEMORY[0x242656984]();
      v48 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
LABEL_32:

        objc_autoreleasePoolPop(v47);
        objc_msgSend(*(id *)(a1 + 32), "_addToPendingConnections:", *(_QWORD *)(a1 + 40));
        goto LABEL_23;
      }
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "nodeID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v123 = v50;
      v124 = 2112;
      v125 = (unint64_t)v51;
      v52 = "%{public}@Operations currently not allowed for this nodeID. Adding accessory connection request for nodeID %"
            "@ to pending queue";
LABEL_31:
      _os_log_impl(&dword_23E95B000, v49, OS_LOG_TYPE_INFO, v52, buf, 0x16u);

      goto LABEL_32;
    }
    objc_msgSend(*(id *)(a1 + 32), "browser");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "threadRadioManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "deviceSupportsThreadService");

    v44 = objc_msgSend(v17, "linkLayerType");
    if (objc_msgSend(v17, "isWEDDevice")
      && (objc_msgSend(v17, "eMACAddress"), v45 = (void *)objc_claimAutoreleasedReturnValue(), v45, v45))
    {
      v46 = 1;
    }
    else
    {
      if (v44 < 3)
        goto LABEL_34;
      if (v44 != 4)
      {
        v56 = (void *)MEMORY[0x242656984]();
        v57 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v123 = v59;
          v124 = 2048;
          v125 = v44;
          v126 = 2112;
          v127 = v60;
          _os_log_impl(&dword_23E95B000, v58, OS_LOG_TYPE_INFO, "%{public}@Unsupported linkLayerType: %ld for request %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v56);
        v23 = *(void **)(a1 + 40);
        v24 = (void *)MEMORY[0x24BDD1540];
        v25 = *MEMORY[0x24BE3EBB0];
        v26 = 5;
        goto LABEL_21;
      }
      v46 = 0;
    }
    v53 = *(void **)(a1 + 32);
    if ((v43 & 1) == 0)
      goto LABEL_43;
    objc_msgSend(v53, "browser");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v54, "connectionRequestSuspended"))
    {

      if ((v46 & 1) == 0)
        goto LABEL_54;
LABEL_62:
      objc_msgSend(*(id *)(a1 + 32), "browser");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "threadRadioManager");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v82, "isThreadNetworkConnected");

      v84 = *(void **)(a1 + 32);
      if (!v83)
      {
        objc_msgSend(v84, "activeThreadConnectionRequests");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v85, "count");

        if (v86)
        {
          v47 = (void *)MEMORY[0x242656984]();
          v48 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            goto LABEL_32;
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "nodeID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v123 = v50;
          v124 = 2112;
          v125 = (unint64_t)v51;
          v52 = "%{public}@Waiting for active thread operations to complete, add to pending queue for nodeID %@";
          goto LABEL_31;
        }
        objc_msgSend(*(id *)(a1 + 32), "activeThreadWEDConnectionRequests");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = objc_msgSend(v98, "count");

        if (v99)
        {
          v100 = (void *)MEMORY[0x242656984]();
          v101 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v102 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "nodeID");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v123 = v103;
            v124 = 2112;
            v125 = (unint64_t)v104;
            _os_log_impl(&dword_23E95B000, v102, OS_LOG_TYPE_INFO, "%{public}@Too many active WED session, add to pending queue for nodeID %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v100);
          objc_msgSend(*(id *)(a1 + 32), "_addToPendingConnections:", *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(a1 + 32), "_updateActiveThreadWEDConnectionsIdleTime:", 1);
          goto LABEL_23;
        }
        objc_msgSend(*(id *)(a1 + 32), "browser");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "threadRadioManager");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = objc_msgSend(v115, "isReadyToEstablishWEDConnection");

        if (v116)
        {
          objc_msgSend(*(id *)(a1 + 32), "_addToActiveThreadWEDConnections:", *(_QWORD *)(a1 + 40));
          goto LABEL_23;
        }
        v105 = (void *)MEMORY[0x242656984]();
        v106 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v107 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "nodeID");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v123 = v108;
          v124 = 2112;
          v125 = (unint64_t)v109;
          v110 = "%{public}@Not ready to establish a WED session, add to pending queue for nodeID %@";
          goto LABEL_78;
        }
        goto LABEL_79;
      }
      goto LABEL_68;
    }
    if (objc_msgSend(v17, "isPaired"))
    {
      v55 = objc_msgSend(v17, "isPairingInProgress");

      if ((v55 & 1) == 0)
      {
        if (v46)
          goto LABEL_62;
LABEL_54:
        objc_msgSend(*(id *)(a1 + 32), "activeThreadWEDConnectionRequests");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "count");

        if (v71)
        {
          v47 = (void *)MEMORY[0x242656984]();
          v48 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            goto LABEL_32;
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "nodeID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v123 = v50;
          v124 = 2112;
          v125 = (unint64_t)v51;
          v52 = "%{public}@Active WED session, add thread request to pending queue for nodeID %@";
          goto LABEL_31;
        }
        objc_msgSend(*(id *)(a1 + 32), "browser");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "threadRadioManager");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v88, "isThreadNetworkConnected");

        if (!v89)
        {
          v105 = (void *)MEMORY[0x242656984]();
          v106 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v107 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "nodeID");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v123 = v108;
            v124 = 2112;
            v125 = (unint64_t)v109;
            v110 = "%{public}@Thread is not connected, add request to pending queue for nodeID %@";
LABEL_78:
            _os_log_impl(&dword_23E95B000, v107, OS_LOG_TYPE_INFO, v110, buf, 0x16u);

          }
LABEL_79:

          objc_autoreleasePoolPop(v105);
          objc_msgSend(*(id *)(a1 + 32), "_addToPendingConnections:", *(_QWORD *)(a1 + 40));
          v111 = objc_msgSend(*(id *)(a1 + 32), "systemCommissionerFabric");
          objc_msgSend(*(id *)(a1 + 32), "browser");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "threadRadioManager");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "fabricID");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          if (v111)
            objc_msgSend(v112, "startThreadRadioForSystemCommissionerFabricID:", v113);
          else
            objc_msgSend(v112, "startThreadRadioForHomeWithFabricID:", v113);

          goto LABEL_22;
        }
        v84 = *(void **)(a1 + 32);
LABEL_68:
        objc_msgSend(v84, "_addToActiveThreadConnections:", *(_QWORD *)(a1 + 40));
        goto LABEL_23;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "browser");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "threadRadioManager");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "isThreadNetworkConnected");

    if (v63)
    {
      v64 = (void *)MEMORY[0x242656984]();
      v65 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "nodeID");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v123 = v67;
        v124 = 2112;
        v125 = (unint64_t)v68;
        v126 = 2112;
        v127 = v69;
        _os_log_impl(&dword_23E95B000, v66, OS_LOG_TYPE_INFO, "%{public}@Accessory connection request for nodeID: %@ (isWED: %@) is for accessory getting paired, handling as normal thread connection since thread is connected", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v64);
      if ((v46 & 1) == 0)
        goto LABEL_54;
      goto LABEL_62;
    }
    if (v46)
    {
      objc_msgSend(*(id *)(a1 + 32), "browser");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "threadRadioManager");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "isReadyToEstablishWEDConnection");

      if (v74)
      {
        v75 = (void *)MEMORY[0x242656984]();
        v76 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "nodeID");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v123 = v78;
          v124 = 2112;
          v125 = (unint64_t)v79;
          v126 = 2112;
          v127 = v80;
          _os_log_impl(&dword_23E95B000, v77, OS_LOG_TYPE_INFO, "%{public}@Accessory connection request for nodeID: %@ (isWED: %@) is for accessory getting paired, handling as normal WED connection since we're ready to establish WED connection", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v75);
        goto LABEL_62;
      }
    }
    v90 = (void *)MEMORY[0x242656984]();
    v91 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "nodeID");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "browser");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "threadRadioManager");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "isThreadNetworkConnected");
      HMFBooleanToString();
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "browser");
      v121 = v90;
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "threadRadioManager");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "isReadyToEstablishWEDConnection");
      HMFBooleanToString();
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v123 = v118;
      v124 = 2112;
      v125 = (unint64_t)v117;
      v126 = 2112;
      v127 = v93;
      v128 = 2112;
      v129 = v94;
      v130 = 2112;
      v131 = v97;
      _os_log_impl(&dword_23E95B000, v92, OS_LOG_TYPE_INFO, "%{public}@Accessory connection request for nodeID: %@ (isWED: %@) is for accessory getting paired, add to active IP list because !isThreadNetworkConnected(%@) and !isReadyToEstablishWEDConnection(%@)", buf, 0x34u);

      v90 = v121;
    }

    objc_autoreleasePoolPop(v90);
LABEL_34:
    v53 = *(void **)(a1 + 32);
LABEL_43:
    objc_msgSend(v53, "_addToActiveIPConnections:", *(_QWORD *)(a1 + 40));
    goto LABEL_23;
  }
  v27 = (void *)MEMORY[0x242656984]();
  v28 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "nodeID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v123 = v30;
    v124 = 2112;
    v125 = (unint64_t)v31;
    _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_INFO, "%{public}@Fabric is not active. Adding accessory connection request for nodeID %@ to pending queue", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
  objc_msgSend(*(id *)(a1 + 32), "_addToPendingConnections:", *(_QWORD *)(a1 + 40));
}

void __70__HMMTRFabricConnectionRequest__removeFromActiveThreadWEDConnections___block_invoke(uint64_t a1, void *a2)
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
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "server");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to disconnect from WED accessory %@, error %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __65__HMMTRFabricConnectionRequest__addToActiveThreadWEDConnections___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HMMTRFabricConnectionRequest__addToActiveThreadWEDConnections___block_invoke_2;
  v7[3] = &unk_250F224F8;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v10 = v4;
  v6 = v3;
  objc_msgSend(v5, "dispatchBlock:", v7);

}

void __65__HMMTRFabricConnectionRequest__addToActiveThreadWEDConnections___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x242656984]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "server");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "server");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "eMACAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v14 = 138544130;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to establish WED connection to accessory %@ with emac %@, error %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 48), "abortAllPendingOperations:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "browser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_operationsCompletedForFabricConnectionRequest:reason:", v11, v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setWedConnectionPending:", 0);
    objc_msgSend(*(id *)(a1 + 48), "server");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "triggerEstablishingMatterSubscription");

    objc_msgSend(*(id *)(a1 + 48), "executeAllPendingOperations");
    objc_msgSend(*(id *)(a1 + 40), "_kickIdleTimer");
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t64 != -1)
    dispatch_once(&logCategory__hmf_once_t64, &__block_literal_global_4545);
  return (id)logCategory__hmf_once_v65;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __43__HMMTRFabricConnectionRequest_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v65;
  logCategory__hmf_once_v65 = v0;

}

@end
