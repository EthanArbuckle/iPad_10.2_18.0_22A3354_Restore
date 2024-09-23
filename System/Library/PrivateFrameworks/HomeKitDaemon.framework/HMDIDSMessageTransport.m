@implementation HMDIDSMessageTransport

- (HMDIDSMessageTransport)initWithAccountRegistry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDIDSMessageTransport *v9;

  v4 = a3;
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDIDSMessageTransport initWithAccountRegistry:service:appleAccountManager:remoteAccountManager:](self, "initWithAccountRegistry:service:appleAccountManager:remoteAccountManager:", v4, v6, v7, v8);

  return v9;
}

- (id)initHMMMWithAccountRegistry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDIDSMessageTransport *v9;

  v4 = a3;
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmmmService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDIDSMessageTransport initWithAccountRegistry:service:appleAccountManager:remoteAccountManager:](self, "initWithAccountRegistry:service:appleAccountManager:remoteAccountManager:", v4, v6, v7, v8);

  return v9;
}

- (id)initHMMMEnergyWithAccountRegistry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDIDSMessageTransport *v9;

  v4 = a3;
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmmmEnergyService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDIDSMessageTransport initWithAccountRegistry:service:appleAccountManager:remoteAccountManager:](self, "initWithAccountRegistry:service:appleAccountManager:remoteAccountManager:", v4, v6, v7, v8);

  return v9;
}

- (id)initLegacyTransportWithAccountRegistry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legacyService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDIDSMessageTransport initLegacyTransportWithAccountRegistry:service:appleAccountManager:remoteAccountManager:](self, "initLegacyTransportWithAccountRegistry:service:appleAccountManager:remoteAccountManager:", v4, v6, v7, v8);

  return v9;
}

- (id)initLegacyTransportWithAccountRegistry:(id)a3 service:(id)a4 appleAccountManager:(id)a5 remoteAccountManager:(id)a6
{
  id result;

  result = -[HMDIDSMessageTransport initWithAccountRegistry:service:appleAccountManager:remoteAccountManager:](self, "initWithAccountRegistry:service:appleAccountManager:remoteAccountManager:", a3, a4, a5, a6);
  if (result)
    *((_BYTE *)result + 80) = 1;
  return result;
}

- (HMDIDSMessageTransport)initWithAccountRegistry:(id)a3 service:(id)a4 appleAccountManager:(id)a5 remoteAccountManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDIDSMessageTransport *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *workQueue;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  HMFOperationBudget *sendMessageBudget;
  uint64_t v26;
  NSMutableArray *messageContexts;
  uint64_t v28;
  NSMutableDictionary *pendingResponses;
  uint64_t v30;
  NSMutableDictionary *receivedResponses;
  uint64_t v32;
  NSMutableDictionary *requestedCapabilities;
  uint64_t v34;
  NSMutableDictionary *destinationAddress;
  uint64_t v36;
  NSMutableDictionary *pendingResponseTimers;
  uint64_t v38;
  NSMutableOrderedSet *messageDedupBuffer;
  objc_super v41;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v41.receiver = self;
  v41.super_class = (Class)HMDIDSMessageTransport;
  v14 = -[HMDRemoteMessageTransport initWithAccountRegistry:](&v41, sel_initWithAccountRegistry_, a3);
  if (v14)
  {
    HMDispatchQueueNameString();
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(v16, v17);
    workQueue = v14->_workQueue;
    v14->_workQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v14->_service, a4);
    objc_storeStrong((id *)&v14->_appleAccountManager, a5);
    objc_storeStrong((id *)&v14->_remoteAccountManager, a6);
    v20 = objc_alloc(MEMORY[0x24BE3F220]);
    v21 = objc_msgSend((id)objc_opt_class(), "sendMessageLimit");
    v22 = objc_msgSend((id)objc_opt_class(), "sendMessageRate");
    v24 = objc_msgSend(v20, "initWithLimit:rate:", v21, v22, v23);
    sendMessageBudget = v14->_sendMessageBudget;
    v14->_sendMessageBudget = (HMFOperationBudget *)v24;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v26 = objc_claimAutoreleasedReturnValue();
    messageContexts = v14->_messageContexts;
    v14->_messageContexts = (NSMutableArray *)v26;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    pendingResponses = v14->_pendingResponses;
    v14->_pendingResponses = (NSMutableDictionary *)v28;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v30 = objc_claimAutoreleasedReturnValue();
    receivedResponses = v14->_receivedResponses;
    v14->_receivedResponses = (NSMutableDictionary *)v30;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v32 = objc_claimAutoreleasedReturnValue();
    requestedCapabilities = v14->_requestedCapabilities;
    v14->_requestedCapabilities = (NSMutableDictionary *)v32;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v34 = objc_claimAutoreleasedReturnValue();
    destinationAddress = v14->_destinationAddress;
    v14->_destinationAddress = (NSMutableDictionary *)v34;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v36 = objc_claimAutoreleasedReturnValue();
    pendingResponseTimers = v14->_pendingResponseTimers;
    v14->_pendingResponseTimers = (NSMutableDictionary *)v36;

    v38 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", 30);
    messageDedupBuffer = v14->_messageDedupBuffer;
    v14->_messageDedupBuffer = (NSMutableOrderedSet *)v38;

  }
  return v14;
}

- (id)start
{
  void *v3;
  HMDIDSMessageTransport *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self && !-[HMDIDSMessageTransport isLegacyTransport](self, "isLegacyTransport"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v6;
      v7 = "%{public}@Starting using modern transport";
      goto LABEL_7;
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v6;
      v7 = "%{public}@Starting using legacy service";
LABEL_7:
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v12, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v3);
  -[HMDIDSMessageTransport service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIDSMessageTransport workQueue](self, "workQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDelegate:queue:", self, v9);

  -[HMDRemoteMessageTransport startPromise](self, "startPromise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fulfillWithValue:", 0);

  -[HMDRemoteMessageTransport startFuture](self, "startFuture");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)qualityOfService
{
  return 0;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDIDSMessageTransport service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_shouldAddLocalHandleToDevice:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "localHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hmf_isEmpty");

  if (v5)
  {
    objc_msgSend(v3, "globalHandles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)deviceForSenderContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDDevice *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDIDSMessageTransport *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDIDSMessageTransport *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDDevice *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDIDSMessageTransport *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  HMDIDSMessageTransport *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDDevice *v44;
  void *v45;
  int v46;
  void *v47;
  __int16 v48;
  HMDDevice *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDIDSMessageTransport appleAccountManager](self, "appleAccountManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "handles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (!v9)
    {
      -[HMDIDSMessageTransport remoteAccountManager](self, "remoteAccountManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "deviceForSenderContext:", v4);
      v11 = (HMDDevice *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(v4, "deviceHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceForHandle:", v10);
    v11 = (HMDDevice *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (!-[HMDIDSMessageTransport _shouldAddLocalHandleToDevice:](self, "_shouldAddLocalHandleToDevice:", v11))
        goto LABEL_18;
      objc_msgSend(v4, "localDeviceHandle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_18;
      objc_msgSend(v4, "localDeviceHandle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDevice addHandle:](v11, "addHandle:", v13);
    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138543362;
        v47 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Received message from unknown device on our account, creating placeholder device", (uint8_t *)&v46, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v23 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v4, "deviceHandle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayWithObject:", v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "localDeviceHandle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v4, "localDeviceHandle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v26);

      }
      v27 = [HMDDevice alloc];
      objc_msgSend(v4, "deviceHandle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v4, "deviceVersion");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HMDDevice initWithIdentifier:handles:name:productInfo:version:capabilities:](v27, "initWithIdentifier:handles:name:productInfo:version:capabilities:", v29, v30, 0, 0, v31, 0);

      objc_msgSend(v6, "addDevice:", v11);
    }

LABEL_18:
    v32 = (void *)MEMORY[0x227676638]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138543618;
      v47 = v35;
      v48 = 2112;
      v49 = v11;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated sender on our account: %@", (uint8_t *)&v46, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(v6, "senderCorrelationIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
      goto LABEL_21;
    objc_msgSend(v4, "accountIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "senderCorrelationIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v39 = (void *)MEMORY[0x227676638]();
      v40 = v33;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "shortDescription");
        v44 = (HMDDevice *)objc_claimAutoreleasedReturnValue();
        v46 = 138544130;
        v47 = v42;
        v48 = 2114;
        v49 = v44;
        v50 = 2160;
        v51 = 1752392040;
        v52 = 2112;
        v53 = v18;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Updating account %{public}@ with inferred mergeID %{mask.hash}@", (uint8_t *)&v46, 0x2Au);

      }
      objc_autoreleasePoolPop(v39);
      -[HMDIDSMessageTransport appleAccountManager](v40, "appleAccountManager");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "updateSenderCorrelationIdentifier:", v18);

    }
LABEL_11:

    goto LABEL_21;
  }
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138543362;
    v47 = v17;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Received a message but no current account is available to authenticate it", (uint8_t *)&v46, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  v11 = 0;
LABEL_21:

  return v11;
}

- (BOOL)isSecure
{
  objc_super v4;

  if (self && !-[HMDIDSMessageTransport isLegacyTransport](self, "isLegacyTransport"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)HMDIDSMessageTransport;
  return -[HMDRemoteMessageTransport isSecure](&v4, sel_isSecure);
}

- (BOOL)canSendMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;
  HMDIDSMessageTransport *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  HMDIDSMessageTransport *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[HMDIDSMessageTransport isValidMessage:](self, "isValidMessage:", v4))
    goto LABEL_13;
  if (self && !-[HMDIDSMessageTransport isLegacyTransport](self, "isLegacyTransport"))
    goto LABEL_6;
  -[HMDIDSMessageTransport appleAccountManager](self, "appleAccountManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v13;
      v14 = "%{public}@Cannot send message, not currently registered";
LABEL_11:
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v17, 0xCu);

    }
LABEL_12:

    objc_autoreleasePoolPop(v10);
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  -[HMDIDSMessageTransport service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hmd_isActive");

  if ((v8 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v13;
      v14 = "%{public}@Cannot send message, service is inactive";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
LABEL_6:
  v9 = 1;
LABEL_14:

  return v9;
}

- (BOOL)isValidMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  char isKindOfClass;

  v4 = a3;
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v4, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(v4, "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_12:
    v7 = 0;
    goto LABEL_13;
  }
LABEL_5:
  if ((objc_msgSend(v4, "restriction") & 1) == 0
    || (!self || -[HMDIDSMessageTransport isLegacyTransport](self, "isLegacyTransport"))
    && (objc_msgSend(v4, "restriction") == -1 || (objc_msgSend(v4, "restriction") & 0x10) == 0))
  {
    goto LABEL_12;
  }
  v7 = 1;
LABEL_13:

  return v7;
}

- (int)transportType
{
  return 2;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDIDSMessageTransport *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDIDSMessageTransport workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_24E79B440;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (id)sendMessage:(id)a3 fromHandle:(id)a4 destination:(id)a5 priority:(int64_t)a6 timeout:(double)a7 options:(unint64_t)a8 queueOneID:(id)a9 error:(id *)a10
{
  char v11;
  id *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  HMDIDSMessageTransport *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDIDSMessageTransport *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  int v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  HMDIDSMessageTransport *v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  id v65;
  const __CFString **v66;
  void *v67;
  char v68;
  void *v69;
  HMDIDSMessageTransport *v70;
  NSObject *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  const __CFString *v75;
  id *v77;
  id v78;
  int64_t v79;
  void *v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  id v96;
  __int16 v97;
  const __CFString *v98;
  __int16 v99;
  id v100;
  _BYTE v101[128];
  uint64_t v102;
  _QWORD v103[3];

  v11 = a8;
  v17 = a10;
  v103[1] = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a9;
  v22 = v21;
  if (v20)
  {
    objc_msgSend(v20, "allRemoteDestinationStrings");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v22;
    if (!objc_msgSend(v82, "count"))
    {
      v33 = (void *)MEMORY[0x227676638]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v88 = (uint64_t)v36;
        v89 = 2112;
        v90 = (uint64_t)v20;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@No valid destination strings for destination: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      if (!a10)
      {
        v32 = v81;
LABEL_66:

        goto LABEL_67;
      }
      v37 = (void *)MEMORY[0x24BDD1540];
      v102 = *MEMORY[0x24BDD1398];
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3203);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v103[0] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v103, &v102, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "hmErrorWithCode:userInfo:", 54, v38);
      v17 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      v32 = v81;
LABEL_65:

      goto LABEL_66;
    }
    v79 = a6;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if ((v11 & 1) != 0)
    {
      v39 = MEMORY[0x24BDBD1C8];
      objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FAA8]);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v39, *MEMORY[0x24BE4FAD0]);
      if ((v11 & 2) == 0)
      {
LABEL_5:
        if ((v11 & 8) == 0)
          goto LABEL_6;
        goto LABEL_21;
      }
    }
    else if ((v11 & 2) == 0)
    {
      goto LABEL_5;
    }
    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FAE8]);
    if ((v11 & 8) == 0)
    {
LABEL_6:
      if ((v11 & 4) == 0)
      {
LABEL_8:
        if (a7 <= 0.0)
        {
          if ((v11 & 2) == 0)
            objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_24E971458, *MEMORY[0x24BE4FB30]);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a7);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE4FB30]);

        }
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE4FB18]);
        objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FA70]);
        v80 = v18;
        v78 = v20;
        if (v19)
        {
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          -[HMDIDSMessageTransport service](self, "service");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "accounts");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v84;
            while (2)
            {
              for (i = 0; i != v43; ++i)
              {
                if (*(_QWORD *)v84 != v44)
                  objc_enumerationMutation(v41);
                v46 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
                objc_msgSend(v46, "hmd_handles");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(v47, "containsObject:", v19);

                if (v48)
                {
                  objc_msgSend(v19, "URI");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "prefixedURI");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setObject:forKeyedSubscript:", v51, *MEMORY[0x24BE4FAC8]);

                  v49 = v46;
                  goto LABEL_36;
                }
              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
              if (v43)
                continue;
              break;
            }
            v49 = 0;
LABEL_36:
            v18 = v80;
            v17 = a10;
          }
          else
          {
            v49 = 0;
          }

        }
        else
        {
          v49 = 0;
        }
        if (self && !-[HMDIDSMessageTransport isLegacyTransport](self, "isLegacyTransport"))
        {
          -[HMDIDSMessageTransport _identifierFromSerializedMessage:](self, v18);
          v52 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v18, "shortDescription");
          v52 = objc_claimAutoreleasedReturnValue();
        }
        v53 = (void *)v52;
        if (shouldLogPrivateInformation())
        {
          v54 = v24;
        }
        else
        {
          v55 = (void *)objc_msgSend(v24, "mutableCopy");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *MEMORY[0x24BE4FAC8]);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "removeObjectsForKeys:", v56);

          v54 = (id)objc_msgSend(v55, "copy");
        }
        v57 = (void *)MEMORY[0x227676638]();
        v58 = self;
        HMFGetOSLogHandle();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v77 = v17;
          HMFGetLogIdentifier();
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = (void *)v60;
          switch(v79)
          {
            case 100:
              v62 = CFSTR("Sync");
              break;
            case 200:
              v62 = CFSTR("Default");
              break;
            case 300:
              v62 = CFSTR("Urgent");
              break;
            default:
              v62 = CFSTR("Unknown");
              break;
          }
          *(_DWORD *)buf = 138544899;
          v88 = v60;
          v89 = 2114;
          v90 = (uint64_t)v53;
          v91 = 2160;
          v92 = 1752392040;
          v93 = 2112;
          v94 = v82;
          v95 = 2113;
          v96 = v49;
          v97 = 2114;
          v98 = v62;
          v99 = 2114;
          v100 = v54;
          _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_INFO, "%{public}@Sending IDS message %{public}@ to %{mask.hash}@, from account %{private}@ with priority, %{public}@, options: %{public}@", buf, 0x48u);

          v17 = v77;
        }

        objc_autoreleasePoolPop(v57);
        -[HMDIDSMessageTransport service](v58, "service");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v82);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v49;
        v66 = (const __CFString **)v17;
        v18 = v80;
        v67 = v65;
        v68 = objc_msgSend(v63, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v80, v17);
        v17 = (id *)0;

        if ((v68 & 1) == 0)
        {
          v69 = (void *)MEMORY[0x227676638]();
          v70 = v58;
          HMFGetOSLogHandle();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDIDSMessageTransport _identifierFromSerializedMessage:](v70, v80);
            v73 = objc_claimAutoreleasedReturnValue();
            v74 = (void *)v73;
            if (v66)
              v75 = *v66;
            else
              v75 = CFSTR("<nil>");
            *(_DWORD *)buf = 138543874;
            v88 = (uint64_t)v72;
            v89 = 2114;
            v90 = v73;
            v91 = 2112;
            v92 = (uint64_t)v75;
            _os_log_impl(&dword_2218F0000, v71, OS_LOG_TYPE_INFO, "%{public}@Failed to send IDS message %{public}@ due to error: %@", buf, 0x20u);

            v18 = v80;
          }

          objc_autoreleasePoolPop(v69);
          v17 = 0;
        }
        v32 = v81;
        v38 = v67;
        v20 = v78;
        goto LABEL_65;
      }
LABEL_7:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4FA50]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BE4FB20]);

      goto LABEL_8;
    }
LABEL_21:
    objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_24E96AC40, *MEMORY[0x24BE4FB08]);
    if ((v11 & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v27 = v21;
  v28 = (void *)MEMORY[0x227676638]();
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v88 = (uint64_t)v31;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Destination is required", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v28);
  if (a10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v17 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = v27;
LABEL_67:

  return v17;
}

- (void)_restartPendingResponseTimerFor:(id)a3 withReducedFactor:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  dispatch_time_t v12;
  void *v13;
  HMDIDSMessageTransport *v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  HMDIDSMessageTransport *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = remotePendingResponseTimerNanoseconds;
  v8 = remotePendingResponseDecayScale;
  -[HMDIDSMessageTransport pendingResponseTimers](self, "pendingResponseTimers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v7 / (v8 * a4);
    v12 = dispatch_time(0, v11);
    dispatch_source_set_timer(v10, v12, 0xFFFFFFFFFFFFFFFFLL, remotePendingResponseLeewayNanoseconds);
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11 / 0x3B9ACA00;
      objc_msgSend(v6, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v16;
      v24 = 2048;
      v25 = v17;
      v26 = 2114;
      v27 = v18;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Restarted Pending response timer for %lld sec, for transaction: %{public}@", (uint8_t *)&v22, 0x20u);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v20;
      v24 = 2114;
      v25 = (unint64_t)v21;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Timer already expired for transaction: %{public}@", (uint8_t *)&v22, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v13);
}

- (void)_pendingResponseTimeoutFor:(id)a3
{
  id v4;
  void *v5;
  HMDIDSMessageTransport *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  HMDIDSMessageTransport *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v8;
    v28 = 2114;
    v29 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Pending Response timeout for transaction: %{public}@", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDIDSMessageTransport pendingResponses](v6, "pendingResponses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v4);
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDIDSMessageTransport receivedResponses](v6, "receivedResponses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    -[HMDIDSMessageTransport requestedCapabilities](v6, "requestedCapabilities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    if (objc_msgSend(v15, "count"))
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v6;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@ Selecting response based on requested capabilities", (uint8_t *)&v26, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      -[HMDRemoteMessageTransport matchResponse:requestedCapabilities:](v21, "matchResponse:requestedCapabilities:", v15, v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("kIDSMessageResponseErrorDataKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v11)[2](v11, v25, v24);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 8, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v24, 0);
    }

  }
  -[HMDIDSMessageTransport _removePendingResponseTransaction:](v6, "_removePendingResponseTransaction:", v4);

}

- (void)_startPendingResponseTimer:(id)a3 responseTimeout:(double)a4 identifier:(id)a5
{
  id v8;
  id v9;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  id v15;
  void *v16;
  HMDIDSMessageTransport *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD handler[4];
  id v23;
  id v24;
  id location;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (fabs(a4) < 2.22044605e-16 || a4 <= 0.0)
    v11 = remotePendingResponseTimerNanoseconds;
  else
    v11 = (uint64_t)(a4 * 1000000000.0);
  -[HMDIDSMessageTransport workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v12);

  v14 = dispatch_time(0, v11);
  dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, remotePendingResponseLeewayNanoseconds);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __80__HMDIDSMessageTransport__startPendingResponseTimer_responseTimeout_identifier___block_invoke;
  handler[3] = &unk_24E7972B0;
  objc_copyWeak(&v24, &location);
  v15 = v8;
  v23 = v15;
  dispatch_source_set_event_handler(v13, handler);
  dispatch_resume(v13);
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v19;
    v28 = 2114;
    v29 = v20;
    v30 = 2048;
    v31 = v11 / 0x3B9ACA00;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Starting poll to track response for message with transaction %{public}@ for %lld secs", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
  -[HMDIDSMessageTransport pendingResponseTimers](v17, "pendingResponseTimers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v13, v15);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)_removePendingResponseTimerForTransaction:(id)a3
{
  id v4;
  void *v5;
  HMDIDSMessageTransport *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Cancelling timer for transaction: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDIDSMessageTransport pendingResponseTimers](v6, "pendingResponseTimers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v4);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
    dispatch_source_cancel(v10);
  -[HMDIDSMessageTransport pendingResponseTimers](v6, "pendingResponseTimers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v4);

}

- (void)_removePendingResponseTransaction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMDIDSMessageTransport pendingResponses](self, "pendingResponses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v7);

  -[HMDIDSMessageTransport requestedCapabilities](self, "requestedCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v7);

  -[HMDIDSMessageTransport destinationAddress](self, "destinationAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

  -[HMDIDSMessageTransport _removePendingResponseTimerForTransaction:](self, "_removePendingResponseTimerForTransaction:", v7);
}

- (BOOL)shouldAcceptLegacyIDSMessage:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;

  v3 = a3;
  if (!objc_msgSend(v3, "type")
    && (objc_msgSend(v3, "name"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("kAccessHomeInviteRequestKey")),
        v4,
        (v5 & 1) != 0)
    || objc_msgSend(v3, "type") == 1)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", CFSTR("kSecureServerIDSMessageRequestKey"));

  }
  return v6;
}

- (BOOL)_shouldProcessLegacyIDSMessageFromID:(id)a3 context:(id)a4 message:(id *)a5 service:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  HMDRemoteMessageSenderContext *v29;
  void *v30;
  id v31;
  uint64_t v32;
  HMDNameValidator *v33;
  void *v34;
  HMDNameValidator *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  HMDIDSMessageTransport *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDIDSMessageTransport *v45;
  NSObject *v46;
  HMDIDSMessageTransport *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HMDNameValidator *v55;
  void *v56;
  void *v57;
  void *v58;
  HMDRemoteMessageSenderContext *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  _QWORD v71[6];
  _QWORD v72[6];
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[HMDIDSMessageTransport transportType](self, "transportType") == 4)
  {
    objc_msgSend(v12, "deviceForFromID:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = objc_msgSend(v13, "isDefaultPairedDevice");
    else
      v15 = 0;

  }
  else if (self && !-[HMDIDSMessageTransport isLegacyTransport](self, "isLegacyTransport"))
  {
    v15 = 1;
  }
  else
  {
    -[HMDIDSMessageTransport appleAccountManager](self, "appleAccountManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "account");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "senderCorrelationIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *a5;
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("kIDSMessagePayloadKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v19;
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("kIDSMessageNameKey"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessageTransport homeMembershipVerifier](self, "homeMembershipVerifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v10);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "senderCorrelationIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqual:", v18))
    {

      v15 = 1;
    }
    else
    {
      v62 = v20;
      v63 = v18;
      v61 = v17;
      objc_msgSend(v17, "handles");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v21;
      v24 = objc_msgSend(v23, "containsObject:", v21);

      if ((v24 & 1) != 0)
        goto LABEL_13;
      -[HMDIDSMessageTransport pendingResponses](self, "pendingResponses");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "hmf_UUIDForKey:", CFSTR("kIDSMessageRequestTransactionIDKey"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
LABEL_13:
        v15 = 1;
        v20 = v62;
        v18 = v63;
      }
      else
      {
        +[HMDAccountIdentifier accountIdentifierForMessageContext:](HMDAccountIdentifier, "accountIdentifierForMessageContext:", v11);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[HMDRemoteMessageSenderContext initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:]([HMDRemoteMessageSenderContext alloc], "initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:", v66, v21, v60, 0, 0);
        -[HMDIDSMessageTransport remoteAccountManager](self, "remoteAccountManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v29;
        v31 = (id)objc_msgSend(v30, "deviceForSenderContext:", v29);

        v18 = v63;
        v20 = v62;
        if ((objc_msgSend(v67, "userWithMergeIdIsMemberOfAHome:", v63) & 1) != 0)
        {
          v15 = 1;
          v21 = v64;
        }
        else
        {
          objc_msgSend(v62, "hmf_UUIDForKey:", CFSTR("kInvitationIdentifierKey"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v67, "expectingInvitationResponseForIdentifier:") & 1) != 0)
          {
            v15 = 1;
          }
          else if (objc_msgSend(v65, "isEqual:", CFSTR("kAccessHomeInviteRequestKey")))
          {
            objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("kHomeName"));
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = [HMDNameValidator alloc];
            objc_msgSend(MEMORY[0x24BDD1880], "UUID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[HMDNameValidator initWithUUID:](v33, "initWithUUID:", v34);

            v56 = (void *)v32;
            -[HMDNameValidator validateName:](v35, "validateName:", v32);
            v36 = objc_claimAutoreleasedReturnValue();
            v15 = v36 == 0;
            v57 = (void *)v36;
            if (v36)
            {
              v37 = v36;
              v38 = (void *)MEMORY[0x227676638]();
              v39 = self;
              HMFGetOSLogHandle();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v74 = v41;
                v75 = 2112;
                v76 = v37;
                _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Received invite from invalid home name.  Validation Error %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v38);
              v20 = v62;
              v42 = v56;
            }
            else
            {
              v55 = v35;
              objc_msgSend(MEMORY[0x24BDD1880], "UUID");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = (void *)MEMORY[0x227676638]();
              v45 = self;
              HMFGetOSLogHandle();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v47 = v45;
                v48 = v44;
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v74 = v49;
                v75 = 2112;
                v76 = (uint64_t)v43;
                _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Replacing incoming HH1 invite with message id %@", buf, 0x16u);

                v44 = v48;
                v45 = v47;
              }

              objc_autoreleasePoolPop(v44);
              v72[0] = CFSTR("kAccessHomeInviteRequestKey");
              v71[0] = CFSTR("kIDSMessageNameKey");
              v71[1] = CFSTR("kIDSMessageIdentifierKey");
              objc_msgSend(v43, "UUIDString");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v72[1] = v54;
              v72[2] = MEMORY[0x24BDBD1C8];
              v71[2] = CFSTR("kIDSMessageRequiresResponseKey");
              v71[3] = CFSTR("kIDSMessageRequestTransactionIDKey");
              objc_msgSend(MEMORY[0x24BDD1880], "UUID");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "UUIDString");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v72[3] = v50;
              v72[4] = CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938");
              v71[4] = CFSTR("kIDSMessageTargetKey");
              v71[5] = CFSTR("kIDSMessagePayloadKey");
              v42 = v56;
              v69 = CFSTR("kHomeName");
              v70 = v56;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
              v51 = v43;
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v72[5] = v52;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 6);
              *a5 = (id)objc_claimAutoreleasedReturnValue();

              v20 = v62;
              v35 = v55;
            }

            v18 = v63;
          }
          else
          {
            v15 = 0;
          }
          v21 = v64;
          v17 = v61;

        }
      }
    }

  }
  return v15;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  HMDIDSMessageTransport *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  HMDIDSMessageTransport *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  HMDIDSMessageTransport *v61;
  NSObject *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  HMDIDSMessageTransport *v67;
  NSObject *v68;
  void *v69;
  id v70;
  void *v71;
  HMDRemoteMessageSenderContext *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  HMDRemoteDeviceMessageDestination *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  HMDRemoteMessageSenderContext *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  HMDIDSMessageTransport *v98;
  NSObject *v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  const char *v104;
  NSObject *v105;
  os_log_type_t v106;
  uint32_t v107;
  void *v108;
  HMDIDSMessageTransport *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  HMDIDSMessageTransport *v116;
  void *v117;
  HMDIDSMessageTransport *v118;
  NSObject *v119;
  id v120;
  id v121;
  void *v122;
  HMDAssertionLogEvent *v123;
  void *v124;
  void *v125;
  HMDIDSMessageTransport *v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  unsigned int v133;
  void *v134;
  HMDRemoteMessageSenderContext *v135;
  id v136;
  id v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  id v143;
  id v144;
  id v145;
  uint8_t buf[4];
  void *v147;
  __int16 v148;
  uint64_t v149;
  __int16 v150;
  uint64_t v151;
  __int16 v152;
  id v153;
  __int16 v154;
  id v155;
  uint64_t v156;

  v156 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v16, "originalGUID");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
LABEL_12:
    v143 = v12;
    if (self && !-[HMDIDSMessageTransport isLegacyTransport](self, "isLegacyTransport"))
    {
      v36 = (void *)MEMORY[0x227676638]();
      v37 = self;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        goto LABEL_19;
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v44 = v16;
      v45 = v13;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v147 = v39;
      v148 = 2112;
      v149 = (uint64_t)v46;
      v150 = 2160;
      v151 = 1752392040;
      v152 = 2112;
      v153 = v15;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Received incoming IDS message: %@, from: %{mask.hash}@", buf, 0x2Au);

      v13 = v45;
      v16 = v44;
    }
    else
    {
      v36 = (void *)MEMORY[0x227676638]();
      v37 = self;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v40 = v15;
      v41 = v16;
      v42 = v13;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v147 = v39;
      v148 = 2112;
      v149 = (uint64_t)v43;
      v150 = 2160;
      v151 = 1752392040;
      v152 = 2112;
      v153 = v40;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Received incoming IDS message: %@, from: %{mask.hash}@", buf, 0x2Au);

      v13 = v42;
      v16 = v41;
      v15 = v40;
    }

LABEL_19:
    objc_autoreleasePoolPop(v36);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kIDSMessageNameKey"));
    v47 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F238], "sharedPowerLogger");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = (void *)v47;
    objc_msgSend(v48, "reportIncomingIDSPush:fromToken:", v47, v15);

    if (!v15)
    {
      v117 = (void *)MEMORY[0x227676638]();
      v118 = self;
      HMFGetOSLogHandle();
      v119 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v120 = v16;
        v121 = v13;
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v147 = v122;
        _os_log_impl(&dword_2218F0000, v119, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Received incoming message with nil fromID", buf, 0xCu);

        v13 = v121;
        v16 = v120;
        v15 = 0;
      }

      objc_autoreleasePoolPop(v117);
      v123 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Received incoming message with nil fromID"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "submitLogEvent:", v123);

      v125 = (void *)MEMORY[0x227676638]();
      v126 = v118;
      HMFGetOSLogHandle();
      v127 = objc_claimAutoreleasedReturnValue();
      v12 = v143;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v137 = v13;
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "originalGUID");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v147 = v128;
        v148 = 2114;
        v149 = (uint64_t)v129;
        _os_log_impl(&dword_2218F0000, v127, OS_LOG_TYPE_ERROR, "%{public}@Received incoming message, %{public}@, with nil fromID", buf, 0x16u);

        v12 = v143;
        v13 = v137;
      }

      objc_autoreleasePoolPop(v125);
      goto LABEL_65;
    }
    +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v15);
    v49 = objc_claimAutoreleasedReturnValue();
    +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v15);
    v50 = objc_claimAutoreleasedReturnValue();
    +[HMDAccountIdentifier accountIdentifierForMessageContext:](HMDAccountIdentifier, "accountIdentifierForMessageContext:", v16);
    v51 = objc_claimAutoreleasedReturnValue();
    v145 = v14;
    v52 = -[HMDIDSMessageTransport _shouldProcessLegacyIDSMessageFromID:context:message:service:](self, "_shouldProcessLegacyIDSMessageFromID:context:message:service:", v15, v16, &v145, v143);
    v142 = v145;

    v140 = (void *)v51;
    if (!v52)
    {
      v58 = (void *)v50;
      v59 = (void *)v49;
      v60 = (void *)MEMORY[0x227676638]();
      v61 = self;
      HMFGetOSLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v63 = v13;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "senderCorrelationIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v147 = v64;
        v148 = 2114;
        v149 = (uint64_t)v141;
        v150 = 2112;
        v151 = (uint64_t)v65;
        _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_ERROR, "%{public}@Dropping incoming message %{public}@ from unknown mergeID %@", buf, 0x20u);

        v13 = v63;
      }

      objc_autoreleasePoolPop(v60);
      goto LABEL_64;
    }
    if (self)
      v53 = -[HMDIDSMessageTransport isLegacyTransport](self, "isLegacyTransport") ^ 1;
    else
      v53 = 0;
    v144 = 0;
    +[HMDRemoteMessageSerialization remoteMessageWithDictionary:isHH2Payload:error:](HMDRemoteMessageSerialization, "remoteMessageWithDictionary:isHH2Payload:error:", v142, v53, &v144);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v144;
    v139 = (void *)v49;
    if (!v54)
    {
      v58 = (void *)v50;
      v66 = (void *)MEMORY[0x227676638]();
      v67 = self;
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = v138;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v70 = v13;
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v147 = v71;
        v148 = 2112;
        v149 = (uint64_t)v142;
        v150 = 2160;
        v151 = 1752392040;
        v152 = 2112;
        v153 = v15;
        v154 = 2112;
        v155 = v138;
        _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_ERROR, "%{public}@Dropping invalid IDS message payload, %@, from: %{mask.hash}@, error: %@", buf, 0x34u);

        v13 = v70;
      }

      objc_autoreleasePoolPop(v66);
      goto LABEL_63;
    }
    if (self && !-[HMDIDSMessageTransport isLegacyTransport](self, "isLegacyTransport")
      || -[HMDIDSMessageTransport shouldAcceptLegacyIDSMessage:](self, "shouldAcceptLegacyIDSMessage:", v54))
    {
      v55 = -[HMDIDSMessageTransport isSecure](self, "isSecure");
      if ((_DWORD)v55)
        v55 = objc_msgSend(v54, "setSecure:", 1);
      if (v49)
      {
        v136 = v13;
        if (objc_msgSend(v54, "isSecure")
          && (objc_msgSend(v54, "sourceVersion"),
              v56 = (void *)objc_claimAutoreleasedReturnValue(),
              v56,
              v56))
        {
          objc_msgSend(v54, "sourceVersion");
          v57 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v57 = 0;
        }
        v132 = (void *)v57;
        v72 = -[HMDRemoteMessageSenderContext initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:]([HMDRemoteMessageSenderContext alloc], "initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:", v49, v50, v51, v57, 0);
        v73 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v142, "hmf_stringForKey:", CFSTR("idsId"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = (void *)objc_msgSend(v73, "initWithUUIDString:", v74);

        if (v75)
        {
          +[HMDDeviceHandle deviceHandleForDeviceIdentifier:](HMDDeviceHandle, "deviceHandleForDeviceIdentifier:", v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          if (v76)
            -[HMDRemoteMessageSenderContext setLocalDeviceHandle:](v72, "setLocalDeviceHandle:", v76);

        }
        v135 = v72;
        -[HMDIDSMessageTransport deviceForSenderContext:](self, "deviceForSenderContext:", v72);
        v77 = objc_claimAutoreleasedReturnValue();
        if (v77)
        {
          v78 = v77;

          v79 = (void *)MEMORY[0x24BDBCED8];
          objc_msgSend(v54, "messagePayload");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "dictionaryWithDictionary:", v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v81, "setObject:forKeyedSubscript:", v15, CFSTR("kIDSMessageSourceIDKey"));
          v130 = v81;
          objc_msgSend(v54, "setMessagePayload:", v81);
          objc_msgSend(v54, "setRestriction:", objc_msgSend((id)objc_opt_class(), "restriction"));
          v133 = objc_msgSend(v54, "isSecure");
          v82 = [HMDRemoteDeviceMessageDestination alloc];
          objc_msgSend(v54, "destination");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "target");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = (void *)v78;
          v85 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v82, "initWithTarget:device:", v84, v78);

          v86 = (void *)v85;
          objc_msgSend(v54, "setDestination:", v85);
          if ((v133 & 1) != 0
            || !+[HMDSecureRemoteSession isSecureRemoteSessionMessage:](HMDSecureRemoteSession, "isSecureRemoteSessionMessage:", v54))
          {
            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDRemoteMessageLogEvent receivedRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "receivedRemoteMessage:transportType:", v54, -[HMDIDSMessageTransport transportType](self, "transportType"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "submitLogEvent:", v88);

          }
          objc_msgSend(v54, "userInfo");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = (void *)objc_msgSend(v89, "mutableCopy");

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[HMDIDSMessageTransport transportType](self, "transportType"));
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "setObject:forKeyedSubscript:", v91, CFSTR("kRemoteMessageTransportAttributionKey"));

          if (self && !-[HMDIDSMessageTransport isLegacyTransport](self, "isLegacyTransport"))
          {
            v58 = (void *)v50;
            -[HMDRemoteMessageSenderContext deviceHandle](v135, "deviceHandle");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "setPreferredHandle:", v112);

            objc_msgSend(v90, "setObject:forKeyedSubscript:", v15, CFSTR("kIDSMessageSourceIDKey"));
            objc_msgSend(v16, "toID");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "setObject:forKeyedSubscript:", v113, CFSTR("kRemoteMessageIDSToIDKey"));

            objc_msgSend(v142, "hmf_dataForKey:", CFSTR("kIDSMessageResponseErrorDataKey"));
            v134 = v86;
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "setObject:forKeyedSubscript:", v114, CFSTR("kIDSMessageResponseErrorDataKey"));

            objc_msgSend(v54, "internal");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "setUserInfo:", v90);

            v93 = v135;
            objc_msgSend(v54, "setSenderContext:", v135);
            -[HMFMessageTransport delegate](self, "delegate");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = self;
            v96 = v134;
            objc_msgSend(v94, "messageTransport:didReceiveMessage:", v116, v54);
            v13 = v136;
            v95 = v131;
          }
          else
          {
            v58 = (void *)v50;
            objc_msgSend(v54, "internal");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "setUserInfo:", v90);

            objc_msgSend(v54, "setSenderContext:", v135);
            v93 = v135;
            -[HMDRemoteMessageSenderContext deviceHandle](v135, "deviceHandle");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = v131;
            -[HMDIDSMessageTransport legacyHandleIncomingRemoteMessage:sourceDevice:senderDeviceHandle:isSecure:incomingMessage:fromID:context:](self, "legacyHandleIncomingRemoteMessage:sourceDevice:senderDeviceHandle:isSecure:incomingMessage:fromID:context:", v54, v131, v94, v133, v142, v15, v16);
            v96 = v86;
            v13 = v136;
          }

        }
        else
        {
          v58 = (void *)v50;
          v108 = (void *)MEMORY[0x227676638]();
          v109 = self;
          HMFGetOSLogHandle();
          v110 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v147 = v111;
            v148 = 2112;
            v149 = (uint64_t)v54;
            _os_log_impl(&dword_2218F0000, v110, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine source device, dropping message: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v108);

          v13 = v136;
        }
        goto LABEL_62;
      }
      v58 = (void *)v50;
      v97 = (void *)MEMORY[0x227676638](v55);
      v98 = self;
      HMFGetOSLogHandle();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v100 = v15;
        v101 = v16;
        v102 = v13;
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v147 = v103;
        v148 = 2160;
        v149 = 1752392040;
        v150 = 2112;
        v151 = (uint64_t)v100;
        v104 = "%{public}@Unable to create sender device handle from fromID: %{mask.hash}@";
        v105 = v99;
        v106 = OS_LOG_TYPE_ERROR;
        v107 = 32;
LABEL_55:
        _os_log_impl(&dword_2218F0000, v105, v106, v104, buf, v107);

        v13 = v102;
        v16 = v101;
        v15 = v100;
      }
    }
    else
    {
      v58 = (void *)v50;
      v97 = (void *)MEMORY[0x227676638]();
      v98 = self;
      HMFGetOSLogHandle();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v100 = v15;
        v101 = v16;
        v102 = v13;
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v147 = v103;
        v148 = 2112;
        v149 = (uint64_t)v54;
        v104 = "%{public}@Dropping message from legacy transport: %@";
        v105 = v99;
        v106 = OS_LOG_TYPE_INFO;
        v107 = 22;
        goto LABEL_55;
      }
    }

    objc_autoreleasePoolPop(v97);
LABEL_62:
    v69 = v138;
LABEL_63:

    v59 = v139;
LABEL_64:

    v14 = v142;
    v12 = v143;
LABEL_65:

    goto LABEL_66;
  }
  v18 = (void *)v17;
  objc_msgSend(v16, "originalGUID");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!self || !v19)
  {
LABEL_11:

    goto LABEL_12;
  }
  -[HMDIDSMessageTransport messageDedupBuffer](self, "messageDedupBuffer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "containsObject:", v20);

  if ((v22 & 1) == 0)
  {
    -[HMDIDSMessageTransport messageDedupBuffer](self, "messageDedupBuffer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33 >= 0x1E)
    {
      -[HMDIDSMessageTransport messageDedupBuffer](self, "messageDedupBuffer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "removeObjectAtIndex:", 0);

    }
    -[HMDIDSMessageTransport messageDedupBuffer](self, "messageDedupBuffer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v20);

    goto LABEL_11;
  }

  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "originalGUID");
    v27 = v12;
    v28 = v15;
    v29 = v16;
    v30 = v13;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v147 = v26;
    v148 = 2114;
    v149 = (uint64_t)v31;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Received duplicate message with GUID: %{public}@", buf, 0x16u);

    v13 = v30;
    v16 = v29;
    v15 = v28;
    v12 = v27;

  }
  objc_autoreleasePoolPop(v23);
LABEL_66:

}

- (void)legacyHandleIncomingRemoteMessage:(id)a3 sourceDevice:(id)a4 senderDeviceHandle:(id)a5 isSecure:(BOOL)a6 incomingMessage:(id)a7 fromID:(id)a8 context:(id)a9
{
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HMDIDSMessageTransport *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  HMDIDSMessageTransport *v33;
  NSObject *v34;
  uint64_t v35;
  _QWORD *v36;
  id *v37;
  void *v38;
  HMDIDSMessageTransport *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  HMDIDSMessageTransport *v49;
  NSObject *v50;
  void *v51;
  HMDIDSMessageTransport *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  HMDIDSMessageTransport *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  HMDIDSMessageTransport *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  HMDIDSMessageTransport *v69;
  NSObject *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *context;
  id contexta;
  id v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  _QWORD v83[5];
  id v84;
  id v85;
  _QWORD aBlock[5];
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  BOOL v93;
  id location;
  uint8_t buf[4];
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  id v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v82 = a4;
  v78 = a5;
  v81 = a7;
  v77 = a8;
  v79 = a9;
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "destination");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transactionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (!objc_msgSend(v15, "type"))
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke;
    aBlock[3] = &unk_24E77C548;
    v36 = aBlock;
    v37 = &v92;
    objc_copyWeak(&v92, &location);
    aBlock[4] = v16;
    v87 = v80;
    v93 = a6;
    v88 = v17;
    v89 = v79;
    v90 = v82;
    v91 = v78;
    v24 = (void (**)(_QWORD, _QWORD, _QWORD))_Block_copy(aBlock);

LABEL_14:
    objc_destroyWeak(v37);
    objc_msgSend(v15, "setInternalResponseHandler:", v24);
    -[HMFMessageTransport delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "messageTransport:didReceiveMessage:", self, v15);
LABEL_45:

    goto LABEL_46;
  }
  if (objc_msgSend(v15, "type") != 1)
  {
    v83[0] = MEMORY[0x24BDAC760];
    v83[1] = 3221225472;
    v83[2] = __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_87;
    v83[3] = &unk_24E798D90;
    v36 = v83;
    v37 = &v84;
    objc_copyWeak(&v84, &location);
    v83[4] = v16;
    v24 = (void (**)(_QWORD, _QWORD, _QWORD))_Block_copy(v83);
    goto LABEL_14;
  }
  v18 = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v96 = (uint64_t)v21;
    v97 = 2114;
    v98 = (uint64_t)v22;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Received response to IDS message with transaction ID: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  -[HMDIDSMessageTransport pendingResponses](v19, "pendingResponses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v17);
  v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v81, "hmf_dictionaryForKey:", CFSTR("kIDSMessagePayloadKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryWithDictionary:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setObject:forKeyedSubscript:", v77, CFSTR("kIDSMessageSourceIDKey"));
    objc_msgSend(v81, "hmf_dataForKey:", CFSTR("kIDSMessageResponseErrorDataKey"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)MEMORY[0x24BDD1620];
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = 0;
      objc_msgSend(v29, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v30, v28, &v85);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v85;

      if (!v31)
      {
        context = (void *)MEMORY[0x227676638]();
        v33 = v19;
        HMFGetOSLogHandle();
        v34 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v96 = v35;
          v97 = 2112;
          v98 = (uint64_t)v32;
          v73 = (void *)v35;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize error with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 52, CFSTR("Generic error."), CFSTR("Failed to deserialize remote error."), 0, v32);
        v31 = objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("kIDSMessageResponseErrorDataKey"), v73);

      v74 = (void *)v31;
    }
    else
    {
      v74 = 0;
    }

    -[HMDIDSMessageTransport requestedCapabilities](v19, "requestedCapabilities");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", v17);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v44 = v43;
    else
      v44 = 0;
    contexta = v44;

    if (objc_msgSend(contexta, "count"))
    {
      -[HMDIDSMessageTransport destinationAddress](v19, "destinationAddress");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKeyedSubscript:", v17);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isEqualToString:", v77);

      if (!v47)
      {
        -[HMDIDSMessageTransport receivedResponses](v19, "receivedResponses");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", v17);
        v55 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v56 = v55;
        else
          v56 = 0;
        v57 = v56;

        if (!v57)
        {
          v55 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          -[HMDIDSMessageTransport receivedResponses](v19, "receivedResponses");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setObject:forKeyedSubscript:", v55, v17);

        }
        objc_msgSend(v55, "addObject:", v27, v74);
        v59 = objc_msgSend(v55, "count");
        if (-[HMDRemoteMessageTransport doesResponse:matchAllCapabilities:](v19, "doesResponse:matchAllCapabilities:", v27, contexta))
        {
          v60 = (void *)MEMORY[0x227676638]();
          v61 = v19;
          HMFGetOSLogHandle();
          v62 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v96 = (uint64_t)v63;
            _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_INFO, "%{public}@Response Matched all capabilities", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v60);
          -[HMDIDSMessageTransport _removePendingResponseTimerForTransaction:](v61, "_removePendingResponseTimerForTransaction:", v17);
          -[HMDIDSMessageTransport _pendingResponseTimeoutFor:](v61, "_pendingResponseTimeoutFor:", v17);
        }
        else
        {
          v64 = (void *)MEMORY[0x227676638](-[HMDIDSMessageTransport _restartPendingResponseTimerFor:withReducedFactor:](v19, "_restartPendingResponseTimerFor:withReducedFactor:", v17, v59 + 1));
          v65 = v19;
          HMFGetOSLogHandle();
          v66 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v96 = (uint64_t)v67;
            v97 = 2112;
            v98 = (uint64_t)v27;
            _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_INFO, "%{public}@Not Calling response handler with response %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v64);
          v68 = (void *)MEMORY[0x227676638]();
          v69 = v65;
          HMFGetOSLogHandle();
          v70 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v71 = (id)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend(v55, "count");
            *(_DWORD *)buf = 138543618;
            v96 = (uint64_t)v71;
            v97 = 2048;
            v98 = v72;
            _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_INFO, "%{public}@Currently received responses = %lu", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v68);
        }

        goto LABEL_44;
      }
      v48 = (void *)MEMORY[0x227676638]();
      v49 = v19;
      HMFGetOSLogHandle();
      v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v96 = (uint64_t)v51;
        v97 = 2160;
        v98 = 1752392040;
        v99 = 2112;
        v100 = v77;
        _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_INFO, "%{public}@Received response to directed message - selecting response from %{mask.hash}@", buf, 0x20u);

      }
    }
    else
    {
      v48 = (void *)MEMORY[0x227676638]();
      v52 = v19;
      HMFGetOSLogHandle();
      v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v96 = (uint64_t)v53;
        _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_INFO, "%{public}@No Capabilities were requested - selecting the first response", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v48);
    ((void (**)(_QWORD, void *, void *))v24)[2](v24, v74, v27);
    -[HMDIDSMessageTransport _removePendingResponseTransaction:](v19, "_removePendingResponseTransaction:", v17);
LABEL_44:

    goto LABEL_45;
  }
  v38 = (void *)MEMORY[0x227676638]();
  v39 = v19;
  HMFGetOSLogHandle();
  v40 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v96 = (uint64_t)v41;
    v97 = 2112;
    v98 = (uint64_t)v15;
    _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@No response handler, dropping message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v38);
  -[HMDRemoteMessageTransport postDidReceiveRemoteMessageWithNoListenerFromDevice:](v39, "postDidReceiveRemoteMessageWithNoListenerFromDevice:", v82);
  v24 = 0;
LABEL_46:

  objc_destroyWeak(&location);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t (**v25)(_QWORD, _QWORD);
  uint64_t v26;
  HMDIDSMessageTransport *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  void *context;
  void *contexta;
  HMDIDSMessageTransport *v41;
  id v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (v16)
  {
    -[HMDIDSMessageTransport messageContexts](self, "messageContexts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke;
    v46[3] = &unk_24E77C570;
    v20 = v16;
    v47 = v20;
    objc_msgSend(v19, "hmf_objectPassingTest:", v46);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v42 = v14;
      if (v17)
      {
        v22 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:underlyingError:", 3203, v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Communication failure."), 0, 0, v23);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v43 = 0;
      }
      objc_msgSend(v21, "userInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("HMDIDSMessageTransportCompletionHandlerKey"));
      v25 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v25)
        v26 = ((uint64_t (**)(_QWORD, void *))v25)[2](v25, v43);
      if (!a6)
      {
        context = (void *)MEMORY[0x227676638](v26);
        v27 = self;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        v41 = v27;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544131;
          v49 = v29;
          v50 = 2114;
          v51 = v20;
          v52 = 2113;
          v53 = v15;
          v54 = 2112;
          v55 = v17;
          _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message with IDS GUID %{public}@ from account: %{private}@ with error: %@", buf, 0x2Au);

          v27 = v41;
        }

        objc_autoreleasePoolPop(context);
        objc_msgSend(v21, "destination");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v31 = v30;
        else
          v31 = 0;
        v32 = v31;

        if (v17 && v32)
        {
          objc_msgSend(v32, "allRemoteDestinationStrings");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke_91;
          v44[3] = &unk_24E796918;
          v44[4] = v27;
          v45 = v17;
          objc_msgSend(v33, "na_each:", v44);

        }
        contexta = v32;
        objc_msgSend(v21, "userInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("HMDIDSMessageTransportTransactionIdentifierKey"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          -[HMDIDSMessageTransport pendingResponses](v27, "pendingResponses");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v35);
          v37 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

          if (v37)
            ((void (**)(_QWORD, void *, _QWORD))v37)[2](v37, v43, 0);
          -[HMDIDSMessageTransport _removePendingResponseTransaction:](v41, "_removePendingResponseTransaction:", v35);

        }
      }
      -[HMDIDSMessageTransport messageContexts](self, "messageContexts");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "removeObject:", v21);

      v14 = v42;
    }

  }
}

- (HMDIDSService)service
{
  return self->_service;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDAppleAccountManager)appleAccountManager
{
  return self->_appleAccountManager;
}

- (HMDRemoteAccountManager)remoteAccountManager
{
  return self->_remoteAccountManager;
}

- (NSMutableArray)messageContexts
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (HMFOperationBudget)sendMessageBudget
{
  return (HMFOperationBudget *)objc_getProperty(self, a2, 120, 1);
}

- (NSMutableDictionary)pendingResponses
{
  return self->_pendingResponses;
}

- (NSMutableDictionary)receivedResponses
{
  return self->_receivedResponses;
}

- (NSMutableDictionary)requestedCapabilities
{
  return self->_requestedCapabilities;
}

- (NSMutableDictionary)destinationAddress
{
  return self->_destinationAddress;
}

- (NSMutableDictionary)pendingResponseTimers
{
  return self->_pendingResponseTimers;
}

- (NSMutableOrderedSet)messageDedupBuffer
{
  return self->_messageDedupBuffer;
}

- (BOOL)isLegacyTransport
{
  return self->_legacyTransport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDedupBuffer, 0);
  objc_storeStrong((id *)&self->_pendingResponseTimers, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_requestedCapabilities, 0);
  objc_storeStrong((id *)&self->_receivedResponses, 0);
  objc_storeStrong((id *)&self->_pendingResponses, 0);
  objc_storeStrong((id *)&self->_sendMessageBudget, 0);
  objc_storeStrong((id *)&self->_messageContexts, 0);
  objc_storeStrong((id *)&self->_remoteAccountManager, 0);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

uint64_t __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUIDString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke_91(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "remoteAccountManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__handleSendMessageFailureWithError:destination:", *(_QWORD *)(a1 + 40), v4);

}

void __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  char v20;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_2;
    v10[3] = &unk_24E77C520;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v13 = v6;
    v20 = *(_BYTE *)(a1 + 88);
    v14 = *(id *)(a1 + 48);
    v15 = v5;
    v16 = *(id *)(a1 + 56);
    v17 = v8;
    v18 = *(id *)(a1 + 64);
    v19 = *(id *)(a1 + 72);
    dispatch_async(v9, v10);

  }
}

void __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 138543874;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Command %{public}@ completed with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v8);

}

void __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_2(uint64_t a1)
{
  HMDRemoteMessage *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  HMDRemoteDeviceMessageDestination *v19;
  void *v20;
  HMDRemoteDeviceMessageDestination *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  HMDRemoteMessage *v28;
  id v29;
  void *v30;
  HMDIDSMessageContext *v31;
  void *v32;
  HMDIDSMessageContext *v33;
  void *v34;
  void *v35;
  HMDRemoteMessage *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v2 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(unsigned __int8 *)(a1 + 104), 0.0);
  -[HMDRemoteMessage setTransactionIdentifier:](v2, "setTransactionIdentifier:", *(_QWORD *)(a1 + 56));
  v42 = 0;
  +[HMDRemoteMessageSerialization dictionaryForMessage:error:](HMDRemoteMessageSerialization, "dictionaryForMessage:error:", v2, &v42);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v42;
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  v6 = *(_QWORD *)(a1 + 64);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kIDSMessageResponseErrorDataKey"));

  }
  if ((objc_msgSend(*(id *)(a1 + 72), "fromServerStorage") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 80);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 32);
      v14 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v44 = v12;
      v45 = 2114;
      v46 = v13;
      v47 = 2114;
      v48 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Responding to non-server storage message, %{public}@ (%{public}@), as direct message", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 1;
  }
  objc_msgSend(*(id *)(a1 + 72), "toID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(*(id *)(a1 + 88), "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isCurrentAccount");

    if ((v17 & 1) != 0)
    {
      v18 = 0;
      goto LABEL_14;
    }
    objc_msgSend(*(id *)(a1 + 72), "toID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

LABEL_14:
  v19 = [HMDRemoteDeviceMessageDestination alloc];
  objc_msgSend(*(id *)(a1 + 40), "target");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v19, "initWithTarget:device:", v20, *(_QWORD *)(a1 + 88));

  -[HMDRemoteDeviceMessageDestination setPreferredHandle:](v21, "setPreferredHandle:", *(_QWORD *)(a1 + 96));
  v22 = *(void **)(a1 + 80);
  v41 = 0;
  v39 = v5;
  objc_msgSend(v22, "sendMessage:fromHandle:destination:priority:timeout:options:queueOneID:error:", v5, v18, v21, 300, v8, 0, 0.0, &v41);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v41;
  v24 = (void *)MEMORY[0x227676638]();
  v25 = *(id *)(a1 + 80);
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v23)
  {
    v28 = v2;
    v29 = v4;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v30;
      v45 = 2114;
      v46 = v23;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@IDS message response ack'd with identifier %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v31 = [HMDIDSMessageContext alloc];
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v23);
    v33 = -[HMDIDSMessageContext initWithIdentifier:destination:userInfo:](v31, "initWithIdentifier:destination:userInfo:", v32, v21, 0);

    objc_msgSend(*(id *)(a1 + 80), "messageContexts");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v33);

    v4 = v29;
    v2 = v28;
  }
  else
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFObject shortDescription](v2, "shortDescription");
      v36 = v2;
      v37 = v4;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v35;
      v45 = 2112;
      v46 = v38;
      v47 = 2112;
      v48 = v40;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@IDS message response, %@, failed with error: %@", buf, 0x20u);

      v4 = v37;
      v2 = v36;

    }
    objc_autoreleasePoolPop(v24);
  }

}

void __80__HMDIDSMessageTransport__startPendingResponseTimer_responseTimeout_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_pendingResponseTimeoutFor:", *(_QWORD *)(a1 + 32));

}

- (id)_identifierFromSerializedMessage:(void *)a1
{
  id v3;
  const __CFString *v4;

  v3 = a2;
  if (a1)
  {
    if (objc_msgSend(a1, "isLegacyTransport"))
      v4 = CFSTR("kIDSMessageIdentifierKey");
    else
      v4 = CFSTR("id");
    objc_msgSend(v3, "hmf_stringForKey:", v4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

void __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke(id *a1)
{
  void (**v2)(void *, void *);
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  HMDAssertionLogEvent *v54;
  void *v55;
  HMDAssertionLogEvent *v56;
  id v57;
  NSObject *v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  id v70;
  int v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  HMDIDSMessageContext *v100;
  void *v101;
  void *v102;
  HMDIDSMessageContext *v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  id v109;
  NSObject *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  NSObject *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  NSObject *v125;
  void *v126;
  void *v127;
  id v128;
  NSObject *v129;
  void *v130;
  HMDAssertionLogEvent *v131;
  void *v132;
  id v133;
  NSObject *v134;
  void *v135;
  id v136;
  NSObject *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  void (**v145)(void *, void *);
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  HMDAssertionLogEvent *context;
  void *contexta;
  void *contextb;
  void *contextc;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  _QWORD aBlock[4];
  id v164;
  id v165;
  uint8_t buf[4];
  void *v167;
  __int16 v168;
  id v169;
  __int16 v170;
  id v171;
  __int16 v172;
  id v173;
  uint64_t v174;

  v174 = *MEMORY[0x24BDAC8D0];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke_2;
  aBlock[3] = &unk_24E79B3A0;
  v165 = a1[6];
  v164 = a1[4];
  v2 = (void (**)(void *, void *))_Block_copy(aBlock);
  v3 = a1[5];
  if (!v3 || (objc_msgSend(v3, "isLegacyTransport") & 1) != 0)
    goto LABEL_6;
  objc_msgSend(a1[4], "responseHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v127 = (void *)MEMORY[0x227676638]();
    v128 = a1[5];
    HMFGetOSLogHandle();
    v129 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v129, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v167 = v130;
      _os_log_impl(&dword_2218F0000, v129, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Response handler should not be set in modern transport", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v127);
    v131 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Response handler should not be set in modern transport"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "submitLogEvent:", v131);

  }
  objc_msgSend(a1[4], "responseHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_6:
    objc_msgSend(a1[4], "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v6 = v8;

    if (!v6)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = a1[5];
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "destination");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v167 = v18;
        v168 = 2114;
        v169 = v20;
        v170 = 2112;
        v171 = v21;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message %{public}@ invalid destination: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter."), CFSTR("Invalid destination."), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v2[2](v2, v9);
      goto LABEL_100;
    }
    objc_msgSend(a1[5], "remoteMessageFromMessage:", a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[5];
    if (v10)
      v11 = objc_msgSend(v10, "isLegacyTransport") ^ 1;
    else
      v11 = 0;
    v162 = 0;
    +[HMDRemoteMessageSerialization dictionaryForMessage:isHH2Payload:error:](HMDRemoteMessageSerialization, "dictionaryForMessage:isHH2Payload:error:", v9, v11, &v162);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v162;
    if (!v12)
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = a1[5];
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v167 = v25;
        v168 = 2114;
        v169 = v26;
        v170 = 2112;
        v171 = v13;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize message %{public}@ with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      v2[2](v2, v13);
      goto LABEL_99;
    }
    v14 = a1[5];
    v150 = v13;
    if (!v14 || (objc_msgSend(v14, "isLegacyTransport") & 1) != 0)
    {
      context = 0;
LABEL_61:
      v145 = v2;
      objc_msgSend(v9, "timeout");
      v60 = 0.0;
      if (v61 > 0.0)
      {
        objc_msgSend(v9, "timeout");
        v60 = v62;
      }
      objc_msgSend(v9, "collapseID");
      v63 = objc_claimAutoreleasedReturnValue();
      if (v63)
      {
        v64 = (void *)objc_opt_class();
        objc_msgSend(v9, "name");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "target");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "queueOneIdentifierWithMessageName:target:collapseID:timeToLive:now:", v65, v66, v63, v67, v60);
        v160 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v160 = 0;
      }
      if ((objc_msgSend(v9, "sendOptions") & 1) != 0)
      {
        v68 = 8;
      }
      else
      {
        v68 = (uint64_t)a1[5];
        v69 = v9;
        v70 = v160;
        if (v68)
        {
          v71 = objc_msgSend((id)v68, "isLegacyTransport");
          v68 = 0;
          if (v71)
          {
            if (!v70)
              v68 = objc_msgSend(v69, "type") == 3;
          }
        }

      }
      objc_msgSend(a1[4], "destination");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v73 = v72;
      else
        v73 = 0;
      v74 = v73;

      if (v74 && objc_msgSend(v74, "restrictToResidentCapable"))
        v68 |= 4uLL;
      v144 = v74;
      v75 = objc_msgSend((id)objc_opt_class(), "priorityForMessage:", v9);
      v76 = a1[5];
      v161 = 0;
      objc_msgSend(v76, "sendMessage:fromHandle:destination:priority:timeout:options:queueOneID:error:", v12, context, v6, v75, v68, v160, v60, &v161);
      v77 = objc_claimAutoreleasedReturnValue();
      v141 = v161;
      v142 = (void *)v63;
      v152 = (void *)v77;
      if (v77)
      {
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDRemoteMessageLogEvent sentRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "sentRemoteMessage:transportType:", v9, objc_msgSend(a1[5], "transportType"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "submitLogEvent:", v79);

        v80 = (void *)MEMORY[0x227676638]();
        v81 = a1[5];
        HMFGetOSLogHandle();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "identifier");
          v84 = v12;
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v167 = v83;
          v168 = 2114;
          v169 = v85;
          v170 = 2114;
          v171 = v152;
          _os_log_impl(&dword_2218F0000, v82, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ ack'd with IDS GUID %{public}@", buf, 0x20u);

          v12 = v84;
        }

        objc_autoreleasePoolPop(v80);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = a1[6];
        if (v87)
        {
          v88 = (void *)objc_msgSend(v87, "copy");
          objc_msgSend(v86, "setObject:forKeyedSubscript:", v88, CFSTR("HMDIDSMessageTransportCompletionHandlerKey"));

        }
        v148 = v12;
        objc_msgSend(a1[4], "responseHandler");
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        v2 = v145;
        if (v89)
        {
          objc_msgSend(v9, "transactionIdentifier");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "setObject:forKeyedSubscript:", v90, CFSTR("HMDIDSMessageTransportTransactionIdentifierKey"));
          objc_msgSend(a1[4], "responseHandler");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = _Block_copy(v91);
          objc_msgSend(a1[5], "pendingResponses");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "setObject:forKeyedSubscript:", v92, v90);

          objc_msgSend(v9, "messagePayload");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("kRequestedCapabilitiesKey"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "requestedCapabilities");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setObject:forKeyedSubscript:", v95, v90);

          objc_msgSend(v6, "remoteDestinationString");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "destinationAddress");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setObject:forKeyedSubscript:", v97, v90);

          v99 = a1[5];
          objc_msgSend(v9, "timeout");
          objc_msgSend(v99, "_startPendingResponseTimer:responseTimeout:identifier:", v90, v152);

        }
        v100 = [HMDIDSMessageContext alloc];
        v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v152);
        objc_msgSend(a1[4], "destination");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = -[HMDIDSMessageContext initWithIdentifier:destination:userInfo:](v100, "initWithIdentifier:destination:userInfo:", v101, v102, v86);

        objc_msgSend(a1[5], "messageContexts");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "addObject:", v103);

        objc_msgSend(a1[5], "sendMessageBudget");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v101) = objc_msgSend(v105, "decrement");

        if ((_DWORD)v101)
        {
          objc_msgSend(a1[5], "sendMessageBudget");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend(v106, "isEmpty");

          v12 = v148;
          v108 = v141;
          if (v107)
          {
            v140 = (void *)MEMORY[0x227676638]();
            v109 = a1[5];
            HMFGetOSLogHandle();
            v110 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v167 = v111;
              _os_log_impl(&dword_2218F0000, v110, OS_LOG_TYPE_ERROR, "%{public}@Exceeded send message budget", buf, 0xCu);

              v12 = v148;
            }

            objc_autoreleasePoolPop(v140);
            objc_msgSend(a1[5], "sendMessageBudget");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = objc_msgSend(v112, "rate");
            +[HMDRemoteMessageExceedBudgetLogEvent eventWithBudgetRate:](HMDRemoteMessageExceedBudgetLogEvent, "eventWithBudgetRate:", v113, v114);
            v115 = (void *)objc_claimAutoreleasedReturnValue();

            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "submitLogEvent:", v115);

          }
        }
        else
        {
          v123 = (void *)MEMORY[0x227676638]();
          v124 = a1[5];
          HMFGetOSLogHandle();
          v125 = objc_claimAutoreleasedReturnValue();
          v108 = v141;
          if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v167 = v126;
            _os_log_impl(&dword_2218F0000, v125, OS_LOG_TYPE_INFO, "%{public}@Over send message budget", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v123);
          v12 = v148;
        }

        v13 = v150;
      }
      else
      {
        v117 = (void *)MEMORY[0x227676638]();
        v118 = a1[5];
        HMFGetOSLogHandle();
        v119 = objc_claimAutoreleasedReturnValue();
        v108 = v141;
        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "identifier");
          v149 = v12;
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "name");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v167 = v120;
          v168 = 2114;
          v169 = v121;
          v170 = 2112;
          v171 = v122;
          v172 = 2112;
          v173 = v141;
          _os_log_impl(&dword_2218F0000, v119, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message %{public}@ / %@ with error: %@", buf, 0x2Au);

          v12 = v149;
          v13 = v150;
        }

        objc_autoreleasePoolPop(v117);
        v2 = v145;
        v145[2](v145, v141);
      }

LABEL_99:
LABEL_100:

      goto LABEL_101;
    }
    v27 = (void *)objc_msgSend(v12, "mutableCopy");
    v28 = a1[5];
    v29 = v27;
    if (v28)
    {
      objc_msgSend(v28, "appleAccountManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "device");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v31, "idsIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          objc_msgSend(v32, "UUIDString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v34, CFSTR("idsId"));

        }
        else
        {
          v146 = v12;
          v40 = (void *)MEMORY[0x227676638]();
          v41 = v28;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v158 = v40;
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v167 = v43;
            v168 = 2112;
            v169 = v31;
            _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Cannot set the source IDS device identifier because IDS identifier is unknown for current device: %@", buf, 0x16u);

            v40 = v158;
          }

          objc_autoreleasePoolPop(v40);
          v12 = v146;
        }

      }
      else
      {
        v35 = (void *)MEMORY[0x227676638]();
        v36 = v28;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v157 = v29;
          v38 = v12;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v167 = v39;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Cannot set the source IDS device identifier because current device is unknown", buf, 0xCu);

          v12 = v38;
          v29 = v157;
        }

        objc_autoreleasePoolPop(v35);
      }

    }
    if (objc_msgSend(v9, "type") != 1)
    {
      context = 0;
      v13 = v150;
LABEL_60:
      v59 = objc_msgSend(v29, "copy");

      v12 = (void *)v59;
      goto LABEL_61;
    }
    objc_msgSend(a1[4], "userInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("kIDSMessageResponseErrorDataKey"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v45, CFSTR("kIDSMessageResponseErrorDataKey"));
    v46 = a1[5];
    v47 = v9;
    v48 = v47;
    if (!v46 || objc_msgSend(v47, "type") != 1)
    {
      context = 0;
      v13 = v150;
LABEL_59:

      goto LABEL_60;
    }
    objc_msgSend(v48, "remoteToID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      context = 0;
      v13 = v150;
LABEL_58:

      goto LABEL_59;
    }
    v159 = v49;
    v147 = v12;
    objc_msgSend(v48, "destination");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v51 = v50;
    else
      v51 = 0;
    v52 = v51;

    v151 = v52;
    if (v52)
    {
      objc_msgSend(v52, "device");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "account");
      v54 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        if ((-[HMDAssertionLogEvent isCurrentAccount](v54, "isCurrentAccount") & 1) != 0)
        {
          context = 0;
          v13 = v150;
LABEL_57:

          v12 = v147;
          v49 = v159;
          goto LABEL_58;
        }
        +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v159);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          v56 = v55;
          context = v56;
LABEL_56:
          v13 = v150;

          goto LABEL_57;
        }
        contexta = (void *)MEMORY[0x227676638]();
        v57 = v46;
        HMFGetOSLogHandle();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v167 = v143;
          v168 = 2112;
          v169 = v159;
          _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_ERROR, "%{public}@Invalid toID to create an account handle: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(contexta);
        v56 = 0;
      }
      else
      {
        contextc = (void *)MEMORY[0x227676638]();
        v136 = v46;
        HMFGetOSLogHandle();
        v137 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v137, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v167 = v138;
          _os_log_impl(&dword_2218F0000, v137, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Destination device does not have an associated account", buf, 0xCu);

        }
        objc_autoreleasePoolPop(contextc);
        v56 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Destination device does not have an associated account"));
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "submitLogEvent:", v56);

        v54 = 0;
      }
    }
    else
    {
      contextb = (void *)MEMORY[0x227676638]();
      v133 = v46;
      HMFGetOSLogHandle();
      v134 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v134, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v167 = v135;
        _os_log_impl(&dword_2218F0000, v134, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Response message is not a device destination", buf, 0xCu);

      }
      objc_autoreleasePoolPop(contextb);
      v54 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Response message is not a device destination"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v56 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
      -[HMDAssertionLogEvent submitLogEvent:](v56, "submitLogEvent:", v54);
    }
    context = 0;
    goto LABEL_56;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("Not supported."), CFSTR("Response handler should not be set when using IDS transport for modern transport"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2[2](v2, v6);
LABEL_101:

}

void __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = _Block_copy(*(const void **)(a1 + 40));
  v4 = v3;
  if (v3)
    (*((void (**)(void *, id))v3 + 2))(v3, v5);

  objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, v5);
}

+ (unint64_t)restriction
{
  return 1;
}

+ (int64_t)priorityForMessage:(id)a3
{
  return 300;
}

+ (unint64_t)sendMessageLimit
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("remoteSendMessageLimit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5)
  {
    objc_msgSend(v3, "numberValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

  }
  else
  {
    v7 = 1800;
  }

  return v7;
}

+ (_HMFRate)sendMessageRate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  _HMFRate result;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceForKey:", CFSTR("remoteSendMessageRate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  if (v7 <= 0.0)
  {
    v10 = 60.0;
  }
  else
  {
    objc_msgSend(v4, "numberValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

  }
  v11 = (unint64_t)((double)(unint64_t)objc_msgSend(a1, "sendMessageLimit") / v10);

  v12 = v11;
  v13 = v10;
  result.period = v13;
  result.value = v12;
  return result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_47779 != -1)
    dispatch_once(&logCategory__hmf_once_t2_47779, &__block_literal_global_47780);
  return (id)logCategory__hmf_once_v3_47781;
}

+ (id)queueOneIdentifierWithMessageName:(id)a3 target:(id)a4 collapseID:(id)a5 timeToLive:(double)a6 now:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v13)
  {
LABEL_7:
    v40 = (void *)_HMFPreconditionFailure();
    return sha256(v40, v41, v42, v43, v44, v45, v46, v47, v50);
  }
  v15 = v14;
  v23 = (void *)MEMORY[0x227676638]();
  v24 = fmax(a6 * 3.0, 28800.0);
  if (v24 > 604800.0)
    v24 = 604800.0;
  v25 = (uint64_t)v24;
  v49 = 0;
  sha256(CFSTR("Q1Offset"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "getBytes:length:", &v49, 8);

  v27 = v49 % v25;
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v48 = (v27 + (unint64_t)v28) / v25;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v48, 8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  sha256(CFSTR("Q1Id"), v30, v31, v32, v33, v34, v35, v36, (uint64_t)v29);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "hmf_hexadecimalRepresentation");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v23);
  return v38;
}

void __37__HMDIDSMessageTransport_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_47781;
  logCategory__hmf_once_v3_47781 = v0;

}

@end
