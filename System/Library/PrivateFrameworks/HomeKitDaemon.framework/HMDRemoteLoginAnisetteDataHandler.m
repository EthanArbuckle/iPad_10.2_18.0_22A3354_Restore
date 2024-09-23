@implementation HMDRemoteLoginAnisetteDataHandler

- (HMDRemoteLoginAnisetteDataHandler)initWithUUID:(id)a3 accessory:(id)a4
{
  id v7;
  id v8;
  HMDRemoteLoginAnisetteDataHandler *v9;
  HMDRemoteLoginAnisetteDataHandler *v10;
  AKAnisetteProvisioningController *v11;
  AKAnisetteProvisioningController *provisioningController;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDRemoteLoginAnisetteDataHandler;
  v9 = -[HMDRemoteLoginAnisetteDataHandler init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeWeak((id *)&v10->_accessory, v8);
    v11 = (AKAnisetteProvisioningController *)objc_alloc_init(MEMORY[0x24BE0ACB0]);
    provisioningController = v10->_provisioningController;
    v10->_provisioningController = v11;

  }
  return v10;
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  id v6;

  v6 = a4;
  -[HMDRemoteLoginAnisetteDataHandler setWorkQueue:](self, "setWorkQueue:", a3);
  -[HMDRemoteLoginAnisetteDataHandler setMsgDispatcher:](self, "setMsgDispatcher:", v6);

}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  -[HMDRemoteLoginAnisetteDataHandler accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginAnisetteDataHandler msgDispatcher](self, "msgDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD78F0], "messageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  v26[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", v8, self, v9, sel__handleProvisionAnisetteDataRequestMessage_);

  -[HMDRemoteLoginAnisetteDataHandler msgDispatcher](self, "msgDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD7A30], "messageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v5;
  v25[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerForMessage:receiver:policies:selector:", v11, self, v12, sel__handleSyncAnisetteDataRequestMessage_);

  -[HMDRemoteLoginAnisetteDataHandler msgDispatcher](self, "msgDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD7628], "messageName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v24[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerForMessage:receiver:policies:selector:", v14, self, v15, sel__handleEraseAnisetteDataRequestMessage_);

  -[HMDRemoteLoginAnisetteDataHandler msgDispatcher](self, "msgDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD7690], "messageName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  v23[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerForMessage:receiver:policies:selector:", v17, self, v18, sel__handleFetchAnisetteDataRequestMessage_);

  -[HMDRemoteLoginAnisetteDataHandler msgDispatcher](self, "msgDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD7730], "messageName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerForMessage:receiver:policies:selector:", v20, self, v21, sel__handleLegacyAnisetteDataRequestMessage_);

}

- (void)_handleProvisionAnisetteDataRequestMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDRemoteLoginAnisetteDataHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD78F0], "objWithMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling provision anisette data request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDRemoteLoginAnisetteDataHandler provisioningController](v7, "provisioningController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__HMDRemoteLoginAnisetteDataHandler__handleProvisionAnisetteDataRequestMessage___block_invoke;
  v13[3] = &unk_24E789D30;
  v14 = v5;
  v15 = v4;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v10, "provisionWithCompletion:", v13);

}

- (void)_handleSyncAnisetteDataRequestMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDRemoteLoginAnisetteDataHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD7A30], "objWithMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling sync anisette data request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDRemoteLoginAnisetteDataHandler provisioningController](v7, "provisioningController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__HMDRemoteLoginAnisetteDataHandler__handleSyncAnisetteDataRequestMessage___block_invoke;
  v14[3] = &unk_24E789D30;
  v15 = v5;
  v16 = v4;
  v12 = v4;
  v13 = v5;
  objc_msgSend(v10, "syncWithSIMData:completion:", v11, v14);

}

- (void)_handleEraseAnisetteDataRequestMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDRemoteLoginAnisetteDataHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD7628], "objWithMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling erase anisette data request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDRemoteLoginAnisetteDataHandler provisioningController](v7, "provisioningController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__HMDRemoteLoginAnisetteDataHandler__handleEraseAnisetteDataRequestMessage___block_invoke;
  v13[3] = &unk_24E789D30;
  v14 = v5;
  v15 = v4;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v10, "eraseWithCompletion:", v13);

}

- (void)_handleFetchAnisetteDataRequestMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDRemoteLoginAnisetteDataHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD7690], "objWithMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch anisette data request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDRemoteLoginAnisetteDataHandler provisioningController](v7, "provisioningController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__HMDRemoteLoginAnisetteDataHandler__handleFetchAnisetteDataRequestMessage___block_invoke;
  v13[3] = &unk_24E789D58;
  v14 = v5;
  v15 = v4;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v10, "anisetteDataWithCompletion:", v13);

}

- (void)_handleLegacyAnisetteDataRequestMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDRemoteLoginAnisetteDataHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD7730], "objWithMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling legacy anisette data request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDRemoteLoginAnisetteDataHandler provisioningController](v7, "provisioningController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dsid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__HMDRemoteLoginAnisetteDataHandler__handleLegacyAnisetteDataRequestMessage___block_invoke;
  v14[3] = &unk_24E789D58;
  v15 = v5;
  v16 = v4;
  v12 = v4;
  v13 = v5;
  objc_msgSend(v10, "legacyAnisetteDataForDSID:withCompletion:", v11, v14);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDRemoteLoginAnisetteDataHandler uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDAppleMediaAccessory)accessory
{
  return (HMDAppleMediaAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (AKAnisetteProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

void __77__HMDRemoteLoginAnisetteDataHandler__handleLegacyAnisetteDataRequestMessage___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDD7738];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "initWithSessionID:", v6);

  objc_msgSend(v9, "setAnisetteData:", v4);
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messagePayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);

}

void __76__HMDRemoteLoginAnisetteDataHandler__handleFetchAnisetteDataRequestMessage___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDD7698];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "initWithSessionID:", v6);

  objc_msgSend(v9, "setAnisetteData:", v4);
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messagePayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);

}

void __76__HMDRemoteLoginAnisetteDataHandler__handleEraseAnisetteDataRequestMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  id v8;

  v4 = objc_alloc(MEMORY[0x24BDD7630]);
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "initWithSessionID:", v5);

  objc_msgSend(v8, "setDidSucceed:", a2);
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v7);

}

void __75__HMDRemoteLoginAnisetteDataHandler__handleSyncAnisetteDataRequestMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  id v8;

  v4 = objc_alloc(MEMORY[0x24BDD7A38]);
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "initWithSessionID:", v5);

  objc_msgSend(v8, "setDidSucceed:", a2);
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v7);

}

void __80__HMDRemoteLoginAnisetteDataHandler__handleProvisionAnisetteDataRequestMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  id v8;

  v4 = objc_alloc(MEMORY[0x24BDD78F8]);
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "initWithSessionID:", v5);

  objc_msgSend(v8, "setDidSucceed:", a2);
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v7);

}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_152389 != -1)
    dispatch_once(&logCategory__hmf_once_t5_152389, &__block_literal_global_152390);
  return (id)logCategory__hmf_once_v6_152391;
}

void __48__HMDRemoteLoginAnisetteDataHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_152391;
  logCategory__hmf_once_v6_152391 = v0;

}

@end
