@implementation BKSAlternateSystemApp

- (BKSAlternateSystemApp)initWithBundleId:(id)a3
{
  id v4;
  BKSAlternateSystemApp *v5;
  BKSAlternateSystemApp *v6;
  dispatch_semaphore_t v7;
  OS_dispatch_semaphore *stateChangeSemaphore;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  NSXPCConnection *connection;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKSAlternateSystemApp;
  v5 = -[BKSAlternateSystemApp init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    -[BKSAlternateSystemApp setBundleId:](v5, "setBundleId:", v4);
    v6->_stateChangeWaiter = 0;
    v7 = dispatch_semaphore_create(0);
    stateChangeSemaphore = v6->_stateChangeSemaphore;
    v6->_stateChangeSemaphore = (OS_dispatch_semaphore *)v7;

    Serial = BSDispatchQueueCreateSerial();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)Serial;

    connection = v6->_connection;
    v6->_connection = 0;

  }
  return v6;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSAlternateSystemApp.m"), 81, CFSTR("BKSAlternateSystemApp %@: you must call -terminate before -dealloc"), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)BKSAlternateSystemApp;
  -[BKSAlternateSystemApp dealloc](&v5, sel_dealloc);
}

- (void)activate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__BKSAlternateSystemApp_activate__block_invoke;
  block[3] = &unk_1E1EA15A8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)terminate
{
  uint64_t v3;
  NSObject *queue;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__BKSAlternateSystemApp_terminate__block_invoke;
  block[3] = &unk_1E1EA15A8;
  block[4] = self;
  dispatch_async(queue, block);
  -[BKSAlternateSystemApp _waitForState:](self, "_waitForState:", 0);
  v5 = self->_queue;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __34__BKSAlternateSystemApp_terminate__block_invoke_6;
  v6[3] = &unk_1E1EA15A8;
  v6[4] = self;
  dispatch_sync(v5, v6);
}

- (void)_queue_ensureConnection
{
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  void *v13;
  void *v14;
  unint64_t state;
  const __CFString *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_connection)
  {
    if (self->_state)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      state = self->_state;
      if (state > 3)
        v16 = CFSTR("Unknown");
      else
        v16 = off_1E1EA09F8[state];
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSAlternateSystemApp.m"), 119, CFSTR("BKSAlternateSystemApp %@ has no connection but is in state %@ instead of Idle"), self, v16);

    }
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.backboard.altsysapp"), 4096);
    connection = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF662C0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    v8 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF608C8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke;
    v19[3] = &unk_1E1EA09B0;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", v19);
    v12 = self->_connection;
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke_3;
    v17[3] = &unk_1E1EA09B0;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", v17);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (void)_queue_changeState:(int64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BKLogAlternateSystemApp();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3)
      v6 = CFSTR("Unknown");
    else
      v6 = off_1E1EA09F8[a3];
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_DEFAULT, "Setting state to %{public}@", (uint8_t *)&v7, 0xCu);
  }

  self->_state = a3;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_stateChangeSemaphore);
}

- (void)_waitForState:(int64_t)a3
{
  uint64_t v5;
  NSObject *queue;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v5 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    queue = self->_queue;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __39__BKSAlternateSystemApp__waitForState___block_invoke;
    block[3] = &unk_1E1EA09D8;
    block[5] = &v8;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(queue, block);
    if (*((_BYTE *)v9 + 24))
      break;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_stateChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    _Block_object_dispose(&v8, 8);
  }
  _Block_object_dispose(&v8, 8);
}

- (void)_queue_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", 0);
  -[BKSAlternateSystemApp setConnection:](self, "setConnection:", 0);
}

- (void)_handleInterruptedConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__BKSAlternateSystemApp__handleInterruptedConnection__block_invoke;
  block[3] = &unk_1E1EA15A8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)didBlockSystemAppForAlternateSystemApp
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  BKLogAlternateSystemApp();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[BKSAlternateSystemApp didBlockSystemAppForAlternateSystemApp]";
    _os_log_debug_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_DEBUG, "%s: message from server", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__BKSAlternateSystemApp_didBlockSystemAppForAlternateSystemApp__block_invoke;
  block[3] = &unk_1E1EA15A8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)didUnblockSystemAppForAlternateSystemApp
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  BKLogAlternateSystemApp();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[BKSAlternateSystemApp didUnblockSystemAppForAlternateSystemApp]";
    _os_log_debug_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_DEBUG, "%s: message from server", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__BKSAlternateSystemApp_didUnblockSystemAppForAlternateSystemApp__block_invoke;
  block[3] = &unk_1E1EA15A8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BKSAlternateSystemApp)alternateSystemAppWithBundleID:(id)a3 failedToOpenWithResult:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  BKSAlternateSystemApp *result;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  BKLogAlternateSystemApp();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:failedToOpenWithResult:]";
    _os_log_debug_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_DEBUG, "%s: message from server", buf, 0xCu);
  }

  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__BKSAlternateSystemApp_alternateSystemAppWithBundleID_failedToOpenWithResult___block_invoke;
  v10[3] = &unk_1E1EA1BF8;
  v10[4] = self;
  v11 = v5;
  v8 = v5;
  dispatch_async(queue, v10);

  return result;
}

- (BKSAlternateSystemApp)alternateSystemAppWithBundleID:(id)a3 didExitWithContext:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  BKSAlternateSystemApp *result;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  BKLogAlternateSystemApp();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:didExitWithContext:]";
    _os_log_debug_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_DEBUG, "%s: message from server", buf, 0xCu);
  }

  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__BKSAlternateSystemApp_alternateSystemAppWithBundleID_didExitWithContext___block_invoke;
  v10[3] = &unk_1E1EA1BF8;
  v10[4] = self;
  v11 = v5;
  v8 = v5;
  dispatch_async(queue, v10);

  return result;
}

- (BKSAlternateSystemApp)alternateSystemAppWithBundleIDDidOpen:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  BKSAlternateSystemApp *result;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  BKLogAlternateSystemApp();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleIDDidOpen:]";
    _os_log_debug_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEBUG, "%s: message from server", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__BKSAlternateSystemApp_alternateSystemAppWithBundleIDDidOpen___block_invoke;
  block[3] = &unk_1E1EA15A8;
  block[4] = self;
  dispatch_async(queue, block);
  return result;
}

- (BKSAlternateSystemApp)alternateSystemAppWithBundleIDDidTerminate:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  BKSAlternateSystemApp *result;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  BKLogAlternateSystemApp();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleIDDidTerminate:]";
    _os_log_debug_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEBUG, "%s: message from server", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__BKSAlternateSystemApp_alternateSystemAppWithBundleIDDidTerminate___block_invoke;
  block[3] = &unk_1E1EA15A8;
  block[4] = self;
  dispatch_async(queue, block);
  return result;
}

- (BKSAlternateSystemAppDelegate)delegate
{
  return (BKSAlternateSystemAppDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)stateChangeWaiter
{
  return self->_stateChangeWaiter;
}

- (void)setStateChangeWaiter:(BOOL)a3
{
  self->_stateChangeWaiter = a3;
}

- (OS_dispatch_semaphore)stateChangeSemaphore
{
  return self->_stateChangeSemaphore;
}

- (void)setStateChangeSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_stateChangeSemaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateChangeSemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __68__BKSAlternateSystemApp_alternateSystemAppWithBundleIDDidTerminate___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "unblockSystemAppForAlternateSystemApp");

  BKLogAlternateSystemApp();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315138;
    v4 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleIDDidTerminate:]_block_invoke";
    _os_log_debug_impl(&dword_18A0F0000, v2, OS_LOG_TYPE_DEBUG, "%s: requested unblock of system app", (uint8_t *)&v3, 0xCu);
  }

}

void __63__BKSAlternateSystemApp_alternateSystemAppWithBundleIDDidOpen___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "alternateSystemAppDidLaunch:", *(_QWORD *)(a1 + 32));
    BKLogAlternateSystemApp();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315138;
      v8 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleIDDidOpen:]_block_invoke";
      v4 = "%s: called out to delegate alternateSystemAppDidLaunch:";
      v5 = v3;
      v6 = 12;
LABEL_8:
      _os_log_debug_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v7, v6);
    }
  }
  else
  {
    BKLogAlternateSystemApp();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315394;
      v8 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleIDDidOpen:]_block_invoke";
      v9 = 2114;
      v10 = WeakRetained;
      v4 = "%s: did not call out to alternateSystemAppDidLaunch: for delegate %{public}@";
      v5 = v3;
      v6 = 22;
      goto LABEL_8;
    }
  }

}

void __75__BKSAlternateSystemApp_alternateSystemAppWithBundleID_didExitWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  const char *v5;
  _BOOL8 v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_changeState:", 2);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 40), "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSignal"))
  {
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "alternateSystemApp:didTerminateWithSignal:", *(_QWORD *)(a1 + 32), 0xFFFFFFFFLL);
      BKLogAlternateSystemApp();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v9 = 136315138;
        v10 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:didExitWithContext:]_block_invoke";
        v5 = "%s called out to delegate alternateSystemApp:didTerminateWithSignal:";
LABEL_10:
        v7 = v4;
        v8 = 12;
LABEL_17:
        _os_log_debug_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_DEBUG, v5, (uint8_t *)&v9, v8);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    BKLogAlternateSystemApp();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    v9 = 136315394;
    v10 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:didExitWithContext:]_block_invoke";
    v11 = 2114;
    v12 = WeakRetained;
    v5 = "%s did not call out to alternateSystemApp:didTerminateWithSignal: for delegate %{public}@";
LABEL_16:
    v7 = v4;
    v8 = 22;
    goto LABEL_17;
  }
  v6 = objc_msgSend(*(id *)(a1 + 40), "type") != 1;
  if (!WeakRetained || (objc_opt_respondsToSelector() & 1) == 0)
  {
    BKLogAlternateSystemApp();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    v9 = 136315394;
    v10 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:didExitWithContext:]_block_invoke";
    v11 = 2114;
    v12 = WeakRetained;
    v5 = "%s did not call out to alternateSystemApp:didExitWithStatus: for delegate %{public}@";
    goto LABEL_16;
  }
  objc_msgSend(WeakRetained, "alternateSystemApp:didExitWithStatus:", *(_QWORD *)(a1 + 32), v6);
  BKLogAlternateSystemApp();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315138;
    v10 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:didExitWithContext:]_block_invoke";
    v5 = "%s called out to delegate alternateSystemApp:didExitWithStatus:";
    goto LABEL_10;
  }
LABEL_14:

}

void __79__BKSAlternateSystemApp_alternateSystemAppWithBundleID_failedToOpenWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_changeState:", 2);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "alternateSystemApp:didFailToLaunchWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    BKLogAlternateSystemApp();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315138;
      v8 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:failedToOpenWithResult:]_block_invoke";
      v4 = "%s called out to delegate alternateSystemApp:didFailToLaunchWithError:";
      v5 = v3;
      v6 = 12;
LABEL_8:
      _os_log_debug_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v7, v6);
    }
  }
  else
  {
    BKLogAlternateSystemApp();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315394;
      v8 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:failedToOpenWithResult:]_block_invoke";
      v9 = 2114;
      v10 = WeakRetained;
      v4 = "%s did not call out to alternateSystemApp:didFailToLaunchWithError: for delegate %{public}@";
      v5 = v3;
      v6 = 22;
      goto LABEL_8;
    }
  }

}

uint64_t __65__BKSAlternateSystemApp_didUnblockSystemAppForAlternateSystemApp__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_changeState:", 0);
}

void __63__BKSAlternateSystemApp_didBlockSystemAppForAlternateSystemApp__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 48) != 2)
  {
    objc_msgSend(*(id *)(v1 + 32), "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openAlternateSystemAppWithBundleID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

    BKLogAlternateSystemApp();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v6 = 136315394;
      v7 = "-[BKSAlternateSystemApp didBlockSystemAppForAlternateSystemApp]_block_invoke";
      v8 = 2114;
      v9 = v5;
      _os_log_debug_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEBUG, "%s: requested open of alternate system app \"%{public}@\", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __53__BKSAlternateSystemApp__handleInterruptedConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 48);
  switch(v2)
  {
    case 3:
      objc_msgSend((id)v1, "_queue_changeState:", 0);
      break;
    case 2:
      objc_msgSend(*(id *)(v1 + 32), "remoteObjectProxy");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "blockSystemAppForAlternateSystemApp");

      break;
    case 1:
      objc_msgSend((id)v1, "activate");
      break;
  }
}

_QWORD *__39__BKSAlternateSystemApp__waitForState___block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = result[6] == *(_QWORD *)(result[4] + 48);
  return result;
}

void __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  _QWORD *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained[5];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke_2;
  block[3] = &unk_1E1EA15A8;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

void __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  _QWORD *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained[5];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke_4;
  block[3] = &unk_1E1EA15A8;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

uint64_t __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInvalidatedConnection");
}

uint64_t __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInterruptedConnection");
}

void __34__BKSAlternateSystemApp_terminate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  BKLogAlternateSystemApp();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18A0F0000, v2, OS_LOG_TYPE_DEFAULT, "Terminating", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_changeState:", 3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "terminateAlternateSystemAppWithBundleID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

}

uint64_t __34__BKSAlternateSystemApp_terminate__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_invalidate");
}

void __33__BKSAlternateSystemApp_activate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  BKLogAlternateSystemApp();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18A0F0000, v2, OS_LOG_TYPE_DEFAULT, "Activating", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  objc_msgSend(*(id *)(a1 + 32), "_queue_changeState:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockSystemAppForAlternateSystemApp");

}

@end
