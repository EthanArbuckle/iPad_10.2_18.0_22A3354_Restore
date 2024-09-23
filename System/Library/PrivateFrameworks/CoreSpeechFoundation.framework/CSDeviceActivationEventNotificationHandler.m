@implementation CSDeviceActivationEventNotificationHandler

- (CSDeviceActivationEventNotificationHandler)init
{
  CSDeviceActivationEventNotificationHandler *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMapTable *delegates;
  CSDeviceActivationEvent *pendingActivationEvent;
  id pendingCompletion;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSDeviceActivationEventNotificationHandler;
  v2 = -[CSDeviceActivationEventNotificationHandler init](&v10, sel_init);
  if (v2)
  {
    +[CSUtils getSerialQueue:qualityOfService:](CSUtils, "getSerialQueue:qualityOfService:", CFSTR("CSDeviceActivationEventNotificationHandler Queue"), 33);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    delegates = v2->_delegates;
    v2->_delegates = (NSMapTable *)v5;

    pendingActivationEvent = v2->_pendingActivationEvent;
    v2->_pendingActivationEvent = 0;

    pendingCompletion = v2->_pendingCompletion;
    v2->_pendingCompletion = 0;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CSDeviceActivationEventNotificationHandler _stopMonitoring](self, "_stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)CSDeviceActivationEventNotificationHandler;
  -[CSDeviceActivationEventNotificationHandler dealloc](&v3, sel_dealloc);
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  if (CSHasAOP_onceToken != -1)
    dispatch_once(&CSHasAOP_onceToken, &__block_literal_global_24);
  if (CSHasAOP_hasAOP)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__CSDeviceActivationEventNotificationHandler_start__block_invoke;
    block[3] = &unk_1E6881138;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  if (CSHasAOP_onceToken != -1)
    dispatch_once(&CSHasAOP_onceToken, &__block_literal_global_24);
  if (CSHasAOP_hasAOP)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__CSDeviceActivationEventNotificationHandler_stop__block_invoke;
    block[3] = &unk_1E6881138;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)setDelegate:(id)a3 forType:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CSDeviceActivationEventNotificationHandler_setDelegate_forType___block_invoke;
  block[3] = &unk_1E687FCC0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)notifyActivationEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CSDeviceActivationEventNotificationHandler *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CSDeviceActivationEventNotificationHandler_notifyActivationEvent_completion___block_invoke;
  block[3] = &unk_1E687F5D0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_notifyActivationEvent:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  NSMapTable *delegates;
  void *v10;
  void *v11;
  CSDeviceActivationEvent *pendingActivationEvent;
  void *v13;
  NSObject *v14;
  void *v15;
  void (**pendingCompletion)(id, _QWORD, void *);
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  dispatch_time_t v23;
  NSObject *queue;
  id v25;
  NSMapTable *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  if (-[CSDeviceActivationEventNotificationHandler _isVoiceTriggerEvent:](self, "_isVoiceTriggerEvent:", v7))
  {
    delegates = self->_delegates;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](delegates, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      pendingActivationEvent = self->_pendingActivationEvent;
      if (pendingActivationEvent)
      {
        v13 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          -[CSDeviceActivationEvent localizedDescription](pendingActivationEvent, "localizedDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v33 = "-[CSDeviceActivationEventNotificationHandler _notifyActivationEvent:completion:]";
          v34 = 2114;
          v35 = v15;
          _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s Returning error for already existing pending activation event : %{public}@", buf, 0x16u);

        }
        pendingCompletion = (void (**)(id, _QWORD, void *))self->_pendingCompletion;
        if (pendingCompletion)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 601, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          pendingCompletion[2](pendingCompletion, 0, v17);

          v18 = self->_pendingCompletion;
          self->_pendingCompletion = 0;

        }
      }
      v19 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[CSDeviceActivationEventNotificationHandler _notifyActivationEvent:completion:]";
        _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s No delegate registered : Postpone activation event handling until we have delegate registered", buf, 0xCu);
      }
      objc_storeStrong((id *)&self->_pendingActivationEvent, a3);
      v20 = (void *)MEMORY[0x1B5E468D0](v8);
      v21 = self->_pendingCompletion;
      self->_pendingCompletion = v20;

      -[CSDeviceActivationEvent UUID](self->_pendingActivationEvent, "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = dispatch_time(0, 5000000000);
      queue = self->_queue;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __80__CSDeviceActivationEventNotificationHandler__notifyActivationEvent_completion___block_invoke;
      v30[3] = &unk_1E6880E88;
      v30[4] = self;
      v31 = v22;
      v25 = v22;
      dispatch_after(v23, queue, v30);

      goto LABEL_14;
    }
LABEL_13:
    objc_msgSend(v11, "activationEventNotificationHandler:event:completion:", self, v7, v8);
LABEL_14:

    goto LABEL_15;
  }
  if (objc_msgSend(v7, "type") == 3)
  {
    v26 = self->_delegates;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "type"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v26, "objectForKey:", v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  if (objc_msgSend(v7, "type") == 7)
  {
    v28 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CSDeviceActivationEventNotificationHandler _notifyActivationEvent:completion:]";
      _os_log_impl(&dword_1B502E000, v28, OS_LOG_TYPE_DEFAULT, "%s corespeechd received mediaserverd launched event", buf, 0xCu);
    }
    if (v8)
      v8[2](v8, 1, 0);
  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 114, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v29);

  }
LABEL_15:

}

- (BOOL)_isVoiceTriggerEvent:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  BOOL v7;
  void *v8;
  BOOL v9;
  void *v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  v5 = v4 == 1;
  if (objc_msgSend(v3, "type") == 2)
  {
    objc_msgSend(v3, "deviceId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = 1;
    else
      v7 = v4 == 1;
    v5 = v7;
  }
  if (objc_msgSend(v3, "type") == 6)
  {
    objc_msgSend(v3, "deviceId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v3, "type") == 8)
  {
    objc_msgSend(v3, "deviceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v9 = 1;
  }

  return v9 || v5;
}

- (void)_startMonitoring
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSDeviceActivationEventNotificationHandler _startMonitoring]";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AOP First Pass trigger", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_stopMonitoring
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSDeviceActivationEventNotificationHandler _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AOP First Pass trigger", (uint8_t *)&v3, 0xCu);
  }
}

- (BOOL)_hasPendingActivationForType:(unint64_t)a3
{
  CSDeviceActivationEvent *pendingActivationEvent;
  uint64_t v5;
  unint64_t v6;
  double v7;

  pendingActivationEvent = self->_pendingActivationEvent;
  if (pendingActivationEvent)
  {
    if (-[CSDeviceActivationEvent type](pendingActivationEvent, "type") == a3)
    {
      v5 = mach_absolute_time();
      v6 = v5 - -[CSDeviceActivationEvent hosttime](self->_pendingActivationEvent, "hosttime");
      LODWORD(v7) = 5.0;
      LOBYTE(pendingActivationEvent) = v6 <= +[CSFTimeUtils secondsToHostTime:](CSFTimeUtils, "secondsToHostTime:", v7);
    }
    else
    {
      LOBYTE(pendingActivationEvent) = 0;
    }
  }
  return (char)pendingActivationEvent;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMapTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (CSDeviceActivationEvent)pendingActivationEvent
{
  return self->_pendingActivationEvent;
}

- (void)setPendingActivationEvent:(id)a3
{
  objc_storeStrong((id *)&self->_pendingActivationEvent, a3);
}

- (id)pendingCompletion
{
  return self->_pendingCompletion;
}

- (void)setPendingCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_pendingActivationEvent, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __80__CSDeviceActivationEventNotificationHandler__notifyActivationEvent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  v4 = CSLogContextFacilityCoreSpeech;
  v5 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v13 = 136315394;
      v14 = "-[CSDeviceActivationEventNotificationHandler _notifyActivationEvent:completion:]_block_invoke";
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Pending Timeout fired for %{public}@ returning error for timeout", (uint8_t *)&v13, 0x16u);
    }
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 32);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 602, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 32);
      *(_QWORD *)(v10 + 32) = 0;

      v7 = *(_QWORD *)(a1 + 32);
    }
    v12 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;

  }
  else if (v5)
  {
    v13 = 136315138;
    v14 = "-[CSDeviceActivationEventNotificationHandler _notifyActivationEvent:completion:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s There is no pending activation event to timeout", (uint8_t *)&v13, 0xCu);
  }
}

uint64_t __79__CSDeviceActivationEventNotificationHandler_notifyActivationEvent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[CSDeviceActivationEventNotificationHandler notifyActivationEvent:completion:]_block_invoke";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Received Activation Event in CoreSpeechDaemon: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_notifyActivationEvent:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

void __66__CSDeviceActivationEventNotificationHandler_setDelegate_forType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, v4);

  if (objc_msgSend(*(id *)(a1 + 32), "_hasPendingActivationForType:", *(_QWORD *)(a1 + 48)))
  {
    v5 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      v7 = v5;
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[CSDeviceActivationEventNotificationHandler setDelegate:forType:]_block_invoke";
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Found pending activation : %{public}@, handle pending activation immediately", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "activationEventNotificationHandler:event:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = 0;

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 32);
    *(_QWORD *)(v11 + 32) = 0;

  }
}

uint64_t __50__CSDeviceActivationEventNotificationHandler_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopMonitoring");
}

uint64_t __51__CSDeviceActivationEventNotificationHandler_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startMonitoring");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_435 != -1)
    dispatch_once(&sharedInstance_onceToken_435, &__block_literal_global_436);
  return (id)sharedInstance_sharedInstance_437;
}

void __60__CSDeviceActivationEventNotificationHandler_sharedInstance__block_invoke()
{
  CSDeviceActivationEventNotificationHandler *v0;
  void *v1;

  v0 = objc_alloc_init(CSDeviceActivationEventNotificationHandler);
  v1 = (void *)sharedInstance_sharedInstance_437;
  sharedInstance_sharedInstance_437 = (uint64_t)v0;

}

@end
