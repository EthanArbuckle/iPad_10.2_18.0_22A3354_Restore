@implementation NEProvider

- (int64_t)_callSwiftHandleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4
{
  id v5;
  NEProvider *v6;
  int64_t v7;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_19BD25F34((uint64_t)v5);

  swift_unknownObjectRelease();
  return v7;
}

- (NEProvider)init
{
  return (NEProvider *)-[NEProvider initAllowUnentitled:](self, "initAllowUnentitled:", 0);
}

- (id)initAllowUnentitled:(BOOL)a3
{
  __SecTask *v5;
  __SecTask *v6;
  CFTypeRef v7;
  CFTypeRef v8;
  void *v9;
  char v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NEProvider *v15;
  NEProvider **v16;
  uint64_t v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = SecTaskCreateFromSelf(0);
  if (!v5)
  {
    if (!a3)
      goto LABEL_11;
LABEL_14:
    if (!+[NEProvider isRunningInProvider](NEProvider, "isRunningInProvider"))
    {
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v12 = "NEProvider objects cannot be instantiated from non-extension processes";
        v13 = v11;
        v14 = 2;
        goto LABEL_24;
      }
LABEL_18:

LABEL_19:
      v16 = 0;
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  v6 = v5;
  v7 = SecTaskCopyValueForEntitlement(v5, CFSTR("com.apple.developer.networking.networkextension"), 0);
  v8 = v7;
  if (v7)
    CFRelease(v7);
  v9 = (void *)SecTaskCopyValueForEntitlement(v6, CFSTR("com.apple.private.neagent"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = objc_msgSend(v9, "BOOLValue");
  else
    v10 = 0;
  CFRelease(v6);

  if (!v8 && !a3)
  {
LABEL_11:
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "com.apple.developer.networking.networkextension";
      v12 = "NEProvider creation failed, caller does not have the %s entitlement";
      v13 = v11;
      v14 = 12;
LABEL_24:
      _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if ((v10 & 1) == 0)
    goto LABEL_14;
LABEL_15:
  v19.receiver = self;
  v19.super_class = (Class)NEProvider;
  v15 = -[NEProvider init](&v19, sel_init);
  if (!v15)
  {
    ne_log_obj();
    self = (NEProvider *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, &self->super, OS_LOG_TYPE_INFO, "Failed to init NEProvider", buf, 2u);
    }
    goto LABEL_19;
  }
  v16 = (NEProvider **)v15;
  objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
  v17 = objc_claimAutoreleasedReturnValue();
  self = v16[2];
  v16[2] = (NEProvider *)v17;
LABEL_20:

  return v16;
}

- (void)dealloc
{
  const char *v3;
  void *v4;
  const char *v5;
  id v6;
  void *v7;
  objc_super v8;

  -[NEProvider setDefaultPath:](self, "setDefaultPath:", 0);
  if (self && objc_getProperty(self, v3, 16, 1))
  {
    -[NEProvider context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v6 = objc_getProperty(self, v5, 16, 1);
      -[NEProvider context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:forKeyPath:", v7, CFSTR("path"));

    }
    objc_setProperty_atomic(self, v5, 0, 16);
  }
  v8.receiver = self;
  v8.super_class = (Class)NEProvider;
  -[NEProvider dealloc](&v8, sel_dealloc);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  const char *v4;
  id v5;
  void *v6;
  void *v7;
  NWPathEvaluator *defaultPathEvaluator;
  id v9;

  -[NEProvider setContext:](self, "setContext:", a3);
  if (self)
  {
    v5 = objc_getProperty(self, v4, 16, 1);
    if (v5)
    {
      v6 = v5;
      -[NEProvider context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        defaultPathEvaluator = self->_defaultPathEvaluator;
        -[NEProvider context](self, "context");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        -[NWPathEvaluator addObserver:forKeyPath:options:context:](defaultPathEvaluator, "addObserver:forKeyPath:options:context:", v9, CFSTR("path"), 5, 0);

      }
    }
  }
}

- (void)setdefaultPathObserver:(id)a3
{
  char *v4;
  id Property;
  char *v6;

  v4 = (char *)a3;
  if (self)
  {
    v6 = v4;
    Property = objc_getProperty(self, v4, 16, 1);
    v4 = v6;
    if (v6)
    {
      if (Property)
      {
        -[NWPathEvaluator addObserver:forKeyPath:options:context:](self->_defaultPathEvaluator, "addObserver:forKeyPath:options:context:", v6, CFSTR("path"), 5, 0);
        v4 = v6;
      }
    }
  }

}

- (void)observerHelperHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  const char *v10;
  id v11;
  id Property;
  id v13;
  int v14;
  const char *v15;
  id v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v11 = a5;
  if (self)
    Property = objc_getProperty(self, v10, 16, 1);
  else
    Property = 0;
  v13 = Property;
  if (v13 != v9)
  {
LABEL_8:

    goto LABEL_9;
  }
  v14 = objc_msgSend(v17, "isEqualToString:", CFSTR("path"));

  if (v14)
  {
    if (self)
      v16 = objc_getProperty(self, v15, 16, 1);
    else
      v16 = 0;
    objc_msgSend(v16, "path");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[NEProvider setDefaultPath:](self, "setDefaultPath:", v13);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)sleepWithCompletionHandler:(void *)completionHandler
{
  void (**v4)(_QWORD);
  NSObject *v5;
  int v6;
  NEProvider *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: Sleeping", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4);
}

- (void)wake
{
  NSObject *v3;
  int v4;
  NEProvider *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "%@: Waking", (uint8_t *)&v4, 0xCu);
  }

}

- (NWTCPConnection)createTCPConnectionToEndpoint:(NWEndpoint *)remoteEndpoint enableTLS:(BOOL)enableTLS TLSParameters:(NWTLSParameters *)TLSParameters delegate:(id)delegate
{
  _BOOL8 v7;
  NWTLSParameters *v9;
  objc_class *v10;
  id v11;
  NWEndpoint *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = enableTLS;
  v9 = TLSParameters;
  v10 = (objc_class *)MEMORY[0x1E0CCECA0];
  v11 = delegate;
  v12 = remoteEndpoint;
  v13 = objc_alloc_init(v10);
  objc_msgSend(v13, "setEnableTLS:", v7);
  if (v9 && v7)
  {
    -[NWTLSParameters TLSSessionID](v9, "TLSSessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTLSSessionID:", v14);

    -[NWTLSParameters SSLCipherSuites](v9, "SSLCipherSuites");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSSLCipherSuites:", v15);

    objc_msgSend(v13, "setMinimumSSLProtocolVersion:", -[NWTLSParameters minimumSSLProtocolVersion](v9, "minimumSSLProtocolVersion"));
    objc_msgSend(v13, "setMaximumSSLProtocolVersion:", -[NWTLSParameters maximumSSLProtocolVersion](v9, "maximumSSLProtocolVersion"));
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCECD0]), "initWithEndpoint:parameters:delegate:", v12, v13, v11);

  return (NWTCPConnection *)v16;
}

- (NWUDPSession)createUDPSessionToEndpoint:(NWEndpoint *)remoteEndpoint fromEndpoint:(NWHostEndpoint *)localEndpoint
{
  NWHostEndpoint *v5;
  objc_class *v6;
  NWEndpoint *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = localEndpoint;
  v6 = (objc_class *)MEMORY[0x1E0CCECA0];
  v7 = remoteEndpoint;
  v8 = objc_alloc_init(v6);
  if (v5)
  {
    v9 = (void *)MEMORY[0x1E0CCEC58];
    -[NWHostEndpoint hostname](v5, "hostname");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWHostEndpoint port](v5, "port");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endpointWithHostname:port:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocalAddress:", v12);

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCECD8]), "initWithEndpoint:parameters:", v7, v8);

  return (NWUDPSession *)v13;
}

- (void)displayMessage:(NSString *)message completionHandler:(void *)completionHandler
{
  void (**v6)(void *, _QWORD);
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;

  v11 = message;
  v6 = completionHandler;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v11
    && (isKindOfClass & 1) == 0
    && (-[NEProvider appName](self, "appName"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    -[NEProvider context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProvider appName](self, "appName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayMessage:message:completionHandler:", v10, v11, v6);

  }
  else
  {
    v6[2](v6, 0);
  }

}

- (NWPath)defaultPath
{
  return (NWPath *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDefaultPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NEExtensionProviderContext)context
{
  return (NEExtensionProviderContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaultPathEvaluator, 0);
  objc_storeStrong((id *)&self->_defaultPath, 0);
}

+ (void)startSystemExtensionMode
{
  id v2;

  +[NEProviderServer sharedServer](NEProviderServer, "sharedServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

+ (BOOL)isRunningInProvider
{
  if (isRunningInProvider_check_init != -1)
    dispatch_once(&isRunningInProvider_check_init, &__block_literal_global_19772);
  return isRunningInProvider_callerIsProvider;
}

+ (BOOL)isNEProviderBundle:(id)a3 forExtensionPoint:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v5 = a4;
  objc_msgSend(a3, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsdictionary(v6))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CFBundlePackageType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!isa_nsstring(v7) || !objc_msgSend(v7, "isEqualToString:", CFSTR("XPC!")))
    {
      v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSExtension"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!isa_nsdictionary(v8))
    {
      v10 = 0;
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSExtensionPointIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v9))
    {
      if (v5)
      {
        if ((objc_msgSend(v9, "isEqualToString:", v5) & 1) != 0)
        {
LABEL_8:
          v10 = 1;
LABEL_14:

          goto LABEL_15;
        }
      }
      else if (objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.networkextension.")))
      {
        goto LABEL_8;
      }
    }
    v10 = 0;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_17:

  return v10;
}

void __33__NEProvider_isRunningInProvider__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isRunningInProvider_callerIsProvider = +[NEProvider isNEProviderBundle:forExtensionPoint:](NEProvider, "isNEProviderBundle:forExtensionPoint:", v0, 0);

}

@end
