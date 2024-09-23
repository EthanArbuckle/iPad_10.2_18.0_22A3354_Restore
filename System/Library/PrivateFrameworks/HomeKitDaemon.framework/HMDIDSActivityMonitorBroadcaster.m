@implementation HMDIDSActivityMonitorBroadcaster

- (HMDIDSActivityMonitorBroadcaster)initWithActivityMonitor:(id)a3 timer:(id)a4 xpcActivityInterface:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDIDSActivityMonitorBroadcaster *v12;
  HMDIDSActivityMonitorBroadcaster *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDIDSActivityMonitorBroadcaster;
  v12 = -[HMDIDSActivityMonitorBroadcaster init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activityMonitor, a3);
    objc_storeStrong((id *)&v13->_debounceTimer, a4);
    -[HMFTimer setDelegate:](v13->_debounceTimer, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_xpcActivityInterface, a5);
    v13->_isBroadcasting = 0;
  }

  return v13;
}

- (HMDIDSActivityMonitorBroadcaster)initWithActivityMonitor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  HMDXPCActivityInterface *v12;
  HMDIDSActivityMonitorBroadcaster *v13;

  v4 = (void *)MEMORY[0x24BE3F248];
  v5 = a3;
  objc_msgSend(v4, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferenceForKey:", CFSTR("activityMonitorBroadcastDebounceDelay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, v10);
  v12 = objc_alloc_init(HMDXPCActivityInterface);
  v13 = -[HMDIDSActivityMonitorBroadcaster initWithActivityMonitor:timer:xpcActivityInterface:](self, "initWithActivityMonitor:timer:xpcActivityInterface:", v5, v11, v12);

  return v13;
}

- (void)configureWithQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDIDSActivityMonitorBroadcaster *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_9:
    _HMFPreconditionFailure();
  }
  v5 = v4;
  -[HMDIDSActivityMonitorBroadcaster queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_9;
  -[HMFTimer setDelegateQueue:](self->_debounceTimer, "setDelegateQueue:", v5);
  -[HMDIDSActivityMonitorBroadcaster setQueue:](self, "setQueue:", v5);
  -[HMDIDSActivityMonitorBroadcaster dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Queue and data source set, starting debounce timer", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMFTimer resume](self->_debounceTimer, "resume");
  }

}

- (void)configureWithDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDIDSActivityMonitorBroadcaster *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_9:
    _HMFPreconditionFailure();
  }
  v5 = v4;
  -[HMDIDSActivityMonitorBroadcaster dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_9;
  -[HMDIDSActivityMonitorBroadcaster setDataSource:](self, "setDataSource:", v5);
  objc_msgSend(v5, "setDelegate:", self);
  -[HMDIDSActivityMonitorBroadcaster queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Queue and data source set, starting debounce timer", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMFTimer resume](v9->_debounceTimer, "resume");
  }

}

- (void)_registerForXPCPoll
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[HMDIDSActivityMonitorBroadcaster xpcActivityInterface](self, "xpcActivityInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDIDSActivityMonitorBroadcaster criteria](HMDIDSActivityMonitorBroadcaster, "criteria");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__HMDIDSActivityMonitorBroadcaster__registerForXPCPoll__block_invoke;
  v5[3] = &unk_24E78E680;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "registerXPCActivityWithActivityIdentifier:criteria:activityBlock:", CFSTR("com.apple.homed.idsBroadcaster"), v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_refreshBroadcastSubscription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HMDIDSActivityMonitorBroadcaster *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDIDSActivityMonitorBroadcaster dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BE4F940];
    -[HMDIDSActivityMonitorBroadcaster queue](self, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __65__HMDIDSActivityMonitorBroadcaster__refreshBroadcastSubscription__block_invoke;
    v13[3] = &unk_24E792720;
    v13[4] = self;
    objc_msgSend(v6, "pushTokensForDevicesObservingSubjectDevice:subActivity:queue:completionHandler:", v5, v7, v8, v13);

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Current Device not yet determined, deferring IDS Activty broadcast", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDIDSActivityMonitorBroadcaster *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDIDSActivityMonitorBroadcaster queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Debounce timer fired, rebuilding observer list", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDIDSActivityMonitorBroadcaster _refreshBroadcastSubscription](v7, "_refreshBroadcastSubscription");

}

- (void)dataSourceDidUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  HMDIDSActivityMonitorBroadcaster *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDIDSActivityMonitorBroadcaster dataSource](self, "dataSource");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[HMDIDSActivityMonitorBroadcaster queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Data source updated, resuming debounce timer", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      -[HMFTimer resume](v9->_debounceTimer, "resume");
    }
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDIDSActivityMonitorBroadcaster activityMonitor](self, "activityMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDIDSActivityMonitor)activityMonitor
{
  return (HMDIDSActivityMonitor *)objc_getProperty(self, a2, 24, 1);
}

- (HMDIDSActivityMonitorBroadcasterPushTokenDataSource)dataSource
{
  return (HMDIDSActivityMonitorBroadcasterPushTokenDataSource *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMDXPCActivityInterfacing)xpcActivityInterface
{
  return (HMDXPCActivityInterfacing *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityInterface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_activityMonitor, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
}

void __65__HMDIDSActivityMonitorBroadcaster__refreshBroadcastSubscription__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_msgSend(v11, "count");
  objc_msgSend(*(id *)(a1 + 32), "activityMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *MEMORY[0x24BE4F940];
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "broadcastSubActivity:toPushTokens:", v7, v8);

    v9 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v9 + 16))
    {
      *(_BYTE *)(v9 + 16) = 1;
      objc_msgSend(*(id *)(a1 + 32), "_registerForXPCPoll");
    }
  }
  else
  {
    objc_msgSend(v5, "stopBroadcastingSubActivity:", *MEMORY[0x24BE4F940]);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    objc_msgSend(*(id *)(a1 + 32), "xpcActivityInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unregisterXPCActivityWithActivityIdentifier:", CFSTR("com.apple.homed.idsBroadcaster"));

  }
}

void __55__HMDIDSActivityMonitorBroadcaster__registerForXPCPoll__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__HMDIDSActivityMonitorBroadcaster__registerForXPCPoll__block_invoke_81;
    block[3] = &unk_24E79C240;
    block[4] = v5;
    dispatch_async(v6, block);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@XPCActivity handler was invoked after monitor was deallocated", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

uint64_t __55__HMDIDSActivityMonitorBroadcaster__registerForXPCPoll__block_invoke_81(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshBroadcastSubscription");
}

+ (id)criteria
{
  xpc_object_t empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC630]);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x24BDAC688], 1);
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x24BDAC6B8], 1);
  return empty;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_184613 != -1)
    dispatch_once(&logCategory__hmf_once_t9_184613, &__block_literal_global_86_184614);
  return (id)logCategory__hmf_once_v10_184615;
}

void __47__HMDIDSActivityMonitorBroadcaster_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_184615;
  logCategory__hmf_once_v10_184615 = v0;

}

@end
