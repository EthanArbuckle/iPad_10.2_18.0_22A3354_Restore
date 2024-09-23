@implementation HMXPCEventRouterClient

void __35__HMXPCEventRouterClient_configure__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "messageDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __35__HMXPCEventRouterClient_configure__block_invoke_2;
  v17 = &unk_1E3AB61D0;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v5, "registerReconnectionHandler:", &v14);
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "messageDispatcher", v14, v15, v16, v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateMessageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerForMessage:receiver:selector:", v8, v6, sel__handleUpdateEventsMessage_);

    v9 = *(void **)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v9, "notificationCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:", v9);

      objc_msgSend(v9, "notificationCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel_handleWillResignActive_, *MEMORY[0x1E0CEB358], 0);

      objc_msgSend(v9, "notificationCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel_handleDidBecomeActive_, *MEMORY[0x1E0CEB270], 0);

      objc_msgSend(v9, "notificationCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", v9, sel_handleActiveAssertionSendState_, CFSTR("HMActiveAssertionDidSendStateNotification"), 0);

    }
  }
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)updateMessageName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)configure
{
  NSObject *v3;
  _QWORD block[5];

  -[HMXPCEventRouterClient workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__HMXPCEventRouterClient_configure__block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  dispatch_async(v3, block);

}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMEPersistentConnectionClient)eventRouterClient
{
  return (HMEPersistentConnectionClient *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMXPCEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 messageDispatcher:(id)a5 changeRegistrationsMessageName:(id)a6 updateMessageName:(id)a7 storeReadHandle:(id)a8 storeWriteHandle:(id)a9 useBackgroundTaskAssertion:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  HMXPCEventRouterClient *v28;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;

  v16 = a4;
  v17 = a8;
  v18 = a9;
  v19 = (void *)MEMORY[0x1E0CB37D0];
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a3;
  objc_msgSend(v19, "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __185__HMXPCEventRouterClient_initWithMessageTargetUUID_queue_messageDispatcher_changeRegistrationsMessageName_updateMessageName_storeReadHandle_storeWriteHandle_useBackgroundTaskAssertion___block_invoke;
  v31[3] = &unk_1E3AADB90;
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v25 = v18;
  v26 = v17;
  v27 = v16;
  LOBYTE(v30) = a10;
  v28 = -[HMXPCEventRouterClient initWithMessageTargetUUID:queue:messageDispatcher:changeRegistrationsMessageName:updateMessageName:notificationCenter:useBackgroundTaskAssertion:eventRouterClientFactory:](self, "initWithMessageTargetUUID:queue:messageDispatcher:changeRegistrationsMessageName:updateMessageName:notificationCenter:useBackgroundTaskAssertion:eventRouterClientFactory:", v23, v27, v22, v21, v20, v24, v30, v31);

  return v28;
}

- (HMXPCEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 messageDispatcher:(id)a5 changeRegistrationsMessageName:(id)a6 updateMessageName:(id)a7 notificationCenter:(id)a8 useBackgroundTaskAssertion:(BOOL)a9 eventRouterClientFactory:(id)a10
{
  id v17;
  id v18;
  void (**v19)(_QWORD);
  HMXPCEventRouterClient *v20;
  HMXPCEventRouterClient *v21;
  uint64_t v22;
  HMEPersistentConnectionClient *eventRouterClient;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void (**)(_QWORD))a10;
  v29.receiver = self;
  v29.super_class = (Class)HMXPCEventRouterClient;
  v20 = -[HMXPCEventRouterClient init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_lock._os_unfair_lock_opaque = 0;
    v20->_useBackgroundTaskAssertion = a9;
    v20->_isActive = 1;
    objc_storeStrong((id *)&v20->_identifier, a3);
    objc_storeStrong((id *)&v21->_workQueue, a4);
    objc_storeStrong((id *)&v21->_messageDispatcher, a5);
    objc_storeStrong((id *)&v21->_changeRegistrationsMessageName, a6);
    objc_storeStrong((id *)&v21->_updateMessageName, a7);
    objc_storeStrong((id *)&v21->_notificationCenter, a8);
    v19[2](v19);
    v22 = objc_claimAutoreleasedReturnValue();
    eventRouterClient = v21->_eventRouterClient;
    v21->_eventRouterClient = (HMEPersistentConnectionClient *)v22;

    -[HMEPersistentConnectionClient setDelegate:](v21->_eventRouterClient, "setDelegate:", v21, v25, v26, v27, v28);
  }

  return v21;
}

id __185__HMXPCEventRouterClient_initWithMessageTargetUUID_queue_messageDispatcher_changeRegistrationsMessageName_updateMessageName_storeReadHandle_storeWriteHandle_useBackgroundTaskAssertion___block_invoke(_QWORD *a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D32D60]), "initWithQueue:storeReadHandle:storeWriteHandle:", a1[4], a1[5], a1[6]);
}

- (void)handleDidBecomeActive:(id)a3
{
  id v4;
  void *v5;
  HMXPCEventRouterClient *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[HMXPCEventRouterClient isActive](self, "isActive"))
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Reconnect on active", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMXPCEventRouterClient setIsActive:](v6, "setIsActive:", 1);
    -[HMXPCEventRouterClient reconnect](v6);
  }

}

- (BOOL)isActive
{
  HMXPCEventRouterClient *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_isActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMXPCEventRouterClient messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMXPCEventRouterClient identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)sendChangeRegistrationsMessageWithAddedFilters:(id)a3 removedFilters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMXPCEventRouterProtoChangeRegistrationsMessage *v11;
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
  HMXPCEventRouterClient *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  id v29;
  id v30;
  const __CFString *v31;
  void *v32;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(HMXPCEventRouterProtoChangeRegistrationsMessage);
  if (objc_msgSend(v8, "count"))
  {
    v12 = (void *)objc_msgSend(v8, "mutableCopy");
    -[HMXPCEventRouterProtoChangeRegistrationsMessage setTopicFilterAdditions:](v11, "setTopicFilterAdditions:", v12);

  }
  if (objc_msgSend(v9, "count"))
  {
    v13 = (void *)objc_msgSend(v9, "mutableCopy");
    -[HMXPCEventRouterProtoChangeRegistrationsMessage setTopicFilterRemovals:](v11, "setTopicFilterRemovals:", v13);

  }
  if (objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
  {
    v14 = (void *)MEMORY[0x1E0D285F8];
    -[HMXPCEventRouterClient changeRegistrationsMessageName](self, "changeRegistrationsMessageName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMXPCEventRouterClient messageDestination](self, "messageDestination");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = CFSTR("HM.subbroker.payload");
    -[HMXPCEventRouterProtoChangeRegistrationsMessage data](v11, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messageWithName:destination:payload:", v15, v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(location, self);
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __99__HMXPCEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_completion___block_invoke;
    v28 = &unk_1E3AB4AE0;
    objc_copyWeak(&v30, location);
    v29 = v10;
    objc_msgSend(v19, "setResponseHandler:", &v25);
    -[HMXPCEventRouterClient messageDispatcher](self, "messageDispatcher", v25, v26, v27, v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendMessage:completionHandler:", v19, 0);

    objc_destroyWeak(&v30);
    objc_destroyWeak(location);
  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v24;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Expected additions or removals but have none.", (uint8_t *)location, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, MEMORY[0x1E0C9AA70], v19);
  }

}

- (id)forwardingTopicsForTopics:(id)a3
{
  return +[HMAccessoryEventTopic filterTopicsReplacingWithIndex:](HMAccessoryEventTopic, "filterTopicsReplacingWithIndex:", a3);
}

- (unint64_t)willWriteToStore
{
  void *v3;
  unint64_t v4;
  void *v5;
  HMXPCEventRouterClient *v6;
  NSObject *v7;
  void *v8;
  _QWORD v10[6];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!-[HMXPCEventRouterClient useBackgroundTaskAssertion](self, "useBackgroundTaskAssertion"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__HMXPCEventRouterClient_willWriteToStore__block_invoke;
  v10[3] = &unk_1E3AADC28;
  v10[4] = self;
  v10[5] = 0;
  v4 = objc_msgSend(v3, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("HomeKitEventStore"), v10);

  if (v4 == *MEMORY[0x1E0CEB390])
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Could not create BTA successfully", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  return v4;
}

- (void)finishedWritingToStore:(unint64_t)a3
{
  id v4;

  if (-[HMXPCEventRouterClient useBackgroundTaskAssertion](self, "useBackgroundTaskAssertion"))
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endBackgroundTask:", a3);

  }
}

- (void)setIsActive:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_isActive = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_handleUpdateEventsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMXPCEventRouterProtoEventsMessage *v8;
  void *v9;
  HMXPCEventRouterClient *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMXPCEventRouterClient *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMXPCEventRouterClient workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMXPCEventRouterClient isActive](self, "isActive"))
  {
    objc_msgSend(v4, "messagePayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HM.subbroker.events"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = -[HMXPCEventRouterProtoEventsMessage initWithData:]([HMXPCEventRouterProtoEventsMessage alloc], "initWithData:", v7);
      v9 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMXPCEventRouterProtoEventsMessage events](v8, "events");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");
        -[HMXPCEventRouterProtoEventsMessage cachedEvents](v8, "cachedEvents");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543874;
        v31 = v12;
        v32 = 2048;
        v33 = v14;
        v34 = 2048;
        v35 = objc_msgSend(v15, "count");
        _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Received updated events: %lu cached: %lu", (uint8_t *)&v30, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      -[HMXPCEventRouterProtoEventsMessage events](v8, "events");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        -[HMXPCEventRouterProtoEventsMessage events](v8, "events");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "na_map:", &__block_literal_global_23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMXPCEventRouterClient eventRouterClient](v10, "eventRouterClient");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "processReceivedEventsFromMessage:", v19);

      }
      -[HMXPCEventRouterProtoEventsMessage cachedEvents](v8, "cachedEvents");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22)
      {
        -[HMXPCEventRouterProtoEventsMessage cachedEvents](v8, "cachedEvents");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "na_map:", &__block_literal_global_24);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMXPCEventRouterClient eventRouterClient](v10, "eventRouterClient");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "processReceivedCachedEventsFromMessage:", v24);

      }
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v29;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Fail message as not active", (uint8_t *)&v30, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v7);
  }

}

- (void)handleActiveAssertionSendState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  HMXPCEventRouterClient *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMActiveAssertionActiveStateNotificationKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      v10 = objc_msgSend(v9, "BOOLValue");
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if (v14)
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543362;
          v18 = v15;
          _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received notification for active state", (uint8_t *)&v17, 0xCu);

        }
        objc_autoreleasePoolPop(v11);
        -[HMXPCEventRouterClient handleDidBecomeActive:](v12, "handleDidBecomeActive:", v4);
      }
      else
      {
        if (v14)
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543362;
          v18 = v16;
          _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received notification for inactive state", (uint8_t *)&v17, 0xCu);

        }
        objc_autoreleasePoolPop(v11);
        -[HMXPCEventRouterClient handleWillResignActive:](v12, "handleWillResignActive:", v4);
      }
    }

  }
}

- (void)handleWillResignActive:(id)a3
{
  id v4;
  void *v5;
  HMXPCEventRouterClient *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Going dormant on becoming inactive", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMXPCEventRouterClient setIsActive:](v6, "setIsActive:", 0);

}

- (NSString)changeRegistrationsMessageName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)useBackgroundTaskAssertion
{
  return self->_useBackgroundTaskAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventRouterClient, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_updateMessageName, 0);
  objc_storeStrong((id *)&self->_changeRegistrationsMessageName, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __35__HMXPCEventRouterClient_configure__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[HMXPCEventRouterClient reconnect](WeakRetained);
    WeakRetained = v2;
  }

}

- (void)reconnect
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__HMXPCEventRouterClient_reconnect__block_invoke;
    block[3] = &unk_1E3AB5E18;
    block[4] = a1;
    dispatch_async(v2, block);

  }
}

void __35__HMXPCEventRouterClient_reconnect__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    if ((objc_msgSend(v1, "isActive") & 1) != 0)
    {
      objc_msgSend(v1, "eventRouterClient");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didReconnect");

    }
    else
    {
      v3 = (void *)MEMORY[0x1A1AC1AAC]();
      v4 = v1;
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v9 = v6;
        _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Will not connect as not active", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v3);
    }
  }
}

uint64_t __53__HMXPCEventRouterClient__handleUpdateEventsMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D32D30], "fromProtobuff:", a2);
}

uint64_t __53__HMXPCEventRouterClient__handleUpdateEventsMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D32D30], "fromProtobuff:", a2);
}

void __42__HMXPCEventRouterClient_willWriteToStore__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Background task token %lu expired", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
}

void __99__HMXPCEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __99__HMXPCEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_completion___block_invoke_2;
    v10[3] = &unk_1E3AB4D20;
    v11 = v5;
    v12 = v8;
    v14 = *(id *)(a1 + 32);
    v13 = v6;
    dispatch_async(v9, v10);

  }
}

void __99__HMXPCEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMXPCEventRouterProtoEventsMessage *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v20 = 138543618;
      v21 = v5;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to change registrations with error: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "hmf_dataForKey:", CFSTR("HM.subbroker.events"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMXPCEventRouterProtoEventsMessage initWithData:]([HMXPCEventRouterProtoEventsMessage alloc], "initWithData:", v7);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMXPCEventRouterProtoEventsMessage cachedEvents](v8, "cachedEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      -[HMXPCEventRouterProtoEventsMessage cachedEvents](v8, "cachedEvents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "na_map:", &__block_literal_global_16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D32D30], "eventsMapFromEventInfos:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v14;
    }
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v9, "count");
      v20 = 138543618;
      v21 = v18;
      v22 = 2048;
      v23 = v19;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Changed registrations and received %lu events", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t __99__HMXPCEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_completion___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D32D30], "fromProtobuff:", a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0 != -1)
    dispatch_once(&logCategory__hmf_once_t0, &__block_literal_global_1805);
  return (id)logCategory__hmf_once_v1;
}

void __37__HMXPCEventRouterClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1;
  logCategory__hmf_once_v1 = v0;

}

@end
