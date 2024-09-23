@implementation HMDModernRemoteMessageTransport

- (HMDModernRemoteMessageTransport)initWithAccountRegistry:(id)a3
{
  id v4;
  HMDIDSDate *v5;
  HMDDate *v6;
  HMDRapportMessageTransport *v7;
  HMDIDSMessageTransport *v8;
  HMDModernTransportMessageContextManager *v9;
  void *v10;
  HMDModernRemoteMessageTransport *v11;
  uint64_t v13;

  v4 = a3;
  v5 = objc_alloc_init(HMDIDSDate);
  v6 = objc_alloc_init(HMDDate);
  v7 = -[HMDRapportMessageTransport initWithAccountRegistry:]([HMDRapportMessageTransport alloc], "initWithAccountRegistry:", v4);
  v8 = -[HMDIDSMessageTransport initWithAccountRegistry:]([HMDIDSMessageTransport alloc], "initWithAccountRegistry:", v4);
  v9 = objc_alloc_init(HMDModernTransportMessageContextManager);
  v10 = (void *)objc_opt_new();
  LOBYTE(v13) = 0;
  v11 = -[HMDModernRemoteMessageTransport initWithAccountRegistry:rapportTransport:idsTransport:contextManager:systemDateProvider:idsDateProvider:timerProvider:isWatch:](self, "initWithAccountRegistry:rapportTransport:idsTransport:contextManager:systemDateProvider:idsDateProvider:timerProvider:isWatch:", v4, v7, v8, v9, v6, v5, v10, v13);

  return v11;
}

- (HMDModernRemoteMessageTransport)initWithAccountRegistry:(id)a3 rapportTransport:(id)a4 idsTransport:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDIDSDate *v11;
  HMDDate *v12;
  HMDModernTransportMessageContextManager *v13;
  void *v14;
  HMDModernRemoteMessageTransport *v15;
  uint64_t v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HMDIDSDate);
  v12 = objc_alloc_init(HMDDate);
  v13 = objc_alloc_init(HMDModernTransportMessageContextManager);
  v14 = (void *)objc_opt_new();
  LOBYTE(v17) = 0;
  v15 = -[HMDModernRemoteMessageTransport initWithAccountRegistry:rapportTransport:idsTransport:contextManager:systemDateProvider:idsDateProvider:timerProvider:isWatch:](self, "initWithAccountRegistry:rapportTransport:idsTransport:contextManager:systemDateProvider:idsDateProvider:timerProvider:isWatch:", v10, v9, v8, v13, v12, v11, v14, v17);

  return v15;
}

- (HMDModernRemoteMessageTransport)initWithAccountRegistry:(id)a3 rapportTransport:(id)a4 idsTransport:(id)a5 contextManager:(id)a6 systemDateProvider:(id)a7 idsDateProvider:(id)a8 timerProvider:(id)a9 isWatch:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HMDModernRemoteMessageTransport *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  const char *v32;
  dispatch_queue_t v33;
  OS_dispatch_queue *workQueue;
  uint64_t v35;
  NSMutableOrderedSet *messageIDDedupeBuffer;
  id v38;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v16 = a4;
  v40 = a5;
  v17 = a5;
  v41 = a6;
  v18 = a6;
  v42 = a7;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v43.receiver = self;
  v43.super_class = (Class)HMDModernRemoteMessageTransport;
  v22 = -[HMDRemoteMessageTransport initWithAccountRegistry:](&v43, sel_initWithAccountRegistry_, a3);
  if (v22)
  {
    HMDispatchQueueNameString();
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38 = a8;
    v24 = v18;
    v25 = v16;
    v26 = objc_msgSend(v23, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = v21;
    v28 = v20;
    v29 = v19;
    v30 = v17;
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (const char *)v26;
    v16 = v25;
    v18 = v24;
    v33 = dispatch_queue_create(v32, v31);
    workQueue = v22->_workQueue;
    v22->_workQueue = (OS_dispatch_queue *)v33;

    v17 = v30;
    v19 = v29;
    v20 = v28;
    v21 = v27;

    objc_storeStrong((id *)&v22->_rapportTransport, a4);
    -[HMFMessageTransport setDelegate:](v22->_rapportTransport, "setDelegate:", v22);
    -[HMDRemoteMessageTransport setReachabilityDelegate:](v22->_rapportTransport, "setReachabilityDelegate:", v22);
    objc_storeStrong((id *)&v22->_idsTransport, v40);
    -[HMFMessageTransport setDelegate:](v22->_idsTransport, "setDelegate:", v22);
    objc_storeStrong((id *)&v22->_contextManager, v41);
    objc_storeStrong((id *)&v22->_systemDateProvider, v42);
    objc_storeStrong((id *)&v22->_idsDateProvider, v38);
    objc_storeStrong((id *)&v22->_timerProvider, a9);
    v35 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", 100);
    messageIDDedupeBuffer = v22->_messageIDDedupeBuffer;
    v22->_messageIDDedupeBuffer = (NSMutableOrderedSet *)v35;

    v22->_rapportLinkSlow = 0;
    v22->_isWatch = a10;
    v22->_isHMModernMessagingInstance = 0;
    v22->_isHMModernMessagingEnergyInstance = 0;
  }

  return v22;
}

- (BOOL)isSecure
{
  return 1;
}

- (int64_t)qualityOfService
{
  return 1;
}

- (id)start
{
  void *v3;
  HMDModernRemoteMessageTransport *v4;
  NSObject *v5;
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
  _QWORD v18[2];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDModernRemoteMessageTransport rapportTransport](v4, "rapportTransport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDModernRemoteMessageTransport idsTransport](v4, "idsTransport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "start");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDModernRemoteMessageTransport setStarted:](v4, "setStarted:", 1);
  v11 = (void *)MEMORY[0x24BE3F180];
  v18[0] = v8;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "all:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDRemoteMessageTransport startPromise](v4, "startPromise");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ignoreOutcome");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resolveWithFuture:", v15);

  -[HMDRemoteMessageTransport startFuture](v4, "startFuture");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)startHMMM
{
  void *v3;
  HMDModernRemoteMessageTransport *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HMMM", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDModernRemoteMessageTransport rapportTransport](v4, "rapportTransport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "startHMMM");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDModernRemoteMessageTransport idsTransport](v4, "idsTransport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDModernRemoteMessageTransport setStarted:](v4, "setStarted:", 1);
  v13 = (void *)MEMORY[0x24BE3F180];
  v20[0] = v10;
  v20[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "all:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDRemoteMessageTransport startPromise](v4, "startPromise");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ignoreOutcome");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resolveWithFuture:", v17);

  -[HMDRemoteMessageTransport startFuture](v4, "startFuture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)startHMMMEnergy
{
  void *v3;
  HMDModernRemoteMessageTransport *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting Energy HMMM", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDModernRemoteMessageTransport rapportTransport](v4, "rapportTransport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "startHMMMEnergy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDModernRemoteMessageTransport idsTransport](v4, "idsTransport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDModernRemoteMessageTransport setStarted:](v4, "setStarted:", 1);
  v13 = (void *)MEMORY[0x24BE3F180];
  v20[0] = v10;
  v20[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "all:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDRemoteMessageTransport startPromise](v4, "startPromise");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ignoreOutcome");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resolveWithFuture:", v17);

  -[HMDRemoteMessageTransport startFuture](v4, "startFuture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)canSendMessage:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "restriction") != -1 && (objc_msgSend(v4, "restriction") & 0x10) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[HMDModernRemoteMessageTransport rapportTransport](self, "rapportTransport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isValidMessage:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[HMDModernRemoteMessageTransport idsTransport](self, "idsTransport");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isValidMessage:", v4);

    }
  }

  return v6;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  HMDModernRemoteMessageTransport *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    if (!-[HMDModernRemoteMessageTransport isStarted](self, "isStarted"))
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v14;
        v23 = 2114;
        v24 = v15;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Received request to send message %{public}@ before transport was started; message may fail",
          buf,
          0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }
    -[HMDModernRemoteMessageTransport workQueue](self, "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__HMDModernRemoteMessageTransport_sendMessage_completionHandler___block_invoke;
    block[3] = &unk_24E79B440;
    block[4] = self;
    v19 = v10;
    v20 = v7;
    dispatch_async(v16, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter"), CFSTR("Not a remote message"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDModernRemoteMessageTransport _respondWithError:completionHandler:error:]((uint64_t)self, v8, v7, v17);

  }
}

- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDModernRemoteMessageTransport workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HMDModernRemoteMessageTransport_messageTransport_didReceiveMessage___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)transport:(id)a3 idsIdentifier:(id)a4 didAppearReachable:(BOOL)a5
{
  id v6;
  id v7;

  if (a5)
  {
    v6 = a4;
    -[HMDRemoteMessageTransport reachabilityDelegate](self, "reachabilityDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transport:idsIdentifier:didAppearReachable:", self, v6, 1);

  }
}

- (void)configureWithHomeMembershipVerifier:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDModernRemoteMessageTransport;
  v4 = a3;
  -[HMDRemoteMessageTransport configureWithHomeMembershipVerifier:](&v5, sel_configureWithHomeMembershipVerifier_, v4);
  -[HMDRemoteMessageTransport configureWithHomeMembershipVerifier:](self->_rapportTransport, "configureWithHomeMembershipVerifier:", v4, v5.receiver, v5.super_class);
  -[HMDRemoteMessageTransport configureWithHomeMembershipVerifier:](self->_idsTransport, "configureWithHomeMembershipVerifier:", v4);

}

- (void)configureWithRemoteMessageListener:(id)a3
{
  HMDRemoteMessageTransport *v4;
  HMDRemoteMessageTransport *v5;
  HMDRemoteMessageTransport *v6;
  id v7;

  v7 = a3;
  v4 = self->_rapportTransport;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    -[HMDRemoteMessageTransport setRemoteMessageListener:](v6, "setRemoteMessageListener:", v7);

}

- (BOOL)isHMModernMessagingInstance
{
  return self->_isHMModernMessagingInstance;
}

- (void)setIsHMModernMessagingInstance:(BOOL)a3
{
  self->_isHMModernMessagingInstance = a3;
}

- (BOOL)isHMModernMessagingEnergyInstance
{
  return self->_isHMModernMessagingEnergyInstance;
}

- (void)setIsHMModernMessagingEnergyInstance:(BOOL)a3
{
  self->_isHMModernMessagingEnergyInstance = a3;
}

- (HMDDeviceResidencyProvider)residencyProvider
{
  return (HMDDeviceResidencyProvider *)objc_loadWeakRetained((id *)&self->_residencyProvider);
}

- (void)setResidencyProvider:(id)a3
{
  objc_storeWeak((id *)&self->_residencyProvider, a3);
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDRemoteMessageTransport)rapportTransport
{
  return self->_rapportTransport;
}

- (HMDRemoteMessageTransport)idsTransport
{
  return self->_idsTransport;
}

- (HMDModernTransportMessageContextManager)contextManager
{
  return self->_contextManager;
}

- (HMDDateProvider)systemDateProvider
{
  return self->_systemDateProvider;
}

- (HMDDateProvider)idsDateProvider
{
  return self->_idsDateProvider;
}

- (HMDTimerProvider)timerProvider
{
  return self->_timerProvider;
}

- (NSMutableOrderedSet)messageIDDedupeBuffer
{
  return self->_messageIDDedupeBuffer;
}

- (BOOL)isRapportLinkSlow
{
  return self->_rapportLinkSlow;
}

- (void)setRapportLinkSlow:(BOOL)a3
{
  self->_rapportLinkSlow = a3;
}

- (BOOL)isWatch
{
  return self->_isWatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIDDedupeBuffer, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_idsDateProvider, 0);
  objc_storeStrong((id *)&self->_systemDateProvider, 0);
  objc_storeStrong((id *)&self->_contextManager, 0);
  objc_storeStrong((id *)&self->_idsTransport, 0);
  objc_storeStrong((id *)&self->_rapportTransport, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_residencyProvider);
}

void __70__HMDModernRemoteMessageTransport_messageTransport_didReceiveMessage___block_invoke(void **a1)
{
  -[HMDModernRemoteMessageTransport _receivedMessage:onTransport:](a1[4], a1[5], a1[6]);
}

- (void)_receivedMessage:(void *)a3 onTransport:
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  HMDAssertionLogEvent *v11;
  HMDAssertionLogEvent *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  HMDAssertionLogEvent *v35;
  uint64_t v36;
  HMDAssertionLogEvent *v37;
  void *v38;
  void *v39;
  HMDAssertionLogEvent *v40;
  void *v41;
  int v42;
  HMDAssertionLogEvent *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  HMDAssertionLogEvent *v55;
  void *v56;
  void *v57;
  HMDAssertionLogEvent *v58;
  void *v59;
  int v60;
  void *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  HMDAssertionLogEvent *v71;
  HMDAssertionLogEvent *v72;
  HMDAssertionLogEvent *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *v78;
  void *v79;
  void *v80;
  HMDAssertionLogEvent *v81;
  HMDAssertionLogEvent *v82;
  HMDAssertionLogEvent *v83;
  void *v84;
  id v85;
  HMDAssertionLogEvent *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  HMDAssertionLogEvent *v97;
  void *v98;
  id v99;
  NSObject *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  NSObject *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  HMDAssertionLogEvent *v131;
  HMDAssertionLogEvent *v132;
  id v133;
  void *v134;
  char isKindOfClass;
  void *v136;
  id v137;
  NSObject *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  HMDAssertionLogEvent *v144;
  HMDAssertionLogEvent *v145;
  HMDAssertionLogEvent *v146;
  HMDAssertionLogEvent *v147;
  void *v148;
  id v149;
  NSObject *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  NSObject *v163;
  void *v164;
  void *v165;
  id v166;
  HMDAssertionLogEvent *v167;
  HMDAssertionLogEvent *v168;
  void *v169;
  HMDAssertionLogEvent *v170;
  HMDAssertionLogEvent *v171;
  void *v172;
  void *v173;
  id v174;
  id v175;
  id v176;
  void *v177;
  id location;
  _BYTE buf[24];
  HMDAssertionLogEvent *v180;
  _BYTE v181[32];
  id v182;
  __int16 v183;
  _BYTE v184[22];
  uint64_t v185;

  v185 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v177 = v10;
    if (!v10)
    {
      v161 = (void *)MEMORY[0x227676638]();
      v162 = a1;
      HMFGetOSLogHandle();
      v163 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v163, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v164;
        _os_log_impl(&dword_2218F0000, v163, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Received message that is not HMDRemoteMessage.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v161);
      v11 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Received message that is not HMDRemoteMessage."));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v12 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
      -[HMDAssertionLogEvent submitLogEvent:](v12, "submitLogEvent:", v11);
      goto LABEL_50;
    }
    v11 = (HMDAssertionLogEvent *)v8;
    v12 = (HMDAssertionLogEvent *)v6;
    -[HMDAssertionLogEvent headers](v11, "headers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "timeToLiveHeaderKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hmf_numberForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    if (*(double *)&v17 >= 2.22044605e-16)
    {
      objc_msgSend((id)objc_opt_class(), "requestStartTimeHeaderKey");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hmf_numberForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      objc_msgSend(a1, "idsDateProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSince1970");
      v24 = v23;

      v25 = vabdd_f64(v24, v21);
      if (v25 >= *(double *)&v17)
      {
        objc_msgSend(a1, "systemDateProvider");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timeIntervalSince1970");
        v28 = v27;

        if (vabdd_f64(v28, v21) >= *(double *)&v17)
        {
          v29 = (void *)MEMORY[0x227676638]();
          v30 = a1;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v174 = v5;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDAssertionLogEvent identifier](v11, "identifier");
            v33 = v6;
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDModernRemoteMessageTransport _transportToString:](v30, v12);
            v35 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138545410;
            *(_QWORD *)&buf[4] = v32;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v34;
            *(_WORD *)&buf[22] = 2114;
            v180 = v35;
            *(_WORD *)v181 = 2050;
            *(double *)&v181[2] = v24;
            *(_WORD *)&v181[10] = 2050;
            *(double *)&v181[12] = v28;
            *(_WORD *)&v181[20] = 2050;
            *(double *)&v181[22] = v21;
            *(_WORD *)&v181[30] = 2050;
            v182 = v17;
            v183 = 2050;
            *(double *)v184 = v25;
            *(_WORD *)&v184[8] = 2050;
            *(double *)&v184[10] = v24 - v28;
            _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message %{public}@ received on %{public}@ outside its TTL: IDS time now = %{public}f, system time now = %{public}f, sent = %{public}f, ttl = %{public}f, IDS time delta = %{public}f, drift = %{public}f", buf, 0x5Cu);

            v6 = v33;
            v5 = v174;
          }

          objc_autoreleasePoolPop(v29);
          goto LABEL_50;
        }
      }
    }

    -[HMDAssertionLogEvent identifier](v11, "identifier");
    v36 = objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      v49 = v6;
      v50 = (void *)MEMORY[0x227676638]();
      v51 = a1;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDModernRemoteMessageTransport _transportToString:](v51, v12);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v54;
        *(_WORD *)&buf[22] = 2112;
        v180 = v11;
        _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Received invalid %@ message %@, No Identifier", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v50);
      v55 = [HMDAssertionLogEvent alloc];
      -[HMDModernRemoteMessageTransport _transportToString:](v51, v12);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HMDAssertionLogEvent initWithReason:](v55, "initWithReason:", CFSTR("Received invalid %@ message %@, No Identifier"), v56, v11);

      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "submitLogEvent:", v12);

      v11 = 0;
      v6 = v49;
      goto LABEL_50;
    }
    v37 = (HMDAssertionLogEvent *)v36;
    v176 = v6;
    -[HMDAssertionLogEvent destination](v11, "destination");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = v38;
    else
      v39 = 0;
    v40 = v39;

    -[HMDAssertionLogEvent device](v40, "device");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isCurrentDevice");

    if (v42)
    {
      v43 = v40;
      v44 = (void *)MEMORY[0x227676638]();
      v45 = a1;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDModernRemoteMessageTransport _transportToString:](v45, v12);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v48;
        *(_WORD *)&buf[22] = 2112;
        v180 = v11;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_FAULT, "%{public}@Received invalid %{public}@ message %@, message is from ourselves", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v44);
      v12 = v43;
      v11 = v37;
      goto LABEL_49;
    }
    v58 = v37;
    objc_msgSend(a1, "messageIDDedupeBuffer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "containsObject:", v58);

    if ((v60 & 1) == 0)
    {
      objc_msgSend(a1, "messageIDDedupeBuffer");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "count");

      if (v62 >= 0x64)
      {
        objc_msgSend(a1, "messageIDDedupeBuffer");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "removeObjectAtIndex:", 0);

      }
      objc_msgSend(a1, "messageIDDedupeBuffer");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObject:", v58);

    }
    v175 = v5;

    v65 = (void *)MEMORY[0x227676638]();
    v66 = a1;
    HMFGetOSLogHandle();
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = v67;
    if (v60)
    {
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssertionLogEvent identifier](v11, "identifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDModernRemoteMessageTransport _transportToString:](v66, v12);
        v71 = v58;
        v72 = v40;
        v73 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v69;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v70;
        *(_WORD *)&buf[22] = 2114;
        v180 = v73;
        _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@Dropping duplicate message %{public}@ received on %{public}@", buf, 0x20u);

        v40 = v72;
        v58 = v71;

      }
      objc_autoreleasePoolPop(v65);
    }
    else
    {
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDModernRemoteMessageTransport _transportToString:](v66, v12);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v74;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v75;
        *(_WORD *)&buf[22] = 2112;
        v180 = v11;
        _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@Received message over %{public}@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v65);
      v76 = (void *)MEMORY[0x227676638]();
      v77 = v66;
      HMFGetOSLogHandle();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssertionLogEvent shortDescription](v11, "shortDescription");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssertionLogEvent messagePayload](v11, "messagePayload");
        v81 = v58;
        v82 = v40;
        v83 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        *(_QWORD *)&buf[4] = v79;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v80;
        *(_WORD *)&buf[22] = 2113;
        v180 = v83;
        _os_log_impl(&dword_2218F0000, v78, OS_LOG_TYPE_DEBUG, "%{public}@Received message %{public}@ with payload: %{private}@", buf, 0x20u);

        v40 = v82;
        v58 = v81;

      }
      objc_autoreleasePoolPop(v76);
      objc_msgSend(v177, "destination");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDModernRemoteMessageTransport _notifyDeviceReachabilityForDestination:isReachable:](v77, v84, 1);

      if (!objc_msgSend(v177, "type"))
      {
        v103 = v177;
        objc_msgSend(v103, "name");
        v104 = v77;
        v173 = v77;
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "identifier");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "destination");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "transactionIdentifier");
        v171 = v40;
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "toID");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = objc_msgSend(v103, "qualityOfService");
        v111 = objc_msgSend(v103, "responseRestriction");

        objc_initWeak(&location, v104);
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __69__HMDModernRemoteMessageTransport__responseHandlerForRequestMessage___block_invoke;
        v180 = (HMDAssertionLogEvent *)&unk_24E78BD20;
        objc_copyWeak((id *)&v183, &location);
        *(_QWORD *)v181 = v105;
        *(_QWORD *)&v181[8] = v107;
        *(_QWORD *)&v184[6] = v110;
        *(_QWORD *)&v184[14] = v111;
        *(_QWORD *)&v181[16] = v108;
        *(_QWORD *)&v181[24] = v109;
        v182 = v106;
        v112 = v106;
        v113 = v109;
        v114 = v108;
        v115 = v107;
        v116 = v105;
        v117 = _Block_copy(buf);

        objc_destroyWeak((id *)&v183);
        objc_destroyWeak(&location);
        objc_msgSend(v103, "setInternalResponseHandler:", v117);

        objc_msgSend(v173, "delegate");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "messageTransport:didReceiveMessage:", v173, v103);

        v12 = v171;
LABEL_48:
        v11 = v58;
        v5 = v175;
LABEL_49:
        v6 = v176;
LABEL_50:

        goto LABEL_51;
      }
      if (objc_msgSend(v177, "type") == 1)
      {
        v172 = v77;
        v85 = v177;
        v86 = v12;
        objc_msgSend(v85, "transactionIdentifier");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v175;
        v170 = v40;
        if (v87)
        {
          objc_msgSend(v172, "contextManager");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "contextForIdentifier:", v87);
          v89 = (void *)objc_claimAutoreleasedReturnValue();

          v169 = v89;
          if (v89)
          {
            v166 = v85;
            v167 = v58;
            v90 = v85;
            objc_msgSend(v90, "userInfo");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("kIDSMessageResponseErrorDataKey"));
            v92 = (void *)objc_claimAutoreleasedReturnValue();

            v168 = v86;
            if (v92)
            {
              v93 = v87;
              v94 = (void *)MEMORY[0x24BDD1620];
              objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              location = 0;
              objc_msgSend(v94, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v95, v92, &location);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = (HMDAssertionLogEvent *)location;

              if (!v96)
              {
                v98 = (void *)MEMORY[0x227676638]();
                v99 = v172;
                HMFGetOSLogHandle();
                v100 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "identifier");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v101;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v102;
                  *(_WORD *)&buf[22] = 2112;
                  v180 = v97;
                  _os_log_impl(&dword_2218F0000, v100, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize response error for message %{public}@ with error: %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v98);
                objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 52, CFSTR("Generic error."), CFSTR("Failed to deserialize remote error."), 0, v97);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = v169;
              }

              v87 = v93;
            }
            else
            {
              v96 = 0;
            }

            v131 = (HMDAssertionLogEvent *)v90;
            v132 = v96;
            v133 = v89;
            if (-[HMDAssertionLogEvent isHMFError](v132, "isHMFError")
              && -[HMDAssertionLogEvent code](v132, "code") == 14
              && (objc_msgSend(v133, "destination"),
                  v134 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  isKindOfClass = objc_opt_isKindOfClass(),
                  v134,
                  (isKindOfClass & 1) != 0)
              && v134)
            {
              v136 = (void *)MEMORY[0x227676638]();
              v137 = v172;
              HMFGetOSLogHandle();
              v138 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDAssertionLogEvent identifier](v131, "identifier");
                v140 = v87;
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v133, "messageID");
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                *(_QWORD *)&buf[4] = v139;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v141;
                *(_WORD *)&buf[22] = 2112;
                v180 = v132;
                *(_WORD *)v181 = 2114;
                *(_QWORD *)&v181[2] = v142;
                _os_log_impl(&dword_2218F0000, v138, OS_LOG_TYPE_INFO, "%{public}@Ignoring response message %{public}@ with error: %@, for request %{public}@", buf, 0x2Au);

                v87 = v140;
              }

              objc_autoreleasePoolPop(v136);
              v143 = v132;
            }
            else
            {
              v165 = v87;

              v144 = v168;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v145 = v144;
              else
                v145 = 0;
              v146 = v145;

              v147 = v146;
              v148 = (void *)MEMORY[0x227676638](objc_msgSend(v133, "receivedResponseOverTransport:withError:", v146, v132));
              v149 = v172;
              HMFGetOSLogHandle();
              v150 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v133, "messageID");
                v152 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v151;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v152;
                _os_log_impl(&dword_2218F0000, v150, OS_LOG_TYPE_DEFAULT, "%{public}@Received response for message %{public}@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v148);
              v153 = (void *)MEMORY[0x24BDBCED8];
              -[HMDAssertionLogEvent messagePayload](v131, "messagePayload");
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v153, "dictionaryWithDictionary:", v154);
              v143 = (void *)objc_claimAutoreleasedReturnValue();

              -[HMDAssertionLogEvent userInfo](v131, "userInfo");
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v155, "objectForKeyedSubscript:", CFSTR("kIDSMessageSourceIDKey"));
              v156 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v143, "setObject:forKeyedSubscript:", v156, CFSTR("kIDSMessageSourceIDKey"));

              objc_msgSend(v143, "setObject:forKeyedSubscript:", v132, CFSTR("kIDSMessageResponseErrorDataKey"));
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[HMDAssertionLogEvent transportType](v147, "transportType"));
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v143, "setObject:forKeyedSubscript:", v157, CFSTR("kRemoteMessageTransportAttributionKey"));

              objc_msgSend(v143, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kRemoteMessageIsModernTransportUsedKey"));
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v149, "isRapportLinkSlow"));
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v143, "setObject:forKeyedSubscript:", v158, CFSTR("kRemoteMessageIsRapportLinkSlowKey"));

              objc_msgSend(v149, "contextManager");
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v133, "options");
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v159, "completeContext:withPayload:error:isFinal:", v133, v143, v132, objc_msgSend(v160, "expectsMultipleResponses") ^ 1);

              v133 = v159;
              v131 = v147;
              v87 = v165;
            }

            v5 = v175;
            v6 = v176;
            v12 = v170;
            v85 = v166;
            v58 = v167;
            v86 = v168;
          }
          else
          {
            v125 = (void *)MEMORY[0x227676638]();
            v126 = v172;
            HMFGetOSLogHandle();
            v127 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "identifier");
              v129 = v87;
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v128;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v130;
              _os_log_impl(&dword_2218F0000, v127, OS_LOG_TYPE_INFO, "%{public}@Could not find the context and dropping message %{public}@", buf, 0x16u);

              v87 = v129;
            }

            objc_autoreleasePoolPop(v125);
            v6 = v176;
            v12 = v170;
          }

        }
        else
        {
          v120 = (void *)MEMORY[0x227676638]();
          v121 = v172;
          HMFGetOSLogHandle();
          v122 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "identifier");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v123;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v124;
            _os_log_impl(&dword_2218F0000, v122, OS_LOG_TYPE_ERROR, "%{public}@Received a response message %{public}@ without a transaction identifier", buf, 0x16u);

            v87 = 0;
          }

          objc_autoreleasePoolPop(v120);
          v6 = v176;
          v12 = v170;
        }

        v11 = v58;
        goto LABEL_50;
      }
      objc_msgSend(v77, "delegate");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "messageTransport:didReceiveMessage:", v77, v177);

    }
    v12 = v40;
    goto LABEL_48;
  }
LABEL_51:

}

- (const)_transportToString:(void *)a1
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDAssertionLogEvent *v10;
  void *v11;
  const __CFString *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1, "rapportTransport");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    v12 = CFSTR("Rapport");
  }
  else
  {
    objc_msgSend(a1, "idsTransport");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v3)
    {
      v12 = CFSTR("IDS");
    }
    else
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = a1;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v9;
        v16 = 2112;
        v17 = objc_opt_class();
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Unexpected transport class: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      v10 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Unexpected transport class: %@"), objc_opt_class());
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "submitLogEvent:", v10);

      v12 = CFSTR("Unknown");
    }
  }

  return v12;
}

- (void)_notifyDeviceReachabilityForDestination:(uint64_t)a3 isReachable:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "device");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Reachability update - isReachable: %@, device: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "reachabilityDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "idsIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transport:idsIdentifier:didAppearReachable:", v9, v16, a3);

  }
}

void __69__HMDModernRemoteMessageTransport__responseHandlerForRequestMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  HMDRemoteMessage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), v6, 1, 1, 0.0, *(_QWORD *)(a1 + 88));
  -[HMDRemoteMessage setTransactionIdentifier:](v8, "setTransactionIdentifier:", *(_QWORD *)(a1 + 48));
  -[HMDRemoteMessage setToID:](v8, "setToID:", *(_QWORD *)(a1 + 56));
  -[HMDRemoteMessage userInfo](v8, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("kIDSMessageResponseErrorDataKey"));

  }
  -[HMDRemoteMessage internal](v8, "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserInfo:", v10);

  v13 = (void *)MEMORY[0x227676638]();
  v14 = WeakRetained;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 64);
    -[HMFObject shortDescription](v8, "shortDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v16;
    v21 = 2114;
    v22 = v17;
    v23 = 2114;
    v24 = v18;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Sending response for message %{public}@ using message: %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  objc_msgSend(v14, "sendMessage:completionHandler:", v8, 0);

}

- (void)_respondWithError:(void *)a3 completionHandler:(void *)a4 error:
{
  void (**v7)(id, id);
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if (v7)
      v7[2](v7, v8);
    objc_msgSend(v9, "respondWithError:", v8);
  }

}

void __65__HMDModernRemoteMessageTransport_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  id v4;
  const __CFString *v5;
  const __CFString *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  int v84;
  int v85;
  int v86;
  void *v87;
  _QWORD *v88;
  NSObject *v89;
  _BOOL4 v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  NSObject *v106;
  void *v107;
  HMDAssertionLogEvent *v108;
  void *v109;
  id v110;
  void *v111;
  int v112;
  id v113;
  id v114;
  id from;
  id location;
  _BYTE buf[24];
  void *v118;
  _BYTE v119[20];
  __int16 v120;
  _QWORD v121[3];

  *(_QWORD *)((char *)&v121[1] + 2) = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v114 = *(id *)(a1 + 40);
  v113 = v2;
  if (v1)
  {
    objc_msgSend(v1, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    if ((objc_msgSend(v1, "isHMModernMessagingInstance") & 1) != 0
      || (objc_msgSend(v1, "isHMModernMessagingEnergyInstance") & 1) != 0)
    {
      LOBYTE(v4) = 0;
      v5 = CFSTR("NO");
    }
    else
    {
      v69 = v114;
      objc_msgSend(v1, "residencyProvider");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "destination");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v72 = v71;
      else
        v72 = 0;
      v73 = v72;

      if (v73 && objc_msgSend(v70, "isCurrentDeviceResident"))
      {
        objc_msgSend(v73, "device");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "deviceAddress");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v4) = objc_msgSend(v70, "deviceAddressBelongsToResidentOfCurrentHome:", v75);

      }
      else
      {
        LODWORD(v4) = 0;
      }

      v79 = objc_msgSend(v69, "restriction");
      v5 = CFSTR("NO");
      if (v79 == -1 && (_DWORD)v4)
      {
        v80 = (void *)MEMORY[0x227676638](objc_msgSend(v69, "setRestriction:", 8));
        v4 = v1;
        HMFGetOSLogHandle();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v82;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v69;
          _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_DEBUG, "%{public}@Restricting resident to resident message %@ to Rapport only", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v80);
        LOBYTE(v4) = 1;
        v5 = CFSTR("YES");
      }
    }
    v6 = v5;
    if ((objc_msgSend(v1, "isWatch") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v1, "rapportTransport");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "canSendMessage:", v114);

    }
    objc_msgSend(v1, "idsTransport");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v9, "canSendMessage:", v114);

    if (((v7 | v112) & 1) != 0)
    {
      v10 = v114;
      objc_msgSend(v10, "responseHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && objc_msgSend(v10, "type"))
      {
        v104 = (void *)MEMORY[0x227676638]();
        v105 = v1;
        HMFGetOSLogHandle();
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v107;
          _os_log_impl(&dword_2218F0000, v106, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Message expects a response but is not a request type. Remove the response handler or change the message type.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v104);
        v108 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Message expects a response but is not a request type. Remove the response handler or change the message type."));
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "submitLogEvent:", v108);

      }
      v12 = v10;
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __141__HMDModernRemoteMessageTransport__createContextWithRemoteMessage_canSendOverRapport_canSendOverIDS_expectsRapportSuccess_completionHandler___block_invoke;
      v118 = &unk_24E78BC80;
      v119[16] = v7;
      *(_QWORD *)v119 = v1;
      v119[17] = v112;
      v110 = v12;
      *(_QWORD *)&v119[8] = v110;
      v119[18] = v4 & v7;
      v13 = v113;
      v14 = +[HMDModernTransportMessageContextOptions newWithBuilder:](HMDModernTransportMessageContextOptions, "newWithBuilder:", buf);
      objc_msgSend(v1, "contextManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "idsDateProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "timerProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "createContextWithMessage:options:completionHandler:dateProvider:timerProvider:", v110, v14, v13, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x227676638]();
      v20 = v1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "isRapportLinkSlow");
          HMFBooleanToString();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          *(_QWORD *)&buf[4] = v23;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v24;
          *(_WORD *)&buf[22] = 2114;
          v118 = v25;
          *(_WORD *)v119 = 2114;
          *(_QWORD *)&v119[2] = v26;
          *(_WORD *)&v119[10] = 2114;
          *(_QWORD *)&v119[12] = v6;
          v120 = 2112;
          v121[0] = v110;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Sending message over Rapport = %{public}@ (isSlow = %{public}@), IDS = %{public}@, Resident to Resident = %{public}@: %@", buf, 0x3Eu);

        }
        objc_autoreleasePoolPop(v19);
        v27 = (void *)MEMORY[0x227676638]();
        v28 = v20;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "shortDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "messagePayload");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543875;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2113;
          v118 = v32;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Sending message %{public}@ with payload: %{private}@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v27);
        v33 = v18;
        if (objc_msgSend(v33, "expectsResponse"))
        {
          v34 = (void *)MEMORY[0x227676638]();
          v35 = v28;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "messageID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "timeout");
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v37;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v38;
            *(_WORD *)&buf[22] = 2048;
            v118 = v39;
            _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Starting response timer for message %{public}@. Timeout is %.0f seconds", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v34);
          objc_initWeak(&location, v35);
          objc_msgSend(v33, "timeout");
          v41 = v40;
          objc_msgSend(v35, "workQueue");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __65__HMDModernRemoteMessageTransport__startResponseTimerForContext___block_invoke;
          v118 = &unk_24E7972B0;
          objc_copyWeak((id *)&v119[8], &location);
          *(_QWORD *)v119 = v33;
          objc_msgSend(*(id *)v119, "startResponseTimerWithTimeInterval:queue:completionHandler:", v42, buf, v41);

          objc_destroyWeak((id *)&v119[8]);
          objc_destroyWeak(&location);
        }

        if (v7)
        {
          v33 = v33;
          v43 = (void *)MEMORY[0x227676638]();
          v44 = v28;
          HMFGetOSLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "messageID");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v46;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v47;
            _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ over Rapport", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v43);
          objc_msgSend(v33, "remainingTransports");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "count") == 1;

          v50 = 15.0;
          if (v49)
          {
            objc_msgSend(v33, "timeoutRemaining");
            if (v51 <= 0.0)
              v50 = 15.0;
            else
              v50 = v51;
          }
          objc_msgSend(v44, "systemDateProvider", v110);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "timeIntervalSince1970");
          v54 = v53;

          objc_msgSend(v44, "rapportTransport");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "startSendingOverTransport:", v55);

          objc_initWeak(&location, v44);
          objc_initWeak(&from, v33);
          objc_msgSend(v33, "identifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __59__HMDModernRemoteMessageTransport__sendMessageOverRapport___block_invoke;
          v118 = &unk_24E78BCD0;
          objc_copyWeak((id *)&v119[8], &location);
          objc_copyWeak((id *)&v119[16], &from);
          v57 = v56;
          *(_QWORD *)v119 = v57;
          *(_QWORD *)((char *)v121 + 2) = v54;
          v58 = _Block_copy(buf);
          objc_msgSend(v44, "rapportTransport");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v60 = v59;
          else
            v60 = 0;
          v61 = v60;

          if (objc_msgSend(v44, "isHMModernMessagingInstance"))
          {
            objc_msgSend(v33, "preparedMessageWithTimeout:", v50);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "sendHMMMMessage:completionHandler:", v62, v58);
          }
          else if (objc_msgSend(v44, "isHMModernMessagingEnergyInstance"))
          {
            objc_msgSend(v33, "preparedMessageWithTimeout:", v50);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "sendHMMMEnergyMessage:completionHandler:", v62, v58);
          }
          else
          {
            v83 = (void *)v44[12];
            objc_msgSend(v33, "preparedMessageWithTimeout:", v50);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "sendMessage:completionHandler:", v62, v58);
          }

          objc_destroyWeak((id *)&v119[16]);
          objc_destroyWeak((id *)&v119[8]);

          objc_destroyWeak(&from);
          objc_destroyWeak(&location);

          if ((v112 & 1) != 0)
          {
            v84 = objc_msgSend(v44, "isRapportLinkSlow");
            v85 = objc_msgSend(v111, "remoteDisallowsIDSRacing");
            v86 = v85;
            if (v84)
            {
              v87 = (void *)MEMORY[0x227676638]();
              v88 = v44;
              HMFGetOSLogHandle();
              v89 = objc_claimAutoreleasedReturnValue();
              v90 = os_log_type_enabled(v89, OS_LOG_TYPE_INFO);
              if (v86)
              {
                if (v90)
                {
                  HMFGetLogIdentifier();
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v111, "identifier");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v91;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v92;
                  _os_log_impl(&dword_2218F0000, v89, OS_LOG_TYPE_INFO, "%{public}@Not sending message %{public}@ over IDS initially even though Rapport link is slow because message disallows IDS racing", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v87);
              }
              else
              {
                if (v90)
                {
                  HMFGetLogIdentifier();
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v111, "identifier");
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v102;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v103;
                  _os_log_impl(&dword_2218F0000, v89, OS_LOG_TYPE_INFO, "%{public}@Also sending message %{public}@ over IDS because Rapport link is slow", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v87);
                -[HMDModernRemoteMessageTransport _sendMessageOverIDS:](v88, v33);
              }
            }
            else if (v85)
            {
              v93 = (void *)MEMORY[0x227676638]();
              v94 = v44;
              HMFGetOSLogHandle();
              v95 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v111, "identifier");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v96;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v97;
                _os_log_impl(&dword_2218F0000, v95, OS_LOG_TYPE_INFO, "%{public}@Not starting fallback timer for message %{public}@ because message disallows IDS racing", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v93);
            }
            else
            {
              v33 = v33;
              objc_msgSend(v33, "inProgressTransports");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "rapportTransport");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = objc_msgSend(v98, "containsObject:", v99);

              if (v100)
              {
                objc_initWeak(&location, v44);
                objc_msgSend(v44, "workQueue");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)buf = MEMORY[0x24BDAC760];
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = __65__HMDModernRemoteMessageTransport__startFallbackTimerForContext___block_invoke;
                v118 = &unk_24E7972B0;
                objc_copyWeak((id *)&v119[8], &location);
                *(_QWORD *)v119 = v33;
                objc_msgSend(*(id *)v119, "startTransportFallbackTimerWithTimeInterval:queue:completionHandler:", v101, buf, 0.2);

                objc_destroyWeak((id *)&v119[8]);
                objc_destroyWeak(&location);
              }

            }
          }
        }
        else if (v112)
        {
          -[HMDModernRemoteMessageTransport _sendMessageOverIDS:](v28, v33);
        }
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "identifier");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v76;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v77;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create context for message %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDModernRemoteMessageTransport _respondWithError:completionHandler:error:]((uint64_t)v20, v110, v13, v78);

        v33 = 0;
      }
    }
    else
    {
      v63 = (void *)MEMORY[0x227676638]();
      v64 = v1;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v66;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v114;
        _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_ERROR, "%{public}@Message %@ cannot be sent over modern transport", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v63);
      v67 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2031);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Cannot be sent over Modern Transport"), CFSTR("Not support by Modern Transport or there is no available transport"), 0, v33);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDModernRemoteMessageTransport _respondWithError:completionHandler:error:]((uint64_t)v64, v114, v113, v68);

    }
  }

}

- (void)_sendMessageOverIDS:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v7;
    v30 = 2114;
    v31 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ over IDS", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "timeoutRemaining");
  v10 = v9;
  objc_msgSend(v5, "idsTransport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startSendingOverTransport:", v11);

  if (v10 >= 0.0)
  {
    if (v10 <= 0.0)
      v10 = 120.0;
    objc_initWeak((id *)buf, v5);
    objc_initWeak(&location, v3);
    objc_msgSend(v3, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsTransport");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preparedMessageWithTimeout:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __55__HMDModernRemoteMessageTransport__sendMessageOverIDS___block_invoke;
    v23[3] = &unk_24E78BCF8;
    objc_copyWeak(&v25, (id *)buf);
    objc_copyWeak(&v26, &location);
    v22 = v19;
    v24 = v22;
    objc_msgSend(v20, "sendMessage:completionHandler:", v21, v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);

    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v5;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "messageID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      v30 = 2114;
      v31 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot send message %{public}@ over IDS because we exceeded the message timeout", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 8, CFSTR("Message timed out"), CFSTR("Message already expired before being able to send"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "idsTransport");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDModernRemoteMessageTransport _handleCompletionOnTransport:context:error:](v13, v18, v3, v17);

  }
}

void __65__HMDModernRemoteMessageTransport__startFallbackTimerForContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    objc_msgSend(*(id *)(a1 + 32), "inProgressTransports");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rapportTransport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if (v7)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = v3;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "messageID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v11;
        v15 = 2114;
        v16 = v12;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Rapport is slow, falling back to IDS for message %{public}@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[HMDModernRemoteMessageTransport _sendOverRemainingTransportForContext:](v9, *(void **)(a1 + 32));
    }
  }

}

- (BOOL)_sendOverRemainingTransportForContext:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDAssertionLogEvent *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "remainingTransports");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "idsTransport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v6)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = a1;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v11;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Remaining transport is not IDS", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      v12 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Remaining transport is not IDS"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "submitLogEvent:", v12);

    }
    -[HMDModernRemoteMessageTransport _sendMessageOverIDS:](a1, v3);
  }

  return v5 != 0;
}

- (void)_handleCompletionOnTransport:(void *)a3 context:(void *)a4 error:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_23;
  objc_msgSend(a1, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend(a1, "contextManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextForIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x227676638]();
  v15 = a1;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "messageID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDModernRemoteMessageTransport _transportToString:](v15, v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138544130;
      v43 = v18;
      v44 = 2114;
      v45 = v19;
      v46 = 2114;
      v47 = v20;
      v48 = 2112;
      v49 = v9;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ over %{public}@ completed with error: %@", (uint8_t *)&v42, 0x2Au);

    }
    objc_autoreleasePoolPop(v14);
    if (!v9)
    {
      objc_msgSend(v8, "completeSendingOverTransport:withError:", v7, 0);
      if ((objc_msgSend(v8, "expectsResponse") & 1) != 0)
        goto LABEL_23;
      v31 = (void *)MEMORY[0x227676638]();
      v32 = v15;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "messageID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138543618;
        v43 = v34;
        v44 = 2114;
        v45 = v35;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully sent message %{public}@ that does not expect a response", (uint8_t *)&v42, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      goto LABEL_22;
    }
    if (objc_msgSend(v9, "code") != 3204)
      objc_msgSend(v8, "completeSendingOverTransport:withError:", v7, v9);
    if ((objc_msgSend(v8, "didSucceedSending") & 1) == 0)
    {
      objc_msgSend(v8, "inProgressTransports");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (!v22 && !-[HMDModernRemoteMessageTransport _sendOverRemainingTransportForContext:](v15, v8))
      {
        if (objc_msgSend(v9, "code") == 3204)
        {
          objc_msgSend(v9, "localizedFailureReason");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x227676638]();
          v25 = v15;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "messageID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 138543874;
            v43 = v27;
            v44 = 2114;
            v45 = v28;
            v46 = 2114;
            v47 = v23;
            _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send multicast message %{public}@ to destination %{public}@", (uint8_t *)&v42, 0x20u);

          }
          objc_autoreleasePoolPop(v24);

          goto LABEL_23;
        }
        v37 = (void *)MEMORY[0x227676638]();
        v38 = v15;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "messageID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 138543874;
          v43 = v40;
          v44 = 2114;
          v45 = v41;
          v46 = 2112;
          v47 = v9;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message %{public}@ with error: %@", (uint8_t *)&v42, 0x20u);

        }
        objc_autoreleasePoolPop(v37);
        if (-[HMDModernRemoteMessageTransport _contextUsesAllTransports:](v38, v8))
          -[HMDModernRemoteMessageTransport _deviceReachabilityForContext:isReachable:](v38, v8, 0);
LABEL_22:
        objc_msgSend(v15, "contextManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "completeContext:withPayload:error:isFinal:", v8, 0, v9, 1);

      }
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543618;
      v43 = v29;
      v44 = 2114;
      v45 = v30;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Context not found for identifier %{public}@", (uint8_t *)&v42, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }
LABEL_23:

}

void __55__HMDModernRemoteMessageTransport__sendMessageOverIDS___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __55__HMDModernRemoteMessageTransport__sendMessageOverIDS___block_invoke_2;
    v7[3] = &unk_24E798328;
    objc_copyWeak(&v10, a1 + 6);
    v7[4] = v5;
    v8 = a1[4];
    v9 = v3;
    dispatch_async(v6, v7);

    objc_destroyWeak(&v10);
  }

}

void __55__HMDModernRemoteMessageTransport__sendMessageOverIDS___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "idsTransport");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDModernRemoteMessageTransport _handleCompletionOnTransport:context:error:](v3, v4, WeakRetained, *(void **)(a1 + 48));

  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Context was already released for identifier %{public}@ completed on IDS transport", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (uint64_t)_contextUsesAllTransports:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  if ((objc_msgSend(a1, "isWatch") & 1) != 0)
    goto LABEL_3;
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rapportTransport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
LABEL_3:
    objc_msgSend(v3, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transports");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "idsTransport");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "containsObject:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_deviceReachabilityForContext:(uint64_t)a3 isReachable:
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a1)
  {
    objc_msgSend(v8, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isTrackingDeviceReachability");

    if (v6)
    {
      if ((objc_msgSend(v8, "didNotifyDeviceReachability") & 1) == 0)
      {
        objc_msgSend(v8, "setDidNotifyDeviceReachability:", 1);
        objc_msgSend(v8, "destination");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDModernRemoteMessageTransport _notifyDeviceReachabilityForDestination:isReachable:](a1, v7, a3);

      }
    }
  }

}

void __59__HMDModernRemoteMessageTransport__sendMessageOverRapport___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10[2];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__HMDModernRemoteMessageTransport__sendMessageOverRapport___block_invoke_2;
    block[3] = &unk_24E78BCA8;
    objc_copyWeak(v10, a1 + 6);
    block[4] = v5;
    v8 = a1[4];
    v9 = v3;
    v10[1] = a1[7];
    dispatch_async(v6, block);

    objc_destroyWeak(v10);
  }

}

void __59__HMDModernRemoteMessageTransport__sendMessageOverRapport___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
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
  void *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v3, "setRapportLinkSlow:", 1);
    }
    else
    {
      objc_msgSend(v3, "systemDateProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSince1970");
      v11 = v10 - *(double *)(a1 + 64);

      v12 = (void *)MEMORY[0x227676638]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "messageID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v15;
        v21 = 2114;
        v22 = v16;
        v23 = 2048;
        v24 = (unint64_t)(v11 * 1000.0);
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Rapport response for message %{public}@ received in %lu ms", (uint8_t *)&v19, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(*(id *)(a1 + 32), "setRapportLinkSlow:", v11 > 0.2);
      -[HMDModernRemoteMessageTransport _deviceReachabilityForContext:isReachable:](*(void **)(a1 + 32), WeakRetained, 1);
    }
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v17, "rapportTransport");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDModernRemoteMessageTransport _handleCompletionOnTransport:context:error:](v17, v18, WeakRetained, *(void **)(a1 + 48));

  }
  else
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 40);
      v19 = 138543618;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Context was already released for identifier %{public}@ completed on Rapport transport", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __65__HMDModernRemoteMessageTransport__startResponseTimerForContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    v5 = (void *)MEMORY[0x227676638]();
    v6 = v3;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "messageID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Message %{public}@ timed out", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "contextManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 8, CFSTR("Operation timed out."), CFSTR("Message timed out waiting for a response."), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "completeContext:withPayload:error:isFinal:", v11, 0, v12, 1);

    objc_msgSend(*(id *)(a1 + 32), "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v13, "expectsMultipleResponses");

    if ((v11 & 1) == 0)
      -[HMDModernRemoteMessageTransport _deviceReachabilityForContext:isReachable:](v6, *(void **)(a1 + 32), 0);
  }

}

void __141__HMDModernRemoteMessageTransport__createContextWithRemoteMessage_canSendOverRapport_canSendOverIDS_expectsRapportSuccess_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "rapportTransport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(*(id *)(a1 + 32), "idsTransport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  objc_msgSend(v3, "setTransports:", v4);
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(*(id *)(a1 + 40), "timeout");
    v10 = v9;

    if (v10 < 2.22044605e-16)
    {
      v11 = (void *)MEMORY[0x227676638](objc_msgSend(v3, "setTimeoutOverride:", 60.0));
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "timeoutOverride");
        v40 = 138543874;
        v41 = v14;
        v42 = 2114;
        v43 = v15;
        v44 = 2048;
        v45 = v16;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Message %{public}@ expects a response but timeout is not set. Setting timeout to %.0f seconds", (uint8_t *)&v40, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
    }
  }
  if (*(_QWORD *)(a1 + 32))
    v17 = ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "sendOptions") >> 1) & 1;
  else
    v17 = 0;
  objc_msgSend(v3, "setExpectsMultipleResponses:", v17);
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  if (v18)
  {
    if ((objc_msgSend((id)v18, "isHMModernMessagingInstance") & 1) == 0
      && (objc_msgSend((id)v18, "isHMModernMessagingEnergyInstance") & 1) == 0)
    {
      objc_msgSend(v19, "destination");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend((id)v18, "rapportTransport");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "isValidMessage:", v19) & 1) != 0)
        {
          objc_msgSend((id)v18, "idsTransport");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isValidMessage:", v19);

          if ((v24 & 1) != 0)
          {
            v18 = 1;
            goto LABEL_24;
          }
        }
        else
        {

        }
        v25 = (void *)MEMORY[0x227676638]();
        v26 = (id)v18;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 138543618;
          v41 = v28;
          v42 = 2112;
          v43 = v19;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Not tracking reachability for restricted message: %@", (uint8_t *)&v40, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
      }
    }
    v18 = 0;
  }
LABEL_24:

  objc_msgSend(v3, "setTrackingDeviceReachability:", v18);
  v30 = *(_QWORD *)(a1 + 32);
  v29 = *(void **)(a1 + 40);
  objc_msgSend(v3, "timeoutOverride");
  v32 = v31;
  v33 = v29;
  v34 = v33;
  v35 = 0.0;
  if (v30 && objc_msgSend(v33, "type") != 1 && (objc_msgSend(v34, "sendOptions") & 1) == 0)
  {
    if (v32 < 2.22044605e-16)
    {
      objc_msgSend(v34, "timeout");
      v32 = v36;
    }
    v37 = 15.0;
    if (v32 >= 15.0)
      v37 = v32;
    if (v32 >= 2.22044605e-16)
      v35 = v37;
    else
      v35 = 60.0;
  }

  objc_msgSend(v3, "setTimeToLive:", v35);
  objc_msgSend((id)objc_opt_class(), "requestStartTimeHeaderKey");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestStartTimeHeaderKey:", v38);

  objc_msgSend((id)objc_opt_class(), "timeToLiveHeaderKey");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeToLiveHeaderKey:", v39);

  objc_msgSend(v3, "setExpectRapportSuccess:", *(unsigned __int8 *)(a1 + 50));
}

+ (NSString)requestStartTimeHeaderKey
{
  return (NSString *)CFSTR("hmd_mrmrst");
}

+ (NSString)timeToLiveHeaderKey
{
  return (NSString *)CFSTR("hmd_mrmttl");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t57 != -1)
    dispatch_once(&logCategory__hmf_once_t57, &__block_literal_global_169086);
  return (id)logCategory__hmf_once_v58;
}

void __46__HMDModernRemoteMessageTransport_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v58;
  logCategory__hmf_once_v58 = v0;

}

@end
