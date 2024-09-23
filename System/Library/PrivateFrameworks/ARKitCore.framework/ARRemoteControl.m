@implementation ARRemoteControl

- (ARRemoteControl)init
{
  return -[ARRemoteControl initWithEndpoint:](self, "initWithEndpoint:", 0);
}

- (ARRemoteControl)initWithEndpoint:(id)a3
{
  id v4;
  ARRemoteControl *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *connection;
  uint64_t v10;
  NSXPCConnection *v11;
  uint64_t v12;
  ARWeakReference *exportedObjectWeakReference;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  ARControlProtocol *control;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ARRemoteControl;
  v5 = -[ARRemoteControl init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v7 = v6;
    if (v4)
    {
      v8 = objc_msgSend(v6, "initWithListenerEndpoint:", v4);
      connection = v5->_connection;
      v5->_connection = (NSXPCConnection *)v8;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "serviceName");
      connection = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "initWithMachServiceName:options:", connection, 0);
      v11 = v5->_connection;
      v5->_connection = (NSXPCConnection *)v10;

    }
    +[ARWeakReference weakReferenceWithObject:](ARWeakReference, "weakReferenceWithObject:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    exportedObjectWeakReference = v5->_exportedObjectWeakReference;
    v5->_exportedObjectWeakReference = (ARWeakReference *)v12;

    -[NSXPCConnection setExportedObject:](v5->_connection, "setExportedObject:", v5->_exportedObjectWeakReference);
    objc_msgSend((id)objc_opt_class(), "controlProxyInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5->_connection, "setExportedInterface:", v14);

    objc_msgSend((id)objc_opt_class(), "controlInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v15);

    objc_initWeak(&location, v5);
    v16 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __36__ARRemoteControl_initWithEndpoint___block_invoke;
    v22[3] = &unk_1E66722C0;
    objc_copyWeak(&v23, &location);
    -[NSXPCConnection setInterruptionHandler:](v5->_connection, "setInterruptionHandler:", v22);
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __36__ARRemoteControl_initWithEndpoint___block_invoke_2;
    v20[3] = &unk_1E66722C0;
    objc_copyWeak(&v21, &location);
    -[NSXPCConnection setInvalidationHandler:](v5->_connection, "setInvalidationHandler:", v20);
    -[NSXPCConnection resume](v5->_connection, "resume");
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v5->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
    v17 = objc_claimAutoreleasedReturnValue();
    control = v5->_control;
    v5->_control = (ARControlProtocol *)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __36__ARRemoteControl_initWithEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "interruptionHandler");

}

void __36__ARRemoteControl_initWithEndpoint___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidationHandler");

}

void __36__ARRemoteControl_initWithEndpoint___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _ARLogGeneral_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_ERROR, "ARRemoteControl: Remote object proxy failed with error: %@", (uint8_t *)&v5, 0xCu);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[ARRemoteControl invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ARRemoteControl;
  -[ARRemoteControl dealloc](&v3, sel_dealloc);
}

- (ARControlProtocol)syncControl
{
  return (ARControlProtocol *)-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
}

void __30__ARRemoteControl_syncControl__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _ARLogGeneral_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_ERROR, "ARRemoteControl: Sync remote object proxy failed with error: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)invalidate
{
  NSXPCConnection *connection;
  ARControlProtocol *control;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  control = self->_control;
  self->_control = 0;

}

- (void)interruptionHandler
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  ARRemoteControl *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _ARLogGeneral_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Control interrupted", (uint8_t *)&v7, 0x16u);

  }
  -[ARRemoteControl delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionInterrupted");

}

- (void)invalidationHandler
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  ARRemoteControl *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ARLogGeneral_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Control invalidated", (uint8_t *)&v6, 0x16u);

  }
}

+ (NSString)serviceName
{
  return (NSString *)CFSTR("com.apple.arkit.service.control");
}

+ (NSXPCInterface)controlProxyInterface
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF087988);
}

+ (NSXPCInterface)controlInterface
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF0AB3C8);
}

- (ARControlProtocol)control
{
  return self->_control;
}

- (ARRemoteControlDelegate)delegate
{
  return (ARRemoteControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_exportedObjectWeakReference, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
