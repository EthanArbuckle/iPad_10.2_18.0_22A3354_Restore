@implementation MTIDXPCSecretStore

MTPromise *__46__MTIDXPCSecretStore_secretForScheme_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MTPromise *v4;
  uint64_t v5;
  MTPromise *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  MTPromise *v10;
  MTPromise *v11;
  MTPromise *v12;
  _QWORD v14[4];
  MTPromise *v15;
  _QWORD v16[4];
  MTPromise *v17;

  v3 = a2;
  v4 = objc_alloc_init(MTPromise);
  v5 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __46__MTIDXPCSecretStore_secretForScheme_options___block_invoke_2;
  v16[3] = &unk_24C7A0EF8;
  v6 = v4;
  v17 = v6;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __46__MTIDXPCSecretStore_secretForScheme_options___block_invoke_3;
  v14[3] = &unk_24C7A0628;
  v10 = v6;
  v15 = v10;
  objc_msgSend(v7, "secretForScheme:options:completion:", v9, v8, v14);
  v11 = v15;
  v12 = v10;

  return v12;
}

uint64_t __46__MTIDXPCSecretStore_secretForScheme_options___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (id)secretForScheme:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[MTIDXPCSecretStore setupXPCConnection](self, "setupXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__MTIDXPCSecretStore_secretForScheme_options___block_invoke;
  v13[3] = &unk_24C7A0F20;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)setupXPCConnection
{
  MTPromise *v3;
  NSObject *queue;
  MTPromise *v5;
  MTPromise *v6;
  MTPromise *v7;
  _QWORD v9[5];
  MTPromise *v10;

  v3 = objc_alloc_init(MTPromise);
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__MTIDXPCSecretStore_setupXPCConnection__block_invoke;
  v9[3] = &unk_24C7A0F90;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_async(queue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __40__MTIDXPCSecretStore_setupXPCConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "newXPCConnection");
    objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", v3);

  }
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v5);

  *(double *)(*(_QWORD *)(a1 + 32) + 8) = *(double *)(*(_QWORD *)(a1 + 32) + 8) + 1.0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = dispatch_time(0, 60000000000);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__MTIDXPCSecretStore_setupXPCConnection__block_invoke_2;
  v8[3] = &unk_24C7A0380;
  objc_copyWeak(&v9, &location);
  dispatch_after(v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)newXPCConnection
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id from;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.AMPIDService"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D6300);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v3);
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __38__MTIDXPCSecretStore_newXPCConnection__block_invoke;
  v13[3] = &unk_24C7A0F68;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  objc_msgSend(v3, "setInvalidationHandler:", v13);
  v7 = v5;
  v8 = 3221225472;
  v9 = __38__MTIDXPCSecretStore_newXPCConnection__block_invoke_63;
  v10 = &unk_24C7A0F68;
  objc_copyWeak(&v11, &location);
  objc_copyWeak(&v12, &from);
  objc_msgSend(v3, "setInterruptionHandler:", &v7);
  objc_msgSend(v3, "resume", v7, v8, v9, v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v3;
}

- (MTIDXPCSecretStore)init
{
  MTIDXPCSecretStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTIDXPCSecretStore;
  v2 = -[MTIDXPCSecretStore init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.amp-ae-eng.MetricsKit.AMPIDServiceQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

uint64_t __46__MTIDXPCSecretStore_secretForScheme_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)resetSchemes:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[MTIDXPCSecretStore setupXPCConnection](self, "setupXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __43__MTIDXPCSecretStore_resetSchemes_options___block_invoke;
  v13[3] = &unk_24C7A0F20;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

MTPromise *__43__MTIDXPCSecretStore_resetSchemes_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MTPromise *v4;
  uint64_t v5;
  MTPromise *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  MTPromise *v10;
  MTPromise *v11;
  MTPromise *v12;
  _QWORD v14[4];
  MTPromise *v15;
  _QWORD v16[4];
  MTPromise *v17;

  v3 = a2;
  v4 = objc_alloc_init(MTPromise);
  v5 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __43__MTIDXPCSecretStore_resetSchemes_options___block_invoke_2;
  v16[3] = &unk_24C7A0EF8;
  v6 = v4;
  v17 = v6;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __43__MTIDXPCSecretStore_resetSchemes_options___block_invoke_3;
  v14[3] = &unk_24C7A0EF8;
  v10 = v6;
  v15 = v10;
  objc_msgSend(v7, "doResetSchemes:options:completion:", v9, v8, v14);
  v11 = v15;
  v12 = v10;

  return v12;
}

uint64_t __43__MTIDXPCSecretStore_resetSchemes_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

uint64_t __43__MTIDXPCSecretStore_resetSchemes_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
    v3 = 0;
  else
    v3 = MEMORY[0x24BDBD1C8];
  return objc_msgSend(v2, "finishWithResult:error:", v3, a2);
}

- (id)maintainSchemes:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[MTIDXPCSecretStore setupXPCConnection](self, "setupXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__MTIDXPCSecretStore_maintainSchemes_options___block_invoke;
  v13[3] = &unk_24C7A0F20;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

MTPromise *__46__MTIDXPCSecretStore_maintainSchemes_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doMaintainSchemes:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1C8]);
}

- (id)syncForSchemes:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[MTIDXPCSecretStore setupXPCConnection](self, "setupXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __45__MTIDXPCSecretStore_syncForSchemes_options___block_invoke;
  v13[3] = &unk_24C7A0F20;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

MTPromise *__45__MTIDXPCSecretStore_syncForSchemes_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MTPromise *v4;
  uint64_t v5;
  MTPromise *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  MTPromise *v10;
  MTPromise *v11;
  MTPromise *v12;
  _QWORD v14[4];
  MTPromise *v15;
  _QWORD v16[4];
  MTPromise *v17;

  v3 = a2;
  v4 = objc_alloc_init(MTPromise);
  v5 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __45__MTIDXPCSecretStore_syncForSchemes_options___block_invoke_2;
  v16[3] = &unk_24C7A0EF8;
  v6 = v4;
  v17 = v6;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __45__MTIDXPCSecretStore_syncForSchemes_options___block_invoke_3;
  v14[3] = &unk_24C7A0EF8;
  v10 = v6;
  v15 = v10;
  objc_msgSend(v7, "syncForSchemes:options:completion:", v9, v8, v14);
  v11 = v15;
  v12 = v10;

  return v12;
}

uint64_t __45__MTIDXPCSecretStore_syncForSchemes_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", MEMORY[0x24BDBD1C0], a2);
}

uint64_t __45__MTIDXPCSecretStore_syncForSchemes_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
    v3 = MEMORY[0x24BDBD1C0];
  else
    v3 = MEMORY[0x24BDBD1C8];
  return objc_msgSend(v2, "finishWithResult:error:", v3, a2);
}

- (void)clearLocalData
{
  id v2;

  -[MTIDXPCSecretStore setupXPCConnection](self, "setupXPCConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSuccessBlock:", &__block_literal_global_9);

}

void __36__MTIDXPCSecretStore_clearLocalData__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doClearLocalData");

}

- (id)debugInfo
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("xpcConnection");
  -[MTIDXPCSecretStore xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("null");
  if (v3)
    v5 = (const __CFString *)v3;
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __38__MTIDXPCSecretStore_newXPCConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  id v5;
  uint8_t v6[16];

  MTMetricsKitOSLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D758000, v2, OS_LOG_TYPE_DEBUG, "MetricsKit: MTIDXPCSecretStore XPC connection invalidated", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)(a1 + 40));

  if (v4 == v5)
    objc_msgSend(WeakRetained, "setXpcConnection:", 0);

}

void __38__MTIDXPCSecretStore_newXPCConnection__block_invoke_63(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  id v5;
  uint8_t v6[16];

  MTMetricsKitOSLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D758000, v2, OS_LOG_TYPE_DEBUG, "MetricsKit: MTIDXPCSecretStore XPC connection interrupted", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)(a1 + 40));

  if (v4 == v5)
    objc_msgSend(WeakRetained, "setXpcConnection:", 0);

}

void __40__MTIDXPCSecretStore_setupXPCConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((double *)WeakRetained + 1) + -1.0;
    *((double *)WeakRetained + 1) = v3;
    if (v3 == 0.0)
    {
      MTMetricsKitOSLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_20D758000, v4, OS_LOG_TYPE_DEBUG, "MetricsKit: MTIDXPCSecretStore XPC connection is released on idle", v6, 2u);
      }

      objc_msgSend(v2, "xpcConnection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invalidate");

      objc_msgSend(v2, "setXpcConnection:", 0);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
