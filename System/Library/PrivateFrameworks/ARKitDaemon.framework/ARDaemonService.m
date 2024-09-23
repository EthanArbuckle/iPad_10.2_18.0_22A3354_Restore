@implementation ARDaemonService

- (void)_commonInitWithProcessName:(id)a3 processIdentifier:(int)a4 bundleIdentifier:(id)a5
{
  NSString *v8;
  NSString *v9;
  NSString *clientProcessName;
  NSString *v11;
  NSString *clientBundleIdentifier;
  NSString *v13;
  NSString *v14;
  NSString *shortenedServiceNameForLogging;
  id v16;

  v8 = (NSString *)a3;
  v9 = (NSString *)a5;
  clientProcessName = self->_clientProcessName;
  self->_clientProcessName = v8;
  v11 = v8;

  self->_clientProcessIdentifier = a4;
  clientBundleIdentifier = self->_clientBundleIdentifier;
  self->_clientBundleIdentifier = v9;
  v13 = v9;

  objc_msgSend((id)objc_opt_class(), "serviceName");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple.arkit.service."), &stru_250702C60);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  shortenedServiceNameForLogging = self->_shortenedServiceNameForLogging;
  self->_shortenedServiceNameForLogging = v14;

}

- (ARDaemonService)initWithConnection:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  ARDaemonService *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  const char *v19;
  objc_class *v20;
  objc_class *v21;
  int v23;
  void *v24;
  __int16 v25;
  ARDaemonService *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "remoteServiceClass"))
  {
    v5 = objc_msgSend((id)objc_opt_class(), "remoteServiceClass");
    if (v5 != objc_opt_class())
    {
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "remoteServiceClass"), "performSelector:", sel_remoteServiceInterface);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "remoteServiceClass"), "performSelector:", sel_daemonServiceInterface);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v6)
      {
        if (v7)
        {
          self = -[ARDaemonService initWithConnection:exportedInterface:remoteObjectInterface:](self, "initWithConnection:exportedInterface:remoteObjectInterface:", v4, v7, v6);
          v9 = self;
LABEL_15:

          goto LABEL_16;
        }
        _ARLogDaemon_1();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (objc_class *)objc_msgSend((id)objc_opt_class(), "remoteServiceClass");
          NSStringFromClass(v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543874;
          v24 = v16;
          v25 = 2048;
          v26 = self;
          v27 = 2112;
          v28 = v18;
          v19 = "%{public}@ <%p>: %@ does not define a daemon service interface. Implement the 'daemonServiceInterface'";
          goto LABEL_13;
        }
      }
      else
      {
        _ARLogDaemon_1();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (objc_class *)objc_msgSend((id)objc_opt_class(), "remoteServiceClass");
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543874;
          v24 = v16;
          v25 = 2048;
          v26 = self;
          v27 = 2112;
          v28 = v18;
          v19 = "%{public}@ <%p>: %@ does not define a remote service interface. Implement the 'remoteServiceInterface'";
LABEL_13:
          _os_log_impl(&dword_235C46000, v14, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v23, 0x20u);

        }
      }

      v9 = 0;
      goto LABEL_15;
    }
  }
  _ARLogDaemon_1();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v11;
    v25 = 2048;
    v26 = self;
    v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_235C46000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ does not define a remote service class. Implement the 'remoteServiceClass' function and point it to its remote", (uint8_t *)&v23, 0x20u);

  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (ARDaemonService)initWithConnection:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  os_activity_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  ARDaemonService *v28;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;
  _BYTE buf[22];
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v35.receiver = self;
    v35.super_class = (Class)ARDaemonService;
    v12 = -[ARDaemonService init](&v35, sel_init);
    if (v12)
    {
      v13 = _os_activity_create(&dword_235C46000, "Daemon service", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
      v14 = (void *)*((_QWORD *)v12 + 2);
      *((_QWORD *)v12 + 2) = v13;

      objc_msgSend(v9, "setExportedObject:", v12);
      objc_msgSend(v9, "setExportedInterface:", v10);
      objc_msgSend(v9, "setRemoteObjectInterface:", v11);
      objc_initWeak(&location, v12);
      v15 = MEMORY[0x24BDAC760];
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __78__ARDaemonService_initWithConnection_exportedInterface_remoteObjectInterface___block_invoke;
      v32[3] = &unk_2507025E8;
      objc_copyWeak(&v33, &location);
      objc_msgSend(v9, "setInterruptionHandler:", v32);
      v30[0] = v15;
      v30[1] = 3221225472;
      v30[2] = __78__ARDaemonService_initWithConnection_exportedInterface_remoteObjectInterface___block_invoke_2;
      v30[3] = &unk_2507025E8;
      objc_copyWeak(&v31, &location);
      objc_msgSend(v9, "setInvalidationHandler:", v30);
      objc_storeStrong((id *)v12 + 9, a3);
      ARCreateTransactionForService();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)*((_QWORD *)v12 + 1);
      *((_QWORD *)v12 + 1) = v16;

      *((_BYTE *)v12 + 32) = 1;
      objc_msgSend(*((id *)v12 + 9), "ar_processName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(*((id *)v12 + 9), "processIdentifier");
      objc_msgSend(*((id *)v12 + 9), "ar_processBundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_commonInitWithProcessName:processIdentifier:bundleIdentifier:", v18, v19, v20);

      _ARLogGeneral_0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *((_QWORD *)v12 + 5);
        v24 = *((_QWORD *)v12 + 6);
        v26 = *((_DWORD *)v12 + 9);
        *(_DWORD *)buf = 138544387;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v12;
        v37 = 2114;
        v38 = v24;
        v39 = 2113;
        v40 = v25;
        v41 = 1024;
        v42 = v26;
        _os_log_impl(&dword_235C46000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Client connected: %{public}@ (%{private}@, %i)", buf, 0x30u);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      v27 = _os_activity_create(&dword_235C46000, "Daemon service init", *((os_activity_t *)v12 + 2), OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v27, (os_activity_scope_state_t)buf);

      os_activity_scope_leave((os_activity_scope_state_t)buf);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
    self = (ARDaemonService *)v12;
    v28 = self;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

void __78__ARDaemonService_initWithConnection_exportedInterface_remoteObjectInterface___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "interruptionHandler");

}

void __78__ARDaemonService_initWithConnection_exportedInterface_remoteObjectInterface___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidationHandler");

}

- (id)initAsLocalService
{
  ARDaemonService *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ARDaemonService;
  v2 = -[ARDaemonService init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "processIdentifier");
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARDaemonService _commonInitWithProcessName:processIdentifier:bundleIdentifier:](v2, "_commonInitWithProcessName:processIdentifier:bundleIdentifier:", v4, v6, v8);

  }
  return v2;
}

- (ARDaemonService)initWithRemoteService:(id)a3
{
  id v5;
  ARDaemonService *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARDaemonService;
  v6 = -[ARDaemonService init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "processIdentifier");
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARDaemonService _commonInitWithProcessName:processIdentifier:bundleIdentifier:](v6, "_commonInitWithProcessName:processIdentifier:bundleIdentifier:", v8, v10, v12);

    objc_storeStrong((id *)&v6->_remoteService, a3);
  }

  return v6;
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)interruptionHandler
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  NSString *clientProcessName;
  id WeakRetained;
  id v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  ARDaemonService *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  v3 = _os_activity_create(&dword_235C46000, "Daemon service interrupted", (os_activity_t)self->_daemonServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v10);

  _ARLogGeneral_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)buf = 138543874;
    v12 = v6;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = clientProcessName;
    _os_log_impl(&dword_235C46000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Daemon service interrupted: %{public}@", buf, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "serviceDidInterrupt:", self, v10.opaque[0], v10.opaque[1]);

  }
  os_activity_scope_leave(&v10);
}

- (void)invalidationHandler
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  NSString *clientProcessName;
  id WeakRetained;
  id v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  ARDaemonService *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  v3 = _os_activity_create(&dword_235C46000, "Daemon service invalidated", (os_activity_t)self->_daemonServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v10);

  _ARLogGeneral_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)buf = 138543874;
    v12 = v6;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = clientProcessName;
    _os_log_impl(&dword_235C46000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Daemon service invalidated: %{public}@", buf, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "serviceDidInvalidate:", self, v10.opaque[0], v10.opaque[1]);

  }
  -[ARDaemonService setConnection:](self, "setConnection:", 0, v10.opaque[0], v10.opaque[1]);
  os_activity_scope_leave(&v10);
}

+ (id)serviceName
{
  return &stru_250702C60;
}

- (id)shortenedServiceNameForLogging
{
  return self->_shortenedServiceNameForLogging;
}

+ (int64_t)maximumConcurrentServicesPerClient
{
  if (maximumConcurrentServicesPerClient_onceToken != -1)
    dispatch_once(&maximumConcurrentServicesPerClient_onceToken, &__block_literal_global_1);
  return maximumConcurrentServicesPerClient_maximum;
}

uint64_t __53__ARDaemonService_maximumConcurrentServicesPerClient__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDFD958], "integerForKey:", *MEMORY[0x24BDFD8D8]);
  maximumConcurrentServicesPerClient_maximum = result;
  return result;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  objc_class *v6;
  id v7;
  void *v8;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  ARDaemonService *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[ARDaemonService connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARDaemonService setConnection:](self, "setConnection:", 0);
  objc_msgSend(v3, "invalidate");
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  v4 = _os_activity_create(&dword_235C46000, "Daemon service invalidate", (os_activity_t)self->_daemonServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v9);

  _ARLogGeneral_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "serviceName", v9.opaque[0], v9.opaque[1]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_235C46000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Invalidate: %{public}@", buf, 0x20u);

  }
  os_activity_scope_leave(&v9);

}

- (void)resume
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  id v6;
  void *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  ARDaemonService *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  v3 = _os_activity_create(&dword_235C46000, "Daemon service resume", (os_activity_t)self->_daemonServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v8);

  _ARLogGeneral_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "serviceName", v8.opaque[0], v8.opaque[1]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v10 = v6;
    v11 = 2048;
    v12 = self;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_235C46000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Resume: %{public}@", buf, 0x20u);

  }
  os_activity_scope_leave(&v8);
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  const __CFString *v8;
  int v9;
  void *v10;
  __int16 v11;
  ARDaemonService *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  _ARLogGeneral_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("NO");
    v9 = 138543874;
    v10 = v7;
    if (v3)
      v8 = CFSTR("YES");
    v11 = 2048;
    v12 = self;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_235C46000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Setting active to: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  self->_active = v3;
}

- (void)suspend
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  ARDaemonService *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[ARDaemonService connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  _ARLogGeneral_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "serviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = self;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_235C46000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Suspend: %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)startService:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSString *clientProcessName;
  NSObject *v9;
  _BYTE v10[22];
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  _ARLogGeneral_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)v10 = 138543874;
    *(_QWORD *)&v10[4] = v7;
    *(_WORD *)&v10[12] = 2048;
    *(_QWORD *)&v10[14] = self;
    v11 = 2114;
    v12 = clientProcessName;
    _os_log_impl(&dword_235C46000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Daemon service started: %{public}@", v10, 0x20u);

  }
  *(_QWORD *)v10 = 0;
  *(_QWORD *)&v10[8] = 0;
  v9 = _os_activity_create(&dword_235C46000, "Daemon service started", (os_activity_t)self->_daemonServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v9, (os_activity_scope_state_t)v10);

  v4[2](v4, 1);
  os_activity_scope_leave((os_activity_scope_state_t)v10);

}

+ (Class)remoteServiceClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isActive
{
  return self->_active;
}

- (ARDaemonServiceDataSource)dataSource
{
  return (ARDaemonServiceDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (ARDaemonServiceDelegate)delegate
{
  return (ARDaemonServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (ARRemoteServiceBaseProtocol)clientService
{
  return (ARRemoteServiceBaseProtocol *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)isAuthorized
{
  if (result)
    return *(_BYTE *)(result + 33) != 0;
  return result;
}

- (BOOL)isImmersive
{
  if (result)
    return *(_BYTE *)(result + 34) != 0;
  return result;
}

- (uint64_t)setImmersive:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 34) = a2;
  return result;
}

- (ARRemoteService)remoteService
{
  return (ARRemoteService *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRemoteService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_clientService, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_shortenedServiceNameForLogging, 0);
  objc_storeStrong((id *)&self->_daemonServiceActivity, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
