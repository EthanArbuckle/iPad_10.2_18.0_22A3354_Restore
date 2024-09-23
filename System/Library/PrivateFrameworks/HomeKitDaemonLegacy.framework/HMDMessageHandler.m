@implementation HMDMessageHandler

- (HMDMessageHandler)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 ownerPrivateRemoteMessages:(id)a6 adminPrivateRemoteMessages:(id)a7 internalMessages:(id)a8 notifications:(id)a9 notificationsToObject:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  HMDMessageHandlerMetricsDispatcher *v24;
  void *v25;
  HMDMessageHandlerMetricsDispatcher *v26;
  void *v27;
  HMDMessageHandler *v30;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = [HMDMessageHandlerMetricsDispatcher alloc];
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[HMDMessageHandlerMetricsDispatcher initWithIdentifier:logEventSubmitter:](v24, "initWithIdentifier:logEventSubmitter:", v23, v25);

  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[HMDMessageHandler initWithMessageTargetUUID:messageDispatcher:notificationCenter:ownerPrivateRemoteMessages:adminPrivateRemoteMessages:internalMessages:notifications:notificationsToObject:appleAccountManager:metricsDispatcher:](self, "initWithMessageTargetUUID:messageDispatcher:notificationCenter:ownerPrivateRemoteMessages:adminPrivateRemoteMessages:internalMessages:notifications:notificationsToObject:appleAccountManager:metricsDispatcher:", v23, v22, v21, v20, v19, v18, v17, v16, v27, v26);

  return v30;
}

- (HMDMessageHandler)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 ownerPrivateRemoteMessages:(id)a6 adminPrivateRemoteMessages:(id)a7 internalMessages:(id)a8 notifications:(id)a9 notificationsToObject:(id)a10 appleAccountManager:(id)a11 metricsDispatcher:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  HMDMessageHandler *v26;
  HMDMessageHandler *v27;
  uint64_t v28;
  NSMutableDictionary *messageNameToQueuedIncomingMessages;
  uint64_t v30;
  NSMutableDictionary *messageNameToQueuedOutgoingMessage;
  uint64_t v32;
  NSMutableDictionary *deviceIdentifierToQueuedOutgoingMessageNames;
  HMDMessageHandler *result;
  HMDMessageHandler *v35;
  SEL v36;
  id v37;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v45;
  id v46;
  id v47;
  objc_super v48;

  v17 = a3;
  v39 = a4;
  v18 = a4;
  v47 = a5;
  v40 = a6;
  v46 = a6;
  v41 = a7;
  v19 = a7;
  v42 = a8;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v45 = a11;
  v23 = a12;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v18)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v47)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v46)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v19)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v20)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v21)
  {
LABEL_19:
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  if (!v22)
  {
LABEL_20:
    _HMFPreconditionFailure();
    goto LABEL_21;
  }
  if (!v23)
  {
LABEL_21:
    v35 = (HMDMessageHandler *)_HMFPreconditionFailure();
    -[HMDMessageHandler configureWithHome:](v35, v36, v37);
    return result;
  }
  v24 = v23;
  v43 = v22;
  objc_msgSend(v21, "arrayByAddingObject:", CFSTR("HMDAccountAddedDeviceNotification"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v48.receiver = self;
  v48.super_class = (Class)HMDMessageHandler;
  v26 = -[HMDMessageHandler init](&v48, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_messageTargetUUID, a3);
    objc_storeStrong((id *)&v27->_messageDispatcher, v39);
    objc_storeStrong((id *)&v27->_notificationCenter, a5);
    objc_storeStrong((id *)&v27->_ownerPrivateRemoteMessages, v40);
    objc_storeStrong((id *)&v27->_adminPrivateRemoteMessages, v41);
    objc_storeStrong((id *)&v27->_internalMessages, v42);
    objc_storeStrong((id *)&v27->_notifications, v25);
    objc_storeStrong((id *)&v27->_notificationsToObject, a10);
    objc_storeStrong((id *)&v27->_appleAccountManager, a11);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    messageNameToQueuedIncomingMessages = v27->_messageNameToQueuedIncomingMessages;
    v27->_messageNameToQueuedIncomingMessages = (NSMutableDictionary *)v28;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = objc_claimAutoreleasedReturnValue();
    messageNameToQueuedOutgoingMessage = v27->_messageNameToQueuedOutgoingMessage;
    v27->_messageNameToQueuedOutgoingMessage = (NSMutableDictionary *)v30;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v32 = objc_claimAutoreleasedReturnValue();
    deviceIdentifierToQueuedOutgoingMessageNames = v27->_deviceIdentifierToQueuedOutgoingMessageNames;
    v27->_deviceIdentifierToQueuedOutgoingMessageNames = (NSMutableDictionary *)v32;

    objc_storeStrong((id *)&v27->_metricsDispatcher, a12);
  }

  return v27;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMessageHandler registerForMessagesWithHome:](v6, "registerForMessagesWithHome:", v4);
  -[HMDMessageHandler registerForNotifications](v6, "registerForNotifications");
  -[HMDMessageHandler setHome:](v6, "setHome:", v4);
  objc_msgSend(v4, "homeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMessageHandler setHomeManager:](v6, "setHomeManager:", v9);

}

- (void)registerForMessagesWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMessageHandler *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDMessageHandler ownerPrivateRemoteMessages](self, "ownerPrivateRemoteMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMessageHandler adminPrivateRemoteMessages](self, "adminPrivateRemoteMessages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMessageHandler internalMessages](self, "internalMessages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v11;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Registering for messages owner: %@, admin: %@, internal: %@", (uint8_t *)&v12, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMessageHandler registerForSPIRemoteMessages:home:userPrivilege:internalBuildOnly:](v9, "registerForSPIRemoteMessages:home:userPrivilege:internalBuildOnly:", v5, v4, 3, 0);
  -[HMDMessageHandler registerForSPIRemoteMessages:home:userPrivilege:internalBuildOnly:](v9, "registerForSPIRemoteMessages:home:userPrivilege:internalBuildOnly:", v6, v4, 4, 0);
  -[HMDMessageHandler registerForSPIRemoteMessages:home:userPrivilege:internalBuildOnly:](v9, "registerForSPIRemoteMessages:home:userPrivilege:internalBuildOnly:", v7, v4, 3, 1);

}

- (void)registerForSPIRemoteMessages:(id)a3 home:(id)a4 userPrivilege:(unint64_t)a5 internalBuildOnly:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  HMDMessageHandler *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[3];
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v6 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v27 = a4;
  if (v6 && (isInternalBuild() & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v22;
      v36 = 2112;
      v37 = v9;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Skipping registration for internal build messages: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }
  else
  {
    -[HMDMessageHandler messageDispatcher](self, "messageDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v9;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (-[HMDMessageHandler selectorForName:](self, "selectorForName:", v16))
          {
            +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v27, a5, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v32[0] = v17;
            v32[1] = v10;
            v32[2] = v25;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "registerForMessage:receiver:policies:selector:", v16, self, v18, sel_routeMessage_);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v13);
    }

    v9 = v23;
  }

}

- (void)registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  HMDMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[HMDMessageHandler notifications](self, "notifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMessageHandler notificationsToObject](self, "notificationsToObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v8;
    v29 = 2112;
    v30 = v3;
    v31 = 2112;
    v32 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Register for notifications: %@ notifications to objects: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v3;
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v17 = -[HMDMessageHandler selectorForName:](v6, "selectorForName:", v16);
        if (v17)
        {
          v18 = v17;
          objc_msgSend(v4, "objectForKeyedSubscript:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMessageHandler notificationCenter](v6, "notificationCenter");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObserver:selector:name:object:", v6, v18, v16, v19);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

}

- (BOOL)hasQueuedIncomingMessages
{
  HMDMessageHandler *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = -[NSMutableDictionary count](v2->_messageNameToQueuedIncomingMessages, "count") != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)queuedIncomingMessages
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_messageNameToQueuedIncomingMessages, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "na_map:", &__block_literal_global_169908);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)queueIncomingMessage:(id)a3
{
  id v4;
  void *v5;
  HMDMessageHandler *v6;
  NSObject *v7;
  void *v8;
  HMDMessageHandlerQueuedMessage *v9;
  NSMutableDictionary *messageNameToQueuedIncomingMessages;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  HMDMessageHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v8;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Queueing incoming message: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = -[HMDMessageHandlerQueuedMessage initWithMessage:timeInterval:]([HMDMessageHandlerQueuedMessage alloc], "initWithMessage:timeInterval:", v4, 600.0);
  -[HMDMessageHandlerQueuedMessage setDelegate:](v9, "setDelegate:", v6);
  -[HMDMessageHandlerQueuedMessage resumeTimer](v9, "resumeTimer");
  os_unfair_lock_lock_with_options();
  messageNameToQueuedIncomingMessages = v6->_messageNameToQueuedIncomingMessages;
  -[HMDMessageHandlerQueuedMessage name](v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](messageNameToQueuedIncomingMessages, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v6->_messageNameToQueuedIncomingMessages;
  -[HMDMessageHandlerQueuedMessage name](v9, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v9, v14);

  os_unfair_lock_unlock(&v6->_lock);
  if (v12)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "message");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Canceling queued incoming message due to duplicate message name for message: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v12, "setDelegate:", 0);
    objc_msgSend(v12, "suspendTimer");
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "message");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "respondWithError:", v20);

  }
}

- (id)dequeueIncomingMessage:(id)a3
{
  id v4;
  void *v5;
  HMDMessageHandler *v6;
  NSObject *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  id v11;
  void *v12;
  NSMutableDictionary *messageNameToQueuedIncomingMessages;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Dequeueing incoming message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](v6->_messageNameToQueuedIncomingMessages, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__HMDMessageHandler_dequeueIncomingMessage___block_invoke;
  v17[3] = &unk_1E89BE870;
  v11 = v4;
  v18 = v11;
  objc_msgSend(v10, "na_firstObjectPassingTest:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "setDelegate:", 0);
    objc_msgSend(v12, "suspendTimer");
    messageNameToQueuedIncomingMessages = v6->_messageNameToQueuedIncomingMessages;
    objc_msgSend(v11, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](messageNameToQueuedIncomingMessages, "removeObjectForKey:", v14);

    objc_msgSend(v12, "message");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)dequeueQueuedIncomingMessages
{
  void *v3;
  HMDMessageHandler *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMessageHandler queuedIncomingMessages](v4, "queuedIncomingMessages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Dequeueing incoming messages: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](v4->_messageNameToQueuedIncomingMessages, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](v4->_messageNameToQueuedIncomingMessages, "removeAllObjects");
  os_unfair_lock_unlock(&v4->_lock);
  objc_msgSend(v8, "na_map:", &__block_literal_global_34_169904);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)hasQueuedIncomingMessage:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_messageNameToQueuedIncomingMessages, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__HMDMessageHandler_hasQueuedIncomingMessage___block_invoke;
  v10[3] = &unk_1E89BE870;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8 != 0;
}

- (void)queueOutgoingMessage:(id)a3
{
  id v4;
  void *v5;
  HMDMessageHandler *v6;
  NSObject *v7;
  void *v8;
  HMDMessageHandlerQueuedMessage *v9;
  NSMutableDictionary *messageNameToQueuedOutgoingMessage;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  HMDMessageHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v8;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Queueing outgoing message: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = -[HMDMessageHandlerQueuedMessage initWithMessage:timeInterval:]([HMDMessageHandlerQueuedMessage alloc], "initWithMessage:timeInterval:", v4, 180.0);
  -[HMDMessageHandlerQueuedMessage setDelegate:](v9, "setDelegate:", v6);
  -[HMDMessageHandlerQueuedMessage resumeTimer](v9, "resumeTimer");
  os_unfair_lock_lock_with_options();
  messageNameToQueuedOutgoingMessage = v6->_messageNameToQueuedOutgoingMessage;
  -[HMDMessageHandlerQueuedMessage name](v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](messageNameToQueuedOutgoingMessage, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v6->_messageNameToQueuedOutgoingMessage;
  -[HMDMessageHandlerQueuedMessage name](v9, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v9, v14);

  os_unfair_lock_unlock(&v6->_lock);
  if (v12)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "message");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Canceling queued outgoing message due to duplicate message name for message: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v12, "setDelegate:", 0);
    objc_msgSend(v12, "suspendTimer");
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "message");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "respondWithError:", v20);

  }
}

- (void)associateDevice:(id)a3 withOutgoingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMessageHandler *v9;
  NSObject *v10;
  void *v11;
  os_unfair_lock_s *p_lock;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Associating device: %@ with outgoing message: %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v9->_deviceIdentifierToQueuedOutgoingMessageNames, "objectForKey:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSMutableDictionary setObject:forKey:](v9->_deviceIdentifierToQueuedOutgoingMessageNames, "setObject:forKey:", v14, v13);
  }
  objc_msgSend(v7, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v15);

  os_unfair_lock_unlock(p_lock);
}

- (id)dequeueOutgoingMessage:(id)a3
{
  id v4;
  void *v5;
  HMDMessageHandler *v6;
  NSObject *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  id v11;
  void *v12;
  NSMutableDictionary *messageNameToQueuedOutgoingMessage;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Dequeueing outgoing message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](v6->_messageNameToQueuedOutgoingMessage, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__HMDMessageHandler_dequeueOutgoingMessage___block_invoke;
  v17[3] = &unk_1E89BE870;
  v11 = v4;
  v18 = v11;
  objc_msgSend(v10, "na_firstObjectPassingTest:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "setDelegate:", 0);
    objc_msgSend(v12, "suspendTimer");
    messageNameToQueuedOutgoingMessage = v6->_messageNameToQueuedOutgoingMessage;
    objc_msgSend(v11, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](messageNameToQueuedOutgoingMessage, "removeObjectForKey:", v14);

    -[HMDMessageHandler _cleanUpDeviceMappingsForMessage:](v6, "_cleanUpDeviceMappingsForMessage:", v11);
    objc_msgSend(v12, "message");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (void)_cleanUpDeviceMappingsForMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[NSMutableDictionary allKeys](self->_deviceIdentifierToQueuedOutgoingMessageNames, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_deviceIdentifierToQueuedOutgoingMessageNames, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeObject:", v12);

          if (!objc_msgSend(v11, "count"))
            -[NSMutableDictionary removeObjectForKey:](self->_deviceIdentifierToQueuedOutgoingMessageNames, "removeObjectForKey:", v10);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (BOOL)hasQueuedOutgoingMessage:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_messageNameToQueuedOutgoingMessage, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__HMDMessageHandler_hasQueuedOutgoingMessage___block_invoke;
  v10[3] = &unk_1E89BE870;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8 != 0;
}

- (id)queuedOutgoingMessages
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_messageNameToQueuedOutgoingMessage, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "na_map:", &__block_literal_global_36_169894);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)queuedOutgoingMessagesForDevice:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *deviceIdentifierToQueuedOutgoingMessageNames;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  deviceIdentifierToQueuedOutgoingMessageNames = self->_deviceIdentifierToQueuedOutgoingMessageNames;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](deviceIdentifierToQueuedOutgoingMessageNames, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__HMDMessageHandler_queuedOutgoingMessagesForDevice___block_invoke;
    v12[3] = &unk_1E89BE8D8;
    v12[4] = self;
    objc_msgSend(v8, "na_map:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)routeMessage:(id)a3
{
  -[HMDMessageHandler routeMessage:shouldQueue:](self, "routeMessage:shouldQueue:", a3, 1);
}

- (void)routeMessage:(id)a3 shouldQueue:(BOOL)a4
{
  id v5;
  void *v6;
  HMDMessageHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  void *v14;
  HMDMessageHandler *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDMessageHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  void *v26;
  HMDMessageHandler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDMessageHandler *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HMDMessageHandler *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v9;
    v44 = 2112;
    v45 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Routing message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "responseHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v21;
      v44 = 2112;
      v45 = v5;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to route message due to no response handler from message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[HMDMessageHandler queueIncomingMessage:](v7, "queueIncomingMessage:", v5);
  v41 = 0;
  v11 = -[HMDMessageHandler isReadyForIncomingMessage:error:](v7, "isReadyForIncomingMessage:error:", v5, &v41);
  v12 = v41;
  if (v12)
  {
    v13 = v12;
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v17;
      v44 = 2112;
      v45 = v13;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to route message due to ready preference error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
LABEL_11:
    objc_msgSend(v5, "respondWithError:", v13);

    goto LABEL_12;
  }
  if (!v11)
    goto LABEL_12;
  -[HMDMessageHandler dequeueIncomingMessage:](v7, "dequeueIncomingMessage:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v40 = 0;
    v23 = -[HMDMessageHandler shouldRelayIncomingMessage:error:](v7, "shouldRelayIncomingMessage:error:", v22, &v40);
    v24 = v40;
    if (v24)
    {
      v25 = v24;
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = v7;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v29;
        v44 = 2112;
        v45 = v25;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to route message due to relay preference error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
    }
    else
    {
      -[HMDMessageHandler _logMediaDestinationControllerUpdateMetricsUsingMessage:](v7, "_logMediaDestinationControllerUpdateMetricsUsingMessage:", v22);
      if (v23)
      {
        -[HMDMessageHandler relayMessage:](v7, "relayMessage:", v22);
        goto LABEL_27;
      }
      objc_msgSend(v22, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[HMDMessageHandler selectorForName:](v7, "selectorForName:", v34);

      if (v35)
      {
        -[HMDMessageHandler performSelector:withObject:](v7, "performSelector:withObject:", v35, v22);
        goto LABEL_27;
      }
      v36 = (void *)MEMORY[0x1D17BA0A0]();
      v37 = v7;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v39;
        v44 = 2112;
        v45 = v22;
        _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to route message due to no handler available for message: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v36);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "respondWithError:", v25);

LABEL_27:
    v5 = v22;
    goto LABEL_12;
  }
  v30 = (void *)MEMORY[0x1D17BA0A0]();
  v31 = v7;
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v33;
    _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Skipping routing message since message was already dequeued on another thread", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v30);
  v5 = 0;
LABEL_12:

}

- (void)_logMediaDestinationControllerUpdateMetricsUsingMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  HMDMessageHandler *v15;
  NSObject *v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  void *v20;
  HMDMessageHandler *v21;
  NSObject *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDMessageHandler *v31;
  NSObject *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDMessageHandler home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeTheaterSetupMetricDispatcher");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("HMMediaDestinationControllerUpdateDestinationRequestMessage"))&& v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB9490]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v38 = (void *)v13;
      if (v12)
        v18 = v13 == 0;
      else
        v18 = 1;
      if (v18)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v41 = v19;
          v42 = 2112;
          v43 = v12;
          v44 = 2112;
          v45 = v38;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Destination UUID string %@ or UUID %@ is nil", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v14);
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = v14;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMessageHandler messageTargetUUID](v15, "messageTargetUUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v41 = v25;
          v42 = 2112;
          v43 = v26;
          v44 = 2112;
          v45 = v12;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Received request to update controller %@ with destination identifier %@", buf, 0x20u);

          v14 = v36;
        }

        objc_autoreleasePoolPop(v14);
        if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB9498]))
        {
          -[HMDMessageHandler messageTargetUUID](v15, "messageTargetUUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "markRequestReceivedForGroupIdentifier:metricType:setupSessionIdentifier:setupSessionStartTimeMS:", v27, 4, 0, 0);

        }
        else
        {
          v39 = 0.0;
          objc_msgSend(v5, "homeManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "firstSetupSessionIdentifierOutputStartTime:", &v39);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = (void *)MEMORY[0x1D17BA0A0]();
          v31 = v15;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = v30;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v41 = v33;
            v42 = 2112;
            v43 = v29;
            _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Found associated setup session identifier %@ during home theater grouping", buf, 0x16u);

            v30 = v37;
          }

          objc_autoreleasePoolPop(v30);
          v34 = 1000 * (unint64_t)v39;
          -[HMDMessageHandler messageTargetUUID](v31, "messageTargetUUID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "markRequestReceivedForGroupIdentifier:metricType:setupSessionIdentifier:setupSessionStartTimeMS:", v35, 3, v29, v34);

        }
      }

    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to log media destination controller update metrics due to either no home or metric dispatcher", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (void)relayMessage:(id)a3
{
  -[HMDMessageHandler relayMessage:shouldQueue:](self, "relayMessage:shouldQueue:", a3, 1);
}

- (void)relayMessage:(id)a3 shouldQueue:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  HMDMessageHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDMessageHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMDRemoteDeviceMessageDestination *v20;
  void *v21;
  HMDRemoteDeviceMessageDestination *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDMessageHandler *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDMessageHandler *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMDMessageHandler *v38;
  NSObject *v39;
  void *v40;
  int v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v4 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138543874;
    v42 = v10;
    v43 = 2112;
    v44 = v6;
    v45 = 2112;
    v46 = v11;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Relaying message: %@ should queue: %@", (uint8_t *)&v41, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (objc_msgSend(v6, "isRemote"))
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v8;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543618;
      v42 = v15;
      v43 = 2112;
      v44 = v6;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to relay remote message: %@", (uint8_t *)&v41, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "respondWithError:", v16);
    -[HMDMessageHandler metricsDispatcher](v13, "metricsDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "submitFailureEventOfType:message:", 0, v6);

  }
  else
  {
    if (v4)
      -[HMDMessageHandler queueOutgoingMessage:](v8, "queueOutgoingMessage:", v6);
    -[HMDMessageHandler deviceForMessage:](v8, "deviceForMessage:", v6);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v16 = (void *)v18;
      -[HMDMessageHandler associateDevice:withOutgoingMessage:](v8, "associateDevice:withOutgoingMessage:", v18, v6);
      if (-[HMDMessageHandler isReadyForOutgoingMessaging](v8, "isReadyForOutgoingMessaging"))
      {
        -[HMDMessageHandler dequeueOutgoingMessage:](v8, "dequeueOutgoingMessage:", v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = [HMDRemoteDeviceMessageDestination alloc];
          -[HMDMessageHandler messageTargetUUID](v8, "messageTargetUUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v20, "initWithTarget:device:", v21, v16);

          -[HMDMessageHandler messageDispatcher](v8, "messageDispatcher");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v19, "qualityOfService");
          objc_msgSend(v19, "messagePayload");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", v24, v25, v22, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "responseHandler");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setResponseHandler:", v28);

          objc_msgSend(v23, "sendMessage:", v27);
          v6 = v19;
        }
        else
        {
          v37 = (void *)MEMORY[0x1D17BA0A0]();
          v38 = v8;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = 138543362;
            v42 = v40;
            _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Skipping relaying of message due to message already being dequeued on different thread", (uint8_t *)&v41, 0xCu);

          }
          objc_autoreleasePoolPop(v37);
          v6 = 0;
        }
      }
      else
      {
        v33 = (void *)MEMORY[0x1D17BA0A0]();
        v34 = v8;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 138543618;
          v42 = v36;
          v43 = 2112;
          v44 = v6;
          _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Leaving message in queue until ready for outgoing message: %@", (uint8_t *)&v41, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x1D17BA0A0]();
      v30 = v8;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138543618;
        v42 = v32;
        v43 = 2112;
        v44 = v6;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Leaving message in queue until device is found for message: %@", (uint8_t *)&v41, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      v16 = 0;
    }
  }

}

- (BOOL)isReadyForIncomingMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  HMDMessageHandler *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDMessageHandler dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(v7, "messageHandler:isReadyForIncomingMessage:", self, v6);
    else
      v8 = 1;
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get is ready for message value due to no data source", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)shouldRelayIncomingMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDMessageHandler *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDMessageHandler dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageHandler:shouldRelayIncomingMessage:", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "BOOLValue");
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get relay preference from data source: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)hasQueuedOutgoingMessages
{
  HMDMessageHandler *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = -[NSMutableDictionary count](v2->_messageNameToQueuedOutgoingMessage, "count") != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)hasQueuedOutgoingMessagesForDevice:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *deviceIdentifierToQueuedOutgoingMessageNames;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  deviceIdentifierToQueuedOutgoingMessageNames = self->_deviceIdentifierToQueuedOutgoingMessageNames;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](deviceIdentifierToQueuedOutgoingMessageNames, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = objc_msgSend(v8, "count") != 0;
  else
    v9 = 0;

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)sendQueuedOutgoingMessages
{
  id v3;

  -[HMDMessageHandler queuedOutgoingMessages](self, "queuedOutgoingMessages");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDMessageHandler sendQueuedOutgoingMessages:](self, "sendQueuedOutgoingMessages:", v3);

}

- (void)sendQueuedOutgoingMessagesForDevice:(id)a3
{
  id v4;

  -[HMDMessageHandler queuedOutgoingMessagesForDevice:](self, "queuedOutgoingMessagesForDevice:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDMessageHandler sendQueuedOutgoingMessages:](self, "sendQueuedOutgoingMessages:", v4);

}

- (void)sendQueuedOutgoingMessages:(id)a3
{
  id v4;
  void *v5;
  HMDMessageHandler *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending queued messages: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[HMDMessageHandler relayMessage:shouldQueue:](v6, "relayMessage:shouldQueue:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), 0, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)routeQueuedIncomingMessages
{
  void *v3;
  void *v4;
  HMDMessageHandler *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDMessageHandler dequeueQueuedIncomingMessages](self, "dequeueQueuedIncomingMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Routing queued incoming messages: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[HMDMessageHandler routeMessage:](v5, "routeMessage:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (SEL)selectorForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSString *v19;
  SEL v20;
  const char *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  HMDMessageHandler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDMessageHandler *v31;
  NSObject *v32;
  void *v33;
  const char *v34;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  NSString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 4)
  {
    objc_msgSend(v4, "substringToIndex:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringToIndex:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uppercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) != 0)
    {
      objc_msgSend(v4, "substringToIndex:", 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("HMD"));

      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = v4;
        v12 = 3;
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  if ((unint64_t)objc_msgSend(v4, "length") < 3)
    goto LABEL_18;
  objc_msgSend(v4, "substringToIndex:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringToIndex:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uppercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", v15) & 1) == 0)
  {

    goto LABEL_18;
  }
  objc_msgSend(v4, "substringToIndex:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("HM"));

  if (!v17)
  {
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = v4;
  v12 = 2;
LABEL_10:
  objc_msgSend(v11, "substringFromIndex:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("handle%@:"), v18);
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();

  v20 = NSSelectorFromString(v19);
  if (!v20)
  {
LABEL_19:
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
LABEL_22:

      objc_autoreleasePoolPop(v30);
      v21 = 0;
      goto LABEL_23;
    }
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v33;
    v38 = 2112;
    v39 = v4;
    v40 = 2112;
    v41 = v19;
    v34 = "%{public}@Failed to parse name: %@ selector: %@";
LABEL_21:
    _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, v34, buf, 0x20u);

    goto LABEL_22;
  }
  v21 = v20;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v33;
    v38 = 2112;
    v39 = v4;
    v40 = 2112;
    v41 = v19;
    v34 = "%{public}@Failed to get handler for name: %@ selector: %@";
    goto LABEL_21;
  }
  -[HMDMessageHandler methodSignatureForSelector:](self, "methodSignatureForSelector:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3940];
  v24 = objc_retainAutorelease(v22);
  objc_msgSend(v23, "stringWithUTF8String:", objc_msgSend(v24, "methodReturnType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "isEqualToString:", CFSTR("v")) & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v29;
      v38 = 2112;
      v39 = v4;
      v40 = 2112;
      v41 = v19;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to route message due to unsafe return type on handler for name: %@ selector: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v26);
    v21 = 0;
  }

LABEL_23:
  return v21;
}

- (id)deviceForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMessageHandler *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDMessageHandler dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "messageHandler:deviceForOutgoingMessage:", self, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remote device message destination due to no data source", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)currentAccountDevice
{
  void *v2;
  void *v3;

  -[HMDMessageHandler appleAccountManager](self, "appleAccountManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isReadyForOutgoingMessaging
{
  void *v3;
  void *v4;
  void *v5;
  HMDMessageHandler *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDMessageHandler appleAccountManager](self, "appleAccountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Not ready for outgoing messaging due to no device for account manager: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

  return v4 != 0;
}

- (void)handleAccountAddedDeviceNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  HMDMessageHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDMessageHandler *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HMDDeviceNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    -[HMDMessageHandler currentAccountDevice](self, "currentAccountDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "hmf_isEqualToUUID:", v13) & 1) != 0)
      {
        v14 = -[HMDMessageHandler hasQueuedOutgoingMessages](self, "hasQueuedOutgoingMessages");

        if (v14)
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          v16 = self;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 138543362;
            v24 = v18;
            _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending queued outgoing messages due to new account device added", (uint8_t *)&v23, 0xCu);

          }
          objc_autoreleasePoolPop(v15);
          -[HMDMessageHandler sendQueuedOutgoingMessages](v16, "sendQueuedOutgoingMessages");
        }
      }
      else
      {

      }
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v22;
      v25 = 2112;
      v26 = v4;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get new device from notification: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void)triggerQueuedOutgoingMessagesTimeouts
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_messageNameToQueuedOutgoingMessage, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "delegate", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didTriggerMessageHandlerQueuedMessage:", v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)triggerQueuedIncomingMessagesTimeouts
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_messageNameToQueuedIncomingMessages, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "delegate", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didTriggerMessageHandlerQueuedMessage:", v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)didTriggerMessageHandlerQueuedMessage:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  HMDMessageHandler *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDMessageHandler hasQueuedIncomingMessage:](self, "hasQueuedIncomingMessage:", v5);

  if (v6)
  {
    -[HMDMessageHandler didTriggerQueuedIncomingMessage:](self, "didTriggerQueuedIncomingMessage:", v4);
  }
  else
  {
    objc_msgSend(v4, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMDMessageHandler hasQueuedOutgoingMessage:](self, "hasQueuedOutgoingMessage:", v7);

    if (v8)
    {
      -[HMDMessageHandler didTriggerQueuedOutgoingMessage:](self, "didTriggerQueuedOutgoingMessage:", v4);
    }
    else
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v12;
        v15 = 2112;
        v16 = v4;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Dropping unknown triggered queued message: %@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }
  }

}

- (void)didTriggerQueuedIncomingMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMessageHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMessageHandler dequeueIncomingMessage:](self, "dequeueIncomingMessage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to send queued incoming message: %@ error: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v6, "respondWithError:", v7);
    -[HMDMessageHandler metricsDispatcher](v9, "metricsDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "submitFailureEventOfType:message:", 1, v6);

  }
}

- (void)didTriggerQueuedOutgoingMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMessageHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMessageHandler dequeueOutgoingMessage:](self, "dequeueOutgoingMessage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to send queued outgoing message: %@ error: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v6, "respondWithError:", v7);
    -[HMDMessageHandler metricsDispatcher](v9, "metricsDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "submitFailureEventOfType:message:", 2, v6);

  }
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDMessageHandler messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("messageTargetUUID"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMessageHandler messageTargetUUID](self, "messageTargetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (NSArray)ownerPrivateRemoteMessages
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)adminPrivateRemoteMessages
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)internalMessages
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)notifications
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSDictionary)notificationsToObject
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 88, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 96, 1);
}

- (HMDMessageHandlerMetricsDispatcher)metricsDispatcher
{
  return (HMDMessageHandlerMetricsDispatcher *)objc_getProperty(self, a2, 104, 1);
}

- (HMDAppleAccountManager)appleAccountManager
{
  return (HMDAppleAccountManager *)objc_getProperty(self, a2, 112, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (HMDMessageHandlerDataSource)dataSource
{
  return (HMDMessageHandlerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_notificationsToObject, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_internalMessages, 0);
  objc_storeStrong((id *)&self->_adminPrivateRemoteMessages, 0);
  objc_storeStrong((id *)&self->_ownerPrivateRemoteMessages, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierToQueuedOutgoingMessageNames, 0);
  objc_storeStrong((id *)&self->_messageNameToQueuedOutgoingMessage, 0);
  objc_storeStrong((id *)&self->_messageNameToQueuedIncomingMessages, 0);
}

id __53__HMDMessageHandler_queuedOutgoingMessagesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __43__HMDMessageHandler_queuedOutgoingMessages__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "message");
}

uint64_t __46__HMDMessageHandler_hasQueuedOutgoingMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __44__HMDMessageHandler_dequeueOutgoingMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

uint64_t __46__HMDMessageHandler_hasQueuedIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

id __50__HMDMessageHandler_dequeueQueuedIncomingMessages__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "setDelegate:", 0);
  objc_msgSend(v2, "suspendTimer");
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __44__HMDMessageHandler_dequeueIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

uint64_t __43__HMDMessageHandler_queuedIncomingMessages__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "message");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t59_169941 != -1)
    dispatch_once(&logCategory__hmf_once_t59_169941, &__block_literal_global_53_169942);
  return (id)logCategory__hmf_once_v60_169943;
}

void __32__HMDMessageHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v60_169943;
  logCategory__hmf_once_v60_169943 = v0;

}

@end
