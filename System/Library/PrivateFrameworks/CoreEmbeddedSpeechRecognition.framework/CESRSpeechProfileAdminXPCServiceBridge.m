@implementation CESRSpeechProfileAdminXPCServiceBridge

- (CESRSpeechProfileAdminXPCServiceBridge)initWithServiceProtocol:(id)a3 machServiceName:(id)a4
{
  id v7;
  id v8;
  CESRSpeechProfileAdminXPCServiceBridge *v9;
  CESRSpeechProfileAdminXPCServiceBridge *v10;
  uint64_t v11;
  NSString *machServiceName;
  NSString *v13;
  uint64_t v14;
  NSXPCInterface *serviceInterface;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  CESRSpeechProfileAdminXPCServiceBridge *v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CESRSpeechProfileAdminXPCServiceBridge;
  v9 = -[CESRSpeechProfileAdminXPCServiceBridge init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceProtocol, a3);
    if (!v10->_serviceProtocol
      || (v11 = objc_msgSend(v8, "copy"),
          machServiceName = v10->_machServiceName,
          v10->_machServiceName = (NSString *)v11,
          machServiceName,
          (v13 = v10->_machServiceName) == 0)
      || !-[NSString length](v13, "length"))
    {
      v19 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v10->_serviceProtocol);
    v14 = objc_claimAutoreleasedReturnValue();
    serviceInterface = v10->_serviceInterface;
    v10->_serviceInterface = (NSXPCInterface *)v14;

    v10->_options = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("CESRSpeechProfileXPCConnectionQueue", v16);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v17;

  }
  v19 = v10;
LABEL_8:

  return v19;
}

- (CESRSpeechProfileAdminXPCServiceBridge)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use - initWithServiceProtocol"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)_getOrCreateXPCServiceConnection
{
  NSXPCConnection *serviceConnection;
  NSObject *v4;
  void *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  NSXPCConnection *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  serviceConnection = self->_serviceConnection;
  if (!serviceConnection)
  {
    objc_initWeak(&location, self);
    v4 = (id)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromProtocol(self->_serviceProtocol);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v20 = "-[CESRSpeechProfileAdminXPCServiceBridge _getOrCreateXPCServiceConnection]";
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s Connecting to XPC service with interface: %@", buf, 0x16u);

    }
    v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", self->_machServiceName, self->_options);
    v7 = self->_serviceConnection;
    self->_serviceConnection = v6;

    -[NSXPCConnection setRemoteObjectInterface:](self->_serviceConnection, "setRemoteObjectInterface:", self->_serviceInterface);
    objc_initWeak((id *)buf, self->_serviceConnection);
    v8 = self->_serviceConnection;
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__CESRSpeechProfileAdminXPCServiceBridge__getOrCreateXPCServiceConnection__block_invoke;
    v15[3] = &unk_1E6733D50;
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v15);
    v10 = self->_serviceConnection;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __74__CESRSpeechProfileAdminXPCServiceBridge__getOrCreateXPCServiceConnection__block_invoke_5;
    v12[3] = &unk_1E6733D50;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v12);
    -[NSXPCConnection resume](self->_serviceConnection, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
    objc_destroyWeak(&location);
    serviceConnection = self->_serviceConnection;
  }
  return serviceConnection;
}

- (void)_clearXPCServiceConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__CESRSpeechProfileAdminXPCServiceBridge__clearXPCServiceConnection__block_invoke;
    block[3] = &unk_1E6734990;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

- (id)service
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CESRSpeechProfileAdminXPCServiceBridge_service__block_invoke;
  block[3] = &unk_1E6734990;
  block[4] = self;
  dispatch_sync(queue, block);
  return self->_remoteObjectProxy;
}

- (void)dealloc
{
  objc_super v3;

  -[CESRSpeechProfileAdminXPCServiceBridge _clearXPCServiceConnection](self, "_clearXPCServiceConnection");
  v3.receiver = self;
  v3.super_class = (Class)CESRSpeechProfileAdminXPCServiceBridge;
  -[CESRSpeechProfileAdminXPCServiceBridge dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_serviceInterface, 0);
  objc_storeStrong((id *)&self->_serviceProtocol, 0);
}

void __49__CESRSpeechProfileAdminXPCServiceBridge_service__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[7])
  {
    objc_msgSend(v2, "_getOrCreateXPCServiceConnection");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

  }
}

void __68__CESRSpeechProfileAdminXPCServiceBridge__clearXPCServiceConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = 0;

}

void __74__CESRSpeechProfileAdminXPCServiceBridge__getOrCreateXPCServiceConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315650;
    v6 = "-[CESRSpeechProfileAdminXPCServiceBridge _getOrCreateXPCServiceConnection]_block_invoke";
    v7 = 2112;
    v8 = v3;
    v9 = 2112;
    v10 = WeakRetained;
    _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s service connection %@ by %@ was interrupted", (uint8_t *)&v5, 0x20u);
  }

}

void __74__CESRSpeechProfileAdminXPCServiceBridge__getOrCreateXPCServiceConnection__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315650;
    v6 = "-[CESRSpeechProfileAdminXPCServiceBridge _getOrCreateXPCServiceConnection]_block_invoke";
    v7 = 2112;
    v8 = v3;
    v9 = 2112;
    v10 = WeakRetained;
    _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s service connection %@ by %@ was invalidated", (uint8_t *)&v5, 0x20u);
  }
  objc_msgSend(WeakRetained, "_clearXPCServiceConnection");

}

@end
