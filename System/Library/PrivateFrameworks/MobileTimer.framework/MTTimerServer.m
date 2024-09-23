@implementation MTTimerServer

intptr_t __31__MTTimerServer__isSystemReady__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)getTimersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTTimerServer storage](self, "storage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getTimersWithCompletion:", v7);
LABEL_5:

    v5 = v7;
    goto LABEL_6;
  }
  v5 = v7;
  if (v7)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    -[MTTimerServer _systemNotReadyError](self, "_systemNotReadyError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD, void *))v7 + 2))(v7, v4, 0, v6);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)getTimerDurationsWithCompletion:(id)a3
{
  void (**v4)(id, id, id, id, _QWORD, void *);
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  MTTimerServer *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id, id, id, _QWORD, void *))a3;
  MTLogForCategory(9);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ - getTimerDurationsWithCompletion", (uint8_t *)&v10, 0xCu);
  }

  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTTimerServer storage](self, "storage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getDurationsWithCompletion:", v4);
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    -[MTTimerServer _systemNotReadyError](self, "_systemNotReadyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, v7, v8, 0, v9);

    goto LABEL_7;
  }
LABEL_8:

}

- (MTTimerStorage)storage
{
  return self->_storage;
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
  -[MTTimerServer serializer](self, "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__MTTimerServer__isSystemReady__block_invoke;
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

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (MTTimerServer)initWithStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MTTimerServer *v9;

  v4 = a3;
  MTTimerClientInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MTTimerServerInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTXPCConnectionInfo infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:](MTXPCConnectionInfo, "infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", CFSTR("com.apple.MobileTimer.timerserver"), v5, self, v6, CFSTR("com.apple.MTTimerServer.wakeup"), CFSTR("com.apple.private.mobiletimerd"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTXPCConnectionListenerProvider providerWithConnectionInfo:errorHandler:](MTXPCConnectionListenerProvider, "providerWithConnectionInfo:errorHandler:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MTTimerServer initWithStorage:connectionListenerProvider:](self, "initWithStorage:connectionListenerProvider:", v4, v8);

  return v9;
}

- (MTTimerServer)initWithStorage:(id)a3 connectionListenerProvider:(id)a4
{
  id v7;
  id v8;
  MTTimerServer *v9;
  NSObject *v10;
  uint64_t v11;
  NAScheduler *serializer;
  objc_super v14;
  uint8_t buf[4];
  MTTimerServer *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTTimerServer;
  v9 = -[MTTimerServer init](&v14, sel_init);
  if (v9)
  {
    MTLogForCategory(4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v9->_storage, a3);
    objc_msgSend(v7, "registerObserver:", v9);
    objc_msgSend(v7, "setDurationUpdateDelegate:", v9);
    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTTimerServer.ready-queue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v11 = objc_claimAutoreleasedReturnValue();
    serializer = v9->_serializer;
    v9->_serializer = (NAScheduler *)v11;

    objc_storeStrong((id *)&v9->_connectionListenerProvider, a4);
  }

  return v9;
}

- (void)startListening
{
  NSObject *v3;
  void *v4;
  int v5;
  MTTimerServer *v6;
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

  -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startListening");

}

- (void)stopListening
{
  NSObject *v3;
  void *v4;
  int v5;
  MTTimerServer *v6;
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

  -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopListening");

}

- (void)handleSystemReady
{
  void *v3;
  _QWORD v4[5];

  -[MTTimerServer serializer](self, "serializer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__MTTimerServer_handleSystemReady__block_invoke;
  v4[3] = &unk_1E39CB858;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __34__MTTimerServer_handleSystemReady__block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "System is ready: %{public}@.  Will post MTTimerServerReadyNotification.", (uint8_t *)&v5, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.MTTimerServer.ready"), 0, 0, 1);

}

- (id)_systemNotReadyError
{
  NSObject *v2;

  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[MTSessionServer _systemNotReadyError].cold.1(v2);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTTimerServer"), 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addTimer:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
  {
    MTLogForCategory(9);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "MTTimerServer - Adding Timer", v12, 2u);
    }

    -[MTTimerServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTimer:withCompletion:source:", v6, v7, v10);

  }
  else if (v7)
  {
    -[MTTimerServer _systemNotReadyError](self, "_systemNotReadyError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);

  }
}

- (void)updateTimer:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
  {
    MTLogForCategory(9);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "MTTimerServer - Updating Timer", v12, 2u);
    }

    -[MTTimerServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateTimer:withCompletion:source:", v6, v7, v10);

  }
  else if (v7)
  {
    -[MTTimerServer _systemNotReadyError](self, "_systemNotReadyError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);

  }
}

- (void)removeTimer:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
  {
    MTLogForCategory(9);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "MTTimerServer - Removing Timer", v12, 2u);
    }

    -[MTTimerServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeTimer:withCompletion:source:", v6, v7, v10);

  }
  else if (v7)
  {
    -[MTTimerServer _systemNotReadyError](self, "_systemNotReadyError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);

  }
}

- (void)dismissTimerWithIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
  {
    kdebug_trace();
    MTLogForCategory(9);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "MTTimerServer - Dismissing Timer", buf, 2u);
    }

    -[MTTimerServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__MTTimerServer_dismissTimerWithIdentifier_withCompletion___block_invoke;
    v12[3] = &unk_1E39CB4E8;
    v13 = v7;
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissTimerWithIdentifier:withCompletion:source:", v6, v12, v10);

  }
  else if (v7)
  {
    -[MTTimerServer _systemNotReadyError](self, "_systemNotReadyError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v11);

  }
}

void __59__MTTimerServer_dismissTimerWithIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  kdebug_trace();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)repeatTimerWithIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
  {
    kdebug_trace();
    MTLogForCategory(9);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "MTTimerServer - Repeating Timer", buf, 2u);
    }

    -[MTTimerServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__MTTimerServer_repeatTimerWithIdentifier_withCompletion___block_invoke;
    v12[3] = &unk_1E39CB4E8;
    v13 = v7;
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "repeatTimerWithIdentifier:withCompletion:source:", v6, v12, v10);

  }
  else if (v7)
  {
    -[MTTimerServer _systemNotReadyError](self, "_systemNotReadyError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v11);

  }
}

void __58__MTTimerServer_repeatTimerWithIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  kdebug_trace();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)addRecentDuration:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MTTimerServer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(9);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138543362;
    v12 = self;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ - addRecentDuration", (uint8_t *)&v11, 0xCu);
  }

  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTTimerServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addRecentDuration:withCompletion:source:", v6, v7, v10);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTTimerServer _systemNotReadyError](self, "_systemNotReadyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)removeRecentDuration:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MTTimerServer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(9);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138543362;
    v12 = self;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ - removeRecentDuration", (uint8_t *)&v11, 0xCu);
  }

  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTTimerServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeRecentDuration:withCompletion:source:", v6, v7, v10);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTTimerServer _systemNotReadyError](self, "_systemNotReadyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)addFavoriteDuration:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MTTimerServer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(9);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138543362;
    v12 = self;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ - addFavoriteDuration", (uint8_t *)&v11, 0xCu);
  }

  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTTimerServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addFavoriteDuration:withCompletion:source:", v6, v7, v10);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTTimerServer _systemNotReadyError](self, "_systemNotReadyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)removeFavoriteDuration:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MTTimerServer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(9);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138543362;
    v12 = self;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ - removeFavoriteDuration", (uint8_t *)&v11, 0xCu);
  }

  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTTimerServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFavoriteDuration:withCompletion:source:", v6, v7, v10);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTTimerServer _systemNotReadyError](self, "_systemNotReadyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)saveLatestDuration:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  int v10;
  MTTimerServer *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(9);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ - saveLatestDuration", (uint8_t *)&v10, 0xCu);
  }

  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTTimerServer saveLatestDuration:withCompletion:](self, "saveLatestDuration:withCompletion:", v6, v7);
  }
  else if (v7)
  {
    -[MTTimerServer _systemNotReadyError](self, "_systemNotReadyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);

  }
}

- (void)source:(id)a3 didAddTimers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__MTTimerServer_source_didAddTimers___block_invoke;
  v10[3] = &unk_1E39CEF88;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performBlockOnAllClients:excludingClient:", v10, v7);

}

uint64_t __37__MTTimerServer_source_didAddTimers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "timersAdded:", *(_QWORD *)(a1 + 32));
}

- (void)source:(id)a3 didUpdateTimers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__MTTimerServer_source_didUpdateTimers___block_invoke;
  v10[3] = &unk_1E39CEF88;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performBlockOnAllClients:excludingClient:", v10, v7);

}

uint64_t __40__MTTimerServer_source_didUpdateTimers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "timersUpdated:", *(_QWORD *)(a1 + 32));
}

- (void)source:(id)a3 didRemoveTimers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__MTTimerServer_source_didRemoveTimers___block_invoke;
  v10[3] = &unk_1E39CEF88;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performBlockOnAllClients:excludingClient:", v10, v7);

}

uint64_t __40__MTTimerServer_source_didRemoveTimers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "timersRemoved:", *(_QWORD *)(a1 + 32));
}

- (void)source:(id)a3 didFireTimer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__MTTimerServer_source_didFireTimer___block_invoke;
  v10[3] = &unk_1E39CEF88;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performBlockOnAllClients:excludingClient:", v10, v7);

}

uint64_t __37__MTTimerServer_source_didFireTimer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "timerFired:", *(_QWORD *)(a1 + 32));
}

- (void)source:(id)a3 didDismissTimer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__MTTimerServer_source_didDismissTimer___block_invoke;
  v10[3] = &unk_1E39CEF88;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performBlockOnAllClients:excludingClient:", v10, v7);

}

uint64_t __40__MTTimerServer_source_didDismissTimer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "timerDismissed:", *(_QWORD *)(a1 + 32));
}

- (void)nextTimerDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__MTTimerServer_nextTimerDidChange___block_invoke;
  v7[3] = &unk_1E39CEF88;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockOnAllClients:", v7);

}

uint64_t __36__MTTimerServer_nextTimerDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "nextTimerChanged:", *(_QWORD *)(a1 + 32));
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
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "-----MTTimerServer-----", (uint8_t *)&v9, 2u);
  }

  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTTimerServer _isSystemReady](self, "_isSystemReady"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "System Ready: %@", (uint8_t *)&v9, 0xCu);

  }
  MTLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
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
  v10[0] = CFSTR("Timer system ready");
  if (-[MTTimerServer _isSystemReady](self, "_isSystemReady"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v10[1] = CFSTR("Timer clients");
  v11[0] = v3;
  -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
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

- (void)favoriteTimerDurationsDidUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__MTTimerServer_favoriteTimerDurationsDidUpdate___block_invoke;
  v7[3] = &unk_1E39CEF88;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockOnAllClients:excludingClient:", v7, 0);

}

void __49__MTTimerServer_favoriteTimerDurationsDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "favoriteTimerDurationsUpdated:", *(_QWORD *)(a1 + 32));

}

- (void)latestTimerDurationDidUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__MTTimerServer_latestTimerDurationDidUpdate___block_invoke;
  v7[3] = &unk_1E39CEF88;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockOnAllClients:excludingClient:", v7, 0);

}

void __46__MTTimerServer_latestTimerDurationDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "latestTimerDurationUpdated:", *(_QWORD *)(a1 + 32));

}

- (void)recentTimerDurationsDidUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MTTimerServer connectionListenerProvider](self, "connectionListenerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__MTTimerServer_recentTimerDurationsDidUpdate___block_invoke;
  v7[3] = &unk_1E39CEF88;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockOnAllClients:excludingClient:", v7, 0);

}

void __47__MTTimerServer_recentTimerDurationsDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "recentTimerDurationsUpdated:", *(_QWORD *)(a1 + 32));

}

- (MTXPCConnectionListenerProvider)connectionListenerProvider
{
  return self->_connectionListenerProvider;
}

- (BOOL)isSystemReady
{
  return self->_systemReady;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_connectionListenerProvider, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
