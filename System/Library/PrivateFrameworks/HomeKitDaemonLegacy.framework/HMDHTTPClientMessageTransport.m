@implementation HMDHTTPClientMessageTransport

- (HMDHTTPClientMessageTransport)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDHTTPClientMessageTransport)initWithIdentifier:(id)a3 netService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHTTPClientMessageTransport *v9;
  uint64_t v10;
  NSUUID *identifier;
  void *v12;
  HMDHTTPDevice *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HMDHTTPDevice *remoteDevice;
  uint64_t v19;
  NSUUID *sessionIdentifier;
  void *v21;
  uint64_t v22;
  HMFHTTPClient *client;
  HMDHTTPClientMessageTransport *v24;
  HMDHTTPClientMessageTransport *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v28;
      v29 = "%{public}@The identifier is required";
LABEL_10:
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v26);
    v25 = 0;
    goto LABEL_12;
  }
  if (!v7)
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v28;
      v29 = "%{public}@The netService is required";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v31.receiver = self;
  v31.super_class = (Class)HMDHTTPClientMessageTransport;
  v9 = -[HMDHTTPClientMessageTransport init](&v31, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_netService, a4);
    objc_msgSend(v8, "setDelegate:", v9);
    NSStringFromSelector(sel_port);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v9, v12, 3, 0);

    v13 = [HMDHTTPDevice alloc];
    v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v8, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);
    v17 = -[HMDHTTPDevice initWithIdentifier:](v13, "initWithIdentifier:", v16);
    remoteDevice = v9->_remoteDevice;
    v9->_remoteDevice = (HMDHTTPDevice *)v17;

    objc_msgSend(v8, "hmd_sessionIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v9->_sessionIdentifier;
    v9->_sessionIdentifier = (NSUUID *)v19;

    objc_msgSend(MEMORY[0x1E0D28598], "defaultConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRequiresEncryption:", 1);
    objc_msgSend(v21, "setAllowsAnonymousConnection:", 1);
    objc_msgSend(v21, "setAllowsCellularAccess:", 0);
    objc_msgSend(v21, "setSupportsWakeOnLAN:", 1);
    objc_msgSend(v21, "setMonitorsReachability:", 1);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D28590]), "initWithService:configuration:", v8, v21);
    client = v9->_client;
    v9->_client = (HMFHTTPClient *)v22;

    -[HMFHTTPClient setDelegate:](v9->_client, "setDelegate:", v9);
  }
  v24 = v9;
  v25 = v24;
LABEL_12:

  return v25;
}

- (void)dealloc
{
  HMFNetService *netService;
  void *v4;
  objc_super v5;

  netService = self->_netService;
  NSStringFromSelector(sel_port);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetService removeObserver:forKeyPath:](netService, "removeObserver:forKeyPath:", self, v4);

  v5.receiver = self;
  v5.super_class = (Class)HMDHTTPClientMessageTransport;
  -[HMDHTTPClientMessageTransport dealloc](&v5, sel_dealloc);
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPClientMessageTransport netService](self, "netService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E89C3E38;
  }
  -[HMDHTTPClientMessageTransport netService](self, "netService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPClientMessageTransport sessionIdentifier](self, "sessionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPClientMessageTransport isReachable](self, "isReachable");
  HMFBooleanToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPClientMessageTransport isRunning](self, "isRunning");
  HMFBooleanToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Identifier = %@, Session Identifier = %@, Reachable = %@, Running = %@>"), v6, v7, v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v14;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDHTTPClientMessageTransport descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMDHTTPClientMessageTransport descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (NSUUID)sessionIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_sessionIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isRunning
{
  HMDHTTPClientMessageTransport *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_running;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setRunning:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_running = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isReachable
{
  void *v2;
  char v3;

  -[HMDHTTPClientMessageTransport client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReachable");

  return v3;
}

- (void)startWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  if (-[HMDHTTPClientMessageTransport isReachable](self, "isReachable"))
  {
    if (!-[HMDHTTPClientMessageTransport isRunning](self, "isRunning"))
    {
      -[HMDHTTPClientMessageTransport setRunning:](self, "setRunning:", 1);
      -[HMDHTTPClientMessageTransport _receiveMessage](self, "_receiveMessage");
      -[HMDHTTPClientMessageTransport netService](self, "netService");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resolveWithTimeout:completionHandler:", 0, 0.0);

    }
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 54, CFSTR("Communication Failure."), CFSTR("The server is unreachable."), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v6)
    v6[2](v6, v5);

}

- (void)stop
{
  -[HMDHTTPClientMessageTransport _stopWithError:](self, "_stopWithError:", 0);
}

- (void)_stopWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHTTPClientMessageTransport *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHTTPClientMessageTransport client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping the client with error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDHTTPClientMessageTransport setRunning:](v7, "setRunning:", 0);
    -[HMDHTTPClientMessageTransport client](v7, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancelPendingRequests");

    -[HMDHTTPClientMessageTransport delegate](v7, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "client:didStopWithError:", v7, v4);

  }
}

- (void)_receiveMessage
{
  void *v3;
  HMDHTTPClientMessageTransport *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[HMDHTTPClientMessageTransport isRunning](self, "isRunning"))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Send long-polled /receiveMessage", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v7 = objc_alloc(MEMORY[0x1E0D285F0]);
    v8 = (void *)MEMORY[0x1E0C99E98];
    -[HMDHTTPClientMessageTransport client](v4, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "baseURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:relativeToURL:", CFSTR("/receiveMessage"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v7, "initWithURL:method:body:timeoutInterval:", v11, CFSTR("GET"), 0, 3600.0);

    -[HMDHTTPClientMessageTransport identifier](v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHeaderValue:forHeaderKey:", v14, CFSTR("Client-Identifier"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHTTPClientMessageTransport client](v4, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __48__HMDHTTPClientMessageTransport__receiveMessage__block_invoke;
    v18[3] = &unk_1E89C19D0;
    v18[4] = v4;
    v19 = v15;
    v17 = v15;
    objc_msgSend(v16, "sendRequest:completionHandler:", v12, v18);

  }
}

- (void)_sendResponseMessage:(id)a3 forTransactionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HMDHTTPClientMessageTransport *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 100, 0, &v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v27;
    if (!v8)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v13;
        v30 = 2112;
        v31 = v9;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize response message with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }

  }
  else
  {
    v8 = 0;
  }
  v14 = objc_alloc(MEMORY[0x1E0D285F0]);
  v15 = (void *)MEMORY[0x1E0C99E98];
  -[HMDHTTPClientMessageTransport client](self, "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "baseURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLWithString:relativeToURL:", CFSTR("/sendResponse"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v14, "initWithURL:method:body:timeoutInterval:", v18, CFSTR("PUT"), v8, 60.0);

  -[HMDHTTPClientMessageTransport identifier](self, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHeaderValue:forHeaderKey:", v21, CFSTR("Client-Identifier"));

  objc_msgSend(v7, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHeaderValue:forHeaderKey:", v22, CFSTR("Transaction-Identifier"));

  -[HMDHTTPClientMessageTransport client](self, "client");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __79__HMDHTTPClientMessageTransport__sendResponseMessage_forTransactionIdentifier___block_invoke;
  v25[3] = &unk_1E89C19D0;
  v25[4] = self;
  v26 = v7;
  v24 = v7;
  objc_msgSend(v23, "sendRequest:completionHandler:", v19, v25);

}

- (void)sendMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDHTTPClientMessageTransport *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDHTTPClientMessageTransport *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 100, 0, &v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v33;
  if (v10)
  {
    if (a4 <= 0.0)
      a4 = 60.0;
    v12 = objc_alloc(MEMORY[0x1E0D285F0]);
    v13 = (void *)MEMORY[0x1E0C99E98];
    -[HMDHTTPClientMessageTransport client](self, "client");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "baseURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLWithString:relativeToURL:", CFSTR("/sendMessage"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v12, "initWithURL:method:body:timeoutInterval:", v16, CFSTR("POST"), v10, a4);

    -[HMDHTTPClientMessageTransport identifier](self, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHeaderValue:forHeaderKey:", v19, CFSTR("Client-Identifier"));

    +[HMDHTTPMessageTransport protocolVersion](HMDHTTPMessageTransport, "protocolVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "versionString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHeaderValue:forHeaderKey:", v21, CFSTR("Protocol-Version"));

    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      v36 = 2112;
      v37 = v17;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Sending message request: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    -[HMDHTTPClientMessageTransport client](v23, "client");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __71__HMDHTTPClientMessageTransport_sendMessage_timeout_completionHandler___block_invoke;
    v31[3] = &unk_1E89C19F8;
    v31[4] = v23;
    v32 = v9;
    objc_msgSend(v26, "sendRequest:completionHandler:", v17, v31);

  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v30;
      v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize response message with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    if (v9)
      (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v11);
  }

}

- (void)sendPingWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDHTTPClientMessageTransport *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D285F0]);
  v6 = (void *)MEMORY[0x1E0C99E98];
  -[HMDHTTPClientMessageTransport client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:relativeToURL:", CFSTR("/ping"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithURL:method:body:timeoutInterval:", v9, CFSTR("GET"), 0, 5.0);

  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Sending ping request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_initWeak((id *)buf, v12);
  -[HMDHTTPClientMessageTransport client](v12, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__HMDHTTPClientMessageTransport_sendPingWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E89C1A20;
  objc_copyWeak(&v19, (id *)buf);
  v16 = v4;
  v18 = v16;
  objc_msgSend(v15, "sendRequest:completionHandler:", v10, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  HMFNetService *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  HMDHTTPClientMessageTransport *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (HMFNetService *)a4;
  v11 = a5;
  if (self->_netService == v10)
  {
    NSStringFromSelector(sel_port);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "isEqualToString:", v12);

    if (v13)
    {
      objc_msgSend(v11, "hmf_numberForKey:", *MEMORY[0x1E0CB2CC8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmf_numberForKey:", *MEMORY[0x1E0CB2CB8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((HMFEqualObjects() & 1) == 0 && objc_msgSend(v14, "integerValue") != -1)
      {
        v16 = (void *)MEMORY[0x1D17BA0A0]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543874;
          v21 = v19;
          v22 = 2112;
          v23 = v14;
          v24 = 2112;
          v25 = v15;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Port change from '%@' to '%@'", (uint8_t *)&v20, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        __HMDHTTPClientMessageTransportReset(v17);
      }

    }
  }

}

- (void)client:(id)a3 didRequestPingWithCompletionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HMDHTTPClientMessageTransport_client_didRequestPingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E89C1A48;
  v8 = v5;
  v6 = v5;
  -[HMDHTTPClientMessageTransport sendPingWithCompletionHandler:](self, "sendPingWithCompletionHandler:", v7);

}

- (void)clientDidBecomeUnreachable:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 54, CFSTR("Communication failure."), CFSTR("The server is no longer reachable"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPClientMessageTransport _stopWithError:](self, "_stopWithError:", v4);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDHTTPClientMessageTransport remoteDevice](self, "remoteDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)netService:(id)a3 didUpdateTXTRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  HMDHTTPClientMessageTransport *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmd_sessionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    os_unfair_lock_lock_with_options();
    if ((HMFEqualObjects() & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      v9 = self->_sessionIdentifier == 0;
      objc_storeStrong((id *)&self->_sessionIdentifier, v8);
      os_unfair_lock_unlock(&self->_lock);
      if (!v9)
      {
        v10 = (void *)MEMORY[0x1D17BA0A0]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543362;
          v15 = v13;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Received notification session changed, resetting", (uint8_t *)&v14, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        __HMDHTTPClientMessageTransportReset(v11);
      }
    }
  }

}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPClientMessageTransport debugDescription](self, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D27EE0]);

  -[HMDHTTPClientMessageTransport client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("client"));

  -[HMDHTTPClientMessageTransport netService](self, "netService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D27F18]);

  return v3;
}

- (HMDHTTPClientMessageTransportDelegate)delegate
{
  return (HMDHTTPClientMessageTransportDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMFNetService)netService
{
  return self->_netService;
}

- (HMDHTTPDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (HMFHTTPClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

uint64_t __76__HMDHTTPClientMessageTransport_client_didRequestPingWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

void __63__HMDHTTPClientMessageTransport_sendPingWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received response to ping with error: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (v6)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v9;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to ping server", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }
  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v6);

}

void __71__HMDHTTPClientMessageTransport_sendMessage_timeout_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v10;
    v51 = 2112;
    v52 = v5;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received response to /sendMessage: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (!v6)
  {
    objc_msgSend(v5, "body");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v5, "body");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      objc_msgSend(v18, "propertyListWithData:options:format:error:", v19, 0, 0, &v48);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v48;

      if (v20)
      {
        v22 = v20;
        objc_opt_class();
        v23 = objc_opt_isKindOfClass() & 1;
        if (v23)
          v24 = v22;
        else
          v24 = 0;
        v25 = v24;

        if (v23)
        {
          objc_msgSend(v5, "headerFields");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "hmf_stringForKey:", CFSTR("Protocol-Version"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v27);
          else
            v28 = 0;

          if (+[HMDHTTPMessageTransport protocolVersionSupportsExtendedMessages:](HMDHTTPMessageTransport, "protocolVersionSupportsExtendedMessages:", v28))
          {
            objc_msgSend(v22, "hmf_dictionaryForKey:", CFSTR("p"));
            v29 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "hmf_numberForKey:", CFSTR("s"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmd_HTTPMessageTransportErrorWithCode:", objc_msgSend(v45, "unsignedIntegerValue"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v29 = v22;
            v30 = 0;
          }

LABEL_32:
          v46 = *(_QWORD *)(a1 + 40);
          if (v46)
            (*(void (**)(uint64_t, id, void *))(v46 + 16))(v46, v29, v30);
          goto LABEL_34;
        }
        v36 = (void *)MEMORY[0x1D17BA0A0]();
        v37 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "shortDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v50 = v47;
          v51 = 2112;
          v52 = v39;
          v53 = 2112;
          v54 = v40;
          v41 = v21;
          v42 = v36;
          v43 = v40;
          _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@[%@ Invalid message class type: %@", buf, 0x20u);

          v36 = v42;
          v21 = v41;

        }
        objc_autoreleasePoolPop(v36);
        if (*(_QWORD *)(a1 + 40))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 22, CFSTR("Invalid class."), CFSTR("Invalid message class."), 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        }
      }
      else
      {
        v31 = (void *)MEMORY[0x1D17BA0A0]();
        v32 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v34;
          v51 = 2112;
          v52 = v21;
          _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize message payload with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        v35 = *(_QWORD *)(a1 + 40);
        if (v35)
          (*(void (**)(uint64_t, _QWORD, id))(v35 + 16))(v35, 0, v21);
      }

      v29 = 0;
      v30 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v29 = 0;
    v30 = 0;
    goto LABEL_32;
  }
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v14;
    v51 = 2112;
    v52 = v6;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v6);
LABEL_35:

}

void __79__HMDHTTPClientMessageTransport__sendResponseMessage_forTransactionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v18 = 138543874;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v6;
      v13 = "%{public}@Failed to send response for transaction, %@, with error: %@";
      v14 = v10;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v14, v15, v13, (uint8_t *)&v18, v16);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    v18 = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v17;
    v13 = "%{public}@Successfully sent response for transaction: %@";
    v14 = v10;
    v15 = OS_LOG_TYPE_DEBUG;
    v16 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

void __48__HMDHTTPClientMessageTransport__receiveMessage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *context;
  _QWORD v42[5];
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v10;
    v47 = 2112;
    v48 = v5;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received a response to /receiveMessage: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (!v6)
  {
    objc_msgSend(v5, "headerFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hmf_UUIDForKey:", CFSTR("Transaction-Identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v5, "body");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      objc_msgSend(v17, "propertyListWithData:options:format:error:", v18, 0, 0, &v44);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v44;

      if (v19)
      {
        v21 = v19;
        objc_opt_class();
        v22 = objc_opt_isKindOfClass() & 1;
        if (v22)
          v23 = v21;
        else
          v23 = 0;
        v24 = v23;

        if (v22)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = *(_QWORD *)(a1 + 32);
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __48__HMDHTTPClientMessageTransport__receiveMessage__block_invoke_34;
          v42[3] = &unk_1E89C19A8;
          v42[4] = v26;
          v43 = v16;
          objc_msgSend(v25, "client:didReceiveMessage:completionHandler:", v26, v21, v42);

        }
        else
        {
          context = (void *)MEMORY[0x1D17BA0A0]();
          v35 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v40 = v24;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v46 = v37;
            v47 = 2112;
            v48 = v38;
            v39 = v38;
            _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@Invalid message class type: %@", buf, 0x16u);

            v24 = v40;
          }

          objc_autoreleasePoolPop(context);
        }

      }
      else
      {
        v31 = (void *)MEMORY[0x1D17BA0A0]();
        v32 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v34;
          v47 = 2112;
          v48 = v20;
          _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize message payload with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
      }

    }
    else
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v30;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Missing the message transaction identifier", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
    }

    v14 = *(void **)(a1 + 32);
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  v13 = v12;

  v14 = *(void **)(a1 + 32);
  if (v13 > 60.0)
  {
LABEL_25:
    objc_msgSend(v14, "_receiveMessage");
    goto LABEL_26;
  }
  objc_msgSend(v14, "_stopWithError:", v6);
LABEL_26:

}

uint64_t __48__HMDHTTPClientMessageTransport__receiveMessage__block_invoke_34(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendResponseMessage:forTransactionIdentifier:", a2, *(_QWORD *)(a1 + 40));
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_180844 != -1)
    dispatch_once(&logCategory__hmf_once_t27_180844, &__block_literal_global_180845);
  return (id)logCategory__hmf_once_v28_180846;
}

void __44__HMDHTTPClientMessageTransport_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v28_180846;
  logCategory__hmf_once_v28_180846 = v0;

}

@end
