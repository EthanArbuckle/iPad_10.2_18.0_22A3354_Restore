@implementation HMDActiveXPCClientConnectionsPeriodicTimer

- (HMDActiveXPCClientConnectionsPeriodicTimer)initWithTimeInterval:(double)a3 logIdentifier:(id)a4 workQueue:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  HMDActiveXPCClientConnectionsManager *v12;
  HMDActiveXPCClientConnectionsPeriodicTimer *v13;

  v8 = (objc_class *)MEMORY[0x24BE3F298];
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithTimeInterval:options:", 4, a3);
  v12 = -[HMDActiveXPCClientConnectionsManager initWithLogIdentifier:workQueue:]([HMDActiveXPCClientConnectionsManager alloc], "initWithLogIdentifier:workQueue:", v10, v9);
  v13 = -[HMDActiveXPCClientConnectionsPeriodicTimer initWithTimer:clientConnectionsManager:logIdentifier:workQueue:](self, "initWithTimer:clientConnectionsManager:logIdentifier:workQueue:", v11, v12, v10, v9);

  return v13;
}

- (HMDActiveXPCClientConnectionsPeriodicTimer)initWithTimer:(id)a3 clientConnectionsManager:(id)a4 logIdentifier:(id)a5 workQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDActiveXPCClientConnectionsPeriodicTimer *v16;
  HMDActiveXPCClientConnectionsPeriodicTimer *v17;
  uint64_t v18;
  NSString *logIdentifier;
  HMDActiveXPCClientConnectionsPeriodicTimer *v21;
  SEL v22;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v21 = (HMDActiveXPCClientConnectionsPeriodicTimer *)_HMFPreconditionFailure();
    return (HMDActiveXPCClientConnectionsPeriodicTimer *)-[HMDActiveXPCClientConnectionsPeriodicTimer clientConnections](v21, v22);
  }
  v23.receiver = self;
  v23.super_class = (Class)HMDActiveXPCClientConnectionsPeriodicTimer;
  v16 = -[HMDActiveXPCClientConnectionsPeriodicTimer init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_timer, a3);
    v18 = objc_msgSend(v13, "copy");
    logIdentifier = v17->_logIdentifier;
    v17->_logIdentifier = (NSString *)v18;

    objc_storeStrong((id *)&v17->_workQueue, a6);
    objc_storeStrong((id *)&v17->_clientConnectionsManager, a4);
  }

  return v17;
}

- (NSSet)clientConnections
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[HMDActiveXPCClientConnectionsPeriodicTimer workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDActiveXPCClientConnectionsPeriodicTimer clientConnectionsManager](self, "clientConnectionsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (void)addClientConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[HMDActiveXPCClientConnectionsPeriodicTimer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDActiveXPCClientConnectionsPeriodicTimer _configure](self, "_configure");
  -[HMDActiveXPCClientConnectionsPeriodicTimer clientConnectionsManager](self, "clientConnectionsManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addClientConnection:", v4);

}

- (void)removeClientConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[HMDActiveXPCClientConnectionsPeriodicTimer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDActiveXPCClientConnectionsPeriodicTimer clientConnectionsManager](self, "clientConnectionsManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeClientConnection:", v4);

}

- (void)_configure
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDActiveXPCClientConnectionsPeriodicTimer workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDActiveXPCClientConnectionsPeriodicTimer clientConnectionsManager](self, "clientConnectionsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HMDActiveXPCClientConnectionsPeriodicTimer clientConnectionsManager](self, "clientConnectionsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    -[HMDActiveXPCClientConnectionsPeriodicTimer timer](self, "timer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[HMDActiveXPCClientConnectionsPeriodicTimer workQueue](self, "workQueue");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDActiveXPCClientConnectionsPeriodicTimer timer](self, "timer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegateQueue:", v9);

  }
}

- (void)_updateTimer
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  HMDActiveXPCClientConnectionsPeriodicTimer *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDActiveXPCClientConnectionsPeriodicTimer workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDActiveXPCClientConnectionsPeriodicTimer clientConnections](self, "clientConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_119689);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting timer", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDActiveXPCClientConnectionsPeriodicTimer timer](v7, "timer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

    -[HMDActiveXPCClientConnectionsPeriodicTimer delegate](v7, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientConnectionsTimerDidFire:", v7);
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Suspending timer", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDActiveXPCClientConnectionsPeriodicTimer timer](v7, "timer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "suspend");
  }

}

- (void)clientConnectionsManager:(id)a3 didHandleActivationForClientConnection:(id)a4
{
  NSObject *v5;

  -[HMDActiveXPCClientConnectionsPeriodicTimer workQueue](self, "workQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDActiveXPCClientConnectionsPeriodicTimer _updateTimer](self, "_updateTimer");
}

- (void)clientConnectionsManager:(id)a3 didHandleDeactivationForClientConnection:(id)a4
{
  NSObject *v5;

  -[HMDActiveXPCClientConnectionsPeriodicTimer workQueue](self, "workQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDActiveXPCClientConnectionsPeriodicTimer _updateTimer](self, "_updateTimer");
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDActiveXPCClientConnectionsPeriodicTimer *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDActiveXPCClientConnectionsPeriodicTimer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDActiveXPCClientConnectionsPeriodicTimer timer](self, "timer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of timer firing", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDActiveXPCClientConnectionsPeriodicTimer delegate](v8, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientConnectionsTimerDidFire:", v8);

  }
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (HMDActiveXPCClientConnectionsPeriodicTimerDelegate)delegate
{
  return (HMDActiveXPCClientConnectionsPeriodicTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMFTimer)timer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (HMDActiveXPCClientConnectionsManager)clientConnectionsManager
{
  return (HMDActiveXPCClientConnectionsManager *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnectionsManager, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

uint64_t __58__HMDActiveXPCClientConnectionsPeriodicTimer__updateTimer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActivated");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_119707 != -1)
    dispatch_once(&logCategory__hmf_once_t2_119707, &__block_literal_global_10_119708);
  return (id)logCategory__hmf_once_v3_119709;
}

void __57__HMDActiveXPCClientConnectionsPeriodicTimer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_119709;
  logCategory__hmf_once_v3_119709 = v0;

}

@end
