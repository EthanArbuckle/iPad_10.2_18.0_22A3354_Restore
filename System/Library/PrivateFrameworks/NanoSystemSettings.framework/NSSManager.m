@implementation NSSManager

- (void)getAccountsInfo:(id)a3
{
  -[NSSManager getAccountsInfoForAccountType:completionHandler:](self, "getAccountsInfoForAccountType:completionHandler:", 0, a3);
}

void __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_2;
    v12[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v14, v2);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_2_235;
    v9[3] = &unk_24CB9F200;
    objc_copyWeak(&v11, v2);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "getAccountsInfoForAccountType:completionHandler:", v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
  }

}

- (void)getAccountsInfoForAccountType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  NSSLogForType(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x212BD875C](v7);
    *(_DWORD *)buf = 138412546;
    v19 = v6;
    v20 = 2048;
    v21 = v9;
    _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "accountType: (%@); replyBlock: (%p)", buf, 0x16u);

  }
  if (!v7)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  v10 = (void *)objc_msgSend(v6, "copy");
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke;
  block[3] = &unk_24CB9F3B8;
  objc_copyWeak(&v17, (id *)buf);
  v15 = v10;
  v16 = v7;
  v12 = v10;
  v13 = v7;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (NSSManager)initWithQueue:(id)a3
{
  id v4;
  NSSManager *v5;
  NSObject *v6;
  id v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *externalQueue;
  OS_dispatch_queue *v12;
  id v13;
  objc_super v15;
  uint8_t buf[4];
  NSSManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NSSManager;
  v5 = -[NSSManager init](&v15, sel_init);
  if (v5)
  {
    NSSLogForType(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v5;
      _os_log_impl(&dword_211335000, v6, OS_LOG_TYPE_DEFAULT, "%p", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.nanosystemsettings.NSSManager.%p"), v5);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), 0);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v8;

    if (v4)
    {
      v10 = (OS_dispatch_queue *)v4;
      externalQueue = v5->_externalQueue;
      v5->_externalQueue = v10;
    }
    else
    {
      v12 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      v13 = MEMORY[0x24BDAC9B8];
      externalQueue = v5->_externalQueue;
      v5->_externalQueue = v12;
    }

  }
  return v5;
}

- (id)connection
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  uint64_t v6;
  NSXPCConnection *v7;
  _QWORD v9[4];
  id v10;
  id location;
  _QWORD block[5];

  if (NSSShouldRun())
  {
    xpcConnection = self->_xpcConnection;
    if (!xpcConnection)
    {
      v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.nanosystemsettings"), 4096);
      v5 = self->_xpcConnection;
      self->_xpcConnection = v4;

      v6 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __24__NSSManager_connection__block_invoke;
      block[3] = &unk_24CB9EFE8;
      block[4] = self;
      if (connection_onceToken != -1)
        dispatch_once(&connection_onceToken, block);
      -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", connection_remoteObjectInterface);
      -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", &__block_literal_global);
      objc_initWeak(&location, self);
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __24__NSSManager_connection__block_invoke_135;
      v9[3] = &unk_24CB9F050;
      objc_copyWeak(&v10, &location);
      -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v9);
      -[NSXPCConnection resume](self->_xpcConnection, "resume");
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
      xpcConnection = self->_xpcConnection;
    }
    v7 = xpcConnection;
  }
  else
  {
    -[NSSManager unsafe_invalidate](self, "unsafe_invalidate");
    v7 = 0;
  }
  return v7;
}

- (void)unsafe_invalidate
{
  NSXPCConnection *xpcConnection;

  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (NSSManager)init
{
  return -[NSSManager initWithQueue:](self, "initWithQueue:", 0);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  NSSManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NSSLogForType(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_211335000, v3, OS_LOG_TYPE_DEFAULT, "%p", buf, 0xCu);
  }

  -[NSSManager unsafe_invalidate](self, "unsafe_invalidate");
  v4.receiver = self;
  v4.super_class = (Class)NSSManager;
  -[NSSManager dealloc](&v4, sel_dealloc);
}

- (id)protocol
{
  return &unk_254AB12C0;
}

void __24__NSSManager_connection__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[5];
  _QWORD v31[4];
  _QWORD v32[7];
  _QWORD v33[6];
  _QWORD v34[7];

  v34[5] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD1990];
  objc_msgSend(*(id *)(a1 + 32), "protocol");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "interfaceWithProtocol:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)connection_remoteObjectInterface;
  connection_remoteObjectInterface = v3;

  v5 = (void *)connection_remoteObjectInterface;
  v6 = (void *)MEMORY[0x24BDBCF20];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v34[2] = objc_opt_class();
  v34[3] = objc_opt_class();
  v34[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getUsageData_, 0, 1);

  v9 = (void *)connection_remoteObjectInterface;
  v10 = (void *)MEMORY[0x24BDBCF20];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v33[2] = objc_opt_class();
  v33[3] = objc_opt_class();
  v33[4] = objc_opt_class();
  v33[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_getUsage_, 0, 1);

  v13 = (void *)connection_remoteObjectInterface;
  v14 = (void *)MEMORY[0x24BDBCF20];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v32[3] = objc_opt_class();
  v32[4] = objc_opt_class();
  v32[5] = objc_opt_class();
  v32[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_getProfilesInfo_, 0, 1);

  v17 = (void *)connection_remoteObjectInterface;
  v18 = (void *)MEMORY[0x24BDBCF20];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  v31[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler_, 0, 1);

  v21 = (void *)connection_remoteObjectInterface;
  v22 = (void *)MEMORY[0x24BDBCF20];
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v30[2] = objc_opt_class();
  v30[3] = objc_opt_class();
  v30[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_getAccountsInfoForAccountType_completionHandler_, 0, 1);

  v25 = (void *)connection_remoteObjectInterface;
  v26 = (void *)MEMORY[0x24BDBCF20];
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v29[2] = objc_opt_class();
  v29[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWithArray:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_getWatchFaces_, 0, 1);

}

void __24__NSSManager_connection__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  NSSLogForType(1);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_211335000, v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v1, 2u);
  }

}

void __24__NSSManager_connection__block_invoke_135(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[16];

  NSSLogForType(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211335000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "internalQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __24__NSSManager_connection__block_invoke_136;
    block[3] = &unk_24CB9EFE8;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

uint64_t __24__NSSManager_connection__block_invoke_136(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
}

- (void)setSafetyXpcInterruptionHandlerBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__NSSManager_setSafetyXpcInterruptionHandlerBlock___block_invoke;
  v7[3] = &unk_24CB9F098;
  v5 = v4;
  v8 = v5;
  objc_copyWeak(&v9, &location);
  v6 = (void *)MEMORY[0x212BD875C](v7);
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __51__NSSManager_setSafetyXpcInterruptionHandlerBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  NSSLogForType(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)MEMORY[0x212BD875C](*(_QWORD *)(a1 + 32));
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_211335000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted, calling safety block %@", (uint8_t *)&v7, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterruptionHandler:", &__block_literal_global_138);

}

void __51__NSSManager_setSafetyXpcInterruptionHandlerBlock___block_invoke_137()
{
  NSObject *v0;
  uint8_t v1[16];

  NSSLogForType(1);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_211335000, v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v1, 2u);
  }

}

- (void)invalidate
{
  NSObject *v3;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[4];
  NSSManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  NSSLogForType(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_211335000, v3, OS_LOG_TYPE_DEFAULT, "%p", buf, 0xCu);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__NSSManager_invalidate__block_invoke;
  block[3] = &unk_24CB9EFE8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __24__NSSManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unsafe_invalidate");
}

- (void)enableAirplaneMode:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *internalQueue;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  _BOOL4 v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  NSSLogForType(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x212BD875C](v6);
    *(_DWORD *)buf = 67109376;
    v15 = v4;
    v16 = 2048;
    v17 = v8;
    _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "enable: (%d); replyBlock: (%p)", buf, 0x12u);

  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke;
  block[3] = &unk_24CB9F160;
  block[4] = self;
  v12 = v6;
  v13 = v4;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  if (v3)
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_2;
    v26[3] = &unk_24CB9F0E8;
    v26[4] = *(_QWORD *)(a1 + 32);
    v27 = v3;
    v5 = (void *)MEMORY[0x212BD875C](v26);

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setSafetyXpcInterruptionHandlerBlock:", v5);
  objc_msgSend(*(id *)(a1 + 32), "externalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v23[0] = v4;
    v23[1] = 3221225472;
    v23[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_4;
    v23[3] = &unk_24CB9F138;
    v25 = *(id *)(a1 + 40);
    v7 = v6;
    v24 = v7;
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 48);
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_2_141;
    v20[3] = &unk_24CB9F138;
    v22 = *(id *)(a1 + 40);
    v21 = v7;
    objc_msgSend(v8, "enableAirplaneMode:completionHandler:", v9, v20);

    v19[0] = v4;
    v19[1] = 3221225472;
    v19[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_2_143;
    v19[3] = &unk_24CB9EFE8;
    v19[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "addBarrierBlock:", v19);

    v10 = v25;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    v31[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_211335000, v14, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_149;
    block[3] = &unk_24CB9F110;
    v15 = *(id *)(a1 + 40);
    v17 = v13;
    v18 = v15;
    v10 = v13;
    dispatch_async(v6, block);

  }
}

void __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_3;
  block[3] = &unk_24CB9F0C0;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = *(NSObject **)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_139;
    v7[3] = &unk_24CB9F110;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_139(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_2_141(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_142;
    block[3] = &unk_24CB9F0C0;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_142(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_149(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)displayAlertWithTitle:(id)a3 body:(id)a4 icon:(id)a5
{
  id v7;
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  CFUserNotificationRef v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD block[6];
  SInt32 error;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[7];
  _QWORD v27[8];

  v27[7] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (uint64_t (*)(uint64_t, uint64_t))a5;
  NSSLogForType(1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v23 = v9;
    _os_log_impl(&dword_211335000, v10, OS_LOG_TYPE_DEFAULT, "title: (%@); body: (%@); iconURL: (%@)", buf, 0x20u);
  }

  if (v7 && v8)
  {
    v11 = *MEMORY[0x24BDBD6E0];
    v26[0] = *MEMORY[0x24BDBD6D8];
    v26[1] = v11;
    v27[0] = v7;
    v27[1] = v8;
    v12 = *MEMORY[0x24BDBD6E8];
    v26[2] = *MEMORY[0x24BEB0E40];
    v26[3] = v12;
    v27[2] = MEMORY[0x24BDBD1C0];
    v27[3] = MEMORY[0x24BDBD1C8];
    v13 = *MEMORY[0x24BEB0DE8];
    v26[4] = *MEMORY[0x24BEB0E58];
    v26[5] = v13;
    v27[4] = MEMORY[0x24BDBD1C0];
    v27[5] = MEMORY[0x24BDBD1C0];
    v26[6] = *MEMORY[0x24BEB0E90];
    v27[6] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "mutableCopy");

    if (v9)
      -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDBD700]);
    error = 0;
    v16 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, (CFDictionaryRef)v15);
    if (v16 && !error)
      goto LABEL_12;
    NSSLogForType(1);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = error;
      _os_log_impl(&dword_211335000, v17, OS_LOG_TYPE_DEFAULT, "Failed to create CFUserNotificationRef (%p) with error: %d", buf, 0x12u);
    }

    if (v16)
    {
LABEL_12:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v23 = __Block_byref_object_copy_;
      v24 = __Block_byref_object_dispose_;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), "+[NSSManager displayAlertWithTitle:body:icon:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSSOSTransactionCreate(v18);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      dispatch_get_global_queue(0, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__NSSManager_displayAlertWithTitle_body_icon___block_invoke;
      block[3] = &unk_24CB9F188;
      block[4] = buf;
      block[5] = v16;
      dispatch_async(v19, block);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    NSSLogForType(1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_211335000, v15, OS_LOG_TYPE_DEFAULT, "Error: alert has either nil title (%@) or body (%@)", buf, 0x16u);
    }
  }

}

void __46__NSSManager_displayAlertWithTitle_body_icon___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 40), 0.0, 0);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  NSSOSTransactionComplete(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

+ (void)displayAlertFailedRemoteAirplaneMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v3 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, (const char *)&unk_211367E22, v12, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
    v8 = CFSTR("ENABLE_AIRPLANE_ALERT_MSG_COMPANION");
  else
    v8 = CFSTR("DISABLE_AIRPLANE_ALERT_MSG_COMPANION");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24CB9FCF0, CFSTR("Localization-shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_ALERT_TITLE"), &stru_24CB9FCF0, CFSTR("Localization-shared"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayAlertWithTitle:body:icon:", v11, v9, 0);

}

+ (void)displayAirplaneModeMirroringUserEducationAlert:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v3 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, (const char *)&unk_211367E22, v12, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
    v8 = CFSTR("ENABLE_AIRPLANE_EDUCATION_ALERT_MSG_COMPANION");
  else
    v8 = CFSTR("DISABLE_AIRPLANE_EDUCATION_ALERT_MSG_COMPANION");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24CB9FCF0, CFSTR("Localization-shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_EDUCATION_ALERT_TITLE"), &stru_24CB9FCF0, CFSTR("Localization-shared"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayAlertWithTitle:body:icon:", v11, v9, 0);

}

- (void)retrieveAirplaneModeSettingsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 134217984;
    v13 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "replyblock: (%p)", buf, 0xCu);

  }
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyblock"));
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke;
  block[3] = &unk_24CB9F228;
  objc_copyWeak(&v11, (id *)buf);
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v12, v2);
    v11 = a1[5];
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_2_174;
    v7[3] = &unk_24CB9F200;
    objc_copyWeak(&v9, v2);
    v8 = a1[5];
    objc_msgSend(v6, "retrieveAirplaneModeSettingsWithCompletionHandler:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
  }

}

void __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_173;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_173(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_2_174(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_3;
    block[3] = &unk_24CB9F1D8;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setAirplaneModeSettings:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *internalQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  NSSLogForType(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x212BD875C](v7);
    *(_DWORD *)buf = 134217984;
    v20 = v9;
    _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v7)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  objc_msgSend(v6, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 != 3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("setting dict must have all three keys"));
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke;
  v15[3] = &unk_24CB9F250;
  objc_copyWeak(&v18, (id *)buf);
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v13 = v6;
  v14 = v7;
  dispatch_async(internalQueue, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_2;
    v11[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v13, v2);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_2_181;
    v8[3] = &unk_24CB9F200;
    objc_copyWeak(&v10, v2);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "setAirplaneModeSettings:withCompletionHandler:", v7, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
  }

}

void __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_180;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_180(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_2_181(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_3;
    block[3] = &unk_24CB9F1D8;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getUsageData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 134217984;
    v13 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __27__NSSManager_getUsageData___block_invoke;
  v9[3] = &unk_24CB9F2A0;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v4;
  v8 = v4;
  dispatch_async(internalQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __27__NSSManager_getUsageData___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __27__NSSManager_getUsageData___block_invoke_2;
    v11[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v13, v2);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __27__NSSManager_getUsageData___block_invoke_2_183;
    v8[3] = &unk_24CB9F278;
    objc_copyWeak(&v10, v2);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "getUsageData:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
  }

}

void __27__NSSManager_getUsageData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __27__NSSManager_getUsageData___block_invoke_182;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __27__NSSManager_getUsageData___block_invoke_182(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __27__NSSManager_getUsageData___block_invoke_2_183(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NSSLogForType(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "usageRespMsg: (%@); error: (%@)", buf, 0x16u);
  }

  v8 = +[NSSUsageData newUsageDataFromUsageRespMsg:](NSSUsageData, "newUsageDataFromUsageRespMsg:", v5);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__NSSManager_getUsageData___block_invoke_185;
    block[3] = &unk_24CB9F1D8;
    v15 = *(id *)(a1 + 32);
    v13 = v8;
    v14 = v6;
    dispatch_async(v11, block);

  }
}

uint64_t __27__NSSManager_getUsageData___block_invoke_185(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)deviceInUseAfterSetupWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 134217984;
    v13 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke;
  v9[3] = &unk_24CB9F2A0;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v4;
  v8 = v4;
  dispatch_async(internalQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v13, v2);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_2_188;
    v8[3] = &unk_24CB9F2F0;
    objc_copyWeak(&v10, v2);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "notifyRemoteDeviceOfUsageAfterSetup:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
  }

}

void __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "Notify Usage of Remote Device Error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_187;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_187(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_2_188(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  NSSLogForType(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v15 = a2;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_211335000, v6, OS_LOG_TYPE_DEFAULT, "Notify Usage of Remote Device Success: %{BOOL}d Error: (%@)", buf, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_189;
    block[3] = &unk_24CB9F2C8;
    v12 = *(id *)(a1 + 32);
    v13 = a2;
    v11 = v5;
    dispatch_async(v9, block);

  }
}

uint64_t __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_189(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)passcodeLockRemoteDeviceWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 134217984;
    v13 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke;
  v9[3] = &unk_24CB9F2A0;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v4;
  v8 = v4;
  dispatch_async(internalQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v13, v2);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_2_192;
    v8[3] = &unk_24CB9F2F0;
    objc_copyWeak(&v10, v2);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "askRemoteDeviceToPasscodeLockWithCompletionHandler:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
  }

}

void __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "Passcode Lock Remote Device Error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_191;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_191(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_2_192(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  NSSLogForType(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_211335000, v6, OS_LOG_TYPE_DEFAULT, "Passcode Lock Remote Device. Error: (%@)", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_193;
    block[3] = &unk_24CB9F2C8;
    v12 = *(id *)(a1 + 32);
    v13 = a2;
    v11 = v5;
    dispatch_async(v9, block);

  }
}

uint64_t __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_193(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)getUsage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 134217984;
    v11 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __23__NSSManager_getUsage___block_invoke;
  v8[3] = &unk_24CB9F318;
  v9 = v4;
  v7 = v4;
  -[NSSManager getUsageData:](self, "getUsageData:", v8);

}

void __23__NSSManager_getUsage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  +[NSSUsageData createLegacyUsageDictionary:](NSSUsageData, "createLegacyUsageDictionary:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)purgeUsageBundle:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil bundle: (%@)"), 0);
    v7 = 0;
  }
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSManager purgeUsageBundleWithId:completionHandler:](self, "purgeUsageBundleWithId:completionHandler:", v8, v6);

}

- (void)purgeUsageBundleWithId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  NSSLogForType(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x212BD875C](v7);
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "bundleIdentifier: (%@); replyBlock: (%@)", buf, 0x16u);

  }
  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil bundle identifier"));
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke;
  block[3] = &unk_24CB9F368;
  v14 = v6;
  v15 = v7;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  dispatch_async(internalQueue, block);

}

void __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "externalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_2;
    v21[3] = &unk_24CB9F340;
    v22 = *(id *)(a1 + 48);
    objc_copyWeak(&v23, &location);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_2_200;
    v18[3] = &unk_24CB9F340;
    v7 = *(_QWORD *)(a1 + 40);
    v19 = *(id *)(a1 + 48);
    objc_copyWeak(&v20, &location);
    objc_msgSend(v6, "purgeUsageBundle:replyHandler:", v7, v18);

    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_2_202;
    v17[3] = &unk_24CB9EFE8;
    v17[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "addBarrierBlock:", v17);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v23);
    v8 = v22;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl(&dword_211335000, v12, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_203;
    v14[3] = &unk_24CB9F110;
    v13 = *(id *)(a1 + 48);
    v15 = v11;
    v16 = v13;
    v8 = v11;
    dispatch_async(v4, v14);

  }
  objc_destroyWeak(&location);
}

void __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "externalQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_199;
      v8[3] = &unk_24CB9F110;
      v10 = *(id *)(a1 + 32);
      v9 = v3;
      dispatch_async(v7, v8);

    }
  }

}

uint64_t __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_199(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_2_200(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "externalQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_201;
      v8[3] = &unk_24CB9F110;
      v10 = *(id *)(a1 + 32);
      v9 = v3;
      dispatch_async(v7, v8);

    }
  }

}

uint64_t __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_201(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_203(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getDiagnosticLogFileFromGizmo:(id)a3 withResults:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  NSSLogForType(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x212BD875C](v7);
    *(_DWORD *)buf = 134217984;
    v18 = v9;
    _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v7)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke;
  block[3] = &unk_24CB9F3B8;
  objc_copyWeak(&v16, (id *)buf);
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_2;
    v12[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v14, v2);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_2_205;
    v9[3] = &unk_24CB9F390;
    objc_copyWeak(&v11, v2);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "getDiagnosticLogFileFromGizmo:withResults:", v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
  }

}

void __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_204;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_204(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_2_205(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NSSLogForType(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "downloaded file path: %@; error: (%@)", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_206;
    block[3] = &unk_24CB9F1D8;
    v14 = *(id *)(a1 + 32);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

  }
}

uint64_t __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_206(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)retrieveDiagnosticLogTransferProgress:(id)a3 withProgress:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  NSSLogForType(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "retrieving file transfer progress for %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke;
  v12[3] = &unk_24CB9F250;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(internalQueue, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_2;
    v11[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v13, v2);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_2_209;
    v8[3] = &unk_24CB9F408;
    objc_copyWeak(&v10, v2);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "retrieveDiagnosticLogTransferProgress:withProgress:", v7, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
  }

}

void __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_208;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_208(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_2_209(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  NSSLogForType(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = a2;
    _os_log_impl(&dword_211335000, v6, OS_LOG_TYPE_DEFAULT, "retrieved progress %lu", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_210;
    block[3] = &unk_24CB9F3E0;
    v12 = *(id *)(a1 + 32);
    v13 = a2;
    v11 = v5;
    dispatch_async(v9, block);

  }
}

uint64_t __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_210(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)cancelDiagnosticLogTranfer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  NSSLogForType(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x212BD875C](v7);
    *(_DWORD *)buf = 134217984;
    v18 = v9;
    _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v7)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke;
  v13[3] = &unk_24CB9F250;
  objc_copyWeak(&v16, (id *)buf);
  v14 = v6;
  v15 = v7;
  v13[4] = self;
  v11 = v6;
  v12 = v7;
  dispatch_async(internalQueue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_2;
    v12[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v14, v2);
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_2_213;
    v8[3] = &unk_24CB9F430;
    v9 = v7;
    objc_copyWeak(&v11, v2);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v6, "cancelDiagnosticLogTranfer:withCompletion:", v9, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
  }

}

void __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_212;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_212(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_2_213(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  NSSLogForType(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "cancelled log file %@ with error: %@", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_214;
    v9[3] = &unk_24CB9F110;
    v11 = *(id *)(a1 + 40);
    v10 = v3;
    dispatch_async(v8, v9);

  }
}

uint64_t __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_214(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)cancelFileTransfersInProgress
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__NSSManager_cancelFileTransfersInProgress__block_invoke;
  block[3] = &unk_24CB9EFE8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __43__NSSManager_cancelFileTransfersInProgress__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelActiveLogFileTranfers");

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __43__NSSManager_cancelFileTransfersInProgress__block_invoke_2;
    v9[3] = &unk_24CB9EFE8;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "addBarrierBlock:", v9);
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0FC8];
    v13[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
}

- (BOOL)fileTransferInProgress:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF contains '%@'"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(v5, "subpathsOfDirectoryAtPath:error:", CFSTR("/var/mobile/Library/IdentityServices/files/"), &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    NSSLogForType(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_211335000, v11, OS_LOG_TYPE_DEFAULT, "Failed to find files in transit with error: %@", buf, 0xCu);
    }

  }
  if (v10)
  {
    NSSLogForType(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_211335000, v12, OS_LOG_TYPE_DEFAULT, "Found file transfer in progress at path: %@", buf, 0xCu);
    }

  }
  return v10 != 0;
}

- (void)getDiagnosticLogsInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 134217984;
    v11 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__NSSManager_getDiagnosticLogsInfo___block_invoke;
  v8[3] = &unk_24CB9F458;
  v9 = v4;
  v7 = v4;
  -[NSSManager getDiagnosticLogsInfoByCateogry:](self, "getDiagnosticLogsInfoByCateogry:", v8);

}

uint64_t __36__NSSManager_getDiagnosticLogsInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getDiagnosticLogsInfoByCateogry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 134217984;
    v13 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke;
  block[3] = &unk_24CB9F228;
  objc_copyWeak(&v11, (id *)buf);
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_2;
    v10[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v12, v2);
    v11 = a1[5];
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_2_221;
    v7[3] = &unk_24CB9F4A8;
    objc_copyWeak(&v9, v2);
    v8 = a1[5];
    objc_msgSend(v6, "getDiagnosticLogsInfo:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
  }

}

void __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_220;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_220(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_2_221(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  NSSLogForType(1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v20 = objc_msgSend(v7, "count");
    v21 = 2048;
    v22 = objc_msgSend(v8, "count");
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_211335000, v10, OS_LOG_TYPE_DEFAULT, "replyArr: (%lu paths); directoryPaths: (%lu categories) error: (%@)",
      buf,
      0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_222;
    v14[3] = &unk_24CB9F480;
    v18 = *(id *)(a1 + 32);
    v15 = v7;
    v16 = v8;
    v17 = v9;
    dispatch_async(v13, v14);

  }
}

uint64_t __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_222(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)deleteDiagnosticLogFile:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  NSSLogForType(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x212BD875C](v7);
    *(_DWORD *)buf = 134217984;
    v18 = v9;
    _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v7)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke;
  block[3] = &unk_24CB9F3B8;
  objc_copyWeak(&v16, (id *)buf);
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_2;
    v12[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v14, v2);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_2_224;
    v9[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v11, v2);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "deleteDiagnosticLogFile:withResult:", v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
  }

}

void __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_223;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_223(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_2_224(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  NSSLogForType(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "Error returned from gizmo when attempting to delete log file: %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_225;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_225(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getAboutInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 134217984;
    v13 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __27__NSSManager_getAboutInfo___block_invoke;
  v9[3] = &unk_24CB9F2A0;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v4;
  v8 = v4;
  dispatch_async(internalQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __27__NSSManager_getAboutInfo___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __27__NSSManager_getAboutInfo___block_invoke_2;
    v11[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v13, v2);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __27__NSSManager_getAboutInfo___block_invoke_2_227;
    v8[3] = &unk_24CB9F200;
    objc_copyWeak(&v10, v2);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "getAboutInfo:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
  }

}

void __27__NSSManager_getAboutInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __27__NSSManager_getAboutInfo___block_invoke_226;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __27__NSSManager_getAboutInfo___block_invoke_226(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __27__NSSManager_getAboutInfo___block_invoke_2_227(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NSSLogForType(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = objc_msgSend(v5, "count");
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "replyDict: (%lu keys); error: (%@)", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__NSSManager_getAboutInfo___block_invoke_228;
    block[3] = &unk_24CB9F1D8;
    v14 = *(id *)(a1 + 32);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

  }
}

uint64_t __27__NSSManager_getAboutInfo___block_invoke_228(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setDeviceName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "name: (%@)", buf, 0xCu);
  }

  v6 = (void *)objc_msgSend(v4, "copy");
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __28__NSSManager_setDeviceName___block_invoke;
  v9[3] = &unk_24CB9F4D0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(internalQueue, v9);

}

void __28__NSSManager_setDeviceName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeviceName:", *(_QWORD *)(a1 + 40));

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __28__NSSManager_setDeviceName___block_invoke_2;
    v9[3] = &unk_24CB9EFE8;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "addBarrierBlock:", v9);
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0FC8];
    v13[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
}

- (void)obliterateGizmo:(id)a3
{
  -[NSSManager obliterateGizmoPreservingeSIM:completionHandler:](self, "obliterateGizmoPreservingeSIM:completionHandler:", 0, a3);
}

- (void)obliterateGizmoPreservingeSIM:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *internalQueue;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  NSSLogForType(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x212BD875C](v6);
    *(_DWORD *)buf = 134218240;
    v15 = v8;
    v16 = 1024;
    v17 = v4;
    _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p); preserveeSIM: (%d)", buf, 0x12u);

  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke;
  block[3] = &unk_24CB9F160;
  block[4] = self;
  v12 = v6;
  v13 = v4;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "externalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_2;
    v21[3] = &unk_24CB9F340;
    v22 = *(id *)(a1 + 40);
    objc_copyWeak(&v23, &location);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(a1 + 48) != 0;
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_2_230;
    v18[3] = &unk_24CB9F340;
    v19 = *(id *)(a1 + 40);
    objc_copyWeak(&v20, &location);
    objc_msgSend(v6, "obliterateGizmoPreservingeSIM:completionHandler:", v7, v18);

    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_2_232;
    v17[3] = &unk_24CB9EFE8;
    v17[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "addBarrierBlock:", v17);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v23);
    v8 = v22;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl(&dword_211335000, v12, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_233;
    v14[3] = &unk_24CB9F110;
    v13 = *(id *)(a1 + 40);
    v15 = v11;
    v16 = v13;
    v8 = v11;
    dispatch_async(v4, v14);

  }
  objc_destroyWeak(&location);
}

void __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "externalQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_229;
      v8[3] = &unk_24CB9F110;
      v10 = *(id *)(a1 + 32);
      v9 = v3;
      dispatch_async(v7, v8);

    }
  }

}

uint64_t __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_229(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_2_230(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "externalQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_231;
      v8[3] = &unk_24CB9F110;
      v10 = *(id *)(a1 + 32);
      v9 = v3;
      dispatch_async(v7, v8);

    }
  }

}

uint64_t __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_231(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_233(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getiCloudInfo:(id)a3
{
  -[NSSManager getAccountsInfoForAccountType:completionHandler:](self, "getAccountsInfoForAccountType:completionHandler:", *MEMORY[0x24BDB3FD8], a3);
}

void __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_234;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_234(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_2_235(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NSSLogForType(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = objc_msgSend(v5, "count");
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "replyDict: (%lu keys); error: (%@)", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_236;
    block[3] = &unk_24CB9F1D8;
    v14 = *(id *)(a1 + 32);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

  }
}

uint64_t __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_236(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getProfilesInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 134217984;
    v13 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("replyBlock: (%@)"), 0);
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__NSSManager_getProfilesInfo___block_invoke;
  block[3] = &unk_24CB9F2A0;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v4;
  v8 = v4;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __30__NSSManager_getProfilesInfo___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __30__NSSManager_getProfilesInfo___block_invoke_2;
    v11[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v13, v2);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __30__NSSManager_getProfilesInfo___block_invoke_2_240;
    v8[3] = &unk_24CB9F200;
    objc_copyWeak(&v10, v2);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "getProfilesInfo:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
  }

}

void __30__NSSManager_getProfilesInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __30__NSSManager_getProfilesInfo___block_invoke_239;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __30__NSSManager_getProfilesInfo___block_invoke_239(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __30__NSSManager_getProfilesInfo___block_invoke_2_240(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NSSLogForType(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = objc_msgSend(v5, "count");
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "replyDict: (%lu keys); error: (%@)", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__NSSManager_getProfilesInfo___block_invoke_241;
    block[3] = &unk_24CB9F1D8;
    v14 = *(id *)(a1 + 32);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

  }
}

uint64_t __30__NSSManager_getProfilesInfo___block_invoke_241(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  NSSLogForType(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x212BD875C](v7);
    *(_DWORD *)buf = 134217984;
    v17 = v9;
    _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v6 || !v7)
  {
    v10 = (void *)MEMORY[0x24BDBCE88];
    v11 = *MEMORY[0x24BDBCAB8];
    v12 = (void *)MEMORY[0x212BD875C](v7);
    objc_msgSend(v10, "raise:format:", v11, CFSTR("nil identifier: (%@) or replyBlock: (%@)"), v6, v12);

  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__NSSManager_getProfileWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_24CB9F4F8;
  v15 = v7;
  v13 = v7;
  -[NSSManager getFullProfileInfoWithIdentifier:includeManagedPayloads:completionHandler:](self, "getFullProfileInfoWithIdentifier:includeManagedPayloads:completionHandler:", v6, 0, v14);

}

void __57__NSSManager_getProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ProfileData"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)getFullProfileInfoWithIdentifier:(id)a3 includeManagedPayloads:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *internalQueue;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  NSSLogForType(1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x212BD875C](v9);
    *(_DWORD *)buf = 134217984;
    v24 = v11;
    _os_log_impl(&dword_211335000, v10, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  if (!v8 || !v9)
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    v13 = *MEMORY[0x24BDBCAB8];
    v14 = (void *)MEMORY[0x212BD875C](v9);
    objc_msgSend(v12, "raise:format:", v13, CFSTR("nil identifier: (%@) or replyBlock: (%@)"), v8, v14);

  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke;
  block[3] = &unk_24CB9F520;
  objc_copyWeak(&v21, (id *)buf);
  v19 = v8;
  v20 = v9;
  v22 = a4;
  v16 = v8;
  v17 = v9;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_2;
    v13[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v15, v2);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(unsigned __int8 *)(a1 + 56);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_2_245;
    v10[3] = &unk_24CB9F200;
    objc_copyWeak(&v12, v2);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v7, "getFullProfileInfoWithIdentifier:includeManagedPayloads:completionHandler:", v8, v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v15);
  }

}

void __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_244;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_244(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_2_245(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NSSLogForType(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = objc_msgSend(v5, "count");
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "replyDict: (%lu keys); error: (%@)", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_246;
    block[3] = &unk_24CB9F1D8;
    v14 = *(id *)(a1 + 32);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

  }
}

uint64_t __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_246(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)installProfile:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *internalQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  NSSLogForType(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v6, "length");
    v10 = (void *)MEMORY[0x212BD875C](v7);
    *(_DWORD *)buf = 134218240;
    v19 = v9;
    v20 = 2048;
    v21 = v10;
    _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "profileData: (%lu bytes); replyBlock: (%p)", buf, 0x16u);

  }
  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("profileData: (%@)"), 0);
  v11 = (void *)objc_msgSend(v6, "copy");
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__NSSManager_installProfile_completionHandler___block_invoke;
  block[3] = &unk_24CB9F368;
  v16 = v11;
  v17 = v7;
  block[4] = self;
  v13 = v11;
  v14 = v7;
  dispatch_async(internalQueue, block);

}

void __47__NSSManager_installProfile_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "externalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __47__NSSManager_installProfile_completionHandler___block_invoke_2;
    v21[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v23, &location);
    v22 = *(id *)(a1 + 48);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __47__NSSManager_installProfile_completionHandler___block_invoke_2_250;
    v18[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v20, &location);
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v6, "installProfile:replyHandler:", v7, v18);

    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __47__NSSManager_installProfile_completionHandler___block_invoke_2_252;
    v17[3] = &unk_24CB9EFE8;
    v17[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "addBarrierBlock:", v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v10;
      _os_log_impl(&dword_211335000, v11, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __47__NSSManager_installProfile_completionHandler___block_invoke_253;
    v14[3] = &unk_24CB9F110;
    v12 = *(id *)(a1 + 48);
    v15 = v10;
    v16 = v12;
    v13 = v10;
    dispatch_async(v4, v14);

  }
  objc_destroyWeak(&location);
}

void __47__NSSManager_installProfile_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __47__NSSManager_installProfile_completionHandler___block_invoke_249;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __47__NSSManager_installProfile_completionHandler___block_invoke_249(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __47__NSSManager_installProfile_completionHandler___block_invoke_2_250(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __47__NSSManager_installProfile_completionHandler___block_invoke_251;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __47__NSSManager_installProfile_completionHandler___block_invoke_251(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __47__NSSManager_installProfile_completionHandler___block_invoke_253(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)removeProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  NSSLogForType(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x212BD875C](v7);
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2048;
    v20 = v9;
    _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "identifier: (%@); replyBlock: (%p)", buf, 0x16u);

  }
  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("identifier: (%@)"), 0);
  v10 = (void *)objc_msgSend(v6, "copy");
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24CB9F368;
  v15 = v10;
  v16 = v7;
  block[4] = self;
  v12 = v10;
  v13 = v7;
  dispatch_async(internalQueue, block);

}

void __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "externalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_2;
    v21[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v23, &location);
    v22 = *(id *)(a1 + 48);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_2_257;
    v18[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v20, &location);
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v6, "removeProfileWithIdentifier:replyHandler:", v7, v18);

    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_2_259;
    v17[3] = &unk_24CB9EFE8;
    v17[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "addBarrierBlock:", v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v10;
      _os_log_impl(&dword_211335000, v11, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_260;
    v14[3] = &unk_24CB9F110;
    v12 = *(id *)(a1 + 48);
    v15 = v10;
    v16 = v12;
    v13 = v10;
    dispatch_async(v4, v14);

  }
  objc_destroyWeak(&location);
}

void __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_256;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_256(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_2_257(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_258;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_258(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_260(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)rebootDevice
{
  NSObject *v3;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[16];

  NSSLogForType(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211335000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_211367E22, buf, 2u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__NSSManager_rebootDevice__block_invoke;
  block[3] = &unk_24CB9EFE8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __26__NSSManager_rebootDevice__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rebootDevice");

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __26__NSSManager_rebootDevice__block_invoke_2;
    v9[3] = &unk_24CB9EFE8;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "addBarrierBlock:", v9);
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0FC8];
    v13[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
}

- (void)getLegalDocuments:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 134217984;
    v12 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __32__NSSManager_getLegalDocuments___block_invoke;
  v9[3] = &unk_24CB9F0E8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(internalQueue, v9);

}

void __32__NSSManager_getLegalDocuments___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "externalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __32__NSSManager_getLegalDocuments___block_invoke_2;
    v19[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v21, &location);
    v20 = *(id *)(a1 + 40);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __32__NSSManager_getLegalDocuments___block_invoke_2_262;
    v16[3] = &unk_24CB9F200;
    objc_copyWeak(&v18, &location);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v6, "getLegalDocuments:", v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v21);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FC8];
    v26[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_211335000, v10, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__NSSManager_getLegalDocuments___block_invoke_264;
    block[3] = &unk_24CB9F110;
    v11 = *(id *)(a1 + 40);
    v14 = v9;
    v15 = v11;
    v12 = v9;
    dispatch_async(v4, block);

  }
  objc_destroyWeak(&location);
}

void __32__NSSManager_getLegalDocuments___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__NSSManager_getLegalDocuments___block_invoke_261;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __32__NSSManager_getLegalDocuments___block_invoke_261(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __32__NSSManager_getLegalDocuments___block_invoke_2_262(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NSSLogForType(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = objc_msgSend(v5, "count");
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "replyDict: (%lu keys); error: (%@)", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__NSSManager_getLegalDocuments___block_invoke_263;
    block[3] = &unk_24CB9F1D8;
    v14 = *(id *)(a1 + 32);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

  }
}

uint64_t __32__NSSManager_getLegalDocuments___block_invoke_263(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __32__NSSManager_getLegalDocuments___block_invoke_264(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)getLocalesInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 134217984;
    v12 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __29__NSSManager_getLocalesInfo___block_invoke;
  v9[3] = &unk_24CB9F0E8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(internalQueue, v9);

}

void __29__NSSManager_getLocalesInfo___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "externalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __29__NSSManager_getLocalesInfo___block_invoke_2;
    v19[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v21, &location);
    v20 = *(id *)(a1 + 40);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __29__NSSManager_getLocalesInfo___block_invoke_2_266;
    v16[3] = &unk_24CB9F200;
    objc_copyWeak(&v18, &location);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v6, "getLocalesInfo:", v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v21);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FC8];
    v26[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_211335000, v10, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__NSSManager_getLocalesInfo___block_invoke_268;
    block[3] = &unk_24CB9F110;
    v11 = *(id *)(a1 + 40);
    v14 = v9;
    v15 = v11;
    v12 = v9;
    dispatch_async(v4, block);

  }
  objc_destroyWeak(&location);
}

void __29__NSSManager_getLocalesInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __29__NSSManager_getLocalesInfo___block_invoke_265;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __29__NSSManager_getLocalesInfo___block_invoke_265(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __29__NSSManager_getLocalesInfo___block_invoke_2_266(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NSSLogForType(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = objc_msgSend(v5, "count");
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "replyDict: (%lu keys); error: (%@)", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__NSSManager_getLocalesInfo___block_invoke_267;
    block[3] = &unk_24CB9F1D8;
    v14 = *(id *)(a1 + 32);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

  }
}

uint64_t __29__NSSManager_getLocalesInfo___block_invoke_267(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __29__NSSManager_getLocalesInfo___block_invoke_268(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)recordSoftwareUpdateSpaceFailure:(id)a3 osBeingUpdatedTo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  NSSLogForType(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)MEMORY[0x212BD875C](v10);
    *(_DWORD *)buf = 134217984;
    v22 = v12;
    _os_log_impl(&dword_211335000, v11, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);

  }
  internalQueue = self->_internalQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke;
  v17[3] = &unk_24CB9F548;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v9;
  v15 = v8;
  v16 = v10;
  dispatch_async(internalQueue, v17);

}

void __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "externalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_2;
    v21[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v23, &location);
    v22 = *(id *)(a1 + 56);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_2_270;
    v18[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v20, &location);
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v6, "recordSoftwareUpdateSpaceFailure:osBeingUpdatedTo:completion:", v7, v8, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl(&dword_211335000, v12, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_272;
    block[3] = &unk_24CB9F110;
    v13 = *(id *)(a1 + 56);
    v16 = v11;
    v17 = v13;
    v14 = v11;
    dispatch_async(v4, block);

  }
  objc_destroyWeak(&location);
}

void __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_269;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_269(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_2_270(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  NSSLogForType(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_271;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_271(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_272(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getWatchFaces:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 136315394;
    v12 = "-[NSSManager getWatchFaces:]";
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "%s replyBlock: (%p)", buf, 0x16u);

  }
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __28__NSSManager_getWatchFaces___block_invoke;
  v9[3] = &unk_24CB9F0E8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(internalQueue, v9);

}

void __28__NSSManager_getWatchFaces___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "externalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __28__NSSManager_getWatchFaces___block_invoke_2;
    v19[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v21, &location);
    v20 = *(id *)(a1 + 40);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __28__NSSManager_getWatchFaces___block_invoke_2_274;
    v16[3] = &unk_24CB9F570;
    objc_copyWeak(&v18, &location);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v6, "getWatchFaces:", v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v21);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FC8];
    v26[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_211335000, v10, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__NSSManager_getWatchFaces___block_invoke_277;
    block[3] = &unk_24CB9F110;
    v11 = *(id *)(a1 + 40);
    v14 = v9;
    v15 = v11;
    v12 = v9;
    dispatch_async(v4, block);

  }
  objc_destroyWeak(&location);
}

void __28__NSSManager_getWatchFaces___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __28__NSSManager_getWatchFaces___block_invoke_273;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __28__NSSManager_getWatchFaces___block_invoke_273(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __28__NSSManager_getWatchFaces___block_invoke_2_274(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NSSLogForType(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = objc_msgSend(v5, "count");
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "getWatchFaces replyArray: (%lu items); error: (%@)",
      buf,
      0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__NSSManager_getWatchFaces___block_invoke_275;
    block[3] = &unk_24CB9F1D8;
    v14 = *(id *)(a1 + 32);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

  }
}

uint64_t __28__NSSManager_getWatchFaces___block_invoke_275(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __28__NSSManager_getWatchFaces___block_invoke_277(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)setWatchFaceIdentifier:(id)a3 forFocusModeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *internalQueue;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  NSSLogForType(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x212BD875C](v10);
    *(_DWORD *)buf = 136315906;
    v23 = "-[NSSManager setWatchFaceIdentifier:forFocusModeIdentifier:completionHandler:]";
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v9;
    v28 = 2048;
    v29 = v13;
    _os_log_impl(&dword_211335000, v11, OS_LOG_TYPE_DEFAULT, "%s watchFaceIdentifier: (%@) focusModeIdentifier: (%@) replyBlock: (%p)", buf, 0x2Au);

  }
  internalQueue = self->_internalQueue;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke;
  v18[3] = &unk_24CB9F548;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  dispatch_async(internalQueue, v18);

}

void __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "externalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_2;
    v21[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v23, &location);
    v22 = *(id *)(a1 + 56);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_2_279;
    v18[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v20, &location);
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v6, "setWatchFaceIdentifier:forFocusModeIdentifier:completionHandler:", v7, v8, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28[0] = CFSTR("NSS cannot be used when there is no active device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    NSSLogForType(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl(&dword_211335000, v12, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_281;
    block[3] = &unk_24CB9F110;
    v13 = *(id *)(a1 + 56);
    v16 = v11;
    v17 = v13;
    v14 = v11;
    dispatch_async(v4, block);

  }
  objc_destroyWeak(&location);
}

void __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_278;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_278(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_2_279(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  NSSLogForType(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "setWatchFace error: (%@)", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_280;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_280(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_281(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchBetaEnrollmentStatus:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSSLogForType(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BD875C](v4);
    *(_DWORD *)buf = 136315394;
    v13 = "-[NSSManager fetchBetaEnrollmentStatus:]";
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_211335000, v5, OS_LOG_TYPE_DEFAULT, "%s: replyBlock: (%p)", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke;
  v9[3] = &unk_24CB9F2A0;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v4;
  v8 = v4;
  dispatch_async(internalQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_2;
    v14[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v16, v2);
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_2_283;
    v11[3] = &unk_24CB9F598;
    objc_copyWeak(&v13, v2);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v6, "fetchBetaEnrollmentStatus:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v16);
  }
  else
  {
    NSSLogForType(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[NSSManager fetchBetaEnrollmentStatus:]_block_invoke_2";
      _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "%s: error connecting", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "externalQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_286;
    block[3] = &unk_24CB9F0C0;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v8, block);

  }
}

void __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[NSSManager fetchBetaEnrollmentStatus:]_block_invoke_2";
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "%s: error: (%@)", buf, 0x16u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_282;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_282(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_2_283(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NSSLogForType(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[NSSManager fetchBetaEnrollmentStatus:]_block_invoke_2";
    v17 = 1024;
    v18 = v5 != 0;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_211335000, v7, OS_LOG_TYPE_DEFAULT, "%s: replyData: %{BOOL}d error: (%@)", buf, 0x1Cu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_284;
    block[3] = &unk_24CB9F1D8;
    v14 = *(id *)(a1 + 32);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

  }
}

uint64_t __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_284(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_286(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NSSManager cannotUseNSSError](NSSManager, "cannotUseNSSError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)updateBetaEnrollmentStatus:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  NSSLogForType(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[NSSManager updateBetaEnrollmentStatus:withCompletion:]";
    _os_log_impl(&dword_211335000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v6)
  {
    -[NSSManager _updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:](self, "_updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:", v6, 0, v7);
  }
  else
  {
    NSSLogForType(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[NSSManager updateBetaEnrollmentStatus:withCompletion:]";
      _os_log_impl(&dword_211335000, v9, OS_LOG_TYPE_DEFAULT, "%s. Beta enrollment program info empty. Skipping", buf, 0xCu);
    }

    v10 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FC8];
    v14 = CFSTR("Invalid Arguments");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("NSSErrorDomain"), 10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, v12);
  }

}

- (void)unenrollFromBetaUpdatesWithCompletion:(id)a3
{
  -[NSSManager _updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:](self, "_updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:", 0, 1, a3);
}

- (void)_updateBetaEnrollmentStatus:(id)a3 requiresUnenroll:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke;
  block[3] = &unk_24CB9F520;
  objc_copyWeak(&v16, &location);
  v14 = v8;
  v15 = v9;
  v17 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_2;
    v16[3] = &unk_24CB9F1B0;
    objc_copyWeak(&v18, v2);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_BYTE *)(a1 + 56) != 0;
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_2_292;
    v13[3] = &unk_24CB9F2F0;
    objc_copyWeak(&v15, v2);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v6, "updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:", v7, v8, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);
  }
  else
  {
    NSSLogForType(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[NSSManager _updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:]_block_invoke_2";
      _os_log_impl(&dword_211335000, v9, OS_LOG_TYPE_DEFAULT, "%s: error connecting", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "externalQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_294;
    block[3] = &unk_24CB9F0C0;
    v12 = *(id *)(a1 + 40);
    dispatch_async(v10, block);

  }
}

void __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    NSSLogForType(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[NSSManager _updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:]_block_invoke_2";
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_211335000, v4, OS_LOG_TYPE_DEFAULT, "%s: error: (%@)", buf, 0x16u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_291;
    v8[3] = &unk_24CB9F110;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_291(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_2_292(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  NSSLogForType(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[NSSManager _updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:]_block_invoke_2";
    v16 = 1024;
    v17 = a2;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_211335000, v6, OS_LOG_TYPE_DEFAULT, "%s: success: %{BOOL}d error: (%@)", buf, 0x1Cu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "externalQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_293;
    block[3] = &unk_24CB9F2C8;
    v12 = *(id *)(a1 + 32);
    v13 = a2;
    v11 = v5;
    dispatch_async(v9, block);

  }
}

uint64_t __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_293(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_294(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NSSManager cannotUseNSSError](NSSManager, "cannotUseNSSError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

+ (id)cannotUseNSSError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BDD0FC8];
  v7[0] = CFSTR("NSS cannot be used when there is no active device");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("NSSErrorDomain"), 11, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (OS_dispatch_queue)externalQueue
{
  return self->_externalQueue;
}

- (void)setExternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_externalQueue, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_externalQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
