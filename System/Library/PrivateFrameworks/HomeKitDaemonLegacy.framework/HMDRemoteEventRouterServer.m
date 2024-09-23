@implementation HMDRemoteEventRouterServer

- (HMDRemoteEventRouterServer)initWithPrimaryModeUUID:(id)a3 residentModeUUID:(id)a4 queue:(id)a5 messageDispatcher:(id)a6 dataSource:(id)a7 notificationCenter:(id)a8 requestMessageName:(id)a9 updateMessageName:(id)a10 multiHopFetchResponseMessageName:(id)a11 subscriptionProvider:(id)a12 registrationEventRouter:(id)a13 storeReadHandle:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  HMDRemoteEventRouterServer *v28;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v34 = a5;
  v31 = a12;
  v18 = a13;
  v19 = a14;
  v42 = a11;
  v41 = a10;
  v39 = a9;
  v40 = a8;
  v38 = a7;
  v20 = a6;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v22, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("RemoteEventRouter.Server."), "stringByAppendingString:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_retainAutorelease(v24);
  v26 = objc_msgSend(v25, "UTF8String");
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __256__HMDRemoteEventRouterServer_initWithPrimaryModeUUID_residentModeUUID_queue_messageDispatcher_dataSource_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_subscriptionProvider_registrationEventRouter_storeReadHandle___block_invoke;
  v44[3] = &unk_1E89AE168;
  v45 = v34;
  v46 = v31;
  v47 = v18;
  v48 = v19;
  v49 = v25;
  v37 = v25;
  v35 = v19;
  v33 = v18;
  v32 = v31;
  v27 = v34;
  v28 = -[HMDRemoteEventRouterServer initWithPrimaryModeUUID:residentModeUUID:queue:messageDispatcher:dataSource:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:logCategory:logEventSubmitter:connectionServerFactory:](self, "initWithPrimaryModeUUID:residentModeUUID:queue:messageDispatcher:dataSource:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:logCategory:logEventSubmitter:connectionServerFactory:", v22, v21, v27, v20, v38, v40, v39, v41, v42, v26, v30, v44);

  return v28;
}

- (HMDRemoteEventRouterServer)initWithPrimaryModeUUID:(id)a3 residentModeUUID:(id)a4 queue:(id)a5 messageDispatcher:(id)a6 dataSource:(id)a7 notificationCenter:(id)a8 requestMessageName:(id)a9 updateMessageName:(id)a10 multiHopFetchResponseMessageName:(id)a11 logCategory:(const char *)a12 logEventSubmitter:(id)a13 connectionServerFactory:(id)a14
{
  id v19;
  void *v20;
  void (**v21)(_QWORD);
  HMDRemoteEventRouterServer *v22;
  HMDRemoteEventRouterServer *v23;
  uint64_t v24;
  OS_os_log *logger;
  os_log_t v26;
  OS_os_log *v27;
  HMDEventRouterTimerProvider *v28;
  HMDEventRouterTimerProvider *timerProvider;
  uint64_t v30;
  HMEMessageDatagramServer *connectionServer;
  uint64_t v32;
  NSMutableArray *currentConnections;
  uint64_t v34;
  NSMutableDictionary *accessControls;
  uint64_t v36;
  NSMapTable *pendingFetchRequests;
  id v40;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;

  v49 = a3;
  v40 = a4;
  v48 = a4;
  v47 = a5;
  v46 = a6;
  v19 = a7;
  v45 = a8;
  v44 = a9;
  v43 = a10;
  v42 = a11;
  v20 = v19;
  v50 = a13;
  v21 = (void (**)(_QWORD))a14;
  v51.receiver = self;
  v51.super_class = (Class)HMDRemoteEventRouterServer;
  v22 = -[HMDRemoteEventRouterServer init](&v51, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_lock._os_unfair_lock_opaque = 0;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    logger = v23->_logger;
    v23->_logger = (OS_os_log *)v24;

    v26 = os_log_create("com.apple.HomeKitDaemon", a12);
    v27 = v23->_logger;
    v23->_logger = (OS_os_log *)v26;

    v28 = objc_alloc_init(HMDEventRouterTimerProvider);
    timerProvider = v23->_timerProvider;
    v23->_timerProvider = v28;

    objc_storeStrong((id *)&v23->_homeUUID, a3);
    objc_storeStrong((id *)&v23->_accessoryUUID, v40);
    objc_storeStrong((id *)&v23->_messageDispatcher, a6);
    objc_storeStrong((id *)&v23->_workQueue, a5);
    objc_storeWeak((id *)&v23->_dataSource, v20);
    objc_storeStrong((id *)&v23->_notificationCenter, a8);
    objc_storeStrong((id *)&v23->_routerRequestMessageName, a9);
    objc_storeStrong((id *)&v23->_routerUpdateMessageName, a10);
    objc_storeStrong((id *)&v23->_routerMultiHopFetchResponseMessageName, a11);
    v21[2](v21);
    v30 = objc_claimAutoreleasedReturnValue();
    connectionServer = v23->_connectionServer;
    v23->_connectionServer = (HMEMessageDatagramServer *)v30;

    -[HMEMessageDatagramServer setDelegate:](v23->_connectionServer, "setDelegate:", v23);
    -[HMEMessageDatagramServer setDataSource:](v23->_connectionServer, "setDataSource:", v23);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = objc_claimAutoreleasedReturnValue();
    currentConnections = v23->_currentConnections;
    v23->_currentConnections = (NSMutableArray *)v32;

    *(_WORD *)&v23->_isPrimaryResident = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v34 = objc_claimAutoreleasedReturnValue();
    accessControls = v23->_accessControls;
    v23->_accessControls = (NSMutableDictionary *)v34;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v36 = objc_claimAutoreleasedReturnValue();
    pendingFetchRequests = v23->_pendingFetchRequests;
    v23->_pendingFetchRequests = (NSMapTable *)v36;

    objc_storeWeak((id *)&v23->_logEventSubmitter, v50);
  }

  return v23;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  const char *v5;
  void *v6;
  id v7;
  SEL v8;
  id Property;
  void *v10;
  id v11;
  os_unfair_lock_s *p_lock;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v7 = objc_getProperty(self, v5, 40, 1);
    Property = objc_getProperty(self, v8, 48, 1);
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = Property;
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    self = (HMDRemoteEventRouterServer *)self->_isPrimaryResident;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v7 = 0;
    v11 = 0;
  }
  objc_msgSend(v10, "numberWithBool:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ home: %@, accessory: %@, mode: %@>"), v6, v7, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (id)logIdentifier
{
  if (self)
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, 48, 1);
  return (id)-[HMDRemoteEventRouterServer UUIDString](self, "UUIDString");
}

- (void)_registerForMessages:(id)a3 withHome:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  id Property;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *logger;
  const char *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  SEL v23;
  id v24;
  void *v25;
  SEL v26;
  SEL v27;
  _DWORD v28[2];
  __int16 v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    Property = objc_getProperty(self, v12, 80, 1);
  else
    Property = 0;
  v14 = Property;
  objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_89);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v21 = logger;
    objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v17, "userPrivilege"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = 67109378;
    v28[1] = v17 != 0;
    v29 = 2112;
    v30 = v22;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "Registering for messages with user privilege: (exists: %d) %@", (uint8_t *)v28, 0x12u);

  }
  objc_msgSend(v14, "registerForMessage:receiver:policies:selector:", objc_getProperty(self, v19, 56, 1), self, v11, sel__handlePrimaryRequestMessage_);

  v24 = objc_getProperty(self, v23, 88, 1);
  objc_msgSend(WeakRetained, "primaryResidentChangeMonitorForRouterServer:", self);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentIsCurrentDeviceChangeNotification_, CFSTR("HMDPrimaryResidentChangeMonitorIsCurrentDeviceChangeNotification"), v25);

  objc_msgSend(objc_getProperty(self, v26, 88, 1), "addObserver:selector:name:object:", self, sel_handleHomeUserRemovedNotification_, CFSTR("HMDHomeUserRemovedNotification"), v7);
  objc_msgSend(objc_getProperty(self, v27, 88, 1), "addObserver:selector:name:object:", self, sel__handleUserPrivilegeChange_, CFSTR("HMDUserPrivilegeDidChangeNotification"), 0);

}

- (void)_registerForAccessoryMessages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *logger;
  NSObject *v9;
  SEL v10;
  id Property;
  void *v12;
  id v13;
  void *v14;
  HMDRemoteEventRouterServerMessageReceiver *v15;
  SEL v16;
  id v17;
  id v18;
  SEL v19;
  id v20;
  id v21;
  id v22;
  HMDRemoteEventRouterServer *v23;
  id *v24;
  id *v25;
  SEL v26;
  SEL v27;
  id *v28;
  SEL v29;
  id v30;
  id v31;
  id WeakRetained;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  id v37;
  _BYTE v38[18];
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_99);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = logger;
    Property = objc_getProperty(self, v10, 48, 1);
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = Property;
    objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v7, "userPrivilege"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v38 = 138412802;
    *(_QWORD *)&v38[4] = Property;
    *(_WORD *)&v38[12] = 1024;
    *(_DWORD *)&v38[14] = v7 != 0;
    v39 = 2112;
    v40 = v14;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "Registering for accessory messages %@, user privilege: (exists: %d) %@", v38, 0x1Cu);

  }
  v15 = [HMDRemoteEventRouterServerMessageReceiver alloc];
  v17 = objc_getProperty(self, v16, 48, 1);
  v18 = v17;
  v20 = objc_getProperty(self, v19, 32, 1);
  v21 = v18;
  v22 = v20;
  v23 = self;
  if (v15)
  {
    *(_QWORD *)v38 = v15;
    *(_QWORD *)&v38[8] = HMDRemoteEventRouterServerMessageReceiver;
    v24 = (id *)objc_msgSendSuper2((objc_super *)v38, sel_init);
    v25 = v24;
    if (v24)
    {
      objc_storeStrong(v24 + 1, v17);
      objc_storeStrong(v25 + 2, v20);
      objc_storeWeak(v25 + 3, v23);
    }
  }
  else
  {
    v25 = 0;
  }

  objc_setProperty_atomic(v23, v26, v25, 136);
  v28 = (id *)objc_getProperty(v23, v27, 136, 1);
  v30 = objc_getProperty(v23, v29, 80, 1);
  if (v28)
  {
    v31 = v4;
    WeakRetained = objc_loadWeakRetained(v28 + 3);
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v38 = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (WeakRetained)
      v37 = objc_getProperty(WeakRetained, v36, 56, 1);
    else
      v37 = 0;
    objc_msgSend(v30, "registerForMessage:receiver:policies:selector:", v37, v28, v35, sel_handleRequestMessage_);

  }
}

- (void)handlePrimaryResidentIsCurrentDeviceChangeNotification:(id)a3
{
  HMDRemoteEventRouterServer *v3;
  _QWORD block[5];

  v3 = self;
  if (self)
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, 32, 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__HMDRemoteEventRouterServer_handlePrimaryResidentIsCurrentDeviceChangeNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = v3;
  dispatch_async(&self->super, block);
}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDRemoteEventRouterServer *v10;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__HMDRemoteEventRouterServer_handleHomeUserRemovedNotification___block_invoke;
  v8[3] = &unk_1E89C2328;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (NSUUID)messageTargetUUID
{
  if (self)
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, 40, 1);
  return (NSUUID *)self;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, 32, 1);
  return (OS_dispatch_queue *)self;
}

- (id)messageTargetForMode:(int64_t)a3
{
  ptrdiff_t v3;

  if (a3 == 1)
  {
    if (self)
    {
      v3 = 48;
      goto LABEL_6;
    }
  }
  else if (self)
  {
    v3 = 40;
LABEL_6:
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, v3, 1);
  }
  return self;
}

- (void)respondToMessage:(id)a3 underlyingResponseData:(id)a4 connection:(id)a5 label:(id)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL8 v13;
  id v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  if (a5)
    v13 = *((_BYTE *)a5 + 8) != 0;
  else
    v13 = 0;
  v14 = v12;
  -[HMDRemoteEventRouterServer respondToMessage:underlyingResponseData:supportsFragmentMessage:label:](self, "respondToMessage:underlyingResponseData:supportsFragmentMessage:label:", v12, v11, v13, v10);

}

- (void)respondToMessage:(id)a3 underlyingResponseData:(id)a4 supportsFragmentMessage:(BOOL)a5 label:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *logger;
  void *v15;
  NSObject *v16;
  void *v17;
  HMDRemoteEventRouterProtoFragmentedMessage *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v7 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v7)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = logger;
      objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v12;
      v32 = 2112;
      v33 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "Responding to %@ with message size: %@, fragment: 0", buf, 0x16u);

    }
    v18 = objc_alloc_init(HMDRemoteEventRouterProtoFragmentedMessage);
    -[HMDRemoteEventRouterProtoFragmentedMessage setFragmentData:](v18, "setFragmentData:", v11);
    -[HMDRemoteEventRouterProtoFragmentedMessage setFragmentNumber:](v18, "setFragmentNumber:", 0);
    -[HMDRemoteEventRouterProtoFragmentedMessage setTotalFragments:](v18, "setTotalFragments:", 1);
    -[HMDRemoteEventRouterProtoFragmentedMessage setTotalSize:](v18, "setTotalSize:", objc_msgSend(v11, "length"));
    -[HMDRemoteEventRouterProtoFragmentedMessage setRouterVersion:](v18, "setRouterVersion:", 0);
    v28[0] = CFSTR("message.payload");
    -[HMDRemoteEventRouterProtoFragmentedMessage data](v18, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = CFSTR("isFragmented");
    v29[0] = v19;
    v29[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithPayload:", v20);

    objc_autoreleasePoolPop(v13);
  }
  else
  {
    v21 = self->_logger;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      v23 = v21;
      objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v12;
      v32 = 2112;
      v33 = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEFAULT, "Responding to %@ with message size: %@", buf, 0x16u);

    }
    v26 = CFSTR("message.payload");
    v27 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithPayload:", v25);

  }
}

- (BOOL)isErrorHMENotAcceptingConnections:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D32D10]))
    v5 = objc_msgSend(v3, "code") == 4;
  else
    v5 = 0;

  return v5;
}

- (void)_handleUserPrivilegeChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  NSObject *Property;
  void *v11;
  HMDRemoteEventRouterServer *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kUserUUIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    if (self)
      Property = objc_getProperty(self, v9, 32, 1);
    else
      Property = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__HMDRemoteEventRouterServer__handleUserPrivilegeChange___block_invoke;
    v15[3] = &unk_1E89C2328;
    v15[4] = self;
    v16 = v8;
    dispatch_async(Property, v15);

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
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@user UUID missed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)_handlePrimaryRequestMessage:(id)a3
{
  -[HMDRemoteEventRouterServer _handleRequestMessage:connectionMode:](self, "_handleRequestMessage:connectionMode:", a3, 0);
}

- (void)_handleRequestMessage:(id)a3 connectionMode:(int64_t)a4
{
  id v6;
  NSObject *logger;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  HMDRemoteEventRouterProtoMessage *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    v8 = logger;
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "Handle request message: %@ connection mode: %@", buf, 0x16u);

  }
  v11 = objc_msgSend(v6, "BOOLForKey:", CFSTR("isFragmented"));
  objc_msgSend(v6, "dataForKey:", CFSTR("message.payload"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v16 = self->_logger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "Did not find message payload.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v13 = (void *)v12;
  if (!v11)
  {
    v15 = (id)v12;
    goto LABEL_11;
  }
  v22 = 0;
  -[HMDRemoteEventRouterServer _underlyingMessageDataFromFragmentMessageData:error:](self, "_underlyingMessageDataFromFragmentMessageData:error:", v12, &v22);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v22;

  if (!v14)
  {
    if (!v15)
    {
      v20 = self->_logger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEFAULT, "No payload from fragment message", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = self->_logger;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v15;
      _os_log_error_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "Could not decode payload from fragment message %@", buf, 0xCu);
    }
LABEL_23:
    objc_msgSend(v6, "respondWithError:", v15);
    goto LABEL_24;
  }

  v15 = (id)v14;
LABEL_11:
  v17 = -[HMDRemoteEventRouterProtoMessage initWithData:]([HMDRemoteEventRouterProtoMessage alloc], "initWithData:", v15);
  if (-[HMDRemoteEventRouterProtoMessage hasRequest](v17, "hasRequest"))
  {
    -[HMDRemoteEventRouterServer _handleProtoRequest:originalMessage:connectionMode:](self, "_handleProtoRequest:originalMessage:connectionMode:", v17, v6, a4);
  }
  else
  {
    v18 = self->_logger;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "Decoded payload does not have request.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "respondWithError:", v19);

  }
LABEL_24:

}

- (void)_handleProtoRequest:(id)a3 originalMessage:(id)a4 connectionMode:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *logger;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  switch(objc_msgSend(v8, "request"))
  {
    case 0u:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CD062000, logger, OS_LOG_TYPE_ERROR, "Unable to find request type.", buf, 2u);
      }
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = 3;
      goto LABEL_8;
    case 1u:
      objc_msgSend(v8, "connect");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteEventRouterServer _handleConnectRequest:originalMessage:connectionMode:](self, "_handleConnectRequest:originalMessage:connectionMode:", v15, v9, a5);
      goto LABEL_15;
    case 2u:
      objc_msgSend(v8, "changeRegistrations");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteEventRouterServer _handleChangeRegistrationsRequest:originalMessage:](self, "_handleChangeRegistrationsRequest:originalMessage:", v16, v9);
      goto LABEL_13;
    case 3u:
      objc_msgSend(v8, "keepAlive");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteEventRouterServer _handleKeepAliveRequest:originalMessage:](self, "_handleKeepAliveRequest:originalMessage:", v16, v9);
      goto LABEL_13;
    case 4u:
      objc_msgSend(v8, "disconnect");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteEventRouterServer _handleDisconnectRequest:originalMessage:](self, "_handleDisconnectRequest:originalMessage:", v16, v9);
LABEL_13:

      break;
    case 5u:
      objc_msgSend(v8, "fetchEvents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteEventRouterServer _handleFetchEventsRequest:originalMessage:connectionMode:](self, "_handleFetchEventsRequest:originalMessage:connectionMode:", v15, v9, a5);
LABEL_15:

      break;
    default:
      v13 = self->_logger;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "Received an unrecognized request type.", v17, 2u);
      }
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = -1;
LABEL_8:
      objc_msgSend(v11, "hmErrorWithCode:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "respondWithError:", v14);

      break;
  }

}

- (id)_underlyingMessageDataFromFragmentMessageData:(id)a3 error:(id *)a4
{
  id v6;
  HMDRemoteEventRouterProtoFragmentedMessage *v7;
  HMDRemoteEventRouterProtoFragmentedMessage *v8;
  void *v9;
  void *v10;
  NSObject *logger;
  uint8_t v13[16];

  v6 = a3;
  v7 = -[HMDRemoteEventRouterProtoFragmentedMessage initWithData:]([HMDRemoteEventRouterProtoFragmentedMessage alloc], "initWithData:", v6);
  v8 = v7;
  if (v7)
  {
    if (-[HMDRemoteEventRouterProtoFragmentedMessage fragmentNumber](v7, "fragmentNumber")
      || -[HMDRemoteEventRouterProtoFragmentedMessage totalFragments](v8, "totalFragments") != 1)
    {
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_1CD062000, logger, OS_LOG_TYPE_ERROR, "Cannot decode fragmented data yet.", v13, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      -[HMDRemoteEventRouterProtoFragmentedMessage fragmentData](v8, "fragmentData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v9);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_handleConnectRequest:(id)a3 originalMessage:(id)a4 connectionMode:(int64_t)a5
{
  id v8;
  const char *v9;
  id v10;
  NSObject *Property;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMDRemoteEventRouterServerConnection *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  NSObject *logger;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  HMDRemoteEventRouterServerConnection *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  HMDRemoteEventRouterServerConnection *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  HMDRemoteEventRouterServerConnection *v56;
  int64_t v57;
  _QWORD v58[4];
  id v59;
  uint8_t buf[4];
  HMDRemoteEventRouterServerConnection *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v10 = a4;
  if (self)
  {
    Property = objc_getProperty(self, v9, 32, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (v8)
    {
LABEL_3:
      objc_msgSend(v10, "remoteSourceDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (!v13 || !v14)
      {
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CD062000, logger, OS_LOG_TYPE_ERROR, "Could not find device of incoming request.", buf, 2u);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "respondWithError:", v16);
        goto LABEL_38;
      }
      objc_msgSend(WeakRetained, "routerServerUserAccessControlProviderIdentifierForMessage:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v24 = self->_logger;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "Could not find user for incoming request.", buf, 2u);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "respondWithError:", v25);
        goto LABEL_37;
      }
      -[HMDRemoteEventRouterServer currentConnections](self, "currentConnections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke;
      v58[3] = &unk_1E89AE210;
      v50 = v15;
      v49 = v15;
      v59 = v49;
      objc_msgSend(v17, "na_firstObjectPassingTest:", v58);
      v18 = (HMDRemoteEventRouterServerConnection *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        if (v18->_connectionMode == a5)
        {
LABEL_26:
          if (objc_msgSend(v8, "hasConnectEvent"))
          {
            v31 = (void *)MEMORY[0x1E0D32D30];
            objc_msgSend(v8, "connectEvent");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "fromProtobuff:", v32);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v48 = 0;
          }
          v51 = WeakRetained;
          if (objc_msgSend(v8, "hasUnregisterEvent"))
          {
            v33 = (void *)MEMORY[0x1E0D32D30];
            objc_msgSend(v8, "unregisterEvent");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "fromProtobuff:", v34);
            v46 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v46 = 0;
          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "array", v46);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "topicFilterAdditions");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "count");

          if (v37)
          {
            objc_msgSend(v8, "topicFilterAdditions");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "na_map:", &__block_literal_global_116_69324);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObjectsFromArray:", v40);

          }
          if (self)
            v41 = objc_getProperty(self, v38, 104, 1);
          else
            v41 = 0;
          v42 = v41;
          v43 = (void *)objc_msgSend(v35, "copy");
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke_2;
          v52[3] = &unk_1E89AE300;
          v57 = a5;
          v52[4] = self;
          v53 = v10;
          v54 = v13;
          v55 = v49;
          v56 = v18;
          v44 = v18;
          objc_msgSend(v42, "connectWithConnection:connectEvent:unregisterEvent:topicFilterAdditions:completion:", v44, v48, v47, v43, v52);

          v25 = v59;
          v15 = v50;
          WeakRetained = v51;
LABEL_37:

LABEL_38:
          goto LABEL_43;
        }
        v19 = self->_logger;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v18;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "Connection mode is different remove existing %@", buf, 0xCu);
        }
        -[HMDRemoteEventRouterServer currentConnections](self, "currentConnections");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeObject:", v18);

      }
      v18 = -[HMDRemoteEventRouterServerConnection initWithDevice:connectionMode:supportsFragmentMessage:userAccessControlProviderUUID:]([HMDRemoteEventRouterServerConnection alloc], "initWithDevice:connectionMode:supportsFragmentMessage:userAccessControlProviderUUID:", v13, a5, objc_msgSend(v10, "BOOLForKey:", CFSTR("isFragmented")), v16);
      if (a5 == 1)
      {
        v21 = self->_logger;
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
        *(_DWORD *)buf = 138412290;
        v61 = v18;
        v22 = "Created resident connection %@";
      }
      else
      {
        if (a5 || (v21 = self->_logger, !os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)))
        {
LABEL_24:
          -[HMDRemoteEventRouterServer currentConnections](self, "currentConnections");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v18);

          v27 = self->_logger;
          if (os_signpost_enabled(v27))
          {
            v28 = (void *)MEMORY[0x1E0CB37E8];
            v29 = v27;
            objc_msgSend(v28, "numberWithInteger:", a5);
            v30 = (HMDRemoteEventRouterServerConnection *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v61 = v30;
            _os_signpost_emit_with_name_impl(&dword_1CD062000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventRouterServerConnectionCreated", "connectionMode=%{signpost.description:attribute}@ ", buf, 0xCu);

          }
          goto LABEL_26;
        }
        *(_DWORD *)buf = 138412290;
        v61 = v18;
        v22 = "Created primary client connection %@";
      }
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
      goto LABEL_24;
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
    WeakRetained = 0;
    if (v8)
      goto LABEL_3;
  }
  v45 = self->_logger;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "Did not find connect request in payload.", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "respondWithError:", v13);
LABEL_43:

}

- (void)refreshConnections:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  void *v7;
  HMDRemoteEventRouterServer *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HMDRemoteEventRouterServer *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v10;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Refresh connections for user:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDRemoteEventRouterServer currentConnections](v8, "currentConnections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__HMDRemoteEventRouterServer_refreshConnections___block_invoke;
  v13[3] = &unk_1E89AE328;
  v14 = v5;
  v15 = v8;
  v12 = v5;
  objc_msgSend(v11, "na_each:", v13);

}

- (void)_handleDisconnectRequest:(id)a3 originalMessage:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *Property;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *logger;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[16];

  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 32, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  if (v6)
  {
    objc_msgSend(v8, "remoteSourceDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v10 && v11)
    {
      -[HMDRemoteEventRouterServer currentConnections](self, "currentConnections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __71__HMDRemoteEventRouterServer__handleDisconnectRequest_originalMessage___block_invoke;
      v22[3] = &unk_1E89AE210;
      v23 = v12;
      objc_msgSend(v13, "na_firstObjectPassingTest:", v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (self)
          v16 = objc_getProperty(self, v15, 104, 1);
        else
          v16 = 0;
        objc_msgSend(v16, "disconnectConnection:", v14);
        objc_msgSend(v8, "respondWithSuccess");
      }
      else
      {
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CD062000, logger, OS_LOG_TYPE_ERROR, "No connection was found to disconnect.", buf, 2u);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "respondWithError:", v21);

      }
      v19 = v23;
    }
    else
    {
      v18 = self->_logger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "Could not find device of incoming request.", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "respondWithError:", v19);
    }

  }
  else
  {
    v17 = self->_logger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "Did not find disconnect request in payload.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "respondWithError:", v10);
  }

}

- (void)_handleChangeRegistrationsRequest:(id)a3 originalMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  id Property;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *logger;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  HMDRemoteEventRouterServer *v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "remoteSourceDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      -[HMDRemoteEventRouterServer currentConnections](self, "currentConnections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke;
      v36[3] = &unk_1E89AE210;
      v13 = v11;
      v37 = v13;
      objc_msgSend(v12, "na_firstObjectPassingTest:", v36);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v29 = v11;
        if (self)
          Property = objc_getProperty(self, v15, 104, 1);
        else
          Property = 0;
        v17 = Property;
        objc_msgSend(v6, "topicFilterAdditions");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "na_map:", &__block_literal_global_127_69305);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "topicFilterRemovals");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "na_map:", &__block_literal_global_128);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke_3;
        v30[3] = &unk_1E89AE3D0;
        v31 = v14;
        v32 = self;
        v33 = v8;
        v34 = v9;
        v35 = v13;
        objc_msgSend(v17, "changeRegistrationsForConnection:topicFilterAdditions:topicFilterRemovals:completion:", v31, v18, v20, v30);

        v21 = v31;
        v11 = v29;
      }
      else
      {
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
        {
          v26 = logger;
          -[HMDRemoteEventRouterServer currentConnections](self, "currentConnections");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v39 = v27;
          v40 = 2112;
          v41 = v13;
          _os_log_error_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "No connection was found during change registrations request in current connections: %@ device identifier: %@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "respondWithError:", v21);
      }

      v24 = v37;
    }
    else
    {
      v23 = self->_logger;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "Could not find device of incoming request.", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "respondWithError:", v24);
    }

  }
  else
  {
    v22 = self->_logger;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "Did not change registrations request in payload.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "respondWithError:", v9);
  }

}

- (void)_handleKeepAliveRequest:(id)a3 originalMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *logger;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "remoteSourceDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      -[HMDRemoteEventRouterServer currentConnections](self, "currentConnections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __70__HMDRemoteEventRouterServer__handleKeepAliveRequest_originalMessage___block_invoke;
      v26[3] = &unk_1E89AE210;
      v14 = v11;
      v27 = v14;
      objc_msgSend(v12, "na_firstObjectPassingTest:", v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (self)
          self = (HMDRemoteEventRouterServer *)objc_getProperty(self, v16, 104, 1);
        v24[0] = v13;
        v24[1] = 3221225472;
        v24[2] = __70__HMDRemoteEventRouterServer__handleKeepAliveRequest_originalMessage___block_invoke_134;
        v24[3] = &unk_1E89C2350;
        v25 = v8;
        -[HMDRemoteEventRouterServer keepAliveConnection:completion:](self, "keepAliveConnection:completion:", v15, v24);
        v17 = v25;
      }
      else
      {
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
        {
          v22 = logger;
          -[HMDRemoteEventRouterServer currentConnections](self, "currentConnections");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v29 = v23;
          v30 = 2112;
          v31 = v14;
          _os_log_error_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "No connection was found for keep alive request in current connections: %@ device identifier: %@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "respondWithError:", v17);
      }

      v20 = v27;
    }
    else
    {
      v19 = self->_logger;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "Could not find device of incoming request.", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "respondWithError:", v20);
    }

  }
  else
  {
    v18 = self->_logger;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "Did not keep-alive request in payload.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "respondWithError:", v9);
  }

}

- (void)_handleFetchEventsRequest:(id)a3 originalMessage:(id)a4 connectionMode:(int64_t)a5
{
  id v8;
  const char *v9;
  id v10;
  NSObject *Property;
  void *v12;
  uint64_t v13;
  void *v14;
  void *WeakRetained;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  SEL v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  HMDRemoteEventRouterProtoFetchEventsResponse *v30;
  void *v31;
  void *v32;
  const char *v33;
  HMDRemoteEventRouterServerConnection *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *logger;
  void *v44;
  char v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  HMDRemoteEventRouterServerConnection *v51;
  id v52;
  _QWORD v53[5];
  uint8_t buf[16];

  v8 = a3;
  v10 = a4;
  if (self)
    Property = objc_getProperty(self, v9, 32, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  if (v8)
  {
    objc_msgSend(v10, "remoteSourceDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12 && v13)
    {
      if (self && self->_isResidentEventProviding)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        objc_msgSend(WeakRetained, "routerServerUserAccessControlProviderIdentifierForMessage:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16
          && (objc_msgSend(WeakRetained, "routerServerUserAccessControlProviderForIdentifier:", v16),
              (v17 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v18 = (void *)v17;
          v51 = -[HMDRemoteEventRouterServerConnection initWithDevice:connectionMode:supportsFragmentMessage:userAccessControlProviderUUID:]([HMDRemoteEventRouterServerConnection alloc], "initWithDevice:connectionMode:supportsFragmentMessage:userAccessControlProviderUUID:", v12, a5, objc_msgSend(v10, "BOOLForKey:", CFSTR("isFragmented")), v16);
          objc_msgSend(v8, "topics");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          if (v20)
          {
            v50 = v18;
            objc_msgSend(v8, "topics");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v53[0] = MEMORY[0x1E0C809B0];
            v53[1] = 3221225472;
            v53[2] = __87__HMDRemoteEventRouterServer__handleFetchEventsRequest_originalMessage_connectionMode___block_invoke;
            v53[3] = &unk_1E89AE3F8;
            v53[4] = self;
            objc_msgSend(v21, "na_map:", v53);
            v22 = objc_claimAutoreleasedReturnValue();

            v23 = objc_alloc_init(MEMORY[0x1E0D32D78]);
            objc_msgSend(v23, "setDelegate:", self);
            v25 = objc_getProperty(self, v24, 104, 1);
            v52 = 0;
            v49 = (void *)v22;
            LOBYTE(v22) = objc_msgSend(v25, "fetchCachedEventsForTopics:isMultiHop:connection:cachedEventCollection:error:", v22, objc_msgSend(v8, "fetchType") == 1, v51, v23, &v52);

            v26 = v52;
            v27 = (uint64_t)v26;
            if ((v22 & 1) != 0)
            {
              v47 = v26;
              v45 = objc_msgSend(v23, "isFinishedAddingItems");
              v48 = v23;
              objc_msgSend(v23, "popEventItemsUpWithFragments:toSizeInBytes:usedBytes:", 0, 0, 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "na_map:", &__block_literal_global_139_69291);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDRemoteEventRouterServer logMetricsForLiveEvents:cachedEvents:destinationDevice:destinationDeviceIdentifier:responseMessageType:](self, "logMetricsForLiveEvents:cachedEvents:destinationDevice:destinationDeviceIdentifier:responseMessageType:", MEMORY[0x1E0C9AA60], v28, v12, v14, 1);
              v30 = objc_alloc_init(HMDRemoteEventRouterProtoFetchEventsResponse);
              v46 = v29;
              v31 = (void *)objc_msgSend(v29, "mutableCopy");
              -[HMDRemoteEventRouterProtoFetchEventsResponse setChangedEvents:](v30, "setChangedEvents:", v31);

              -[HMDRemoteEventRouterProtoFetchEventsResponse data](v30, "data");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDRemoteEventRouterServer respondToMessage:underlyingResponseData:supportsFragmentMessage:label:](self, "respondToMessage:underlyingResponseData:supportsFragmentMessage:label:", v10, v32, 0, CFSTR("FetchEvents"));

              v34 = v51;
              if ((v45 & 1) == 0)
                objc_msgSend(objc_getProperty(self, v33, 128, 1), "setObject:forKey:", v51, v48);

              v23 = v48;
              v35 = v49;
              v36 = v47;
            }
            else
            {
              if (!v26)
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
                v27 = objc_claimAutoreleasedReturnValue();
              }
              v36 = (void *)v27;
              objc_msgSend(v10, "respondWithError:", v27);
              v34 = v51;
              v35 = v49;
            }

            v18 = v50;
          }
          else
          {
            v34 = v51;
            logger = self->_logger;
            if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CD062000, logger, OS_LOG_TYPE_ERROR, "Got a fetch request with no topics.", buf, 2u);
            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "respondWithError:", v44);

          }
        }
        else
        {
          v41 = self->_logger;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "Could not find user for incoming request.", buf, 2u);
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "respondWithError:", v18);
        }

        goto LABEL_37;
      }
      v42 = self->_logger;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "Could not process fetch as non-resident event providing device.", buf, 2u);
      }
      v39 = (void *)MEMORY[0x1E0CB35C8];
      v40 = 48;
    }
    else
    {
      v38 = self->_logger;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "Could not find device of incoming request.", buf, 2u);
      }
      v39 = (void *)MEMORY[0x1E0CB35C8];
      v40 = 2;
    }
    objc_msgSend(v39, "hmErrorWithCode:", v40);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", WeakRetained);
LABEL_37:

    goto LABEL_38;
  }
  v37 = self->_logger;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "Did not find fetch request in payload.", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "respondWithError:", v12);
LABEL_38:

}

- (void)submitLogEvent:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (self)
    self = (HMDRemoteEventRouterServer *)objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  -[HMDRemoteEventRouterServer submitLogEvent:error:](self, "submitLogEvent:error:", v7, v6);

}

- (void)submitLogEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (self)
    self = (HMDRemoteEventRouterServer *)objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  -[HMDRemoteEventRouterServer submitLogEvent:](self, "submitLogEvent:", v4);

}

- (void)sendMessageWithPayloadMessage:(id)a3 destination:(id)a4 messageType:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  unsigned int v14;
  ptrdiff_t v15;
  id Property;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  id v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a4;
  v14 = -[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self);
  if (a5 == 2)
  {
    if (self)
    {
      v15 = 72;
      goto LABEL_7;
    }
LABEL_17:
    Property = 0;
    goto LABEL_8;
  }
  if (a5 == 1)
  {
    if (self)
    {
      v15 = 64;
LABEL_7:
      Property = objc_getProperty(self, v13, v15, 1);
LABEL_8:
      v17 = Property;
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  v17 = 0;
LABEL_10:
  if (v14)
    v18 = -1;
  else
    v18 = 8;
  v26 = CFSTR("message.payload");
  v19 = (void *)objc_msgSend(v10, "copy");
  v27[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:restriction:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:restriction:", v17, -1, v12, v20, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterServer responseHandlerForSendMessageIdentifier:completion:](self, "responseHandlerForSendMessageIdentifier:completion:", v22, v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setResponseHandler:", v23);
  if (self)
    v25 = objc_getProperty(self, v24, 80, 1);
  else
    v25 = 0;
  objc_msgSend(v25, "sendMessage:", v21);

}

- (id)responseHandlerForSendMessageIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__HMDRemoteEventRouterServer_responseHandlerForSendMessageIdentifier_completion___block_invoke;
  v12[3] = &unk_1E89BCDD0;
  objc_copyWeak(&v15, &location);
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = _Block_copy(v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v10;
}

- (id)server:(id)a3 upstreamTopicsForTopic:(id)a4
{
  id v5;
  const char *v6;
  void *v7;
  id v8;
  SEL v9;
  id Property;

  v5 = a4;
  if (-[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self))
  {
    +[HMDHomeEventsGenerated upstreamTopicsForTopic:](HMDHomeEventsGenerated, "upstreamTopicsForTopic:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self)
    {
      v8 = objc_getProperty(self, v6, 40, 1);
      Property = objc_getProperty(self, v9, 48, 1);
    }
    else
    {
      v8 = 0;
      Property = 0;
    }
    +[HMDHomeEventsGenerated upstreamHomeAndAccessoryTopicsForTopic:homeUUID:accessoryUUID:](HMDHomeEventsGenerated, "upstreamHomeAndAccessoryTopicsForTopic:homeUUID:accessoryUUID:", v5, v8, Property);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)server:(id)a3 expandedTopicsForTopics:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  if (self)
    self = (HMDRemoteEventRouterServer *)objc_loadWeakRetained((id *)&self->_dataSource);
  -[HMDRemoteEventRouterServer expandedTopicsWithTopics:](self, "expandedTopicsWithTopics:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v6;

  return v8;
}

- (id)server:(id)a3 forwardingTopicsForTopics:(id)a4
{
  const char *v5;
  id v6;
  id Property;
  void *v8;

  v6 = a4;
  if (self)
    Property = objc_getProperty(self, v5, 40, 1);
  else
    Property = 0;
  +[HMDHomeEventsGenerated forwardingTopicsWithTopics:forHomeRouterWithUUID:](HMDHomeEventsGenerated, "forwardingTopicsWithTopics:forHomeRouterWithUUID:", v6, Property);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)server:(id)a3 isConnectionTerminatingError:(id)a4
{
  return 1;
}

- (BOOL)server:(id)a3 shouldProcessEventsForConnection:(id)a4 shouldLogState:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  const char *v9;
  NSObject *v10;
  NSObject *Property;
  objc_class *WeakRetained;
  NSObject *logger;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  Class isa;
  unsigned __int8 v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  objc_class *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  objc_class *v31;
  NSObject *v32;
  int v34;
  NSObject *v35;
  __int16 v36;
  objc_class *v37;
  __int16 v38;
  NSObject *v39;
  __int16 v40;
  NSObject *v41;
  uint64_t v42;

  v5 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v10 = a4;
  if (self)
  {
    Property = objc_getProperty(self, v9, 32, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = (objc_class *)objc_loadWeakRetained((id *)&self->_dataSource);
    if (!v5)
      goto LABEL_5;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    WeakRetained = 0;
    if (!v5)
      goto LABEL_5;
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 138412546;
    v35 = v10;
    v36 = 2112;
    v37 = WeakRetained;
    _os_log_impl(&dword_1CD062000, logger, OS_LOG_TYPE_DEFAULT, "Checking if server should process events for connection: %@, dataSource: %@", (uint8_t *)&v34, 0x16u);
  }
LABEL_5:
  v14 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (!v16)
    goto LABEL_14;
  isa = v16[5].isa;
  if (isa == (Class)1)
  {
    v20 = v16[3].isa;
    if (v20)
    {
      v22 = v16[2].isa;
      v23 = -[objc_class isDeviceIdentifierPrimaryResident:](WeakRetained, "isDeviceIdentifierPrimaryResident:", v22);

      if (!-[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self) || !v23)
      {
        if (self)
        {
          if (self->_isResidentEventProviding)
            v18 = v23;
          else
            v18 = 0;
          if (!v5)
            goto LABEL_33;
        }
        else
        {
          v18 = 0;
          if (!v5)
            goto LABEL_33;
        }
        v29 = self->_logger;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v21 = v29;
          HMFBooleanToString();
          v30 = objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v31 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v32 = v16[2].isa;
          v34 = 138544130;
          v35 = v30;
          v36 = 2114;
          v37 = v31;
          v38 = 2112;
          v39 = v32;
          v40 = 2112;
          v41 = v20;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "Allow connection: %{public}@, for resident connection mode. isReceiverPrimary: %{public}@, incoming device:%@, primary device: %@", (uint8_t *)&v34, 0x2Au);

          goto LABEL_32;
        }
        goto LABEL_33;
      }
      if (v5)
      {
        v24 = self->_logger;
        v18 = 0;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = v24;
          HMFBooleanToString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = v16[2].isa;
          v34 = 138543874;
          v35 = v26;
          v36 = 2112;
          v37 = v27;
          v38 = 2112;
          v39 = v20;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "Not allowing connection while both devices are known as primary, this should resolve shortly. isReceiverPrimary: %{public}@, incoming device:%@, primary device: %@", (uint8_t *)&v34, 0x20u);

LABEL_23:
          goto LABEL_24;
        }
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      v28 = self->_logger;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v25 = v28;
        v26 = v16[2].isa;
        v34 = 138412290;
        v35 = v26;
        _os_log_error_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "Unexpectedly did not find device for resident. %@", (uint8_t *)&v34, 0xCu);
        goto LABEL_23;
      }
    }
LABEL_24:
    v18 = 0;
    goto LABEL_33;
  }
  if (isa)
  {
LABEL_14:
    v18 = 0;
    goto LABEL_34;
  }
  v18 = -[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self);
  if (v5)
  {
    v19 = self->_logger;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      HMFBooleanToString();
      v21 = objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEFAULT, "Allow connection: %{public}@, for primary connection mode.", (uint8_t *)&v34, 0xCu);
LABEL_32:

      goto LABEL_33;
    }
  }
LABEL_34:

  return v18;
}

- (double)server:(id)a3 timeoutIntervalForConnection:(id)a4
{
  return 4500.0;
}

- (double)serverDebounceTimeInterval:(id)a3
{
  unsigned int v3;
  double result;

  v3 = -[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self);
  result = 0.5;
  if (v3)
    return 5.0;
  return result;
}

- (id)serverTimerProvider:(id)a3
{
  if (self)
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, 96, 1);
  return self;
}

- (unint64_t)serverFragmentEventsDataSize:(id)a3
{
  if (_os_feature_enabled_impl())
    return 0x80000;
  else
    return 0;
}

- (BOOL)serverSupportFragmentCachedEvents:(id)a3
{
  return _os_feature_enabled_impl();
}

- (void)server:(id)a3 connectionDidConnect:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *logger;
  const char *v17;
  id Property;
  void *v19;
  id v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  if (self)
  {
    v8 = v7;
    os_unfair_lock_lock_with_options();
    self->_diagnosticLastConnectTime = v8;
    os_unfair_lock_unlock(&self->_lock);
  }

  if (-[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self))
  {
    v9 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
      v12 = (void *)v11[3];
    else
      v12 = 0;
    v13 = v12;

    objc_msgSend(v13, "deviceAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "idsIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl(&dword_1CD062000, logger, OS_LOG_TYPE_DEFAULT, "Notifying on connecting to primary %@", buf, 0xCu);
      }
      Property = objc_getProperty(self, v17, 88, 1);
      v22 = CFSTR("idsIdentifier");
      v23 = v15;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = Property;
      objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "postNotificationName:object:userInfo:", CFSTR("RemoteEventRouterServerDidReceiveConnectionToPrimary"), self, v21, v22, v23);

    }
  }

}

- (void)server:(id)a3 connectionDidExpire:(id)a4
{
  id v5;
  NSObject *logger;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_error_impl(&dword_1CD062000, logger, OS_LOG_TYPE_ERROR, "Removing connection on expiry %@", (uint8_t *)&v8, 0xCu);
  }
  -[HMDRemoteEventRouterServer currentConnections](self, "currentConnections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v5);

}

- (void)server:(id)a3 connectionDidFail:(id)a4
{
  id v5;
  NSObject *logger;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_error_impl(&dword_1CD062000, logger, OS_LOG_TYPE_ERROR, "Removing connection on error %@", (uint8_t *)&v8, 0xCu);
  }
  -[HMDRemoteEventRouterServer currentConnections](self, "currentConnections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v5);

}

- (void)server:(id)a3 sendEvents:(id)a4 cachedEvents:(id)a5 connection:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *);
  HMDRemoteEventRouterProtoServerMessage *v15;
  void *v16;
  void *v17;
  HMDRemoteEventRouterProtoEventsMessage *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id *v27;
  id v28;
  void *v29;
  HMDRemoteDeviceMessageDestination *v30;
  void *v31;
  HMDRemoteDeviceMessageDestination *v32;
  id v33;
  NSObject *logger;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, void *))a7;
  v15 = objc_alloc_init(HMDRemoteEventRouterProtoServerMessage);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProtoServerMessage setIdentifier:](v15, "setIdentifier:", v17);

  v18 = objc_alloc_init(HMDRemoteEventRouterProtoEventsMessage);
  -[HMDRemoteEventRouterProtoServerMessage setUpdatedEvents:](v15, "setUpdatedEvents:", v18);

  objc_msgSend(v11, "na_map:", &__block_literal_global_151_69260);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");
  -[HMDRemoteEventRouterProtoServerMessage updatedEvents](v15, "updatedEvents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setEvents:", v20);

  objc_msgSend(v12, "na_map:", &__block_literal_global_152_69261);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");
  -[HMDRemoteEventRouterProtoServerMessage updatedEvents](v15, "updatedEvents");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCachedEvents:", v23);

  v25 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;

  if (v27)
  {
    v28 = v27[3];
    if (v28)
    {
      v29 = v28;
      v30 = [HMDRemoteDeviceMessageDestination alloc];
      -[HMDRemoteEventRouterServer messageTargetForMode:](self, "messageTargetForMode:", v27[5]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v30, "initWithTarget:device:", v31, v29);

      if (v32)
      {
        v33 = v27[2];
        -[HMDRemoteEventRouterServer logMetricsForLiveEvents:cachedEvents:destinationDevice:destinationDeviceIdentifier:responseMessageType:](self, "logMetricsForLiveEvents:cachedEvents:destinationDevice:destinationDeviceIdentifier:responseMessageType:", v11, v12, v29, v33, 4);

        logger = self->_logger;
        v45 = v11;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
        {
          v35 = (void *)MEMORY[0x1E0CB37E8];
          v36 = logger;
          -[HMDRemoteEventRouterProtoServerMessage data](v15, "data");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v44, "length"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v47 = v37;
          _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_DEFAULT, "Sending events of size: %@", buf, 0xCu);

          v11 = v45;
          logger = self->_logger;
        }
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v47 = v11;
          _os_log_debug_impl(&dword_1CD062000, logger, OS_LOG_TYPE_DEBUG, "Sending events: %@", buf, 0xCu);
        }
        -[HMDRemoteEventRouterProtoServerMessage data](v15, "data");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDRemoteEventRouterServer sendMessageWithPayloadMessage:destination:messageType:completion:](self, "sendMessageWithPayloadMessage:destination:messageType:completion:", v38, v32, 1, v14);

        v11 = v45;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v14[2](v14, v42);

        v43 = self->_logger;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CD062000, v43, OS_LOG_TYPE_ERROR, "Could not create destination", buf, 2u);
        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, v40);

      v41 = self->_logger;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v25;
        _os_log_error_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "Device no longer available %@", buf, 0xCu);
      }
      v29 = 0;
    }
  }
  else
  {
    v39 = self->_logger;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v25;
      _os_log_error_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "Could not find remote connection for connection %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v29);
  }

}

- (void)server:(id)a3 logMetricsForMessageDatagramFragmentation:(BOOL)a4 isFragmented:(BOOL)a5
{
  HMDEventRouterMessageFragmentationLogEvent *v6;

  if (a5)
  {
    v6 = -[HMDEventRouterMessageFragmentationLogEvent initWithIsCachedEventQueue:isFragmented:]([HMDEventRouterMessageFragmentationLogEvent alloc], "initWithIsCachedEventQueue:isFragmented:", a4, 1);
    if (self)
      self = (HMDRemoteEventRouterServer *)objc_loadWeakRetained((id *)&self->_logEventSubmitter);
    -[HMDRemoteEventRouterServer submitLogEvent:](self, "submitLogEvent:", v6);

  }
}

- (void)logMetricsForLiveEvents:(id)a3 cachedEvents:(id)a4 destinationDevice:(id)a5 destinationDeviceIdentifier:(id)a6 responseMessageType:(unint64_t)a7
{
  id v9;
  void *v10;
  id v11;

  v11 = a6;
  v9 = a5;
  -[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self);
  if (self)
  {
    self = (HMDRemoteEventRouterServer *)objc_loadWeakRetained((id *)&self->_dataSource);
    -[HMDRemoteEventRouterServer isDeviceIdentifierPrimaryResident:](self, "isDeviceIdentifierPrimaryResident:", v11);
    objc_msgSend(v9, "productInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "productPlatform");

  }
  else
  {
    objc_msgSend(0, "isDeviceIdentifierPrimaryResident:", v11);
  }

}

- (BOOL)shouldAllowEvent:(id)a3 topic:(id)a4 connection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id *v10;
  id WeakRetained;
  NSObject *logger;
  _BOOL4 isPrimaryResident;
  int v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  char v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  id *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v10;
    v36 = 2112;
    v37 = v7;
    _os_log_debug_impl(&dword_1CD062000, logger, OS_LOG_TYPE_DEBUG, "Checking access control connection: %@, topic: %@", buf, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  isPrimaryResident = self->_isPrimaryResident;
  v14 = self->_isPrimaryResident;
  os_unfair_lock_unlock(&self->_lock);
  if (v10)
  {
    v15 = v10[3];
    v16 = v15;
    if (v15)
    {
      v33 = v7;
      objc_msgSend(v15, "productInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "productPlatform");

      v19 = 1;
      if (v18 != 4)
        v19 = 2;
      v31 = v19;
      v20 = v10[2];
      v21 = objc_msgSend(WeakRetained, "isDeviceIdentifierPrimaryResident:", v20);

      v22 = v10[4];
      objc_msgSend(WeakRetained, "routerServerUserAccessControlProviderForIdentifier:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v7 = v33;
        if (!isPrimaryResident && ((v21 ^ 1) & 1) == 0)
          v14 = objc_msgSend(WeakRetained, "canTopicBeForwardedToPrimaryFromResident:", v33);
        objc_msgSend(v16, "identifier", v31);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(WeakRetained, "shouldAllowTopic:forDeviceWithMessageIdentifier:", v33, v24);

        v26 = 0;
        if (v14 && v25)
        {
          objc_msgSend(WeakRetained, "remoteEventAccessControlProvider");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v27, "remoteEventAllowedForTopic:deviceType:userType:", v33, v32, objc_msgSend(v23, "allowedRemoteEventAccessUserTypes"));

        }
        goto LABEL_26;
      }
      v29 = self->_logger;
      v7 = v33;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v10;
        _os_log_error_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "Could not find user ACL provider for %@", buf, 0xCu);
      }
    }
    else
    {
      v28 = self->_logger;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v35 = (id *)v7;
        v36 = 2112;
        v37 = v8;
        _os_log_debug_impl(&dword_1CD062000, v28, OS_LOG_TYPE_DEBUG, "No device when attempting to check access control for %@ to %@", buf, 0x16u);
      }
    }
    v26 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v26 = 0;
LABEL_27:

  return v26;
}

- (NSUUID)residentModeUUID
{
  if (self)
    self = (HMDRemoteEventRouterServer *)objc_getProperty(self, a2, 48, 1);
  return (NSUUID *)self;
}

- (void)configureWithHome:(id)a3 isPrimaryResident:(BOOL)a4 isResidentEventProviding:(BOOL)a5 additionalPolicies:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *logger;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v7 = a5;
  v8 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = logger;
    objc_msgSend(v13, "numberWithBool:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "Configuring on device isPrimaryResident. %@ isResidentEventProviding: %@", (uint8_t *)&v17, 0x16u);

  }
  os_unfair_lock_lock_with_options();
  self->_isPrimaryResident = v8;
  os_unfair_lock_unlock(&self->_lock);
  self->_isResidentEventProviding = v7;
  -[HMDRemoteEventRouterServer _registerForMessages:withHome:](self, "_registerForMessages:withHome:", v11, v10);
  -[HMDRemoteEventRouterServer _registerForAccessoryMessages:](self, "_registerForAccessoryMessages:", v11);

}

- (id)dumpStateDescription
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  id Property;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self);
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HMFBooleanToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v5, 104, 1);
  else
    Property = 0;
  objc_msgSend(Property, "dumpStateDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[HMDRemoteEventRouterServer primary: %@, resident event providing: %@, \n\t server: %@]"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)diagnosticInfo
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CBA7A8]);
  objc_msgSend(v3, "setVersion:", 1);
  objc_msgSend(v3, "setConnectionState:", 0);
  objc_msgSend(v3, "setMode:", 0);
  if (fabs(-[HMDRemoteEventRouterServer diagnosticLastConnectTime]((uint64_t)self)) >= 2.22044605e-16)
    objc_msgSend(v3, "setLastConnected:", -[HMDRemoteEventRouterServer diagnosticLastConnectTime]((uint64_t)self));
  -[HMDRemoteEventRouterServer currentConnections](self, "currentConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "setConnectionState:", 1);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "setConnectedClients:", v6);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[HMDRemoteEventRouterServer currentConnections](self, "currentConnections", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
          v13 = objc_alloc_init(MEMORY[0x1E0CBA7A0]);
          if (v12)
            v14 = *(void **)(v12 + 16);
          else
            v14 = 0;
          v15 = v14;
          objc_msgSend(v15, "UUIDString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setConnectedClientIdentifierString:", v16);

          objc_msgSend(v3, "connectedClients");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v9 = v18;
      }
      while (v18);
    }

  }
  else
  {
    objc_msgSend(v3, "setConnectionState:", 2);
  }
  if (-[HMDRemoteEventRouterServer isPrimaryResident]((os_unfair_lock_s *)self))
    v19 = 1;
  else
    v19 = 2;
  objc_msgSend(v3, "setMode:", v19);
  return v3;
}

- (void)pendingEventCollectionDidComplete:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__HMDRemoteEventRouterServer_pendingEventCollectionDidComplete___block_invoke;
  v8[3] = &unk_1E89C2328;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (NSMutableArray)currentConnections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConnections, 0);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_storeStrong((id *)&self->_accessoryMessageReceiver, 0);
  objc_storeStrong((id *)&self->_pendingFetchRequests, 0);
  objc_storeStrong((id *)&self->_accessControls, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_connectionServer, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_routerMultiHopFetchResponseMessageName, 0);
  objc_storeStrong((id *)&self->_routerUpdateMessageName, 0);
  objc_storeStrong((id *)&self->_routerRequestMessageName, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __64__HMDRemoteEventRouterServer_pendingEventCollectionDidComplete___block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  const char *v4;
  uint64_t v5;
  id v6;
  id v7;
  HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDRemoteEventRouterProtoServerMessage *v18;
  void *v19;
  void *v20;
  HMDRemoteDeviceMessageDestination *v21;
  void *v22;
  HMDRemoteDeviceMessageDestination *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 128, 1);
  objc_msgSend(Property, "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v40 = v29;
      v41 = 2112;
      v42 = v30;
      v31 = "%{public}@Fetch collection completed with no connection found for collection %@";
LABEL_15:
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, v31, buf, 0x16u);

    }
LABEL_16:

    objc_autoreleasePoolPop(v26);
    goto LABEL_21;
  }
  v6 = *(id *)(a1 + 32);
  if (v6)
    v6 = objc_getProperty(v6, v4, 128, 1);
  objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if ((objc_msgSend(*(id *)(a1 + 40), "hasEventItem") & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v40 = v29;
      v41 = 2112;
      v42 = v32;
      v31 = "%{public}@Fetch collection completed with no items. %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v7 = *(id *)(v5 + 24);
  if (v7)
  {
    v8 = objc_alloc_init(HMDRemoteEventRouterProtoMultiHopFetchEventsResponse);
    objc_msgSend(*(id *)(a1 + 40), "popEventItemsUpWithFragments:toSizeInBytes:usedBytes:", 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_map:", &__block_literal_global_161);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    -[HMDRemoteEventRouterProtoMultiHopFetchEventsResponse setChangedEvents:](v8, "setChangedEvents:", v11);

    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = v10;
      v15 = v9;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteEventRouterProtoMultiHopFetchEventsResponse changedEvents](v8, "changedEvents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v16;
      v41 = 2048;
      v42 = objc_msgSend(v17, "count");
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Fetch collection completed with %ld items.", buf, 0x16u);

      v9 = v15;
      v10 = v37;
    }

    objc_autoreleasePoolPop(v12);
    v18 = objc_alloc_init(HMDRemoteEventRouterProtoServerMessage);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteEventRouterProtoServerMessage setIdentifier:](v18, "setIdentifier:", v20);

    -[HMDRemoteEventRouterProtoServerMessage setMultiHopFetchEventsResponse:](v18, "setMultiHopFetchEventsResponse:", v8);
    v21 = [HMDRemoteDeviceMessageDestination alloc];
    objc_msgSend(*(id *)(a1 + 32), "messageTargetForMode:", *(_QWORD *)(v5 + 40));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v21, "initWithTarget:device:", v22, v7);

    v24 = *(void **)(a1 + 32);
    -[HMDRemoteEventRouterProtoServerMessage data](v18, "data");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __64__HMDRemoteEventRouterServer_pendingEventCollectionDidComplete___block_invoke_162;
    v38[3] = &unk_1E89C2350;
    v38[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v24, "sendMessageWithPayloadMessage:destination:messageType:completion:", v25, v23, 2, v38);

  }
  else
  {
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v36;
      v41 = 2112;
      v42 = v5;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Device no longer available %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
  }

LABEL_21:
}

void __64__HMDRemoteEventRouterServer_pendingEventCollectionDidComplete___block_invoke_162(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("error : ");
    if (!v3)
      v9 = CFSTR("success");
    v11 = 138543874;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    if (v3)
      v10 = v3;
    else
      v10 = &stru_1E89C3E38;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetch collection response completed with %@%@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

uint64_t __64__HMDRemoteEventRouterServer_pendingEventCollectionDidComplete___block_invoke_160(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbEventInfo");
}

- (double)diagnosticLastConnectTime
{
  os_unfair_lock_s *v2;
  double v3;

  if (!a1)
    return 0.0;
  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock_with_options();
  v3 = *(double *)(a1 + 24);
  os_unfair_lock_unlock(v2);
  return v3;
}

- (os_unfair_lock_s)isPrimaryResident
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock_with_options();
    v1 = (os_unfair_lock_s *)(LOBYTE(v1[5]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

uint64_t __83__HMDRemoteEventRouterServer_server_sendEvents_cachedEvents_connection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbEventInfo");
}

uint64_t __83__HMDRemoteEventRouterServer_server_sendEvents_cachedEvents_connection_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbEventInfo");
}

void __81__HMDRemoteEventRouterServer_responseHandlerForSendMessageIdentifier_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  const char *v5;
  void *v6;
  NSObject *Property;
  _QWORD v8[4];
  id v9;
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    Property = objc_getProperty(WeakRetained, v5, 32, 1);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__HMDRemoteEventRouterServer_responseHandlerForSendMessageIdentifier_completion___block_invoke_2;
    v8[3] = &unk_1E89C0448;
    v9 = v3;
    v10 = v6;
    v11 = a1[4];
    v12 = a1[5];
    dispatch_async(Property, v8);

  }
}

uint64_t __81__HMDRemoteEventRouterServer_responseHandlerForSendMessageIdentifier_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = *(NSObject **)(a1[5] + 8);
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = a1[6];
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v2;
      _os_log_error_impl(&dword_1CD062000, v3, OS_LOG_TYPE_ERROR, "Failed to send message: %@ error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[6];
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v3, OS_LOG_TYPE_DEFAULT, "Successfully sent message: %@", (uint8_t *)&v7, 0xCu);
  }
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[4]);
  return result;
}

id __87__HMDRemoteEventRouterServer__handleFetchEventsRequest_originalMessage_connectionMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  v3 = a2;
  if ((objc_msgSend(v3, "hasTopic") & 1) == 0)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1CD062000, v4, OS_LOG_TYPE_ERROR, "No topic found!", v9, 2u);
    }
  }
  v5 = (void *)MEMORY[0x1E0D28630];
  objc_msgSend(v3, "topic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_cachedInstanceForString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __87__HMDRemoteEventRouterServer__handleFetchEventsRequest_originalMessage_connectionMode___block_invoke_138(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbEventInfo");
}

uint64_t __70__HMDRemoteEventRouterServer__handleKeepAliveRequest_originalMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  if (a2)
    v3 = *(void **)(a2 + 16);
  else
    v3 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __70__HMDRemoteEventRouterServer__handleKeepAliveRequest_originalMessage___block_invoke_134(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithError:", a2);
  else
    return objc_msgSend(v2, "respondWithSuccess");
}

uint64_t __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  if (a2)
    v3 = *(void **)(a2 + 16);
  else
    v3 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  HMDRemoteEventRouterProtoChangeRegistrationsResponse *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = a3;
  v15 = v5;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 32);
    if (!v7 || !*(_QWORD *)(v7 + 40))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isErrorHMENotAcceptingConnections:", v6))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 3202);
        v8 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v8;
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v6);
  }
  else
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_129);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_130_69306);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "logMetricsForLiveEvents:cachedEvents:destinationDevice:destinationDeviceIdentifier:responseMessageType:", MEMORY[0x1E0C9AA60], v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 3);
    v10 = objc_alloc_init(HMDRemoteEventRouterProtoChangeRegistrationsResponse);
    v11 = (void *)objc_msgSend(v9, "mutableCopy");
    -[HMDRemoteEventRouterProtoChangeRegistrationsResponse setCachedEvents:](v10, "setCachedEvents:", v11);

    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    -[HMDRemoteEventRouterProtoChangeRegistrationsResponse data](v10, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "respondToMessage:underlyingResponseData:connection:label:", v13, v14, *(_QWORD *)(a1 + 32), CFSTR("ChangeRegistration"));

  }
}

uint64_t __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbEventInfo");
}

id __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D32D30];
  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_msgSend([v4 alloc], "initWithEvent:topic:", v5, v6);

  return v7;
}

uint64_t __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", a2);
}

uint64_t __80__HMDRemoteEventRouterServer__handleChangeRegistrationsRequest_originalMessage___block_invoke_126(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", a2);
}

uint64_t __71__HMDRemoteEventRouterServer__handleDisconnectRequest_originalMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  if (a2)
    v3 = *(void **)(a2 + 16);
  else
    v3 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __49__HMDRemoteEventRouterServer_refreshConnections___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  id Property;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
    v4 = (void *)*((_QWORD *)v3 + 4);
  else
    v4 = 0;
  v5 = v4;
  if (HMFEqualObjects())
  {
    Property = *(id *)(a1 + 40);
    if (Property)
      Property = objc_getProperty(Property, v6, 104, 1);
    objc_msgSend(Property, "refreshConnection:", v8);
  }

}

uint64_t __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  if (a2)
    v3 = *(void **)(a2 + 16);
  else
    v3 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  HMDRemoteEventRouterProtoConnectResponse *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    if (!*(_QWORD *)(a1 + 72) && objc_msgSend(*(id *)(a1 + 32), "isErrorHMENotAcceptingConnections:", v7))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 3202);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v8;
    }
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v7);
  }
  else
  {
    objc_msgSend(v16, "na_map:", &__block_literal_global_119_69326);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_map:", &__block_literal_global_121_69327);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "logMetricsForLiveEvents:cachedEvents:destinationDevice:destinationDeviceIdentifier:responseMessageType:", MEMORY[0x1E0C9AA60], v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 2);
    v10 = objc_alloc_init(HMDRemoteEventRouterProtoConnectResponse);
    v11 = (void *)objc_msgSend(v9, "mutableCopy");
    -[HMDRemoteEventRouterProtoConnectResponse setCachedEvents:](v10, "setCachedEvents:", v11);

    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    -[HMDRemoteEventRouterProtoConnectResponse data](v10, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "respondToMessage:underlyingResponseData:connection:label:", v14, v15, *(_QWORD *)(a1 + 64), CFSTR("ConnectResponse"));

    objc_autoreleasePoolPop(v12);
  }

}

uint64_t __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbEventInfo");
}

id __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D32D30];
  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_msgSend([v4 alloc], "initWithEvent:topic:", v5, v6);

  return v7;
}

uint64_t __83__HMDRemoteEventRouterServer__handleConnectRequest_originalMessage_connectionMode___block_invoke_114(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", a2);
}

uint64_t __57__HMDRemoteEventRouterServer__handleUserPrivilegeChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshConnections:", *(_QWORD *)(a1 + 40));
}

void __64__HMDRemoteEventRouterServer_handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HMDUserNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
    _HMFPreconditionFailure();
  objc_msgSend(*(id *)(a1 + 40), "currentConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__HMDRemoteEventRouterServer_handleHomeUserRemovedNotification___block_invoke_2;
  v16[3] = &unk_1E89AE210;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v6, "na_filter:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v13;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing connections: %@ due to removed user: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __64__HMDRemoteEventRouterServer_handleHomeUserRemovedNotification___block_invoke_105;
  v15[3] = &unk_1E89AE238;
  v15[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v9, "na_each:", v15);

}

uint64_t __64__HMDRemoteEventRouterServer_handleHomeUserRemovedNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  if (a2)
    v3 = *(void **)(a2 + 32);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

void __64__HMDRemoteEventRouterServer_handleHomeUserRemovedNotification___block_invoke_105(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "currentConnections");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v3);

}

os_unfair_lock_s *__85__HMDRemoteEventRouterServer_handlePrimaryResidentIsCurrentDeviceChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  os_unfair_lock_s *result;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  id Property;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 112));
  else
    WeakRetained = 0;
  v4 = objc_msgSend(WeakRetained, "isCurrentDevicePrimaryResident");

  result = -[HMDRemoteEventRouterServer isPrimaryResident](*(os_unfair_lock_s **)(a1 + 32));
  if ((_DWORD)v4 != (_DWORD)result)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 8);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v7;
    objc_msgSend(v8, "numberWithBool:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "Primary resident status changed to %@", (uint8_t *)&v15, 0xCu);

    v6 = *(_QWORD *)(a1 + 32);
    if (!v6)
    {
      v11 = 0;
    }
    else
    {
LABEL_6:
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v6 + 20) = v4;
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 16));
      v11 = *(void **)(a1 + 32);
    }
    objc_msgSend(v11, "currentConnections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v13, 104, 1);
    return (os_unfair_lock_s *)objc_msgSend(Property, "reset");
  }
  return result;
}

uint64_t __60__HMDRemoteEventRouterServer__registerForAccessoryMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

uint64_t __60__HMDRemoteEventRouterServer__registerForMessages_withHome___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

id __256__HMDRemoteEventRouterServer_initWithPrimaryModeUUID_residentModeUUID_queue_messageDispatcher_dataSource_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_subscriptionProvider_registrationEventRouter_storeReadHandle___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D32D58]), "initWithQueue:provider:registrationEventRouter:storeReadHandle:logCategory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 64)), "UTF8String"));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_69376 != -1)
    dispatch_once(&logCategory__hmf_once_t4_69376, &__block_literal_global_69377);
  return (id)logCategory__hmf_once_v5_69378;
}

void __41__HMDRemoteEventRouterServer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_69378;
  logCategory__hmf_once_v5_69378 = v0;

}

@end
