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

- (id)initModernTransportWithAccountRegistry:(id)a3
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
  objc_msgSend(v5, "modernService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDIDSMessageTransport initModernTransportWithAccountRegistry:service:appleAccountManager:remoteAccountManager:](self, "initModernTransportWithAccountRegistry:service:appleAccountManager:remoteAccountManager:", v4, v6, v7, v8);

  return v9;
}

- (id)initModernTransportWithAccountRegistry:(id)a3 service:(id)a4 appleAccountManager:(id)a5 remoteAccountManager:(id)a6
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
    v20 = objc_alloc(MEMORY[0x1E0D28648]);
    v21 = objc_msgSend((id)objc_opt_class(), "sendMessageLimit");
    v22 = objc_msgSend((id)objc_opt_class(), "sendMessageRate");
    v24 = objc_msgSend(v20, "initWithLimit:rate:", v21, v22, v23);
    sendMessageBudget = v14->_sendMessageBudget;
    v14->_sendMessageBudget = (HMFOperationBudget *)v24;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = objc_claimAutoreleasedReturnValue();
    messageContexts = v14->_messageContexts;
    v14->_messageContexts = (NSMutableArray *)v26;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    pendingResponses = v14->_pendingResponses;
    v14->_pendingResponses = (NSMutableDictionary *)v28;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = objc_claimAutoreleasedReturnValue();
    receivedResponses = v14->_receivedResponses;
    v14->_receivedResponses = (NSMutableDictionary *)v30;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v32 = objc_claimAutoreleasedReturnValue();
    requestedCapabilities = v14->_requestedCapabilities;
    v14->_requestedCapabilities = (NSMutableDictionary *)v32;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v34 = objc_claimAutoreleasedReturnValue();
    destinationAddress = v14->_destinationAddress;
    v14->_destinationAddress = (NSMutableDictionary *)v34;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v36 = objc_claimAutoreleasedReturnValue();
    pendingResponseTimers = v14->_pendingResponseTimers;
    v14->_pendingResponseTimers = (NSMutableDictionary *)v36;

    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 30);
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

  v14 = *MEMORY[0x1E0C80C00];
  if (self && -[HMDIDSMessageTransport isModernTransport](self, "isModernTransport"))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
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
LABEL_7:
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
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
      goto LABEL_7;
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
  HMDIDSMessageTransport *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDDevice *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDIDSMessageTransport *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDIDSMessageTransport *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMDDevice *v38;
  void *v39;
  int v41;
  void *v42;
  __int16 v43;
  HMDDevice *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDIDSMessageTransport appleAccountManager](self, "appleAccountManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "handles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (!v9)
  {
    -[HMDIDSMessageTransport remoteAccountManager](self, "remoteAccountManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "deviceForSenderContext:", v4);
    v11 = (HMDDevice *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v4, "deviceHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceForHandle:", v10);
  v11 = (HMDDevice *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543362;
      v42 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Received message from unknown device on our account, creating placeholder device", (uint8_t *)&v41, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "deviceHandle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayWithObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "localDeviceHandle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v4, "localDeviceHandle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v20);

    }
    v21 = [HMDDevice alloc];
    objc_msgSend(v4, "deviceHandle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v4, "deviceVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDDevice initWithIdentifier:handles:name:productInfo:version:capabilities:](v21, "initWithIdentifier:handles:name:productInfo:version:capabilities:", v23, v24, 0, 0, v25, 0);

    objc_msgSend(v6, "addDevice:", v11);
  }
  v26 = (void *)MEMORY[0x1D17BA0A0]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138543618;
    v42 = v29;
    v43 = 2112;
    v44 = v11;
    _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated sender on our account: %@", (uint8_t *)&v41, 0x16u);

  }
  objc_autoreleasePoolPop(v26);
  objc_msgSend(v6, "senderCorrelationIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    objc_msgSend(v4, "accountIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "senderCorrelationIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = v27;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "shortDescription");
        v38 = (HMDDevice *)objc_claimAutoreleasedReturnValue();
        v41 = 138544130;
        v42 = v36;
        v43 = 2114;
        v44 = v38;
        v45 = 2160;
        v46 = 1752392040;
        v47 = 2112;
        v48 = v32;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Updating account %{public}@ with inferred mergeID %{mask.hash}@", (uint8_t *)&v41, 0x2Au);

      }
      objc_autoreleasePoolPop(v33);
      -[HMDIDSMessageTransport appleAccountManager](v34, "appleAccountManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "updateSenderCorrelationIdentifier:", v32);

    }
    goto LABEL_16;
  }
LABEL_17:

  return v11;
}

- (BOOL)isSecure
{
  objc_super v4;

  if (self && -[HMDIDSMessageTransport isModernTransport](self, "isModernTransport"))
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

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[HMDIDSMessageTransport isValidMessage:](self, "isValidMessage:", v4))
    goto LABEL_13;
  if (self && -[HMDIDSMessageTransport isModernTransport](self, "isModernTransport"))
    goto LABEL_6;
  -[HMDIDSMessageTransport appleAccountManager](self, "appleAccountManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v17, 0xCu);

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
    v10 = (void *)MEMORY[0x1D17BA0A0]();
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
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  _BOOL8 v7;

  v3 = a3;
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(v3, "destination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_6;
    }
  }
  v7 = objc_msgSend(v3, "restriction") & 1;
LABEL_6:

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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
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
  id *v16;
  id v17;
  id v18;
  HMDIDSMessageTransport *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDIDSMessageTransport *v26;
  NSObject *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  HMDIDSMessageTransport *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  id *v37;
  id v38;
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
  void *v49;
  void *v50;
  uint64_t v51;
  HMDIDSMessageTransport *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  HMDIDSMessageTransport *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  HMDIDSMessageTransport *v66;
  NSObject *v67;
  void *v68;
  const __CFString *v69;
  id v71;
  void *v72;
  HMDIDSMessageTransport *v73;
  void *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t buf[4];
  uint64_t v82;
  __int16 v83;
  HMDIDSMessageTransport *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  id v90;
  __int16 v91;
  const __CFString *v92;
  __int16 v93;
  id v94;
  _BYTE v95[128];
  uint64_t v96;
  _QWORD v97[3];

  v11 = a8;
  v16 = a10;
  v97[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = (HMDIDSMessageTransport *)a5;
  v20 = a9;
  if (v19)
  {
    -[HMDIDSMessageTransport allRemoteDestinationStrings](v19, "allRemoteDestinationStrings");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v75, "count"))
    {
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = v20;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v82 = (uint64_t)v35;
        v83 = 2112;
        v84 = v19;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@No valid destination strings for destination: %@", buf, 0x16u);

        v20 = v34;
        v16 = a10;
      }

      objc_autoreleasePoolPop(v31);
      if (!v16)
      {
        v30 = 0;
LABEL_68:

        goto LABEL_69;
      }
      v73 = v19;
      v36 = (void *)MEMORY[0x1E0CB35C8];
      v96 = *MEMORY[0x1E0CB3388];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 3203);
      v37 = v16;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, &v96, 1);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "hmErrorWithCode:userInfo:", 54, v38);
      v30 = 0;
      *v37 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:

      v19 = v73;
      goto LABEL_68;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((v11 & 1) != 0)
    {
      v39 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34160]);
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0D34180]);
      if ((v11 & 2) == 0)
      {
LABEL_5:
        if ((v11 & 8) == 0)
          goto LABEL_6;
        goto LABEL_20;
      }
    }
    else if ((v11 & 2) == 0)
    {
      goto LABEL_5;
    }
    objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34190]);
    if ((v11 & 8) == 0)
    {
LABEL_6:
      if ((v11 & 4) == 0)
      {
LABEL_8:
        if (a7 <= 0.0)
        {
          if ((v11 & 2) == 0)
            objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1E8B36B78, *MEMORY[0x1E0D341C8]);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D341C8]);

        }
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D341A8]);
        objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34120]);
        v72 = v17;
        v73 = v19;
        v71 = v20;
        if (v18)
        {
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          -[HMDIDSMessageTransport service](self, "service");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "accounts");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v78;
            while (2)
            {
              for (i = 0; i != v43; ++i)
              {
                if (*(_QWORD *)v78 != v44)
                  objc_enumerationMutation(v41);
                v46 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
                objc_msgSend(v46, "hmd_handles");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(v47, "containsObject:", v18);

                if (v48)
                {
                  objc_msgSend(v18, "URI");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "prefixedURI");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "setObject:forKeyedSubscript:", v50, *MEMORY[0x1E0D34178]);

                  v38 = v46;
                  goto LABEL_35;
                }
              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
              if (v43)
                continue;
              break;
            }
            v38 = 0;
LABEL_35:
            v17 = v72;
          }
          else
          {
            v38 = 0;
          }

        }
        else
        {
          v38 = 0;
        }
        if (self && -[HMDIDSMessageTransport isModernTransport](self, "isModernTransport"))
        {
          objc_msgSend(v17, "hmf_stringForKey:", CFSTR("kIDSMessageIdentifierKey"));
          v51 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v17, "shortDescription");
          v51 = objc_claimAutoreleasedReturnValue();
        }
        v52 = (HMDIDSMessageTransport *)v51;
        if (shouldLogPrivateInformation())
        {
          v53 = v22;
        }
        else
        {
          v54 = (void *)objc_msgSend(v22, "mutableCopy");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0D34178]);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "removeObjectsForKeys:", v55);

          v53 = (id)objc_msgSend(v54, "copy");
        }
        v56 = (void *)MEMORY[0x1D17BA0A0]();
        v57 = self;
        HMFGetOSLogHandle();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = (void *)v59;
          switch(a6)
          {
            case 100:
              v61 = CFSTR("Sync");
              break;
            case 200:
              v61 = CFSTR("Default");
              break;
            case 300:
              v61 = CFSTR("Urgent");
              break;
            default:
              v61 = CFSTR("Unknown");
              break;
          }
          *(_DWORD *)buf = 138544899;
          v82 = v59;
          v83 = 2114;
          v84 = v52;
          v85 = 2160;
          v86 = 1752392040;
          v87 = 2112;
          v88 = v75;
          v89 = 2113;
          v90 = v38;
          v91 = 2114;
          v92 = v61;
          v93 = 2114;
          v94 = v53;
          _os_log_impl(&dword_1CD062000, v58, OS_LOG_TYPE_INFO, "%{public}@Sending IDS message %{public}@ to %{mask.hash}@, from account %{private}@ with priority, %{public}@, options: %{public}@", buf, 0x48u);

        }
        objc_autoreleasePoolPop(v56);

        -[HMDIDSMessageTransport service](v57, "service");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v75);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0;
        v17 = v72;
        v64 = objc_msgSend(v62, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v72, v38, v63, a6, v22, &v76, a10);
        v30 = v76;

        if ((v64 & 1) == 0)
        {
          v65 = (void *)MEMORY[0x1D17BA0A0]();
          v66 = v57;
          HMFGetOSLogHandle();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            if (self)
            {
              objc_msgSend(v72, "hmf_stringForKey:", CFSTR("kIDSMessageIdentifierKey"));
              self = (HMDIDSMessageTransport *)objc_claimAutoreleasedReturnValue();
            }
            if (a10)
              v69 = (const __CFString *)*a10;
            else
              v69 = CFSTR("<nil>");
            *(_DWORD *)buf = 138543874;
            v82 = (uint64_t)v68;
            v83 = 2114;
            v84 = self;
            v85 = 2112;
            v86 = (uint64_t)v69;
            _os_log_impl(&dword_1CD062000, v67, OS_LOG_TYPE_INFO, "%{public}@Failed to send IDS message %{public}@ due to error: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v65);

          v30 = 0;
        }
        v20 = v71;
        goto LABEL_67;
      }
LABEL_7:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D340E8]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D341B0]);

      goto LABEL_8;
    }
LABEL_20:
    objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1E8B32CA0, *MEMORY[0x1E0D341A0]);
    if ((v11 & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v25 = (void *)MEMORY[0x1D17BA0A0]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = v20;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v82 = (uint64_t)v29;
    _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Destination is required", buf, 0xCu);

    v20 = v28;
    v16 = a10;
  }

  objc_autoreleasePoolPop(v25);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v30 = 0;
    *v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
LABEL_69:

  return v30;
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

  v28 = *MEMORY[0x1E0C80C00];
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
    v13 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Restarted Pending response timer for %lld sec, for transaction: %{public}@", (uint8_t *)&v22, 0x20u);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Timer already expired for transaction: %{public}@", (uint8_t *)&v22, 0x16u);

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

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Pending Response timeout for transaction: %{public}@", (uint8_t *)&v26, 0x16u);

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
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = v6;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v23;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@ Selecting response based on requested capabilities", (uint8_t *)&v26, 0xCu);

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
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 8, 0);
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

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (fabs(a4) < 2.22044605e-16 || a4 <= 0.0)
    v11 = remotePendingResponseTimerNanoseconds;
  else
    v11 = (uint64_t)(a4 * 1000000000.0);
  -[HMDIDSMessageTransport workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v12);

  v14 = dispatch_time(0, v11);
  dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, remotePendingResponseLeewayNanoseconds);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __80__HMDIDSMessageTransport__startPendingResponseTimer_responseTimeout_identifier___block_invoke;
  handler[3] = &unk_1E89BE218;
  objc_copyWeak(&v24, &location);
  v15 = v8;
  v23 = v15;
  dispatch_source_set_event_handler(v13, handler);
  dispatch_resume(v13);
  v16 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Starting poll to track response for message with transaction %{public}@ for %lld secs", buf, 0x20u);

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

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Cancelling timer for transaction: %{public}@", (uint8_t *)&v12, 0x16u);

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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  HMDRemoteMessageSenderContext *v28;
  void *v29;
  id v30;
  void *v31;
  HMDRemoteMessageSenderContext *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

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
    goto LABEL_15;
  }
  if (!self || !-[HMDIDSMessageTransport isModernTransport](self, "isModernTransport"))
  {
    -[HMDIDSMessageTransport appleAccountManager](self, "appleAccountManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "senderCorrelationIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *a5;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kIDSMessagePayloadKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kIDSMessageNameKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessageTransport homeMembershipVerifier](self, "homeMembershipVerifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v10);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "senderCorrelationIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isEqual:", v17) & 1) != 0)
    {
      v15 = 1;
    }
    else
    {
      v33 = v19;
      v34 = v17;
      objc_msgSend(v14, "handles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "containsObject:", v20);

      if ((v23 & 1) != 0)
        goto LABEL_13;
      -[HMDIDSMessageTransport pendingResponses](self, "pendingResponses");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hmf_UUIDForKey:", CFSTR("kIDSMessageRequestTransactionIDKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
LABEL_13:
        v15 = 1;
        v19 = v33;
        v17 = v34;
        goto LABEL_14;
      }
      +[HMDAccountIdentifier accountIdentifierForMessageContext:](HMDAccountIdentifier, "accountIdentifierForMessageContext:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HMDRemoteMessageSenderContext initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:]([HMDRemoteMessageSenderContext alloc], "initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:", v36, v20, v21, 0, 0);
      -[HMDIDSMessageTransport remoteAccountManager](self, "remoteAccountManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v28;
      v30 = (id)objc_msgSend(v29, "deviceForSenderContext:", v28);

      v17 = v34;
      if ((objc_msgSend(v37, "userWithMergeIdIsMemberOfAHome:", v34) & 1) != 0)
      {
        v15 = 1;
        v19 = v33;
      }
      else
      {
        v19 = v33;
        objc_msgSend(v33, "hmf_UUIDForKey:", CFSTR("kInvitationIdentifierKey"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v37, "expectingInvitationResponseForIdentifier:") & 1) != 0)
          v15 = 1;
        else
          v15 = objc_msgSend(v35, "isEqual:", CFSTR("kAccessHomeInviteRequestKey"));

      }
    }

LABEL_14:
LABEL_15:

    goto LABEL_16;
  }
  v15 = 1;
LABEL_16:

  return v15;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  HMDIDSMessageTransport *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  HMDIDSMessageTransport *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  os_log_type_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  BOOL v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  HMDIDSMessageTransport *v52;
  NSObject *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HMDIDSMessageTransport *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  HMDRemoteDeviceMessageDestination *v72;
  void *v73;
  void *v74;
  HMDRemoteDeviceMessageDestination *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  HMDIDSMessageTransport *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  HMDRemoteMessageSenderContext *v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  HMDIDSMessageTransport *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  HMDIDSMessageTransport *v109;
  NSObject *v110;
  void *v111;
  HMDAssertionLogEvent *v112;
  void *v113;
  void *v114;
  HMDIDSMessageTransport *v115;
  NSObject *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  HMDIDSMessageTransport *v121;
  NSObject *v122;
  void *v123;
  HMDAssertionLogEvent *v124;
  void *v125;
  void *v126;
  HMDIDSMessageTransport *v127;
  NSObject *v128;
  void *v129;
  id v130;
  HMDIDSMessageTransport *contexta;
  void *context;
  HMDRemoteDeviceMessageDestination *v133;
  id v134;
  uint64_t v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  HMDRemoteMessageSenderContext *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  void *v149;
  id v150;
  id v151;
  id v152;
  uint8_t buf[4];
  void *v154;
  __int16 v155;
  uint64_t v156;
  __int16 v157;
  uint64_t v158;
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  id v162;
  __int16 v163;
  void *v164;
  uint64_t v165;

  v165 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v150 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v15, "originalGUID");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_12:
    if (self && -[HMDIDSMessageTransport isModernTransport](self, "isModernTransport"))
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        goto LABEL_19;
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v154 = v35;
      v155 = 2112;
      v156 = (uint64_t)v36;
      v157 = 2160;
      v158 = 1752392040;
      v159 = 2112;
      v160 = (uint64_t)v14;
      v37 = v34;
      v38 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v154 = v35;
      v155 = 2112;
      v156 = (uint64_t)v36;
      v157 = 2160;
      v158 = 1752392040;
      v159 = 2112;
      v160 = (uint64_t)v14;
      v37 = v34;
      v38 = OS_LOG_TYPE_INFO;
    }
    _os_log_impl(&dword_1CD062000, v37, v38, "%{public}@Received incoming IDS message: %@, from: %{mask.hash}@", buf, 0x2Au);

LABEL_19:
    objc_autoreleasePoolPop(v32);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kIDSMessageNameKey"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "reportIncomingIDSPush:fromToken:", v39, v14);

    if (!v14)
    {
      v108 = (void *)MEMORY[0x1D17BA0A0]();
      v109 = self;
      HMFGetOSLogHandle();
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v154 = v111;
        _os_log_impl(&dword_1CD062000, v110, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Received incoming message with nil fromID", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v108);
      v112 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Received incoming message with nil fromID"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "submitLogEvent:", v112);

      v114 = (void *)MEMORY[0x1D17BA0A0]();
      v115 = v109;
      HMFGetOSLogHandle();
      v116 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "originalGUID");
        v118 = v12;
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v154 = v117;
        v155 = 2114;
        v156 = (uint64_t)v119;
        _os_log_impl(&dword_1CD062000, v116, OS_LOG_TYPE_ERROR, "%{public}@Received incoming message, %{public}@, with nil fromID", buf, 0x16u);

        v12 = v118;
      }

      objc_autoreleasePoolPop(v114);
      v27 = v150;
      goto LABEL_58;
    }
    +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v14);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccountIdentifier accountIdentifierForMessageContext:](HMDAccountIdentifier, "accountIdentifierForMessageContext:", v15);
    v43 = objc_claimAutoreleasedReturnValue();
    v152 = v13;
    v148 = v12;
    v44 = -[HMDIDSMessageTransport _shouldProcessLegacyIDSMessageFromID:context:message:service:](self, "_shouldProcessLegacyIDSMessageFromID:context:message:service:", v14, v15, &v152, v12);
    v45 = v152;

    v149 = v15;
    if (!v44)
    {
      v50 = (void *)v43;
      v51 = (void *)MEMORY[0x1D17BA0A0]();
      v52 = self;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "senderCorrelationIdentifier");
        v145 = v41;
        v55 = v14;
        v56 = v45;
        v57 = v39;
        v58 = v42;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v154 = v54;
        v155 = 2114;
        v156 = (uint64_t)v57;
        v157 = 2112;
        v158 = (uint64_t)v59;
        _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_ERROR, "%{public}@Dropping incoming message %{public}@ from unknown mergeID %@", buf, 0x20u);

        v42 = v58;
        v39 = v57;
        v45 = v56;
        v14 = v55;
        v41 = v145;

      }
      objc_autoreleasePoolPop(v51);
      v27 = v150;
      goto LABEL_57;
    }
    v147 = v39;
    v151 = 0;
    +[HMDRemoteMessageSerialization remoteMessageWithDictionary:error:](HMDRemoteMessageSerialization, "remoteMessageWithDictionary:error:", v45, &v151);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v151;
    if (v46)
    {
      v48 = -[HMDIDSMessageTransport isSecure](self, "isSecure");
      if ((_DWORD)v48)
        v48 = objc_msgSend(v46, "setSecure:", 1);
      if (v41)
      {
        v143 = v45;
        if (objc_msgSend(v46, "isSecure"))
        {
          objc_msgSend(v46, "sourceVersion");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            objc_msgSend(v46, "sourceVersion");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v49 = 0;
        }
        v137 = v47;
        v146 = v41;
        v142 = v42;
        v138 = (void *)v43;
        v140 = -[HMDRemoteMessageSenderContext initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:]([HMDRemoteMessageSenderContext alloc], "initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:", v41, v42, v43, v49, 0);
        -[HMDIDSMessageTransport deviceForSenderContext:](self, "deviceForSenderContext:");
        v66 = objc_claimAutoreleasedReturnValue();
        if (v66)
        {
          v67 = (void *)v66;

          v68 = (void *)MEMORY[0x1E0C99E08];
          objc_msgSend(v46, "messagePayload");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "dictionaryWithDictionary:", v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v70, "setObject:forKeyedSubscript:", v14, CFSTR("kIDSMessageSourceIDKey"));
          v136 = v70;
          objc_msgSend(v46, "setMessagePayload:", v70);
          objc_msgSend(v46, "setRestriction:", objc_msgSend((id)objc_opt_class(), "restriction"));
          v71 = objc_msgSend(v46, "isSecure");
          v72 = [HMDRemoteDeviceMessageDestination alloc];
          objc_msgSend(v46, "destination");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "target");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = v67;
          v75 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v72, "initWithTarget:device:", v74, v67);

          objc_msgSend(v46, "setDestination:", v75);
          if ((v71 & 1) != 0
            || !+[HMDSecureRemoteSession isSecureRemoteSessionMessage:](HMDSecureRemoteSession, "isSecureRemoteSessionMessage:", v46))
          {
            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDRemoteMessageLogEvent receivedRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "receivedRemoteMessage:transportType:", v46, -[HMDIDSMessageTransport transportType](self, "transportType"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "submitLogEvent:", v77);

          }
          objc_msgSend(v46, "userInfo");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (void *)objc_msgSend(v78, "mutableCopy");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDIDSMessageTransport transportType](self, "transportType"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setObject:forKeyedSubscript:", v80, CFSTR("kRemoteMessageTransportAttributionKey"));

          if (self && -[HMDIDSMessageTransport isModernTransport](self, "isModernTransport"))
          {
            -[HMDRemoteMessageSenderContext deviceHandle](v140, "deviceHandle");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDRemoteDeviceMessageDestination setPreferredHandle:](v75, "setPreferredHandle:", v81);

            objc_msgSend(v143, "hmf_stringForKey:", CFSTR("idsId"));
            v135 = objc_claimAutoreleasedReturnValue();
            v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v135);
            v83 = v139;
            v84 = v82;
            v85 = v83;
            v86 = v84;
            v42 = v142;
            if (v84)
            {
              v133 = v75;
              v134 = v84;
              objc_msgSend(v83, "account");
              v87 = v83;
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = objc_msgSend(v88, "isCurrentAccount");

              if (v89)
              {
                v90 = (void *)MEMORY[0x1D17BA0A0]();
                v91 = self;
                HMFGetOSLogHandle();
                v92 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  contexta = v91;
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v154 = v93;
                  v155 = 2112;
                  v156 = (uint64_t)v87;
                  _os_log_impl(&dword_1CD062000, v92, OS_LOG_TYPE_DEBUG, "%{public}@Not updating IDS device identifier for device because it belongs to the current account: %@", buf, 0x16u);

                  v91 = contexta;
                }

                objc_autoreleasePoolPop(v90);
                v85 = v87;
                v75 = v133;
                v86 = v134;
              }
              else
              {
                objc_msgSend(v87, "sharedUserIDSIdentifier");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v86 = v134;
                v99 = objc_msgSend(v98, "isEqual:", v134);

                v85 = v87;
                v75 = v133;
                if ((v99 & 1) == 0)
                {
                  context = (void *)MEMORY[0x1D17BA0A0]();
                  v100 = self;
                  HMFGetOSLogHandle();
                  v101 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                  {
                    HMFGetLogIdentifier();
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "sharedUserIDSIdentifier");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544642;
                    v154 = v102;
                    v155 = 2160;
                    v156 = 1752392040;
                    v157 = 2112;
                    v158 = (uint64_t)v134;
                    v159 = 2160;
                    v160 = 1752392040;
                    v161 = 2112;
                    v162 = v103;
                    v163 = 2112;
                    v164 = v85;
                    _os_log_impl(&dword_1CD062000, v101, OS_LOG_TYPE_DEFAULT, "%{public}@Setting shared user's IDS device identifier to: %{mask.hash}@, was: %{mask.hash}@, for device: %@", buf, 0x3Eu);

                    v42 = v142;
                    v75 = v133;
                  }

                  objc_autoreleasePoolPop(context);
                  v86 = v134;
                  objc_msgSend(v85, "setSharedUserIDSIdentifier:", v134);
                }
              }
            }

            v96 = (void *)v135;
            objc_msgSend(v79, "setObject:forKeyedSubscript:", v14, CFSTR("kIDSMessageSourceIDKey"));
            objc_msgSend(v15, "toID");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "setObject:forKeyedSubscript:", v104, CFSTR("kRemoteMessageIDSToIDKey"));

            objc_msgSend(v143, "hmf_dataForKey:", CFSTR("kIDSMessageResponseErrorDataKey"));
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "setObject:forKeyedSubscript:", v105, CFSTR("kIDSMessageResponseErrorDataKey"));

            objc_msgSend(v46, "internal");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "setUserInfo:", v79);

            objc_msgSend(v46, "setSenderContext:", v140);
            -[HMFMessageTransport delegate](self, "delegate");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "messageTransport:didReceiveMessage:", self, v46);

            v95 = v140;
            v97 = v139;
          }
          else
          {
            objc_msgSend(v46, "internal");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "setUserInfo:", v79);

            v95 = v140;
            objc_msgSend(v46, "setSenderContext:", v140);
            -[HMDRemoteMessageSenderContext deviceHandle](v140, "deviceHandle");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v130 = v15;
            v97 = v139;
            -[HMDIDSMessageTransport legacyHandleIncomingRemoteMessage:sourceDevice:senderDeviceHandle:isSecure:incomingMessage:fromID:context:](self, "legacyHandleIncomingRemoteMessage:sourceDevice:senderDeviceHandle:isSecure:incomingMessage:fromID:context:", v46, v139, v96, v71, v143, v14, v130);
            v42 = v142;
          }

          v27 = v150;
          v41 = v146;
        }
        else
        {
          v120 = (void *)MEMORY[0x1D17BA0A0]();
          v121 = self;
          HMFGetOSLogHandle();
          v122 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_FAULT))
          {
            HMFGetLogIdentifier();
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v154 = v123;
            _os_log_impl(&dword_1CD062000, v122, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Failed to determine source device", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v120);
          v124 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Failed to determine source device"));
          +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "submitLogEvent:", v124);

          v126 = (void *)MEMORY[0x1D17BA0A0]();
          v127 = v121;
          HMFGetOSLogHandle();
          v128 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v154 = v129;
            v155 = 2112;
            v156 = (uint64_t)v46;
            _os_log_impl(&dword_1CD062000, v128, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine source device, dropping message: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v126);

          v27 = v150;
          v42 = v142;
        }
        v47 = v137;
        v50 = v138;
        v45 = v143;
        goto LABEL_56;
      }
      v50 = (void *)v43;
      v60 = (void *)MEMORY[0x1D17BA0A0](v48);
      v61 = self;
      HMFGetOSLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v144 = v45;
        v64 = v42;
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v154 = v65;
        v155 = 2160;
        v156 = 1752392040;
        v157 = 2112;
        v158 = (uint64_t)v14;
        _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unable to create sender device handle from fromID: %{mask.hash}@", buf, 0x20u);

        v42 = v64;
        v45 = v144;
      }
    }
    else
    {
      v50 = (void *)v43;
      v60 = (void *)MEMORY[0x1D17BA0A0]();
      v61 = self;
      HMFGetOSLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v141 = v42;
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v154 = v63;
        v155 = 2112;
        v156 = (uint64_t)v45;
        v157 = 2160;
        v158 = 1752392040;
        v159 = 2112;
        v160 = (uint64_t)v14;
        v161 = 2112;
        v162 = v47;
        _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_ERROR, "%{public}@Dropping invalid IDS message payload, %@, from: %{mask.hash}@, error: %@", buf, 0x34u);

        v42 = v141;
      }
    }

    objc_autoreleasePoolPop(v60);
    v27 = v150;
LABEL_56:

    v39 = v147;
LABEL_57:

    v13 = v45;
    v12 = v148;
    v15 = v149;
LABEL_58:

    goto LABEL_59;
  }
  v17 = (void *)v16;
  objc_msgSend(v15, "originalGUID");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!self || !v18)
  {
LABEL_11:

    goto LABEL_12;
  }
  -[HMDIDSMessageTransport messageDedupBuffer](self, "messageDedupBuffer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", v19);

  if ((v21 & 1) == 0)
  {
    -[HMDIDSMessageTransport messageDedupBuffer](self, "messageDedupBuffer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v29 >= 0x1E)
    {
      -[HMDIDSMessageTransport messageDedupBuffer](self, "messageDedupBuffer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeObjectAtIndex:", 0);

    }
    -[HMDIDSMessageTransport messageDedupBuffer](self, "messageDedupBuffer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v19);

    goto LABEL_11;
  }

  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "originalGUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v154 = v25;
    v155 = 2114;
    v156 = (uint64_t)v26;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Received duplicate message with GUID: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  v27 = v150;
LABEL_59:

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

  v101 = *MEMORY[0x1E0C80C00];
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
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke;
    aBlock[3] = &unk_1E89A8E78;
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
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_87;
    v83[3] = &unk_1E89BF4F0;
    v36 = v83;
    v37 = &v84;
    objc_copyWeak(&v84, &location);
    v83[4] = v16;
    v24 = (void (**)(_QWORD, _QWORD, _QWORD))_Block_copy(v83);
    goto LABEL_14;
  }
  v18 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Received response to IDS message with transaction ID: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  -[HMDIDSMessageTransport pendingResponses](v19, "pendingResponses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v17);
  v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v81, "hmf_dictionaryForKey:", CFSTR("kIDSMessagePayloadKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryWithDictionary:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setObject:forKeyedSubscript:", v77, CFSTR("kIDSMessageSourceIDKey"));
    objc_msgSend(v81, "hmf_dataForKey:", CFSTR("kIDSMessageResponseErrorDataKey"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)MEMORY[0x1E0CB3710];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = 0;
      objc_msgSend(v29, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v30, v28, &v85);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v85;

      if (!v31)
      {
        context = (void *)MEMORY[0x1D17BA0A0]();
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
          _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize error with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 52, CFSTR("Generic error."), CFSTR("Failed to deserialize remote error."), 0, v32);
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
          v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[HMDIDSMessageTransport receivedResponses](v19, "receivedResponses");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setObject:forKeyedSubscript:", v55, v17);

        }
        objc_msgSend(v55, "addObject:", v27, v74);
        v59 = objc_msgSend(v55, "count");
        if (-[HMDRemoteMessageTransport doesResponse:matchAllCapabilities:](v19, "doesResponse:matchAllCapabilities:", v27, contexta))
        {
          v60 = (void *)MEMORY[0x1D17BA0A0]();
          v61 = v19;
          HMFGetOSLogHandle();
          v62 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v96 = (uint64_t)v63;
            _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_INFO, "%{public}@Response Matched all capabilities", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v60);
          -[HMDIDSMessageTransport _removePendingResponseTimerForTransaction:](v61, "_removePendingResponseTimerForTransaction:", v17);
          -[HMDIDSMessageTransport _pendingResponseTimeoutFor:](v61, "_pendingResponseTimeoutFor:", v17);
        }
        else
        {
          v64 = (void *)MEMORY[0x1D17BA0A0](-[HMDIDSMessageTransport _restartPendingResponseTimerFor:withReducedFactor:](v19, "_restartPendingResponseTimerFor:withReducedFactor:", v17, v59 + 1));
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
            _os_log_impl(&dword_1CD062000, v66, OS_LOG_TYPE_INFO, "%{public}@Not Calling response handler with response %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v64);
          v68 = (void *)MEMORY[0x1D17BA0A0]();
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
            _os_log_impl(&dword_1CD062000, v70, OS_LOG_TYPE_INFO, "%{public}@Currently received responses = %lu", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v68);
        }

        goto LABEL_44;
      }
      v48 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_INFO, "%{public}@Received response to directed message - selecting response from %{mask.hash}@", buf, 0x20u);

      }
    }
    else
    {
      v48 = (void *)MEMORY[0x1D17BA0A0]();
      v52 = v19;
      HMFGetOSLogHandle();
      v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v96 = (uint64_t)v53;
        _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_INFO, "%{public}@No Capabilities were requested - selecting the first response", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v48);
    ((void (**)(_QWORD, void *, void *))v24)[2](v24, v74, v27);
    -[HMDIDSMessageTransport _removePendingResponseTransaction:](v19, "_removePendingResponseTransaction:", v17);
LABEL_44:

    goto LABEL_45;
  }
  v38 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_INFO, "%{public}@No response handler, dropping message: %@", buf, 0x16u);

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

  v56 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (v16)
  {
    -[HMDIDSMessageTransport messageContexts](self, "messageContexts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke;
    v46[3] = &unk_1E89A8EA0;
    v20 = v16;
    v47 = v20;
    objc_msgSend(v19, "hmf_objectPassingTest:", v46);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v42 = v14;
      if (v17)
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:underlyingError:", 3203, v17);
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
        context = (void *)MEMORY[0x1D17BA0A0](v26);
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
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message with IDS GUID %{public}@ from account: %{private}@ with error: %@", buf, 0x2Au);

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
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke_91;
          v44[3] = &unk_1E89BDDC0;
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

- (BOOL)isModernTransport
{
  return self->_modernTransport;
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
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_2;
    v10[3] = &unk_1E89A8E50;
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

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Command %{public}@ completed with error: %@", (uint8_t *)&v13, 0x20u);

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

  v49 = *MEMORY[0x1E0C80C00];
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
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kIDSMessageResponseErrorDataKey"));

  }
  if ((objc_msgSend(*(id *)(a1 + 72), "fromServerStorage") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Responding to non-server storage message, %{public}@ (%{public}@), as direct message", buf, 0x20u);

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
  v24 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@IDS message response ack'd with identifier %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v31 = [HMDIDSMessageContext alloc];
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v23);
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
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@IDS message response, %@, failed with error: %@", buf, 0x20u);

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
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  HMDAssertionLogEvent *v52;
  void *v53;
  HMDAssertionLogEvent *v54;
  id v55;
  NSObject *v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  char v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  HMDIDSMessageContext *v98;
  void *v99;
  void *v100;
  HMDIDSMessageContext *v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  void *v106;
  id v107;
  NSObject *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  NSObject *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  NSObject *v123;
  void *v124;
  void *v125;
  id v126;
  NSObject *v127;
  void *v128;
  HMDAssertionLogEvent *v129;
  void *v130;
  id v131;
  NSObject *v132;
  void *v133;
  id v134;
  NSObject *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  void (**v143)(void *, void *);
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  void *v149;
  void *v150;
  HMDAssertionLogEvent *context;
  void *contexta;
  void *contextb;
  void *contextc;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  _QWORD aBlock[4];
  id v162;
  id v163;
  uint8_t buf[4];
  void *v165;
  __int16 v166;
  id v167;
  __int16 v168;
  id v169;
  __int16 v170;
  id v171;
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E89BFC88;
  v163 = a1[6];
  v162 = a1[4];
  v2 = (void (**)(void *, void *))_Block_copy(aBlock);
  v3 = a1[5];
  if (!v3 || !objc_msgSend(v3, "isModernTransport"))
    goto LABEL_6;
  objc_msgSend(a1[4], "responseHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v125 = (void *)MEMORY[0x1D17BA0A0]();
    v126 = a1[5];
    HMFGetOSLogHandle();
    v127 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v165 = v128;
      _os_log_impl(&dword_1CD062000, v127, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Response handler should not be set in modern transport", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v125);
    v129 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Response handler should not be set in modern transport"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "submitLogEvent:", v129);

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
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = a1[5];
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "UUIDString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "destination");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v165 = v24;
        v166 = 2114;
        v167 = v26;
        v168 = 2112;
        v169 = v27;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message %{public}@ invalid destination: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter."), CFSTR("Invalid destination."), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v2[2](v2, v9);
      goto LABEL_98;
    }
    objc_msgSend(a1[5], "remoteMessageFromMessage:", a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = 0;
    +[HMDRemoteMessageSerialization dictionaryForMessage:error:](HMDRemoteMessageSerialization, "dictionaryForMessage:error:", v9, &v160);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v160;
    if (!v10)
    {
      v28 = (void *)MEMORY[0x1D17BA0A0]();
      v29 = a1[5];
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v165 = v31;
        v166 = 2114;
        v167 = v32;
        v168 = 2112;
        v169 = v11;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize message %{public}@ with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
      v2[2](v2, v11);
      goto LABEL_97;
    }
    v12 = a1[5];
    v148 = v11;
    if (!v12 || !objc_msgSend(v12, "isModernTransport"))
    {
      context = 0;
LABEL_59:
      v143 = v2;
      objc_msgSend(v9, "timeout");
      v58 = 0.0;
      if (v59 > 0.0)
      {
        objc_msgSend(v9, "timeout");
        v58 = v60;
      }
      objc_msgSend(v9, "collapseID");
      v61 = objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        v62 = (void *)objc_opt_class();
        objc_msgSend(v9, "name");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "target");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "queueOneIdentifierWithMessageName:target:collapseID:timeToLive:now:", v63, v64, v61, v65, v58);
        v158 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v158 = 0;
      }
      if ((objc_msgSend(v9, "sendOptions") & 1) != 0)
      {
        v66 = 8;
      }
      else
      {
        v66 = (uint64_t)a1[5];
        v67 = v9;
        v68 = v158;
        if (v66)
        {
          v69 = objc_msgSend((id)v66, "isModernTransport");
          v66 = 0;
          if (!v68 && (v69 & 1) == 0)
            v66 = objc_msgSend(v67, "type") == 3;
        }

      }
      objc_msgSend(a1[4], "destination");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v71 = v70;
      else
        v71 = 0;
      v72 = v71;

      if (v72 && objc_msgSend(v72, "restrictToResidentCapable"))
        v66 |= 4uLL;
      v142 = v72;
      v73 = objc_msgSend((id)objc_opt_class(), "priorityForMessage:", v9);
      v74 = a1[5];
      v159 = 0;
      objc_msgSend(v74, "sendMessage:fromHandle:destination:priority:timeout:options:queueOneID:error:", v10, context, v6, v73, v66, v158, v58, &v159);
      v75 = objc_claimAutoreleasedReturnValue();
      v139 = v159;
      v140 = (void *)v61;
      v150 = (void *)v75;
      if (v75)
      {
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDRemoteMessageLogEvent sentRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "sentRemoteMessage:transportType:", v9, objc_msgSend(a1[5], "transportType"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "submitLogEvent:", v77);

        v78 = (void *)MEMORY[0x1D17BA0A0]();
        v79 = a1[5];
        HMFGetOSLogHandle();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "identifier");
          v82 = v10;
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v165 = v81;
          v166 = 2114;
          v167 = v83;
          v168 = 2114;
          v169 = v150;
          _os_log_impl(&dword_1CD062000, v80, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ ack'd with IDS GUID %{public}@", buf, 0x20u);

          v10 = v82;
        }

        objc_autoreleasePoolPop(v78);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = a1[6];
        if (v85)
        {
          v86 = (void *)objc_msgSend(v85, "copy");
          objc_msgSend(v84, "setObject:forKeyedSubscript:", v86, CFSTR("HMDIDSMessageTransportCompletionHandlerKey"));

        }
        v146 = v10;
        objc_msgSend(a1[4], "responseHandler");
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        v2 = v143;
        if (v87)
        {
          objc_msgSend(v9, "transactionIdentifier");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "setObject:forKeyedSubscript:", v88, CFSTR("HMDIDSMessageTransportTransactionIdentifierKey"));
          objc_msgSend(a1[4], "responseHandler");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = _Block_copy(v89);
          objc_msgSend(a1[5], "pendingResponses");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "setObject:forKeyedSubscript:", v90, v88);

          objc_msgSend(v9, "messagePayload");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("kRequestedCapabilitiesKey"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "requestedCapabilities");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setObject:forKeyedSubscript:", v93, v88);

          objc_msgSend(v6, "remoteDestinationString");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "destinationAddress");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setObject:forKeyedSubscript:", v95, v88);

          v97 = a1[5];
          objc_msgSend(v9, "timeout");
          objc_msgSend(v97, "_startPendingResponseTimer:responseTimeout:identifier:", v88, v150);

        }
        v98 = [HMDIDSMessageContext alloc];
        v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v150);
        objc_msgSend(a1[4], "destination");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = -[HMDIDSMessageContext initWithIdentifier:destination:userInfo:](v98, "initWithIdentifier:destination:userInfo:", v99, v100, v84);

        objc_msgSend(a1[5], "messageContexts");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "addObject:", v101);

        objc_msgSend(a1[5], "sendMessageBudget");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v99) = objc_msgSend(v103, "decrement");

        if ((_DWORD)v99)
        {
          objc_msgSend(a1[5], "sendMessageBudget");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend(v104, "isEmpty");

          v10 = v146;
          v106 = v139;
          if (v105)
          {
            v138 = (void *)MEMORY[0x1D17BA0A0]();
            v107 = a1[5];
            HMFGetOSLogHandle();
            v108 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v165 = v109;
              _os_log_impl(&dword_1CD062000, v108, OS_LOG_TYPE_ERROR, "%{public}@Exceeded send message budget", buf, 0xCu);

              v10 = v146;
            }

            objc_autoreleasePoolPop(v138);
            objc_msgSend(a1[5], "sendMessageBudget");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = objc_msgSend(v110, "rate");
            +[HMDRemoteMessageExceedBudgetLogEvent eventWithBudgetRate:](HMDRemoteMessageExceedBudgetLogEvent, "eventWithBudgetRate:", v111, v112);
            v113 = (void *)objc_claimAutoreleasedReturnValue();

            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "submitLogEvent:", v113);

          }
        }
        else
        {
          v121 = (void *)MEMORY[0x1D17BA0A0]();
          v122 = a1[5];
          HMFGetOSLogHandle();
          v123 = objc_claimAutoreleasedReturnValue();
          v106 = v139;
          if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v165 = v124;
            _os_log_impl(&dword_1CD062000, v123, OS_LOG_TYPE_INFO, "%{public}@Over send message budget", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v121);
          v10 = v146;
        }

        v11 = v148;
      }
      else
      {
        v115 = (void *)MEMORY[0x1D17BA0A0]();
        v116 = a1[5];
        HMFGetOSLogHandle();
        v117 = objc_claimAutoreleasedReturnValue();
        v106 = v139;
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "identifier");
          v147 = v10;
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "name");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v165 = v118;
          v166 = 2114;
          v167 = v119;
          v168 = 2112;
          v169 = v120;
          v170 = 2112;
          v171 = v139;
          _os_log_impl(&dword_1CD062000, v117, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message %{public}@ / %@ with error: %@", buf, 0x2Au);

          v10 = v147;
          v11 = v148;
        }

        objc_autoreleasePoolPop(v115);
        v2 = v143;
        v143[2](v143, v139);
      }

LABEL_97:
LABEL_98:

      goto LABEL_99;
    }
    v13 = (void *)objc_msgSend(v10, "mutableCopy");
    v14 = a1[5];
    v15 = v13;
    if (v14)
    {
      objc_msgSend(v14, "appleAccountManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "idsIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "UUIDString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("idsId"));

        }
        else
        {
          v144 = v10;
          v38 = (void *)MEMORY[0x1D17BA0A0]();
          v39 = v14;
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v156 = v38;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v165 = v41;
            v166 = 2112;
            v167 = v17;
            _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Cannot set the source IDS device identifier because IDS identifier is unknown for current device: %@", buf, 0x16u);

            v38 = v156;
          }

          objc_autoreleasePoolPop(v38);
          v10 = v144;
        }

      }
      else
      {
        v33 = (void *)MEMORY[0x1D17BA0A0]();
        v34 = v14;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v155 = v15;
          v36 = v10;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v165 = v37;
          _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Cannot set the source IDS device identifier because current device is unknown", buf, 0xCu);

          v10 = v36;
          v15 = v155;
        }

        objc_autoreleasePoolPop(v33);
      }

    }
    if (objc_msgSend(v9, "type") != 1)
    {
      context = 0;
      v11 = v148;
LABEL_58:
      v57 = objc_msgSend(v15, "copy");

      v10 = (void *)v57;
      goto LABEL_59;
    }
    objc_msgSend(a1[4], "userInfo");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("kIDSMessageResponseErrorDataKey"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v43, CFSTR("kIDSMessageResponseErrorDataKey"));
    v44 = a1[5];
    v45 = v9;
    v46 = v45;
    if (!v44 || objc_msgSend(v45, "type") != 1)
    {
      context = 0;
      v11 = v148;
LABEL_57:

      goto LABEL_58;
    }
    objc_msgSend(v46, "remoteToID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v47)
    {
      context = 0;
      v11 = v148;
LABEL_56:

      goto LABEL_57;
    }
    v157 = v47;
    v145 = v10;
    objc_msgSend(v46, "destination");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v49 = v48;
    else
      v49 = 0;
    v50 = v49;

    v149 = v50;
    if (v50)
    {
      objc_msgSend(v50, "device");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "account");
      v52 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        if ((-[HMDAssertionLogEvent isCurrentAccount](v52, "isCurrentAccount") & 1) != 0)
        {
          context = 0;
          v11 = v148;
LABEL_55:

          v10 = v145;
          v47 = v157;
          goto LABEL_56;
        }
        +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v157);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53)
        {
          v54 = v53;
          context = v54;
LABEL_54:
          v11 = v148;

          goto LABEL_55;
        }
        contexta = (void *)MEMORY[0x1D17BA0A0]();
        v55 = v44;
        HMFGetOSLogHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v165 = v141;
          v166 = 2112;
          v167 = v157;
          _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_ERROR, "%{public}@Invalid toID to create an account handle: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(contexta);
        v54 = 0;
      }
      else
      {
        contextc = (void *)MEMORY[0x1D17BA0A0]();
        v134 = v44;
        HMFGetOSLogHandle();
        v135 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v165 = v136;
          _os_log_impl(&dword_1CD062000, v135, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Destination device does not have an associated account", buf, 0xCu);

        }
        objc_autoreleasePoolPop(contextc);
        v54 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Destination device does not have an associated account"));
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "submitLogEvent:", v54);

        v52 = 0;
      }
    }
    else
    {
      contextb = (void *)MEMORY[0x1D17BA0A0]();
      v131 = v44;
      HMFGetOSLogHandle();
      v132 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v165 = v133;
        _os_log_impl(&dword_1CD062000, v132, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Response message is not a device destination", buf, 0xCu);

      }
      objc_autoreleasePoolPop(contextb);
      v52 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Response message is not a device destination"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v54 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
      -[HMDAssertionLogEvent submitLogEvent:](v54, "submitLogEvent:", v52);
    }
    context = 0;
    goto LABEL_54;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("Not supported."), CFSTR("Response handler should not be set when using IDS transport for modern transport"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2[2](v2, v6);
LABEL_99:

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

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
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

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
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
  if (logCategory__hmf_once_t2_33263 != -1)
    dispatch_once(&logCategory__hmf_once_t2_33263, &__block_literal_global_33264);
  return (id)logCategory__hmf_once_v3_33265;
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
  v23 = (void *)MEMORY[0x1D17BA0A0]();
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
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v48, 8);
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
  v1 = (void *)logCategory__hmf_once_v3_33265;
  logCategory__hmf_once_v3_33265 = v0;

}

@end
