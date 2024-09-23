@implementation MFConnection

+ (void)readLoggingDefaults
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  CFIndex AppIntegerValue;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  Boolean keyExistsAndHasValidFormat;

  objc_msgSend((id)_LogLock, "lock");

  _LogClasses = 0;
  _LoggedPorts = 0;

  _LoggedHosts = 0;
  keyExistsAndHasValidFormat = 0;
  v3 = (const __CFString *)*MEMORY[0x1E0C9B248];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0C9B248], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("LogActivityOnAllPorts"), v3, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat
    || (v7 = (const __CFString *)*MEMORY[0x1E0D4D820],
        CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0D4D820], v4, v5),
        AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("LogActivityOnAllPorts"), v7, &keyExistsAndHasValidFormat), keyExistsAndHasValidFormat))
  {
    _LogAllConnectionActivity = AppIntegerValue != 0;
    if (AppIntegerValue)
      goto LABEL_13;
  }
  else if (_LogAllConnectionActivity)
  {
    goto LABEL_13;
  }
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_msgSend(v8, "stringArrayForKey:", CFSTR("LogActivityOnPort"));
  v10 = (void *)objc_msgSend(v8, "stringArrayForKey:", CFSTR("LogActivityOnHost"));
  if (v9
    || (v9 = (void *)objc_msgSend((id)objc_msgSend(v8, "stringForKey:", CFSTR("LogActivityOnPort")), "componentsSeparatedByString:", CFSTR(","))) != 0)
  {
    if (objc_msgSend(v9, "count"))
      _LoggedPorts = v9;
  }
  if (v10
    || (v10 = (void *)objc_msgSend((id)objc_msgSend(v8, "stringForKey:", CFSTR("LogActivityOnHost")), "componentsSeparatedByString:", CFSTR(","))) != 0)
  {
    if (objc_msgSend(v10, "count"))
      _LoggedHosts = v10;
  }
LABEL_13:
  if (_LogAllConnectionActivity || objc_msgSend((id)_LoggedPorts, "count") || objc_msgSend((id)_LoggedHosts, "count"))
    _LogClasses = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", a1, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("MFReloadNetworkLoggingNotification"), a1);
  objc_msgSend((id)_LogLock, "unlock");
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (!_LogLock)
    {
      _MFLockGlobalLock();
      if (!_LogLock)
        _LogLock = objc_msgSend(objc_alloc(MEMORY[0x1E0D46140]), "initWithName:andDelegate:", CFSTR("logLock"), 0);
      _MFUnlockGlobalLock();
    }
    objc_msgSend(a1, "readLoggingDefaults");
    if (initialize_once != -1)
      dispatch_once(&initialize_once, &__block_literal_global_1);
  }
}

uint64_t __26__MFConnection_initialize__block_invoke()
{
  NSObject *v0;

  v0 = MEMORY[0x1E0C80D38];
  notify_register_dispatch((const char *)*MEMORY[0x1E0D4D880], (int *)&initialize_token, MEMORY[0x1E0C80D38], &__block_literal_global_17);
  return notify_register_dispatch((const char *)*MEMORY[0x1E0D4D868], (int *)&initialize_token, v0, &__block_literal_global_18);
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
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const __CFString *v20;
  const char *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a5, "bytes");
  v9 = objc_msgSend(a5, "length");
  v10 = v9;
  if (v9 >= 0x400)
    v11 = 1024;
  else
    v11 = v9;
  if ((unint64_t)(a4 - 1) > 3)
    v12 = "CONNECTED";
  else
    v12 = off_1E81CA058[a4 - 1];
  v21 = v12;
  v13 = (void *)*((_QWORD *)a3 + 2);
  v14 = objc_msgSend(*((id *)a3 + 3), "securityProtocol");
  if (v14)
  {
    v20 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":%@"), v14);
    if (a4)
      goto LABEL_13;
  }
  else
  {
    v20 = &stru_1E81CBE50;
    if (a4)
      goto LABEL_13;
  }
  v15 = MFLogNetwork();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136447490;
    v23 = v21;
    v24 = 2114;
    v25 = objc_opt_class();
    v26 = 2048;
    v27 = a3;
    v28 = 2112;
    v29 = objc_msgSend(v13, "hostname");
    v30 = 1024;
    v31 = objc_msgSend(v13, "portNumber");
    v32 = 2114;
    v33 = v20;
    _os_log_impl(&dword_1C8839000, v15, OS_LOG_TYPE_INFO, "%{public}s <%{public}@:%p> [%@:%u%{public}@]", buf, 0x3Au);
  }
LABEL_13:
  while (v11)
  {
    v16 = MFLogNetwork();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_opt_class();
      v18 = objc_msgSend(v13, "hostname");
      v19 = objc_msgSend(v13, "portNumber");
      *(_DWORD *)buf = 136448002;
      v23 = v21;
      v24 = 2114;
      v25 = v17;
      v26 = 2048;
      v27 = a3;
      v28 = 2112;
      v29 = v18;
      v30 = 1024;
      v31 = v19;
      v32 = 2114;
      v33 = v20;
      v34 = 1040;
      v35 = v11;
      v36 = 2096;
      v37 = v8;
      _os_log_impl(&dword_1C8839000, v16, OS_LOG_TYPE_INFO, "%{public}s <%{public}@:%p> [%@:%u%{public}@] %{mobilemail:networkData}.*P", buf, 0x4Au);
    }
    v8 += v11;
    v10 -= v11;
    if (v10 >= 0x400)
      v11 = 1024;
    else
      v11 = v10;
  }
}

+ (id)logClasses
{
  id v2;

  objc_msgSend((id)_LogLock, "lock");
  v2 = (id)_LogClasses;
  objc_msgSend((id)_LogLock, "unlock");
  return v2;
}

+ (void)setLogClasses:(id)a3
{
  objc_msgSend((id)_LogLock, "lock");

  _LogClasses = (uint64_t)a3;
  objc_msgSend((id)_LogLock, "unlock");
}

+ (BOOL)logAllSocketActivity
{
  return _LogAllConnectionActivity;
}

+ (void)setLogAllSocketActivity:(BOOL)a3
{
  _LogAllConnectionActivity = a3;
}

+ (id)logActivityOnPorts
{
  return (id)_LoggedPorts;
}

+ (void)setLogActivityOnPorts:(id)a3
{
  id v4;

  v4 = a3;

  _LoggedPorts = (uint64_t)a3;
}

+ (id)logActivityOnHosts
{
  return (id)_LoggedHosts;
}

+ (void)setLogActivityOnHosts:(id)a3
{
  id v4;

  v4 = a3;

  _LoggedHosts = (uint64_t)a3;
}

- (MFConnection)init
{
  MFConnection *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFConnection;
  v2 = -[MFConnection init](&v4, sel_init);
  if (v2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D46090], "sharedController"), "addDiagnosticsGenerator:", v2);
  return v2;
}

- (void)dealloc
{
  char *buffer;
  _MFSocket *socket;
  z_stream *deflater;
  z_stream *inflater;
  char *zbuffer;
  objc_super v8;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D46090], "sharedController"), "removeDiagnosticsGenerator:", self);
  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  socket = self->_socket;
  if (socket)
  {
    -[_MFSocket abort](socket, "abort");

  }
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

  v8.receiver = self;
  v8.super_class = (Class)MFConnection;
  -[MFConnection dealloc](&v8, sel_dealloc);
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFConnection;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ _socket: %p\n"), -[MFConnection description](&v3, sel_description), self->_socket);
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
  v3 = -[_MFSocket isCellularConnection](self->_socket, "isCellularConnection");
  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109378;
    v6[1] = v3;
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1C8839000, v4, OS_LOG_TYPE_INFO, "#Network %d for %@", (uint8_t *)v6, 0x12u);
  }
  return v3;
}

- (BOOL)isFetching
{
  return *((_BYTE *)self + 108) & 1;
}

- (void)setIsFetching:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)self + 108);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 108) = v3 & 0xFE | a3;
    -[MFConnection enableThroughputMonitoring:](self, "enableThroughputMonitoring:");
  }
}

- (void)_setupSocketWithSettings:(id)a3
{
  _MFSocket *socket;

  socket = self->_socket;
  if (!socket)
    -[MFConnection _setupSocketWithSettings:].cold.1();
  -[_MFSocket setConnectionServiceType:](socket, "setConnectionServiceType:", objc_msgSend(a3, "connectionServiceType"));
  -[_MFSocket setAllowsTrustPrompt:](self->_socket, "setAllowsTrustPrompt:", objc_msgSend(a3, "allowsTrustPrompt"));
  -[_MFSocket setUsesOpportunisticSockets:](self->_socket, "setUsesOpportunisticSockets:", objc_msgSend(a3, "usesOpportunisticSockets"));
  -[_MFSocket setSourceApplicationBundleIdentifier:](self->_socket, "setSourceApplicationBundleIdentifier:", objc_msgSend(a3, "sourceApplicationBundleIdentifier"));
  -[_MFSocket setAccountIdentifier:](self->_socket, "setAccountIdentifier:", objc_msgSend(a3, "accountIdentifier"));
  -[_MFSocket setNetworkAccountIdentifier:](self->_socket, "setNetworkAccountIdentifier:", objc_msgSend(a3, "networkAccountIdentifier"));
  if (objc_msgSend(a3, "clientCertificates"))
    -[_MFSocket setClientCertificates:](self->_socket, "setClientCertificates:", objc_msgSend(a3, "clientCertificates"));
  if (objc_msgSend(a3, "tryDirectSSL"))
    -[_MFSocket setSecurityProtocol:](self->_socket, "setSecurityProtocol:", *MEMORY[0x1E0C9B320]);
}

- (BOOL)connectUsingSettings:(id)a3
{
  MFConnectionSettings *v5;
  uint64_t v6;
  BOOL result;
  servent *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSString *v15;
  _BOOL4 v16;
  MFError *v17;
  MFError *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[16];

  v5 = (MFConnectionSettings *)a3;
  self->_connectionSettings = v5;
  v6 = -[MFConnectionSettings portNumber](v5, "portNumber");
  if (!self->_socket)
    self->_socket = objc_alloc_init(_MFSocket);
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", 0);
  -[MFConnection _setupSocketWithSettings:](self, "_setupSocketWithSettings:", self->_connectionSettings);
  if (!(_DWORD)v6)
  {
    v8 = getservbyname(-[NSString UTF8String](-[MFConnectionSettings serviceName](self->_connectionSettings, "serviceName"), "UTF8String"), "tcp");
    if (!v8 || !LOWORD(v8->s_port))
    {
      v9 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      objc_msgSend(v9, "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1031, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("DONT_KNOW_SERVICE_PORT"), (uint64_t)CFSTR("Can’t determine port to use for the TCP/IP service “%@”."), CFSTR("Delayed")), -[MFConnectionSettings serviceName](self->_connectionSettings, "serviceName"))));
      v6 = 0;
      goto LABEL_10;
    }
    v6 = __rev16(LOWORD(v8->s_port));
  }
  if (-[_MFSocket connectToHost:withPort:service:](self->_socket, "connectToHost:withPort:service:", -[MFConnectionSettings hostname](self->_connectionSettings, "hostname"), v6, objc_msgSend(a3, "certUIService")))
  {
LABEL_5:
    _logEvent((uint64_t)self, 0, 0, 0, 0x7FFFFFFFFFFFFFFFuLL, 0);
    return 1;
  }
LABEL_10:
  v10 = (void *)objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error");
  if (v10)
  {
    v11 = v10;
    v12 = (void *)objc_msgSend(v10, "domain");
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2F90]))
    {
      if (objc_msgSend(v11, "code") == -9850)
      {
        v13 = MFLogGeneral();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C8839000, v13, OS_LOG_TYPE_INFO, "Detected server with low-grade DH cipher. Re-trying with DH disabled.", buf, 2u);
        }
        -[_MFSocket abort](self->_socket, "abort");

        self->_socket = objc_alloc_init(_MFSocket);
        -[MFConnection _setupSocketWithSettings:](self, "_setupSocketWithSettings:", self->_connectionSettings);
        -[_MFSocket setDisableEphemeralDiffieHellmanCiphers:](self->_socket, "setDisableEphemeralDiffieHellmanCiphers:", 1);
        objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", 0);
        if (-[_MFSocket connectToHost:withPort:service:](self->_socket, "connectToHost:withPort:service:", -[MFConnectionSettings hostname](self->_connectionSettings, "hostname"), v6, -[MFConnectionSettings certUIService](self->_connectionSettings, "certUIService")))
        {
          goto LABEL_5;
        }
      }
    }
  }
  v14 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v15 = -[MFConnectionSettings hostname](self->_connectionSettings, "hostname");
  v16 = -[MFConnectionSettings tryDirectSSL](self->_connectionSettings, "tryDirectSSL");
  v17 = (MFError *)objc_msgSend(v14, "error");
  if (!v17)
  {
    v18 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, 0);
    objc_msgSend(v14, "setError:", v18);
    if (!v18)
      goto LABEL_45;
    goto LABEL_28;
  }
  v18 = v17;
  if (objc_msgSend((id)*MEMORY[0x1E0CB2FE0], "isEqualToString:", -[MFError domain](v17, "domain")))
  {
    v19 = -[MFError code](v18, "code");
    switch(v19)
    {
      case 'A':
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = CFSTR("HOST_UNREACHABLE");
        v22 = CFSTR("The server “%@” cannot be contacted on port %d.");
        goto LABEL_31;
      case '=':
        v27 = (void *)MEMORY[0x1E0CB3940];
        if (!v16)
        {
          v28 = CFSTR("CONNECTION_REFUSED");
          v29 = CFSTR("The server “%@” refused to allow a connection on port %d.");
LABEL_37:
          v30 = MFLookupLocalizedString((uint64_t)v28, (uint64_t)v29, CFSTR("Delayed"));
          v31 = v6;
LABEL_39:
          v26 = objc_msgSend(v27, "stringWithFormat:", v30, v15, v31);
          goto LABEL_40;
        }
        break;
      case '<':
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = CFSTR("CONNECTION_TIMED_OUT");
        v22 = CFSTR("The connection to the server “%@” on port %d timed out.");
LABEL_31:
        v25 = MFLookupLocalizedString((uint64_t)v21, (uint64_t)v22, CFSTR("Delayed"));
        goto LABEL_32;
      default:
        v27 = (void *)MEMORY[0x1E0CB3940];
        if (!v16)
        {
          v30 = MFLookupLocalizedString((uint64_t)CFSTR("CONNECTION_FAILED"), (uint64_t)CFSTR("The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings."), CFSTR("Delayed"));
          goto LABEL_39;
        }
        break;
    }
    v28 = CFSTR("MF_SSL_CONNECTION_FAILURE");
    v29 = CFSTR("Mail was unable to connect to server “%@” using SSL on port %d. Verify that this server supports SSL and that your account settings are correct.");
    goto LABEL_37;
  }
  if (!objc_msgSend((id)*MEMORY[0x1E0CB31B0], "isEqualToString:", -[MFError domain](v18, "domain")))
  {
LABEL_28:
    if (-[NSError mf_isUserCancelledError](v18, "mf_isUserCancelledError"))
      goto LABEL_45;
    goto LABEL_43;
  }
  _setupSSLDomainError(v18, (uint64_t)v15, -[_MFSocket serverCertificates](self->_socket, "serverCertificates"));
  v23 = -[MFError localizedDescription](v18, "localizedDescription");
  if (!v23 || (v24 = v23, objc_msgSend(&stru_1E81CBE50, "isEqualToString:", v23)))
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    v25 = MFLookupLocalizedString((uint64_t)CFSTR("MF_SSL_CONNECTION_FAILURE"), (uint64_t)CFSTR("Mail was unable to connect to server “%@” using SSL on port %d. Verify that this server supports SSL and that your account settings are correct."), CFSTR("Delayed"));
LABEL_32:
    v26 = objc_msgSend(v20, "stringWithFormat:", v25, v15, v6);
LABEL_40:
    v24 = v26;
  }
  if (!-[NSError mf_isUserCancelledError](v18, "mf_isUserCancelledError"))
  {
    if (v24)
    {
LABEL_44:
      -[MFError setLocalizedDescription:](v18, "setLocalizedDescription:", v24);
      goto LABEL_45;
    }
LABEL_43:
    v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("CONNECTION_FAILED"), (uint64_t)CFSTR("The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings."), CFSTR("Delayed")), v15);
    goto LABEL_44;
  }
LABEL_45:
  -[_MFSocket abort](self->_socket, "abort");

  result = 0;
  self->_socket = 0;
  return result;
}

- (BOOL)connectUsingAccount:(id)a3
{
  return -[MFConnection connectUsingSettings:](self, "connectUsingSettings:", objc_msgSend(a3, "defaultConnectionSettings"));
}

+ (BOOL)shouldTryFallbacksAfterError:(id)a3
{
  void *v4;
  void *v6;

  v4 = (void *)objc_msgSend(a3, "domain");
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0C930A8]))
  {
    if (objc_msgSend(a3, "code") == 2 || objc_msgSend(a3, "code") == 1)
      return 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(a3, "domain");
    if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0CB31B0]))
      return objc_msgSend(a3, "code") != -9829;
  }
  return 1;
}

- (BOOL)connectUsingFallbacksForAccount:(id)a3
{
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = objc_msgSend(a3, "defaultConnectionSettings");
  if (-[MFConnection connectUsingAccount:](self, "connectUsingAccount:", a3))
  {
LABEL_2:
    LOBYTE(v6) = 1;
  }
  else
  {
    v7 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v8 = objc_msgSend(v7, "error");
    if (!v8 || (v6 = objc_msgSend((id)objc_opt_class(), "shouldTryFallbacksAfterError:", v8)) != 0)
    {
      v9 = (void *)objc_msgSend(a3, "alternateConnectionSettings");
      v10 = objc_msgSend(v9, "count");
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = 1;
        while (!v12 || objc_msgSend((id)objc_opt_class(), "shouldTryFallbacksAfterError:", v12))
        {
          objc_msgSend(a3, "applySettingsAsDefault:", objc_msgSend(v9, "objectAtIndex:", v13 - 1));
          v14 = -[MFConnection connectUsingAccount:](self, "connectUsingAccount:", a3);
          v15 = objc_msgSend(v7, "error");
          if (!v14)
          {
            v12 = v15;
            if (v13++ < v11)
              continue;
          }
          if (v14)
            goto LABEL_2;
          break;
        }
      }
      objc_msgSend(a3, "applySettingsAsDefault:", v5);
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)setAllowsFallbacks:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 108) = *((_BYTE *)self + 108) & 0xFD | v3;
}

- (BOOL)authenticateUsingAccount:(id)a3
{
  void *v5;
  void *v6;
  NSArray *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;

  v5 = (void *)objc_msgSend(a3, "preferredAuthScheme");
  v6 = (void *)objc_msgSend(v5, "authenticatorForAccount:connection:", a3, self);

  self->_securityLayer = 0;
  if (!v6)
    goto LABEL_5;
  v7 = -[MFConnection authenticationMechanisms](self, "authenticationMechanisms");
  if (!v7 || -[NSArray indexOfObject:](v7, "indexOfObject:", objc_msgSend(v6, "saslName")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = MFLookupLocalizedString((uint64_t)CFSTR("AUTH_NOT_SUPPORTED_FORMAT"), (uint64_t)CFSTR("The %@ server “%@” doesn’t support %@ authentication. Please check your account settings and try again."), CFSTR("Delayed"));
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1034, objc_msgSend(v8, "stringWithFormat:", v9, objc_msgSend((id)objc_opt_class(), "accountTypeString"), objc_msgSend(a3, "hostname"), objc_msgSend(v5, "humanReadableName"))));
LABEL_5:
    LOBYTE(v10) = 0;
    return v10;
  }
  v10 = -[MFConnection authenticateUsingAccount:authenticator:](self, "authenticateUsingAccount:authenticator:", a3, v6);
  if (v10)
  {
    if (!self->_securityLayer)
      self->_securityLayer = (MFSASLSecurityLayer *)(id)objc_msgSend(v6, "securityLayer");
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (NSArray)capabilities
{
  return 0;
}

- (NSArray)authenticationMechanisms
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = -[MFConnection capabilities](self, "capabilities");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
      v9 = objc_msgSend(v8, "rangeOfString:options:range:", CFSTR("AUTH="), 9, 0, objc_msgSend(v8, "length"));
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = v9;
        v12 = v10;
        if (!v5)
          v5 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        -[NSArray addObject:](v5, "addObject:", objc_msgSend((id)objc_msgSend(v8, "substringFromIndex:", v11 + v12), "uppercaseString"));
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v4);
  return v5;
}

- (BOOL)loginDisabled
{
  return 0;
}

- (BOOL)usesOpportunisticSockets
{
  return -[_MFSocket usesOpportunisticSockets](self->_socket, "usesOpportunisticSockets");
}

- (BOOL)writeBytes:(const char *)a3 length:(unint64_t)a4 dontLogBytesInRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  unint64_t v11;
  id v12;
  const char *v13;
  unint64_t v14;
  z_stream_s *deflater;
  z_stream_s *v16;
  uInt v17;
  z_stream_s *v18;
  const char *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  NSUInteger v25;
  const char *v26;
  int64_t v27;
  BOOL v28;
  void *v29;
  char v30;
  id v31;
  _MFSocket *socket;
  MFError *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  void *v39;
  void *v40;
  const char *v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  unsigned int v45;

  length = a5.length;
  location = a5.location;
  v10 = -[MFSASLSecurityLayer encryptionBufferSize](self->_securityLayer, "encryptionBufferSize");
  v11 = v10;
  v42 = a4;
  v43 = location;
  if ((*((_BYTE *)self + 108) & 4) != 0)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D46100]);
    deflater = self->_deflater;
    deflater->avail_in = a4;
    deflater->next_in = (Bytef *)a3;
    v16 = self->_deflater;
    do
    {
      v16->next_out = (Bytef *)self->_zbuffer;
      v17 = NSPageSize();
      v18 = self->_deflater;
      v18->avail_out = v17;
      if (deflate(v18, 2) == -2)
        -[MFConnection writeBytes:length:dontLogBytesInRange:].cold.1();
      objc_msgSend(v12, "appendBytes:length:", self->_zbuffer, NSPageSize() - self->_deflater->avail_out);
      v16 = self->_deflater;
    }
    while (!v16->avail_out);
    a4 = objc_msgSend(v12, "length");
    v13 = (const char *)objc_msgSend(v12, "bytes");
    if (v11)
    {
LABEL_3:
      if (v11 >= a4)
        v14 = a4;
      else
        v14 = v11;
      v44 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D46100]), "initWithCapacity:", v14 + 4);
      v13 = 0;
      if (!a4)
        goto LABEL_31;
LABEL_13:
      v19 = &a3[a4];
      v40 = (void *)*MEMORY[0x1E0CB2FE0];
      v39 = (void *)*MEMORY[0x1E0CB31B0];
      v41 = a3;
      while (1)
      {
        v20 = a4;
        if (!v44)
          break;
        if (v14 >= a4)
          v21 = a4;
        else
          v21 = v14;
        v22 = (void *)-[MFSASLSecurityLayer createEncryptedDataForBytes:length:](self->_securityLayer, "createEncryptedDataForBytes:length:", &v19[-a4], v21);
        objc_msgSend(v44, "setLength:", 0);
        if (v22)
        {
          v45 = 0;
          v45 = bswap32(objc_msgSend(v22, "length")) >> 16;
          objc_msgSend(v44, "appendBytes:length:", &v45, 4);
          objc_msgSend(v44, "appendData:", v22);

        }
        v13 = (const char *)objc_msgSend(v44, "bytes");
        v23 = objc_msgSend(v44, "length");
        if (!v22)
        {
          v30 = 0;
          v29 = v44;
          goto LABEL_51;
        }
        v20 = v23;
        if (v23)
          break;
LABEL_27:
        v28 = a4 > v14;
        if (a4 >= v14)
          a4 -= v14;
        else
          a4 = 0;
        a3 = v41;
        if (!v28)
          goto LABEL_31;
      }
      v24 = v19;
      v25 = length;
      v26 = v13;
      while (1)
      {
        v27 = -[_MFSocket writeBytes:length:](self->_socket, "writeBytes:length:", v26, v20);
        if (v27 < 0)
          break;
        self->_lastUsedTime = CFAbsoluteTimeGetCurrent();
        if (!v27)
          break;
        objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "recordBytesWritten:", v27);
        v26 += v27;
        v20 -= v27;
        if (!v20)
        {
          length = v25;
          v19 = v24;
          goto LABEL_27;
        }
      }
      v31 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      socket = self->_socket;
      v33 = (MFError *)objc_msgSend(v31, "error");
      v34 = -[_MFSocket remoteHostname](socket, "remoteHostname");
      if (!v33)
      {
        v33 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, 0);
        objc_msgSend(v31, "setError:", v33);
        if (!v33 || -[NSError mf_isUserCancelledError](v33, "mf_isUserCancelledError"))
        {
LABEL_50:
          -[_MFSocket abort](self->_socket, "abort");
          v30 = 0;
          v37 = 0;
          v29 = v44;
          if (!v44)
            goto LABEL_52;
          goto LABEL_51;
        }
LABEL_48:
        v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("CONNECTION_FAILED"), (uint64_t)CFSTR("The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings."), CFSTR("Delayed")), v34);
LABEL_49:
        -[MFError setLocalizedDescription:](v33, "setLocalizedDescription:", v36);
        goto LABEL_50;
      }
      if (objc_msgSend(v40, "isEqualToString:", -[MFError domain](v33, "domain")))
      {
        if (-[MFError code](v33, "code") == 60)
        {
          v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("CONNECTION_TIMED_OUT"), (uint64_t)CFSTR("The connection to the server “%@” on port %d timed out."), CFSTR("Delayed")), v34, -[_MFSocket remotePortNumber](socket, "remotePortNumber"));
LABEL_44:
          v36 = v35;
          goto LABEL_46;
        }
      }
      else if (objc_msgSend(v39, "isEqualToString:", -[MFError domain](v33, "domain")))
      {
        _setupSSLDomainError(v33, v34, -[_MFSocket serverCertificates](self->_socket, "serverCertificates"));
        v36 = -[MFError localizedDescription](v33, "localizedDescription");
        if (!v36 || objc_msgSend(&stru_1E81CBE50, "isEqualToString:", v36))
        {
          v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SSL_GENERIC_WRITE_ERROR"), (uint64_t)CFSTR("An SSL error occurred while trying to provide data to the server “%@”. Verify that this server supports SSL and that your account settings are correct."), CFSTR("Delayed")), v34);
          goto LABEL_44;
        }
LABEL_46:
        if (-[NSError mf_isUserCancelledError](v33, "mf_isUserCancelledError"))
          goto LABEL_50;
        if (v36)
          goto LABEL_49;
        goto LABEL_48;
      }
      v36 = 0;
      goto LABEL_46;
    }
  }
  else
  {
    v12 = 0;
    v13 = a3;
    if (v10)
      goto LABEL_3;
  }
  v44 = 0;
  v14 = a4;
  if (a4)
    goto LABEL_13;
LABEL_31:
  v29 = v44;
  if (!v44)
  {
    _logEvent((uint64_t)self, 3, (uint64_t)a3, v42, v43, length);
    v37 = 1;
    if (!v12)
      return v37;
    goto LABEL_53;
  }
  _logEvent((uint64_t)self, 4, (uint64_t)a3, v42, v43, length);
  v30 = 1;
LABEL_51:

  v37 = v30;
LABEL_52:
  if (v12)
LABEL_53:

  return v37;
}

- (BOOL)writeData:(id)a3 dontLogBytesInRange:(_NSRange)a4
{
  return -[MFConnection writeBytes:length:dontLogBytesInRange:](self, "writeBytes:length:dontLogBytesInRange:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), a4.location, a4.length);
}

- (BOOL)writeData:(id)a3
{
  return -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", a3, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)setDesiredReadBufferLength:(unint64_t)a3
{
  self->_desiredBufferLength = a3;
}

- (void)enableThroughputMonitoring:(BOOL)a3
{
  -[_MFSocket enableThroughputMonitoring:](self->_socket, "enableThroughputMonitoring:", a3);
}

- (void)logReadChars:(const char *)a3 length:(unint64_t)a4
{
  int v4;

  if (a4)
  {
    v4 = a4;

    self->_readBytesNotLogged -= v4;
  }
}

- (BOOL)readLineIntoData:(id)a3
{
  BOOL v5;
  int v6;
  char *buffer;
  unint64_t bufferStart;
  uint64_t v9;
  uint64_t v10;
  unint64_t bufferRemainingBytes;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;

  v5 = 0;
  while (1)
  {
    if (!self->_bufferRemainingBytes)
    {
      v6 = _fillBuffer((uint64_t)self);
      if (!v6)
        return v6;
    }
    buffer = self->_buffer;
    bufferStart = self->_bufferStart;
    if (v5 && buffer[bufferStart] == 10)
    {
      v9 = 0;
      v10 = 1;
    }
    else
    {
      bufferRemainingBytes = self->_bufferRemainingBytes;
      if (bufferRemainingBytes < 2)
      {
LABEL_11:
        v10 = 0;
        v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v9 = 0;
        v12 = bufferRemainingBytes - 1;
        while (*(_WORD *)&buffer[bufferStart + v9] != 2573)
        {
          if (v12 == ++v9)
            goto LABEL_11;
        }
        v10 = 2;
      }
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = self->_bufferRemainingBytes;
      v5 = buffer[bufferStart - 1 + v13] == 13;
    }
    else
    {
      v5 = 0;
      v13 = v9 + v10;
    }
    objc_msgSend(a3, "appendBytes:length:", &buffer[bufferStart], v13);
    v14 = self->_bufferStart + v13;
    self->_bufferRemainingBytes -= v13;
    self->_bufferStart = v14;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
  }
}

- (BOOL)readBytesIntoData:(id)a3 desiredLength:(unint64_t)a4
{
  unint64_t v4;
  int64_t bufferRemainingBytes;
  int v8;
  unint64_t v9;
  unint64_t v10;

  if (a4)
  {
    v4 = a4;
    do
    {
      bufferRemainingBytes = self->_bufferRemainingBytes;
      if (!bufferRemainingBytes)
      {
        v8 = _fillBuffer((uint64_t)self);
        if (!v8)
          return v8;
        bufferRemainingBytes = self->_bufferRemainingBytes;
      }
      if (bufferRemainingBytes >= 1)
      {
        if (bufferRemainingBytes >= v4)
          v9 = v4;
        else
          v9 = bufferRemainingBytes;
        objc_msgSend(a3, "appendBytes:length:", &self->_buffer[self->_bufferStart], v9);
        v10 = self->_bufferStart + v9;
        self->_bufferRemainingBytes -= v9;
        self->_bufferStart = v10;
        v4 -= v9;
      }
    }
    while (v4);
    LOBYTE(v8) = 1;
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4
{
  void *v5;
  objc_class *v6;
  NSString *v7;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, objc_msgSend(v5, "stringWithFormat:", CFSTR("Internal error: -[%@ %@] needs to be implemented in a concrete subclass."), v7, NSStringFromSelector(a2))));
  return 0;
}

- (BOOL)startTLSForAccount:(id)a3
{
  void *v4;
  objc_class *v5;
  NSString *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, objc_msgSend(v4, "stringWithFormat:", CFSTR("Internal error: -[%@ %@] needs to be implemented in a concrete subclass."), v6, NSStringFromSelector(a2))));
  return 0;
}

- (NSString)securityProtocol
{
  _MFSocket *socket;

  socket = self->_socket;
  if (socket)
    return (NSString *)-[_MFSocket securityProtocol](socket, "securityProtocol");
  else
    return (NSString *)*MEMORY[0x1E0C9B328];
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
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t v25;

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
    v7 = MFLogGeneral();
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
    v17 = MFLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MFConnection startCompression].cold.3(v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_9;
  }
  self->_inflater = v4;
  v25 = NSPageSize();
  self->_zbuffer = (char *)malloc_type_malloc(v25, 0xB9AC0803uLL);
  *((_BYTE *)self + 108) |= 4u;
  return 1;
}

- (void)endCompression
{
  z_stream *deflater;
  z_stream *inflater;
  char *zbuffer;

  *((_BYTE *)self + 108) &= ~4u;
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
  _MFSocket *socket;

  socket = self->_socket;
  if (socket)
    LOBYTE(socket) = -[_MFSocket isValid](socket, "isValid");
  return (char)socket;
}

- (void)disconnect
{
  -[_MFSocket abort](self->_socket, "abort");

  self->_socket = 0;
  -[MFConnection endCompression](self, "endCompression");
}

- (BOOL)hasBytesAvailable
{
  return self->_bufferRemainingBytes > 0 || -[_MFSocket isReadable](self->_socket, "isReadable");
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
  id v5;

  v5 = a3;

  self->_connectionSettings = (MFConnectionSettings *)a3;
}

- (id)copyDiagnosticInformation
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[MFConnection mf_lock](self, "mf_lock");
  objc_msgSend(v3, "appendString:", CFSTR("\n==== Connection State ====\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Host: %@\n"), -[_MFSocket remoteHostname](self->_socket, "remoteHostname"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Port Number: %u\n"), -[_MFSocket remotePortNumber](self->_socket, "remotePortNumber"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    SSL Version: %@\n"), -[_MFSocket securityProtocol](self->_socket, "securityProtocol"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Socket: %p\n"), self->_socket);
  objc_msgSend(v3, "appendFormat:", CFSTR("    Thread: %p\n"), objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"));
  -[MFConnection mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)_setupSocketWithSettings:.cold.1()
{
  __assert_rtn("-[MFConnection _setupSocketWithSettings:]", "Connection.m", 475, "_socket");
}

- (void)writeBytes:length:dontLogBytesInRange:.cold.1()
{
  __assert_rtn("-[MFConnection writeBytes:length:dontLogBytesInRange:]", "Connection.m", 700, "Z_STREAM_ERROR != err");
}

- (void)startCompression
{
  OUTLINED_FUNCTION_0_0(&dword_1C8839000, a2, a3, "deflateInit2 failed with error %d", a5, a6, a7, a8, 0);
}

@end
