@implementation HMDResidentStatusChannelManager

- (HMDResidentStatusChannelManager)initWithResidentStatusChannel:(id)a3 notificationCenter:(id)a4 queue:(id)a5 timerProvider:(id)a6 idsServerBag:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDResidentStatusChannelManager *v17;
  HMDResidentStatusChannelManager *v18;
  uint64_t v19;
  NSMutableSet *clientIdentifiers;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDResidentStatusChannelManager;
  v17 = -[HMDResidentStatusChannelManager init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_residentStatusChannel, a3);
    objc_storeStrong((id *)&v18->_notificationCenter, a4);
    objc_storeStrong((id *)&v18->_queue, a5);
    objc_storeStrong((id *)&v18->_timerProvider, a6);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    clientIdentifiers = v18->_clientIdentifiers;
    v18->_clientIdentifiers = (NSMutableSet *)v19;

    objc_storeWeak((id *)&v18->_idsServerBag, v16);
  }

  return v18;
}

- (HMDResidentStatusChannelManager)initWithResidentStatusChannel:(id)a3 queue:(id)a4 idsServerBag:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HMDResidentStatusChannelManager *v14;

  v8 = (void *)MEMORY[0x24BDD16D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v14 = -[HMDResidentStatusChannelManager initWithResidentStatusChannel:notificationCenter:queue:timerProvider:idsServerBag:](self, "initWithResidentStatusChannel:notificationCenter:queue:timerProvider:idsServerBag:", v11, v12, v10, v13, v9);

  return v14;
}

- (void)configure
{
  void *v3;
  void *v4;
  id v5;

  -[HMDResidentStatusChannelManager notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleProcessInfoStateChanged_, CFSTR("HMDProcessInfoStateDidChangeNotification"), 0);

  if (isInternalBuild())
  {
    -[HMDResidentStatusChannelManager notificationCenter](self, "notificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleProcessAdded_, CFSTR("HMDProcessMonitorProcessAddedNotification"), 0);

    -[HMDResidentStatusChannelManager notificationCenter](self, "notificationCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleProcessRemoved_, CFSTR("HMDProcessMonitorProcessRemovedNotification"), 0);

  }
}

- (void)addClientWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDResidentStatusChannelManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMDResidentStatusChannelManager_addClientWithIdentifier___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeClientWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDResidentStatusChannelManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HMDResidentStatusChannelManager_removeClientWithIdentifier___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleProcessInfoStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentStatusChannelManager *v9;

  v4 = a3;
  -[HMDResidentStatusChannelManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HMDResidentStatusChannelManager_handleProcessInfoStateChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleProcessAdded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentStatusChannelManager *v9;

  v4 = a3;
  -[HMDResidentStatusChannelManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HMDResidentStatusChannelManager_handleProcessAdded___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleProcessRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentStatusChannelManager *v9;

  v4 = a3;
  -[HMDResidentStatusChannelManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HMDResidentStatusChannelManager_handleProcessRemoved___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSMutableSet)clientIdentifiers
{
  NSObject *v3;

  -[HMDResidentStatusChannelManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_clientIdentifiers;
}

- (void)_handleForegroundStateChangedForBundleIdentifier:(id)a3 applicationState:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  HMDResidentStatusChannelManager *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[HMDResidentStatusChannelManager _residentStatusChannelNeededForBundleIdentifier:applicationState:](self, "_residentStatusChannelNeededForBundleIdentifier:applicationState:", v6, a4))
  {
    -[HMDResidentStatusChannelManager addClientWithIdentifier:](self, "addClientWithIdentifier:", v6);
  }
  else
  {
    -[HMDResidentStatusChannelManager clientIdentifiers](self, "clientIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v6);

    if (v8)
    {
      -[HMDResidentStatusChannelManager removeClientWithIdentifier:](self, "removeClientWithIdentifier:", v6);
    }
    else
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543874;
        v14 = v12;
        v15 = 2160;
        v16 = 1752392040;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@No changes to resident status channel clients for '%{mask.hash}@'", (uint8_t *)&v13, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
    }
  }

}

- (BOOL)_residentStatusChannelNeededForBundleIdentifier:(id)a3 applicationState:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  _QWORD v13[2];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a4 | 2) == 2)
  {
    v6 = *MEMORY[0x24BDD5C70];
    v14[0] = *MEMORY[0x24BDD5C08];
    v14[1] = v6;
    v14[2] = *MEMORY[0x24BDD6778];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (isInternalBuild())
    {
      v8 = *MEMORY[0x24BDD63E8];
      v13[0] = *MEMORY[0x24BDD5E00];
      v13[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    v11 = objc_msgSend(v7, "containsObject:", v5);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_evaluateChannelConnectionStateWithCurrentClientIdentifierCount:(unint64_t)a3 previousClientIdentifierCount:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  HMDResidentStatusChannelManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentStatusChannelManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentStatusChannelManager clientIdentifiers](v9, "clientIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v11;
    v16 = 2048;
    v17 = a3;
    v18 = 2048;
    v19 = a4;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Evaluating channel connection state (currentCount: %lu previousCount: %lu, clientIdentifiers: %@)", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if ((a3 != 0) != (a4 != 0))
  {
    if (-[HMDResidentStatusChannelManager _shouldChannelBeRunning](v9, "_shouldChannelBeRunning"))
    {
      -[HMDResidentStatusChannelManager _stopUnsubscribeFromChannelDebounceTimer](v9, "_stopUnsubscribeFromChannelDebounceTimer");
      -[HMDResidentStatusChannelManager residentStatusChannel](v9, "residentStatusChannel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "start");

    }
    else
    {
      -[HMDResidentStatusChannelManager _startUnsubscribeFromChannelDebounceTimer](v9, "_startUnsubscribeFromChannelDebounceTimer");
    }
  }
}

- (BOOL)_shouldChannelBeRunning
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  HMDResidentStatusChannelManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentStatusChannelManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDResidentStatusChannelManager clientIdentifiers](self, "clientIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentStatusChannelManager clientIdentifiers](v7, "clientIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Evaluated shouldChannelBeRunning: %@ (clientIdentifiers: %@)", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  return v5 != 0;
}

- (void)_startUnsubscribeFromChannelDebounceTimer
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  HMDResidentStatusChannelManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  OS_dispatch_queue *queue;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentStatusChannelManager unsubscribeFromChannelDebounceTimer](self, "unsubscribeFromChannelDebounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HMDResidentStatusChannelManager idsServerBag](self, "idsServerBag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusKitUnsubscribeFromChannelDebounceTimeSec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_msgSend(v5, "doubleValue");
      v8 = v7;
    }
    else
    {
      v8 = 300.0;
    }
    v9 = (void *)MEMORY[0x227676638](v6);
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v12;
      v21 = 2048;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting unsubscribe from channel debounce timer with time set to %f", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDResidentStatusChannelManager timerProvider](v10, "timerProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timerWithTimeInterval:options:", 0, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentStatusChannelManager setUnsubscribeFromChannelDebounceTimer:](v10, "setUnsubscribeFromChannelDebounceTimer:", v14);

    -[HMDResidentStatusChannelManager unsubscribeFromChannelDebounceTimer](v10, "unsubscribeFromChannelDebounceTimer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v10);

    queue = v10->_queue;
    -[HMDResidentStatusChannelManager unsubscribeFromChannelDebounceTimer](v10, "unsubscribeFromChannelDebounceTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegateQueue:", queue);

    -[HMDResidentStatusChannelManager unsubscribeFromChannelDebounceTimer](v10, "unsubscribeFromChannelDebounceTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resume");

  }
}

- (void)_stopUnsubscribeFromChannelDebounceTimer
{
  void *v3;
  void *v4;
  HMDResidentStatusChannelManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentStatusChannelManager unsubscribeFromChannelDebounceTimer](self, "unsubscribeFromChannelDebounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping unsubscribe from channel debounce timer", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDResidentStatusChannelManager unsubscribeFromChannelDebounceTimer](v5, "unsubscribeFromChannelDebounceTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "suspend");

    -[HMDResidentStatusChannelManager setUnsubscribeFromChannelDebounceTimer:](v5, "setUnsubscribeFromChannelDebounceTimer:", 0);
  }
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;

  v4 = a3;
  -[HMDResidentStatusChannelManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDResidentStatusChannelManager unsubscribeFromChannelDebounceTimer](self, "unsubscribeFromChannelDebounceTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDResidentStatusChannelManager _stopUnsubscribeFromChannelDebounceTimer](self, "_stopUnsubscribeFromChannelDebounceTimer");
    if (!-[HMDResidentStatusChannelManager _shouldChannelBeRunning](self, "_shouldChannelBeRunning"))
    {
      -[HMDResidentStatusChannelManager residentStatusChannel](self, "residentStatusChannel");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stop");

    }
  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDResidentStatusChannelManager residentStatusChannel](self, "residentStatusChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMDResidentStatusChannel)residentStatusChannel
{
  return self->_residentStatusChannel;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMDTimerProvider)timerProvider
{
  return self->_timerProvider;
}

- (HMFTimer)unsubscribeFromChannelDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUnsubscribeFromChannelDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (HMDIDSServerBag)idsServerBag
{
  return (HMDIDSServerBag *)objc_loadWeakRetained((id *)&self->_idsServerBag);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_idsServerBag);
  objc_storeStrong((id *)&self->_unsubscribeFromChannelDebounceTimer, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_residentStatusChannel, 0);
  objc_storeStrong((id *)&self->_clientIdentifiers, 0);
}

void __56__HMDResidentStatusChannelManager_handleProcessRemoved___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("processInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      if ((objc_msgSend(v5, "shouldMonitor") & 1) == 0)
      {
        v7 = (void *)MEMORY[0x227676638]();
        v8 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543618;
          v22 = v10;
          v23 = 2112;
          v24 = v5;
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Handling process info removed notification: %@", (uint8_t *)&v21, 0x16u);

        }
        objc_autoreleasePoolPop(v7);
        objc_msgSend(*(id *)(a1 + 40), "_handleForegroundStateChangedForBundleIdentifier:applicationState:", v6, 1);
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 32);
        v21 = 138543618;
        v22 = v19;
        v23 = 2112;
        v24 = v20;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing process info application bundle identifier: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 32);
      v21 = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Bad process removed notification object: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

void __54__HMDResidentStatusChannelManager_handleProcessAdded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("processInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      if ((objc_msgSend(v5, "shouldMonitor") & 1) == 0)
      {
        v7 = (void *)MEMORY[0x227676638]();
        v8 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543618;
          v22 = v10;
          v23 = 2112;
          v24 = v5;
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Handling process info added notification: %@", (uint8_t *)&v21, 0x16u);

        }
        objc_autoreleasePoolPop(v7);
        objc_msgSend(*(id *)(a1 + 40), "_handleForegroundStateChangedForBundleIdentifier:applicationState:", v6, 0);
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 32);
        v21 = 138543618;
        v22 = v19;
        v23 = 2112;
        v24 = v20;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing process info application bundle identifier: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 32);
      v21 = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Bad process added notification object: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

void __65__HMDResidentStatusChannelManager_handleProcessInfoStateChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v11;
        v21 = 2112;
        v22 = v4;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Handling process info notification: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(*(id *)(a1 + 40), "_handleForegroundStateChangedForBundleIdentifier:applicationState:", v5, objc_msgSend(v4, "state"));
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 32);
        v19 = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v18;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Missing process info application bundle identifier: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 32);
      v19 = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Bad process info notification object: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

uint64_t __62__HMDResidentStatusChannelManager_removeClientWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "clientIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v13 = 138543618;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing client with identifier: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "clientIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "clientIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  return objc_msgSend(*(id *)(a1 + 32), "_evaluateChannelConnectionStateWithCurrentClientIdentifierCount:previousClientIdentifierCount:", v11, v3);
}

uint64_t __59__HMDResidentStatusChannelManager_addClientWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "clientIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v13 = 138543618;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Adding client with identifier: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "clientIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "clientIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  return objc_msgSend(*(id *)(a1 + 32), "_evaluateChannelConnectionStateWithCurrentClientIdentifierCount:previousClientIdentifierCount:", v11, v3);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_171605 != -1)
    dispatch_once(&logCategory__hmf_once_t19_171605, &__block_literal_global_171606);
  return (id)logCategory__hmf_once_v20_171607;
}

void __46__HMDResidentStatusChannelManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_171607;
  logCategory__hmf_once_v20_171607 = v0;

}

@end
