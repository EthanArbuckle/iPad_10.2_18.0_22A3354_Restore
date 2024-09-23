@implementation HMDCameraAnalysisStatePublisher

- (HMDCameraAnalysisStatePublisher)initWithHome:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCameraAnalysisStatePublisher *v11;

  v4 = (objc_class *)MEMORY[0x24BE4D1A8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithHomeUUID:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 8, 16.0);
  objc_msgSend(v5, "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDCameraAnalysisStatePublisher initWithHomeMessagingContext:analysisStateManager:workQueue:cameraAnalysisStatePublisherDebounceTimer:](self, "initWithHomeMessagingContext:analysisStateManager:workQueue:cameraAnalysisStatePublisherDebounceTimer:", v5, v8, v10, v9);

  return v11;
}

- (HMDCameraAnalysisStatePublisher)initWithHomeMessagingContext:(id)a3 analysisStateManager:(id)a4 workQueue:(id)a5 cameraAnalysisStatePublisherDebounceTimer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDCameraAnalysisStatePublisher *v14;
  HMDCameraAnalysisStatePublisher *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraAnalysisStatePublisher;
  v14 = -[HMDCameraAnalysisStatePublisher init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_messagingContext, v10);
    objc_storeStrong((id *)&v15->_analysisStateManager, a4);
    objc_storeStrong((id *)&v15->_cameraAnalysisStatePublisherDebounceTimer, a6);
    objc_storeStrong((id *)&v15->_workQueue, a5);
  }

  return v15;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraAnalysisStatePublisher analysisStateManager](self, "analysisStateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRoles:", objc_msgSend(v6, "roles") | 4);
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraAnalysisStatePublisher messagingContext](self, "messagingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "msgDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", CFSTR("HMDCameraAnalysisStatePublisherStateUpdateMessage"), self, v10, sel__handleRemoteAnalysisStateUpdate_);

  -[HMDCameraAnalysisStatePublisher cameraAnalysisStatePublisherDebounceTimer](self, "cameraAnalysisStatePublisherDebounceTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  -[HMDCameraAnalysisStatePublisher workQueue](self, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAnalysisStatePublisher cameraAnalysisStatePublisherDebounceTimer](self, "cameraAnalysisStatePublisherDebounceTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegateQueue:", v12);

}

- (void)_processStateUpdate:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  -[HMDCameraAnalysisStatePublisher workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDCameraAnalysisStatePublisher stateUpdate](self, "stateUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDCameraAnalysisStatePublisher stateUpdate](self, "stateUpdate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stateUpdateByMergingStateUpdate:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraAnalysisStatePublisher setStateUpdate:](self, "setStateUpdate:", v7);

  }
  else
  {
    -[HMDCameraAnalysisStatePublisher setStateUpdate:](self, "setStateUpdate:", v11);
  }
  -[HMDCameraAnalysisStatePublisher cameraAnalysisStatePublisherDebounceTimer](self, "cameraAnalysisStatePublisherDebounceTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRunning");

  if ((v9 & 1) == 0)
  {
    -[HMDCameraAnalysisStatePublisher cameraAnalysisStatePublisherDebounceTimer](self, "cameraAnalysisStatePublisherDebounceTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume");

  }
}

- (void)_publishAnalysisStateUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDCameraAnalysisStatePublisher *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDCameraAnalysisStatePublisher *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraAnalysisStatePublisher workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraAnalysisStatePublisher stateUpdate](self, "stateUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDCameraAnalysisStatePublisher setStateUpdate:](self, "setStateUpdate:", 0);
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v21);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v21;
    if (v5)
    {
      v22 = CFSTR("HMDCameraAnalysisStatePublisherStateUpdateMessageKey");
      v23 = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraAnalysisStatePublisher messagingContext](self, "messagingContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "enabledResidents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __62__HMDCameraAnalysisStatePublisher__publishAnalysisStateUpdate__block_invoke;
      v19[3] = &unk_24E77B4B8;
      v19[4] = self;
      v20 = v7;
      v10 = v7;
      objc_msgSend(v9, "na_each:", v19);

    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v18;
        v26 = 2112;
        v27 = v4;
        v28 = 2112;
        v29 = v6;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invoking _publishAnalysisStateUpdate with nil stateUpdate!", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)_handleRemoteAnalysisStateUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCameraAnalysisStatePublisher *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraAnalysisStatePublisher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "messagePayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMDCameraAnalysisStatePublisherStateUpdateMessageKey"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling remote state update: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDCameraAnalysisStatePublisher analysisStateManager](v10, "analysisStateManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleRemoteStateUpdate:", v8);

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Received nil analysis state update from message with identifier: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)stateManager:(id)a3 didReceiveLocalUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraAnalysisStatePublisher *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received local analysis state update: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraAnalysisStatePublisher workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__HMDCameraAnalysisStatePublisher_stateManager_didReceiveLocalUpdate___block_invoke;
  v14[3] = &unk_24E79C268;
  v14[4] = v9;
  v15 = v7;
  v13 = v7;
  dispatch_async(v12, v14);

}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDCameraAnalysisStatePublisher messagingContext](self, "messagingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[HMDCameraAnalysisStatePublisher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraAnalysisStatePublisher cameraAnalysisStatePublisherDebounceTimer](self, "cameraAnalysisStatePublisherDebounceTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    -[HMDCameraAnalysisStatePublisher _publishAnalysisStateUpdate](self, "_publishAnalysisStateUpdate");
}

- (HMIAnalysisStateManager)analysisStateManager
{
  return (HMIAnalysisStateManager *)objc_getProperty(self, a2, 8, 1);
}

- (HMDHomeResidentMessagingContext)messagingContext
{
  return (HMDHomeResidentMessagingContext *)objc_loadWeakRetained((id *)&self->_messagingContext);
}

- (void)setMessagingContext:(id)a3
{
  objc_storeWeak((id *)&self->_messagingContext, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMFTimer)cameraAnalysisStatePublisherDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 32, 1);
}

- (HMIAnalysisStateUpdate)stateUpdate
{
  return (HMIAnalysisStateUpdate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStateUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUpdate, 0);
  objc_storeStrong((id *)&self->_cameraAnalysisStatePublisherDebounceTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_messagingContext);
  objc_storeStrong((id *)&self->_analysisStateManager, 0);
}

uint64_t __70__HMDCameraAnalysisStatePublisher_stateManager_didReceiveLocalUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processStateUpdate:", *(_QWORD *)(a1 + 40));
}

void __62__HMDCameraAnalysisStatePublisher__publishAnalysisStateUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDRemoteDeviceMessageDestination *v10;
  id WeakRetained;
  void *v12;
  HMDRemoteDeviceMessageDestination *v13;
  HMDRemoteMessage *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isCurrentDevice") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending state update to %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v10 = [HMDRemoteDeviceMessageDestination alloc];
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(WeakRetained, "messageTargetUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v10, "initWithTarget:device:", v12, v4);

    v14 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDCameraAnalysisStatePublisherStateUpdateMessage"), v13, *(_QWORD *)(a1 + 40), 3, 1, 20.0);
    objc_msgSend(*(id *)(a1 + 32), "messagingContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "msgDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendMessage:", v14);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_43836 != -1)
    dispatch_once(&logCategory__hmf_once_t6_43836, &__block_literal_global_43837);
  return (id)logCategory__hmf_once_v7_43838;
}

void __46__HMDCameraAnalysisStatePublisher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_43838;
  logCategory__hmf_once_v7_43838 = v0;

}

@end
