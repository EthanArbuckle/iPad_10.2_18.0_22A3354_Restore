@implementation HMDRemotelyAddedAccessoryReachabilityObserver

- (HMDRemotelyAddedAccessoryReachabilityObserver)initWithAccessory:(id)a3 message:(id)a4 workQueue:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  HMDRemotelyAddedAccessoryReachabilityObserver *v18;

  v8 = (void *)MEMORY[0x24BE3F248];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferenceForKey:", CFSTR("RemotelyAddedAccessoryReachabilityTimeout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "doubleValue");
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, v15);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMDRemotelyAddedAccessoryReachabilityObserver initWithAccessory:message:workQueue:timer:notificationCenter:](self, "initWithAccessory:message:workQueue:timer:notificationCenter:", v11, v10, v9, v16, v17);

  return v18;
}

- (HMDRemotelyAddedAccessoryReachabilityObserver)initWithAccessory:(id)a3 message:(id)a4 workQueue:(id)a5 timer:(id)a6 notificationCenter:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDRemotelyAddedAccessoryReachabilityObserver *v17;
  HMDRemotelyAddedAccessoryReachabilityObserver *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDRemotelyAddedAccessoryReachabilityObserver;
  v17 = -[HMDRemotelyAddedAccessoryReachabilityObserver init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accessory, a3);
    objc_storeStrong((id *)&v18->_message, a4);
    objc_storeStrong((id *)&v18->_workQueue, a5);
    objc_storeStrong((id *)&v18->_timer, a6);
    objc_storeStrong((id *)&v18->_notificationCenter, a7);
  }

  return v18;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDRemotelyAddedAccessoryReachabilityObserver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDRemotelyAddedAccessoryReachabilityObserver *v20;
  NSObject *v21;
  void *v22;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[HMDRemotelyAddedAccessoryReachabilityObserver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDRemotelyAddedAccessoryReachabilityObserver notificationToken](self, "notificationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    _HMFPreconditionFailure();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemotelyAddedAccessoryReachabilityObserver accessory](v6, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting tracking for remotely added accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HMDRemotelyAddedAccessoryReachabilityObserver_start__block_invoke;
  aBlock[3] = &unk_24E78C4C0;
  aBlock[4] = v6;
  v10 = _Block_copy(aBlock);
  -[HMDRemotelyAddedAccessoryReachabilityObserver notificationCenter](v6, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemotelyAddedAccessoryReachabilityObserver accessory](v6, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("HMDAccessoryIsReachableNotification"), v12, 0, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemotelyAddedAccessoryReachabilityObserver setNotificationToken:](v6, "setNotificationToken:", v13);

  -[HMDRemotelyAddedAccessoryReachabilityObserver timer](v6, "timer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", v6);

  -[HMDRemotelyAddedAccessoryReachabilityObserver workQueue](v6, "workQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemotelyAddedAccessoryReachabilityObserver timer](v6, "timer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegateQueue:", v15);

  -[HMDRemotelyAddedAccessoryReachabilityObserver timer](v6, "timer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resume");

  -[HMDRemotelyAddedAccessoryReachabilityObserver accessory](v6, "accessory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v18, "isReachable");

  if ((_DWORD)v16)
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Immediately responding to message because added accessory is already reachable", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDRemotelyAddedAccessoryReachabilityObserver _respondToMessage](v20, "_respondToMessage");
  }

}

- (void)_respondToMessage
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMDRemotelyAddedAccessoryReachabilityObserver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDRemotelyAddedAccessoryReachabilityObserver notificationToken](self, "notificationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDRemotelyAddedAccessoryReachabilityObserver message](self, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "respondWithSuccess");

    -[HMDRemotelyAddedAccessoryReachabilityObserver setTimer:](self, "setTimer:", 0);
    -[HMDRemotelyAddedAccessoryReachabilityObserver notificationCenter](self, "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemotelyAddedAccessoryReachabilityObserver notificationToken](self, "notificationToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", v7);

    -[HMDRemotelyAddedAccessoryReachabilityObserver setNotificationToken:](self, "setNotificationToken:", 0);
  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDRemotelyAddedAccessoryReachabilityObserver accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HMDRemotelyAddedAccessoryReachabilityObserver *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDRemotelyAddedAccessoryReachabilityObserver timer](self, "timer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Timed out waiting for added accessory to become reachable so responding to message", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDRemotelyAddedAccessoryReachabilityObserver _respondToMessage](v7, "_respondToMessage");
  }

}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 32, 1);
}

- (HMFTimer)timer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSObject)notificationToken
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setNotificationToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

void __54__HMDRemotelyAddedAccessoryReachabilityObserver_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HMDRemotelyAddedAccessoryReachabilityObserver_start__block_invoke_2;
  block[3] = &unk_24E79C240;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __54__HMDRemotelyAddedAccessoryReachabilityObserver_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Pending added accessory became reachable so responding to message", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_respondToMessage");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_172454 != -1)
    dispatch_once(&logCategory__hmf_once_t3_172454, &__block_literal_global_172455);
  return (id)logCategory__hmf_once_v4_172456;
}

void __60__HMDRemotelyAddedAccessoryReachabilityObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_172456;
  logCategory__hmf_once_v4_172456 = v0;

}

@end
