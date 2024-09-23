@implementation FPXConnectionHandler

- (FPXConnectionHandler)init
{
  FPXConnectionHandler *v2;
  NSObject *v3;
  uid_t v4;
  objc_super v6;
  uint8_t buf[4];
  uid_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)FPXConnectionHandler;
  v2 = -[FPXConnectionHandler init](&v6, sel_init);
  if (v2 && +[FPDaemonConnection runningInSyncBubble](FPDaemonConnection, "runningInSyncBubble"))
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = geteuid();
      *(_DWORD *)buf = 67109120;
      v8 = v4;
      _os_log_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] shared iPad: extension is running in the sync bubble for euid %u", buf, 8u);
    }

  }
  return v2;
}

- (Class)delegateClass
{
  return 0;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  return 1;
}

- (id)makeNewContext
{
  FPXConnectionHandler *v2;
  NSObject *v3;
  FPXExtensionContext *v4;
  FPXExtensionContext *currentContext;
  FPXExtensionContext *v6;

  v2 = self;
  objc_sync_enter(v2);
  ++v2->_activeConnections;
  if (v2->_currentContext)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FPXConnectionHandler makeNewContext].cold.1((uint64_t)v2, &v2->_activeConnections, v3);

  }
  else
  {
    v4 = objc_alloc_init(FPXExtensionContext);
    currentContext = v2->_currentContext;
    v2->_currentContext = v4;

  }
  v6 = v2->_currentContext;
  objc_sync_exit(v2);

  return v6;
}

- (void)invalidateCurrentContext:(void *)a3
{
  FPXConnectionHandler *v4;
  int v5;
  NSObject *v6;
  int activeConnections;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  FPXExtensionContext *currentContext;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v5 = v4->_activeConnections - 1;
  v4->_activeConnections = v5;
  if (v5)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      activeConnections = v4->_activeConnections;
      v12 = 134218240;
      v13 = a3;
      v14 = 1024;
      v15 = activeConnections;
      v8 = "[INFO] [helena] connection %p was invalidated, %d left";
      v9 = v6;
      v10 = 18;
LABEL_6:
      _os_log_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    -[FPXExtensionContext invalidate](v4->_currentContext, "invalidate");
    currentContext = v4->_currentContext;
    v4->_currentContext = 0;

    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v12 = 134217984;
      v13 = a3;
      v8 = "[INFO] [helena] last connection %p was invalidated, tearing down";
      v9 = v6;
      v10 = 12;
      goto LABEL_6;
    }
  }

  objc_sync_exit(v4);
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14[2];
  _QWORD v15[4];
  id v16[2];
  _BYTE buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_INFO, "[INFO] [helena] accepting connection %@", buf, 0xCu);
  }

  FPXVendorXPCInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v6);

  -[FPXConnectionHandler makeNewContext](self, "makeNewContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedObject:", v7);
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__FPXConnectionHandler_shouldAcceptConnection___block_invoke;
  v15[3] = &unk_1E444DB48;
  objc_copyWeak(v16, (id *)buf);
  v16[1] = v4;
  objc_msgSend(v4, "setInvalidationHandler:", v15);
  v10 = v8;
  v11 = 3221225472;
  v12 = __47__FPXConnectionHandler_shouldAcceptConnection___block_invoke_2;
  v13 = &unk_1E444DB48;
  objc_copyWeak(v14, (id *)buf);
  v14[1] = v4;
  objc_msgSend(v4, "setInterruptionHandler:", &v10);
  objc_msgSend(v4, "activate", v10, v11, v12, v13);
  objc_destroyWeak(v14);
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)buf);

  return 1;
}

void __47__FPXConnectionHandler_shouldAcceptConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_cold_1(v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateCurrentContext:", *(_QWORD *)(a1 + 40));

}

void __47__FPXConnectionHandler_shouldAcceptConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_1_cold_1(v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateCurrentContext:", *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContext, 0);
}

- (void)makeNewContext
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = v3;
  _os_log_fault_impl(&dword_1A0A34000, log, OS_LOG_TYPE_FAULT, "[CRIT] [helena] %@ has existing context, so we have gotten two calls to create a connection (connection count is %d)", (uint8_t *)&v4, 0x12u);
}

@end
