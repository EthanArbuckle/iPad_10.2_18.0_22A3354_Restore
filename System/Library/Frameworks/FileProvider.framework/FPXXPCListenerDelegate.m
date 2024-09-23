@implementation FPXXPCListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[FPXXPCListenerDelegate context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPXXPCListenerDelegate setContext:](self, "setContext:", 0);
  -[FPXXPCListenerDelegate exportedObject](self, "exportedObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPXXPCListenerDelegate setExportedObject:](self, "setExportedObject:", 0);
  if (v8)
  {
    -[FPXXPCListenerDelegate interface](self, "interface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v10);

    objc_msgSend(v7, "setExportedObject:", v9);
    location = 0;
    objc_initWeak(&location, v7);
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke;
    v16[3] = &unk_1E444A308;
    v17 = v6;
    objc_msgSend(v7, "setInvalidationHandler:", v16);
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_1;
    v14[3] = &unk_1E44499C0;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v7, "setInterruptionHandler:", v14);
    objc_msgSend(v8, "removeListenerDelegate:", self);
    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  else
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[FPXXPCListenerDelegate listener:shouldAcceptNewConnection:].cold.1((uint64_t)self, v12);

  }
  return v8 != 0;
}

uint64_t __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_cold_1(v2);

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_1(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_1_cold_1(v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

- (FPXExtensionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
  objc_storeStrong(&self->_exportedObject, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ not accepting connection because the context is nil", (uint8_t *)&v2, 0xCu);
}

void __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] connection invalidated", v1, 2u);
}

void __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_1_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "[ERROR] connection interrupted", v1, 2u);
}

@end
