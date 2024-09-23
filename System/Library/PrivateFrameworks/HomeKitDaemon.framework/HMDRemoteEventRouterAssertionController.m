@implementation HMDRemoteEventRouterAssertionController

- (HMDRemoteEventRouterAssertionController)initWithQueue:(id)a3 notificationCenter:(id)a4
{
  id v7;
  id v8;
  HMDRemoteEventRouterAssertionController *v9;
  HMDRemoteEventRouterAssertionController *v10;
  uint64_t v11;
  NSHashTable *clients;
  uint64_t v13;
  NSHashTable *daemonAssertions;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDRemoteEventRouterAssertionController;
  v9 = -[HMDRemoteEventRouterAssertionController init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_notificationCenter, a4);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    clients = v10->_clients;
    v10->_clients = (NSHashTable *)v11;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    daemonAssertions = v10->_daemonAssertions;
    v10->_daemonAssertions = (NSHashTable *)v13;

    v10->_isPluggedIn = IOPSDrawingUnlimitedPower();
    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)handleProcessStateChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__HMDRemoteEventRouterAssertionController_handleProcessStateChange___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)handleConnectionActiveStateChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__HMDRemoteEventRouterAssertionController_handleConnectionActiveStateChange___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)configure
{
  HMDEventRouterTimerProvider *v3;
  HMDRemoteEventRouterProcessStateChangeAssertion *v4;
  HMETimerProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  NSObject *queue;
  SEL v18;
  SEL v19;
  OS_dispatch_queue *v20;
  _QWORD handler[5];
  int out_token;

  v3 = objc_alloc_init(HMDEventRouterTimerProvider);
  if (self)
    objc_storeStrong((id *)&self->_timerProvider, v3);

  v4 = [HMDRemoteEventRouterProcessStateChangeAssertion alloc];
  if (self)
  {
    v20 = self->_queue;
    v5 = self->_timerProvider;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 300.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD5C70]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 30.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD6778]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 300.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD5C08]);

    if ((isInternalBuild() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 300.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD5C00]);

    }
    else
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BDD5C00]);
    }
    if ((isInternalBuild() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 300.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD5E00]);

    }
    else
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BDD5E00]);
    }
    if ((isInternalBuild() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 300.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD6F80]);

    }
    else
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BDD6F80]);
    }
    v13 = (void *)objc_msgSend(v6, "copy");

    v14 = -[HMDRemoteEventRouterProcessStateChangeAssertion initWithQueue:timerProvider:applicationsAndIntervals:dataSource:](v4, "initWithQueue:timerProvider:applicationsAndIntervals:dataSource:", v20, v5, v13, self);
  }
  else
  {
    v13 = 0;
    v20 = 0;
    v5 = 0;
    v14 = -[HMDRemoteEventRouterProcessStateChangeAssertion initWithQueue:timerProvider:applicationsAndIntervals:dataSource:](v4, "initWithQueue:timerProvider:applicationsAndIntervals:dataSource:", 0, 0, 0, 0);
  }
  v15 = (void *)v14;

  if (self)
  {
    objc_setProperty_atomic(self, v16, v15, 48);

    out_token = 0;
    queue = self->_queue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __68__HMDRemoteEventRouterAssertionController__registerForNotifications__block_invoke;
    handler[3] = &unk_24E7907C0;
    handler[4] = self;
    notify_register_dispatch("kIOPSNotifyPowerSource", &out_token, queue, handler);
    objc_msgSend(objc_getProperty(self, v18, 24, 1), "addObserver:selector:name:object:", self, sel_handleProcessStateChange_, CFSTR("HMDProcessInfoStateDidChangeNotification"), 0);
    objc_msgSend(objc_getProperty(self, v19, 24, 1), "addObserver:selector:name:object:", self, sel_handleConnectionActiveStateChange_, CFSTR("HMDHomeManagerConnectionActiveStateUpdatedNotification"), 0);
  }
  else
  {

  }
}

- (void)registerClient:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__HMDRemoteEventRouterAssertionController_registerClient___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)takeEventRouterAssertion
{
  HMDRemoteEventRouterAssertion *v3;
  void *v4;
  HMDRemoteEventRouterAssertionController *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  id Property;
  id v10;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  HMDRemoteEventRouterAssertion *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = -[HMDRemoteEventRouterAssertion initWithAssertionController:]([HMDRemoteEventRouterAssertion alloc], "initWithAssertionController:", self);
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v7;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Did take event router active assertion: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  os_unfair_lock_lock_with_options();
  if (v5)
    Property = objc_getProperty(v5, v8, 56, 1);
  else
    Property = 0;
  v10 = Property;
  objc_msgSend(v10, "addObject:", v3);

  os_unfair_lock_unlock(&v5->_lock);
  if (v5)
    queue = v5->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HMDRemoteEventRouterAssertionController_takeEventRouterAssertion__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v5;
  dispatch_async(queue, block);
  return v3;
}

- (void)assertionDidBecomeInactive:(id)a3
{
  id v4;
  void *v5;
  HMDRemoteEventRouterAssertionController *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  id Property;
  id v11;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Event router active assertion became inactive: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  if (v6)
    Property = objc_getProperty(v6, v9, 56, 1);
  else
    Property = 0;
  v11 = Property;
  objc_msgSend(v11, "removeObject:", v4);

  os_unfair_lock_unlock(&v6->_lock);
  if (v6)
    queue = v6->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HMDRemoteEventRouterAssertionController_assertionDidBecomeInactive___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v6;
  dispatch_async(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonAssertions, 0);
  objc_storeStrong((id *)&self->_appStateChangeAssertion, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __70__HMDRemoteEventRouterAssertionController_assertionDidBecomeInactive___block_invoke(uint64_t a1)
{
  -[HMDRemoteEventRouterAssertionController _notifyDidChangeHasForegroundClient](*(_QWORD *)(a1 + 32));
}

- (void)_notifyDidChangeHasForegroundClient
{
  uint64_t active;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    active = -[HMDRemoteEventRouterAssertionController hasActiveClients]((os_unfair_lock_s *)a1);
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "didChangeHasForegroundClient:", active, (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (uint64_t)hasActiveClients
{
  os_unfair_lock_s *v2;
  SEL v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v2 = a1 + 2;
  os_unfair_lock_lock_with_options();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = objc_getProperty(a1, v3, 56, 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isActive", (_QWORD)v9) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  os_unfair_lock_unlock(v2);
  return v5;
}

void __67__HMDRemoteEventRouterAssertionController_takeEventRouterAssertion__block_invoke(uint64_t a1)
{
  -[HMDRemoteEventRouterAssertionController _notifyDidChangeHasForegroundClient](*(_QWORD *)(a1 + 32));
}

uint64_t __58__HMDRemoteEventRouterAssertionController_registerClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 32);
  else
    v3 = 0;
  result = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(void **)(v5 + 32);
    else
      v6 = 0;
    objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "didChangeHasForegroundClient:", -[HMDRemoteEventRouterAssertionController hasActiveClients](*(os_unfair_lock_s **)(a1 + 32)));
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(unsigned __int8 *)(v7 + 12) != 0;
    else
      v8 = 0;
    return objc_msgSend(*(id *)(a1 + 40), "didChangeFetchAvailableCondition:", v8);
  }
  return result;
}

void __68__HMDRemoteEventRouterAssertionController__registerForNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = IOPSDrawingUnlimitedPower();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = v2;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 16));
    if ((*(_BYTE *)(v3 + 12) != 0) != (_DWORD)v4)
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = (id *)(id)v3;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v8;
        v21 = 2114;
        v22 = v9;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Plugged in state changed to %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      *(_BYTE *)(v3 + 12) = v4;
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v10 = v6[4];
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, buf, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "didChangeFetchAvailableCondition:", v4, (_QWORD)v15);
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, buf, 16);
        }
        while (v12);
      }

    }
  }
}

void __77__HMDRemoteEventRouterAssertionController_handleConnectionActiveStateChange___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  SEL v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = v2;
  if (v1)
  {
    objc_msgSend(v2, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    if (v6)
    {
      if (objc_msgSend(v6, "isAdaptive"))
      {
        objc_msgSend(v6, "processInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "shouldMonitor");

        if ((v8 & 1) == 0)
        {
          v9 = (void *)MEMORY[0x227676638]();
          v10 = v1;
          HMFGetOSLogHandle();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = 138543618;
            v21 = v12;
            v22 = 2112;
            v23 = v6;
            _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[HMDRemoteEventRouterAssertionController] Received notification that connection active state changed: %@", (uint8_t *)&v20, 0x16u);

          }
          objc_autoreleasePoolPop(v9);
          objc_msgSend(v6, "sendPolicyParameters");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;

          v16 = objc_msgSend(v15, "isActive");
          v18 = objc_getProperty(v10, v17, 48, 1);
          objc_msgSend(v6, "applicationBundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "foregroundStateChangedWithBundleIdentifier:applicationState:", v19, v16 ^ 1u);

        }
      }
    }

  }
}

void __68__HMDRemoteEventRouterAssertionController_handleProcessStateChange___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  SEL v11;
  id v12;
  id v13;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v2 = *(id *)(a1 + 40);
    objc_msgSend(v2, "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    objc_msgSend(v2, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    v12 = objc_getProperty(v1, v11, 48, 1);
    objc_msgSend(v5, "bundleIdentifier");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "foregroundStateChangedWithBundleIdentifier:applicationState:", v13, v10);
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_197693 != -1)
    dispatch_once(&logCategory__hmf_once_t9_197693, &__block_literal_global_197694);
  return (id)logCategory__hmf_once_v10_197695;
}

void __54__HMDRemoteEventRouterAssertionController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_197695;
  logCategory__hmf_once_v10_197695 = v0;

}

@end
