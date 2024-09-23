@implementation CDMXPCClient

void __48__CDMXPCClient_setup_nullableCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6 == 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("successFromSetup"));

  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v6, CFSTR("errorFromSetup"));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

- (CDMXPCClient)initWithDelegate:(id)a3
{
  self->_wakeOnInit = 1;
  objc_storeStrong((id *)&self->_delegate, a3);
  -[CDMXPCClient sharedInitTasks](self, "sharedInitTasks");
  return self;
}

- (void)wake
{
  void *v2;
  id v3;

  -[CDMXPCClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "wake");
}

- (void)sharedInitTasks
{
  self->_lock._os_unfair_lock_opaque = 0;
  if (self->_wakeOnInit)
    -[CDMXPCClient wake](self, "wake");
}

- (void)setup:(id)a3 nullableCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  if (-[CDMClientInterface daemonKilled](self, "daemonKilled"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMXPCClient setValue:forKey:](self, "setValue:forKey:", v8, CFSTR("daemonKilled"));

  }
  objc_msgSend(v7, "createSandboxExtensionForXPC");
  -[CDMXPCClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48__CDMXPCClient_setup_nullableCompletionHandler___block_invoke;
  v16[3] = &unk_24DCAB5C8;
  v16[4] = self;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __48__CDMXPCClient_setup_nullableCompletionHandler___block_invoke_2;
  v14[3] = &unk_24DCAB5C8;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "setupWithConfig:completionHandler:", v7, v14);

}

- (id)connection
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  NSXPCConnection *v6;
  NSXPCConnection *connection;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_connection)
  {
    v4 = objc_alloc(MEMORY[0x24BDD1988]);
    +[CDMXPCDefines machServiceName](CDMXPCDefines, "machServiceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", v5, 4096);
    connection = self->_connection;
    self->_connection = v6;

    v8 = self->_connection;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255100128);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    objc_initWeak(&location, self);
    v10 = self->_connection;
    v11 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __26__CDMXPCClient_connection__block_invoke;
    v17[3] = &unk_24DCAB4E8;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v17);
    v12 = self->_connection;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __26__CDMXPCClient_connection__block_invoke_282;
    v15[3] = &unk_24DCAB4E8;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInterruptionHandler:](v12, "setInterruptionHandler:", v15);
    -[NSXPCConnection resume](self->_connection, "resume");
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CDMXPCClient connection]";
      _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Created connection to assistant_cdmd.", buf, 0xCu);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_lock);
  return self->_connection;
}

- (CDMXPCClient)init
{
  self->_wakeOnInit = 1;
  -[CDMXPCClient sharedInitTasks](self, "sharedInitTasks");
  return self;
}

- (CDMXPCClient)initWithCallingBundleId:(id)a3
{
  id v4;
  CDMDataDispatcherContext *v5;
  CDMDataDispatcherContext *dataDispatcherContext;

  v4 = a3;
  v5 = -[CDMDataDispatcherContext initWithCallingBundleId:]([CDMDataDispatcherContext alloc], "initWithCallingBundleId:", v4);

  dataDispatcherContext = self->_dataDispatcherContext;
  self->_dataDispatcherContext = v5;

  return -[CDMXPCClient init](self, "init");
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[CDMXPCClient invalidateConnection](self, "invalidateConnection");
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)CDMXPCClient;
  -[CDMXPCClient dealloc](&v4, sel_dealloc);
}

- (void)invalidateConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection invalidate](connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

  }
}

- (CDMXPCClient)initWithConnection:(id)a3 delegate:(id)a4 wakeOnInit:(BOOL)a5
{
  NSXPCConnection *v8;
  CDMClientDelegate *v9;
  NSXPCConnection *connection;
  NSXPCConnection *v11;
  CDMClientDelegate *delegate;

  v8 = (NSXPCConnection *)a3;
  v9 = (CDMClientDelegate *)a4;
  self->_wakeOnInit = a5;
  connection = self->_connection;
  self->_connection = v8;
  v11 = v8;

  delegate = self->_delegate;
  self->_delegate = v9;

  -[CDMXPCClient sharedInitTasks](self, "sharedInitTasks");
  return self;
}

- (CDMXPCClient)initWithDelegate:(id)a3 withCallingBundleId:(id)a4
{
  id v6;
  id v7;
  CDMDataDispatcherContext *v8;
  CDMDataDispatcherContext *dataDispatcherContext;
  CDMXPCClient *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[CDMDataDispatcherContext initWithCallingBundleId:]([CDMDataDispatcherContext alloc], "initWithCallingBundleId:", v6);

  dataDispatcherContext = self->_dataDispatcherContext;
  self->_dataDispatcherContext = v8;

  v10 = -[CDMXPCClient initWithDelegate:](self, "initWithDelegate:", v7);
  return v10;
}

- (BOOL)areAssetsAvailable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  BOOL v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[CDMXPCClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __35__CDMXPCClient_areAssetsAvailable___block_invoke;
  v16[3] = &unk_24DCAB510;
  v16[4] = &v17;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __35__CDMXPCClient_areAssetsAvailable___block_invoke_287;
  v13[3] = &unk_24DCAB538;
  v15 = &v17;
  v8 = dispatch_semaphore_create(0);
  v14 = v8;
  objc_msgSend(v7, "areAssetsAvailableWithLocale:completionHandler:", v4, v13);
  v9 = dispatch_time(0, 1000000000* +[CDMUserDefaultsUtils readXPCCallbackDefaultTimeout](CDMUserDefaultsUtils, "readXPCCallbackDefaultTimeout"));
  if (dispatch_semaphore_wait(v8, v9))
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CDMXPCClient areAssetsAvailable:]";
      _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Timed-out waiting for areAssetsAvailable XPC call. Returning false", buf, 0xCu);
    }

    v11 = 0;
  }
  else
  {
    v11 = *((_BYTE *)v18 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (BOOL)registerWithAssetsDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  NSString *localeIdentifier;
  int v9;
  const char *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    localeIdentifier = self->_localeIdentifier;
    v9 = 136315394;
    v10 = "-[CDMXPCClient registerWithAssetsDelegate:]";
    v11 = 2112;
    v12 = localeIdentifier;
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Register assets delegate for CDMXPCClient for enabled DAG services for locale: %@", (uint8_t *)&v9, 0x16u);
  }

  v6 = +[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:](CDMAssetsUtils, "registerWithAssetsDelegate:withType:withLocale:", v4, 0, self->_localeIdentifier);
  return v6;
}

- (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  NSString *localeIdentifier;
  int v11;
  const char *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    localeIdentifier = self->_localeIdentifier;
    v11 = 136315394;
    v12 = "-[CDMXPCClient registerWithAssetsDelegate:withType:]";
    v13 = 2112;
    v14 = localeIdentifier;
    _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Register assets delegate for CDMXPCClient for locale: %@", (uint8_t *)&v11, 0x16u);
  }

  v8 = +[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:](CDMAssetsUtils, "registerWithAssetsDelegate:withType:withLocale:", v6, a4, self->_localeIdentifier);
  return v8;
}

- (void)warmupWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CDMXPCClient warmupWithCompletionHandler:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  -[CDMXPCClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__CDMXPCClient_warmupWithCompletionHandler___block_invoke;
  v13[3] = &unk_24DCAB560;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __44__CDMXPCClient_warmupWithCompletionHandler___block_invoke_291;
  v11[3] = &unk_24DCAB560;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "warmupWithCompletionHandler:", v11);

}

- (void)setup:(id)a3
{
  -[CDMXPCClient setup:nullableCompletionHandler:](self, "setup:nullableCompletionHandler:", a3, 0);
}

- (void)processCDMNluRequest:(id)a3
{
  -[CDMXPCClient processCDMNluRequest:nullableCompletionHandler:](self, "processCDMNluRequest:nullableCompletionHandler:", a3, 0);
}

- (void)processCDMNluRequest:(id)a3 nullableCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void (**v15)(id, _QWORD, void *);
  id v16;
  void *v17;
  void *v18;
  CDMNluRequestID *v19;
  void *v20;
  void *v21;
  CDMNluRequestID *v22;
  _QWORD v23[5];
  id v24;
  void (**v25)(id, _QWORD, void *);
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[CDMXPCClient processCDMNluRequest:nullableCompletionHandler:]";
    v33 = 2112;
    v34 = v6;
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Sending XPC Nlu request to service -> %@", buf, 0x16u);
  }

  if (-[CDMClientInterface daemonKilled](self, "daemonKilled"))
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    v30 = CFSTR("assistant_cdmd has been killed. Please call setup to ensure CDM can handle requests.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("CDMXPCClientErrorDomain"), 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[CDMXPCClient processCDMNluRequest:nullableCompletionHandler:]";
      v33 = 2112;
      v34 = v11;
      _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    if (v7)
    {
      v7[2](v7, 0, v11);
    }
    else if (self->_delegate)
    {
      v19 = [CDMNluRequestID alloc];
      objc_msgSend(v6, "objcProto");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "requestId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[CDMNluRequestID initWithObjcProto:](v19, "initWithObjcProto:", v21);

      -[CDMClientDelegate processCDMNluRequestErrorCallback:error:](self->_delegate, "processCDMNluRequestErrorCallback:error:", v22, v11);
    }
  }
  else
  {
    -[CDMXPCClient connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __63__CDMXPCClient_processCDMNluRequest_nullableCompletionHandler___block_invoke;
    v26[3] = &unk_24DCAB5F0;
    v15 = v7;
    v28 = v15;
    v26[4] = self;
    v16 = v6;
    v27 = v16;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objcProto");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __63__CDMXPCClient_processCDMNluRequest_nullableCompletionHandler___block_invoke_297;
    v23[3] = &unk_24DCAB618;
    v25 = v15;
    v23[4] = self;
    v24 = v16;
    objc_msgSend(v17, "processCDMNluRequestWithCdmNluRequest:completionHandler:", v18, v23);

    v11 = v28;
  }

}

- (void)waitForDataDispatcherCompletion
{
  void *v2;
  id v3;

  -[CDMXPCClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_300);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "waitForDataDispatcherCompletionWithCompletionHandler:", &__block_literal_global_302);
}

- (void)setDataDispatcherContext:(id)a3
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, a3);
}

- (void)doHandleCommand:(id)a3 forCallback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CDMXPCClient doHandleCommand:forCallback:]";
    v22 = 2112;
    v23 = v6;
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Sending over XPC -> command=%@", buf, 0x16u);
  }

  -[CDMXPCClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __44__CDMXPCClient_doHandleCommand_forCallback___block_invoke;
  v18[3] = &unk_24DCAB560;
  v11 = v7;
  v19 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CDMXPCClient doHandleCommand:forCallback:]";
      v22 = 2112;
      v23 = v6;
      _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Sending over XPC a command that isKindOfClass CDMServiceGraphCommand -> command=%@", buf, 0x16u);
    }

    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __44__CDMXPCClient_doHandleCommand_forCallback___block_invoke_304;
    v16[3] = &unk_24DCAB680;
    v17 = v11;
    objc_msgSend(v12, "processRequestWithServiceGraphCommand:completionHandler:", v6, v16);
    v14 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This command not supported: command=%@"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMClientInterface createNSError:errorCode:](self, "createNSError:errorCode:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v15);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
  objc_storeStrong((id *)&self->_serviceCenter, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __44__CDMXPCClient_doHandleCommand_forCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[CDMXPCClient doHandleCommand:forCallback:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: Unable to make XPC connection, error=%@", (uint8_t *)&v6, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __44__CDMXPCClient_doHandleCommand_forCallback___block_invoke_304(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315650;
      v9 = "-[CDMXPCClient doHandleCommand:forCallback:]_block_invoke";
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s XPC processRequestWithCmdCommandType finished with response=%@, error=%@", (uint8_t *)&v8, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __47__CDMXPCClient_waitForDataDispatcherCompletion__block_invoke_301()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    v1 = 136315138;
    v2 = "-[CDMXPCClient waitForDataDispatcherCompletion]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v0, OS_LOG_TYPE_DEBUG, "%s CDMXPCService's waitForDataDispatcherCompletion method called", (uint8_t *)&v1, 0xCu);
  }

}

void __47__CDMXPCClient_waitForDataDispatcherCompletion__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[CDMXPCClient waitForDataDispatcherCompletion]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_ERROR, "%s [ERR]: waitForDataDispatcherCompletion connection error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __63__CDMXPCClient_processCDMNluRequest_nullableCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  CDMNluRequestID *v5;
  void *v6;
  void *v7;
  CDMNluRequestID *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v3);
  }
  else if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v5 = [CDMNluRequestID alloc];
    objc_msgSend(*(id *)(a1 + 40), "objcProto");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CDMNluRequestID initWithObjcProto:](v5, "initWithObjcProto:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "processCDMNluRequestErrorCallback:error:", v8, v3);
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[CDMXPCClient processCDMNluRequest:nullableCompletionHandler:]_block_invoke";
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

void __63__CDMXPCClient_processCDMNluRequest_nullableCompletionHandler___block_invoke_297(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CDMNluResponse *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  CDMNluRequestID *v12;
  void *v13;
  void *v14;
  CDMNluRequestID *v15;
  int v16;
  const char *v17;
  __int16 v18;
  CDMNluResponse *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  v7 = -[CDMNluResponse initWithObjcProto:]([CDMNluResponse alloc], "initWithObjcProto:", v6);

  v8 = *(_QWORD *)(a1 + 48);
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
    {
      v16 = 136315394;
      v17 = "-[CDMXPCClient processCDMNluRequest:nullableCompletionHandler:]_block_invoke";
      v18 = 2112;
      v19 = v7;
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s XPC response to Nlu request with callback handler <- %@", (uint8_t *)&v16, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v10)
    {
      v16 = 136315394;
      v17 = "-[CDMXPCClient processCDMNluRequest:nullableCompletionHandler:]_block_invoke";
      v18 = 2112;
      v19 = v7;
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s XPC response to Nlu request without callback handler <- %@", (uint8_t *)&v16, 0x16u);
    }

    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    if (v11)
    {
      if (v5)
      {
        v12 = [CDMNluRequestID alloc];
        objc_msgSend(*(id *)(a1 + 40), "objcProto");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "requestId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[CDMNluRequestID initWithObjcProto:](v12, "initWithObjcProto:", v14);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "processCDMNluRequestErrorCallback:error:", v15, v5);
      }
      else
      {
        objc_msgSend(v11, "processCDMNluRequestCallback:", v7);
      }
    }
  }

}

void __48__CDMXPCClient_setup_nullableCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __20__CDMXPCClient_wake__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[CDMXPCClient wake]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: Error waking assistant_cdmd: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __44__CDMXPCClient_warmupWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[CDMXPCClient warmupWithCompletionHandler:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: warmupWithCompletionHandler connection error: %@", (uint8_t *)&v6, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __44__CDMXPCClient_warmupWithCompletionHandler___block_invoke_291(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[CDMXPCClient warmupWithCompletionHandler:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: warmupWithCompletionHandler error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315138;
    v8 = "-[CDMXPCClient warmupWithCompletionHandler:]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s warmupWithCompletionHandler completed without error", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __35__CDMXPCClient_areAssetsAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[CDMXPCClient areAssetsAvailable:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: areAssetsAvailable connection error: %@", (uint8_t *)&v5, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

intptr_t __35__CDMXPCClient_areAssetsAvailable___block_invoke_287(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __26__CDMXPCClient_connection__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "invalidateConnection");

  }
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[CDMXPCClient connection]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s Connection to assistant_cdmd was invalidated.", (uint8_t *)&v5, 0xCu);
  }

}

void __26__CDMXPCClient_connection__block_invoke_282(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setValue:forKey:](v3, "setValue:forKey:", v4, CFSTR("daemonKilled"));

    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[CDMXPCClient connection]_block_invoke";
      _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Connection to assistant_cdmd was interrupted. daemonKilled KVO set to true.", (uint8_t *)&v6, 0xCu);
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[CDMXPCClient connection]_block_invoke";
      _os_log_error_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_ERROR, "%s [ERR]: Connection to assistant_cdmd was interrupted. CDMXPCClient (self) was nil, so couldn't set daemonKilled KVO.", (uint8_t *)&v6, 0xCu);
    }
  }

}

@end
