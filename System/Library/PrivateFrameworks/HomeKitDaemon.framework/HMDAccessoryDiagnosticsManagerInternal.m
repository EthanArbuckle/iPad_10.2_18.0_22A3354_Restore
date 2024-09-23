@implementation HMDAccessoryDiagnosticsManagerInternal

- (HMDAccessoryDiagnosticsManagerInternal)initWithAccessory:(id)a3
{
  id v4;
  HMDAccessoryDiagnosticsManagerInternal *v5;
  HMDAccessoryDiagnosticsManagerInternal *v6;
  uint64_t v7;
  HMFMessageDispatcher *msgDispatcher;
  uint64_t v9;
  OS_dispatch_queue *workQueue;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *clientIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDAccessoryDiagnosticsManagerInternal;
  v5 = -[HMDAccessoryDiagnosticsManagerInternal init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accessory, v4);
    objc_msgSend(v4, "msgDispatcher");
    v7 = objc_claimAutoreleasedReturnValue();
    msgDispatcher = v6->_msgDispatcher;
    v6->_msgDispatcher = (HMFMessageDispatcher *)v7;

    objc_msgSend(v4, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v9;

    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.HMDAccessoryDiagnosticsManager.%@"), CFSTR("com.apple.HomeKitDaemon"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v6->_clientIdentifier;
    v6->_clientIdentifier = (NSString *)v14;

    -[HMDAccessoryDiagnosticsManagerInternal _registerForMessages](v6, "_registerForMessages");
  }

  return v6;
}

- (void)_registerForMessages
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryDiagnosticsManagerInternal msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD4B50];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 32773);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  -[HMDAccessoryDiagnosticsManagerInternal accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v8, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v4, self, v10, sel__handleDiagnosticsTransferRequest_);

}

- (void)_handleDiagnosticsTransferRequest:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryDiagnosticsManagerInternal *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMDAccessoryDiagnosticsManagerInternal *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDAccessoryDiagnosticsManagerInternal *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
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
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received message to start diagnostics transfer", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessoryDiagnosticsManagerInternal accessory](v6, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isReachable");

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v4, "messagePayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kAccessoryDiagnosticsOptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v23 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, &v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v23;
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v22;
      v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Decoded diagnostics options with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    if (v14)
      objc_msgSend(v4, "respondWithError:", v14);
    else
      -[HMDAccessoryDiagnosticsManagerInternal handleDiagnosticsTransferWithOptions:message:](v20, "handleDiagnosticsTransferWithOptions:message:", v13, v4);

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Diagnostics transfer request message: %@ when accessory is not reachable", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v14);
  }

}

- (void)notifyClientsOfDiagnosticsTransferSupport:(BOOL)a3 supportDiagnosticsTransfer:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  HMDAccessoryDiagnosticsManagerInternal *v11;
  BOOL v12;

  v6 = a4;
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __111__HMDAccessoryDiagnosticsManagerInternal_notifyClientsOfDiagnosticsTransferSupport_supportDiagnosticsTransfer___block_invoke;
  block[3] = &unk_24E799CF0;
  v12 = a3;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDAccessoryDiagnosticsManagerInternal accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)start
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)shutDown
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)handleDiagnosticsTransferWithOptions:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryDiagnosticsManagerInternal accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Accessory UUID"), v5);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessoryDiagnosticsManagerInternal accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (HMDAccessoryDiagnosticsSessionInternal)currentDiagnosticsSession
{
  return (HMDAccessoryDiagnosticsSessionInternal *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentDiagnosticsSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDiagnosticsSession, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

void __111__HMDAccessoryDiagnosticsManagerInternal_notifyClientsOfDiagnosticsTransferSupport_supportDiagnosticsTransfer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = *MEMORY[0x24BDD4B60];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (*(_QWORD *)(a1 + 32))
  {
    encodeRootObject();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD4FF8]);

  }
  objc_msgSend(MEMORY[0x24BE3F1B0], "messageWithName:messagePayload:", *MEMORY[0x24BDD4B68], v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "msgDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendMessage:target:", v6, v9);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_195541 != -1)
    dispatch_once(&logCategory__hmf_once_t3_195541, &__block_literal_global_195542);
  return (id)logCategory__hmf_once_v4_195543;
}

void __53__HMDAccessoryDiagnosticsManagerInternal_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_195543;
  logCategory__hmf_once_v4_195543 = v0;

}

@end
