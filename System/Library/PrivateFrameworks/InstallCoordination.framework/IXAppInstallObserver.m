@implementation IXAppInstallObserver

- (void)_internalInit
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *delegateQueue;
  NSObject *v5;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.installcoordination.AppInstallObserver.delegate", v5);
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = v3;

}

- (id)_oncePerBootUniqueIdentifierForServiceName:(id)a3
{
  const char *v3;
  CC_LONG v4;
  void *v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 md[20];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = strlen(v3);
  CC_SHA1(v3, v4, md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v5, "appendFormat:", CFSTR("%02hhx"), md[i]);
  v7 = (void *)objc_msgSend(v5, "copy");

  v8 = objc_msgSend(v7, "length");
  if (v8 >= 0x10)
    v9 = 16;
  else
    v9 = v8;
  objc_msgSend(v7, "substringToIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("installcood.f.%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (IXAppInstallObserver)initWithMachServiceName:(id)a3 forClients:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  IXAppInstallObserver *v11;
  IXAppInstallObserver *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IXAppInstallObserver;
  v11 = -[IXAppInstallObserver init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    -[IXAppInstallObserver _internalInit](v11, "_internalInit");
    v13 = _SelectorsRespondedToByDelegate();
    objc_storeWeak((id *)&v12->_delegate, v10);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v8);
    objc_msgSend(v14, "setDelegate:", v12);
    objc_msgSend(v14, "resume");
    -[IXAppInstallObserver setListener:](v12, "setListener:", v14);
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      _IXStringForObserverRespondsToSelectors(v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v25 = "-[IXAppInstallObserver initWithMachServiceName:forClients:delegate:]";
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_1A4BF6000, v15, OS_LOG_TYPE_DEFAULT, "%s: Creating IXAppInstallObserver with service name %@ for client IDs %@ responding to selectors %@", buf, 0x2Au);

    }
    -[IXAppInstallObserver _oncePerBootUniqueIdentifierForServiceName:](v12, "_oncePerBootUniqueIdentifierForServiceName:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __68__IXAppInstallObserver_initWithMachServiceName_forClients_delegate___block_invoke;
    v19[3] = &unk_1E4DC3EB8;
    v20 = v8;
    v21 = v9;
    v22 = v13;
    IXRunOncePerBootWork(v17, v19);

  }
  return v12;
}

void __68__IXAppInstallObserver_initWithMachServiceName_forClients_delegate___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    _IXStringForObserverRespondsToSelectors(a1[6]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315906;
    v9 = "-[IXAppInstallObserver initWithMachServiceName:forClients:delegate:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Notifying installcoordinationd of observer with service name %@ for client IDs %@ responding to selectors %@", (uint8_t *)&v8, 0x2Au);

  }
  objc_msgSend(v3, "_remote_registerObserverMachServiceName:forClientIdentifiers:respondingToSelectors:", a1[4], a1[5], a1[6]);

}

void __68__IXAppInstallObserver_initWithMachServiceName_forClients_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[IXAppInstallObserver initWithMachServiceName:forClients:delegate:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon to register mach service name: %@", (uint8_t *)&v4, 0x16u);
  }

}

- (id)initTransientForClients:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  IXAppInstallObserver *v8;
  id *p_isa;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IXAppInstallObserver;
  v8 = -[IXAppInstallObserver init](&v16, sel_init);
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    -[IXAppInstallObserver _internalInit](v8, "_internalInit");
    v10 = _SelectorsRespondedToByDelegate();
    objc_storeWeak(p_isa + 1, v7);
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", p_isa);
    objc_msgSend(v11, "resume");
    objc_msgSend(p_isa, "setListener:", v11);
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "endpoint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_remote_registerTransientObserver:forClientIdentifiers:respondingToSelectors:", v14, v6, v10);

  }
  return p_isa;
}

void __57__IXAppInstallObserver_initTransientForClients_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[IXAppInstallObserver initTransientForClients:delegate:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon to register endpoint: %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  IXAppInstallObserver *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[IXAppInstallObserver listener](self, "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[IXAppInstallObserver dealloc]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Deallocing %@", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)IXAppInstallObserver;
  -[IXAppInstallObserver dealloc](&v5, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = IXHasTrueValueForEntitlement(v5, (uint64_t)CFSTR("com.apple.private.installcoordinationd.daemon"));
  if ((v6 & 1) != 0)
  {
    +[IXAppInstallObserverProtocolInterface interface](IXAppInstallObserverProtocolInterface, "interface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v7);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_12);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_13);
    objc_msgSend(v5, "resume");
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      IXCopyClientNameForConnection(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315650;
      v12 = "-[IXAppInstallObserver listener:shouldAcceptNewConnection:]";
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = CFSTR("com.apple.private.installcoordinationd.daemon");
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Process %@ is missing %@ entitlement so rejecting connection attempt.", (uint8_t *)&v11, 0x20u);

    }
  }

  return v6;
}

- (void)_client_coordinatorShouldPrioritizeWithSeed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[4];
  NSObject *v10;
  id v11;
  char *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IXAppInstallObserver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[IXAppInstallObserver delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__IXAppInstallObserver__client_coordinatorShouldPrioritizeWithSeed___block_invoke;
    block[3] = &unk_1E4DC3EB8;
    v10 = v4;
    v12 = sel_coordinatorShouldPrioritize_;
    v11 = v5;
    dispatch_async(v6, block);

    v7 = v10;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinatorShouldPrioritize_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[IXAppInstallObserver _client_coordinatorShouldPrioritizeWithSeed:]";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }

}

void __68__IXAppInstallObserver__client_coordinatorShouldPrioritizeWithSeed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(_QWORD *)(a1 + 32));
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerAppInstallCoordinatorForUpdates:notifyDaemon:", v2, 1);

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "intent");
    if (v7 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4DC4C38[v7];
    }
    *(_DWORD *)buf = 136315906;
    v10 = "-[IXAppInstallObserver _client_coordinatorShouldPrioritizeWithSeed:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "coordinatorShouldPrioritize:", v2);

}

- (void)_client_shouldPrioritizeAppWithBundleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[4];
  NSObject *v10;
  id v11;
  char *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IXAppInstallObserver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[IXAppInstallObserver delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__IXAppInstallObserver__client_shouldPrioritizeAppWithBundleID___block_invoke;
    block[3] = &unk_1E4DC3EB8;
    v12 = sel_shouldPrioritizeAppWithBundleID_;
    v10 = v4;
    v11 = v5;
    dispatch_async(v6, block);

    v7 = v10;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_shouldPrioritizeAppWithBundleID_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[IXAppInstallObserver _client_shouldPrioritizeAppWithBundleID:]";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }

}

uint64_t __64__IXAppInstallObserver__client_shouldPrioritizeAppWithBundleID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXAppInstallObserver _client_shouldPrioritizeAppWithBundleID:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1A4BF6000, v2, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for bundle ID %@", (uint8_t *)&v6, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 40), "shouldPrioritizeAppWithBundleID:", *(_QWORD *)(a1 + 32));
}

- (void)_client_shouldPrioritizeAppWithIdentity:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[4];
  NSObject *v10;
  id v11;
  char *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IXAppInstallObserver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[IXAppInstallObserver delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__IXAppInstallObserver__client_shouldPrioritizeAppWithIdentity___block_invoke;
    block[3] = &unk_1E4DC3EB8;
    v12 = sel_shouldPrioritizeAppWithIdentity_;
    v10 = v4;
    v11 = v5;
    dispatch_async(v6, block);

    v7 = v10;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_shouldPrioritizeAppWithIdentity_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[IXAppInstallObserver _client_shouldPrioritizeAppWithIdentity:]";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }

}

uint64_t __64__IXAppInstallObserver__client_shouldPrioritizeAppWithIdentity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXAppInstallObserver _client_shouldPrioritizeAppWithIdentity:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1A4BF6000, v2, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for identity %@", (uint8_t *)&v6, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 40), "shouldPrioritizeAppWithIdentity:", *(_QWORD *)(a1 + 32));
}

- (void)_client_coordinatorShouldResumeWithSeed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[4];
  NSObject *v10;
  id v11;
  char *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IXAppInstallObserver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[IXAppInstallObserver delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__IXAppInstallObserver__client_coordinatorShouldResumeWithSeed___block_invoke;
    block[3] = &unk_1E4DC3EB8;
    v10 = v4;
    v12 = sel_coordinatorShouldResume_;
    v11 = v5;
    dispatch_async(v6, block);

    v7 = v10;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinatorShouldResume_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[IXAppInstallObserver _client_coordinatorShouldResumeWithSeed:]";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }

}

void __64__IXAppInstallObserver__client_coordinatorShouldResumeWithSeed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(_QWORD *)(a1 + 32));
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerAppInstallCoordinatorForUpdates:notifyDaemon:", v2, 1);

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "intent");
    if (v7 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4DC4C38[v7];
    }
    *(_DWORD *)buf = 136315906;
    v10 = "-[IXAppInstallObserver _client_coordinatorShouldResumeWithSeed:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "coordinatorShouldResume:", v2);

}

- (void)_client_coordinatorShouldPauseWithSeed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[4];
  NSObject *v10;
  id v11;
  char *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IXAppInstallObserver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[IXAppInstallObserver delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__IXAppInstallObserver__client_coordinatorShouldPauseWithSeed___block_invoke;
    block[3] = &unk_1E4DC3EB8;
    v10 = v4;
    v12 = sel_coordinatorShouldPause_;
    v11 = v5;
    dispatch_async(v6, block);

    v7 = v10;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinatorShouldPause_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[IXAppInstallObserver _client_coordinatorShouldPauseWithSeed:]";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }

}

void __63__IXAppInstallObserver__client_coordinatorShouldPauseWithSeed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(_QWORD *)(a1 + 32));
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerAppInstallCoordinatorForUpdates:notifyDaemon:", v2, 1);

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "intent");
    if (v7 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4DC4C38[v7];
    }
    *(_DWORD *)buf = 136315906;
    v10 = "-[IXAppInstallObserver _client_coordinatorShouldPauseWithSeed:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "coordinatorShouldPause:", v2);

}

- (void)_client_coordinatorWithSeed:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  char *v14;
  unint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IXAppInstallObserver delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[IXAppInstallObserver delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__IXAppInstallObserver__client_coordinatorWithSeed_configuredPromiseDidBeginFulfillment___block_invoke;
    v11[3] = &unk_1E4DC4BF0;
    v12 = v6;
    v14 = sel_coordinator_configuredPromiseDidBeginFulfillment_;
    v13 = v7;
    v15 = a4;
    dispatch_async(v8, v11);

    v9 = v12;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinator_configuredPromiseDidBeginFulfillment_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v17 = "-[IXAppInstallObserver _client_coordinatorWithSeed:configuredPromiseDidBeginFulfillment:]";
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1A4BF6000, v9, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }

}

void __89__IXAppInstallObserver__client_coordinatorWithSeed_configuredPromiseDidBeginFulfillment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(_QWORD *)(a1 + 32));
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerAppInstallCoordinatorForUpdates:notifyDaemon:", v2, 1);

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "intent");
    if (v7 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4DC4C38[v7];
    }
    *(_DWORD *)buf = 136315906;
    v10 = "-[IXAppInstallObserver _client_coordinatorWithSeed:configuredPromiseDidBeginFulfillment:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "coordinator:configuredPromiseDidBeginFulfillment:", v2, *(_QWORD *)(a1 + 56));

}

- (void)_client_coordinatorShouldBeginRestoringUserDataWithSeed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[4];
  NSObject *v10;
  id v11;
  char *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IXAppInstallObserver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[IXAppInstallObserver delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__IXAppInstallObserver__client_coordinatorShouldBeginRestoringUserDataWithSeed___block_invoke;
    block[3] = &unk_1E4DC3EB8;
    v10 = v4;
    v12 = sel_coordinatorShouldBeginRestoringUserData_;
    v11 = v5;
    dispatch_async(v6, block);

    v7 = v10;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinatorShouldBeginRestoringUserData_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[IXAppInstallObserver _client_coordinatorShouldBeginRestoringUserDataWithSeed:]";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }

}

void __80__IXAppInstallObserver__client_coordinatorShouldBeginRestoringUserDataWithSeed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(_QWORD *)(a1 + 32));
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerAppInstallCoordinatorForUpdates:notifyDaemon:", v2, 1);

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "intent");
    if (v7 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4DC4C38[v7];
    }
    *(_DWORD *)buf = 136315906;
    v10 = "-[IXAppInstallObserver _client_coordinatorShouldBeginRestoringUserDataWithSeed:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "coordinatorShouldBeginRestoringUserData:", v2);

}

- (void)_client_coordinatorDidInstallPlaceholderWithSeed:(id)a3 forRecordPromise:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  char *v22;
  char *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IXAppInstallObserver delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 1;
  else
    v9 = objc_opt_respondsToSelector();
  if (!-[objc_class modifiesLocalLaunchServicesDatabase](+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(v6, "intent")), "modifiesLocalLaunchServicesDatabase"))
  {
    v12 = 0;
    if ((v9 & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v6, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IXApplicationRecordForRecordPromise(v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v9 & 1) != 0)
  {
LABEL_8:
    -[IXAppInstallObserver delegateQueue](self, "delegateQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__IXAppInstallObserver__client_coordinatorDidInstallPlaceholderWithSeed_forRecordPromise___block_invoke;
    block[3] = &unk_1E4DC4C18;
    v19 = v6;
    v20 = v8;
    v22 = sel_coordinatorDidInstallPlaceholder_;
    v23 = sel_coordinatorDidInstallPlaceholder_forApplicationRecord_;
    v21 = v12;
    dispatch_async(v13, block);

  }
LABEL_9:
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinatorDidInstallPlaceholder_);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v25 = "-[IXAppInstallObserver _client_coordinatorDidInstallPlaceholderWithSeed:forRecordPromise:]";
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_1A4BF6000, v14, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinatorDidInstallPlaceholder_forApplicationRecord_);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v25 = "-[IXAppInstallObserver _client_coordinatorDidInstallPlaceholderWithSeed:forRecordPromise:]";
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_1A4BF6000, v16, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }

}

void __90__IXAppInstallObserver__client_coordinatorDidInstallPlaceholderWithSeed_forRecordPromise___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  __CFString *v13;
  uint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(_QWORD *)(a1 + 32));
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerAppInstallCoordinatorForUpdates:notifyDaemon:", v2, 1);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "bundleID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 32), "intent");
      if (v7 >= 8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v7);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = off_1E4DC4C38[v7];
      }
      *(_DWORD *)buf = 136315906;
      v16 = "-[IXAppInstallObserver _client_coordinatorDidInstallPlaceholderWithSeed:forRecordPromise:]_block_invoke";
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 40), "coordinatorDidInstallPlaceholder:", v2);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "bundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 32), "intent");
      if (v12 >= 8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E4DC4C38[v12];
      }
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136316162;
      v16 = "-[IXAppInstallObserver _client_coordinatorDidInstallPlaceholderWithSeed:forRecordPromise:]_block_invoke";
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1A4BF6000, v9, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@) with app record %@", buf, 0x34u);

    }
    objc_msgSend(*(id *)(a1 + 40), "coordinatorDidInstallPlaceholder:forApplicationRecord:", v2, *(_QWORD *)(a1 + 48));
  }

}

- (void)_client_coordinatorShouldBeginPostProcessingWithSeed:(id)a3 forRecordPromise:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  unint64_t v18;
  __CFString *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IXAppInstallObserver delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (-[objc_class modifiesLocalLaunchServicesDatabase](+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(v6, "intent")), "modifiesLocalLaunchServicesDatabase"))
    {
      objc_msgSend(v6, "identity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      IXApplicationRecordForRecordPromise(v7, v10);
      v11 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    v13 = (void *)objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(v6, "intent"))), "initWithSeed:", v6);
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerAppInstallCoordinatorForUpdates:notifyDaemon:", v13, 1);

    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinatorShouldBeginPostProcessing_forApplicationRecord_);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "intent");
      if (v18 >= 8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v18);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = off_1E4DC4C38[v18];
      }
      *(_DWORD *)buf = 136315906;
      v21 = "-[IXAppInstallObserver _client_coordinatorShouldBeginPostProcessingWithSeed:forRecordPromise:]";
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_1A4BF6000, v15, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);

    }
    objc_msgSend(v8, "coordinatorShouldBeginPostProcessing:forApplicationRecord:", v13, v11);

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinatorShouldBeginPostProcessing_forApplicationRecord_);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "-[IXAppInstallObserver _client_coordinatorShouldBeginPostProcessingWithSeed:forRecordPromise:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1A4BF6000, v11, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }

}

- (void)_client_coordinatorDidCompleteSuccessfullyWithSeed:(id)a3 forRecordPromise:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  char *v22;
  char *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IXAppInstallObserver delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 1;
  else
    v9 = objc_opt_respondsToSelector();
  if (!-[objc_class modifiesLocalLaunchServicesDatabase](+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(v6, "intent")), "modifiesLocalLaunchServicesDatabase"))
  {
    v12 = 0;
    if ((v9 & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v6, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IXApplicationRecordForRecordPromise(v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v9 & 1) != 0)
  {
LABEL_8:
    -[IXAppInstallObserver delegateQueue](self, "delegateQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__IXAppInstallObserver__client_coordinatorDidCompleteSuccessfullyWithSeed_forRecordPromise___block_invoke;
    block[3] = &unk_1E4DC4C18;
    v19 = v6;
    v20 = v12;
    v21 = v8;
    v22 = sel_coordinatorDidCompleteSuccessfully_;
    v23 = sel_coordinatorDidCompleteSuccessfully_forApplicationRecord_;
    dispatch_async(v13, block);

  }
LABEL_9:
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinatorDidCompleteSuccessfully_);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v25 = "-[IXAppInstallObserver _client_coordinatorDidCompleteSuccessfullyWithSeed:forRecordPromise:]";
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_1A4BF6000, v14, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinatorDidCompleteSuccessfully_forApplicationRecord_);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v25 = "-[IXAppInstallObserver _client_coordinatorDidCompleteSuccessfullyWithSeed:forRecordPromise:]";
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_1A4BF6000, v16, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }

}

void __92__IXAppInstallObserver__client_coordinatorDidCompleteSuccessfullyWithSeed_forRecordPromise___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  __CFString *v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setComplete:forApplicationRecord:", 1, *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "bundleID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 32), "intent");
      if (v6 >= 8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v6);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E4DC4C38[v6];
      }
      *(_DWORD *)buf = 136315906;
      v15 = "-[IXAppInstallObserver _client_coordinatorDidCompleteSuccessfullyWithSeed:forRecordPromise:]_block_invoke";
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 48), "coordinatorDidCompleteSuccessfully:", v2);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1 + 32), "intent");
      if (v11 >= 8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E4DC4C38[v11];
      }
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v15 = "-[IXAppInstallObserver _client_coordinatorDidCompleteSuccessfullyWithSeed:forRecordPromise:]_block_invoke";
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@) with app record %@", buf, 0x34u);

    }
    objc_msgSend(*(id *)(a1 + 48), "coordinatorDidCompleteSuccessfully:forApplicationRecord:", v2, *(_QWORD *)(a1 + 40));
  }

}

- (void)_client_coordinatorWithSeed:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD block[4];
  NSObject *v15;
  id v16;
  id v17;
  unint64_t v18;
  char *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[IXAppInstallObserver delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[IXAppInstallObserver delegateQueue](self, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__IXAppInstallObserver__client_coordinatorWithSeed_didCancelWithReason_client___block_invoke;
    block[3] = &unk_1E4DC4C18;
    v15 = v8;
    v16 = v9;
    v18 = a5;
    v19 = sel_coordinator_canceledWithReason_client_;
    v17 = v10;
    dispatch_async(v11, block);

    v12 = v15;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_coordinator_canceledWithReason_client_);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "-[IXAppInstallObserver _client_coordinatorWithSeed:didCancelWithReason:client:]";
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1A4BF6000, v12, OS_LOG_TYPE_DEFAULT, "%s: Delegate did not respond to %@", buf, 0x16u);

    }
  }

}

void __79__IXAppInstallObserver__client_coordinatorWithSeed_didCancelWithReason_client___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(+[IXAppInstallCoordinator classForIntent:](IXAppInstallCoordinator, "classForIntent:", objc_msgSend(*(id *)(a1 + 32), "intent"))), "initWithSeed:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setErrorSourceIdentifier:", *(_QWORD *)(a1 + 56));
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "intent");
    if (v6 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E4DC4C38[v6];
    }
    *(_DWORD *)buf = 136315906;
    v9 = "-[IXAppInstallObserver _client_coordinatorWithSeed:didCancelWithReason:client:]_block_invoke";
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Calling %@ on delegate for coordinator %@ (%@)", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 48), "coordinator:canceledWithReason:client:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

- (IXAppInstallObserverDelegate)delegate
{
  return (IXAppInstallObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
