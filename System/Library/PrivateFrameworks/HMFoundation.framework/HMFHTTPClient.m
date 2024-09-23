@implementation HMFHTTPClient

+ (id)baseURLWithScheme:(id)a3 hostAddress:(id)a4 port:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v16 = (void *)MEMORY[0x1A1AC355C]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    HMFGetLogIdentifier(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v19;
    v20 = "%{public}@Scheme is required";
LABEL_12:
    _os_log_impl(&dword_19B546000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);

    goto LABEL_13;
  }
  if (!v9)
  {
    v16 = (void *)MEMORY[0x1A1AC355C]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    HMFGetLogIdentifier(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v19;
    v20 = "%{public}@Host address is required";
    goto LABEL_12;
  }
  if (!a5)
  {
    v16 = (void *)MEMORY[0x1A1AC355C]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      v20 = "%{public}@Port is required";
      goto LABEL_12;
    }
LABEL_13:

    objc_autoreleasePoolPop(v16);
    v15 = 0;
    goto LABEL_14;
  }
  if (objc_msgSend(v9, "addressFamily") == 2)
  {
    objc_msgSend(v10, "addressString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%"), CFSTR("%25"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://[%@]:%tu"), v8, v12, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLWithString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0C99E98];
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "addressString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@://%@:%tu"), v8, v24, a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLWithString:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_14:

  return v15;
}

- (HMFHTTPClient)init
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

- (HMFHTTPClient)initWithBaseURL:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  HMFHTTPClientConfiguration *v7;
  HMFHTTPClientConfiguration *v8;
  HMFHTTPClient *v9;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HMFHTTPClientConfiguration);
  v8 = v7;
  if ((v4 & 1) == 0)
  {
    if ((v4 & 2) == 0)
      goto LABEL_3;
LABEL_7:
    -[HMFHTTPClientConfiguration setMonitorsReachability:](v8, "setMonitorsReachability:", 1);
    if ((v4 & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  -[HMFHTTPClientConfiguration setRequiresEncryption:](v7, "setRequiresEncryption:", 1);
  if ((v4 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 4) != 0)
LABEL_4:
    -[HMFHTTPClientConfiguration setSupportsWakeOnLAN:](v8, "setSupportsWakeOnLAN:", 1);
LABEL_5:
  v9 = -[HMFHTTPClient initWithBaseURL:configuration:](self, "initWithBaseURL:configuration:", v6, v8);

  return v9;
}

- (HMFHTTPClient)initWithBaseURL:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMFHTTPClient *v9;

  v6 = a4;
  v7 = a3;
  +[HMFNetManager sharedManager](HMFNetManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMFHTTPClient initWithBaseURL:configuration:netManager:](self, "initWithBaseURL:configuration:netManager:", v7, v6, v8);

  return v9;
}

- (HMFHTTPClient)initWithBaseURL:(id)a3 configuration:(id)a4 netManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HMFNetAddress *v17;
  void *v18;
  HMFNetAddress *v19;
  HMFNetMonitor *v20;
  void *v21;
  HMFHTTPClient *v22;
  NSObject *v23;
  void *v24;
  HMFHTTPClient *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  objc_msgSend(v11, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_msgSend(v11, "host"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    objc_msgSend(v11, "port");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v11, "baseURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v11, "baseURL");
        v16 = objc_claimAutoreleasedReturnValue();

        v11 = (id)v16;
      }
      if (objc_msgSend(v9, "monitorsReachability"))
      {
        v17 = [HMFNetAddress alloc];
        objc_msgSend(v11, "host");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[HMFNetAddress initWithHostname:](v17, "initWithHostname:", v18);

        v20 = -[HMFNetMonitor initWithNetAddress:]([HMFNetMonitor alloc], "initWithNetAddress:", v19);
      }
      else
      {
        v20 = 0;
      }
      -[HMFHTTPClient createNSURLSession:](self, "createNSURLSession:", v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HMFHTTPClient initWithBaseURL:configuration:session:reachabilityMonitor:netManager:](self, "initWithBaseURL:configuration:session:reachabilityMonitor:netManager:", v11, v9, v26, v20, v10);

      v25 = v22;
      goto LABEL_14;
    }
  }
  else
  {

  }
  v21 = (void *)MEMORY[0x1A1AC355C]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v24;
    v30 = 2112;
    v31 = v11;
    _os_log_impl(&dword_19B546000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid base URL: %@", (uint8_t *)&v28, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  v25 = 0;
LABEL_14:

  return v25;
}

- (HMFHTTPClient)initWithBaseURL:(id)a3 configuration:(id)a4 session:(id)a5 reachabilityMonitor:(id)a6 netManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMFHTTPClient *v17;
  HMFHTTPClient *v18;
  const char *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  uint64_t v22;
  NSURL *baseURL;
  uint64_t v24;
  HMFHTTPClientConfiguration *configuration;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)HMFHTTPClient;
  v17 = -[HMFHTTPClient init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    v19 = (const char *)HMFDispatchQueueName(v17, 0);
    v20 = dispatch_queue_create(v19, 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v20;

    v22 = objc_msgSend(v12, "copy");
    baseURL = v18->_baseURL;
    v18->_baseURL = (NSURL *)v22;

    v24 = objc_msgSend(v13, "copy");
    configuration = v18->_configuration;
    v18->_configuration = (HMFHTTPClientConfiguration *)v24;

    objc_storeStrong((id *)&v18->_session, a5);
    objc_storeStrong((id *)&v18->_reachabilityMonitor, a6);
    objc_storeStrong((id *)&v18->_netManager, a7);
    -[HMFHTTPClient finishCommonInitialization](v18, "finishCommonInitialization");
  }

  return v18;
}

- (HMFHTTPClient)initWithNetService:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  HMFHTTPClientConfiguration *v7;
  HMFHTTPClientConfiguration *v8;
  HMFHTTPClient *v9;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HMFHTTPClientConfiguration);
  v8 = v7;
  if ((v4 & 1) == 0)
  {
    if ((v4 & 2) == 0)
      goto LABEL_3;
LABEL_7:
    -[HMFHTTPClientConfiguration setMonitorsReachability:](v8, "setMonitorsReachability:", 1);
    if ((v4 & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  -[HMFHTTPClientConfiguration setRequiresEncryption:](v7, "setRequiresEncryption:", 1);
  if ((v4 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 4) != 0)
LABEL_4:
    -[HMFHTTPClientConfiguration setSupportsWakeOnLAN:](v8, "setSupportsWakeOnLAN:", 1);
LABEL_5:
  v9 = -[HMFHTTPClient initWithService:configuration:](self, "initWithService:configuration:", v6, v8);

  return v9;
}

- (HMFHTTPClient)initWithService:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMFHTTPClient *v9;

  v6 = a4;
  v7 = a3;
  +[HMFNetManager sharedManager](HMFNetManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMFHTTPClient initWithService:configuration:netManager:](self, "initWithService:configuration:netManager:", v7, v6, v8);

  return v9;
}

- (HMFHTTPClient)initWithService:(id)a3 configuration:(id)a4 netManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMFNetMonitor *v11;
  void *v12;
  HMFHTTPClient *v13;
  NSObject *v14;
  void *v15;
  HMFHTTPClient *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (objc_msgSend(v9, "monitorsReachability"))
      v11 = -[HMFNetMonitor initWithNetService:]([HMFNetMonitor alloc], "initWithNetService:", v8);
    else
      v11 = 0;
    -[HMFHTTPClient createNSURLSession:](self, "createNSURLSession:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMFHTTPClient initWithService:configuration:session:reachabilityMonitor:netManager:](self, "initWithService:configuration:session:reachabilityMonitor:netManager:", v8, v9, v17, v11, v10);

    v16 = v13;
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC355C]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v15;
      _os_log_impl(&dword_19B546000, v14, OS_LOG_TYPE_ERROR, "%{public}@Network service is required", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = 0;
  }

  return v16;
}

- (HMFHTTPClient)initWithService:(id)a3 configuration:(id)a4 session:(id)a5 reachabilityMonitor:(id)a6 netManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HMFHTTPClient *v18;
  HMFHTTPClient *v19;
  const char *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *queue;
  uint64_t v23;
  HMFHTTPClientConfiguration *configuration;
  NSOperationQueue *v25;
  NSOperationQueue *reachabilityProbeQueue;
  NSOperationQueue *v27;
  void *v28;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)HMFHTTPClient;
  v18 = -[HMFHTTPClient init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    v20 = (const char *)HMFDispatchQueueName(v18, 0);
    v21 = dispatch_queue_create(v20, 0);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v21;

    objc_storeStrong((id *)&v19->_netService, a3);
    v23 = objc_msgSend(v14, "copy");
    configuration = v19->_configuration;
    v19->_configuration = (HMFHTTPClientConfiguration *)v23;

    objc_storeStrong((id *)&v19->_session, a5);
    objc_storeStrong((id *)&v19->_reachabilityMonitor, a6);
    objc_storeStrong((id *)&v19->_netManager, a7);
    if (v19->_reachabilityMonitor)
    {
      v25 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
      reachabilityProbeQueue = v19->_reachabilityProbeQueue;
      v19->_reachabilityProbeQueue = v25;

      v27 = v19->_reachabilityProbeQueue;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), HMFDispatchQueueName(v19, CFSTR("reachabilityProbeQueue")));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSOperationQueue setName:](v27, "setName:", v28);

      -[NSOperationQueue setMaxConcurrentOperationCount:](v19->_reachabilityProbeQueue, "setMaxConcurrentOperationCount:", 1);
      -[NSOperationQueue setQualityOfService:](v19->_reachabilityProbeQueue, "setQualityOfService:", 25);
    }
    -[HMFHTTPClient finishCommonInitialization](v19, "finishCommonInitialization");
  }

  return v19;
}

- (id)createNSURLSession:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0C92CA0];
  v5 = a3;
  objc_msgSend(v4, "defaultSessionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHTTPCookieAcceptPolicy:", 1);
  objc_msgSend(v6, "setHTTPCookieStorage:", 0);
  objc_msgSend(v6, "setHTTPShouldSetCookies:", 0);
  objc_msgSend(v6, "setURLCredentialStorage:", 0);
  objc_msgSend(v6, "setURLCache:", 0);
  objc_msgSend(v6, "setHTTPShouldUsePipelining:", 1);
  v7 = objc_msgSend(v5, "allowsCellularAccess");

  objc_msgSend(v6, "setAllowsCellularAccess:", v7);
  v8 = (void *)MEMORY[0x1E0C92C98];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionWithConfiguration:delegate:delegateQueue:", v6, self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)finishCommonInitialization
{
  id timerFactory;
  void *v4;
  HMFHTTPClient *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  self->_reachable = 1;
  timerFactory = self->_timerFactory;
  self->_timerFactory = &__block_literal_global_31;

  -[HMFNetMonitor setDelegate:](self->_reachabilityMonitor, "setDelegate:", self);
  if (-[HMFHTTPClientConfiguration supportsWakeOnLAN](self->_configuration, "supportsWakeOnLAN"))
  {
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@Registering for WOW assertion", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMFNetManager registerWoWAssertionForObject:](v5->_netManager, "registerWoWAssertionForObject:", v5);
  }
  -[HMFHTTPClient resolveWithCompletionHandler:](self, "resolveWithCompletionHandler:", 0);
}

HMFExponentialBackoffTimer *__43__HMFHTTPClient_finishCommonInitialization__block_invoke()
{
  return -[HMFExponentialBackoffTimer initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:]([HMFExponentialBackoffTimer alloc], "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", 3, 1, 1.0, 1800.0);
}

- (void)dealloc
{
  objc_super v3;

  -[HMFNetManager deregisterObject:](self->_netManager, "deregisterObject:", self);
  v3.receiver = self;
  v3.super_class = (Class)HMFHTTPClient;
  -[HMFHTTPClient dealloc](&v3, sel_dealloc);
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  void *v5;
  HMFAttributeDescription *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[HMFHTTPClient baseURL](self, "baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMFPrivateObjectFormatter defaultFormatter](HMFPrivateObjectFormatter, "defaultFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMFAttributeDescription initWithName:value:options:formatter:](v3, "initWithName:value:options:formatter:", CFSTR("URL"), v4, 0, v5);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFHTTPClient baseURL](self, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFHTTPClient session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ URL = %@, Session = %@, active = %d, pinging = %d, proxy = %d, reachable = %d>"), v4, v5, v7, -[HMFHTTPClient isActive](self, "isActive"), -[HMFHTTPClient isPinging](self, "isPinging"), -[HMFHTTPClient isProxy](self, "isProxy"), -[HMFHTTPClient isReachable](self, "isReachable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (HMFHTTPClientConfiguration)configuration
{
  return (HMFHTTPClientConfiguration *)(id)-[HMFHTTPClientConfiguration copy](self->_configuration, "copy");
}

- (unint64_t)options
{
  unint64_t v3;

  v3 = -[HMFHTTPClientConfiguration requiresEncryption](self->_configuration, "requiresEncryption");
  if (-[HMFHTTPClientConfiguration monitorsReachability](self->_configuration, "monitorsReachability"))
    v3 |= 2uLL;
  if (-[HMFHTTPClientConfiguration supportsWakeOnLAN](self->_configuration, "supportsWakeOnLAN"))
    return v3 | 4;
  else
    return v3;
}

- (NSURL)baseURL
{
  HMFNetService *netService;
  void *v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  const __CFString *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  HMFHTTPClient *v22;
  NSObject *v23;
  void *v24;
  const __CFString *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  netService = self->_netService;
  if (!netService)
    return self->_baseURL;
  -[HMFNetService hostName](netService, "hostName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetService addresses](self->_netService, "addresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMFNetService port](self->_netService, "port");
  if (objc_msgSend(v5, "count"))
    v7 = v6 == -1;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    if (-[HMFHTTPClientConfiguration requiresEncryption](self->_configuration, "requiresEncryption"))
      v11 = CFSTR("https");
    else
      v11 = CFSTR("http");
    if (v4)
    {
      v12 = v4;
    }
    else
    {
      objc_msgSend(v5, "firstObject");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    if (-[HMFHTTPClientConfiguration supportsWakeOnLAN](self->_configuration, "supportsWakeOnLAN"))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v14 = v5;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v15)
      {
        v16 = v15;
        v25 = v11;
        v17 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            if (objc_msgSend(v19, "addressFamily") == 1)
            {
              v20 = v19;

              v13 = v20;
              goto LABEL_26;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v16)
            continue;
          break;
        }
LABEL_26:
        v11 = v25;
      }

      if (objc_msgSend(v13, "addressFamily") != 1)
      {
        v21 = (void *)MEMORY[0x1A1AC355C]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier(v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v24;
          v32 = 2112;
          v33 = v13;
          _os_log_impl(&dword_19B546000, v23, OS_LOG_TYPE_INFO, "%{public}@No available IPv4 address, falling back to '%@', WoW may fail.", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
      }
    }
    +[HMFHTTPClient baseURLWithScheme:hostAddress:port:](HMFHTTPClient, "baseURLWithScheme:hostAddress:port:", v11, v13, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v8;
}

- (BOOL)isReachable
{
  HMFHTTPClient *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReachable:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  HMFHTTPClient *v6;
  void *v7;
  HMFHTTPClient *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_reachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_reachable = v3;
    if (!v3)
      self->_active = 0;
    os_unfair_lock_unlock(p_lock);
    v6 = self;
    v7 = (void *)MEMORY[0x1A1AC355C]();
    v8 = v6;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v8);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("unreachable");
      if (v3)
        v12 = CFSTR("reachable");
      v14 = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of reachablity change to %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMFHTTPClient delegate](v8, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v13, "clientDidBecomeReachable:", v8);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "clientDidBecomeUnreachable:", v8);
    }

  }
}

- (BOOL)isPinging
{
  HMFHTTPClient *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_pinging;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPinging:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_pinging = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)startReachabilityProbe
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HMFHTTPClient_startReachabilityProbe__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __39__HMFHTTPClient_startReachabilityProbe__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  HMFBlockOperation *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id location;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "isPublishing"))
    {
      v4 = (void *)MEMORY[0x1A1AC355C]();
      v5 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier(v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v7;
        _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Starting net service reachability resolution", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      v8 = objc_alloc_init(HMFBlockOperation);
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      objc_initWeak(&location, v8);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __39__HMFHTTPClient_startReachabilityProbe__block_invoke_66;
      v17 = &unk_1E3B38DD0;
      objc_copyWeak(&v19, &location);
      objc_copyWeak(&v20, (id *)buf);
      v18 = v3;
      -[HMFBlockOperation addExecutionBlock:](v8, "addExecutionBlock:", &v14);
      objc_msgSend(*(id *)(a1 + 32), "reachabilityProbeQueue", v14, v15, v16, v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addOperation:", v8);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isReachable")
           && (objc_msgSend(*(id *)(a1 + 32), "isPinging") & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1A1AC355C]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v13;
        _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Service is unreachable, performing a one-time ping", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      if ((objc_msgSend(*(id *)(a1 + 32), "requestClientReachabilityPingWithRetry:", 0) & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "setReachable:", 0);
    }
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "requestClientReachabilityPingWithRetry:", 1) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setReachable:", 0);
  }

}

void __39__HMFHTTPClient_startReachabilityProbe__block_invoke_66(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 48));
    v6 = (void *)MEMORY[0x1A1AC355C]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting confirmation for service: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__HMFHTTPClient_startReachabilityProbe__block_invoke_67;
    v12[3] = &unk_1E3B38858;
    objc_copyWeak(&v13, v2);
    objc_copyWeak(&v14, (id *)(a1 + 48));
    objc_msgSend(v11, "confirmWithTimeout:completionHandler:", v12, 15.0);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);

  }
}

void __39__HMFHTTPClient_startReachabilityProbe__block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = v6;
    if (v3)
    {
      v8 = objc_msgSend(v6, "isReachable");
      v9 = (void *)MEMORY[0x1A1AC355C]();
      v10 = v7;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v12)
        {
          HMFGetLogIdentifier(v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543362;
          v22 = v13;
          _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to confirm service, marking the client as unreachable", (uint8_t *)&v21, 0xCu);

        }
        objc_autoreleasePoolPop(v9);
        objc_msgSend(v10, "setReachable:", 0);
      }
      else
      {
        if (v12)
        {
          HMFGetLogIdentifier(v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543362;
          v22 = v20;
          _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to confirm service, the client is already unreachable", (uint8_t *)&v21, 0xCu);

        }
        objc_autoreleasePoolPop(v9);
      }
    }
    else
    {
      objc_msgSend(v6, "reachabilityProbeQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cancelAllOperations");

      objc_msgSend(v7, "delegatedPingTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v16 = (void *)MEMORY[0x1A1AC355C]();
        v17 = v7;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier(v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543362;
          v22 = v19;
          _os_log_impl(&dword_19B546000, v18, OS_LOG_TYPE_INFO, "%{public}@Confirmed service, requesting application ping", (uint8_t *)&v21, 0xCu);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(v17, "requestClientReachabilityPingWithRetry:", 1);
      }
    }
    objc_msgSend(v5, "finish");

  }
}

- (BOOL)requestClientReachabilityPingWithRetry:(BOOL)a3
{
  void *v5;
  char v6;
  _BOOL4 v7;
  void *v8;
  HMFHTTPClient *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  BOOL v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMFHTTPClient delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  if ((v6 & 1) != 0)
  {
    v7 = -[HMFHTTPClient isPinging](self, "isPinging");
    v8 = (void *)MEMORY[0x1A1AC355C]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        HMFGetLogIdentifier(v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v12;
        _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@Client ping in progress, dropping ping request", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
    }
    else
    {
      if (v11)
      {
        HMFGetLogIdentifier(v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v13;
        _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@Requesting client to perform a ping", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      -[HMFHTTPClient setPinging:](v9, "setPinging:", 1);
      objc_initWeak((id *)buf, v9);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __56__HMFHTTPClient_requestClientReachabilityPingWithRetry___block_invoke;
      v15[3] = &unk_1E3B38DF8;
      objc_copyWeak(&v16, (id *)buf);
      v17 = a3;
      objc_msgSend(v5, "client:didRequestPingWithCompletionHandler:", v9, v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }

  return v6 & 1;
}

void __56__HMFHTTPClient_requestClientReachabilityPingWithRetry___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(WeakRetained, "setPinging:", 0);
  if ((a2 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1A1AC355C](v5);
    v7 = WeakRetained;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v9;
      _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_INFO, "%{public}@Delegated ping succeeded, marking the client as reachable", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v7, "setReachable:", 1);
    objc_msgSend(v7, "stopDelegatedPingTimer");
  }
  else
  {
    v10 = objc_msgSend(WeakRetained, "isReachable");
    v11 = (void *)MEMORY[0x1A1AC355C]();
    v12 = WeakRetained;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v14)
      {
        HMFGetLogIdentifier(v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v15;
        _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Delegated ping failed, marking the client as unreachable", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v12, "setReachable:", 0);
    }
    else
    {
      if (v14)
      {
        HMFGetLogIdentifier(v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Delegated ping failed, the client is already unreachable", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
    }
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(v12, "startDelegatedPingTimer");
  }

}

- (void)startDelegatedPingTimer
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HMFHTTPClient_startDelegatedPingTimer__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __40__HMFHTTPClient_startDelegatedPingTimer__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_INFO, "%{public}@Going to attempt to retry delegated ping later", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegatedPingTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "timerFactory");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegatedPingTimer:", v9);

    objc_msgSend(*(id *)(a1 + 32), "delegatedPingTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegateQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    objc_msgSend(*(id *)(a1 + 32), "delegatedPingTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "delegatedPingTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

}

- (void)stopDelegatedPingTimer
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HMFHTTPClient_stopDelegatedPingTimer__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __39__HMFHTTPClient_stopDelegatedPingTimer__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegatedPingTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

  return objc_msgSend(*(id *)(a1 + 32), "setDelegatedPingTimer:", 0);
}

- (void)sendRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMFHTTPClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HMFHTTPClient_sendRequest_completionHandler___block_invoke;
  block[3] = &unk_1E3B38E70;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __47__HMFHTTPClient_sendRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(id *, void *, void *);
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _QWORD v26[4];
  uint64_t *v27;

  objc_msgSend(*(id *)(a1 + 32), "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markWithReason:", CFSTR("Resolving"));

  v4 = MEMORY[0x1E0C809B0];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __47__HMFHTTPClient_sendRequest_completionHandler___block_invoke_2;
  v19 = &unk_1E3B38E48;
  v5 = *(void **)(a1 + 40);
  v20 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 40);
  v22 = v6;
  v7 = v5;
  v8 = &v16;
  v9 = v8;
  if (v7)
  {
    v26[0] = v4;
    v26[1] = 3221225472;
    v26[2] = ____HMFHTTPClientGetBaseURL_block_invoke;
    v26[3] = &unk_1E3B38F58;
    v10 = v8;
    v27 = v10;
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AC373C](v26);
    objc_msgSend(v7, "netService", v16, v17, v18, v19, v20, v21, v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isResolved"))
    {
      v23[0] = v4;
      v23[1] = 3221225472;
      v23[2] = ____HMFHTTPClientGetBaseURL_block_invoke_2;
      v23[3] = &unk_1E3B38F80;
      v15 = v7;
      v24 = v15;
      v25 = v10;
      objc_msgSend(v15, "resolveWithCompletionHandler:", v23);

      v14 = v24;
    }
    else
    {
      objc_msgSend(v7, "baseURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v14, 0);
    }

  }
}

void __47__HMFHTTPClient_sendRequest_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(id, _QWORD, id);
  _QWORD v12[5];
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "markWithReason:", CFSTR("Resolved"));

  if (v5)
  {
    objc_msgSend(a1[5], "setActive:", 1);
    v10 = a1[4];
    v9 = a1[5];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__HMFHTTPClient_sendRequest_completionHandler___block_invoke_3;
    v12[3] = &unk_1E3B38E20;
    v12[4] = v9;
    v13 = a1[6];
    objc_msgSend(v9, "_sendRequest:baseURL:completionHandler:", v10, v5, v12);

  }
  else
  {
    v11 = (void (**)(id, _QWORD, id))a1[6];
    if (v11)
      v11[2](v11, 0, v6);
    objc_msgSend(a1[5], "startReachabilityProbe");
  }

}

void __47__HMFHTTPClient_sendRequest_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_18;
  v8 = v6;
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CB32E8];
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB32E8]) & 1) != 0)
  {
    v11 = objc_msgSend(v8, "code");

    if (v11 == -999)
    {
      v12 = (void *)MEMORY[0x1A1AC355C]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543362;
        v33 = v15;
        _os_log_impl(&dword_19B546000, v14, OS_LOG_TYPE_INFO, "%{public}@Request cancelled, reachability probe is not started", (uint8_t *)&v32, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      goto LABEL_18;
    }
  }
  else
  {

  }
  v16 = v8;
  objc_msgSend(v16, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", v10) & 1) != 0)
  {
    v18 = objc_msgSend(v16, "code");

    if (v18 == -1001)
    {
      v20 = objc_msgSend(*(id *)(a1 + 32), "isReachable");
      v21 = (void *)MEMORY[0x1A1AC355C]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v20)
      {
        if (v24)
        {
          HMFGetLogIdentifier(v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138543362;
          v33 = v25;
          _os_log_impl(&dword_19B546000, v23, OS_LOG_TYPE_INFO, "%{public}@Request timed out, marking the client as unreachable", (uint8_t *)&v32, 0xCu);

        }
        objc_autoreleasePoolPop(v21);
        v19 = objc_msgSend(*(id *)(a1 + 32), "setReachable:", 0);
      }
      else
      {
        if (v24)
        {
          HMFGetLogIdentifier(v22);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138543362;
          v33 = v31;
          _os_log_impl(&dword_19B546000, v23, OS_LOG_TYPE_INFO, "%{public}@Request timed out, the client is already unreachable", (uint8_t *)&v32, 0xCu);

        }
        objc_autoreleasePoolPop(v21);
      }
    }
  }
  else
  {

  }
  v26 = (void *)MEMORY[0x1A1AC355C](v19);
  v27 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543362;
    v33 = v29;
    _os_log_impl(&dword_19B546000, v28, OS_LOG_TYPE_INFO, "%{public}@Request failed, starting reachability probe", (uint8_t *)&v32, 0xCu);

  }
  objc_autoreleasePoolPop(v26);
  objc_msgSend(*(id *)(a1 + 32), "startReachabilityProbe");
LABEL_18:
  v30 = *(_QWORD *)(a1 + 40);
  if (v30)
    (*(void (**)(uint64_t, id, void *))(v30 + 16))(v30, v5, v7);

}

- (void)_sendRequest:(id)a3 baseURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  HMFHTTPClient *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMFHTTPClient *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  HMFHTTPClient *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "urlRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "setAllowsCellularAccess:", -[HMFHTTPClientConfiguration allowsCellularAccess](self->_configuration, "allowsCellularAccess"));
  v13 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v12, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "relativePath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLWithString:relativeToURL:", v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "baseURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "baseURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v17, "isEqual:", v19);

  if ((v20 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1A1AC355C]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v24;
      v47 = 2112;
      v48 = v16;
      _os_log_impl(&dword_19B546000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Override the request URL to: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v12, "setURL:", v16);
  }
  objc_msgSend(v12, "valueForHTTPHeaderField:", CFSTR("Host"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v9, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "host");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setValue:forHTTPHeaderField:", v27, CFSTR("Host"));
  }
  v28 = (void *)MEMORY[0x1A1AC355C]();
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v31;
    v47 = 2112;
    v48 = v12;
    _os_log_impl(&dword_19B546000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Sending request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  -[HMFHTTPClient session](v29, "session");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __56__HMFHTTPClient__sendRequest_baseURL_completionHandler___block_invoke;
  v42[3] = &unk_1E3B38E98;
  v42[4] = v29;
  v33 = v8;
  v43 = v33;
  v34 = v10;
  v44 = v34;
  objc_msgSend(v32, "dataTaskWithRequest:completionHandler:", v12, v42);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)MEMORY[0x1A1AC355C]();
  v37 = v29;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v39;
    v47 = 2112;
    v48 = v35;
    _os_log_impl(&dword_19B546000, v38, OS_LOG_TYPE_INFO, "%{public}@Resuming task: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v36);
  objc_msgSend(v33, "internal");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "activity");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "markWithReason:", CFSTR("Sending"));

  objc_msgSend(v35, "resume");
}

void __56__HMFHTTPClient__sendRequest_baseURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  HMFHTTPResponse *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  HMFHTTPResponse *v21;
  HMFHTTPResponse *v22;
  HMFHTTPResponse *v23;
  HMFHTTPResponse *v24;
  HMFHTTPResponse *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  HMFHTTPResponse *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1A1AC355C]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138544130;
    v37 = v13;
    v38 = 2112;
    v39 = v8;
    v40 = 2112;
    v41 = v14;
    v42 = 2112;
    v43 = v9;
    _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Received response, %@, to request, %@, with error: %@", (uint8_t *)&v36, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  v15 = v9;
  v16 = v15;
  if (v15)
    goto LABEL_4;
  v23 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  if (v25)
  {
    objc_msgSend(*(id *)(a1 + 40), "internal");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "responseWithStatusCode:", -[HMFHTTPResponse statusCode](v25, "statusCode"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMFHTTPResponse allHeaderFields](v25, "allHeaderFields");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHeaderFields:", v28);

    objc_msgSend(v27, "setBody:", v7);
    v22 = -[HMFHTTPResponse initWithRequest:internalResponse:]([HMFHTTPResponse alloc], "initWithRequest:internalResponse:", *(_QWORD *)(a1 + 40), v27);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 3, CFSTR("Invalid response scheme type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
LABEL_4:
      v17 = (void *)MEMORY[0x1A1AC355C]();
      v18 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(HMFHTTPResponse **)(a1 + 40);
        v36 = 138543874;
        v37 = v20;
        v38 = 2112;
        v39 = v21;
        v40 = 2112;
        v41 = v16;
        _os_log_impl(&dword_19B546000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send request, %@, with error: %@", (uint8_t *)&v36, 0x20u);

      }
      v22 = 0;
      goto LABEL_15;
    }
    v22 = 0;
  }
  v17 = (void *)MEMORY[0x1A1AC355C]();
  v18 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier(v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138543618;
    v37 = v29;
    v38 = 2112;
    v39 = v22;
    _os_log_impl(&dword_19B546000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Received response: %@", (uint8_t *)&v36, 0x16u);

  }
  v16 = 0;
LABEL_15:

  objc_autoreleasePoolPop(v17);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "internal");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "markWithReason:", CFSTR("Received response"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  -[HMFHTTPResponse internal](v22, "internal");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "activity");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "invalidate");

  objc_msgSend(*(id *)(a1 + 40), "internal");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activity");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "invalidate");

}

- (void)cancelPendingRequests
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HMFHTTPClient_cancelPendingRequests__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __38__HMFHTTPClient_cancelPendingRequests__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling all pending requests", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__HMFHTTPClient_cancelPendingRequests__block_invoke_90;
  v7[3] = &unk_1E3B38EC0;
  objc_copyWeak(&v8, (id *)buf);
  objc_msgSend(v6, "getAllTasksWithCompletionHandler:", v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __38__HMFHTTPClient_cancelPendingRequests__block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1A1AC355C]();
        v12 = WeakRetained;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v20 = v14;
          v21 = 2112;
          v22 = v10;
          _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_INFO, "%{public}@Canceling task: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v11);
        objc_msgSend(v10, "cancel");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v7);
  }

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__HMFHTTPClient_invalidate__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __27__HMFHTTPClient_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_INFO, "%{public}@Invalidating the client", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateAndCancel");

}

- (void)resolveWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  HMFNetService *netService;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_netService)
  {
    objc_initWeak(&location, self);
    netService = self->_netService;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__HMFHTTPClient_resolveWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E3B38F10;
    objc_copyWeak(&v9, &location);
    v8 = v5;
    -[HMFNetService resolveWithTimeout:completionHandler:](netService, "resolveWithTimeout:completionHandler:", v7, 15.0);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __46__HMFHTTPClient_resolveWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject **WeakRetained;
  NSObject **v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      v8 = WeakRetained[2];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __46__HMFHTTPClient_resolveWithCompletionHandler___block_invoke_2;
      v9[3] = &unk_1E3B38EE8;
      v11 = v7;
      v10 = v4;
      dispatch_async(v8, v9);

    }
  }

}

uint64_t __46__HMFHTTPClient_resolveWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)logCategory
{
  if (_MergedGlobals_3_12 != -1)
    dispatch_once(&_MergedGlobals_3_12, &__block_literal_global_93);
  return (id)qword_1ED012FB8;
}

void __28__HMFHTTPClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Networking.HTTP.Client"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012FB8;
  qword_1ED012FB8 = v0;

}

- (id)logIdentifier
{
  HMFNetService *netService;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  netService = self->_netService;
  if (netService)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[HMFNetService domain](netService, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFNetService type](self->_netService, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFNetService name](self->_netService, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@%@"), v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMFHTTPClient baseURL](self, "baseURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)networkMonitorIsReachable:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HMFHTTPClient_networkMonitorIsReachable___block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __43__HMFHTTPClient_networkMonitorIsReachable___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[7])
  {
    __HMFHTTPClientHandleReachabilityChange(v2, 1);
  }
  else
  {
    v3 = (void *)MEMORY[0x1A1AC355C]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_INFO, "%{public}@Received notification that the client is now reachable", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "setReachable:", 1);
  }
}

- (void)networkMonitorIsUnreachable:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HMFHTTPClient_networkMonitorIsUnreachable___block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __45__HMFHTTPClient_networkMonitorIsUnreachable___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[7])
  {
    __HMFHTTPClientHandleReachabilityChange(v2, 0);
  }
  else
  {
    v3 = (void *)MEMORY[0x1A1AC355C]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_INFO, "%{public}@Received notification that the client is no longer reachable", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "setReachable:", 0);
  }
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMFHTTPClient *v6;
  NSObject *v7;
  void *v8;
  HMFNetService *netService;
  void *v10;
  HMFHTTPClient *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x1A1AC355C]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v8;
    _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Delegated ping timer fired", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "suspend");
  netService = v6->_netService;
  if (!netService || -[HMFNetService isPublishing](netService, "isPublishing"))
  {
    v10 = (void *)MEMORY[0x1A1AC355C]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Retrying delegated ping", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    if (!-[HMFHTTPClient requestClientReachabilityPingWithRetry:](v11, "requestClientReachabilityPingWithRetry:", 1))
      -[HMFHTTPClient stopDelegatedPingTimer](v11, "stopDelegatedPingTimer");
  }

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMFHTTPClient *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC355C]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Session did become invalid with error: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  HMFHTTPClient *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMFHTTPClient *v16;
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
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = (void *)MEMORY[0x1A1AC355C]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v14;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Received challenge: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (-[HMFHTTPClientConfiguration allowsAnonymousConnection](v12->_configuration, "allowsAnonymousConnection")
    || -[HMFHTTPClient allowAnonymousConnection](v12, "allowAnonymousConnection"))
  {
    v15 = (void *)MEMORY[0x1A1AC355C]();
    v16 = v12;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v18;
      _os_log_impl(&dword_19B546000, v17, OS_LOG_TYPE_INFO, "%{public}@Received connection challenge, accepting the server's certificate as the client is set to allow anonymous connections", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v19 = (void *)MEMORY[0x1E0C92C60];
    objc_msgSend(v9, "protectionSpace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "credentialForTrust:", objc_msgSend(v20, "serverTrust"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v21);

  }
  else
  {
    v10[2](v10, 1, 0);
  }

}

- (HMFHTTPClientDelegate)delegate
{
  return (HMFHTTPClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMFNetService)netService
{
  return self->_netService;
}

- (BOOL)allowAnonymousConnection
{
  return self->_allowAnonymousConnection;
}

- (void)setAllowAnonymousConnection:(BOOL)a3
{
  self->_allowAnonymousConnection = a3;
}

- (NSURLSession)session
{
  return self->_session;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (HMFNetMonitor)reachabilityMonitor
{
  return self->_reachabilityMonitor;
}

- (NSOperationQueue)reachabilityProbeQueue
{
  return self->_reachabilityProbeQueue;
}

- (HMFNetManager)netManager
{
  return self->_netManager;
}

- (HMFTimer)delegatedPingTimer
{
  return self->_delegatedPingTimer;
}

- (void)setDelegatedPingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_delegatedPingTimer, a3);
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timerFactory, 0);
  objc_storeStrong((id *)&self->_delegatedPingTimer, 0);
  objc_storeStrong((id *)&self->_netManager, 0);
  objc_storeStrong((id *)&self->_reachabilityProbeQueue, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_netService, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
