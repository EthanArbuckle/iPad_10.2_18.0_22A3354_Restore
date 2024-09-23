@implementation HMDAppleMediaAccessorySleepWakeStateController

- (HMDAppleMediaAccessorySleepWakeStateController)initWithAccessoryUUID:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  HMDAppleMediaAccessorySleepWakeStateController *v8;
  HMDAppleMediaAccessorySleepWakeStateController *v9;
  uint64_t v10;
  NSUUID *accessoryUUID;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDAppleMediaAccessorySleepWakeStateController;
  v8 = -[HMDAppleMediaAccessorySleepWakeStateController init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend(v6, "copy");
    accessoryUUID = v9->_accessoryUUID;
    v9->_accessoryUUID = (NSUUID *)v10;

    objc_storeWeak((id *)&v9->_dataSource, v7);
  }

  return v9;
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4 workQueue:(id)a5
{
  id v8;
  SEL v9;
  SEL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  if (self)
  {
    v8 = a4;
    objc_setProperty_atomic(self, v9, a5, 24);
    objc_setProperty_atomic(self, v10, v8, 40);

    v11 = v20;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v11, 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v21[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "currentDeviceProductInfoForAppleMediaAccessorySleepWakeStateController:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "productClass") == 4)
    {
      +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObject:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v19;
    }
    objc_msgSend(objc_getProperty(self, v17, 40, 1), "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD5BF8], self, v14, sel__handleFetchSleepWakeStateMessage_);

  }
}

- (void)fetchSleepWakeStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  NAFuture **p_fetchSleepWakeFuture;
  NAFuture *v9;
  void *v10;
  HMDAppleMediaAccessorySleepWakeStateController *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMDAppleMediaAccessorySleepWakeStateController *v16;
  NSObject *v17;
  void *v18;
  id v19;
  HMDRemoteDeviceMessageDestination *v20;
  void *v21;
  HMDRemoteDeviceMessageDestination *v22;
  void *v23;
  int v24;
  const char *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _BYTE buf[24];
  void *v34;
  HMDAppleMediaAccessorySleepWakeStateController *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAppleMediaAccessorySleepWakeStateController dataSource]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceForAppleMediaAccessorySleepWakeStateController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    p_fetchSleepWakeFuture = &self->_fetchSleepWakeFuture;
    v9 = self->_fetchSleepWakeFuture;
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Fetching sleep wake state with current fetch future: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = MEMORY[0x24BDAC760];
    if (v9)
    {
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v9 = (NAFuture *)objc_alloc_init(MEMORY[0x24BE6B608]);
      objc_storeStrong((id *)p_fetchSleepWakeFuture, v9);
      os_unfair_lock_unlock(p_lock);
      v19 = v6;
      v20 = [HMDRemoteDeviceMessageDestination alloc];
      -[HMDAppleMediaAccessorySleepWakeStateController messageTargetUUID](v11, "messageTargetUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v20, "initWithTarget:device:", v21, v19);

      objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:destination:payload:", *MEMORY[0x24BDD5BF8], v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setSecureRemote:", 1);
      *(_QWORD *)buf = v14;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __80__HMDAppleMediaAccessorySleepWakeStateController__sendSleepWakeMessageToDevice___block_invoke;
      v34 = &unk_24E79B7E0;
      v35 = v11;
      objc_msgSend(v23, "setResponseHandler:", buf);
      v24 = objc_msgSend(v19, "isCurrentDevice");

      if (v24)
        -[HMDAppleMediaAccessorySleepWakeStateController _handleFetchSleepWakeStateMessage:](v11, "_handleFetchSleepWakeStateMessage:", v23);
      else
        objc_msgSend(objc_getProperty(v11, v25, 40, 1), "sendMessage:", v23);

    }
    v31[0] = v14;
    v31[1] = 3221225472;
    v31[2] = __84__HMDAppleMediaAccessorySleepWakeStateController_fetchSleepWakeStateWithCompletion___block_invoke;
    v31[3] = &unk_24E79A028;
    v26 = v4;
    v32 = v26;
    v27 = (id)-[NAFuture addSuccessBlock:](v9, "addSuccessBlock:", v31);
    v29[0] = v14;
    v29[1] = 3221225472;
    v29[2] = __84__HMDAppleMediaAccessorySleepWakeStateController_fetchSleepWakeStateWithCompletion___block_invoke_2;
    v29[3] = &unk_24E79A050;
    v30 = v26;
    v28 = (id)-[NAFuture addFailureBlock:](v9, "addFailureBlock:", v29);

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
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to get current device from AppleMediaAccessorySleepWakeStateControllerDataSource", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v9 = (NAFuture *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, NAFuture *))v4 + 2))(v4, 0, v9);
  }

}

- (void)_handleFetchSleepWakeStateMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDAppleMediaAccessorySleepWakeStateController *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  const char *v14;
  void *v15;
  HMDAppleMediaAccessorySleepWakeStateController *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAppleMediaAccessorySleepWakeStateController dataSource]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceForAppleMediaAccessorySleepWakeStateController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isCurrentDevice") & 1) != 0)
  {
    objc_msgSend(v5, "currentDeviceProductInfoForAppleMediaAccessorySleepWakeStateController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "productClass");
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v8 == 4)
    {
      if (v12)
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v13;
        v14 = "%{public}@Unsupported attempt to fetch sleep wake state on a non TVOS device";
LABEL_12:
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);

      }
    }
    else if (v12)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v13;
      v14 = "%{public}@Unsupported attempt to fetch sleep wake state on a non ATV device";
      goto LABEL_12;
    }

    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v19);

    goto LABEL_15;
  }
  if ((objc_msgSend(v4, "isRemote") & 1) != 0 || objc_msgSend(v4, "isSecureRemote"))
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay remote fetch sleep wake message twice", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v7);
  }
  else
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __84__HMDAppleMediaAccessorySleepWakeStateController__handleFetchSleepWakeStateMessage___block_invoke;
    v20[3] = &unk_24E79A078;
    v21 = v4;
    -[HMDAppleMediaAccessorySleepWakeStateController fetchSleepWakeStateWithCompletion:](self, "fetchSleepWakeStateWithCompletion:", v20);
    v7 = v21;
  }
LABEL_15:

}

- (NSUUID)messageTargetUUID
{
  if (self)
    self = (HMDAppleMediaAccessorySleepWakeStateController *)objc_getProperty(self, a2, 32, 1);
  return (NSUUID *)self;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
    self = (HMDAppleMediaAccessorySleepWakeStateController *)objc_getProperty(self, a2, 24, 1);
  return (OS_dispatch_queue *)self;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fetchSleepWakeFuture, 0);
}

- (id)dataSource
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 6);
  return WeakRetained;
}

void __84__HMDAppleMediaAccessorySleepWakeStateController__handleFetchSleepWakeStateMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:");
  }
  else
  {
    v6 = *MEMORY[0x24BDD5BF0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "respondWithPayload:", v5);

  }
}

uint64_t __84__HMDAppleMediaAccessorySleepWakeStateController_fetchSleepWakeStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_self();
  if (objc_msgSend(v3, "unsignedIntValue") != 2)
    objc_msgSend(v3, "unsignedIntValue");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__HMDAppleMediaAccessorySleepWakeStateController_fetchSleepWakeStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__HMDAppleMediaAccessorySleepWakeStateController__sendSleepWakeMessageToDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_unfair_lock_s *v7;
  id v8;
  uint64_t v9;
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
  v5 = a2;
  v6 = a3;
  v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = 0;

  os_unfair_lock_unlock(v7);
  if (v5)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Fetching sleep wake state failed with error: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v8, "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x24BDD5BF0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v8, "finishWithResult:", v15);
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v19;
        v23 = 2112;
        v24 = 0;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Fetching sleep wake state failed, missing sleep wake state key: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 43);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishWithError:", v20);

    }
  }

}

@end
