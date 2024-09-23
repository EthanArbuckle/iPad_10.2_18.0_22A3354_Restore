@implementation NPKSharedWebServiceProvider

+ (id)sharedWebServiceProvider
{
  if (sharedWebServiceProvider_onceToken != -1)
    dispatch_once(&sharedWebServiceProvider_onceToken, &__block_literal_global_22);
  return (id)sharedWebServiceProvider_sharedWebServiceProvider;
}

void __55__NPKSharedWebServiceProvider_sharedWebServiceProvider__block_invoke()
{
  NPKSharedWebServiceProvider *v0;
  void *v1;

  v0 = objc_alloc_init(NPKSharedWebServiceProvider);
  v1 = (void *)sharedWebServiceProvider_sharedWebServiceProvider;
  sharedWebServiceProvider_sharedWebServiceProvider = (uint64_t)v0;

}

- (NPKSharedWebServiceProvider)init
{
  NPKSharedWebServiceProvider *v2;
  NPKPaymentWebServiceCompanionTargetDevice *v3;
  NPKPaymentWebServiceCompanionTargetDevice *v4;
  NPKPeerPaymentWebServiceCompanionTargetDevice *v5;
  const char *v6;
  uint64_t v7;
  NPKSharedWebServiceProvider *v8;
  const char *v9;
  NPKSharedWebServiceProvider *v10;
  const char *v11;
  NPKSharedWebServiceProvider *v12;
  const char *v13;
  NPKPeerPaymentWebServiceCompanionTargetDevice *v14;
  const char *v15;
  NPKSharedWebServiceProvider *v16;
  void *v17;
  _QWORD v19[4];
  NPKSharedWebServiceProvider *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  NPKSharedWebServiceProvider *v25;
  id v26;
  _QWORD v27[4];
  NPKSharedWebServiceProvider *v28;
  id v29;
  _QWORD handler[4];
  NPKSharedWebServiceProvider *v31;
  id v32;
  id location;
  int out_token;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)NPKSharedWebServiceProvider;
  v2 = -[NPKSharedWebServiceProvider init](&v35, sel_init);
  if (v2)
  {
    v3 = [NPKPaymentWebServiceCompanionTargetDevice alloc];
    v4 = -[NPKPaymentWebServiceCompanionTargetDevice initWithContext:responseQueue:](v3, "initWithContext:responseQueue:", 0, MEMORY[0x24BDAC9B8]);
    -[NPKPaymentWebServiceCompanionTargetDevice setDelegate:](v4, "setDelegate:", v2);
    objc_storeStrong((id *)&v2->_targetDevice, v4);
    v5 = objc_alloc_init(NPKPeerPaymentWebServiceCompanionTargetDevice);
    objc_storeStrong((id *)&v2->_peerPaymentTargetDevice, v5);
    v2->_companionAgentConnectionLock._os_unfair_lock_opaque = 0;
    out_token = 0;
    objc_initWeak(&location, v2);
    v6 = (const char *)objc_msgSend(CFSTR("com.apple.NanoPassKit.NPKSharedPaymentWebServiceChanged"), "UTF8String");
    v7 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __35__NPKSharedWebServiceProvider_init__block_invoke;
    handler[3] = &unk_24CFEC060;
    objc_copyWeak(&v32, &location);
    v8 = v2;
    v31 = v8;
    notify_register_dispatch(v6, &out_token, MEMORY[0x24BDAC9B8], handler);

    v9 = (const char *)objc_msgSend(CFSTR("com.apple.NanoPassKit.NPKSharedPeerPaymentWebServiceChanged"), "UTF8String");
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __35__NPKSharedWebServiceProvider_init__block_invoke_44;
    v27[3] = &unk_24CFEC060;
    objc_copyWeak(&v29, &location);
    v10 = v8;
    v28 = v10;
    notify_register_dispatch(v9, &out_token, MEMORY[0x24BDAC9B8], v27);

    v11 = (const char *)objc_msgSend(CFSTR("com.apple.NanoPassKit.NPKPeerPaymentAccountChangedDarwinNotification"), "UTF8String");
    v24[0] = v7;
    v24[1] = 3221225472;
    v24[2] = __35__NPKSharedWebServiceProvider_init__block_invoke_45;
    v24[3] = &unk_24CFEC060;
    objc_copyWeak(&v26, &location);
    v12 = v10;
    v25 = v12;
    notify_register_dispatch(v11, &out_token, MEMORY[0x24BDAC9B8], v24);

    v13 = (const char *)objc_msgSend((id)*MEMORY[0x24BE6B448], "UTF8String");
    v14 = v5;
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __35__NPKSharedWebServiceProvider_init__block_invoke_46;
    v22[3] = &unk_24CFE78F0;
    objc_copyWeak(&v23, &location);
    notify_register_dispatch(v13, &out_token, MEMORY[0x24BDAC9B8], v22);

    v15 = (const char *)objc_msgSend((id)*MEMORY[0x24BE6B478], "UTF8String");
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __35__NPKSharedWebServiceProvider_init__block_invoke_49;
    v19[3] = &unk_24CFEC060;
    objc_copyWeak(&v21, &location);
    v16 = v12;
    v20 = v16;
    notify_register_dispatch(v15, &out_token, MEMORY[0x24BDAC9B8], v19);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v16, sel__deviceFailedToPair_, *MEMORY[0x24BE6B430], 0);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __35__NPKSharedWebServiceProvider_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint8_t v9[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Loading web service context", v9, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_webServiceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "webService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContext:", v5);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("NPKSharedWebServiceDidChangeNotification"), 0);

}

void __35__NPKSharedWebServiceProvider_init__block_invoke_44(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint8_t v9[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Loading peer payment web service context", v9, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_peerPaymentWebServiceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "peerPaymentWebService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContext:", v5);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("NPKSharedPeerPaymentWebServiceDidChangeNotification"), 0);

}

void __35__NPKSharedWebServiceProvider_init__block_invoke_45(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint8_t v8[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Loading peer payment account", v8, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_peerPaymentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setPeerPaymentAccount:", v5);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("NPKSharedPeerPaymentAccountDidChangeNotification"), 0);

}

void __35__NPKSharedWebServiceProvider_init__block_invoke_46(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint8_t v14[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Device unpaired", v14, 2u);
    }

  }
  v5 = objc_alloc_init(MEMORY[0x24BE6EDC0]);
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "webService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContext:", v5);

  v9 = objc_alloc_init(MEMORY[0x24BE6EE08]);
  v10 = objc_loadWeakRetained(v6);
  objc_msgSend(v10, "peerPaymentWebService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContext:", v9);

  v12 = objc_loadWeakRetained(v6);
  objc_msgSend(v12, "setPeerPaymentAccount:", 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("NPKSharedWebServiceActiveDeviceDidChangeNotification"), 0);
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("NPKSharedWebServiceDidChangeNotification"), 0);
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("NPKSharedPeerPaymentWebServiceDidChangeNotification"), 0);
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("NPKSharedPeerPaymentAccountDidChangeNotification"), 0);

}

void __35__NPKSharedWebServiceProvider_init__block_invoke_49(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint8_t v15[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Active watch changed", v15, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_webServiceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "webService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContext:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_peerPaymentWebServiceContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v10, "peerPaymentWebService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContext:", v9);

  objc_msgSend(*(id *)(a1 + 32), "_peerPaymentAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_loadWeakRetained(v6);
  objc_msgSend(v13, "setPeerPaymentAccount:", v12);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("NPKSharedWebServiceActiveDeviceDidChangeNotification"), 0);
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("NPKSharedWebServiceDidChangeNotification"), 0);
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("NPKSharedPeerPaymentWebServiceDidChangeNotification"), 0);
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("NPKSharedPeerPaymentAccountDidChangeNotification"), 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[NPKSharedWebServiceProvider targetDevice](self, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)NPKSharedWebServiceProvider;
  -[NPKSharedWebServiceProvider dealloc](&v5, sel_dealloc);
}

- (void)loadWebService
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NPKSharedPeerPaymentWebServiceArchiver *v20;
  NPKSharedPeerPaymentWebServiceArchiver *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  uint8_t buf[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Shared web service provider loading web service", buf, 2u);
    }

  }
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __45__NPKSharedWebServiceProvider_loadWebService__block_invoke;
  v27[3] = &unk_24CFE7998;
  v27[4] = self;
  os_unfair_lock_lock(&self->_companionAgentConnectionLock);
  __45__NPKSharedWebServiceProvider_loadWebService__block_invoke((uint64_t)v27);
  os_unfair_lock_unlock(&self->_companionAgentConnectionLock);
  -[NPKSharedWebServiceProvider _webServiceContext](self, "_webServiceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureElementID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(v6, "setDeviceID:", 0);
  -[NPKSharedWebServiceProvider webService](self, "webService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Shared web service provider updated web service context", buf, 2u);
      }

    }
    -[NPKSharedWebServiceProvider webService](self, "webService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContext:", v6);
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x24BE6EDB0]);
    -[NPKSharedWebServiceProvider targetDevice](self, "targetDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKSharedWebServiceProvider targetDevice](self, "targetDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "initWithContext:targetDevice:archiver:", v6, v14, v15);

    -[NPKSharedWebServiceProvider setWebService:](self, "setWebService:", v12);
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if ((_DWORD)v15)
    {
      pk_Payment_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Shared web service provider instantiated web service", buf, 2u);
      }

    }
  }

  -[NPKSharedWebServiceProvider _peerPaymentWebServiceContext](self, "_peerPaymentWebServiceContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKSharedWebServiceProvider peerPaymentWebService](self, "peerPaymentWebService");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[NPKSharedWebServiceProvider peerPaymentWebService](self, "peerPaymentWebService");
    v20 = (NPKSharedPeerPaymentWebServiceArchiver *)objc_claimAutoreleasedReturnValue();
    -[NPKSharedPeerPaymentWebServiceArchiver setContext:](v20, "setContext:", v18);
  }
  else
  {
    v21 = [NPKSharedPeerPaymentWebServiceArchiver alloc];
    -[NPKSharedWebServiceProvider companionAgentConnection](self, "companionAgentConnection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[NPKSharedPeerPaymentWebServiceArchiver initWithCompanionAgentConnection:](v21, "initWithCompanionAgentConnection:", v22);

    -[NPKSharedWebServiceProvider peerPaymentTargetDevice](self, "peerPaymentTargetDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EE00]), "initWithContext:targetDevice:archiver:", v18, v23, v20);
    objc_msgSend(MEMORY[0x24BE6EDF0], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPeerPaymentService:", v25);

    objc_msgSend(v23, "setPeerPaymentWebService:", v24);
    -[NPKSharedWebServiceProvider setPeerPaymentWebService:](self, "setPeerPaymentWebService:", v24);

  }
  -[NPKSharedWebServiceProvider _peerPaymentAccount](self, "_peerPaymentAccount");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKSharedWebServiceProvider setPeerPaymentAccount:](self, "setPeerPaymentAccount:", v26);

}

uint64_t __45__NPKSharedWebServiceProvider_loadWebService__block_invoke(uint64_t a1)
{
  NPKCompanionAgentConnection *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(NPKCompanionAgentConnection);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setQueueAppropriateFailedActions:", 1);
}

- (id)_webServiceContext
{
  os_unfair_lock_s *p_companionAgentConnectionLock;
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  uint8_t v12[16];
  _QWORD v13[2];
  void (*v14)(uint64_t);
  void *v15;
  NPKSharedWebServiceProvider *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__18;
  v22 = __Block_byref_object_dispose__18;
  v23 = 0;
  p_companionAgentConnectionLock = &self->_companionAgentConnectionLock;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v14 = __49__NPKSharedWebServiceProvider__webServiceContext__block_invoke;
  v15 = &unk_24CFE8318;
  v16 = self;
  v17 = &v18;
  v3 = v13;
  os_unfair_lock_lock(p_companionAgentConnectionLock);
  v14((uint64_t)v3);

  os_unfair_lock_unlock(p_companionAgentConnectionLock);
  v4 = (void *)v19[5];
  if (!v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: No web service context from daemon; starting fresh!",
          v12,
          2u);
      }

    }
    v8 = objc_alloc_init(MEMORY[0x24BE6EDC0]);
    v9 = (void *)v19[5];
    v19[5] = (uint64_t)v8;

    v4 = (void *)v19[5];
  }
  objc_msgSend(v4, "setTransactionServiceDisabled:", 1);
  objc_msgSend((id)v19[5], "setMessageServiceDisabled:", 1);
  objc_msgSend((id)v19[5], "setIgnoreProvisioningEnablementPercentage:", 1);
  v10 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __49__NPKSharedWebServiceProvider__webServiceContext__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  NPKPairedOrPairingDevice();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedPaymentWebServiceContextForDevice:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_peerPaymentWebServiceContext
{
  os_unfair_lock_s *p_companionAgentConnectionLock;
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  uint8_t v12[16];
  _QWORD v13[2];
  void (*v14)(uint64_t);
  void *v15;
  NPKSharedWebServiceProvider *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__18;
  v22 = __Block_byref_object_dispose__18;
  v23 = 0;
  p_companionAgentConnectionLock = &self->_companionAgentConnectionLock;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v14 = __60__NPKSharedWebServiceProvider__peerPaymentWebServiceContext__block_invoke;
  v15 = &unk_24CFE8318;
  v16 = self;
  v17 = &v18;
  v3 = v13;
  os_unfair_lock_lock(p_companionAgentConnectionLock);
  v14((uint64_t)v3);

  os_unfair_lock_unlock(p_companionAgentConnectionLock);
  v4 = (void *)v19[5];
  if (!v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: No peer payment web service context from daemon; starting fresh!",
          v12,
          2u);
      }

    }
    v8 = objc_alloc_init(MEMORY[0x24BE6EE08]);
    v9 = (void *)v19[5];
    v19[5] = (uint64_t)v8;

    v4 = (void *)v19[5];
  }
  v10 = v4;
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __60__NPKSharedWebServiceProvider__peerPaymentWebServiceContext__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  NPKPairedOrPairingDevice();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedPeerPaymentWebServiceContextForDevice:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_peerPaymentAccount
{
  os_unfair_lock_s *p_companionAgentConnectionLock;
  _QWORD *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  id v7;
  uint8_t v9[16];
  _QWORD v10[2];
  void (*v11)(uint64_t);
  void *v12;
  NPKSharedWebServiceProvider *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__18;
  v19 = __Block_byref_object_dispose__18;
  v20 = 0;
  p_companionAgentConnectionLock = &self->_companionAgentConnectionLock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v11 = __50__NPKSharedWebServiceProvider__peerPaymentAccount__block_invoke;
  v12 = &unk_24CFE8318;
  v13 = self;
  v14 = &v15;
  v3 = v10;
  os_unfair_lock_lock(p_companionAgentConnectionLock);
  v11((uint64_t)v3);

  os_unfair_lock_unlock(p_companionAgentConnectionLock);
  if (!v16[5])
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: No peer payment web service account from daemon", v9, 2u);
      }

    }
  }
  v7 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __50__NPKSharedWebServiceProvider__peerPaymentAccount__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  NPKPairedOrPairingDevice();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerPaymentAccountForDevice:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_deviceFailedToPair:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Device failed to pair: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  v8 = objc_alloc_init(MEMORY[0x24BE6EDC0]);
  -[NPKSharedWebServiceProvider webService](self, "webService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContext:", v8);

  v10 = objc_alloc_init(MEMORY[0x24BE6EE08]);
  -[NPKSharedWebServiceProvider peerPaymentWebService](self, "peerPaymentWebService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContext:", v10);

}

- (void)handlePushToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[NPKSharedWebServiceProvider webService](self, "webService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setPushToken:", v4);
  -[NPKSharedWebServiceProvider webService](self, "webService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKSharedWebServiceProvider targetDevice](self, "targetDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "archiveContext:", v8);

  -[NPKSharedWebServiceProvider peerPaymentWebService](self, "peerPaymentWebService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPushToken:", v4);

  objc_msgSend(v9, "archiver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "archiveContext:", v10);

}

- (void)handlePreconditionNotMetWithUniqueIDs:(id)a3 preconditionDescription:(id)a4 shouldUnregister:(BOOL)a5
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_ERROR, "Error: Should not be receiving precondition not met messages from Bridge (%@)", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)handlePaymentTransactions:(id)a3 appletStates:(id)a4 forUniqueIDs:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412802;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: Should not be receiving payment transactions from Bridge (%@ %@ %@)", (uint8_t *)&v13, 0x20u);
    }

  }
}

- (void)handleAppletState:(id)a3 forUniqueID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: Should not be receiving applet state from Bridge (%@ %@)", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)handleRemoveTransactionsWithIdentifiers:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Should not be receiving remove transactions from Bridge (%@)", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)handleBalanceUpdate:(id)a3 forUniqueID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: Should not be receiving balance update from Bridge (%@ %@)", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)handleBalanceReminderUpdate:(id)a3 balance:(id)a4 forUniqueID:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412802;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: Should not be receiving balance reminder update from Bridge (%@ %@ %@)", (uint8_t *)&v13, 0x20u);
    }

  }
}

- (void)handleCredentialsUpdate:(id)a3 forUniqueID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NPKSharedWebServiceProvider companionAgentConnection](self, "companionAgentConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateCredentials:forUniqueID:completion:", v10, v9, v8);

}

- (void)handleUpdatePaymentPassWithTypeIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Should not be receiving update payment pass requests from Bridge (%@)", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)handlePreferredAID:(id)a3 forPassWithUniqueID:(id)a4
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: Should not be receiving preferred AID updates from Bridge (%@)", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)archiveWebServiceContext:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Archive web service context: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  -[NPKSharedWebServiceProvider companionAgentConnection](self, "companionAgentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NPKPairedOrPairingDevice();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSharedPaymentWebServiceContext:forDevice:", v4, v9);

}

- (void)archiveWebServiceBackgroundContext:(id)a3
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: Should not be archiving web service background context from Bridge", v6, 2u);
    }

  }
}

- (void)handlePaymentWebServiceContextFromWatch:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Received updated webServiceContext:%@", (uint8_t *)&v11, 0xCu);
    }

  }
  -[NPKSharedWebServiceProvider webService](self, "webService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContext:", v4);

  -[NPKSharedWebServiceProvider companionAgentConnection](self, "companionAgentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NPKPairedOrPairingDevice();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSharedPaymentWebServiceContext:forDevice:", v4, v10);

}

- (void)sendWebServiceContextToWatch
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Shared web service provider: Sending web service context to watch", v9, 2u);
    }

  }
  -[NPKSharedWebServiceProvider targetDevice](self, "targetDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKSharedWebServiceProvider webService](self, "webService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendWebServiceContextToWatch:", v8);

}

- (void)showPaymentSetupForAppDisplayName:(id)a3
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: Should not be receiving show payment setup requests from Bridge", v6, 2u);
    }

  }
}

- (void)sendPaymentOptionsDefaultsToWatch
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v5[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Should not be receiving send payment options defaults requests from Bridge", v5, 2u);
    }

  }
}

- (void)setNewAuthRandom:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NPKSharedWebServiceProvider companionAgentConnection](self, "companionAgentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__NPKSharedWebServiceProvider_setNewAuthRandom___block_invoke;
  v7[3] = &unk_24CFEC088;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "paymentPassUniqueIDsSynchronous:reply:", 0, v7);

}

uint64_t __48__NPKSharedWebServiceProvider_setNewAuthRandom___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = objc_msgSend(a2, "count");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v3 == 0);
  return result;
}

- (void)handleUpdatedPeerPaymentWebServiceContext:(id)a3 account:(id)a4
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v7[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Should not be receiving updated peer payment web service context from Bridge", v7, 2u);
    }

  }
}

- (void)handleDownloadAllPaymentPasses
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v5[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Should not be receiving download all payment passes from Bridge", v5, 2u);
    }

  }
}

- (void)checkCompanionPeerPaymentRegistrationState
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v5[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Should not be receiving check companion peer payment registration state from Bridge", v5, 2u);
    }

  }
}

- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NPKSharedWebServiceProvider companionAgentConnection](self, "companionAgentConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startBackgroundVerificationObserverForPass:verificationMethod:", v7, v6);

}

- (void)noteForegroundVerificationObserverActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NPKSharedWebServiceProvider companionAgentConnection](self, "companionAgentConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteForegroundVerificationObserverActive:", v3);

}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
  objc_storeStrong((id *)&self->_webService, a3);
}

- (NPKPaymentWebServiceCompanionTargetDevice)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(id)a3
{
  objc_storeStrong((id *)&self->_targetDevice, a3);
}

- (PKPeerPaymentWebService)peerPaymentWebService
{
  return self->_peerPaymentWebService;
}

- (void)setPeerPaymentWebService:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentWebService, a3);
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (void)setPeerPaymentAccount:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
}

- (NPKCompanionAgentConnection)companionAgentConnection
{
  return self->_companionAgentConnection;
}

- (void)setCompanionAgentConnection:(id)a3
{
  objc_storeStrong((id *)&self->_companionAgentConnection, a3);
}

- (NPKPeerPaymentWebServiceCompanionTargetDevice)peerPaymentTargetDevice
{
  return self->_peerPaymentTargetDevice;
}

- (void)setPeerPaymentTargetDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentTargetDevice, a3);
}

- (os_unfair_lock_s)companionAgentConnectionLock
{
  return self->_companionAgentConnectionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentTargetDevice, 0);
  objc_storeStrong((id *)&self->_companionAgentConnection, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end
