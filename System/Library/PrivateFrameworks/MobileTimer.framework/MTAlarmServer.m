@implementation MTAlarmServer

- (void)getAlarmsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[MTAlarmServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTAlarmServer storage](self, "storage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getAlarmsWithCompletion:", v8);
LABEL_5:

    v5 = v8;
    goto LABEL_6;
  }
  v5 = v8;
  if (v8)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    -[MTAlarmServer _systemNotReadyError](self, "_systemNotReadyError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, id, _QWORD, void *))v8 + 2))(v8, v4, v6, 0, v7);

    goto LABEL_5;
  }
LABEL_6:

}

- (MTAlarmStorage)storage
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
  -[MTAlarmServer serializer](self, "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__MTAlarmServer__isSystemReady__block_invoke;
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

intptr_t __31__MTAlarmServer__isSystemReady__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (MTAlarmServer)initWithStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MTAlarmServer *v9;

  v4 = a3;
  MTAlarmClientInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MTAlarmServerInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTXPCConnectionInfo infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:](MTXPCConnectionInfo, "infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", CFSTR("com.apple.MobileTimer.alarmserver"), v5, self, v6, CFSTR("com.apple.MTAlarmServer.wakeup"), CFSTR("com.apple.private.mobiletimerd"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTXPCConnectionListenerProvider providerWithConnectionInfo:errorHandler:](MTXPCConnectionListenerProvider, "providerWithConnectionInfo:errorHandler:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MTAlarmServer initWithStorage:connectionListenerProvider:](self, "initWithStorage:connectionListenerProvider:", v4, v8);

  return v9;
}

- (MTAlarmServer)initWithStorage:(id)a3 connectionListenerProvider:(id)a4
{
  id v7;
  id v8;
  MTAlarmServer *v9;
  NSObject *v10;
  uint64_t v11;
  NAScheduler *serializer;
  objc_super v14;
  uint8_t buf[4];
  MTAlarmServer *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTAlarmServer;
  v9 = -[MTAlarmServer init](&v14, sel_init);
  if (v9)
  {
    MTLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v9->_storage, a3);
    objc_msgSend(v7, "registerObserver:", v9);
    objc_storeStrong((id *)&v9->_connectionListenerProvider, a4);
    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTAlarmServer.ready-queue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v11 = objc_claimAutoreleasedReturnValue();
    serializer = v9->_serializer;
    v9->_serializer = (NAScheduler *)v11;

  }
  return v9;
}

- (void)startListening
{
  NSObject *v3;
  int v4;
  MTAlarmServer *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "Starting %{public}@", (uint8_t *)&v4, 0xCu);
  }

  -[MTXPCConnectionListenerProvider startListening](self->_connectionListenerProvider, "startListening");
}

- (void)stopListening
{
  NSObject *v3;
  int v4;
  MTAlarmServer *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "Stopping %{public}@", (uint8_t *)&v4, 0xCu);
  }

  -[MTXPCConnectionListenerProvider stopListening](self->_connectionListenerProvider, "stopListening");
}

- (void)handleSystemReady
{
  void *v3;
  _QWORD v4[5];

  -[MTAlarmServer serializer](self, "serializer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__MTAlarmServer_handleSystemReady__block_invoke;
  v4[3] = &unk_1E39CB858;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __34__MTAlarmServer_handleSystemReady__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "System is ready: %{public}@.  Will post MTAlarmServerReadyNotification.", (uint8_t *)&v5, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.MTAlarmServer.ready"), 0, 0, 1);

}

- (id)_systemNotReadyError
{
  NSObject *v2;

  MTLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[MTSessionServer _systemNotReadyError].cold.1(v2);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTAlarmServer"), 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addAlarm:(id)a3 withCompletion:(id)a4
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
  if (-[MTAlarmServer _isSystemReady](self, "_isSystemReady"))
  {
    MTLogForCategory(9);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "MTAlarmServer - Adding Alarm", v12, 2u);
    }

    -[MTAlarmServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAlarm:withCompletion:source:", v6, v7, v10);

  }
  else if (v7)
  {
    -[MTAlarmServer _systemNotReadyError](self, "_systemNotReadyError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);

  }
}

- (void)updateAlarm:(id)a3 withCompletion:(id)a4
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
  if (-[MTAlarmServer _isSystemReady](self, "_isSystemReady"))
  {
    MTLogForCategory(9);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "MTAlarmServer - Updating Alarm", v12, 2u);
    }

    -[MTAlarmServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateAlarm:withCompletion:source:", v6, v7, v10);

  }
  else if (v7)
  {
    -[MTAlarmServer _systemNotReadyError](self, "_systemNotReadyError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);

  }
}

- (void)removeAlarm:(id)a3 withCompletion:(id)a4
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
  if (-[MTAlarmServer _isSystemReady](self, "_isSystemReady"))
  {
    MTLogForCategory(9);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "MTAlarmServer - Removing Alarm", v12, 2u);
    }

    -[MTAlarmServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAlarm:withCompletion:source:", v6, v7, v10);

  }
  else if (v7)
  {
    -[MTAlarmServer _systemNotReadyError](self, "_systemNotReadyError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);

  }
}

- (void)snoozeAlarmWithIdentifier:(id)a3 snoozeAction:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  if (-[MTAlarmServer _isSystemReady](self, "_isSystemReady"))
  {
    kdebug_trace();
    MTLogForCategory(9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_INFO, "MTAlarmServer - Snoozing Alarm", buf, 2u);
    }

    -[MTAlarmServer storage](self, "storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__MTAlarmServer_snoozeAlarmWithIdentifier_snoozeAction_withCompletion___block_invoke;
    v14[3] = &unk_1E39CB4E8;
    v15 = v9;
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "snoozeAlarmWithIdentifier:snoozeAction:withCompletion:source:", v8, a4, v14, v12);

  }
  else if (v9)
  {
    -[MTAlarmServer _systemNotReadyError](self, "_systemNotReadyError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v13);

  }
}

void __71__MTAlarmServer_snoozeAlarmWithIdentifier_snoozeAction_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  kdebug_trace();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)dismissAlarmWithIdentifier:(id)a3 dismissAction:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  if (-[MTAlarmServer _isSystemReady](self, "_isSystemReady"))
  {
    kdebug_trace();
    MTLogForCategory(9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_INFO, "MTAlarmServer - Dismissing Alarm", buf, 2u);
    }

    -[MTAlarmServer storage](self, "storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__MTAlarmServer_dismissAlarmWithIdentifier_dismissAction_withCompletion___block_invoke;
    v14[3] = &unk_1E39CB4E8;
    v15 = v9;
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissAlarmWithIdentifier:dismissAction:withCompletion:source:", v8, a4, v14, v12);

  }
  else if (v9)
  {
    -[MTAlarmServer _systemNotReadyError](self, "_systemNotReadyError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v13);

  }
}

void __73__MTAlarmServer_dismissAlarmWithIdentifier_dismissAction_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  kdebug_trace();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)nextSleepAlarmWithCompletion:(id)a3
{
  void *v4;
  void (*v5)(void);
  void *v6;
  id v7;

  v7 = a3;
  if (-[MTAlarmServer _isSystemReady](self, "_isSystemReady"))
  {
    +[MTSleepManager nextSleepAlarm](MTSleepManager, "nextSleepAlarm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void (*)(void))*((_QWORD *)v7 + 2);
LABEL_5:
    v5();

    v6 = v7;
    goto LABEL_6;
  }
  v6 = v7;
  if (v7)
  {
    -[MTAlarmServer _systemNotReadyError](self, "_systemNotReadyError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void (*)(void))*((_QWORD *)v7 + 2);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[MTAlarmServer connectionListenerProvider](self, "connectionListenerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__MTAlarmServer_source_didAddAlarms___block_invoke;
  v10[3] = &unk_1E39CEDB0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performBlockOnAllClients:excludingClient:", v10, v7);

}

uint64_t __37__MTAlarmServer_source_didAddAlarms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmsAdded:", *(_QWORD *)(a1 + 32));
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[MTAlarmServer connectionListenerProvider](self, "connectionListenerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__MTAlarmServer_source_didUpdateAlarms___block_invoke;
  v10[3] = &unk_1E39CEDB0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performBlockOnAllClients:excludingClient:", v10, v7);

}

uint64_t __40__MTAlarmServer_source_didUpdateAlarms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmsUpdated:", *(_QWORD *)(a1 + 32));
}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[MTAlarmServer connectionListenerProvider](self, "connectionListenerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__MTAlarmServer_source_didRemoveAlarms___block_invoke;
  v10[3] = &unk_1E39CEDB0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performBlockOnAllClients:excludingClient:", v10, v7);

}

uint64_t __40__MTAlarmServer_source_didRemoveAlarms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmsRemoved:", *(_QWORD *)(a1 + 32));
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  -[MTAlarmServer connectionListenerProvider](self, "connectionListenerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__MTAlarmServer_source_didSnoozeAlarm_snoozeAction___block_invoke;
  v9[3] = &unk_1E39CEDB0;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBlockOnAllClients:", v9);

}

uint64_t __52__MTAlarmServer_source_didSnoozeAlarm_snoozeAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmSnoozed:", *(_QWORD *)(a1 + 32));
}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  -[MTAlarmServer connectionListenerProvider](self, "connectionListenerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__MTAlarmServer_source_didDismissAlarm_dismissAction___block_invoke;
  v9[3] = &unk_1E39CEDB0;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBlockOnAllClients:", v9);

}

uint64_t __54__MTAlarmServer_source_didDismissAlarm_dismissAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmDismissed:", *(_QWORD *)(a1 + 32));
}

- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5
{
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v7 = a4;
  if (objc_msgSend((id)objc_opt_class(), "_notifyClientsForTriggerType:", a5))
  {
    -[MTAlarmServer connectionListenerProvider](self, "connectionListenerProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__MTAlarmServer_source_didFireAlarm_triggerType___block_invoke;
    v9[3] = &unk_1E39CEDB0;
    v10 = v7;
    objc_msgSend(v8, "performBlockOnAllClients:", v9);

  }
}

uint64_t __49__MTAlarmServer_source_didFireAlarm_triggerType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmFired:", *(_QWORD *)(a1 + 32));
}

+ (BOOL)_notifyClientsForTriggerType:(unint64_t)a3
{
  return a3 < 6;
}

- (void)source:(id)a3 didChangeNextAlarm:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[MTAlarmServer connectionListenerProvider](self, "connectionListenerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__MTAlarmServer_source_didChangeNextAlarm___block_invoke;
  v8[3] = &unk_1E39CEDB0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBlockOnAllClients:", v8);

}

uint64_t __43__MTAlarmServer_source_didChangeNextAlarm___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "nextAlarmChanged:", *(_QWORD *)(a1 + 32));
}

- (void)updateSleepAlarmsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  MTAlarmServer *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ calling to refresh sleep alarms", (uint8_t *)&v10, 0xCu);
  }

  if (-[MTAlarmServer _isSystemReady](self, "_isSystemReady"))
  {
    +[MTAgent agent](MTAgent, "agent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sleepManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateSleepAlarms");

    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    MTLogForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MTAlarmServer updateSleepAlarmsWithCompletion:].cold.1(self);

    if (v4)
    {
      -[MTAlarmServer _systemNotReadyError](self, "_systemNotReadyError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v4)[2](v4, v9);

    }
  }

}

- (void)resetSleepAlarmSnoozeStateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  MTAlarmServer *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ calling to reset sleep alarms snooze state", (uint8_t *)&v10, 0xCu);
  }

  if (-[MTAlarmServer _isSystemReady](self, "_isSystemReady"))
  {
    +[MTAgent agent](MTAgent, "agent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sleepManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resetSleepAlarmSnoozeState");

    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    MTLogForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MTAlarmServer resetSleepAlarmSnoozeStateWithCompletion:].cold.1(self);

    if (v4)
    {
      -[MTAlarmServer _systemNotReadyError](self, "_systemNotReadyError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v4)[2](v4, v9);

    }
  }

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
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "-----MTAlarmServer-----", (uint8_t *)&v9, 2u);
  }

  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTAlarmServer _isSystemReady](self, "_isSystemReady"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "System Ready: %@", (uint8_t *)&v9, 0xCu);

  }
  MTLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarmServer connectionListenerProvider](self, "connectionListenerProvider");
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
  v10[0] = CFSTR("Alarm system ready");
  if (-[MTAlarmServer _isSystemReady](self, "_isSystemReady"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v10[1] = CFSTR("Alarm clients");
  v11[0] = v3;
  -[MTAlarmServer connectionListenerProvider](self, "connectionListenerProvider");
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

- (void)updateSleepAlarmsWithCompletion:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "_systemNotReadyError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_6(&dword_19AC4E000, v2, v3, "%{public}@ could not refresh sleep alarms:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)resetSleepAlarmSnoozeStateWithCompletion:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "_systemNotReadyError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_6(&dword_19AC4E000, v2, v3, "%{public}@ could not reset sleep alarms snooze state:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

@end
