@implementation HMDMessageDispatcher

- (id)filterClasses
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[10];

  v7[9] = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)HMDMessageDispatcher;
  -[HMFMessageDispatcher filterClasses](&v6, sel_filterClasses);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  v7[5] = objc_opt_class();
  v7[6] = objc_opt_class();
  v7[7] = objc_opt_class();
  v7[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)dispatchMessage:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  char v16;
  id v17;
  id v18;
  objc_super v19;
  _QWORD v20[5];
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  _QWORD *v24;
  char v25;
  char v26;
  _QWORD v27[4];
  char v28;
  id v29;

  v4 = a3;
  -[HMDMessageDispatcher messageFilterChain](self, "messageFilterChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v6 = objc_msgSend(v5, "acceptMessage:error:", v4, &v29);
  v7 = v29;

  objc_msgSend(v4, "responseHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "isRemote");
      v13 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      v16 = objc_msgSend(v15, "isSecure");
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x2810000000;
      v27[3] = &unk_22282991F;
      v28 = 0;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __40__HMDMessageDispatcher_dispatchMessage___block_invoke;
      v20[3] = &unk_24E783FC0;
      v24 = v27;
      v20[4] = self;
      v17 = v10;
      v21 = v17;
      v18 = v11;
      v22 = v18;
      v25 = v12;
      v26 = v16;
      v23 = v9;
      objc_msgSend(v13, "setResponseHandler:", v20);

      _Block_object_dispose(v27, 8);
    }
    v19.receiver = self;
    v19.super_class = (Class)HMDMessageDispatcher;
    -[HMFMessageDispatcher dispatchMessage:](&v19, sel_dispatchMessage_, v4);
    goto LABEL_10;
  }

  if (v9)
  {
    objc_msgSend(v4, "responseHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v9)[2](v9, v7, 0);
LABEL_10:

  }
}

void __40__HMDMessageDispatcher_dispatchMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(1u, v7));
  if ((v8 & 1) == 0)
  {
    v9 = v5;
    v10 = v9;
    if (!v9)
      goto LABEL_17;
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE3EBB0]))
    {
      v12 = objc_msgSend(v10, "code");

      if (v12 != 14)
        goto LABEL_17;
      if (*(_BYTE *)(a1 + 72))
      {
        if (!*(_BYTE *)(a1 + 73))
        {
          v13 = (void *)MEMORY[0x227676638]();
          v14 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = *(_QWORD *)(a1 + 40);
            v18 = *(_QWORD *)(a1 + 48);
            v28 = 138543874;
            v29 = v16;
            v30 = 2112;
            v31 = v17;
            v32 = 2112;
            v33 = v18;
            _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping unhandled remote message as it is not secure: %@ (%@)", (uint8_t *)&v28, 0x20u);

          }
          objc_autoreleasePoolPop(v13);
          goto LABEL_18;
        }
LABEL_17:
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_18:

        goto LABEL_19;
      }
      v25 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v10, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", v11, 2, v26);
      v27 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v27;
    }

    goto LABEL_17;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(_QWORD *)(a1 + 48);
    v28 = 138543874;
    v29 = v22;
    v30 = 2112;
    v31 = v23;
    v32 = 2112;
    v33 = v24;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Multiple invocations of response handler for message: %@ (%@)", (uint8_t *)&v28, 0x20u);

  }
  objc_autoreleasePoolPop(v19);
LABEL_19:

}

- (HMDMessageDispatcher)initWithXPCTransport:(id)a3 secureRemoteTransport:(id)a4 messageFilterChain:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDMessageDispatcher *v12;
  HMDMessageDispatcher *v13;
  uint64_t v14;
  NSMutableDictionary *remoteGateways;
  HMDSecureRemoteMessageFilter *v16;
  HMDSecureRemoteMessageFilter *secureRemoteMessageFilter;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMDMessageDispatcher;
  v12 = -[HMFMessageDispatcher initWithTransport:](&v20, sel_initWithTransport_, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_XPCTransport, a3);
    -[HMFMessageTransport setDelegate:](v13->_XPCTransport, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_secureRemoteTransport, a4);
    -[HMFMessageTransport setDelegate:](v13->_secureRemoteTransport, "setDelegate:", v13);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    remoteGateways = v13->_remoteGateways;
    v13->_remoteGateways = (NSMutableDictionary *)v14;

    objc_storeStrong((id *)&v13->_messageFilterChain, a5);
    v16 = -[HMDMessageFilter initWithName:]([HMDSecureRemoteMessageFilter alloc], "initWithName:", CFSTR("SecureRemote"));
    secureRemoteMessageFilter = v13->_secureRemoteMessageFilter;
    v13->_secureRemoteMessageFilter = v16;

    -[HMDMessageFilterChain addMessageFilter:](v13->_messageFilterChain, "addMessageFilter:", v13->_secureRemoteMessageFilter);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v13, sel_handleSecureSessionError_, CFSTR("HMDSecureRemoteSessionErrorNotification"), 0);

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDMessageDispatcher;
  -[HMDMessageDispatcher dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  id v2;

  -[HMDMessageDispatcher secureRemoteTransport](self, "secureRemoteTransport");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (void)configureHomeManager:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMFMessageDispatcher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__HMDMessageDispatcher_configureHomeManager___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  HMDMessageDispatcher *v10;
  NSObject *v11;
  void *v12;
  HMDAssertionLogEvent *v13;
  void *v14;
  void *v15;
  id v16;
  char isKindOfClass;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v6)
  {
    objc_msgSend(v6, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      v16 = v6;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        -[HMDMessageDispatcher XPCTransport](self, "XPCTransport");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v18;
        v19 = v16;
        goto LABEL_11;
      }
    }
    -[HMDMessageDispatcher secureRemoteTransport](self, "secureRemoteTransport");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    v19 = v6;
LABEL_11:
    objc_msgSend(v18, "sendMessage:completionHandler:", v19, v7);
    goto LABEL_12;
  }
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v12;
    v22 = 2112;
    v23 = CFSTR("Requested to send nil message");
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v13 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("%@"), CFSTR("Requested to send nil message"));
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submitLogEvent:", v13);

  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 8, CFSTR("Requested to send nil message"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, v15);
LABEL_12:

}

- (id)sendMessageExpectingResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMDMessageDispatcher *v11;
  SEL v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  objc_super v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDMessageDispatcher;
    -[HMFMessageDispatcher sendMessageExpectingResponse:](&v18, sel_sendMessageExpectingResponse_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v6, "responseHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __53__HMDMessageDispatcher_sendMessageExpectingResponse___block_invoke;
    v15[3] = &unk_24E79B7E0;
    v16 = v17;
    objc_msgSend(v6, "setResponseHandler:", v15);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __53__HMDMessageDispatcher_sendMessageExpectingResponse___block_invoke_2;
    v13[3] = &unk_24E79BD80;
    v14 = v17;
    -[HMDMessageDispatcher sendMessage:completionHandler:](self, "sendMessage:completionHandler:", v6, v13);

LABEL_8:
    return v8;
  }
  v11 = (HMDMessageDispatcher *)_HMFPreconditionFailure();
  return -[HMDMessageDispatcher XPCTransport](v11, v12);
}

- (HMDXPCMessageTransport)XPCTransport
{
  return self->_XPCTransport;
}

- (HMDSecureRemoteMessageTransport)secureRemoteTransport
{
  return self->_secureRemoteTransport;
}

- (HMDMessageFilterChain)messageFilterChain
{
  return self->_messageFilterChain;
}

- (NSMutableDictionary)remoteGateways
{
  return self->_remoteGateways;
}

- (void)setRemoteGateways:(id)a3
{
  objc_storeStrong((id *)&self->_remoteGateways, a3);
}

- (HMDSecureRemoteMessageFilter)secureRemoteMessageFilter
{
  return self->_secureRemoteMessageFilter;
}

- (void)setSecureRemoteMessageFilter:(id)a3
{
  objc_storeStrong((id *)&self->_secureRemoteMessageFilter, a3);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_secureRemoteMessageFilter, 0);
  objc_storeStrong((id *)&self->_remoteGateways, 0);
  objc_storeStrong((id *)&self->_messageFilterChain, 0);
  objc_storeStrong((id *)&self->_secureRemoteTransport, 0);
  objc_storeStrong((id *)&self->_XPCTransport, 0);
}

uint64_t __53__HMDMessageDispatcher_sendMessageExpectingResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "rejectWithError:", a2);
  else
    return objc_msgSend(v2, "fulfillWithValue:");
}

uint64_t __53__HMDMessageDispatcher_sendMessageExpectingResponse___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "rejectWithError:", a2);
  return result;
}

uint64_t __45__HMDMessageDispatcher_configureHomeManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHomeManager:", *(_QWORD *)(a1 + 40));
}

+ (id)destinationWithTarget:(id)a3 userID:(id)a4 destination:(id)a5 multicast:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_class();
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "destinationWithTarget:userID:destination:multicast:accountRegistry:", v11, v10, v9, v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)destinationWithTarget:(id)a3 userID:(id)a4 destination:(id)a5 multicast:(BOOL)a6 accountRegistry:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  HMDRemoteDeviceMessageDestination *v18;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v13
    && (+[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v13), (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = (void *)v15;
    objc_msgSend(v14, "deviceForHandle:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:]([HMDRemoteDeviceMessageDestination alloc], "initWithTarget:device:", v11, v17);

  }
  else
  {
    +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:]([HMDRemoteAccountMessageDestination alloc], "initWithTarget:handle:multicast:", v11, v16, v8);
  }

  return v18;
}

+ (HMDMessageDispatcher)defaultDispatcher
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__HMDMessageDispatcher_defaultDispatcher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultDispatcher_onceToken != -1)
    dispatch_once(&defaultDispatcher_onceToken, block);
  return (HMDMessageDispatcher *)(id)defaultDispatcher_defaultDispatcher;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_108077 != -1)
    dispatch_once(&logCategory__hmf_once_t8_108077, &__block_literal_global_108078);
  return (id)logCategory__hmf_once_v9_108079;
}

void __35__HMDMessageDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_108079;
  logCategory__hmf_once_v9_108079 = v0;

}

void __41__HMDMessageDispatcher_defaultDispatcher__block_invoke(uint64_t a1)
{
  HMDMessageDispatcher *v2;
  void *v3;
  void *v4;
  HMDMessageFilterChain *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = [HMDMessageDispatcher alloc];
  +[HMDXPCMessageTransport defaultTransport](HMDXPCMessageTransport, "defaultTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDSecureRemoteMessageTransport defaultTransport](HMDSecureRemoteMessageTransport, "defaultTransport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(HMDMessageFilterChain);
  v6 = -[HMDMessageDispatcher initWithXPCTransport:secureRemoteTransport:messageFilterChain:](v2, "initWithXPCTransport:secureRemoteTransport:messageFilterChain:", v3, v4, v5);
  v7 = (void *)defaultDispatcher_defaultDispatcher;
  defaultDispatcher_defaultDispatcher = v6;

  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating default message dispatcher", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
}

- (void)handleSecureSessionError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDMessageDispatcher *v9;

  v4 = a3;
  -[HMFMessageDispatcher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__HMDMessageDispatcher_Deprecated__handleSecureSessionError___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setCompanionDevice:(id)a3 forHome:(id)a4
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
  -[HMFMessageDispatcher workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HMDMessageDispatcher_Deprecated__setCompanionDevice_forHome___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)setRemoteAccessDevice:(id)a3 forHome:(id)a4
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
  -[HMFMessageDispatcher workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HMDMessageDispatcher_Deprecated__setRemoteAccessDevice_forHome___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_setRemoteAccessDevice:(id)a3 forHome:(id)a4 sendNotification:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDResidentCommunicationHandler *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDMessageDispatcher *v21;
  NSObject *v22;
  void *v23;
  char v24;
  void *v25;
  HMDMessageDispatcher *v26;
  NSObject *v27;
  void *v28;
  char v29;
  void *v30;
  HMDMessageDispatcher *v31;
  NSObject *v32;
  void *v33;
  HMDHomeKitVersion *v34;
  void *v35;
  void *v36;
  char v37;
  HMDMessageDispatcher *v38;
  NSObject *v39;
  void *v40;
  HMDMessageDispatcher *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  HMDMessageDispatcher *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  HMDMessageDispatcher *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _BOOL4 v68;
  _BOOL4 v69;
  _BOOL4 v70;
  void *context;
  char contexta;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  id v76;
  __int16 v77;
  void *v78;
  const __CFString *v79;
  _QWORD v80[2];

  v5 = a5;
  v80[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    -[HMDMessageDispatcher remoteGateways](self, "remoteGateways");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (HMDResidentCommunicationHandler *)objc_claimAutoreleasedReturnValue();

    -[HMDResidentCommunicationHandler deviceForType:](v12, "deviceForType:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqual:", v8) & 1) != 0)
    {
LABEL_47:
      -[HMDResidentCommunicationHandler preferredDevice](v12, "preferredDevice");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "remoteAccessEnabled:", v66 != 0);

      goto LABEL_48;
    }
    objc_msgSend(v9, "residentDeviceManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isResidentAvailable");

    if (!v15)
    {
      v24 = 0;
      v29 = 1;
      if (v8 && v13)
      {
        v30 = (void *)MEMORY[0x227676638]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v33;
          v75 = 2112;
          v76 = v9;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Ignoring setting a new peer since we already have an existing peer for home: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v30);
        goto LABEL_47;
      }
      goto LABEL_31;
    }
    objc_msgSend(v9, "primaryResident");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v12
      && objc_msgSend(v16, "isReachable")
      && (objc_msgSend(v17, "device"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "isEqual:", v13),
          v18,
          v19))
    {
      v68 = v5;
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v23;
        v75 = 2112;
        v76 = v9;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Ignoring setting a new remote access device as the current resident is reachable for home: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v24 = 1;
      v5 = v68;
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
    v34 = (HMDHomeKitVersion *)objc_claimAutoreleasedReturnValue();
    if (-[HMDHomeKitVersion productPlatform](v34, "productPlatform") == 3)
    {
      objc_msgSend(v8, "version");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        v29 = 1;
LABEL_30:

LABEL_31:
        if (v12 && (v24 & 1) == 0)
        {
          contexta = v29;
          v40 = (void *)MEMORY[0x227676638]();
          v41 = self;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v70 = v5;
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "shortDescription");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v74 = v43;
            v75 = 2112;
            v76 = v44;
            _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Disabling resident remote access for home: %@", buf, 0x16u);

            v5 = v70;
          }

          objc_autoreleasePoolPop(v40);
          v45 = -[HMDResidentCommunicationHandler removeDeviceForType:](v12, "removeDeviceForType:", 2);
          v29 = contexta;
          if (v5)
          {
            v46 = (void *)MEMORY[0x227676638](v45);
            v47 = v41;
            HMFGetOSLogHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "shortDescription");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v74 = v49;
              v75 = 2112;
              v76 = v50;
              _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@Sending notification that remote session was torn down for home: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v46);
            v51 = (void *)MEMORY[0x24BE3F1B0];
            v79 = CFSTR("kHomeUUID");
            objc_msgSend(v9, "uuid");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "UUIDString");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v80[0] = v53;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "internalMessageWithName:messagePayload:", CFSTR("kRemoteSessionTornDownNotificationKey"), v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
            -[HMFMessageDispatcher dispatchMessage:target:](v47, "dispatchMessage:target:", v55, v56);

            v29 = contexta;
          }
        }
        v57 = v29 ^ 1;
        if (!v8)
          v57 = 1;
        if ((v57 & 1) == 0)
        {
          v58 = (void *)MEMORY[0x227676638]();
          v59 = self;
          HMFGetOSLogHandle();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "shortDescription");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "shortDescription");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v74 = v61;
            v75 = 2112;
            v76 = v62;
            v77 = 2112;
            v78 = v63;
            _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_INFO, "%{public}@Enabling resident remote access for home %@ via device: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v58);
          if (!v12)
          {
            v12 = -[HMDResidentCommunicationHandler initWithHome:remoteDispatcher:]([HMDResidentCommunicationHandler alloc], "initWithHome:remoteDispatcher:", v9, v59);
            -[HMDMessageDispatcher remoteGateways](v59, "remoteGateways");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "uuid");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v12, v65);

          }
          -[HMDResidentCommunicationHandler setDevice:forType:](v12, "setDevice:forType:", v8, 2);
        }
        goto LABEL_47;
      }
      v69 = v5;
      v34 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("4.0"));
      objc_msgSend(v8, "version");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isAtLeastVersion:", v34);

      if ((v37 & 1) != 0)
      {
        v29 = 1;
      }
      else
      {
        context = (void *)MEMORY[0x227676638]();
        v38 = self;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v67;
          v75 = 2112;
          v76 = v8;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Watch does not support the current resident: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        v29 = 0;
      }
      v5 = v69;
    }
    else
    {
      v29 = 1;
    }

    goto LABEL_30;
  }
  v25 = (void *)MEMORY[0x227676638]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v74 = v28;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Invalid home specified to setup/disable remote access", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v25);
LABEL_48:

}

- (id)residentCommunicationHandlerForHome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__108140;
  v16 = __Block_byref_object_dispose__108141;
  v17 = 0;
  if (v4)
  {
    -[HMFMessageDispatcher workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__HMDMessageDispatcher_Deprecated__residentCommunicationHandlerForHome___block_invoke;
    block[3] = &unk_24E79C0A8;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)remoteAccessDeviceForHome:(id)a3
{
  void *v3;
  void *v4;

  -[HMDMessageDispatcher residentCommunicationHandlerForHome:](self, "residentCommunicationHandlerForHome:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)sendSecureMessage:(id)a3 target:(id)a4 userID:(id)a5 destination:(id)a6 responseQueue:(id)a7 responseHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDMessageDispatcher *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDAssertionLogEvent *v44;
  void *v45;
  HMDAssertionLogEvent *v46;
  void *v47;
  void *v48;
  HMDMessageDispatcher *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  HMDAssertionLogEvent *v53;
  void *v54;
  HMDAssertionLogEvent *v55;
  void *v56;
  void *v57;
  HMDMessageDispatcher *v58;
  id v59;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v59 = a4;
  v61 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  objc_msgSend(v13, "destination");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(v13, "destination");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v34 = v59;
      v25 = v14;
      +[HMDMessageDispatcher destinationWithTarget:userID:destination:multicast:](HMDMessageDispatcher, "destinationWithTarget:userID:destination:multicast:", v59, v61, v14, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDestination:", v35);

      goto LABEL_17;
    }
  }
  objc_msgSend(v13, "destination");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if (v22)
  {
    objc_msgSend(v22, "remoteDestinationString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", v14);

    if ((v24 & 1) == 0)
    {
      v39 = (void *)MEMORY[0x227676638]();
      v40 = self;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "shortDescription");
        *(_DWORD *)buf = 138543618;
        v66 = v42;
        v67 = 2112;
        v68 = objc_claimAutoreleasedReturnValue();
        v57 = v39;
        v43 = (void *)v68;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Mismatched device message destination: %@", buf, 0x16u);

        v39 = v57;
      }

      objc_autoreleasePoolPop(v39);
      v44 = [HMDAssertionLogEvent alloc];
      objc_msgSend(v13, "shortDescription");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[HMDAssertionLogEvent initWithReason:](v44, "initWithReason:", CFSTR("Mismatched device message destination: %@"), v45);

      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "submitLogEvent:", v46);

    }
  }
  v25 = v14;

  objc_msgSend(v13, "destination");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;
  v28 = v27;

  if (v28)
  {
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "remoteDestinationString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringForObjectValue:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringForObjectValue:", v61);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqualToString:", v32);

    if ((v33 & 1) == 0)
    {
      v48 = (void *)MEMORY[0x227676638]();
      v49 = self;
      HMFGetOSLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v58 = v49;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "shortDescription");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v51;
        v67 = 2112;
        v68 = (uint64_t)v52;
        _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Mismatched account message destination: %@", buf, 0x16u);

        v49 = v58;
      }

      objc_autoreleasePoolPop(v48);
      v53 = [HMDAssertionLogEvent alloc];
      objc_msgSend(v13, "shortDescription");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[HMDAssertionLogEvent initWithReason:](v53, "initWithReason:", CFSTR("Mismatched account message destination: %@"), v54);

      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "submitLogEvent:", v55);

    }
  }

  v34 = v59;
LABEL_17:
  -[HMDMessageDispatcher homeManager](self, "homeManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "accountRegistry");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessageTransport remoteMessageFromMessage:secure:accountRegistry:](HMDRemoteMessageTransport, "remoteMessageFromMessage:secure:accountRegistry:", v13, 1, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && v16)
  {
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __110__HMDMessageDispatcher_Deprecated__sendSecureMessage_target_userID_destination_responseQueue_responseHandler___block_invoke;
    v62[3] = &unk_24E7961A0;
    v63 = v15;
    v64 = v16;
    objc_msgSend(v38, "setResponseHandler:", v62);

  }
  -[HMDMessageDispatcher sendMessage:completionHandler:](self, "sendMessage:completionHandler:", v38, 0);

}

- (void)electDeviceForHH1User:(id)a3 destination:(id)a4 deviceCapabilities:(id)a5 responseTimeout:(double)a6 responseQueue:(id)a7 responseHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[HMDMessageDispatcher secureRemoteTransport](self, "secureRemoteTransport");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "electDeviceForHH1User:destination:deviceCapabilities:responseTimeout:responseQueue:responseHandler:", v18, v17, v16, v15, v14, a6);

}

void __110__HMDMessageDispatcher_Deprecated__sendSecureMessage_target_userID_destination_responseQueue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __110__HMDMessageDispatcher_Deprecated__sendSecureMessage_target_userID_destination_responseQueue_responseHandler___block_invoke_2;
  block[3] = &unk_24E79B440;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __110__HMDMessageDispatcher_Deprecated__sendSecureMessage_target_userID_destination_responseQueue_responseHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __72__HMDMessageDispatcher_Deprecated__residentCommunicationHandlerForHome___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "remoteGateways");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __66__HMDMessageDispatcher_Deprecated__setRemoteAccessDevice_forHome___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setRemoteAccessDevice:forHome:sendNotification:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

void __63__HMDMessageDispatcher_Deprecated__setCompanionDevice_forHome___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  HMDResidentCommunicationHandler *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "remoteGateways");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (HMDResidentCommunicationHandler *)objc_claimAutoreleasedReturnValue();

  v5 = a1[6];
  v6 = (void *)MEMORY[0x227676638]();
  v7 = a1[4];
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Enabling companion remote access for home %@ via device: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    if (!v4)
    {
      v4 = -[HMDResidentCommunicationHandler initWithHome:remoteDispatcher:]([HMDResidentCommunicationHandler alloc], "initWithHome:remoteDispatcher:", a1[5], a1[4]);
      objc_msgSend(a1[4], "remoteGateways");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, v14);

    }
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Disabling companion remote access for home: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  -[HMDResidentCommunicationHandler setDevice:forType:](v4, "setDevice:forType:", a1[6], 1);
  v17 = a1[5];
  -[HMDResidentCommunicationHandler preferredDevice](v4, "preferredDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "remoteAccessEnabled:", v18 != 0);

}

void __61__HMDMessageDispatcher_Deprecated__handleSecureSessionError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  __int128 v29;
  void *v30;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v1 = a1;
  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(*(id *)(v1 + 40), "remoteGateways");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = (id)objc_msgSend(v5, "copy");
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    v30 = v5;
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v34;
      v10 = 1;
      *(_QWORD *)&v7 = 138543874;
      v29 = v7;
      do
      {
        v11 = 0;
        v31 = v8;
        do
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v11);
          objc_msgSend(v5, "objectForKeyedSubscript:", v12, v29);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "containsDevice:", v4))
          {
            v14 = (void *)MEMORY[0x227676638]();
            HMFGetOSLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v16 = v1;
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "UUIDString");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v29;
              v38 = v17;
              v39 = 2112;
              v40 = v4;
              v41 = 2112;
              v42 = v18;
              _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Tearing down remote access session to device, %@, for home '%@'", buf, 0x20u);

              v1 = v16;
              v5 = v30;
            }

            objc_autoreleasePoolPop(v14);
            objc_msgSend(*(id *)(v1 + 40), "homeManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "_homeWithUUID:", v12);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
              objc_msgSend(*(id *)(v1 + 40), "_setRemoteAccessDevice:forHome:sendNotification:", 0, v20, 1);

            v10 = 0;
            v8 = v31;
          }

          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 1;
    }

    objc_msgSend(*(id *)(v1 + 32), "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hmf_errorForKey:", CFSTR("HMDSecureRemoteSessionErrorKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v10 & 1) == 0)
      goto LABEL_27;
    objc_msgSend(v22, "domain");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BDD1100]))
    {
      v24 = objc_msgSend(v22, "code");

      if (v24 != -6752)
      {
LABEL_27:

        goto LABEL_28;
      }
      v25 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v27;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Sending internal notification that remote session was torn down for an unknown home", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x24BE3F1B0], "internalMessageWithName:messagePayload:", CFSTR("kRemoteSessionTornDownNotificationKey"), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
      objc_msgSend(*(id *)(v1 + 40), "dispatchMessage:target:", v23, v28);

    }
    goto LABEL_27;
  }
LABEL_28:

}

@end
