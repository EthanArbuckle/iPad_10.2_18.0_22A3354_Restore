@implementation HMDHomePrimaryResidentMessagingHandler

- (HMDHomePrimaryResidentMessagingHandler)initWithMessageDispatcher:(id)a3 homeUUID:(id)a4 residentDeviceManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDHomePrimaryResidentMessagingHandlerDefaultDataSource *v11;
  HMDHomePrimaryResidentMessagingHandler *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HMDHomePrimaryResidentMessagingHandlerDefaultDataSource);
  v12 = -[HMDHomePrimaryResidentMessagingHandler initWithMessageDispatcher:homeUUID:residentDeviceManager:dataSource:](self, "initWithMessageDispatcher:homeUUID:residentDeviceManager:dataSource:", v10, v9, v8, v11);

  return v12;
}

- (HMDHomePrimaryResidentMessagingHandler)initWithMessageDispatcher:(id)a3 homeUUID:(id)a4 residentDeviceManager:(id)a5 dataSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDHomePrimaryResidentMessagingHandler *v15;
  HMDHomePrimaryResidentMessagingHandler *v16;
  uint64_t v17;
  NSNotificationCenter *notificationCenter;
  uint64_t v19;
  HMFTimerManager *timerManager;
  uint64_t v21;
  NSMapTable *pendingMessages;
  uint64_t v23;
  NSError *destinationIsCurrentDeviceError;
  uint64_t v25;
  NSError *repeatedDestinationError;
  uint64_t v27;
  NSString *logIdentifier;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)HMDHomePrimaryResidentMessagingHandler;
  v15 = -[HMDHomePrimaryResidentMessagingHandler init](&v30, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_messageDispatcher, a3);
    objc_storeStrong((id *)&v16->_homeUUID, a4);
    objc_storeStrong((id *)&v16->_residentDeviceManager, a5);
    objc_msgSend(v14, "notificationCenter");
    v17 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v16->_notificationCenter;
    v16->_notificationCenter = (NSNotificationCenter *)v17;

    objc_msgSend(v14, "timerManager");
    v19 = objc_claimAutoreleasedReturnValue();
    timerManager = v16->_timerManager;
    v16->_timerManager = (HMFTimerManager *)v19;

    -[HMFTimerManager setDelegate:](v16->_timerManager, "setDelegate:", v16);
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    pendingMessages = v16->_pendingMessages;
    v16->_pendingMessages = (NSMapTable *)v21;

    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 23, CFSTR("Cannot send message because the current device is the primary resident"), CFSTR("Sending message to the current device is not supported"), 0);
    v23 = objc_claimAutoreleasedReturnValue();
    destinationIsCurrentDeviceError = v16->_destinationIsCurrentDeviceError;
    v16->_destinationIsCurrentDeviceError = (NSError *)v23;

    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:description:reason:suggestion:", 3205, CFSTR("Cannot send message because the original primary is the same device as the newly discovered primary"), CFSTR("Sending a message to the same device multiple times is not supported"), 0);
    v25 = objc_claimAutoreleasedReturnValue();
    repeatedDestinationError = v16->_repeatedDestinationError;
    v16->_repeatedDestinationError = (NSError *)v25;

    objc_msgSend(v12, "UUIDString");
    v27 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = (NSString *)v27;

    -[NSNotificationCenter addObserver:selector:name:object:](v16->_notificationCenter, "addObserver:selector:name:object:", v16, sel_handlePrimaryResidentUpdated_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v13);
    -[NSNotificationCenter addObserver:selector:name:object:](v16->_notificationCenter, "addObserver:selector:name:object:", v16, sel_handleResidentUpdated_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), v13);
  }

  return v16;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  _BOOL4 v16;
  HMDResidentDeviceManager *residentDeviceManager;
  HMDResidentDeviceManager *v18;
  void *v19;
  NSError *destinationIsCurrentDeviceError;
  NSError *v21;
  void *v22;
  HMDHomePrimaryResidentMessagingHandler *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  _BOOL4 v33;
  double v34;
  _BOOL4 v35;
  double v36;
  double v37;
  double v38;
  HMFTimerManager *timerManager;
  HMFTimerManager *v40;
  void *v41;
  HMFTimerManager *v42;
  HMFTimerManager *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  HMDHomePrimaryResidentMessagingHandler *v49;
  NSObject *v50;
  id v51;
  void *v52;
  NSMapTable *pendingMessages;
  NSMapTable *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HMDHomePrimaryResidentMessagingHandlerPendingMessageContext *v61;
  _BOOL4 v62;
  int v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  NSError *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v10, "queueTimeout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    objc_msgSend(v10, "queueTimeout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13 >= 2.22044605e-16 || v14 == 0;
    v62 = v16;

    os_unfair_lock_lock_with_options();
    if (self)
      residentDeviceManager = self->_residentDeviceManager;
    else
      residentDeviceManager = 0;
    v18 = residentDeviceManager;
    -[HMDResidentDeviceManager primaryResidentDevice](v18, "primaryResidentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "isCurrentDevice"))
    {
      if (self)
        destinationIsCurrentDeviceError = self->_destinationIsCurrentDeviceError;
      else
        destinationIsCurrentDeviceError = 0;
      v21 = destinationIsCurrentDeviceError;
      os_unfair_lock_unlock(&self->_lock);
      if (v21)
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = self;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v65 = v25;
          v66 = 2114;
          v67 = v26;
          v68 = 2112;
          v69 = v21;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Cannot send message %{public}@ due to error: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(v6, "respondWithError:", v21);

        goto LABEL_64;
      }
    }
    else
    {
      if (v19)
        v63 = objc_msgSend(v19, "isReachable");
      else
        v63 = 0;
      v30 = objc_msgSend(v6, "isRequestType");
      objc_msgSend(v10, "queueTimeout");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v13 <= 2.22044605e-16 || v31 == 0;

      objc_msgSend(v6, "timeout");
      v35 = v62;
      if (v63)
        v35 = v30;
      if (v35)
      {
        if (((v33 | v30) & 1) != 0)
        {
          if (v34 <= 2.22044605e-16)
          {
            v37 = 60.0;
          }
          else
          {
            objc_msgSend(v6, "timeout");
            v37 = v36;
          }
        }
        else
        {
          v37 = v13;
          if (v34 > 2.22044605e-16)
          {
            objc_msgSend(v6, "timeout");
            if (v38 >= v13)
              v37 = v13;
            else
              v37 = v38;
          }
        }
        if (self)
          timerManager = self->_timerManager;
        else
          timerManager = 0;
        v40 = timerManager;
        objc_msgSend(v6, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMFTimerManager startTimerWithTimeInterval:object:](v40, "startTimerWithTimeInterval:object:", v41, v37);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = -[HMDHomePrimaryResidentMessagingHandlerPendingMessageContext initWithMessage:messageTimerContext:]([HMDHomePrimaryResidentMessagingHandlerPendingMessageContext alloc], "initWithMessage:messageTimerContext:", v6, v60);
        if (((v33 | v63) & 1) == 0 && ((v30 ^ 1) & 1) == 0)
        {
          if (self)
            v42 = self->_timerManager;
          else
            v42 = 0;
          v43 = v42;
          objc_msgSend(v6, "identifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMFTimerManager startTimerWithTimeInterval:object:](v43, "startTimerWithTimeInterval:object:", v44, v13);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomePrimaryResidentMessagingHandlerPendingMessageContext setQueueTimerContext:](v61, "setQueueTimerContext:", v45);

        }
        if (v63)
        {
          -[HMDHomePrimaryResidentMessagingHandlerPendingMessageContext setMessageInFlight:](v61, "setMessageInFlight:", 1);
          objc_msgSend(v19, "identifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomePrimaryResidentMessagingHandlerPendingMessageContext setLastPrimaryResidentDestinationUUID:](v61, "setLastPrimaryResidentDestinationUUID:", v46);

        }
        else
        {
          v47 = -[HMDHomePrimaryResidentMessagingHandlerPendingMessageContext setCompletionHandler:](v61, "setCompletionHandler:", v7);
        }
        v48 = (void *)MEMORY[0x227676638](v47);
        v49 = self;
        HMFGetOSLogHandle();
        v50 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v59 = v48;
          HMFGetLogIdentifier();
          v51 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v65 = v51;
          v66 = 2114;
          v67 = v52;
          _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_INFO, "%{public}@Enqueueing message %{public}@", buf, 0x16u);

          v48 = v59;
        }

        objc_autoreleasePoolPop(v48);
        if (self)
          pendingMessages = v49->_pendingMessages;
        else
          pendingMessages = 0;
        v54 = pendingMessages;
        objc_msgSend(v6, "identifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](v54, "setObject:forKey:", v61, v55);

      }
      os_unfair_lock_unlock(&self->_lock);
      if (v63)
      {
        -[HMDHomePrimaryResidentMessagingHandler _sendMessage:toPrimaryResidentDevice:completionHandler:](self, "_sendMessage:toPrimaryResidentDevice:completionHandler:", v6, v19, v7);
LABEL_64:

        goto LABEL_65;
      }
    }
    -[HMDHomePrimaryResidentMessagingHandler _discoverPrimaryResident](self, "_discoverPrimaryResident", v59);
    if (!v62)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "respondWithError:", v56);
      v57 = _Block_copy(v7);
      v58 = v57;
      if (v57)
        (*((void (**)(void *, void *))v57 + 2))(v57, v56);

    }
    goto LABEL_64;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "respondWithError:", v27);
  v28 = _Block_copy(v7);
  v29 = v28;
  if (v28)
    (*((void (**)(void *, void *))v28 + 2))(v28, v27);

LABEL_65:
}

- (void)_sendMessage:(id)a3 toPrimaryResidentDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  HMDRemoteDeviceMessageDestination *v12;
  void *v13;
  void *v14;
  HMDRemoteDeviceMessageDestination *v15;
  void *v16;
  HMDRemoteDeviceMessageDestination *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDHomePrimaryResidentMessagingHandler *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  HMDRemoteDeviceMessageDestination *v30;
  void *v31;
  void *v32;
  HMFMessageDispatcher *messageDispatcher;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "device");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = [HMDRemoteDeviceMessageDestination alloc];
  objc_msgSend(v8, "destination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "target");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  v16 = (void *)v11;
  v17 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v15, "initWithTarget:device:", v14, v11);

  v18 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  if (v20)
  {
    v21 = (void *)objc_msgSend(v20, "copyWithDestination:", v17);
  }
  else
  {
    v21 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v18, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setIdentifier:", v22);

    objc_msgSend(v21, "setDestination:", v17);
  }
  if (objc_msgSend(v18, "isRequestType"))
  {
    -[HMDHomePrimaryResidentMessagingHandler _responseHandlerForRequestMessage:](self, "_responseHandlerForRequestMessage:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setResponseHandler:", v23);

  }
  v24 = (void *)MEMORY[0x227676638]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v36 = v9;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v35 = v10;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shortDescription");
    v34 = v24;
    v29 = v20;
    v30 = v17;
    v31 = v16;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v27;
    v39 = 2114;
    v40 = v28;
    v41 = 2114;
    v42 = v32;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ to device %{public}@", buf, 0x20u);

    v16 = v31;
    v17 = v30;
    v20 = v29;
    v24 = v34;

    v10 = v35;
    v9 = v36;
  }

  objc_autoreleasePoolPop(v24);
  if (v25)
    messageDispatcher = v25->_messageDispatcher;
  else
    messageDispatcher = 0;
  -[HMFMessageDispatcher sendMessage:completionHandler:](messageDispatcher, "sendMessage:completionHandler:", v21, v10);

}

- (id)_responseHandlerForRequestMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HMDHomePrimaryResidentMessagingHandler__responseHandlerForRequestMessage___block_invoke;
  aBlock[3] = &unk_24E798D90;
  objc_copyWeak(&v11, &location);
  v10 = v5;
  v6 = v5;
  v7 = _Block_copy(aBlock);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (void)_discoverPrimaryResident
{
  HMDHomePrimaryResidentMessagingHandler *v2;

  v2 = self;
  if (self)
    self = (HMDHomePrimaryResidentMessagingHandler *)self->_residentDeviceManager;
  -[HMDHomePrimaryResidentMessagingHandler discoverPrimaryResidentForRequester:](self, "discoverPrimaryResidentForRequester:", v2);
}

- (void)residentDeviceManager:(id)a3 didCompleteDiscoveryWithPrimaryResidentDevice:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDResidentDeviceManager *residentDeviceManager;
  uint64_t v12;
  void *v13;
  HMDHomePrimaryResidentMessagingHandler *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDHomePrimaryResidentMessagingHandler *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v10, "isHMFError") || objc_msgSend(v10, "code") != 12)
  {
    if (v10)
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v20;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Primary resident discovery failed and we're not processing pending messages. %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      goto LABEL_14;
    }
LABEL_13:
    -[HMDHomePrimaryResidentMessagingHandler _processPendingMessagesWithPrimaryResidentDevice:](self, "_processPendingMessagesWithPrimaryResidentDevice:", v9);
LABEL_14:

    goto LABEL_15;
  }
  if (self)
    residentDeviceManager = self->_residentDeviceManager;
  else
    residentDeviceManager = 0;
  -[HMDResidentDeviceManager primaryResidentDevice](residentDeviceManager, "primaryResidentDevice");
  v12 = objc_claimAutoreleasedReturnValue();

  v9 = (id)v12;
  if (v12)
    goto LABEL_13;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v16;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Primary resident discovery was cancelled and there is no primary resident", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
LABEL_15:

}

- (void)_processPendingMessagesWithPrimaryResidentDevice:(id)a3
{
  id v4;
  void *v5;
  HMDHomePrimaryResidentMessagingHandler *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDHomePrimaryResidentMessagingHandler *v11;
  NSObject *v12;
  void *v13;
  NSMapTable *pendingMessages;
  NSMapTable *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  HMDHomePrimaryResidentMessagingHandler *v24;
  NSObject *v25;
  id v26;
  id v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSMapTable *v42;
  void *v43;
  NSMapTable *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  HMFTimerManager *timerManager;
  void *v53;
  HMFTimerManager *v54;
  void *v55;
  void *v56;
  HMFTimerManager *v57;
  HMFTimerManager *v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  HMFTimerManager *v65;
  uint64_t v66;
  void *v67;
  HMDHomePrimaryResidentMessagingHandler *v68;
  NSObject *v69;
  void *v70;
  const __CFString *v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  void *v77;
  os_unfair_lock_s *lock;
  id v79;
  int v80;
  id v81;
  id v82;
  id obj;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[5];
  id v106;
  id v107;
  id v108;
  _QWORD v109[4];
  id v110;
  HMDHomePrimaryResidentMessagingHandler *v111;
  id v112;
  _QWORD aBlock[6];
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint8_t v119[128];
  uint8_t buf[4];
  id v121;
  __int16 v122;
  const __CFString *v123;
  __int16 v124;
  uint64_t v125;
  __int16 v126;
  uint64_t v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v121 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Processing pending messages", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v80 = objc_msgSend(v4, "isCurrentDevice");
    if (v80)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = v6;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v121 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Current device is now the primary resident. Cancelling all pending messages. In-flight messages are not cancelled", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
    }
    v82 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v81 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v79 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    lock = &v6->_lock;
    os_unfair_lock_lock_with_options();
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    if (v6)
      pendingMessages = v6->_pendingMessages;
    else
      pendingMessages = 0;
    v15 = pendingMessages;
    -[NSMapTable objectEnumerator](v15, "objectEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
    v17 = 0;
    if (v16)
    {
      v85 = *(_QWORD *)v116;
      do
      {
        v86 = v16;
        for (i = 0; i != v86; ++i)
        {
          if (*(_QWORD *)v116 != v85)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
          if (objc_msgSend(v19, "isMessageInFlight", lock))
          {
            ++v17;
            continue;
          }
          objc_msgSend(v19, "message");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "completionHandler");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setCompletionHandler:", 0);
          v84 = v17;
          objc_msgSend(v19, "lastPrimaryResidentDestinationUUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqual:", v21);

          if (v22)
          {
            v23 = (void *)MEMORY[0x227676638]();
            v24 = v6;
            HMFGetOSLogHandle();
            v25 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v26 = v4;
              HMFGetLogIdentifier();
              v27 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "message");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "identifier");
              v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v121 = v27;
              v122 = 2112;
              v123 = v29;
              _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Warning: Old destination matches new primary. Message %@ cannot be re-sent to the same device.", buf, 0x16u);

              v4 = v26;
            }

            objc_autoreleasePoolPop(v23);
            aBlock[0] = MEMORY[0x24BDAC760];
            aBlock[1] = 3221225472;
            aBlock[2] = __91__HMDHomePrimaryResidentMessagingHandler__processPendingMessagesWithPrimaryResidentDevice___block_invoke;
            aBlock[3] = &unk_24E79B440;
            aBlock[4] = v19;
            aBlock[5] = v24;
            v114 = v88;
            v30 = _Block_copy(aBlock);
            objc_msgSend(v82, "addObject:", v30);

          }
          else if (v80)
          {
            v109[0] = MEMORY[0x24BDAC760];
            v109[1] = 3221225472;
            v109[2] = __91__HMDHomePrimaryResidentMessagingHandler__processPendingMessagesWithPrimaryResidentDevice___block_invoke_2;
            v109[3] = &unk_24E79B440;
            v110 = v87;
            v111 = v6;
            v112 = v88;
            v31 = _Block_copy(v109);
            objc_msgSend(v82, "addObject:", v31);

          }
          else
          {
            objc_msgSend(v19, "setMessageInFlight:", 1);
            objc_msgSend(v4, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setLastPrimaryResidentDestinationUUID:", v32);

            v105[0] = MEMORY[0x24BDAC760];
            v105[1] = 3221225472;
            v105[2] = __91__HMDHomePrimaryResidentMessagingHandler__processPendingMessagesWithPrimaryResidentDevice___block_invoke_3;
            v105[3] = &unk_24E79B3F0;
            v105[4] = v6;
            v33 = v87;
            v106 = v33;
            v107 = v4;
            v108 = v88;
            v34 = _Block_copy(v105);
            objc_msgSend(v82, "addObject:", v34);

            if ((objc_msgSend(v33, "isRequestType") & 1) != 0)
            {
              objc_msgSend(v19, "queueTimerContext");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
              {
                objc_msgSend(v19, "queueTimerContext");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "addObject:", v36);

                objc_msgSend(v19, "setQueueTimerContext:", 0);
              }
              goto LABEL_27;
            }
          }
          objc_msgSend(v81, "addObject:", v19);
LABEL_27:

          v17 = v84;
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
      }
      while (v16);
    }
    v37 = v17;

    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v38 = v81;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v101, v130, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v102;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v102 != v40)
            objc_enumerationMutation(v38);
          if (v6)
            v42 = v6->_pendingMessages;
          else
            v42 = 0;
          v43 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v41);
          v44 = v42;
          objc_msgSend(v43, "message");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "identifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable removeObjectForKey:](v44, "removeObjectForKey:", v46);

          ++v41;
        }
        while (v39 != v41);
        v47 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v101, v130, 16);
        v39 = v47;
      }
      while (v47);
    }

    os_unfair_lock_unlock(lock);
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v48 = v38;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v97, v129, 16);
    if (v49)
    {
      v50 = *(_QWORD *)v98;
      do
      {
        v51 = 0;
        do
        {
          if (*(_QWORD *)v98 != v50)
            objc_enumerationMutation(v48);
          if (v6)
            timerManager = v6->_timerManager;
          else
            timerManager = 0;
          v53 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v51);
          v54 = timerManager;
          objc_msgSend(v53, "messageTimerContext");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMFTimerManager cancelTimerForContext:](v54, "cancelTimerForContext:", v55);

          objc_msgSend(v53, "queueTimerContext");
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
          {
            if (v6)
              v57 = v6->_timerManager;
            else
              v57 = 0;
            v58 = v57;
            objc_msgSend(v53, "queueTimerContext");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMFTimerManager cancelTimerForContext:](v58, "cancelTimerForContext:", v59);

          }
          ++v51;
        }
        while (v49 != v51);
        v60 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v97, v129, 16);
        v49 = v60;
      }
      while (v60);
    }

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v61 = v79;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v93, v128, 16);
    if (v62)
    {
      v63 = *(_QWORD *)v94;
      do
      {
        v64 = 0;
        do
        {
          if (*(_QWORD *)v94 != v63)
            objc_enumerationMutation(v61);
          if (v6)
            v65 = v6->_timerManager;
          else
            v65 = 0;
          -[HMFTimerManager cancelTimerForContext:](v65, "cancelTimerForContext:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * v64++), lock);
        }
        while (v62 != v64);
        v66 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v93, v128, 16);
        v62 = v66;
      }
      while (v66);
    }

    if (objc_msgSend(v82, "count"))
    {
      v67 = (void *)MEMORY[0x227676638]();
      v68 = v6;
      HMFGetOSLogHandle();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (v80)
          v71 = CFSTR("Cancelling");
        else
          v71 = CFSTR("Sending");
        v72 = objc_msgSend(v82, "count", lock);
        *(_DWORD *)buf = 138544130;
        v121 = v70;
        v122 = 2112;
        v123 = v71;
        v124 = 2048;
        v125 = v72;
        v126 = 2048;
        v127 = v37;
        _os_log_impl(&dword_2218F0000, v69, OS_LOG_TYPE_INFO, "%{public}@%@ %lu pending messages (%lu in flight)", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v67);
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v73 = v82;
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v89, v119, 16);
      if (v74)
      {
        v75 = *(_QWORD *)v90;
        do
        {
          for (j = 0; j != v74; ++j)
          {
            if (*(_QWORD *)v90 != v75)
              objc_enumerationMutation(v73);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * j) + 16))();
          }
          v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v89, v119, 16);
        }
        while (v74);
      }

    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v121 = v77;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil detected in primary resident messaging handler", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    +[HMDTTRManager sharedManager](HMDTTRManager, "sharedManager");
    v82 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:", CFSTR("Unexpected nil detected in primary resident messaging handler"), CFSTR("Unexpected nil detected in primary resident messaging handler"), CFSTR("HomeKit"), CFSTR("Resident"), 938669);
  }

}

- (void)handlePrimaryResidentUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  HMDHomePrimaryResidentMessagingHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDHomePrimaryResidentMessagingHandler *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("HMDResidentDeviceManagerHomeUUIDNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomePrimaryResidentMessagingHandler homeUUID](self, "homeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HMDHomePrimaryResidentMessagingHandler _processPendingMessagesWithPrimaryResidentDevice:](self, "_processPendingMessagesWithPrimaryResidentDevice:", v10);
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
        v19 = 138543362;
        v20 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received update primary resident notification but the primary resident is nil", (uint8_t *)&v19, 0xCu);

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
      v19 = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received update primary resident notification for the wrong home: %{public}@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)handleResidentUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  HMDResidentDeviceManager *residentDeviceManager;
  void *v13;
  int v14;
  void *v15;
  HMDHomePrimaryResidentMessagingHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDHomePrimaryResidentMessagingHandler *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("HMDResidentDeviceManagerHomeUUIDNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomePrimaryResidentMessagingHandler homeUUID](self, "homeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        residentDeviceManager = self->_residentDeviceManager;
      else
        residentDeviceManager = 0;
      -[HMDResidentDeviceManager primaryResidentUUID](residentDeviceManager, "primaryResidentUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqual:", v13);

      if (!v14)
        goto LABEL_17;
      if ((objc_msgSend(v10, "isReachable") & 1) != 0)
      {
        -[HMDHomePrimaryResidentMessagingHandler _processPendingMessagesWithPrimaryResidentDevice:](self, "_processPendingMessagesWithPrimaryResidentDevice:", v10);
LABEL_17:

        goto LABEL_18;
      }
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v22;
        v23 = "%{public}@The primary resident is unreachable. Not processing pending messages until it's reachable";
        v24 = v21;
        v25 = OS_LOG_TYPE_INFO;
        goto LABEL_15;
      }
    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v22;
        v23 = "%{public}@Unexpectedly received update resident notification but the resident is nil";
        v24 = v21;
        v25 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl(&dword_2218F0000, v24, v25, v23, (uint8_t *)&v26, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v19);
    goto LABEL_17;
  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v18;
    v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received update resident notification for the wrong home: %{public}@", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
LABEL_18:

}

- (void)timerManager:(id)a3 didFireForTimerContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSMapTable *pendingMessages;
  NSMapTable *v12;
  void *v13;
  NSMapTable *v14;
  NSMapTable *v15;
  id v16;
  void *v17;
  HMFTimerManager *v18;
  HMFTimerManager *v19;
  uint64_t v20;
  HMFTimerManager *timerManager;
  void *v22;
  void *v23;
  HMDHomePrimaryResidentMessagingHandler *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    os_unfair_lock_lock_with_options();
    if (self)
      pendingMessages = self->_pendingMessages;
    else
      pendingMessages = 0;
    v12 = pendingMessages;
    -[NSMapTable objectForKey:](v12, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      os_unfair_lock_unlock(&self->_lock);
LABEL_25:

      goto LABEL_26;
    }
    if (self)
      v14 = self->_pendingMessages;
    else
      v14 = 0;
    v15 = v14;
    -[NSMapTable removeObjectForKey:](v15, "removeObjectForKey:", v10);

    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v13, "queueTimerContext");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16 == v7)
    {
      if (self)
        timerManager = self->_timerManager;
      else
        timerManager = 0;
      v19 = timerManager;
      objc_msgSend(v13, "messageTimerContext");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "queueTimerContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
LABEL_20:
        v23 = (void *)MEMORY[0x227676638]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138543618;
          v32 = v26;
          v33 = 2114;
          v34 = v10;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ timed out", (uint8_t *)&v31, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "message");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "respondWithError:", v27);

        objc_msgSend(v13, "completionHandler");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        if (v29)
          (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v27);

        goto LABEL_25;
      }
      if (self)
        v18 = self->_timerManager;
      else
        v18 = 0;
      v19 = v18;
      objc_msgSend(v13, "queueTimerContext");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v20;
    -[HMFTimerManager cancelTimerForContext:](v19, "cancelTimerForContext:", v20);

    goto LABEL_20;
  }
LABEL_26:

}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryFuture, 0);
  objc_storeStrong((id *)&self->_repeatedDestinationError, 0);
  objc_storeStrong((id *)&self->_destinationIsCurrentDeviceError, 0);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_residentDeviceManager, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

void __91__HMDHomePrimaryResidentMessagingHandler__processPendingMessagesWithPrimaryResidentDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v5 = *(_QWORD *)(v4 + 80);
  else
    v5 = 0;
  objc_msgSend(v2, "respondWithError:", v5);

  v6 = _Block_copy(*(const void **)(a1 + 48));
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      v8 = *(_QWORD *)(v7 + 80);
    else
      v8 = 0;
    v9 = v6;
    (*((void (**)(void *, uint64_t))v6 + 2))(v6, v8);
    v6 = v9;
  }

}

void __91__HMDHomePrimaryResidentMessagingHandler__processPendingMessagesWithPrimaryResidentDevice___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(_QWORD *)(v3 + 72);
  else
    v4 = 0;
  objc_msgSend(v2, "respondWithError:", v4);
  v5 = _Block_copy(*(const void **)(a1 + 48));
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      v7 = *(_QWORD *)(v6 + 72);
    else
      v7 = 0;
    v8 = v5;
    (*((void (**)(void *, uint64_t))v5 + 2))(v5, v7);
    v5 = v8;
  }

}

uint64_t __91__HMDHomePrimaryResidentMessagingHandler__processPendingMessagesWithPrimaryResidentDevice___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:toPrimaryResidentDevice:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __76__HMDHomePrimaryResidentMessagingHandler__responseHandlerForRequestMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  _BOOL4 v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *context;
  void *v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (objc_msgSend(v5, "isHMError"))
      v8 = objc_msgSend(v5, "code") == 3202;
    else
      v8 = 0;
    v40 = v5;
    os_unfair_lock_lock_with_options();
    v9 = *((id *)WeakRetained + 8);
    objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *((id *)WeakRetained + 5);
      objc_msgSend(v11, "primaryResidentDevice");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if (!objc_msgSend(v38, "isCurrentDevice"))
        {
          v25 = *((id *)WeakRetained + 5);
          objc_msgSend(v25, "primaryResidentDevice");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "lastPrimaryResidentDestinationUUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = HMFEqualObjects();

          if ((v29 & 1) != 0 || !objc_msgSend(v26, "isReachable"))
          {
            objc_msgSend(v10, "setMessageInFlight:", 0);
            os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
            objc_msgSend(WeakRetained, "_discoverPrimaryResident");

          }
          else
          {
            objc_msgSend(v26, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setLastPrimaryResidentDestinationUUID:", v30);

            objc_msgSend(v10, "completionHandler");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setCompletionHandler:", 0);
            os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
            context = (void *)MEMORY[0x227676638]();
            v31 = WeakRetained;
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "message");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "identifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v42 = v33;
              v43 = 2114;
              v44 = v35;
              _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Retrying message %{public}@ since the primary resident has changed since the last message", buf, 0x16u);

            }
            objc_autoreleasePoolPop(context);
            objc_msgSend(v10, "message");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "_sendMessage:toPrimaryResidentDevice:completionHandler:", v36, v26, v39);

          }
          goto LABEL_21;
        }
        v12 = *((id *)WeakRetained + 9);

        v40 = v12;
      }
      v13 = *((id *)WeakRetained + 8);
      objc_msgSend(v13, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
      v14 = *((id *)WeakRetained + 7);
      objc_msgSend(v10, "messageTimerContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cancelTimerForContext:", v15);

      v16 = (void *)MEMORY[0x227676638]();
      v17 = WeakRetained;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "message");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v42 = v19;
        v43 = 2114;
        v44 = v21;
        v45 = 2112;
        v46 = v6;
        v47 = 2112;
        v48 = v40;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Responding to message %{public}@ with payload: %@, error: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v10, "message");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "respondWithPayload:error:", v6, v40);

      objc_msgSend(v10, "completionHandler");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v23)
        (*(void (**)(uint64_t, id))(v23 + 16))(v23, v40);

    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    }
LABEL_21:

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34 != -1)
    dispatch_once(&logCategory__hmf_once_t34, &__block_literal_global_4250);
  return (id)logCategory__hmf_once_v35;
}

void __53__HMDHomePrimaryResidentMessagingHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v35;
  logCategory__hmf_once_v35 = v0;

}

@end
