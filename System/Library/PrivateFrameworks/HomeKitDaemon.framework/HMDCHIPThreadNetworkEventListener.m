@implementation HMDCHIPThreadNetworkEventListener

- (HMDCHIPThreadNetworkEventListener)initWithThreadResidentCommissioner:(id)a3
{
  id v5;
  HMDCHIPThreadNetworkEventListener *v6;
  HMDCHIPThreadNetworkEventListener *v7;
  void *v8;
  HMDCHIPThreadNetworkEventListener *v9;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCHIPThreadNetworkEventListener;
  v6 = -[HMDCHIPThreadNetworkEventListener init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_threadResidentCommissioner, a3);
    v8 = (void *)MEMORY[0x227676638](-[HMDThreadResidentCommissioner registerForThreadNetworkEvents:](v7->_threadResidentCommissioner, "registerForThreadNetworkEvents:", v7));
    v9 = v7;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@started listening for events", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

- (void)dealloc
{
  HMDThreadResidentCommissioner *threadResidentCommissioner;
  objc_super v4;

  threadResidentCommissioner = self->_threadResidentCommissioner;
  if (threadResidentCommissioner)
    -[HMDThreadResidentCommissioner unregisterForThreadNetworkEvents:](threadResidentCommissioner, "unregisterForThreadNetworkEvents:", self);
  v4.receiver = self;
  v4.super_class = (Class)HMDCHIPThreadNetworkEventListener;
  -[HMDCHIPThreadNetworkEventListener dealloc](&v4, sel_dealloc);
}

- (void)stopListeningForEvents
{
  void *v3;
  void *v4;
  HMDCHIPThreadNetworkEventListener *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[HMDCHIPThreadNetworkEventListener threadResidentCommissioner](self, "threadResidentCommissioner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterForThreadNetworkEvents:", self);

  v4 = (void *)MEMORY[0x227676638](-[HMDCHIPThreadNetworkEventListener setThreadResidentCommissioner:](self, "setThreadResidentCommissioner:", 0));
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@stopped listening for events", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)threadNetworkStateChange:(id)a3
{
  id v4;
  void *v5;
  HMDCHIPThreadNetworkEventListener *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDCHIPThreadNetworkEventListener *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v21 = v8;
    v22 = 2112;
    v23 = v4;
    v24 = 2048;
    v25 = objc_msgSend(v4, "eventType");
    v26 = 2048;
    v27 = objc_msgSend(v4, "eventValue");
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@threadNetworkStateChange - received event %@, type %ld, value %ld", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCHIPThreadNetworkEventListener eventListenerDelegate](v6, "eventListenerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "eventType");
  if (v10 == 1)
  {
    -[HMDCHIPThreadNetworkEventListener setThreadNetworkNodeType:](v6, "setThreadNetworkNodeType:", objc_msgSend(v4, "eventValue"));
  }
  else if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected event %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    -[HMDCHIPThreadNetworkEventListener setThreadNetworkConnectionState:](v6, "setThreadNetworkConnectionState:", objc_msgSend(v4, "eventValue"));
  }
  if (!-[HMDCHIPThreadNetworkEventListener pendingRadioStateChangeNotification](v6, "pendingRadioStateChangeNotification"))
  {
    -[HMDCHIPThreadNetworkEventListener setPendingRadioStateChangeNotification:](v6, "setPendingRadioStateChangeNotification:", 1);
    objc_initWeak((id *)buf, v6);
    v15 = dispatch_time(0, 50000000);
    dispatch_get_global_queue(21, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __62__HMDCHIPThreadNetworkEventListener_threadNetworkStateChange___block_invoke;
    v17[3] = &unk_24E7972B0;
    objc_copyWeak(&v19, (id *)buf);
    v18 = v9;
    dispatch_after(v15, v16, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

- (void)threadBTCallStateChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  HMDCHIPThreadNetworkEventListener *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "callState");
  if (!v5)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  if (v5 != 1)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected event %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    goto LABEL_7;
  }
  v6 = 1;
LABEL_8:
  -[HMDCHIPThreadNetworkEventListener eventListenerDelegate](self, "eventListenerDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "handleThreadBTCallStateChange:", v6);

}

- (int64_t)threadNetworkNodeType
{
  return self->_threadNetworkNodeType;
}

- (void)setThreadNetworkNodeType:(int64_t)a3
{
  self->_threadNetworkNodeType = a3;
}

- (int64_t)threadNetworkConnectionState
{
  return self->_threadNetworkConnectionState;
}

- (void)setThreadNetworkConnectionState:(int64_t)a3
{
  self->_threadNetworkConnectionState = a3;
}

- (HMDCHIPThreadNetworkEventListenerDelegate)eventListenerDelegate
{
  return (HMDCHIPThreadNetworkEventListenerDelegate *)objc_loadWeakRetained((id *)&self->_eventListenerDelegate);
}

- (void)setEventListenerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_eventListenerDelegate, a3);
}

- (HMDThreadResidentCommissioner)threadResidentCommissioner
{
  return (HMDThreadResidentCommissioner *)objc_getProperty(self, a2, 40, 1);
}

- (void)setThreadResidentCommissioner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)pendingRadioStateChangeNotification
{
  return self->_pendingRadioStateChangeNotification;
}

- (void)setPendingRadioStateChangeNotification:(BOOL)a3
{
  self->_pendingRadioStateChangeNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadResidentCommissioner, 0);
  objc_destroyWeak((id *)&self->_eventListenerDelegate);
}

void __62__HMDCHIPThreadNetworkEventListener_threadNetworkStateChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setPendingRadioStateChangeNotification:", 0);
  if (*(_QWORD *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "handleNetworkStateChange");

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_194959 != -1)
    dispatch_once(&logCategory__hmf_once_t5_194959, &__block_literal_global_194960);
  return (id)logCategory__hmf_once_v6_194961;
}

void __48__HMDCHIPThreadNetworkEventListener_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_194961;
  logCategory__hmf_once_v6_194961 = v0;

}

@end
