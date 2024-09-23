@implementation HMXPCClient

- (void)registerReconnectionHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  id aBlock;

  aBlock = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMXPCClient reconnectionHandlers](self, "reconnectionHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _Block_copy(aBlock);
  objc_msgSend(v5, "addObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableArray)reconnectionHandlers
{
  return self->_reconnectionHandlers;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23 != -1)
    dispatch_once(&logCategory__hmf_once_t23, &__block_literal_global_2297);
  return (id)logCategory__hmf_once_v24;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (HMXPCClient)initWithConfiguration:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMXPCClient *v14;
  uint64_t v15;
  HMXPCMessageTransportConfiguration *configuration;
  uint64_t v17;
  NSDictionary *userInfo;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *logIdentifier;
  uint64_t v23;
  NSMutableArray *reconnectionHandlers;
  HMXPCMessageTransportConfiguration *v26;
  SEL v27;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v26 = (HMXPCMessageTransportConfiguration *)_HMFPreconditionFailure();
    return (HMXPCClient *)-[HMXPCMessageTransportConfiguration machServiceName](v26, v27);
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0D28688], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("HMProcessNameKey"));

  objc_msgSend(v9, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("HMXPCClientUUIDKey"));

  v28.receiver = self;
  v28.super_class = (Class)HMXPCClient;
  v14 = -[HMXPCClient init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v6, "copy");
    configuration = v14->_configuration;
    v14->_configuration = (HMXPCMessageTransportConfiguration *)v15;

    v17 = objc_msgSend(v10, "copy");
    userInfo = v14->_userInfo;
    v14->_userInfo = (NSDictionary *)v17;

    objc_storeStrong((id *)&v14->_UUID, v9);
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[HMXPCMessageTransportConfiguration machServiceName](v14->_configuration, "machServiceName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@/%@"), v20, v14->_UUID);
    v21 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v14->_logIdentifier;
    v14->_logIdentifier = (NSString *)v21;

    v14->_notifyRegisterToken = -1;
    v14->_requiresCheckin = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    reconnectionHandlers = v14->_reconnectionHandlers;
    v14->_reconnectionHandlers = (NSMutableArray *)v23;

  }
  return v14;
}

- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMXPCClient *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
    v10 = v7;
  else
    v10 = (id)objc_msgSend(v7, "mutableCopy");
  v11 = v10;

  v12 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v11, "setTransport:", self));
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
    _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received message %@ from XPC server", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMFMessageTransport delegate](v13, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v17, "messageTransport:didReceiveMessage:", v13, v18);

}

- (NSXPCConnection)connection
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection **p_connection;
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  HMXPCClientConnectionProxy *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  HMXPCClient *v26;
  NSObject *v27;
  void *v28;
  id *v30;
  id *v31;
  id *v32;
  id *v33;
  HMXPCClientConnectionProxy *v34;
  _QWORD handler[4];
  id v36;
  int out_token;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id from;
  _QWORD v45[4];
  id v46;
  id location;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint32_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_connection = &self->_connection;
  connection = self->_connection;
  if (connection)
  {
    v6 = connection;
  }
  else
  {
    -[HMXPCClient setRequiresCheckin:](self, "setRequiresCheckin:", 1);
    objc_initWeak(&location, self);
    v7 = [HMXPCClientConnectionProxy alloc];
    -[HMXPCClient userInfo](self, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __25__HMXPCClient_connection__block_invoke;
    v45[3] = &unk_1E3AB61D0;
    v33 = &v46;
    objc_copyWeak(&v46, &location);
    v34 = -[HMXPCClientConnectionProxy initWithUserInfo:refreshHandler:](v7, "initWithUserInfo:refreshHandler:", v8, v45);

    -[HMFMessageTransport setDelegate:](v34, "setDelegate:", self);
    v9 = objc_alloc(MEMORY[0x1E0CB3B38]);
    -[HMXPCClient configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "machServiceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSXPCConnection *)objc_msgSend(v9, "initWithMachServiceName:options:", v11, 0);

    +[HMXPCClient remoteObjectInterface](HMXPCClient, "remoteObjectInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v12);

    +[HMXPCClient exportedInterface](HMXPCClient, "exportedInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v13);

    -[NSXPCConnection setExportedObject:](v6, "setExportedObject:", v34);
    -[HMXPCClient configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "queue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection _setQueue:](v6, "_setQueue:", v15);

    objc_initWeak(&from, v6);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __25__HMXPCClient_connection__block_invoke_70;
    v41[3] = &unk_1E3AADC98;
    v31 = &v42;
    objc_copyWeak(&v42, &location);
    v32 = &v43;
    objc_copyWeak(&v43, &from);
    -[NSXPCConnection setInterruptionHandler:](v6, "setInterruptionHandler:", v41);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __25__HMXPCClient_connection__block_invoke_72;
    v38[3] = &unk_1E3AADC98;
    objc_copyWeak(&v39, &location);
    objc_copyWeak(&v40, &from);
    -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v38);
    if (-[HMXPCClient notifyRegisterToken](self, "notifyRegisterToken") == -1)
    {
      out_token = 0;
      -[HMXPCClient configuration](self, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "serverStartNotification");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = (const char *)objc_msgSend(v17, "UTF8String");
      dispatch_get_global_queue(17, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __25__HMXPCClient_connection__block_invoke_73;
      handler[3] = &unk_1E3AB43D0;
      v30 = &v36;
      objc_copyWeak(&v36, &location);
      v20 = notify_register_dispatch(v18, &out_token, v19, handler);

      if (v20)
      {
        v25 = (void *)MEMORY[0x1A1AC1AAC](v21, v22, v23, v24);
        v26 = self;
        HMFGetOSLogHandle();
        v27 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v28;
          v50 = 1024;
          v51 = v20;
          _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for HomeKit daemon ready notification: %u", buf, 0x12u);

        }
        objc_autoreleasePoolPop(v25);
      }
      else
      {
        -[HMXPCClient setNotifyRegisterToken:](self, "setNotifyRegisterToken:", out_token, &v36, &v42, &v43, &v46);
      }
      objc_destroyWeak(v30);
    }
    -[NSXPCConnection resume](v6, "resume", v30);
    objc_storeStrong((id *)p_connection, v6);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v39);
    objc_destroyWeak(v32);
    objc_destroyWeak(v31);
    objc_destroyWeak(&from);

    objc_destroyWeak(v33);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  BOOL v9;
  void *v10;
  HMXPCClient *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMXPCClient *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  HMXPCClient *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMXPCClient *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  _QWORD v51[5];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMXPCClient configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "requiresHomeDataAccess"))
  {
    v9 = -[HMXPCClient isAuthorizedForHomeDataAccess](self, "isAuthorizedForHomeDataAccess");

    if (!v9)
    {
      v10 = (void *)MEMORY[0x1A1AC1AAC]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v13;
        v54 = 2112;
        v55 = v14;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Message send failed for %@ because client is not authorized for home data access", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 47);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "respondWithError:", v15);
      if (v7)
        v7[2](v7, v15);
      goto LABEL_28;
    }
  }
  else
  {

  }
  -[HMXPCClient connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  if (-[HMXPCClient requiresCheckin](self, "requiresCheckin"))
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v19;
      v54 = 2048;
      v55 = v15;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Connecting to the daemon using connection: %p", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __45__HMXPCClient_sendMessage_completionHandler___block_invoke;
    v51[3] = &unk_1E3AB5CA8;
    v51[4] = v17;
    objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v51);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMXPCClient userInfo](v17, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateUserInfo:", v21);

  }
  -[HMXPCClient setRequiresCheckin:](self, "setRequiresCheckin:", 0);
  os_unfair_lock_unlock(&self->_lock);
  v22 = objc_opt_class();
  if (v22 == objc_opt_class())
    v23 = v6;
  else
    v23 = (id)objc_msgSend(v6, "mutableCopy");
  v24 = v23;
  if (objc_msgSend(v6, "qualityOfService") == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setQualityOfService:", objc_msgSend(v31, "qualityOfService"));

    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v32 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "qualityOfService");
      HMFQualityOfServiceToString();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v33;
      v54 = 2112;
      v55 = v34;
      v56 = 2112;
      v57 = v35;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@Sending message %@ to XPC server with adopted QOS: %@", buf, 0x20u);

    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "qualityOfService");
      HMFQualityOfServiceToString();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v28;
      v54 = 2112;
      v55 = v29;
      v56 = 2112;
      v57 = v30;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@Sending message %@ to XPC server with QOS: %@", buf, 0x20u);

    }
  }

  objc_autoreleasePoolPop(v25);
  objc_msgSend(v6, "activity");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "clientMetricIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v6, "activity");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "clientMetricIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHeaderValue:forKey:", v39, CFSTR("HMActivityMetricIdentifierKey"));

  }
  v40 = (void *)objc_msgSend(v24, "copy");

  objc_msgSend(v40, "responseHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __45__HMXPCClient_sendMessage_completionHandler___block_invoke_80;
  v48[3] = &unk_1E3AB53A8;
  v48[4] = self;
  v6 = v40;
  v49 = v6;
  v42 = v41;
  v50 = v42;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v48);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v42)
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __45__HMXPCClient_sendMessage_completionHandler___block_invoke_81;
    v45[3] = &unk_1E3AB60C8;
    v45[4] = self;
    v46 = v6;
    v47 = v42;
    objc_msgSend(v44, "handleMessage:responseHandler:", v46, v45);

  }
  else
  {
    objc_msgSend(v43, "handleMessage:", v6);
  }
  if (v7)
    v7[2](v7, 0);

LABEL_28:
}

- (HMXPCMessageTransportConfiguration)configuration
{
  return (HMXPCMessageTransportConfiguration *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequiresCheckin:(BOOL)a3
{
  self->_requiresCheckin = a3;
}

- (BOOL)requiresCheckin
{
  return self->_requiresCheckin;
}

- (BOOL)isAuthorizedForHomeDataAccess
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ((-[HMXPCClient homeDataAuthorizationStatus](self, "homeDataAuthorizationStatus") & 1) == 0)
    -[HMXPCClient setHomeDataAuthorizationStatus:](self, "setHomeDataAuthorizationStatus:", HMPrivacyGetAuthorizationStatusForHomeKit());
  v4 = (-[HMXPCClient homeDataAuthorizationStatus](self, "homeDataAuthorizationStatus") >> 2) & 1;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)homeDataAuthorizationStatus
{
  return self->_homeDataAuthorizationStatus;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNotifyRegisterToken:(int)a3
{
  self->_notifyRegisterToken = a3;
}

- (void)setHomeDataAuthorizationStatus:(unint64_t)a3
{
  self->_homeDataAuthorizationStatus = a3;
}

- (int)notifyRegisterToken
{
  return self->_notifyRegisterToken;
}

+ (id)remoteObjectInterface
{
  id v2;
  void *WeakRetained;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&remoteObjectInterface_remoteObjectInterface);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4597B8);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D285D0], "allowedClassesForXPC");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_handleMessage_responseHandler_, 1, 1);

    objc_storeWeak(&remoteObjectInterface_remoteObjectInterface, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)exportedInterface
{
  id v2;
  void *WeakRetained;

  v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&exportedInterface_exportedInterface);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4422F8);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&exportedInterface_exportedInterface, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

- (HMXPCClient)initWithConfiguration:(id)a3
{
  return -[HMXPCClient initWithConfiguration:userInfo:](self, "initWithConfiguration:userInfo:", a3, MEMORY[0x1E0C9AA70]);
}

void __26__HMXPCClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v24;
  logCategory__hmf_once_v24 = v0;

}

- (void)dealloc
{
  uint64_t notifyRegisterToken;
  void *v4;
  HMXPCClient *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  notifyRegisterToken = self->_notifyRegisterToken;
  if ((_DWORD)notifyRegisterToken != -1)
    notifyRegisterToken = notify_cancel(notifyRegisterToken);
  v4 = (void *)MEMORY[0x1A1AC1AAC](notifyRegisterToken);
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v7;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to invalidate the XPC connection with HomeKitDaemon.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[NSXPCConnection invalidate](v5->_connection, "invalidate");
  v8.receiver = v5;
  v8.super_class = (Class)HMXPCClient;
  -[HMXPCClient dealloc](&v8, sel_dealloc);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reconnectionHandlers, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __45__HMXPCClient_sendMessage_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remote object proxy for connecting to the daemon: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __45__HMXPCClient_sendMessage_completionHandler___block_invoke_80(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remote object proxy for sending message %@: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, id, _QWORD))(v9 + 16))(v9, v3, 0);

}

void __45__HMXPCClient_sendMessage_completionHandler___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received response from XPC server for message: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __25__HMXPCClient_connection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  os_unfair_lock_s *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v9;
  id v10;
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
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = (os_unfair_lock_s *)WeakRetained;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_unfair_lock_s reconnectionHandlers](v3, "reconnectionHandlers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v5;
      v21 = 2048;
      v22 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying %lu reconnection handlers about refresh", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    v7 = v3 + 4;
    os_unfair_lock_lock_with_options();
    -[os_unfair_lock_s reconnectionHandlers](v3, "reconnectionHandlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    os_unfair_lock_unlock(v7);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v10);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13));
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

void __25__HMXPCClient_connection__block_invoke_70(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  os_unfair_lock_s *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = (os_unfair_lock_s *)WeakRetained;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2048;
      v12 = v3;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Connection to daemon was interrupted: %p", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    os_unfair_lock_lock_with_options();
    -[os_unfair_lock_s setRequiresCheckin:](v5, "setRequiresCheckin:", 1);
    os_unfair_lock_unlock(v5 + 4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("kHomeKitDaemonInterruptedNotification"), 0);

  }
}

void __25__HMXPCClient_connection__block_invoke_72(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  os_unfair_lock_s *v5;
  NSObject *v6;
  void *v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  void *v10;
  os_unfair_lock_s *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = (os_unfair_lock_s *)WeakRetained;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v7;
      v16 = 2048;
      v17 = v3;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Connection to daemon was invalidated: %p", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v8 = v5 + 4;
    v9 = os_unfair_lock_lock_with_options();
    if (v3 == *(id *)&v5[8]._os_unfair_lock_opaque)
    {
      v10 = (void *)MEMORY[0x1A1AC1AAC](v9);
      v11 = v5;
      HMFGetOSLogHandle();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v13;
        v16 = 2048;
        v17 = v3;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Resetting connection due to invalidation: %p", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      -[os_unfair_lock_s setConnection:](v11, "setConnection:", 0);
    }
    os_unfair_lock_unlock(v8);

  }
}

void __25__HMXPCClient_connection__block_invoke_73(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = WeakRetained;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serverStartNotification");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v5;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification that HomeKit daemon is ready: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(v3, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __25__HMXPCClient_connection__block_invoke_74;
    v9[3] = &unk_1E3AB5E18;
    v9[4] = v3;
    objc_msgSend(v8, "scheduleSendBarrierBlock:", v9);

  }
}

void __25__HMXPCClient_connection__block_invoke_74(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  os_unfair_lock_s *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v5;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying reconnection handlers that HomeKit daemon is ready", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 16);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 32), "setRequiresCheckin:", 1);
  objc_msgSend(*(id *)(a1 + 32), "reconnectionHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  os_unfair_lock_unlock(v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", (_QWORD)v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("HMDaemonReconnectedNotification"), *(_QWORD *)(a1 + 32));

}

@end
