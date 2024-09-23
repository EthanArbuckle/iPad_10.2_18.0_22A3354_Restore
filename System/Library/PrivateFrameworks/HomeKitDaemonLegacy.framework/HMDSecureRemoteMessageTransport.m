@implementation HMDSecureRemoteMessageTransport

- (HMDSecureRemoteMessageTransport)initWithDataSource:(id)a3
{
  id v5;
  HMDSecureRemoteMessageTransport *v6;
  HMDSecureRemoteMessageTransport *v7;
  uint64_t v8;
  HMDAccountRegistry *accountRegistry;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  NSMutableSet *secureRemoteSessions;
  uint64_t v17;
  HMFFuture *startFuture;
  HMDRemoteMessageNotifications *v19;
  HMDRemoteMessageNotifications *sessionNotifications;
  uint64_t v21;
  NSArray *transports;
  uint64_t v23;
  HMDRemoteDeviceMonitor *deviceMonitor;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id obj;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)HMDSecureRemoteMessageTransport;
  v6 = -[HMDSecureRemoteMessageTransport init](&v42, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    objc_msgSend(v5, "accountRegistry");
    v8 = objc_claimAutoreleasedReturnValue();
    accountRegistry = v7->_accountRegistry;
    v7->_accountRegistry = (HMDAccountRegistry *)v8;

    HMDispatchQueueNameString();
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    secureRemoteSessions = v7->_secureRemoteSessions;
    v7->_secureRemoteSessions = (NSMutableSet *)v15;

    obj = 0;
    objc_msgSend(MEMORY[0x1E0D28588], "futureWithPromise:", &obj);
    v17 = objc_claimAutoreleasedReturnValue();
    startFuture = v7->_startFuture;
    v7->_startFuture = (HMFFuture *)v17;

    objc_storeStrong((id *)&v7->_startPromise, obj);
    v7->_responseHandlerLock._os_unfair_lock_opaque = 0;
    v19 = objc_alloc_init(HMDRemoteMessageNotifications);
    sessionNotifications = v7->_sessionNotifications;
    v7->_sessionNotifications = v19;

    objc_msgSend(v5, "transports");
    v21 = objc_claimAutoreleasedReturnValue();
    transports = v7->_transports;
    v7->_transports = (NSArray *)v21;

    objc_msgSend(v5, "deviceMonitor");
    v23 = objc_claimAutoreleasedReturnValue();
    deviceMonitor = v7->_deviceMonitor;
    v7->_deviceMonitor = (HMDRemoteDeviceMonitor *)v23;

    objc_msgSend(v5, "reachabilityObserver");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteDeviceMonitor setTransportReachabilityObserver:](v7->_deviceMonitor, "setTransportReachabilityObserver:", v25);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[HMDSecureRemoteMessageTransport transports](v7, "transports", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v31, "setDelegate:", v7);
          v32 = v31;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v33 = v32;
          else
            v33 = 0;
          v34 = v33;

          if (v34)
          {
            objc_msgSend(v5, "reachabilityObserver");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setReachabilityDelegate:", v35);

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v28);
    }

  }
  return v7;
}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (id)descriptionWithPointer:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@>"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@>"), v6, &stru_1E89C3E38);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDSecureRemoteMessageTransport descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMDSecureRemoteMessageTransport descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (void)configureWithCloudDataSyncStateFilter:(id)a3 homeMembershipVerifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMDSecureRemoteMessageTransport setCloudDataSyncStateFilter:](self, "setCloudDataSyncStateFilter:", a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDSecureRemoteMessageTransport transports](self, "transports", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "configureWithHomeMembershipVerifier:", v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HMDSecureRemoteMessageTransport_start__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_sync(queue, block);
  return -[HMDSecureRemoteMessageTransport startFuture](self, "startFuture");
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HMDSecureRemoteMessageTransport_reset__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_reset
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  HMDSecureRemoteMessageTransport *v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_secureRemoteSessions;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1D17BA0A0]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v18 = v12;
          v19 = 2112;
          v20 = v8;
          _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing secure session: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v9);
        objc_msgSend(v8, "close");
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_secureRemoteSessions, "removeAllObjects");
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  id v22;
  NSObject *queue;
  void *v24;
  HMDSecureRemoteMessageTransport *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDSecureRemoteMessageTransport *v29;
  NSObject *v30;
  void *v31;
  HMDAssertionLogEvent *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD block[4];
  id v37;
  HMDSecureRemoteMessageTransport *v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination");
  v41 = 0;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "device");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = +[HMDSecureRemoteMessageTransport isDeviceValidDestination:error:](HMDSecureRemoteMessageTransport, "isDeviceValidDestination:error:", v13, &v41);
LABEL_16:

      goto LABEL_17;
    }
    v15 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v13 = v16;

    if (v13)
    {
      objc_msgSend(v13, "handle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v14 = 1;
        goto LABEL_16;
      }
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = CFSTR("Missing parameter.");
      v20 = CFSTR("Missing account from destination.");
      v21 = 20;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = CFSTR("Invalid class.");
      v20 = CFSTR("Invalid destination class type.");
      v21 = 22;
    }
    objc_msgSend(v18, "hmErrorWithCode:description:reason:suggestion:", v21, v19, v20, 0);
    v14 = 0;
    v41 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v14 = 0;
LABEL_17:

  v22 = v41;
  if (v14)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HMDSecureRemoteMessageTransport_sendMessage_completionHandler___block_invoke;
    block[3] = &unk_1E89C0448;
    v37 = v6;
    v38 = self;
    v39 = v8;
    v40 = v7;
    dispatch_async(queue, block);

  }
  else
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v27;
      v44 = 2112;
      v45 = v6;
      v46 = 2112;
      v47 = v22;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Invalid remote message destination for message %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v24);
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = v25;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v31;
      v44 = 2112;
      v45 = v22;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Invalid remote message destination: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    v32 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Invalid remote message destination: %@"), v22);
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "submitLogEvent:", v32);

    v34 = _Block_copy(v7);
    v35 = v34;
    if (v34)
      (*((void (**)(void *, id))v34 + 2))(v34, v22);

    objc_msgSend(v6, "respondWithError:", v22);
  }

}

- (id)_preferredTransportForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[HMDSecureRemoteMessageTransport transports](self, "transports");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDSecureRemoteMessageTransport transports](self, "transports", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "canSendMessage:", v4))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_120512);
  objc_msgSend(v7, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)_handleReceivedMessage:(id)a3 transport:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;

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
    v11 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    objc_msgSend(v11, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("kPingInternalRequestKey"));

    if (v15)
    {
      -[HMDSecureRemoteMessageTransport _handlePingMessage:](self, "_handlePingMessage:", v13);
LABEL_16:
      v16 = 1;
LABEL_18:

      goto LABEL_19;
    }
    if (v13)
    {
      if (+[HMDSecureRemoteSession isSecureRemoteSessionMessage:](HMDSecureRemoteSession, "isSecureRemoteSessionMessage:", v13))
      {
        objc_msgSend(v10, "device");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSecureRemoteMessageTransport _handleSecureMessage:fromDevice:transport:](self, "_handleSecureMessage:fromDevice:transport:", v13, v17, v7);

        goto LABEL_16;
      }
      if (objc_msgSend(v13, "type") == 2)
      {
        -[HMDSecureRemoteMessageTransport _handleNotificationMessage:](self, "_handleNotificationMessage:", v13);
        goto LABEL_16;
      }
    }
    v16 = 0;
    goto LABEL_18;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (void)electDeviceForHH1User:(id)a3 destination:(id)a4 deviceCapabilities:(id)a5 responseTimeout:(double)a6 responseQueue:(id)a7 responseHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDRemoteMessage *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  id v33;
  id v34;
  id v35;
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (v15)
  {
    v19 = v16;
  }
  else
  {
    if (v16)
    {
      v20 = (void *)objc_msgSend(v16, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = v20;
    objc_msgSend(v20, "hmf_dictionaryForKey:", CFSTR("kRequestedCapabilitiesKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1E8B33D80, CFSTR("kHomedVersionKey"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("kRequestedCapabilitiesKey"));

  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  -[HMDSecureRemoteMessageTransport accountRegistry](self, "accountRegistry");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMessageDispatcher destinationWithTarget:userID:destination:multicast:accountRegistry:](HMDMessageDispatcher, "destinationWithTarget:userID:destination:multicast:accountRegistry:", v23, v14, v15, 1, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:restriction:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:restriction:", CFSTR("kElectDeviceForIDSSessionKey"), v25, v19, 0, 0, 5, a6);
  objc_initWeak(&location, self);
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __134__HMDSecureRemoteMessageTransport_electDeviceForHH1User_destination_deviceCapabilities_responseTimeout_responseQueue_responseHandler___block_invoke;
  v32 = &unk_1E89BCDD0;
  objc_copyWeak(&v35, &location);
  v27 = v17;
  v33 = v27;
  v28 = v18;
  v34 = v28;
  -[HMDRemoteMessage setResponseHandler:](v26, "setResponseHandler:", &v29);
  -[HMDSecureRemoteMessageTransport sendMessage:completionHandler:](self, "sendMessage:completionHandler:", v26, 0, v29, v30, v31, v32);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

- (void)_handleElectDeviceForUserResponse:(id)a3 error:(id)a4 responseQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDSecureRemoteMessageTransport *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDHomeKitVersion *v25;
  void *v26;
  HMDHomeKitVersion *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  HMDSecureRemoteMessageTransport *v36;
  NSObject *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  HMDHomeKitVersion *v44;
  void *v45;
  NSObject *v46;
  _QWORD block[4];
  id v48;
  id v49;
  id v50;
  id v51;
  char v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = 0;
  if (!v10 || v11)
  {
    v18 = (void *)v14;
  }
  else
  {
    v46 = v12;
    objc_msgSend(v10, "hmf_stringForKey:", CFSTR("kIDSMessageSourceIDKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v10, "mutableCopy");

    v59[0] = CFSTR("kIDSMessageSourceIDKey");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectsForKeys:", v19);

    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v54 = v23;
      v55 = 2112;
      v56 = v16;
      v57 = 2112;
      v58 = v18;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Elected device %@ for IDS session with peerInfo %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v10, "hmf_numberForKey:", CFSTR("kHomedVersionKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v45 = v17;
      v25 = [HMDHomeKitVersion alloc];
      objc_msgSend(v24, "stringValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[HMDHomeKitVersion initWithVersionString:](v25, "initWithVersionString:", v26);

      v52 = 0;
      -[HMDSecureRemoteMessageTransport accountRegistry](v21, "accountRegistry");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "deviceForHandle:exists:", v16, &v52);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v29;
      if (v52)
      {
        objc_msgSend(v29, "version");
        v31 = v13;
        v32 = v29;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqualToVersion:", v27);

        v30 = v32;
        v13 = v31;
        v11 = 0;
        if ((v34 & 1) == 0)
        {
          v44 = v27;
          v35 = (void *)MEMORY[0x1D17BA0A0]();
          v36 = v21;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v43 = v35;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v54 = v38;
            v55 = 2112;
            v56 = v30;
            _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Updating the device, %@, with the election parameters", buf, 0x16u);

            v35 = v43;
          }

          objc_autoreleasePoolPop(v35);
          v27 = v44;
          objc_msgSend(v30, "updateVersion:", v44);
        }
      }

      v17 = v45;
    }

    v12 = v46;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__HMDSecureRemoteMessageTransport__handleElectDeviceForUserResponse_error_responseQueue_completion___block_invoke;
  block[3] = &unk_1E89C0448;
  v48 = v11;
  v49 = v16;
  v50 = v18;
  v51 = v13;
  v39 = v18;
  v40 = v16;
  v41 = v11;
  v42 = v13;
  dispatch_async(v12, block);

}

- (void)_updateDeviceInformationFromMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  HMDSecureRemoteMessageTransport *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    if (objc_msgSend(v6, "isSecure"))
    {
      objc_msgSend(v6, "sourceVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v4, "destination");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
        v10 = v9;

        if (v10)
        {
          v25 = 0;
          -[HMDSecureRemoteMessageTransport accountRegistry](self, "accountRegistry");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "device");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handles");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "deviceForHandle:exists:", v14, &v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v15, "version");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "sourceVersion");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqualToVersion:", v17);

            if ((v18 & 1) == 0)
            {
              v19 = (void *)MEMORY[0x1D17BA0A0]();
              v20 = self;
              HMFGetOSLogHandle();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "sourceVersion");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v27 = v22;
                v28 = 2112;
                v29 = v15;
                v30 = 2112;
                v31 = v23;
                _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating the device, %@, with version from message: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v19);
              objc_msgSend(v6, "sourceVersion");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "updateVersion:", v24);

            }
          }

        }
      }
    }
  }

}

- (void)_handlePingMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDSecureRemoteMessageTransport *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Received ping from %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  objc_msgSend(v4, "responseHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "responseHandler");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, 0);

  }
}

- (void)pingDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HMDSecureRemoteMessageTransport_pingDevice_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_pingDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke;
    v8[3] = &unk_1E89BCDD0;
    objc_copyWeak(&v11, &location);
    v9 = v6;
    v10 = v7;
    -[HMDSecureRemoteMessageTransport _sendPingToDevice:timeout:restriction:responseHandler:](self, "_sendPingToDevice:timeout:restriction:responseHandler:", v9, 2, v8, 10.0);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)_sendPingToDevice:(id)a3 timeout:(double)a4 restriction:(unint64_t)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v10 = a3;
  v11 = a6;
  +[HMDRemoteDeviceMonitor pingMessageForDevice:timeout:restriction:](HMDRemoteDeviceMonitor, "pingMessageForDevice:timeout:restriction:", v10, a5, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__HMDSecureRemoteMessageTransport__sendPingToDevice_timeout_restriction_responseHandler___block_invoke;
    v13[3] = &unk_1E89C1B70;
    objc_copyWeak(&v15, &location);
    v14 = v11;
    objc_msgSend(v12, "setResponseHandler:", v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  -[HMDSecureRemoteMessageTransport sendMessage:completionHandler:](self, "sendMessage:completionHandler:", v12, 0);

}

- (void)_handleNotificationMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HMDSecureRemoteMessageTransport *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *queue;
  _QWORD block[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "messagePayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v7)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDSecureRemoteMessageTransport sessionNotifications](v10, "sessionNotifications");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addNotificationPayload:identifier:device:", v14, v15, v16);

  }
  objc_msgSend(v4, "responseHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__HMDSecureRemoteMessageTransport__handleNotificationMessage___block_invoke;
    block[3] = &unk_1E89C2730;
    v20 = v4;
    dispatch_async(queue, block);

  }
}

- (id)_secureRemoteSessionForDevice:(id)a3
{
  id v4;
  NSMutableSet *secureRemoteSessions;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  secureRemoteSessions = self->_secureRemoteSessions;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__HMDSecureRemoteMessageTransport__secureRemoteSessionForDevice___block_invoke;
  v9[3] = &unk_1E89B4C68;
  v10 = v4;
  v6 = v4;
  -[NSMutableSet na_firstObjectPassingTest:](secureRemoteSessions, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_sendSecureMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  HMDSecureRemoteMessageTransport *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDSecureRemoteMessageTransport *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "destination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      objc_msgSend(v11, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v16;
        v31 = 2112;
        v32 = v6;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Received request to send secure message, %@, to device %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      -[HMDSecureRemoteMessageTransport _secureRemoteSessionForDevice:](v14, "_secureRemoteSessionForDevice:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "sendMessage:completionHandler:", v6, v8);
      }
      else
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __72__HMDSecureRemoteMessageTransport__sendSecureMessage_completionHandler___block_invoke;
        v26[3] = &unk_1E89B4C90;
        v26[4] = v14;
        v27 = v6;
        v28 = v8;
        v25 = -[HMDSecureRemoteMessageTransport _openSecureSessionToDevice:completionHandler:](v14, "_openSecureSessionToDevice:completionHandler:", v12, v26);

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
        *(_DWORD *)buf = 138543618;
        v30 = v22;
        v31 = 2112;
        v32 = v6;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@The secure message, %@, did not contain a device destination", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = _Block_copy(v8);
      v24 = v23;
      if (v23)
        (*((void (**)(void *, void *))v23 + 2))(v23, v12);

      objc_msgSend(v6, "respondWithError:", v12);
    }
    goto LABEL_19;
  }
  v11 = _Block_copy(v7);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v11 + 2))(v11, v12);
LABEL_19:

  }
}

- (void)openSecureSessionToDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__HMDSecureRemoteMessageTransport_openSecureSessionToDevice_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (id)_openSecureSessionToDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDSecureRemoteMessageTransport _secureRemoteSessionForDevice:](self, "_secureRemoteSessionForDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = _Block_copy(v7);
    v10 = v9;
    if (v9)
      (*((void (**)(void *, void *, _QWORD))v9 + 2))(v9, v8, 0);

    v11 = v8;
  }
  else
  {
    -[HMDSecureRemoteMessageTransport dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "secureSessionWithDevice:", v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setDelegate:", self);
    -[NSMutableSet addObject:](self->_secureRemoteSessions, "addObject:", v11);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v11);
    objc_initWeak(&v19, v6);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__HMDSecureRemoteMessageTransport__openSecureSessionToDevice_completionHandler___block_invoke;
    v14[3] = &unk_1E89B4D08;
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, &from);
    objc_copyWeak(&v18, &v19);
    v15 = v7;
    objc_msgSend(v11, "openWithCompletionHandler:", v14);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)_handleSecureMessage:(id)a3 fromDevice:(id)a4 transport:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HMDSecureRemoteMessageTransport *v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  HMDSecureRemoteMessageTransport *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  -[HMDSecureRemoteMessageTransport _secureRemoteSessionForDevice:](self, "_secureRemoteSessionForDevice:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    goto LABEL_8;
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v17;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Opening secure session to handle incoming message: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDSecureRemoteMessageTransport _openSecureSessionToDevice:completionHandler:](v15, "_openSecureSessionToDevice:completionHandler:", v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
LABEL_8:
    objc_msgSend(v8, "name");

    objc_msgSend(v8, "identifier");
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    objc_msgSend(v13, "receivedSecureMessage:fromDevice:fromTransport:", v8, v9, v12);
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v15;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v23;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Failed to handle message: %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v8, "name");

    objc_msgSend(v8, "identifier");
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "respondWithError:", v13);
  }

}

- (void)secureRemoteSession:(id)a3 didCloseWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HMDSecureRemoteMessageTransport_secureRemoteSession_didCloseWithError___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)secureRemoteSession:(id)a3 receivedRequestToSendMessage:(id)a4
{
  -[HMDSecureRemoteMessageTransport sendMessage:completionHandler:](self, "sendMessage:completionHandler:", a4, 0);
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *queue;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dumpState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identityRegistry"));

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__120473;
  v17 = __Block_byref_object_dispose__120474;
  v18 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__HMDSecureRemoteMessageTransport_dumpState__block_invoke;
  v12[3] = &unk_1E89C0800;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(queue, v12);
  objc_msgSend((id)v14[5], "na_map:", &__block_literal_global_188_120475);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("secureSessions"));

  _Block_object_dispose(&v13, 8);
  -[HMDSecureRemoteMessageTransport transports](self, "transports");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_map:", &__block_literal_global_192_120477);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("remoteMessageTransports"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HMDSecureRemoteMessageTransport *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__HMDSecureRemoteMessageTransport_messageTransport_didReceiveMessage___block_invoke;
  v13[3] = &unk_1E89C07B8;
  v14 = v8;
  v15 = self;
  v16 = v7;
  v17 = v6;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (NSArray)transports
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (HMDRemoteDeviceMonitor)deviceMonitor
{
  return (HMDRemoteDeviceMonitor *)objc_getProperty(self, a2, 48, 1);
}

- (HMFFuture)startFuture
{
  return self->_startFuture;
}

- (HMDSecureRemoteMessageTransportDataSource)dataSource
{
  return self->_dataSource;
}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (HMFPromise)startPromise
{
  return self->_startPromise;
}

- (HMDRemoteMessageNotifications)sessionNotifications
{
  return self->_sessionNotifications;
}

- (void)setSessionNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_sessionNotifications, a3);
}

- (HMDCloudDataSyncStateFilter)cloudDataSyncStateFilter
{
  return (HMDCloudDataSyncStateFilter *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCloudDataSyncStateFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudDataSyncStateFilter, 0);
  objc_storeStrong((id *)&self->_sessionNotifications, 0);
  objc_storeStrong((id *)&self->_startPromise, 0);
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_startFuture, 0);
  objc_storeStrong((id *)&self->_deviceMonitor, 0);
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_secureRemoteSessions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __70__HMDSecureRemoteMessageTransport_messageTransport_didReceiveMessage___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "_updateDeviceInformationFromMessage:", *(_QWORD *)(a1 + 48));
  if ((objc_msgSend(*(id *)(a1 + 40), "_handleReceivedMessage:transport:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "messageTransport:didReceiveMessage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void __44__HMDSecureRemoteMessageTransport_dumpState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __44__HMDSecureRemoteMessageTransport_dumpState__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dumpState");
}

uint64_t __44__HMDSecureRemoteMessageTransport_dumpState__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dumpState");
}

void __73__HMDSecureRemoteMessageTransport_secureRemoteSession_didCloseWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Session to device, %@, closed with error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    v12 = CFSTR("HMDSecureRemoteSessionErrorKey");
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("HMDSecureRemoteSessionErrorNotification"), v11, v9);

}

void __80__HMDSecureRemoteMessageTransport__openSecureSessionToDevice_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  NSObject **v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 5);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__HMDSecureRemoteMessageTransport__openSecureSessionToDevice_completionHandler___block_invoke_2;
    block[3] = &unk_1E89B4CE0;
    objc_copyWeak(&v11, a1 + 6);
    v8 = v3;
    v9 = v5;
    objc_copyWeak(&v12, a1 + 7);
    v10 = a1[4];
    dispatch_async(v6, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
  }

}

void __80__HMDSecureRemoteMessageTransport__openSecureSessionToDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(_QWORD *)(a1 + 32)
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "containsObject:", WeakRetained))
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 64));
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v7;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to open secure session to device: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", WeakRetained);

  }
  v8 = _Block_copy(*(const void **)(a1 + 48));
  v9 = v8;
  if (v8)
  {
    if (*(_QWORD *)(a1 + 32))
      v10 = 0;
    else
      v10 = WeakRetained;
    (*((void (**)(void *, id))v8 + 2))(v8, v10);
  }

}

void __79__HMDSecureRemoteMessageTransport_openSecureSessionToDevice_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__HMDSecureRemoteMessageTransport_openSecureSessionToDevice_completionHandler___block_invoke_2;
  v6[3] = &unk_1E89B4CB8;
  v4 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = (id)objc_msgSend(v2, "_openSecureSessionToDevice:completionHandler:", v3, v6);

}

void __79__HMDSecureRemoteMessageTransport_openSecureSessionToDevice_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__HMDSecureRemoteMessageTransport_openSecureSessionToDevice_completionHandler___block_invoke_3;
    v7[3] = &unk_1E89C1D68;
    v9 = v5;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

uint64_t __79__HMDSecureRemoteMessageTransport_openSecureSessionToDevice_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __72__HMDSecureRemoteMessageTransport__sendSecureMessage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "sendMessage:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v14 = 138543874;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message, %@, failed to open secure session with error: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = _Block_copy(*(const void **)(a1 + 48));
    v13 = v12;
    if (v12)
      (*((void (**)(void *, id))v12 + 2))(v12, v6);

    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v6);
  }

}

uint64_t __65__HMDSecureRemoteMessageTransport__secureRemoteSessionForDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __62__HMDSecureRemoteMessageTransport__handleNotificationMessage___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v1 + 2))(v1, 0, 0);

}

void __89__HMDSecureRemoteMessageTransport__sendPingToDevice_timeout_restriction_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__HMDSecureRemoteMessageTransport__sendPingToDevice_timeout_restriction_responseHandler___block_invoke_2;
    block[3] = &unk_1E89C1B48;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __89__HMDSecureRemoteMessageTransport__sendPingToDevice_timeout_restriction_responseHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "deviceMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke_2;
    v19[3] = &unk_1E89BE698;
    objc_copyWeak(&v21, (id *)(a1 + 48));
    v20 = *(id *)(a1 + 40);
    objc_msgSend(v9, "confirmDevice:forClient:timeout:completionHandler:", v10, WeakRetained, v19, 65.0);

    objc_destroyWeak(&v21);
  }
  else
  {
    objc_msgSend(v8, "unreachableDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(a1 + 32));

    if (v12)
    {
      objc_msgSend(WeakRetained, "deviceMonitor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "confirmDevice:forClient:timeout:completionHandler:", *(_QWORD *)(a1 + 32), WeakRetained, 0, 0.0);

    }
    if (WeakRetained)
    {
      v14 = *(void **)(a1 + 40);
      if (v14)
      {
        v15 = WeakRetained[2];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke_4;
        v16[3] = &unk_1E89C1D68;
        v17 = 0;
        v18 = v14;
        dispatch_async(v15, v16);

      }
    }
  }

}

void __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      v7 = WeakRetained[2];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke_3;
      v8[3] = &unk_1E89C1D68;
      v10 = v6;
      v9 = v3;
      dispatch_async(v7, v8);

    }
  }

}

uint64_t __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

uint64_t __65__HMDSecureRemoteMessageTransport__pingDevice_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

uint64_t __64__HMDSecureRemoteMessageTransport_pingDevice_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pingDevice:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __100__HMDSecureRemoteMessageTransport__handleElectDeviceForUserResponse_error_responseQueue_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __134__HMDSecureRemoteMessageTransport_electDeviceForHH1User_destination_deviceCapabilities_responseTimeout_responseQueue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleElectDeviceForUserResponse:error:responseQueue:completion:", v5, v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __65__HMDSecureRemoteMessageTransport__preferredTransportForMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = objc_msgSend(v7, "qualityOfService");
  v12 = objc_msgSend(v10, "qualityOfService");
  if (v11 >= v12)
  {
    if (v11 <= v12)
    {
      v14 = objc_msgSend(v7, "isSecure");
      if (v14 == objc_msgSend(v10, "isSecure"))
      {
        v13 = 0;
      }
      else if (objc_msgSend(v7, "isSecure"))
      {
        v13 = 1;
      }
      else
      {
        v13 = -1;
      }
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

void __65__HMDSecureRemoteMessageTransport_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  void **v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  objc_class *v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  objc_class *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  objc_class *v64;
  id v65;
  void *v66;
  _QWORD *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  void *v81;
  void *v82;
  HMDRemoteDeviceMessageDestination *v83;
  void *v84;
  HMDRemoteDeviceMessageDestination *v85;
  HMDDeviceDiscoveryOperation *v86;
  HMDDeviceDiscoveryOperation *v87;
  uint64_t v88;
  id v89;
  NSObject *v90;
  id v91;
  NSObject *v92;
  void *v93;
  id v94;
  NSObject *v95;
  id v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  _QWORD *v109;
  id v110;
  int v111;
  id aBlock;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  _QWORD block[4];
  id v120;
  _QWORD *v121;
  _QWORD *v122;
  _QWORD v123[4];
  NSObject *v124;
  id location;
  uint64_t v126;
  void *v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  NSObject *v132;
  id v133;
  _QWORD *v134;
  _QWORD *v135;
  id v136;
  id v137;
  id from[5];
  NSObject *v139;
  id v140;
  _QWORD *v141;
  _QWORD *v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _QWORD v147[5];
  id v148;
  _QWORD v149[3];
  BOOL v150;
  _BYTE buf[24];
  void *v152;
  id v153;
  id v154;
  id v155;
  id v156[13];

  v156[10] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accountRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessageTransport remoteMessageFromMessage:secure:accountRegistry:](HMDRemoteMessageTransport, "remoteMessageFromMessage:secure:accountRegistry:", v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *v2;
  v7 = v5;
  if (v6
    && +[HMDRemoteMessageNotifications messageExpectsNotificationResponse:](HMDRemoteMessageNotifications, "messageExpectsNotificationResponse:", v7))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    v9 = v7;
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", v10);

    objc_initWeak(&location, v6);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __76__HMDSecureRemoteMessageTransport__setResponseHandleForNotificationMessage___block_invoke;
    v152 = &unk_1E89BF4F0;
    objc_copyWeak(&v154, &location);
    v11 = v8;
    v153 = v11;
    objc_msgSend(v9, "setResponseHandler:", buf);

    objc_destroyWeak(&v154);
    objc_destroyWeak(&location);

    v7 = v9;
  }
  v115 = v7;

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v16;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  objc_msgSend(*(id *)(a1 + 40), "_preferredTransportForMessage:", v115);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v114)
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v115;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message, %@, there is no available transport", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(v115, "name");

    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = _Block_copy(*(const void **)(a1 + 56));
    v36 = v35;
    if (v35)
      (*((void (**)(void *, void *))v35 + 2))(v35, v34);

    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", v34);
LABEL_31:

    goto LABEL_50;
  }
  v18 = *(_QWORD **)(a1 + 40);
  v17 = *(void **)(a1 + 48);
  v19 = *(void **)(a1 + 56);
  v20 = v115;
  v21 = v114;
  v22 = v17;
  v23 = v19;
  v109 = v18;
  if (!v18)
  {
LABEL_22:

    v38 = *(void **)(a1 + 40);
    v37 = *(void **)(a1 + 48);
    v39 = *(void **)(a1 + 56);
    v40 = v20;
    v41 = v21;
    v42 = v37;
    v43 = v39;
    if (v38 && objc_msgSend(v40, "isSecure") && (objc_msgSend(v41, "isSecure") & 1) == 0)
    {
      v57 = (void *)objc_msgSend(v40, "mutableCopy");
      objc_msgSend(v40, "identifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setIdentifier:", v58);

      objc_initWeak(&location, v38);
      objc_msgSend(v40, "responseHandler");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __109__HMDSecureRemoteMessageTransport__sendLegacySecureMessage_overInsecureTransport_activity_completionHandler___block_invoke;
      v152 = &unk_1E89BDB10;
      objc_copyWeak(v156, &location);
      v60 = v57;
      v153 = v60;
      v61 = v59;
      v154 = v61;
      v62 = v43;
      v155 = v62;
      objc_msgSend(v40, "setResponseHandler:", buf);
      v63 = v42;
      objc_msgSend(v40, "name");

      objc_msgSend(v40, "identifier");
      v64 = (objc_class *)objc_opt_class();
      v65 = NSStringFromClass(v64);

      objc_msgSend(v38, "_sendSecureMessage:completionHandler:", v40, v62);
      objc_destroyWeak(v156);

      objc_destroyWeak(&location);
      goto LABEL_50;
    }

    v34 = *(void **)(a1 + 40);
    v44 = *(void **)(a1 + 56);
    v45 = v40;
    v46 = v41;
    v47 = v44;
    if (v34)
    {
      if (objc_msgSend((id)objc_opt_class(), "restriction") == 2
        && (objc_msgSend(v45, "restriction") & 0xFFFFFFFFFFFFFFFDLL) != 0)
      {
        v48 = (void *)objc_msgSend(v45, "mutableCopy");
        objc_msgSend(v45, "identifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setIdentifier:", v49);

        objc_initWeak(from, v34);
        v50 = (void *)MEMORY[0x1E0C809B0];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __101__HMDSecureRemoteMessageTransport__completionHandlerToRetryMessage_afterTransport_completionHandler___block_invoke;
        v152 = &unk_1E89BCDD0;
        objc_copyWeak(&v155, from);
        v51 = v48;
        v153 = v51;
        v52 = v47;
        v154 = v52;
        objc_msgSend(v45, "setResponseHandler:", buf);
        location = v50;
        v126 = 3221225472;
        v127 = __101__HMDSecureRemoteMessageTransport__completionHandlerToRetryMessage_afterTransport_completionHandler___block_invoke_166;
        v128 = &unk_1E89C1A48;
        v129 = v52;
        v34 = _Block_copy(&location);

        objc_destroyWeak(&v155);
        objc_destroyWeak(from);

      }
      else
      {
        v34 = _Block_copy(v47);
      }
    }

    v53 = *(id *)(a1 + 48);
    objc_msgSend(v45, "name");

    objc_msgSend(v45, "identifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = (objc_class *)objc_opt_class();
    v56 = NSStringFromClass(v55);
    objc_msgSend(v46, "sendMessage:completionHandler:", v45, v34);
    goto LABEL_31;
  }
  objc_msgSend(v20, "destination");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v24;
  else
    v25 = 0;
  v26 = v25;

  if (!v26)
  {

    goto LABEL_22;
  }
  v118 = v20;
  v27 = v26;
  v113 = v21;
  v110 = v22;
  aBlock = v23;
  v117 = v27;
  v111 = objc_msgSend(v27, "isMulticast");
  if (v111)
  {
    if (objc_msgSend(v118, "isSecure") && !objc_msgSend(v113, "isSecure"))
    {
      v66 = (void *)MEMORY[0x1D17BA0A0]();
      v67 = v18;
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "identifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v69;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v70;
        _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_INFO, "%{public}@Sending account destination message %{public}@ securely to each device in the account.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v66);
      objc_msgSend(v118, "responseHandler");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v149[0] = 0;
      v149[1] = v149;
      v149[2] = 0x2020000000;
      v150 = v116 != 0;
      v147[0] = 0;
      v147[1] = v147;
      v147[2] = 0x3032000000;
      v147[3] = __Block_byref_object_copy__120473;
      v147[4] = __Block_byref_object_dispose__120474;
      v148 = 0;
      v71 = dispatch_group_create();
      +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "handle");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "accountForHandle:", v73);
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v108, "devices");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setWithArray:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v145 = 0u;
      v146 = 0u;
      v143 = 0u;
      v144 = 0u;
      v77 = v76;
      v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v143, buf, 16);
      if (v78)
      {
        v79 = *(_QWORD *)v144;
        do
        {
          for (i = 0; i != v78; ++i)
          {
            if (*(_QWORD *)v144 != v79)
              objc_enumerationMutation(v77);
            v81 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
            if ((objc_msgSend(v81, "isCurrentDevice") & 1) == 0)
            {
              v82 = (void *)objc_msgSend(v118, "mutableCopy");
              v83 = [HMDRemoteDeviceMessageDestination alloc];
              objc_msgSend(v117, "target");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v83, "initWithTarget:device:", v84, v81);
              objc_msgSend(v82, "setDestination:", v85);

              dispatch_group_enter(v71);
              from[0] = (id)MEMORY[0x1E0C809B0];
              from[1] = (id)3221225472;
              from[2] = __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke;
              from[3] = &unk_1E89B4BC8;
              from[4] = v67;
              v141 = v147;
              v142 = v149;
              v140 = v116;
              v139 = v71;
              objc_msgSend(v82, "setResponseHandler:", from);
              objc_msgSend(v67, "sendMessage:completionHandler:", v82, 0);

            }
          }
          v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v143, buf, 16);
        }
        while (v78);
      }

      v86 = [HMDDeviceDiscoveryOperation alloc];
      objc_msgSend(v118, "timeout");
      v87 = -[HMDDeviceDiscoveryOperation initWithAccount:timeout:](v86, "initWithAccount:timeout:", v108);
      -[HMDDeviceDiscoveryOperation setQualityOfService:](v87, "setQualityOfService:", objc_msgSend(v118, "qualityOfService"));
      objc_initWeak(&v137, v67);
      v88 = MEMORY[0x1E0C809B0];
      location = (id)MEMORY[0x1E0C809B0];
      v126 = 3221225472;
      v127 = __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_2;
      v128 = &unk_1E89B4BF0;
      objc_copyWeak(&v136, &v137);
      v89 = v77;
      v129 = v89;
      v130 = v118;
      v131 = v117;
      v90 = v71;
      v132 = v90;
      v134 = v147;
      v135 = v149;
      v91 = v116;
      v133 = v91;
      -[HMDDeviceDiscoveryOperation setDiscoveryBlock:](v87, "setDiscoveryBlock:", &location);
      dispatch_group_enter(v90);
      v123[0] = v88;
      v123[1] = 3221225472;
      v123[2] = __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_4;
      v123[3] = &unk_1E89C2730;
      v92 = v90;
      v124 = v92;
      -[HMDDeviceDiscoveryOperation setCompletionBlock:](v87, "setCompletionBlock:", v123);
      objc_msgSend(MEMORY[0x1E0D28698], "defaultScheduler");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = (id)objc_msgSend(v93, "performOperation:", v87);

      v95 = v67[2];
      block[0] = v88;
      block[1] = 3221225472;
      block[2] = __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_5;
      block[3] = &unk_1E89B4C18;
      v121 = v149;
      v96 = v91;
      v120 = v96;
      v122 = v147;
      dispatch_group_notify(v92, v95, block);
      v97 = _Block_copy(aBlock);
      v98 = v97;
      if (v97)
        (*((void (**)(void *, _QWORD))v97 + 2))(v97, 0);

      objc_destroyWeak(&v136);
      objc_destroyWeak(&v137);

      _Block_object_dispose(v147, 8);
      _Block_object_dispose(v149, 8);

    }
    else
    {
      objc_msgSend(v118, "name");

      objc_msgSend(v118, "identifier");
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      objc_msgSend(v113, "sendMessage:completionHandler:", v118, aBlock);
    }
  }

  if ((v111 & 1) == 0)
  {
    v99 = v117;
    v100 = v118;
    v101 = aBlock;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __103__HMDSecureRemoteMessageTransport__electDeviceForAccountDestination_thenSendMessage_completionHandler___block_invoke;
    v152 = &unk_1E89B4C40;
    v153 = v109;
    v102 = v100;
    v154 = v102;
    v103 = v101;
    v156[0] = v103;
    v104 = v99;
    v155 = v104;
    v105 = _Block_copy(buf);
    objc_msgSend(v104, "remoteDestinationString");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "deviceCapabilities");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "electDeviceForHH1User:destination:deviceCapabilities:responseTimeout:responseQueue:responseHandler:", v106, 0, v107, v109[2], v105, 0.0);

  }
LABEL_50:

}

void __101__HMDSecureRemoteMessageTransport__completionHandlerToRetryMessage_afterTransport_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Redirecting message over IDS: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "setRemoteRestriction:", objc_msgSend(*(id *)(a1 + 32), "remoteRestriction") & 0xFFFFFFFFFFFFFFFDLL);
    objc_msgSend(v9, "sendMessage:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", v6, 0);
  }

}

void __101__HMDSecureRemoteMessageTransport__completionHandlerToRetryMessage_afterTransport_completionHandler___block_invoke_166(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (!a2)
  {
    v2 = _Block_copy(*(const void **)(a1 + 32));
    if (v2)
    {
      v3 = v2;
      (*((void (**)(void *, _QWORD))v2 + 2))(v2, 0);
      v2 = v3;
    }

  }
}

void __109__HMDSecureRemoteMessageTransport__sendLegacySecureMessage_overInsecureTransport_activity_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  void *v8;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  _QWORD *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v5)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v11;
      v25 = 2114;
      v26 = v12;
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send secure message %{public}@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  if (WeakRetained)
  {
    objc_msgSend(v5, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB2F90])
      && (objc_msgSend(v5, "code") == -6722 || objc_msgSend(v5, "code") == -6752))
    {
      objc_msgSend(WeakRetained, "transports");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        v16 = WeakRetained[2];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __109__HMDSecureRemoteMessageTransport__sendLegacySecureMessage_overInsecureTransport_activity_completionHandler___block_invoke_162;
        block[3] = &unk_1E89C1B48;
        v20 = *(id *)(a1 + 32);
        v21 = WeakRetained;
        v22 = *(id *)(a1 + 48);
        dispatch_async(v16, block);

        v17 = v20;
        goto LABEL_14;
      }
    }
    else
    {

    }
  }
  v18 = _Block_copy(*(const void **)(a1 + 40));
  v17 = v18;
  if (v18)
    (*((void (**)(void *, id, id))v18 + 2))(v18, v5, v6);
LABEL_14:

}

void __109__HMDSecureRemoteMessageTransport__sendLegacySecureMessage_overInsecureTransport_activity_completionHandler___block_invoke_162(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[HMDRemoteMessageTransport remoteMessageFromMessage:secure:accountRegistry:](HMDRemoteMessageTransport, "remoteMessageFromMessage:secure:accountRegistry:", *(_QWORD *)(a1 + 32), 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2112;
    v10 = v2;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Retrying sending message: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 40), "_sendSecureMessage:completionHandler:", v2, *(_QWORD *)(a1 + 48));

}

void __103__HMDSecureRemoteMessageTransport__electDeviceForAccountDestination_thenSendMessage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDRemoteDeviceMessageDestination *v12;
  void *v13;
  HMDRemoteDeviceMessageDestination *v14;
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
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7 || !v8)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 40);
      v30 = 138543874;
      v31 = v18;
      v32 = 2112;
      v33 = v19;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to elect device for message: %@, error: %@", (uint8_t *)&v30, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    v20 = _Block_copy(*(const void **)(a1 + 56));
    v21 = v20;
    if (v20)
      (*((void (**)(void *, id))v20 + 2))(v20, v7);

    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "accountRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceForHandle:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = [HMDRemoteDeviceMessageDestination alloc];
      objc_msgSend(*(id *)(a1 + 48), "target");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v12, "initWithTarget:device:", v13, v11);
      objc_msgSend(*(id *)(a1 + 40), "setDestination:", v14);

      objc_msgSend(*(id *)(a1 + 32), "sendMessage:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 40);
        v30 = 138543874;
        v31 = v25;
        v32 = 2112;
        v33 = v8;
        v34 = 2112;
        v35 = v26;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unknown device for handle: %@. Failed to send for message: %@", (uint8_t *)&v30, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = _Block_copy(*(const void **)(a1 + 56));
      v29 = v28;
      if (v28)
        (*((void (**)(void *, void *))v28 + 2))(v28, v27);

      objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v27);
    }

  }
}

void __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v6 = a3;
  v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 24);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  if (v9 || (v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8), !*(_BYTE *)(v8 + 24)))
  {
    os_unfair_lock_unlock(v7);
  }
  else
  {
    *(_BYTE *)(v8 + 24) = 0;
    os_unfair_lock_unlock(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  HMDRemoteDeviceMessageDestination *v6;
  void *v7;
  HMDRemoteDeviceMessageDestination *v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  uint64_t v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v6 = [HMDRemoteDeviceMessageDestination alloc];
    objc_msgSend(*(id *)(a1 + 48), "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v6, "initWithTarget:device:", v7, v3);
    objc_msgSend(v5, "setDestination:", v8);

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_3;
    v12[3] = &unk_1E89B4BC8;
    v9 = *(_QWORD *)(a1 + 80);
    v12[4] = WeakRetained;
    v15 = v9;
    v11 = *(_OWORD *)(a1 + 64);
    v10 = (id)v11;
    v14 = v11;
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v5, "setResponseHandler:", v12);
    objc_msgSend(WeakRetained, "sendMessage:completionHandler:", v5, 0);

  }
}

void __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_5(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(_QWORD *)(a1[5] + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 0;
    v2 = a1[4];
    v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v3)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(a1[4], v3, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 8);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v4, 0);

    }
  }
}

void __119__HMDSecureRemoteMessageTransport__sendMulticastAccountMessage_toDestination_overTransport_activity_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v6 = a3;
  v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 24);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  if (v9 || (v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8), !*(_BYTE *)(v8 + 24)))
  {
    os_unfair_lock_unlock(v7);
  }
  else
  {
    *(_BYTE *)(v8 + 24) = 0;
    os_unfair_lock_unlock(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __76__HMDSecureRemoteMessageTransport__setResponseHandleForNotificationMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  NSObject **v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[2];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__HMDSecureRemoteMessageTransport__setResponseHandleForNotificationMessage___block_invoke_2;
    v10[3] = &unk_1E89C07B8;
    v11 = *(id *)(a1 + 32);
    v12 = v8;
    v13 = v6;
    v14 = v5;
    dispatch_async(v9, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", v6, v5);
  }

}

void __76__HMDSecureRemoteMessageTransport__setResponseHandleForNotificationMessage___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  +[HMDRemoteMessageTransport remoteMessageFromMessage:secure:accountRegistry:](HMDRemoteMessageTransport, "remoteMessageFromMessage:secure:accountRegistry:", *(_QWORD *)(a1 + 32), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v6;
  if (v5)
  {
    v10 = v8;
    objc_msgSend(v31, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (!v10 && v13)
    {
      objc_msgSend(v5, "sessionNotifications");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "notificationPayloadWithIdentifier:device:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = v17;

        v10 = 0;
        v7 = v18;
      }
      else
      {
        v19 = (void *)MEMORY[0x1D17BA0A0]();
        v20 = v5;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
        if (v7)
        {
          if (v22)
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v33 = v23;
            v34 = 2112;
            v35 = v31;
            _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Using response payload for message, %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v19);
          v10 = 0;
        }
        else
        {
          if (v22)
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v33 = v24;
            v34 = 2114;
            v35 = v25;
            _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Expecting notification before response to secure message: %{public}@ but did not find one, responding to client as failure", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v19);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 54, 0);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          v7 = 0;
        }
      }

    }
    objc_msgSend(v5, "sessionNotifications");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeNotificationPayloadWithIdentifier:device:", v27, v28);

    v29 = _Block_copy(v9);
    v30 = v29;
    if (v29)
      (*((void (**)(void *, id, id))v29 + 2))(v29, v10, v7);

  }
}

uint64_t __40__HMDSecureRemoteMessageTransport_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

void __40__HMDSecureRemoteMessageTransport_start__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(*(id *)(a1 + 32), "transports");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "transports", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "start");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "deviceMonitor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "start");

  objc_msgSend(*(id *)(a1 + 32), "startPromise");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28588], "allSettled:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ignoreOutcome");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resolveWithFuture:", v18);

}

+ (HMDSecureRemoteMessageTransport)defaultTransport
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HMDSecureRemoteMessageTransport_defaultTransport__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultTransport_onceToken_120575 != -1)
    dispatch_once(&defaultTransport_onceToken_120575, block);
  return (HMDSecureRemoteMessageTransport *)(id)defaultTransport_defaultTransport_120576;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)isDeviceValidDestination:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  BOOL v11;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Missing parameter.");
      v9 = CFSTR("Missing device from destination.");
      v10 = 20;
      goto LABEL_7;
    }
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v5, "isCurrentDevice"))
  {
    v11 = 1;
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_9;
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = CFSTR("Invalid parameter.");
  v9 = CFSTR("Invalid destination, cannot send message to ourselves.");
  v10 = 3;
LABEL_7:
  objc_msgSend(v7, "hmErrorWithCode:description:reason:suggestion:", v10, v8, v9, 0);
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t67_120565 != -1)
    dispatch_once(&logCategory__hmf_once_t67_120565, &__block_literal_global_195);
  return (id)logCategory__hmf_once_v68_120566;
}

void __46__HMDSecureRemoteMessageTransport_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v68_120566;
  logCategory__hmf_once_v68_120566 = v0;

}

void __51__HMDSecureRemoteMessageTransport_defaultTransport__block_invoke(uint64_t a1)
{
  HMDSecureRemoteMessageTransportDefaultDataSource *v2;
  HMDSecureRemoteMessageTransport *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(HMDSecureRemoteMessageTransportDefaultDataSource);
  v3 = -[HMDSecureRemoteMessageTransport initWithDataSource:]([HMDSecureRemoteMessageTransport alloc], "initWithDataSource:", v2);
  v4 = (void *)defaultTransport_defaultTransport_120576;
  defaultTransport_defaultTransport_120576 = (uint64_t)v3;

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating a default secure remote transport", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

@end
