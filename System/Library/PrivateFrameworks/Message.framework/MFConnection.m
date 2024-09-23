@implementation MFConnection

- (NSString)accountLogString
{
  return self->_accountLogString;
}

- (BOOL)isCellularConnection
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  MFConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MFConnection mf_lock](self, "mf_lock");
  v3 = -[MFNWConnectionWrapper isCellularConnection](self->_socket, "isCellularConnection");
  -[MFConnection mf_unlock](self, "mf_unlock");
  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109378;
    v6[1] = v3;
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_INFO, "#Network %d for %@", (uint8_t *)v6, 0x12u);
  }

  return v3;
}

- (void)dealloc
{
  char *buffer;
  z_stream *deflater;
  z_stream *inflater;
  char *zbuffer;
  objc_super v7;

  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  -[MFNWConnectionWrapper close](self->_socket, "close");
  deflater = self->_deflater;
  if (deflater)
  {
    deflateEnd(deflater);
    free(self->_deflater);
    self->_deflater = 0;
  }
  inflater = self->_inflater;
  if (inflater)
  {
    inflateEnd(inflater);
    free(self->_inflater);
    self->_inflater = 0;
  }
  zbuffer = self->_zbuffer;
  if (zbuffer)
    free(zbuffer);
  v7.receiver = self;
  v7.super_class = (Class)MFConnection;
  -[MFConnection dealloc](&v7, sel_dealloc);
}

- (MFConnection)init
{
  MFConnection *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFConnection;
  v2 = -[MFConnection init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D46090], "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addDiagnosticsGenerator:", v2);

    atomic_store(0, (unsigned __int8 *)&v2->_isFetching);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountLogString, 0);
  objc_storeStrong((id *)&self->_socket, 0);
  objc_storeStrong((id *)&self->_connectionSettings, 0);
  objc_storeStrong((id *)&self->_securityLayer, 0);
}

+ (void)initialize
{
  uint64_t v3;
  void *v4;

  if ((id)objc_opt_class() == a1)
  {
    if (!sLogLock)
    {
      _MFLockGlobalLock();
      if (!sLogLock)
      {
        v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D46140]), "initWithName:andDelegate:", CFSTR("logLock"), 0);
        v4 = (void *)sLogLock;
        sLogLock = v3;

      }
      _MFUnlockGlobalLock();
    }
    objc_msgSend(a1, "readLoggingDefaults");
    if (initialize_once != -1)
      dispatch_once(&initialize_once, &__block_literal_global_1);
  }
}

+ (void)readLoggingDefaults
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  CFIndex AppIntegerValue;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Boolean keyExistsAndHasValidFormat;

  objc_msgSend((id)sLogLock, "lock");
  v3 = (void *)sLogClasses;
  sLogClasses = 0;

  v4 = (void *)sLoggedPorts;
  sLoggedPorts = 0;

  v5 = (void *)sLoggedHosts;
  sLoggedHosts = 0;

  keyExistsAndHasValidFormat = 0;
  v6 = (const __CFString *)*MEMORY[0x1E0C9B248];
  v7 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v8 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0C9B248], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("LogActivityOnAllPorts"), v6, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat
    || (v10 = (const __CFString *)*MEMORY[0x1E0D4D820],
        CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0D4D820], v7, v8),
        AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("LogActivityOnAllPorts"), v10, &keyExistsAndHasValidFormat), keyExistsAndHasValidFormat))
  {
    sLogAllConnectionActivity = AppIntegerValue != 0;
    if (!AppIntegerValue)
      goto LABEL_4;
LABEL_17:
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", a1, 0);
    v17 = (void *)sLogClasses;
    sLogClasses = v16;

    goto LABEL_18;
  }
  if (sLogAllConnectionActivity)
    goto LABEL_17;
LABEL_4:
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringArrayForKey:", CFSTR("LogActivityOnPort"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringArrayForKey:", CFSTR("LogActivityOnHost"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (objc_msgSend(v11, "stringForKey:", CFSTR("LogActivityOnPort")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(",")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v12))
  {
    if (objc_msgSend(v12, "count"))
      objc_storeStrong((id *)&sLoggedPorts, v12);
  }
  if (v13
    || (objc_msgSend(v11, "stringForKey:", CFSTR("LogActivityOnHost")),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(",")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v13))
  {
    if (objc_msgSend(v13, "count"))
      objc_storeStrong((id *)&sLoggedHosts, v13);
  }

  if (sLogAllConnectionActivity || objc_msgSend((id)sLoggedPorts, "count") || objc_msgSend((id)sLoggedHosts, "count"))
    goto LABEL_17;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotificationName:object:", CFSTR("MFReloadNetworkLoggingNotification"), a1);

  objc_msgSend((id)sLogLock, "unlock");
}

void __26__MFConnection_initialize__block_invoke()
{
  NSObject *v0;

  v0 = MEMORY[0x1E0C80D38];
  notify_register_dispatch((const char *)*MEMORY[0x1E0D4D880], (int *)&initialize_token, MEMORY[0x1E0C80D38], &__block_literal_global_17);
  notify_register_dispatch((const char *)*MEMORY[0x1E0D4D868], (int *)&initialize_token, v0, &__block_literal_global_18);

}

uint64_t __26__MFConnection_initialize__block_invoke_2()
{
  return +[MFConnection readLoggingDefaults](MFConnection, "readLoggingDefaults");
}

uint64_t __26__MFConnection_initialize__block_invoke_3()
{
  return +[MFConnection readLoggingDefaults](MFConnection, "readLoggingDefaults");
}

+ (void)logConnection:(id)a3 type:(int64_t)a4 data:(id)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  const char *v11;
  id v12;
  void *v13;
  __CFString *i;
  __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  int v22;
  id v23;
  const char *v24;
  id *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v25 = (id *)a3;
  v23 = objc_retainAutorelease(a5);
  v7 = objc_msgSend(v23, "bytes");
  v8 = objc_msgSend(v23, "length");
  v9 = v8;
  if (v8 >= 0x400)
    v10 = 1024;
  else
    v10 = v8;
  if ((unint64_t)(a4 - 1) > 3)
    v11 = "CONNECTED";
  else
    v11 = off_1E4E88BD0[a4 - 1];
  v24 = v11;
  v12 = v25[2];
  objc_msgSend(v25[3], "securityProtocol");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":%@"), v13);
    i = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    i = &stru_1E4F1C8F8;
  }
  v15 = i;
  if (a4)
  {
    if (!v10)
      goto LABEL_22;
    goto LABEL_16;
  }
  MFLogNetwork();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = objc_opt_class();
    objc_msgSend(v12, "hostname");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136447490;
    v27 = v24;
    v28 = 2114;
    v29 = v17;
    v30 = 2048;
    v31 = v25;
    v32 = 2112;
    v33 = v18;
    v34 = 1024;
    v35 = objc_msgSend(v12, "portNumber");
    v36 = 2114;
    v37 = v15;
    _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_INFO, "%{public}s <%{public}@:%p> [%@:%u%{public}@]", buf, 0x3Au);

  }
  for (i = v15; v10; i = v15)
  {
LABEL_16:
    MFLogNetwork();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = objc_opt_class();
      objc_msgSend(v12, "hostname");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v12, "portNumber");
      *(_DWORD *)buf = 136448002;
      v27 = v24;
      v28 = 2114;
      v29 = v20;
      v30 = 2048;
      v31 = v25;
      v32 = 2112;
      v33 = v21;
      v34 = 1024;
      v35 = v22;
      v36 = 2114;
      v37 = v15;
      v38 = 1040;
      v39 = v10;
      v40 = 2096;
      v41 = v7;
      _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_INFO, "%{public}s <%{public}@:%p> [%@:%u%{public}@] %{mobilemail:networkData}.*P", buf, 0x4Au);

    }
    v7 += v10;
    v9 -= v10;
    if (v9 >= 0x400)
      v10 = 1024;
    else
      v10 = v9;
  }
LABEL_22:

}

+ (id)logClasses
{
  id v2;

  objc_msgSend((id)sLogLock, "lock");
  v2 = (id)sLogClasses;
  objc_msgSend((id)sLogLock, "unlock");
  return v2;
}

+ (void)setLogClasses:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend((id)sLogLock, "lock");
  objc_storeStrong((id *)&sLogClasses, a3);
  objc_msgSend((id)sLogLock, "unlock");

}

+ (BOOL)logAllSocketActivity
{
  return sLogAllConnectionActivity;
}

+ (void)setLogAllSocketActivity:(BOOL)a3
{
  sLogAllConnectionActivity = a3;
}

+ (id)logActivityOnPorts
{
  return (id)sLoggedPorts;
}

+ (void)setLogActivityOnPorts:(id)a3
{
  objc_storeStrong((id *)&sLoggedPorts, a3);
}

+ (id)logActivityOnHosts
{
  return (id)sLoggedHosts;
}

+ (void)setLogActivityOnHosts:(id)a3
{
  objc_storeStrong((id *)&sLoggedHosts, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MFConnection;
  -[MFConnection description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ _socket: %p\n"), v4, self->_socket);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (id)certUIPromptScheduler
{
  if (certUIPromptScheduler_onceToken != -1)
    dispatch_once(&certUIPromptScheduler_onceToken, &__block_literal_global_31);
  return (id)certUIPromptScheduler_scheduler;
}

void __37__MFConnection_certUIPromptScheduler__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.Message.CertUIPromptScheduler"), 17);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)certUIPromptScheduler_scheduler;
  certUIPromptScheduler_scheduler = v0;

}

- (BOOL)isConstrained
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[MFConnection mf_lock](self, "mf_lock");
  v3 = -[MFNWConnectionWrapper isConstrained](self->_socket, "isConstrained");
  -[MFConnection mf_unlock](self, "mf_unlock");
  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_INFO, "#Network low data mode (constrained): %d", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (BOOL)isFetching
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isFetching);
  return v2 & 1;
}

- (void)setIsFetching:(BOOL)a3
{
  BOOL *p_isFetching;
  unsigned __int8 v4;

  p_isFetching = &self->_isFetching;
  do
    v4 = __ldaxr((unsigned __int8 *)p_isFetching);
  while (__stlxr(a3, (unsigned __int8 *)p_isFetching));
  if (((((v4 & 1) == 0) ^ a3) & 1) == 0)
    -[MFConnection enableThroughputMonitoring:](self, "enableThroughputMonitoring:");
}

- (void)_setupSocketWithSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MFNWConnectionWrapper *socket;
  void *v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (!self->_socket)
    __assert_rtn("-[MFConnection _setupSocketWithSettings:]", "Connection.m", 480, "_socket");
  -[MFNWConnectionWrapper setConnectionServiceType:](self->_socket, "setConnectionServiceType:", objc_msgSend(v4, "connectionServiceType"));
  -[MFNWConnectionWrapper setAllowsTrustPrompt:](self->_socket, "setAllowsTrustPrompt:", objc_msgSend(v11, "allowsTrustPrompt"));
  -[MFNWConnectionWrapper setUsesOpportunisticSockets:](self->_socket, "setUsesOpportunisticSockets:", objc_msgSend(v11, "usesOpportunisticSockets"));
  objc_msgSend(v11, "sourceApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFNWConnectionWrapper setSourceApplicationBundleIdentifier:](self->_socket, "setSourceApplicationBundleIdentifier:", v5);

  objc_msgSend(v11, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFNWConnectionWrapper setAccountIdentifier:](self->_socket, "setAccountIdentifier:", v6);

  objc_msgSend(v11, "networkAccountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFNWConnectionWrapper setNetworkAccountIdentifier:](self->_socket, "setNetworkAccountIdentifier:", v7);

  -[MFNWConnectionWrapper setIsNonAppInitiated:](self->_socket, "setIsNonAppInitiated:", objc_msgSend(v11, "isNonAppInitiated"));
  objc_msgSend(v11, "clientCertificates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    socket = self->_socket;
    objc_msgSend(v11, "clientCertificates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFNWConnectionWrapper setClientCertificates:](socket, "setClientCertificates:", v10);

  }
  if (objc_msgSend(v11, "tryDirectSSL"))
    -[MFNWConnectionWrapper setSecurityProtocol:](self->_socket, "setSecurityProtocol:", *MEMORY[0x1E0C9B320]);

}

- (BOOL)connectUsingSettings:(id)a3
{
  id v5;
  MFConnectionSettings **p_connectionSettings;
  uint64_t v7;
  MFNWConnectionWrapper *v8;
  MFNWConnectionWrapper *socket;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  MFNWConnectionWrapper *v15;
  void *v16;
  void *v17;
  id v18;
  servent *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  MFNWConnectionWrapper *v49;
  void *v51;
  void *v52;
  void *v53;
  MFConnection *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  id location[2];

  v5 = a3;
  p_connectionSettings = &self->_connectionSettings;
  objc_storeStrong((id *)&self->_connectionSettings, a3);
  v7 = -[MFConnectionSettings portNumber](self->_connectionSettings, "portNumber");
  if (!self->_socket)
  {
    v8 = objc_alloc_init(MFNWConnectionWrapper);
    socket = self->_socket;
    self->_socket = v8;

    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    v10 = MEMORY[0x1E0C809B0];
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __37__MFConnection_connectUsingSettings___block_invoke;
    v62[3] = &unk_1E4E88B38;
    objc_copyWeak(&v63, location);
    -[MFNWConnectionWrapper setNetworkActivityChangeBlock:](self->_socket, "setNetworkActivityChangeBlock:", v62);
    v60[0] = v10;
    v60[1] = 3221225472;
    v60[2] = __37__MFConnection_connectUsingSettings___block_invoke_2;
    v60[3] = &unk_1E4E88B60;
    objc_copyWeak(&v61, location);
    -[MFNWConnectionWrapper setServerTrustHandler:](self->_socket, "setServerTrustHandler:", v60);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&v63);
    objc_destroyWeak(location);
  }
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setError:", 0);
  -[MFConnection _setupSocketWithSettings:](self, "_setupSocketWithSettings:", self->_connectionSettings);
  objc_msgSend(v11, "addCancelable:", self->_socket);
  if (!(_DWORD)v7)
  {
    -[MFConnectionSettings serviceName](*p_connectionSettings, "serviceName");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = getservbyname((const char *)objc_msgSend(v18, "UTF8String"), "tcp");

    if (!v19 || !LOWORD(v19->s_port))
    {
      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("DONT_KNOW_SERVICE_PORT"), CFSTR("Can’t determine port to use for the TCP/IP service “%@”."), CFSTR("Delayed"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFConnectionSettings serviceName](*p_connectionSettings, "serviceName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", v17, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1031, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setError:", v23);

      v7 = 0;
      v14 = 0;
      goto LABEL_11;
    }
    v7 = __rev16(LOWORD(v19->s_port));
  }
  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "inAirplaneMode");

  if ((v13 & 1) != 0)
  {
    v14 = 0;
    goto LABEL_12;
  }
  v15 = self->_socket;
  -[MFConnectionSettings hostname](self->_connectionSettings, "hostname");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "certUIService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MFNWConnectionWrapper connectToHost:withPort:service:](v15, "connectToHost:withPort:service:", v16, v7, v17);
LABEL_11:

LABEL_12:
  objc_msgSend(v11, "removeCancelable:", self->_socket);
  if (!v14)
  {
    v58 = v11;
    v59 = v5;
    -[MFNWConnectionWrapper error](self->_socket, "error");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", v25, objc_msgSend(v57, "code"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setError:", v26);

    v11 = v58;
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFConnectionSettings hostname](*p_connectionSettings, "hostname");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[MFConnectionSettings tryDirectSSL](*p_connectionSettings, "tryDirectSSL");
    v54 = self;
    v28 = v53;
    v55 = v56;
    objc_msgSend(v28, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = v55;
      objc_msgSend(v29, "domain");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend((id)*MEMORY[0x1E0CB2FE0], "isEqualToString:", v32);

      if (v33)
      {
        v34 = objc_msgSend(v30, "code");
        switch(v34)
        {
          case '<':
            v46 = (void *)MEMORY[0x1E0CB3940];
            MFLookupLocalizedString(CFSTR("CONNECTION_TIMED_OUT"), CFSTR("The connection to the server “%@” on port %d timed out."), CFSTR("Delayed"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "stringWithFormat:", v36, v55, v7);
            v37 = objc_claimAutoreleasedReturnValue();
            break;
          case '=':
            v51 = (void *)MEMORY[0x1E0CB3940];
            if (v27)
              MFLookupLocalizedString(CFSTR("MF_SSL_CONNECTION_FAILURE"), CFSTR("Mail was unable to connect to server “%@” using SSL on port %d. Verify that this server supports SSL and that your account settings are correct."), CFSTR("Delayed"));
            else
              MFLookupLocalizedString(CFSTR("CONNECTION_REFUSED"), CFSTR("The server “%@” refused to allow a connection on port %d."), CFSTR("Delayed"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "stringWithFormat:", v36, v55, v7);
            v37 = objc_claimAutoreleasedReturnValue();
            break;
          case 'A':
            v35 = (void *)MEMORY[0x1E0CB3940];
            MFLookupLocalizedString(CFSTR("HOST_UNREACHABLE"), CFSTR("The server “%@” cannot be contacted on port %d."), CFSTR("Delayed"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringWithFormat:", v36, v55, v7);
            v37 = objc_claimAutoreleasedReturnValue();
            break;
          default:
            v52 = (void *)MEMORY[0x1E0CB3940];
            if (v27)
            {
              MFLookupLocalizedString(CFSTR("MF_SSL_CONNECTION_FAILURE"), CFSTR("Mail was unable to connect to server “%@” using SSL on port %d. Verify that this server supports SSL and that your account settings are correct."), CFSTR("Delayed"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "stringWithFormat:", v36, v55, v7);
            }
            else
            {
              MFLookupLocalizedString(CFSTR("CONNECTION_FAILED"), CFSTR("The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings."), CFSTR("Delayed"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "stringWithFormat:", v36, v55);
            }
            v37 = objc_claimAutoreleasedReturnValue();
            break;
        }
        v39 = (void *)v37;
        goto LABEL_37;
      }
      objc_msgSend(v30, "domain");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend((id)*MEMORY[0x1E0CB31B0], "isEqualToString:", v41);

      if (!v42)
      {
        v39 = 0;
        goto LABEL_38;
      }
      -[MFNWConnectionWrapper serverCertificates](self->_socket, "serverCertificates");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      _setupSSLDomainError(v30, v55, v43);

      objc_msgSend(v30, "localizedDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39 || objc_msgSend(&stru_1E4F1C8F8, "isEqualToString:", v39))
      {
        v44 = (void *)MEMORY[0x1E0CB3940];
        MFLookupLocalizedString(CFSTR("MF_SSL_CONNECTION_FAILURE"), CFSTR("Mail was unable to connect to server “%@” using SSL on port %d. Verify that this server supports SSL and that your account settings are correct."), CFSTR("Delayed"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringWithFormat:", v36, v55, v7);
        v45 = objc_claimAutoreleasedReturnValue();

        v39 = (void *)v45;
LABEL_37:

      }
    }
    else
    {
      v31 = v55;
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, 0);
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setError:", v38);
      v39 = 0;
      v40 = 0;
      v30 = (void *)v38;
      if (!v38)
      {
LABEL_43:

        -[MFNWConnectionWrapper close](self->_socket, "close");
        v49 = self->_socket;
        self->_socket = 0;

        v5 = v59;
        goto LABEL_44;
      }
    }
LABEL_38:
    if ((objc_msgSend(v30, "mf_isUserCancelledError") & 1) != 0)
    {
      v40 = v30;
    }
    else
    {
      if (!v39)
      {
        v47 = (void *)MEMORY[0x1E0CB3940];
        MFLookupLocalizedString(CFSTR("CONNECTION_FAILED"), CFSTR("The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings."), CFSTR("Delayed"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringWithFormat:", v48, v31);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v30, "setLocalizedDescription:", v39);
      v40 = v30;
    }
    goto LABEL_43;
  }
  _logEvent(self, 0, 0, 0, 0x7FFFFFFFFFFFFFFFuLL, 0);
LABEL_44:

  return v14;
}

void __37__MFConnection_connectUsingSettings___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MFUserAgent();
  if (a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "networkActivityStarted:", WeakRetained);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "networkActivityEnded:", WeakRetained);
  }

}

uint64_t __37__MFConnection_connectUsingSettings___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_msgSend(WeakRetained, "_evaluateTrust:errorPtr:", a2, a3);

  return v6;
}

- (BOOL)connectUsingAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSString *v8;
  NSString *accountLogString;
  NSString *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternal");

  if (v6)
  {
    objc_msgSend(v4, "defaultConnectionSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hostname");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    accountLogString = self->_accountLogString;
    self->_accountLogString = v8;

  }
  else
  {
    objc_msgSend(v4, "identifier");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_accountLogString;
    self->_accountLogString = v10;
  }

  objc_msgSend(v4, "defaultConnectionSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MFConnection connectUsingSettings:](self, "connectUsingSettings:", v11);

  return v12;
}

+ (BOOL)shouldTryFallbacksAfterError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  int v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0C930A8]);

  if (!v5)
  {
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CB31B0]);

    if (v8)
    {
      v6 = objc_msgSend(v3, "code") != -9829;
      goto LABEL_8;
    }
LABEL_7:
    v6 = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "code") != 2 && objc_msgSend(v3, "code") != 1)
    goto LABEL_7;
  v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)connectUsingFallbacksForAccount:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  char v15;

  v4 = a3;
  objc_msgSend(v4, "defaultConnectionSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MFConnection connectUsingAccount:](self, "connectUsingAccount:", v4))
  {
    v6 = 1;
  }
  else
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && !objc_msgSend((id)objc_opt_class(), "shouldTryFallbacksAfterError:", v8))
    {
      v6 = 0;
    }
    else
    {

      objc_msgSend(v4, "alternateConnectionSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      if (v10)
      {
        v11 = 0;
        v12 = 1;
        do
        {
          if (v11 && !objc_msgSend((id)objc_opt_class(), "shouldTryFallbacksAfterError:", v11))
          {
            v8 = v11;
            goto LABEL_18;
          }
          objc_msgSend(v9, "objectAtIndex:", v12 - 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "applySettingsAsDefault:", v13);

          v14 = -[MFConnection connectUsingAccount:](self, "connectUsingAccount:", v4);
          objc_msgSend(v7, "error");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = v12++ >= v10 || v14;
          v11 = v8;
        }
        while ((v15 & 1) == 0);
        if (!v14)
          goto LABEL_18;
        v6 = 1;
      }
      else
      {
        v8 = 0;
LABEL_18:
        objc_msgSend(v4, "applySettingsAsDefault:", v5);
        v6 = 0;
      }

    }
  }

  return v6;
}

- (void)test_setSocket:(id)a3
{
  MFNWConnectionWrapper *v5;
  MFNWConnectionWrapper *socket;
  void *v7;

  v5 = (MFNWConnectionWrapper *)a3;
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("Connection.m"), 641, CFSTR("%s can only be called from unit tests"), "-[MFConnection test_setSocket:]");

  }
  socket = self->_socket;
  self->_socket = v5;

}

- (BOOL)authenticateUsingAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  ECSASLSecurityLayer *v10;
  void *securityLayer;
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

  v4 = a3;
  objc_msgSend(v4, "preferredAuthScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authenticatorForAccount:connection:", v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_6:
    LOBYTE(v9) = 0;
    goto LABEL_9;
  }
  -[MFConnection authenticationMechanisms](self, "authenticationMechanisms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saslName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    v9 = -[MFConnection authenticateUsingAccount:authenticator:](self, "authenticateUsingAccount:authenticator:", v4, v6);
    if (v9)
    {
      objc_msgSend(v6, "securityLayer");
      v10 = (ECSASLSecurityLayer *)objc_claimAutoreleasedReturnValue();
      securityLayer = self->_securityLayer;
      self->_securityLayer = v10;
LABEL_8:

      goto LABEL_9;
    }
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("AUTH_NOT_SUPPORTED_FORMAT"), CFSTR("The %@ server “%@” doesn’t support %@ authentication. Please check your account settings and try again."), CFSTR("Delayed"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "accountTypeString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hostname");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "preferredAuthScheme");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "humanReadableName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v15, v16, v17, v19);
      securityLayer = (void *)objc_claimAutoreleasedReturnValue();

      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1034, securityLayer);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setError:", v21);

      goto LABEL_8;
    }
    goto LABEL_6;
  }
LABEL_9:

  return v9;
}

- (NSArray)capabilities
{
  return 0;
}

- (NSArray)authenticationMechanisms
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MFConnection capabilities](self, "capabilities");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = objc_msgSend(v7, "rangeOfString:options:range:", CFSTR("AUTH="), 9, 0, objc_msgSend(v7, "length", (_QWORD)v14));
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = v8;
          if (!v3)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "substringFromIndex:", v9 + v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uppercaseString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  return (NSArray *)v3;
}

- (BOOL)loginDisabled
{
  return 0;
}

- (BOOL)usesOpportunisticSockets
{
  return -[MFNWConnectionWrapper usesOpportunisticSockets](self->_socket, "usesOpportunisticSockets");
}

- (BOOL)writeBytes:(const char *)a3 length:(unint64_t)a4 dontLogBytesInRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v10;
  id v11;
  z_stream_s *deflater;
  z_stream_s *v13;
  uInt v14;
  z_stream_s *v15;
  unint64_t v16;
  id v17;
  const char *v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  id v24;
  NSUInteger v25;
  const char *v26;
  int64_t v27;
  void *v28;
  BOOL v29;
  void *v30;
  MFNWConnectionWrapper *socket;
  MFConnection *v32;
  id v33;
  MFNWConnectionWrapper *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  BOOL v54;
  void *v56;
  NSUInteger v57;
  void *v58;
  const char *v59;
  const char *v60;
  unint64_t v61;
  MFConnection *v62;
  id v63;
  unsigned int v64;

  length = a5.length;
  location = a5.location;
  v10 = -[ECSASLSecurityLayer encryptionBufferSize](self->_securityLayer, "encryptionBufferSize");
  if (self->_compressionEnabled)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D46100]);
    deflater = self->_deflater;
    deflater->avail_in = a4;
    deflater->next_in = (Bytef *)a3;
    v13 = self->_deflater;
    do
    {
      v13->next_out = (Bytef *)self->_zbuffer;
      v14 = NSPageSize();
      v15 = self->_deflater;
      v15->avail_out = v14;
      if (deflate(v15, 2) == -2)
        __assert_rtn("-[MFConnection writeBytes:length:dontLogBytesInRange:]", "Connection.m", 712, "Z_STREAM_ERROR != err");
      objc_msgSend(v11, "appendBytes:length:", self->_zbuffer, NSPageSize() - self->_deflater->avail_out);
      v13 = self->_deflater;
    }
    while (!v13->avail_out);
    v16 = objc_msgSend(v11, "length");
    v17 = objc_retainAutorelease(v11);
    v18 = (const char *)objc_msgSend(v17, "bytes");
  }
  else
  {
    v17 = 0;
    v18 = a3;
    v16 = a4;
  }
  v61 = a4;
  if (v10)
  {
    v19 = objc_allocWithZone(MEMORY[0x1E0D46100]);
    v18 = 0;
    if (v10 >= v16)
      v20 = v16;
    else
      v20 = v10;
    v63 = (id)objc_msgSend(v19, "initWithCapacity:", v20 + 4);
    if (!v16)
      goto LABEL_32;
  }
  else
  {
    v63 = 0;
    v20 = v16;
    if (!v16)
    {
LABEL_32:
      if (v63)
        _logEvent(self, 4, (uint64_t)a3, v61, location, length);
      else
        _logEvent(self, 3, (uint64_t)a3, v61, location, length);
      v54 = 1;
      goto LABEL_58;
    }
  }
  v60 = &a3[v16];
  v58 = (void *)*MEMORY[0x1E0CB2FE0];
  v56 = (void *)*MEMORY[0x1E0CB31B0];
  v57 = location;
  v59 = a3;
  while (1)
  {
    v21 = v16;
    if (!v63)
      break;
    if (v20 >= v16)
      v22 = v16;
    else
      v22 = v20;
    -[ECSASLSecurityLayer createEncryptedDataForBytes:length:](self->_securityLayer, "createEncryptedDataForBytes:length:", &v60[-v16], v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setLength:", 0);
    if (v23)
    {
      v64 = -1431655766;
      v64 = bswap32(objc_msgSend(v23, "length")) >> 16;
      objc_msgSend(v63, "appendBytes:length:", &v64, 4);
      objc_msgSend(v63, "appendData:", v23);
    }
    v24 = objc_retainAutorelease(v63);
    v18 = (const char *)objc_msgSend(v24, "bytes");
    v21 = objc_msgSend(v24, "length");

    if (!v23)
      goto LABEL_55;
    if (v21)
      break;
LABEL_28:
    v29 = v16 > v20;
    if (v16 >= v20)
      v16 -= v20;
    else
      v16 = 0;
    a3 = v59;
    if (!v29)
      goto LABEL_32;
  }
  v25 = length;
  v26 = v18;
  while (1)
  {
    v27 = -[MFNWConnectionWrapper writeBytes:length:](self->_socket, "writeBytes:length:", v26, v21);
    if (v27 < 0)
      break;
    self->_lastUsedTime = CFAbsoluteTimeGetCurrent();
    if (!v27)
      break;
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "recordBytesWritten:", v27);
    v26 += v27;
    v21 -= v27;

    if (!v21)
    {
      length = v25;
      location = v57;
      goto LABEL_28;
    }
  }
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  socket = self->_socket;
  v32 = self;
  v33 = v30;
  v34 = socket;
  v62 = v32;
  -[MFNWConnectionWrapper error](v34, "error");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    -[MFNWConnectionWrapper error](v34, "error");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "domain");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFNWConnectionWrapper error](v34, "error");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", v37, objc_msgSend(v38, "code"), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = 0;
  }

  -[MFNWConnectionWrapper remoteHostname](v34, "remoteHostname");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, 0);
    v45 = 0;
    v46 = 0;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
      goto LABEL_54;
    goto LABEL_49;
  }
  objc_msgSend(v39, "domain");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v58, "isEqualToString:", v41);

  if (v42)
  {
    if (objc_msgSend(v39, "code") == 60)
    {
      v43 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("CONNECTION_TIMED_OUT"), CFSTR("The connection to the server “%@” on port %d timed out."), CFSTR("Delayed"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringWithFormat:", v44, v40, -[MFNWConnectionWrapper remotePortNumber](v34, "remotePortNumber"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:

      goto LABEL_49;
    }
    goto LABEL_48;
  }
  objc_msgSend(v39, "domain");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v56, "isEqualToString:", v47);

  if (!v48)
  {
LABEL_48:
    v45 = 0;
    goto LABEL_49;
  }
  -[MFNWConnectionWrapper serverCertificates](self->_socket, "serverCertificates");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  _setupSSLDomainError(v39, v40, v49);

  objc_msgSend(v39, "localizedDescription");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v45 || objc_msgSend(&stru_1E4F1C8F8, "isEqualToString:", v45))
  {
    v50 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("SSL_GENERIC_WRITE_ERROR"), CFSTR("An SSL error occurred while trying to provide data to the server “%@”. Verify that this server supports SSL and that your account settings are correct."), CFSTR("Delayed"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stringWithFormat:", v44, v40);
    v51 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)v51;
    goto LABEL_47;
  }
LABEL_49:
  if ((objc_msgSend(v39, "mf_isUserCancelledError") & 1) != 0)
  {
    v46 = v39;
  }
  else
  {
    if (!v45)
    {
      v52 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("CONNECTION_FAILED"), CFSTR("The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings."), CFSTR("Delayed"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stringWithFormat:", v53, v40);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v39, "setLocalizedDescription:", v45);
    v46 = v39;
  }
LABEL_54:
  objc_msgSend(v33, "setError:", v46);

  -[MFNWConnectionWrapper close](self->_socket, "close");
LABEL_55:
  v54 = 0;
LABEL_58:

  return v54;
}

- (BOOL)writeData:(id)a3 dontLogBytesInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a4.length;
  location = a4.location;
  v7 = objc_retainAutorelease(a3);
  LOBYTE(length) = -[MFConnection writeBytes:length:dontLogBytesInRange:](self, "writeBytes:length:dontLogBytesInRange:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), location, length);

  return length;
}

- (BOOL)writeData:(id)a3
{
  return -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", a3, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)setDesiredReadBufferLength:(unint64_t)a3
{
  self->_desiredBufferLength = a3;
}

- (void)startActivity
{
  -[MFNWConnectionWrapper startActivity](self->_socket, "startActivity");
}

- (void)stopActivity
{
  -[MFNWConnectionWrapper stopActivity](self->_socket, "stopActivity");
}

- (void)enableThroughputMonitoring:(BOOL)a3
{
  -[MFNWConnectionWrapper enableThroughputMonitoring:](self->_socket, "enableThroughputMonitoring:", a3);
}

- (void)logReadChars:(const char *)a3 length:(unint64_t)a4
{
  if (a4)
    self->_readBytesNotLogged -= a4;
}

- (BOOL)readLineIntoData:(id)a3
{
  id v4;
  BOOL v5;
  int v6;
  unint64_t bufferRemainingBytes;
  char *buffer;
  unint64_t bufferStart;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  _BOOL4 v13;
  unint64_t v14;

  v4 = a3;
  v5 = 0;
  v6 = 1;
  do
  {
    if (!self->_bufferRemainingBytes)
      v6 = _fillBuffer(self);
    if ((v6 & 1) == 0)
      break;
    bufferRemainingBytes = self->_bufferRemainingBytes;
    if (bufferRemainingBytes)
    {
      buffer = self->_buffer;
      bufferStart = self->_bufferStart;
      if (v5 && buffer[bufferStart] == 10)
      {
        v10 = 0;
        v11 = 1;
      }
      else if (bufferRemainingBytes < 2)
      {
LABEL_13:
        v11 = 0;
        v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v10 = 0;
        while (*(_WORD *)&buffer[bufferStart + v10] != 2573)
        {
          if (bufferRemainingBytes - 1 == ++v10)
            goto LABEL_13;
        }
        v11 = 2;
      }
      v12 = v10 != 0x7FFFFFFFFFFFFFFFLL;
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = buffer[bufferRemainingBytes - 1 + bufferStart] == 13;
      }
      else
      {
        v13 = 0;
        bufferRemainingBytes = v10 + v11;
      }
      objc_msgSend(v4, "appendBytes:length:", &buffer[bufferStart], bufferRemainingBytes);
      v14 = self->_bufferStart + bufferRemainingBytes;
      self->_bufferRemainingBytes -= bufferRemainingBytes;
      self->_bufferStart = v14;
      v5 = v13;
      if (v12)
        break;
    }
  }
  while (((v6 ^ 1) & 1) == 0);

  return v6 & 1;
}

- (BOOL)readBytesIntoData:(id)a3 desiredLength:(unint64_t)a4
{
  id v6;
  int64_t bufferRemainingBytes;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;

  v6 = a3;
  while (a4)
  {
    bufferRemainingBytes = self->_bufferRemainingBytes;
    if (!bufferRemainingBytes)
    {
      if (!_fillBuffer(self))
      {
        v10 = 0;
        goto LABEL_12;
      }
      bufferRemainingBytes = self->_bufferRemainingBytes;
    }
    if (bufferRemainingBytes >= 1)
    {
      if (bufferRemainingBytes >= a4)
        v8 = a4;
      else
        v8 = bufferRemainingBytes;
      objc_msgSend(v6, "appendBytes:length:", &self->_buffer[self->_bufferStart], v8);
      v9 = self->_bufferStart + v8;
      self->_bufferRemainingBytes -= v8;
      self->_bufferStart = v9;
      a4 -= v8;
    }
  }
  v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Internal error: -[%@ %@] needs to be implemented in a concrete subclass."), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setError:", v11);

  return 0;
}

- (BOOL)startTLSForAccount:(id)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Internal error: -[%@ %@] needs to be implemented in a concrete subclass."), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setError:", v10);

  return 0;
}

- (BOOL)enableSSL
{
  -[MFConnection _clearBuffer](self, "_clearBuffer");
  return -[MFNWConnectionWrapper setSecurityProtocol:](self->_socket, "setSecurityProtocol:", *MEMORY[0x1E0C9B320]);
}

- (void)_clearBuffer
{
  int64_t *p_bufferRemainingBytes;
  NSObject *v3;
  int64_t v4;
  int v5;
  int64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  p_bufferRemainingBytes = &self->_bufferRemainingBytes;
  if (self->_bufferRemainingBytes >= 1)
  {
    MFLogNetwork();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *p_bufferRemainingBytes;
      v5 = 134217984;
      v6 = v4;
      _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "Making sure buffer is empty, currently has %lu bytes", (uint8_t *)&v5, 0xCu);
    }

    *p_bufferRemainingBytes = 0;
    p_bufferRemainingBytes[1] = 0;
  }
}

- (NSString)securityProtocol
{
  MFNWConnectionWrapper *socket;
  id v3;

  socket = self->_socket;
  if (socket)
  {
    -[MFNWConnectionWrapper securityProtocol](socket, "securityProtocol");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (id)*MEMORY[0x1E0C9B328];
  }
  return (NSString *)v3;
}

- (BOOL)startCompression
{
  z_stream *v3;
  z_stream_s *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  z_stream *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL result;
  size_t v24;

  v3 = (z_stream *)malloc_type_malloc(0x70uLL, 0x10B0040E8CA615DuLL);
  if (!v3)
    -[MFConnection startCompression].cold.1();
  v4 = v3;
  v3->zalloc = 0;
  v3->zfree = 0;
  v3->opaque = 0;
  v5 = deflateInit2_(v3, -1, 8, -15, 8, 0, "1.2.12", 112);
  if ((_DWORD)v5)
  {
    v6 = v5;
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MFConnection startCompression].cold.4(v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_9:

    free(v4);
    -[MFConnection endCompression](self, "endCompression");
    return 0;
  }
  self->_deflater = v4;
  v14 = (z_stream *)malloc_type_malloc(0x70uLL, 0x10B0040E8CA615DuLL);
  if (!v14)
    -[MFConnection startCompression].cold.2();
  v4 = v14;
  v14->avail_in = 0;
  v14->next_in = 0;
  v14->zfree = 0;
  v14->opaque = 0;
  v14->zalloc = 0;
  v15 = inflateInit2_(v14, -15, "1.2.12", 112);
  if ((_DWORD)v15)
  {
    v16 = v15;
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MFConnection startCompression].cold.3(v16, v7, v17, v18, v19, v20, v21, v22);
    goto LABEL_9;
  }
  self->_inflater = v4;
  v24 = NSPageSize();
  self->_zbuffer = (char *)malloc_type_malloc(v24, 0x989ABB19uLL);
  result = 1;
  self->_compressionEnabled = 1;
  return result;
}

- (void)endCompression
{
  z_stream *deflater;
  z_stream *inflater;
  char *zbuffer;

  self->_compressionEnabled = 0;
  deflater = self->_deflater;
  if (deflater)
  {
    deflateEnd(deflater);
    free(self->_deflater);
    self->_deflater = 0;
  }
  inflater = self->_inflater;
  if (inflater)
  {
    inflateEnd(inflater);
    free(self->_inflater);
    self->_inflater = 0;
  }
  zbuffer = self->_zbuffer;
  if (zbuffer)
  {
    free(zbuffer);
    self->_zbuffer = 0;
  }
}

- (BOOL)isValid
{
  MFNWConnectionWrapper *socket;

  socket = self->_socket;
  if (socket)
    LOBYTE(socket) = -[MFNWConnectionWrapper isValid](socket, "isValid");
  return (char)socket;
}

- (void)disconnect
{
  MFNWConnectionWrapper *socket;

  -[MFNWConnectionWrapper close](self->_socket, "close");
  socket = self->_socket;
  self->_socket = 0;

  -[MFConnection endCompression](self, "endCompression");
}

- (BOOL)hasBytesAvailable
{
  return self->_bufferRemainingBytes > 0 || -[MFNWConnectionWrapper isReadable](self->_socket, "isReadable");
}

- (double)lastUsedTime
{
  return self->_lastUsedTime;
}

- (id)connectionSettings
{
  return self->_connectionSettings;
}

- (void)setConnectionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_connectionSettings, a3);
}

- (BOOL)_certificateIsTrustedForAccount:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "valueInAccountPropertiesForKey:", CFSTR("MFServerSSLCertificateIsTrusted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)_setCertificateIsTrusted:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValueInAccountProperties:forKey:", v5, CFSTR("MFServerSSLCertificateIsTrusted"));

  objc_msgSend(v6, "savePersistentAccount");
}

- (BOOL)_evaluateTrust:(__SecTrust *)a3 errorPtr:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  _BYTE *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  MFNWConnectionWrapper *socket;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  BOOL v33;
  _QWORD v35[4];
  id v36;
  MFConnection *v37;
  id v38;
  id v39;
  uint64_t *v40;
  _BYTE *v41;
  __SecTrust *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[2];
  _QWORD v50[2];
  uint8_t v51[4];
  MFNWConnectionWrapper *v52;
  __int16 v53;
  uint64_t v54;
  _BYTE buf[24];
  int v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48 = 0;
  -[MFNWConnectionWrapper service](self->_socket, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();

  -[MFNWConnectionWrapper accountIdentifier](self->_socket, "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "existingAccountForUniqueID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[MFConnection _certificateIsTrustedForAccount:](self, "_certificateIsTrustedForAccount:", v10);
  objc_msgSend(MEMORY[0x1E0D0D588], "defaultTrustManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFNWConnectionWrapper remoteHostname](self->_socket, "remoteHostname");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFNWConnectionWrapper service](self->_socket, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "rawTrustResultForSSLTrust:hostname:service:", a3, v13, v14);

  MFLogNetwork();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_opt_class();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 1024;
    v56 = v15;
    v57 = 2112;
    v58 = v10;
    _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Got SecTrustResultType %u for %@", buf, 0x26u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v56) = 0;
  switch(v15)
  {
    case 1:
      LOBYTE(v56) = 1;
      break;
    case 5:
      if (-[MFNWConnectionWrapper allowsTrustPrompt](self->_socket, "allowsTrustPrompt"))
      {
        v19 = objc_alloc_init(MEMORY[0x1E0D0D580]);
        -[MFNWConnectionWrapper remoteHostname](self->_socket, "remoteHostname");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setHost:", v20);

        -[MFNWConnectionWrapper service](self->_socket, "service");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setService:", v21);

        objc_msgSend(v19, "setTrust:", a3);
        if (v11)
        {
          v22 = *MEMORY[0x1E0D0D5A8];
          v49[0] = *MEMORY[0x1E0D0D5B0];
          v49[1] = v22;
          v50[0] = MEMORY[0x1E0C9AAA0];
          v50[1] = MEMORY[0x1E0C9AAA0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
        +[MFConnection certUIPromptScheduler](MFConnection, "certUIPromptScheduler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __40__MFConnection__evaluateTrust_errorPtr___block_invoke;
        v35[3] = &unk_1E4E88BB0;
        v36 = v10;
        v37 = self;
        v40 = &v43;
        v41 = buf;
        v30 = v19;
        v38 = v30;
        v31 = v23;
        v39 = v31;
        v42 = a3;
        objc_msgSend(v29, "performSyncBlock:", v35);

        if (a4)
        {
          v32 = (void *)v44[5];
          if (v32)
            *a4 = objc_retainAutorelease(v32);
        }

      }
      break;
    case 4:
      if (v11)
      {
        v18 = buf;
      }
      else
      {
        -[MFConnection _setCertificateIsTrusted:forAccount:](self, "_setCertificateIsTrusted:forAccount:", 1, v10);
        v18 = *(_BYTE **)&buf[8];
      }
      v18[24] = 1;
      break;
    default:
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", *MEMORY[0x1E0CB31B0], -9825, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v44[5];
      v44[5] = v24;

      MFLogNetwork();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        socket = self->_socket;
        v28 = v44[5];
        *(_DWORD *)v51 = 134218242;
        v52 = socket;
        v53 = 2112;
        v54 = v28;
        _os_log_impl(&dword_1A4F90000, v26, OS_LOG_TYPE_DEFAULT, "trust manager said DENY for connection %p (error: %@)", v51, 0x16u);
      }

      break;
  }
  v33 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v43, 8);
  return v33;
}

void __40__MFConnection__evaluateTrust_errorPtr___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  dispatch_semaphore_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "allowsTrustPrompt") & 1) != 0)
  {
    v2 = dispatch_semaphore_create(0);
    v3 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__MFConnection__evaluateTrust_errorPtr___block_invoke_75;
    v13[3] = &unk_1E4E88B88;
    v17 = *(_QWORD *)(a1 + 72);
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 40);
    v14 = v5;
    v15 = v7;
    v8 = *(_QWORD *)(a1 + 80);
    v18 = v6;
    v19 = v8;
    v16 = v2;
    v9 = v2;
    objc_msgSend(v3, "showPromptWithOptions:responseBlock:", v4, v13);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    MFLogNetwork();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 134218242;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "Supressing trust prompt as user denied earlier for connection %p (error: %@).", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }
}

intptr_t __40__MFConnection__evaluateTrust_errorPtr___block_invoke_75(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  switch(a2)
  {
    case 2:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v9 = a1 + 40;
      objc_msgSend(*(id *)(a1 + 40), "_setCertificateIsTrusted:forAccount:", 1, *(_QWORD *)(a1 + 32));
      objc_msgSend(MEMORY[0x1E0D0D588], "defaultTrustManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 72);
      objc_msgSend(*(id *)(*(_QWORD *)v9 + 24), "remoteHostname");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "service");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allowTrust:forHost:service:", v11, v12, v13);

      break;
    case 1:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      break;
    case 0:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      objc_msgSend(*(id *)(a1 + 32), "setAllowsTrustPrompt:", 0);
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", *MEMORY[0x1E0CB31B0], -9825, 0);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

      MFLogNetwork();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
        v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v15 = 134218242;
        v16 = v7;
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "user said DENY for connection %p (error: %@). Supressing trust prompt till maild restarts", (uint8_t *)&v15, 0x16u);
      }

      break;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)copyDiagnosticInformation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[MFConnection mf_lock](self, "mf_lock");
  objc_msgSend(v3, "appendString:", CFSTR("\n==== Connection State ====\n"));
  -[MFNWConnectionWrapper remoteHostname](self->_socket, "remoteHostname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    Host: %@\n"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("    Port Number: %u\n"), -[MFNWConnectionWrapper remotePortNumber](self->_socket, "remotePortNumber"));
  -[MFNWConnectionWrapper securityProtocol](self->_socket, "securityProtocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    SSL Version: %@\n"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("    Socket: %@\n"), self->_socket);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    Thread: %p\n"), v6);

  -[MFConnection mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)startCompression
{
  OUTLINED_FUNCTION_0_0(&dword_1A4F90000, a2, a3, "deflateInit2 failed with error %d", a5, a6, a7, a8, 0);
}

@end
