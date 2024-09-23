@implementation MTSessionServer

- (void)endAlertingSession
{
  NSObject *v3;
  int v4;
  MTSessionServer *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ ending alerting session", (uint8_t *)&v4, 0xCu);
  }

  -[MTSessionsCoordinator endAlertingSession](self->_coordinator, "endAlertingSession");
}

- (MTSessionServer)initWithCoordinator:(id)a3
{
  id v5;
  MTSessionServer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NAScheduler *serializer;
  MTXPCConnectionListenerProvider *v13;
  MTXPCConnectionListenerProvider *connectionListenerProvider;
  MTXPCConnectionListenerProvider *v15;
  objc_super v17;
  uint8_t buf[4];
  MTSessionServer *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MTSessionServer;
  v6 = -[MTSessionServer init](&v17, sel_init);
  if (v6)
  {
    MTLogForCategory(4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    MTSessionClientInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MTSessionServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTXPCConnectionInfo infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:](MTXPCConnectionInfo, "infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", CFSTR("com.apple.MobileTimer.sessionserver"), v8, v6, v9, CFSTR("com.apple.MTSessionServer.wakeup"), CFSTR("com.apple.private.mobiletimerd"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTSessionServer.ready-queue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v11 = objc_claimAutoreleasedReturnValue();
    serializer = v6->_serializer;
    v6->_serializer = (NAScheduler *)v11;

    +[MTXPCConnectionListenerProvider providerWithConnectionInfo:errorHandler:](MTXPCConnectionListenerProvider, "providerWithConnectionInfo:errorHandler:", v10, 0);
    v13 = (MTXPCConnectionListenerProvider *)objc_claimAutoreleasedReturnValue();
    connectionListenerProvider = v6->_connectionListenerProvider;
    v6->_connectionListenerProvider = v13;
    v15 = v13;

    objc_storeStrong((id *)&v6->_coordinator, a3);
  }

  return v6;
}

- (void)startListening
{
  NSObject *v3;
  void *v4;
  int v5;
  MTSessionServer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "Starting %{public}@", (uint8_t *)&v5, 0xCu);
  }

  -[MTSessionServer connectionListenerProvider](self, "connectionListenerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startListening");

}

- (void)stopListening
{
  NSObject *v3;
  void *v4;
  int v5;
  MTSessionServer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "Stopping %{public}@", (uint8_t *)&v5, 0xCu);
  }

  -[MTSessionServer connectionListenerProvider](self, "connectionListenerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopListening");

}

- (void)handleSystemReady
{
  void *v3;
  _QWORD v4[5];

  -[MTSessionServer serializer](self, "serializer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__MTSessionServer_handleSystemReady__block_invoke;
  v4[3] = &unk_1E39CB858;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __36__MTSessionServer_handleSystemReady__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "System is ready: %{public}@.  Will post MTSessionServerReadyNotification.", (uint8_t *)&v5, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.MTSessionServer.ready"), 0, 0, 1);

}

- (id)_systemNotReadyError
{
  NSObject *v2;

  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[MTSessionServer _systemNotReadyError].cold.1(v2);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTSessionServer"), 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isSystemReady
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v7[5];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = dispatch_semaphore_create(0);
  -[MTSessionServer serializer](self, "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__MTSessionServer__isSystemReady__block_invoke;
  v7[3] = &unk_1E39CB8A8;
  v9 = &v10;
  v7[4] = self;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "performBlock:", v7);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

intptr_t __33__MTSessionServer__isSystemReady__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)printDiagnostics
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "-----MTSessionServer-----", (uint8_t *)&v9, 2u);
  }

  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTSessionServer _isSystemReady](self, "_isSystemReady"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "System Ready: %@", (uint8_t *)&v9, 0xCu);

  }
  MTLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MTSessionServer connectionListenerProvider](self, "connectionListenerProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connectedClients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "Clients: %{public}@", (uint8_t *)&v9, 0xCu);

  }
}

- (id)gatherDiagnostics
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("Session system ready");
  if (-[MTSessionServer _isSystemReady](self, "_isSystemReady"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v10[1] = CFSTR("Session clients");
  v11[0] = v3;
  -[MTSessionServer connectionListenerProvider](self, "connectionListenerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("processName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MTXPCConnectionListenerProvider)connectionListenerProvider
{
  return self->_connectionListenerProvider;
}

- (BOOL)isSystemReady
{
  return self->_systemReady;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (MTSessionsCoordinator)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_connectionListenerProvider, 0);
}

- (void)_systemNotReadyError
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "System isn't ready...", v1, 2u);
}

@end
