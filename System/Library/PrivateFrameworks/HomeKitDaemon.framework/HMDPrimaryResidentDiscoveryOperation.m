@implementation HMDPrimaryResidentDiscoveryOperation

- (HMDPrimaryResidentDiscoveryOperation)initWithHome:(id)a3 messageDispatcher:(id)a4 featuresDataSource:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  HMDPrimaryResidentDiscoveryOperation *v13;
  void *v14;
  uint64_t v15;
  NSString *logIdentifier;
  uint64_t v17;
  HMFFuture *completionFuture;
  uint64_t v19;
  HMFFuture *initialDiscoveryAttemptCompletionFuture;
  uint64_t v21;
  HMFTimer *sendAccountMessageTimer;
  void *v23;
  uint64_t v24;
  HMFTimer *sendToNextDestinationTimer;
  void *v26;
  HMDPrimaryResidentDiscoveryLogEvent *v27;
  void *v28;
  uint64_t v29;
  HMDPrimaryResidentDiscoveryLogEvent *logEvent;
  uint64_t v31;
  void *v32;
  id responseHandler;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSArray *candidateDestinations;
  uint64_t v40;
  NSEnumerator *candidateDestinationsEnumerator;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  id from;
  id location;
  objc_super v51;

  v10 = a3;
  v43 = a4;
  v11 = a5;
  v12 = a6;
  v51.receiver = self;
  v51.super_class = (Class)HMDPrimaryResidentDiscoveryOperation;
  v13 = -[HMFOperation initWithTimeout:](&v51, sel_initWithTimeout_, 120.0);
  objc_storeWeak((id *)&v13->_home, v10);
  objc_msgSend(v10, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = objc_claimAutoreleasedReturnValue();
  logIdentifier = v13->_logIdentifier;
  v13->_logIdentifier = (NSString *)v15;

  objc_storeStrong((id *)&v13->_messageDispatcher, a4);
  objc_storeStrong((id *)&v13->_featuresDataSource, a5);
  objc_storeWeak((id *)&v13->_context, v12);
  objc_msgSend(MEMORY[0x24BE3F180], "futureForOperation:", v13);
  v17 = objc_claimAutoreleasedReturnValue();
  completionFuture = v13->_completionFuture;
  v13->_completionFuture = (HMFFuture *)v17;

  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v13->_initialDiscoveryAttemptCompletionPromise);
  v19 = objc_claimAutoreleasedReturnValue();
  initialDiscoveryAttemptCompletionFuture = v13->_initialDiscoveryAttemptCompletionFuture;
  v13->_initialDiscoveryAttemptCompletionFuture = (HMFFuture *)v19;

  v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 2, 60.0);
  sendAccountMessageTimer = v13->_sendAccountMessageTimer;
  v13->_sendAccountMessageTimer = (HMFTimer *)v21;

  -[HMFTimer setDelegate:](v13->_sendAccountMessageTimer, "setDelegate:", v13);
  -[HMFOperation underlyingQueue](v13, "underlyingQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFTimer setDelegateQueue:](v13->_sendAccountMessageTimer, "setDelegateQueue:", v23);

  v24 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 6, 1.0);
  sendToNextDestinationTimer = v13->_sendToNextDestinationTimer;
  v13->_sendToNextDestinationTimer = (HMFTimer *)v24;

  -[HMFTimer setDelegate:](v13->_sendToNextDestinationTimer, "setDelegate:", v13);
  -[HMFOperation underlyingQueue](v13, "underlyingQueue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFTimer setDelegateQueue:](v13->_sendToNextDestinationTimer, "setDelegateQueue:", v26);

  v27 = [HMDPrimaryResidentDiscoveryLogEvent alloc];
  objc_msgSend(v10, "uuid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[HMDPrimaryResidentDiscoveryLogEvent initWithHomeUUID:](v27, "initWithHomeUUID:", v28);
  logEvent = v13->_logEvent;
  v13->_logEvent = (HMDPrimaryResidentDiscoveryLogEvent *)v29;

  objc_initWeak(&location, v13);
  objc_initWeak(&from, v10);
  v31 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke;
  aBlock[3] = &unk_24E77FC88;
  objc_copyWeak(&v47, &location);
  objc_copyWeak(&v48, &from);
  v32 = _Block_copy(aBlock);
  responseHandler = v13->_responseHandler;
  v13->_responseHandler = v32;

  objc_msgSend(v10, "uuid");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enabledResidents");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sortedArrayUsingComparator:", &__block_literal_global_73608);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v31;
  v44[1] = 3221225472;
  v44[2] = __98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke_2;
  v44[3] = &unk_24E77FCF0;
  v37 = v34;
  v45 = v37;
  objc_msgSend(v36, "na_map:", v44);
  v38 = objc_claimAutoreleasedReturnValue();
  candidateDestinations = v13->_candidateDestinations;
  v13->_candidateDestinations = (NSArray *)v38;

  -[NSArray objectEnumerator](v13->_candidateDestinations, "objectEnumerator");
  v40 = objc_claimAutoreleasedReturnValue();
  candidateDestinationsEnumerator = v13->_candidateDestinationsEnumerator;
  v13->_candidateDestinationsEnumerator = (NSEnumerator *)v40;

  objc_destroyWeak(&v48);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v13;
}

- (void)run
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "performOperation:", self);

}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HMDPrimaryResidentDiscoveryOperation;
  -[HMFOperation cancel](&v2, sel_cancel);
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  HMDPrimaryResidentDiscoveryOperation *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDPrimaryResidentDiscoveryOperation *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDPrimaryResidentDiscoveryOperation *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDPrimaryResidentDiscoveryOperation *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _QWORD block[5];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if ((-[HMDPrimaryResidentDiscoveryOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[HMDPrimaryResidentDiscoveryOperation home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v24;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Home was nil during primary resident discovery operation", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      -[HMDPrimaryResidentDiscoveryOperation cancel](v22, "cancel");
      goto LABEL_26;
    }
    objc_msgSend(v3, "owner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find any account handles for home owner during primary resident discovery operation", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      -[HMDPrimaryResidentDiscoveryOperation cancel](v26, "cancel");
      goto LABEL_25;
    }
    if (!objc_msgSend(v4, "isOwnerUser") || (objc_msgSend(v4, "hasAnyResident") & 1) != 0)
    {
      -[HMDPrimaryResidentDiscoveryOperation featuresDataSource](self, "featuresDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isResidentSelectionEnabledForHomeUUID:", v10))
      {
        v11 = objc_msgSend(v4, "supportsResidentSelection");

        if (v11)
        {
          -[HMDPrimaryResidentDiscoveryOperation context](self, "context");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "residentStatusChannel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v14 = (void *)MEMORY[0x227676638]();
            v15 = self;
            HMFGetOSLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v36 = v17;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Resident Status Channel is nil", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v14);
          }
          objc_msgSend(v13, "addObserver:", self);
          objc_msgSend(v13, "manager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addClientWithIdentifier:", CFSTR("primary.resident.discovery.operation"));

          -[HMFOperation underlyingQueue](self, "underlyingQueue");
          v19 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __44__HMDPrimaryResidentDiscoveryOperation_main__block_invoke;
          block[3] = &unk_24E79C240;
          block[4] = self;
          dispatch_async(v19, block);

          -[HMDPrimaryResidentDiscoveryOperation sendAccountMessageTimer](self, "sendAccountMessageTimer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "resume");

LABEL_24:
          goto LABEL_25;
        }
      }
      else
      {

      }
      -[HMDPrimaryResidentDiscoveryOperation sendIDSAccountMessage](self, "sendIDSAccountMessage");
LABEL_25:

LABEL_26:
      return;
    }
    v29 = (void *)MEMORY[0x227676638]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v32;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Home has 0 residents, not attempting to discover primary", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 91);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPrimaryResidentDiscoveryOperation initialDiscoveryAttemptCompletionPromise](v30, "initialDiscoveryAttemptCompletionPromise");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "rejectWithError:", v13);

    -[HMDPrimaryResidentDiscoveryOperation cancelWithError:](v30, "cancelWithError:", v13);
    goto LABEL_24;
  }
}

- (void)checkResidentStatusChannelForPrimary
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDResidentDevice *v11;
  HMDResidentDevice *currentPrimaryResident;
  void *v13;
  NSUUID *v14;
  NSUUID *currentPrimaryResidentGenerationID;
  void *v16;
  HMDPrimaryResidentDiscoveryOperation *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSUUID *v21;
  void *v22;
  void *v23;
  HMDPrimaryResidentDiscoveryOperation *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDPrimaryResidentDiscoveryOperation *v28;
  NSObject *v29;
  void *v30;
  NSUUID *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  NSUUID *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[HMFOperation underlyingQueue](self, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if ((-[HMDPrimaryResidentDiscoveryOperation isCancelled](self, "isCancelled") & 1) == 0
    && !-[HMFOperation isFinished](self, "isFinished"))
  {
    -[HMDPrimaryResidentDiscoveryOperation home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HMDPrimaryResidentDiscoveryOperation context](self, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "residentStatusChannel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "currentPrimaryResident");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(v4, "enabledResidents");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setWithArray:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "matchingDeviceFromResidentDevices:", v10);
        v11 = (HMDResidentDevice *)objc_claimAutoreleasedReturnValue();
        currentPrimaryResident = self->_currentPrimaryResident;
        self->_currentPrimaryResident = v11;

        if (self->_currentPrimaryResident)
        {
          objc_msgSend(v6, "currentPrimaryResident");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "generationID");
          v14 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          currentPrimaryResidentGenerationID = self->_currentPrimaryResidentGenerationID;
          self->_currentPrimaryResidentGenerationID = v14;

          v16 = (void *)MEMORY[0x227676638](-[HMDPrimaryResidentDiscoveryLogEvent setResidentChannelActive:](self->_logEvent, "setResidentChannelActive:", 1));
          v17 = self;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "idsIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = self->_currentPrimaryResidentGenerationID;
            v32 = 138543874;
            v33 = v19;
            v34 = 2114;
            v35 = v20;
            v36 = 2112;
            v37 = v21;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident located via StatusKit: %{public}@ - generation ID: %@", (uint8_t *)&v32, 0x20u);

          }
          objc_autoreleasePoolPop(v16);
          -[HMDPrimaryResidentDiscoveryOperation initialDiscoveryAttemptCompletionPromise](v17, "initialDiscoveryAttemptCompletionPromise");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "fulfillWithNoValue");

          -[HMDPrimaryResidentDiscoveryOperation residentStatusChannelCleanup](v17, "residentStatusChannelCleanup");
          -[HMDPrimaryResidentDiscoveryOperation finish](v17, "finish");
        }
        else
        {
          v27 = (void *)MEMORY[0x227676638]();
          v28 = self;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "enabledResidents");
            v31 = (NSUUID *)objc_claimAutoreleasedReturnValue();
            v32 = 138543874;
            v33 = v30;
            v34 = 2112;
            v35 = v7;
            v36 = 2112;
            v37 = v31;
            _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Primary resident indicated by StatusKit: %@ not found, enabled residents: %@", (uint8_t *)&v32, 0x20u);

          }
          objc_autoreleasePoolPop(v27);
        }
      }

    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543362;
        v33 = v26;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Home was removed during primary resident discovery operation", (uint8_t *)&v32, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
    }

  }
}

- (void)sendIDSAccountMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDRemoteAccountMessageDestination *v9;
  void *v10;
  HMDRemoteAccountMessageDestination *v11;
  HMDRemoteMessage *v12;
  HMDRemoteMessage *v13;
  void *v14;
  HMDPrimaryResidentDiscoveryOperation *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDPrimaryResidentDiscoveryOperation *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDPrimaryResidentDiscoveryOperation *v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  HMDRemoteAccountMessageDestination *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[HMDPrimaryResidentDiscoveryOperation home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "owner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [HMDRemoteAccountMessageDestination alloc];
    objc_msgSend(v4, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:](v9, "initWithTarget:handle:multicast:", v10, v8, 1);

    -[HMDRemoteAccountMessageDestination setRestrictToResidentCapable:](v11, "setRestrictToResidentCapable:", 1);
    v12 = [HMDRemoteMessage alloc];
    v13 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:](v12, "initWithName:qualityOfService:destination:payload:type:timeout:secure:", CFSTR("primaryResidentDiscovery"), -1, v11, MEMORY[0x24BDBD1B8], 0, 0, 60.0);
    -[HMDPrimaryResidentDiscoveryLogEvent setAccountMessageSent:](self->_logEvent, "setAccountMessageSent:", 1);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __61__HMDPrimaryResidentDiscoveryOperation_sendIDSAccountMessage__block_invoke;
    v29[3] = &unk_24E79B7E0;
    v29[4] = self;
    v14 = (void *)MEMORY[0x227676638](-[HMDRemoteMessage setResponseHandler:](v13, "setResponseHandler:", v29));
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDPrimaryResidentDiscoveryOperation candidateDestinations](v15, "candidateDestinations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v17;
      v32 = 2112;
      v33 = v11;
      v34 = 2114;
      v35 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Multicasting request to %@ and then %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDPrimaryResidentDiscoveryOperation messageDispatcher](v15, "messageDispatcher");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sendMessage:", v13);

    v20 = (void *)MEMORY[0x227676638]();
    v21 = v15;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Starting timer for next destination request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDPrimaryResidentDiscoveryOperation sendToNextDestinationTimer](v21, "sendToNextDestinationTimer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "resume");

  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Home was removed during primary resident discovery operation", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    -[HMDPrimaryResidentDiscoveryOperation cancel](v26, "cancel");
  }

}

- (void)finish
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDPrimaryResidentDiscoveryOperation;
  -[HMFOperation finish](&v5, sel_finish);
  -[HMDPrimaryResidentDiscoveryOperation sendToNextDestinationTimer](self, "sendToNextDestinationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDPrimaryResidentDiscoveryOperation sendAccountMessageTimer](self, "sendAccountMessageTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspend");

}

- (void)cancelWithError:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDPrimaryResidentDiscoveryOperation;
  -[HMFOperation cancelWithError:](&v6, sel_cancelWithError_, a3);
  -[HMDPrimaryResidentDiscoveryOperation sendToNextDestinationTimer](self, "sendToNextDestinationTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspend");

  -[HMDPrimaryResidentDiscoveryOperation sendAccountMessageTimer](self, "sendAccountMessageTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suspend");

  -[HMDPrimaryResidentDiscoveryOperation residentStatusChannelCleanup](self, "residentStatusChannelCleanup");
}

- (void)residentStatusChannelCleanup
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[HMDPrimaryResidentDiscoveryOperation home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    -[HMDPrimaryResidentDiscoveryOperation featuresDataSource](self, "featuresDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isResidentSelectionEnabledForHomeUUID:", v5))
    {
LABEL_5:

      v3 = v8;
      goto LABEL_6;
    }
    v6 = objc_msgSend(v8, "supportsResidentSelection");

    v3 = v8;
    if (v6)
    {
      -[HMDPrimaryResidentDiscoveryOperation context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "residentStatusChannel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "removeObserver:", self);
      objc_msgSend(v4, "manager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeClientWithIdentifier:", CFSTR("primary.resident.discovery.operation"));
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  HMDPrimaryResidentDiscoveryOperation *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDPrimaryResidentDiscoveryOperation *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDRemoteMessage *v24;
  HMDRemoteMessage *v25;
  void *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((-[HMDPrimaryResidentDiscoveryOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[HMDPrimaryResidentDiscoveryOperation sendAccountMessageTimer](self, "sendAccountMessageTimer");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v10;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Primary resident not found via StatusKit, falling back to PrimaryResidentDiscoveryMessage", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDPrimaryResidentDiscoveryOperation context](v8, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "residentStatusChannel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentResidentStatuses");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      -[HMDPrimaryResidentDiscoveryLogEvent setResidentChannelActive:](v8->_logEvent, "setResidentChannelActive:", v14 != 0);
      if (v14)
      {
        -[HMDPrimaryResidentDiscoveryLogEvent setResidentChannelActiveNoPrimaryResolved:](v8->_logEvent, "setResidentChannelActiveNoPrimaryResolved:", 1);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPrimaryResidentDiscoveryLogEvent setResidentChannelActiveResolvePrimaryError:](v8->_logEvent, "setResidentChannelActiveResolvePrimaryError:", v15);

      }
      -[HMDPrimaryResidentDiscoveryOperation residentStatusChannelCleanup](v8, "residentStatusChannelCleanup");
      -[HMDPrimaryResidentDiscoveryOperation sendIDSAccountMessage](v8, "sendIDSAccountMessage");
    }
    else
    {
      -[HMDPrimaryResidentDiscoveryOperation sendToNextDestinationTimer](self, "sendToNextDestinationTimer");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == v4)
      {
        -[HMDPrimaryResidentDiscoveryOperation candidateDestinationsEnumerator](self, "candidateDestinationsEnumerator");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "nextObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = self;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "device");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "shortDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v30 = v21;
            v31 = 2114;
            v32 = v23;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Attempting next candidate via Rapport: %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
          v24 = [HMDRemoteMessage alloc];
          v25 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:](v24, "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:", CFSTR("primaryResidentDiscovery"), 9, v17, MEMORY[0x24BDBD1B8], 0, 0, 15.0, 8);
          -[HMDPrimaryResidentDiscoveryOperation responseHandler](v19, "responseHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDRemoteMessage setResponseHandler:](v25, "setResponseHandler:", v26);

          -[HMDPrimaryResidentDiscoveryOperation messageDispatcher](v19, "messageDispatcher");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "sendMessage:", v25);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
          v25 = (HMDRemoteMessage *)objc_claimAutoreleasedReturnValue();
          -[HMMLogEvent setError:](self->_logEvent, "setError:", v25);
        }

      }
      else
      {
        v28.receiver = self;
        v28.super_class = (Class)HMDPrimaryResidentDiscoveryOperation;
        -[HMFOperation timerDidFire:](&v28, sel_timerDidFire_, v4);
      }
    }
  }

}

- (void)channel:(id)a3 didObservePrimaryResidentChange:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[HMFOperation underlyingQueue](self, "underlyingQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__HMDPrimaryResidentDiscoveryOperation_channel_didObservePrimaryResidentChange___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v5, block);

}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (HMFFuture)initialDiscoveryAttemptCompletionFuture
{
  return (HMFFuture *)objc_getProperty(self, a2, 320, 1);
}

- (HMFFuture)completionFuture
{
  return (HMFFuture *)objc_getProperty(self, a2, 328, 1);
}

- (HMDResidentDevice)currentPrimaryResident
{
  return (HMDResidentDevice *)objc_getProperty(self, a2, 336, 1);
}

- (NSUUID)currentPrimaryResidentGenerationID
{
  return (NSUUID *)objc_getProperty(self, a2, 344, 1);
}

- (HMDPrimaryResidentDiscoveryLogEvent)logEvent
{
  return (HMDPrimaryResidentDiscoveryLogEvent *)objc_getProperty(self, a2, 352, 1);
}

- (HMDMessageDispatcher)messageDispatcher
{
  return (HMDMessageDispatcher *)objc_getProperty(self, a2, 360, 1);
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 368, 1);
}

- (NSEnumerator)candidateDestinationsEnumerator
{
  return (NSEnumerator *)objc_getProperty(self, a2, 376, 1);
}

- (void)setCandidateDestinationsEnumerator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (HMFPromise)initialDiscoveryAttemptCompletionPromise
{
  return (HMFPromise *)objc_getProperty(self, a2, 384, 1);
}

- (void)setInitialDiscoveryAttemptCompletionPromise:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 392, 1);
}

- (HMDResidentDeviceManagerContext)context
{
  return (HMDResidentDeviceManagerContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (NSArray)candidateDestinations
{
  return (NSArray *)objc_getProperty(self, a2, 416, 1);
}

- (HMFTimer)sendToNextDestinationTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 424, 1);
}

- (void)setSendToNextDestinationTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (HMFTimer)sendAccountMessageTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSendAccountMessageTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendAccountMessageTimer, 0);
  objc_storeStrong((id *)&self->_sendToNextDestinationTimer, 0);
  objc_storeStrong((id *)&self->_candidateDestinations, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_initialDiscoveryAttemptCompletionPromise, 0);
  objc_storeStrong((id *)&self->_candidateDestinationsEnumerator, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_logEvent, 0);
  objc_storeStrong((id *)&self->_currentPrimaryResidentGenerationID, 0);
  objc_storeStrong((id *)&self->_currentPrimaryResident, 0);
  objc_storeStrong((id *)&self->_completionFuture, 0);
  objc_storeStrong((id *)&self->_initialDiscoveryAttemptCompletionFuture, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

uint64_t __80__HMDPrimaryResidentDiscoveryOperation_channel_didObservePrimaryResidentChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkResidentStatusChannelForPrimary");
}

void __61__HMDPrimaryResidentDiscoveryOperation_sendIDSAccountMessage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "setAccountMessageNoPrimaryResolved:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "setAccountMessageError:", v5);
    objc_msgSend(*(id *)(a1 + 32), "initialDiscoveryAttemptCompletionPromise");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rejectWithError:", v5);
  }
  else
  {
    objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "initialDiscoveryAttemptCompletionPromise");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fulfillWithNoValue");
    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Primary resident UUID in the response is nil", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "setAccountMessageNoPrimaryResolved:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "setAccountMessageError:", v9);
      objc_msgSend(*(id *)(a1 + 32), "initialDiscoveryAttemptCompletionPromise");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rejectWithError:", v9);

    }
  }

  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, void *))v15)[2](v15, v5, v7);

}

uint64_t __44__HMDPrimaryResidentDiscoveryOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkResidentStatusChannelForPrimary");
}

void __98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  HMDResidentDevice *v18;
  void *v19;
  _QWORD *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *context;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  id v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v8 && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
    {
      objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("uuid"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "enabledResidents");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x24BDAC760];
        v43[1] = 3221225472;
        v43[2] = __98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke_9;
        v43[3] = &unk_24E7953A8;
        v11 = v9;
        v44 = v11;
        objc_msgSend(v10, "na_firstObjectPassingTest:", v43);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)WeakRetained[42];
        WeakRetained[42] = v12;

        if (!WeakRetained[42])
        {
          objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kIDSMessageSourceIDKey"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)v15;
          objc_msgSend(v16, "deviceForHandle:", v15);
          v17 = objc_claimAutoreleasedReturnValue();

          v41 = (void *)v17;
          v18 = -[HMDResidentDevice initWithDevice:home:]([HMDResidentDevice alloc], "initWithDevice:home:", v17, v8);
          v19 = (void *)WeakRetained[42];
          WeakRetained[42] = v18;

          context = (void *)MEMORY[0x227676638]();
          v20 = WeakRetained;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v39 = v14;
            v22 = v11;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)WeakRetained[42];
            *(_DWORD *)buf = 138543618;
            v46 = (uint64_t)v23;
            v47 = 2112;
            v48 = v24;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Creating new primary resident %@ because the one that responded was unknown", buf, 0x16u);

            v11 = v22;
            v14 = v39;
          }

          objc_autoreleasePoolPop(context);
        }
        objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("gen"));
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)WeakRetained[43];
        WeakRetained[43] = v25;

        v27 = (void *)MEMORY[0x227676638]();
        v28 = WeakRetained;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = v11;
          v32 = (void *)v30;
          v33 = WeakRetained[43];
          *(_DWORD *)buf = 138543874;
          v46 = v30;
          v47 = 2114;
          v48 = v31;
          v49 = 2112;
          v50 = v33;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident located: %{public}@ - generation ID: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v27);
        objc_msgSend(v28, "finish");
        v34 = v44;
      }
      else
      {
        v35 = (void *)MEMORY[0x227676638]();
        v36 = WeakRetained;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = (uint64_t)v38;
          v47 = 2112;
          v48 = v5;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Received invalid/error response, forcing next destination: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v35);
        objc_msgSend(v36, "sendToNextDestinationTimer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "fire");
      }

    }
  }

}

HMDRemoteDeviceMessageDestination *__98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HMDRemoteDeviceMessageDestination *v4;
  HMDRemoteDeviceMessageDestination *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  if ((objc_msgSend(v3, "isCurrentDevice") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = [HMDRemoteDeviceMessageDestination alloc];
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v5, "initWithTarget:device:", v6, v7);

  }
  return v4;
}

uint64_t __98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "isReachable");
  v7 = objc_msgSend(v5, "isReachable");

  if (v6 == v7)
  {
    v8 = 0;
  }
  else if (objc_msgSend(v4, "isReachable"))
  {
    v8 = -1;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t __98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16 != -1)
    dispatch_once(&logCategory__hmf_once_t16, &__block_literal_global_35_73620);
  return (id)logCategory__hmf_once_v17;
}

void __51__HMDPrimaryResidentDiscoveryOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17;
  logCategory__hmf_once_v17 = v0;

}

@end
