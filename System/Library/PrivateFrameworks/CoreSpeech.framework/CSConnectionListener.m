@implementation CSConnectionListener

- (CSConnectionListener)initWithXpcListener:(id)a3 withMachService:(id)a4 withServiceInterface:(id)a5 withServiceObject:(id)a6 withDelegateInterface:(id)a7 queue:(id)a8
{
  id v15;
  NSString *v16;
  id v17;
  CSConnectionListener *v18;
  CSConnectionListener *v19;
  os_log_t *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  CSConnectionListener *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *queue;
  NSMutableArray *v27;
  NSMutableArray *clientConnections;
  NSObject *v29;
  NSString *machServiceName;
  id v32;
  id v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  NSString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = (NSString *)a4;
  v34 = a5;
  v17 = a6;
  v32 = a7;
  v33 = a8;
  v35.receiver = self;
  v35.super_class = (Class)CSConnectionListener;
  v18 = -[CSConnectionListener init](&v35, sel_init);
  v19 = v18;
  if (!v18)
  {
LABEL_22:
    v24 = v19;
    goto LABEL_23;
  }
  if (!v15)
  {
    v22 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 136315138;
    v37 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegate"
          "Interface:queue:]";
    v23 = "%s ERR: XPC listener Name is nil - Bailing out";
LABEL_17:
    _os_log_error_impl(&dword_1C2614000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
    goto LABEL_18;
  }
  if (!v16)
  {
    v22 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 136315138;
    v37 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegate"
          "Interface:queue:]";
    v23 = "%s ERR: Mach Service Name is nil - Bailing out";
    goto LABEL_17;
  }
  if (!v17)
  {
    v22 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 136315138;
    v37 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegate"
          "Interface:queue:]";
    v23 = "%s ERR: Proxy Object is nil - Bailing out";
    goto LABEL_17;
  }
  if (v34)
  {
    objc_storeStrong((id *)&v18->_listener, a3);
    -[NSXPCListener setDelegate:](v19->_listener, "setDelegate:", v19);
    objc_storeStrong((id *)&v19->_machServiceName, a4);
    objc_storeStrong((id *)&v19->_exportedInterface, a5);
    objc_storeStrong(&v19->_proxyObject, a6);
    objc_storeStrong((id *)&v19->_remoteInterface, a7);
    v20 = (os_log_t *)MEMORY[0x1E0D18F60];
    if (v33)
    {
      objc_storeStrong((id *)&v19->_queue, a8);
      v21 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDele"
              "gateInterface:queue:]";
        v38 = 2112;
        v39 = v16;
        _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_INFO, "%s Set up queue for %@", buf, 0x16u);
      }
    }
    else
    {
      v25 = dispatch_queue_create("com.apple.CoreSpeech.Connection.Listener", 0);
      queue = v19->_queue;
      v19->_queue = (OS_dispatch_queue *)v25;

    }
    -[NSXPCListener _setQueue:](v19->_listener, "_setQueue:", v19->_queue);
    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    clientConnections = v19->_clientConnections;
    v19->_clientConnections = v27;

    v29 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
    {
      machServiceName = v19->_machServiceName;
      *(_DWORD *)buf = 136315394;
      v37 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelega"
            "teInterface:queue:]";
      v38 = 2114;
      v39 = machServiceName;
      _os_log_impl(&dword_1C2614000, v29, OS_LOG_TYPE_DEFAULT, "%s Started listening for %{public}@", buf, 0x16u);
    }
    goto LABEL_22;
  }
  v22 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegate"
          "Interface:queue:]";
    v23 = "%s ERR: Exported interface is nil - Bailing out";
    goto LABEL_17;
  }
LABEL_18:
  v24 = 0;
LABEL_23:

  return v24;
}

- (CSConnectionListener)initWithMachService:(id)a3 withServiceInterface:(id)a4 withServiceObject:(id)a5 withDelegateInterface:(id)a6
{
  return -[CSConnectionListener initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:](self, "initWithMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:", a3, a4, a5, a6, 0);
}

- (CSConnectionListener)initWithMachService:(id)a3 withServiceInterface:(id)a4 withServiceObject:(id)a5 withDelegateInterface:(id)a6 queue:(id)a7
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  CSConnectionListener *v19;

  v12 = (objc_class *)MEMORY[0x1E0CB3B58];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_msgSend([v12 alloc], "initWithMachServiceName:", v17);
  v19 = -[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:](self, "initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegateInterface:queue:", v18, v17, v16, v15, v14, v13);

  return v19;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *machServiceName;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  NSString *v9;
  __int16 v10;
  CSConnectionListener *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    machServiceName = self->_machServiceName;
    *(_DWORD *)buf = 136315650;
    v7 = "-[CSConnectionListener dealloc]";
    v8 = 2114;
    v9 = machServiceName;
    v10 = 2114;
    v11 = self;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Service %{public}@ dealloced - %{public}@", buf, 0x20u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSConnectionListener;
  -[CSConnectionListener dealloc](&v5, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  NSString *machServiceName;
  os_log_t v11;
  NSString *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  os_log_t v19;
  NSString *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  NSXPCListener *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (NSXPCListener *)a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = (os_log_t *)MEMORY[0x1E0D18F60];
  v9 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    machServiceName = self->_machServiceName;
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSConnectionListener listener:shouldAcceptNewConnection:]";
    v31 = 2114;
    v32 = machServiceName;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Got connection on service %{public}@", buf, 0x16u);
  }
  if (self->_listener != v6)
  {
    v11 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      v12 = self->_machServiceName;
      *(_DWORD *)buf = 136315650;
      v30 = "-[CSConnectionListener listener:shouldAcceptNewConnection:]";
      v31 = 2114;
      v32 = v12;
      v33 = 2114;
      v34 = v6;
      v13 = "%s [Service:%{public}@] Invalid listener - %{public}@";
      v14 = v11;
      v15 = 32;
LABEL_10:
      _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ((objc_msgSend(MEMORY[0x1E0D19260], "xpcConnection:hasEntitlement:", v7, CFSTR("corespeech.corespeechd.xpc")) & 1) == 0)
  {
    objc_msgSend(v7, "invalidate");
    v19 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      v20 = self->_machServiceName;
      *(_DWORD *)buf = 136315394;
      v30 = "-[CSConnectionListener listener:shouldAcceptNewConnection:]";
      v31 = 2114;
      v32 = v20;
      v13 = "%s Rejecting connection to %{public}@ due to entitlement";
      v14 = v19;
      v15 = 22;
      goto LABEL_10;
    }
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v7, "setExportedInterface:", self->_exportedInterface);
  objc_msgSend(v7, "setExportedObject:", self->_proxyObject);
  objc_msgSend(v7, "setRemoteObjectInterface:", self->_remoteInterface);
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v7);
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __59__CSConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
  v25[3] = &unk_1E7C24D90;
  objc_copyWeak(&v26, (id *)buf);
  objc_copyWeak(&v27, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v25);
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __59__CSConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v22[3] = &unk_1E7C24D90;
  objc_copyWeak(&v23, (id *)buf);
  objc_copyWeak(&v24, &location);
  objc_msgSend(v7, "setInvalidationHandler:", v22);
  -[CSConnectionListener clientConnections](self, "clientConnections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v7);

  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
  v18 = 1;
LABEL_12:

  return v18;
}

- (void)notifyClientsWithBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CSConnectionListener_notifyClientsWithBlock___block_invoke;
  block[3] = &unk_1E7C24DB8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)resumeConnection
{
  NSObject *v3;
  NSString *machServiceName;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    machServiceName = self->_machServiceName;
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSConnectionListener resumeConnection]";
    v9 = 2114;
    v10 = machServiceName;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s [Service:%{public}@]", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CSConnectionListener_resumeConnection__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnections, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_machServiceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong(&self->_proxyObject, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

uint64_t __40__CSConnectionListener_resumeConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume");
}

void __47__CSConnectionListener_notifyClientsWithBlock___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  int v24;
  _QWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  v4 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)WeakRetained[7];
    v6 = v4;
    objc_msgSend(WeakRetained, "clientConnections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v32 = "-[CSConnectionListener notifyClientsWithBlock:]_block_invoke";
    v33 = 2112;
    v34 = v5;
    v35 = 2048;
    v36 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s machServiceName(%@) with clientConnCount:%lu ", buf, 0x20u);

  }
  objc_msgSend(WeakRetained, "clientConnections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = WeakRetained;
    objc_msgSend(WeakRetained, "clientConnections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v15, "remoteObjectProxy");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = *(_QWORD *)(a1 + 32);
            if (v17)
            {
              v18 = *v3;
              if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
              {
                v19 = v18;
                objc_msgSend(v15, "remoteObjectProxy");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v32 = "-[CSConnectionListener notifyClientsWithBlock:]_block_invoke";
                v33 = 2112;
                v34 = v20;
                _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s Sending message to remote object: %@", buf, 0x16u);

                v17 = *(_QWORD *)(a1 + 32);
              }
              objc_msgSend(v15, "remoteObjectProxy");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v21);

            }
          }
          else
          {
            v22 = *v3;
            if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
            {
              v23 = v22;
              v24 = objc_msgSend(v15, "processIdentifier");
              *(_DWORD *)buf = 136315394;
              v32 = "-[CSConnectionListener notifyClientsWithBlock:]_block_invoke";
              v33 = 1026;
              LODWORD(v34) = v24;
              _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s RemoteObjectProxy is nil for client PID (%{public}d)", buf, 0x12u);

            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }

    WeakRetained = v25;
  }

}

void __59__CSConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = WeakRetained[7];
    v5 = v3;
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = v6;
    *(_DWORD *)buf = 136315906;
    v15 = "-[CSConnectionListener listener:shouldAcceptNewConnection:]_block_invoke";
    v16 = 2114;
    v17 = v4;
    v18 = 2114;
    v19 = v6;
    v20 = 1026;
    v21 = objc_msgSend(v7, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s [Service:%{public}@] Listener Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x26u);

  }
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = v8;
  if (WeakRetained && v8)
  {
    objc_msgSend(WeakRetained, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__CSConnectionListener_listener_shouldAcceptNewConnection___block_invoke_6;
    v11[3] = &unk_1E7C292A0;
    v12 = v9;
    v13 = WeakRetained;
    dispatch_async(v10, v11);

  }
}

void __59__CSConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = WeakRetained[7];
    v5 = v3;
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = v6;
    *(_DWORD *)buf = 136315906;
    v14 = "-[CSConnectionListener listener:shouldAcceptNewConnection:]_block_invoke_2";
    v15 = 2114;
    v16 = v4;
    v17 = 2114;
    v18 = v6;
    v19 = 1026;
    v20 = objc_msgSend(v7, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s [Service:%{public}@] Listener Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x26u);

  }
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = v8;
  if (WeakRetained && v8)
  {
    objc_msgSend(WeakRetained, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__CSConnectionListener_listener_shouldAcceptNewConnection___block_invoke_8;
    v11[3] = &unk_1E7C292A0;
    v11[4] = WeakRetained;
    v12 = v9;
    dispatch_async(v10, v11);

  }
}

void __59__CSConnectionListener_listener_shouldAcceptNewConnection___block_invoke_8(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "clientConnections");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __59__CSConnectionListener_listener_shouldAcceptNewConnection___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 40), "clientConnections");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

}

@end
