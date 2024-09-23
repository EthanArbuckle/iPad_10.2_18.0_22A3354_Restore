@implementation HMDXPCRequestTracker

- (HMDXPCRequestTracker)initWithQueue:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  HMDXPCRequestTracker *v7;

  v4 = (objc_class *)MEMORY[0x24BE3F298];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithTimeInterval:options:", 4, 300.0);
  v7 = -[HMDXPCRequestTracker initWithQueue:watchdogTimer:](self, "initWithQueue:watchdogTimer:", v5, v6);

  return v7;
}

- (HMDXPCRequestTracker)initWithQueue:(id)a3 watchdogTimer:(id)a4
{
  id v7;
  id v8;
  HMDXPCRequestTracker *v9;
  HMDXPCRequestTracker *v10;
  NSString *clientName;
  uint64_t v12;
  NSMutableDictionary *pendingRequests;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDXPCRequestTracker;
  v9 = -[HMDXPCRequestTracker init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    clientName = v10->_clientName;
    v10->_clientName = (NSString *)CFSTR("<unknown>");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    pendingRequests = v10->_pendingRequests;
    v10->_pendingRequests = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v10->_watchdogTimer, a4);
    -[HMFTimer setDelegate:](v10->_watchdogTimer, "setDelegate:", v10);
    -[HMFTimer setDelegateQueue:](v10->_watchdogTimer, "setDelegateQueue:", v7);
  }

  return v10;
}

- (void)addRequestWithIdentifier:(id)a3 name:(id)a4 qualityOfService:(int64_t)a5 isTimeoutDisabled:(BOOL)a6 responseHandler:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDXPCRequestTracker *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDXPCRequestTracker *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  HMDXPCRequest *v29;
  void *v30;
  uint64_t v32;
  os_unfair_lock_t lock;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v8 = a6;
  v40 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDXPCRequestTracker pendingRequests](self, "pendingRequests");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Starting watchdog timer", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    -[HMDXPCRequestTracker watchdogTimer](v17, "watchdogTimer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resume");

  }
  v21 = (void *)MEMORY[0x24BDBCE60];
  -[HMDXPCRequestTracker watchdogTimer](self, "watchdogTimer", a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeInterval");
  objc_msgSend(v21, "dateWithTimeIntervalSinceNow:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v27;
      v36 = 2112;
      v37 = v12;
      v38 = 2112;
      v39 = v11;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Disabling timeout for message %@(%@)", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v28 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v28;
  }
  v29 = -[HMDXPCRequest initWithName:qualityOfService:timeoutDate:responseHandler:]([HMDXPCRequest alloc], "initWithName:qualityOfService:timeoutDate:responseHandler:", v12, v32, v23, v13);
  -[HMDXPCRequestTracker pendingRequests](self, "pendingRequests");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v11);

  os_unfair_lock_unlock(lock);
}

- (void)respondToRequestWithIdentifier:(id)a3 withPayload:(id)a4 error:(id)a5
{
  NSString *v8;
  id v9;
  id v10;
  os_unfair_lock_s *p_lock;
  void *v12;
  void *v13;
  void *v14;
  HMDXPCRequestTracker *v15;
  NSObject *v16;
  void *v17;
  NSString *v18;
  void *v19;
  HMDXPCRequestTracker *v20;
  NSObject *v21;
  id v22;
  NSString *v23;
  NSString *clientName;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  HMDXPCRequestTracker *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  NSString *v37;
  __int16 v38;
  NSString *v39;
  __int16 v40;
  NSString *v41;
  __int16 v42;
  __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = (NSString *)a3;
  v9 = a4;
  v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDXPCRequestTracker pendingRequests](self, "pendingRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDXPCRequestTracker _respondToRequest:withPayload:error:](self, "_respondToRequest:withPayload:error:", v13, v9, v10);
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" with error %@"), v10);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = &stru_24E79DB48;
    }
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      clientName = v20->_clientName;
      *(_DWORD *)buf = 138544386;
      v35 = v22;
      v36 = 2114;
      v37 = v23;
      v38 = 2114;
      v39 = v8;
      v40 = 2114;
      v41 = clientName;
      v42 = 2114;
      v43 = v33;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Answering incoming message %{public}@ (%{public}@) from client '%{public}@' that expects a response%{public}@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDXPCRequestTracker pendingRequests](v20, "pendingRequests");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", 0, v8);

    -[HMDXPCRequestTracker pendingRequests](v20, "pendingRequests");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count") == 0;

    if (v27)
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v20;
      HMFGetOSLogHandle();
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v31;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Suspending timer after last request was removed", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v28);
      -[HMDXPCRequestTracker watchdogTimer](v29, "watchdogTimer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "suspend");

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v15->_clientName;
      *(_DWORD *)buf = 138543874;
      v35 = v17;
      v36 = 2114;
      v37 = v8;
      v38 = 2114;
      v39 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to find request with identifier %{public}@ for client '%{public}@' to remove from request tracker", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSSet)requestIdentifiers
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x24BDBCF20];
  -[HMDXPCRequestTracker pendingRequests](self, "pendingRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v7;
}

- (NSString)clientName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_clientName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setClientName:(id)a3
{
  NSString *v4;
  NSString *clientName;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  clientName = self->_clientName;
  self->_clientName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)cancelAllRequests
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HMDXPCRequestTracker *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSString *clientName;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HMDXPCRequestTracker *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  NSString *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v22 = self;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Canceling all pending requests", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  os_unfair_lock_lock_with_options();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HMDXPCRequestTracker pendingRequests](v22, "pendingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v7)
  {
    v21 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v6);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[HMDXPCRequestTracker pendingRequests](v22, "pendingRequests");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = (void *)MEMORY[0x227676638]();
          v13 = v22;
          HMFGetOSLogHandle();
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "name");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            clientName = v13->_clientName;
            *(_DWORD *)buf = 138544130;
            v28 = v15;
            v29 = 2112;
            v30 = v16;
            v31 = 2112;
            v32 = v9;
            v33 = 2112;
            v34 = clientName;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Canceling pending request %@ (%@) from client '%@' that expects a response", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v12);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDXPCRequestTracker _respondToRequest:withPayload:error:](v13, "_respondToRequest:withPayload:error:", v11, 0, v18);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v7);
  }

  -[HMDXPCRequestTracker pendingRequests](v22, "pendingRequests");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeAllObjects");

  -[HMDXPCRequestTracker watchdogTimer](v22, "watchdogTimer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "suspend");

  os_unfair_lock_unlock(&v22->_lock);
}

- (void)_respondToRequest:(id)a3 withPayload:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "responseHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  objc_msgSend(v10, "qualityOfService");
  LODWORD(v11) = HMFQOSClassFromQualityOfService();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__HMDXPCRequestTracker__respondToRequest_withPayload_error___block_invoke;
  block[3] = &unk_24E79B440;
  v20 = v8;
  v21 = v12;
  v19 = v9;
  v13 = v8;
  v14 = v9;
  v15 = v12;
  v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)v11, 0, block);
  -[HMDXPCRequestTracker queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v17, v16);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  HMDXPCRequestTracker *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  HMDXPCRequestTracker *v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSString *clientName;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDXPCRequestTracker *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  os_unfair_lock_t lock;
  id v35;
  id obj;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  NSString *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  -[HMDXPCRequestTracker watchdogTimer](self, "watchdogTimer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v35;
  if (v4 == v35)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[HMDXPCRequestTracker pendingRequests](self, "pendingRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v8)
    {
      v37 = *(_QWORD *)v40;
      obj = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v40 != v37)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          -[HMDXPCRequestTracker pendingRequests](self, "pendingRequests", lock);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)MEMORY[0x227676638]();
          v14 = self;
          HMFGetOSLogHandle();
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v16 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v44 = v16;
            v45 = 2112;
            v46 = v17;
            v47 = 2112;
            v48 = v10;
            _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Checking if request %@ (%@) timed out after watchdog timer fired", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v13);
          objc_msgSend(v12, "timeoutDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "compare:", v38) == -1;

          if (v19)
          {
            v20 = (void *)MEMORY[0x227676638]();
            v21 = v14;
            HMFGetOSLogHandle();
            v22 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v23 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "name");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              clientName = v21->_clientName;
              *(_DWORD *)buf = 138544130;
              v44 = v23;
              v45 = 2112;
              v46 = v24;
              v47 = 2112;
              v48 = v10;
              v49 = 2112;
              v50 = clientName;
              _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Reaping timed out pending request %@ (%@) from client '%@' that expects a response", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v20);
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDXPCRequestTracker _respondToRequest:withPayload:error:](v21, "_respondToRequest:withPayload:error:", v12, 0, v26);

            -[HMDXPCRequestTracker pendingRequests](v21, "pendingRequests");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setObject:forKeyedSubscript:", 0, v10);

            -[HMDXPCRequestTracker pendingRequests](v21, "pendingRequests");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v27) = objc_msgSend(v28, "count") == 0;

            if ((_DWORD)v27)
            {
              v29 = (void *)MEMORY[0x227676638]();
              v30 = v21;
              HMFGetOSLogHandle();
              v31 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v44 = v32;
                _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Suspending watchdog timer after handling timeout", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v29);
              -[HMDXPCRequestTracker watchdogTimer](v30, "watchdogTimer");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "suspend");

            }
          }

        }
        v7 = obj;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v8);
    }

    os_unfair_lock_unlock(lock);
    v5 = v35;
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

- (HMFTimer)watchdogTimer
{
  return self->_watchdogTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

uint64_t __60__HMDXPCRequestTracker__respondToRequest_withPayload_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17_244396 != -1)
    dispatch_once(&logCategory__hmf_once_t17_244396, &__block_literal_global_244397);
  return (id)logCategory__hmf_once_v18_244398;
}

void __35__HMDXPCRequestTracker_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v18_244398;
  logCategory__hmf_once_v18_244398 = v0;

}

@end
