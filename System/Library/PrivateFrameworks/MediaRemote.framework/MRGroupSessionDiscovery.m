@implementation MRGroupSessionDiscovery

- (MRGroupSessionDiscovery)initWithDelegate:(id)a3
{
  id v4;
  MRGroupSessionDiscovery *v5;
  MRGroupSessionDiscovery *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *callbackQueue;
  uint64_t v11;
  NSSet *discoveredSessions;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRGroupSessionDiscovery;
  v5 = -[MRGroupSessionDiscovery init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    MRGroupSessionSubsystemGetNotificationQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRGroupSessionDiscovery.callbackQueue", v7, v8);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v6->_delegate, v4);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    discoveredSessions = v6->_discoveredSessions;
    v6->_discoveredSessions = (NSSet *)v11;

    -[MRGroupSessionDiscovery registerNotifications](v6, "registerNotifications");
    -[MRGroupSessionDiscovery initializeConnection](v6, "initializeConnection");
  }

  return v6;
}

- (void)initializeConnection
{
  MRGroupSessionXPCConnection *v3;
  void *v4;
  uint64_t v5;
  MRGroupSessionXPCConnection *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = [MRGroupSessionXPCConnection alloc];
  objc_msgSend(MEMORY[0x1E0D4D120], "proxyWithObject:protocol:", self, &unk_1EE2ED2C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__MRGroupSessionDiscovery_initializeConnection__block_invoke;
  v8[3] = &unk_1E30C6AA0;
  objc_copyWeak(&v9, &location);
  v6 = -[MRGroupSessionXPCConnection initWithClientObject:invalidationHandler:](v3, "initWithClientObject:invalidationHandler:", v4, v8);

  -[MRGroupSessionDiscovery setConnection:](self, "setConnection:", v6);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __47__MRGroupSessionDiscovery_initializeConnection__block_invoke_8;
  v7[3] = &unk_1E30CD168;
  v7[4] = self;
  -[MRGroupSessionXPCConnection sendMessage:](v6, "sendMessage:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__MRGroupSessionDiscovery_initializeConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _MRLogForCategory(0xCuLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __47__MRGroupSessionDiscovery_initializeConnection__block_invoke_cold_1((uint64_t)WeakRetained, v2);

    objc_msgSend(WeakRetained, "setConnection:", 0);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "discoveredSessionsDidChange:", v3);

    objc_msgSend(WeakRetained, "activeSessionDidChange:", 0);
  }

}

uint64_t __47__MRGroupSessionDiscovery_initializeConnection__block_invoke_8(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__MRGroupSessionDiscovery_initializeConnection__block_invoke_2;
  v3[3] = &unk_1E30CD140;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "connectToDiscoveryWithReply:", v3);
}

void __47__MRGroupSessionDiscovery_initializeConnection__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a3);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  _MRLogForCategory(0xCuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412802;
    v11 = v9;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_INFO, "[MRGroupSessionDiscovery] %@ XPC connection initialized with state: activeSession=%@, discoveredSessions=%@", (uint8_t *)&v10, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateWithDiscoveredSessions:", v6);
  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateWithActiveSession:", v7);

}

- (void)registerNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleDidRestoreConnectionNotification, CFSTR("kMRMediaRemoteServiceClientDidRestoreConnectionNotification"), 0);

}

- (void)handleDidRestoreConnectionNotification
{
  NSObject *v3;
  int v4;
  MRGroupSessionDiscovery *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xCuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionDiscovery] %@ Daemon connection restored. Re-initializing", (uint8_t *)&v4, 0xCu);
  }

  -[MRGroupSessionDiscovery initializeConnection](self, "initializeConnection");
}

- (id)debugDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p - activeSession=%@,discoveredSessions=%@>"), objc_opt_class(), self, self->_activeSession, self->_discoveredSessions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setConnection:(id)a3
{
  MRGroupSessionXPCConnection *v4;
  MRGroupSessionXPCConnection *connection;

  v4 = (MRGroupSessionXPCConnection *)a3;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  self->_connection = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (MRGroupSessionInfo)activeSession
{
  os_unfair_lock_s *p_lock;
  MRGroupSessionInfo *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_activeSession;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSSet)discoveredSessions
{
  os_unfair_lock_s *p_lock;
  NSSet *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_discoveredSessions;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)discoveredSessionsDidChange:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  MRGroupSessionDiscovery *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_discoveredSessions, a3);
  os_unfair_lock_unlock(&self->_lock);
  _MRLogForCategory(0xCuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_INFO, "[MRGroupSessionDiscovery] %@ Discovered sessions changed: %@", (uint8_t *)&v7, 0x16u);
  }

  -[MRGroupSessionDiscovery notifyDelegateWithDiscoveredSessions:](self, "notifyDelegateWithDiscoveredSessions:", v5);
}

- (void)activeSessionDidChange:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  MRGroupSessionDiscovery *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_activeSession, a3);
  os_unfair_lock_unlock(&self->_lock);
  _MRLogForCategory(0xCuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_INFO, "[MRGroupSessionDiscovery] %@ Active session changed: %@", (uint8_t *)&v7, 0x16u);
  }

  -[MRGroupSessionDiscovery notifyDelegateWithActiveSession:](self, "notifyDelegateWithActiveSession:", v5);
}

- (void)notifyDelegateWithDiscoveredSessions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  MRGroupSessionDiscovery *v9;
  id v10;

  v4 = a3;
  -[MRGroupSessionDiscovery delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MRGroupSessionDiscovery callbackQueue](self, "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__MRGroupSessionDiscovery_notifyDelegateWithDiscoveredSessions___block_invoke;
    block[3] = &unk_1E30C7328;
    v8 = v5;
    v9 = self;
    v10 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __64__MRGroupSessionDiscovery_notifyDelegateWithDiscoveredSessions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "groupSessionDiscovery:discoveredSessionsDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)notifyDelegateWithActiveSession:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  MRGroupSessionDiscovery *v9;
  id v10;

  v4 = a3;
  -[MRGroupSessionDiscovery delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MRGroupSessionDiscovery callbackQueue](self, "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MRGroupSessionDiscovery_notifyDelegateWithActiveSession___block_invoke;
    block[3] = &unk_1E30C7328;
    v8 = v5;
    v9 = self;
    v10 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __59__MRGroupSessionDiscovery_notifyDelegateWithActiveSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "groupSessionDiscovery:activeSessionDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setDiscoveredSessions:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredSessions, a3);
}

- (void)setActiveSession:(id)a3
{
  objc_storeStrong((id *)&self->_activeSession, a3);
}

- (MRGroupSessionXPCConnection)connection
{
  return self->_connection;
}

- (MRGroupSessionDiscoveryDelegate)delegate
{
  return (MRGroupSessionDiscoveryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_discoveredSessions, 0);
}

void __47__MRGroupSessionDiscovery_initializeConnection__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "[MRGroupSessionDiscovery] %@ XPC connection invalidated", (uint8_t *)&v2, 0xCu);
}

@end
