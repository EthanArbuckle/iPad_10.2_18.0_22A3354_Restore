@implementation DNDRemoteAvailabilityServiceConnection

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__DNDRemoteAvailabilityServiceConnection_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __56__DNDRemoteAvailabilityServiceConnection_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (DNDRemoteAvailabilityServiceConnection)init
{
  DNDRemoteAvailabilityServiceConnection *v2;
  DNDRemoteAvailabilityServiceConnection *v3;
  uint64_t v4;
  BSServiceQuality *queuePriority;
  void *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DNDRemoteAvailabilityServiceConnection;
  v2 = -[DNDRemoteAvailabilityServiceConnection init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
    v4 = objc_claimAutoreleasedReturnValue();
    queuePriority = v3->_queuePriority;
    v3->_queuePriority = (BSServiceQuality *)v4;

    objc_msgSend(MEMORY[0x1E0D01760], "serial");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceClass:relativePriority:", -[BSServiceQuality serviceClass](v3->_queuePriority, "serviceClass"), -[BSServiceQuality relativePriority](v3->_queuePriority, "relativePriority"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSDispatchQueueCreate();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

  }
  return v3;
}

- (id)_queue_remoteTarget
{
  void *v3;

  BSDispatchQueueAssert();
  -[BSServiceConnection remoteTarget](self->_queue_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[DNDRemoteAvailabilityServiceConnection _queue_invalidateConnection](self, "_queue_invalidateConnection");
    -[DNDRemoteAvailabilityServiceConnection _queue_createConnection](self, "_queue_createConnection");
    -[BSServiceConnection remoteTarget](self->_queue_connection, "remoteTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_queue_createConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BSServiceConnection *v7;
  BSServiceConnection *queue_connection;
  BSServiceConnection *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  BSDispatchQueueAssert();
  DNDRemoteAvailabilityServiceServerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D03458];
  v10 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointForMachName:service:instance:", CFSTR("com.apple.donotdisturb.availability.service"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v6);
    v7 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
    queue_connection = self->_queue_connection;
    self->_queue_connection = v7;

    v9 = self->_queue_connection;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__DNDRemoteAvailabilityServiceConnection__queue_createConnection__block_invoke;
    v11[3] = &unk_1E39B5F40;
    v11[4] = self;
    v12 = v10;
    -[BSServiceConnection configureConnection:](v9, "configureConnection:", v11);
    -[BSServiceConnection activate](self->_queue_connection, "activate");

  }
}

void __65__DNDRemoteAvailabilityServiceConnection__queue_createConnection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = a2;
  objc_msgSend(v4, "setServiceQuality:", v3);
  objc_msgSend(v4, "setInterface:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setActivationHandler:", &__block_literal_global_55);
  objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_57);
  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_59);

}

void __65__DNDRemoteAvailabilityServiceConnection__queue_createConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v2;
    _os_log_impl(&dword_19ABEB000, v3, OS_LOG_TYPE_DEFAULT, "XPC request connection was activated: connection=%p", (uint8_t *)&v4, 0xCu);
  }

}

void __65__DNDRemoteAvailabilityServiceConnection__queue_createConnection__block_invoke_56(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v2;
    _os_log_impl(&dword_19ABEB000, v3, OS_LOG_TYPE_DEFAULT, "XPC request connection was interrupted: connection=%p", (uint8_t *)&v4, 0xCu);
  }

}

void __65__DNDRemoteAvailabilityServiceConnection__queue_createConnection__block_invoke_58(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v2;
    _os_log_impl(&dword_19ABEB000, v3, OS_LOG_TYPE_DEFAULT, "XPC request connection was invalidated, cannot recover: connection=%p", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_queue_invalidateConnection
{
  BSServiceConnection *queue_connection;
  BSServiceConnection *v4;

  BSDispatchQueueAssert();
  queue_connection = self->_queue_connection;
  if (queue_connection)
  {
    -[BSServiceConnection invalidate](queue_connection, "invalidate");
    v4 = self->_queue_connection;
    self->_queue_connection = 0;

  }
}

- (void)getIsLocalUserAvailableWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__DNDRemoteAvailabilityServiceConnection_getIsLocalUserAvailableWithRequestDetails_completionHandler___block_invoke;
  block[3] = &unk_1E39B5700;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __102__DNDRemoteAvailabilityServiceConnection_getIsLocalUserAvailableWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getIsLocalUserAvailableWithRequestDetails:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queuePriority, 0);
  objc_storeStrong((id *)&self->_queue_connection, 0);
}

@end
