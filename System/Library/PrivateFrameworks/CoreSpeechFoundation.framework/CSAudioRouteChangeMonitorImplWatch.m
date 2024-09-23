@implementation CSAudioRouteChangeMonitorImplWatch

- (CSAudioRouteChangeMonitorImplWatch)init
{
  CSAudioRouteChangeMonitorImplWatch *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSAudioRouteChangeMonitorImplWatch;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSAudioRouteChangeMonitorImplWatch queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)getHearstRouteStatus:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__CSAudioRouteChangeMonitorImplWatch_getHearstRouteStatus___block_invoke;
    v7[3] = &unk_1E6881160;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (int64_t)hearstRouteStatus
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__CSAudioRouteChangeMonitorImplWatch_hearstRouteStatus__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)getJarvisConnected:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__CSAudioRouteChangeMonitorImplWatch_getJarvisConnected___block_invoke;
    block[3] = &unk_1E687EE50;
    v8 = v4;
    dispatch_async(queue, block);

  }
}

- (BOOL)jarvisConnected
{
  return 0;
}

- (BOOL)carPlayConnected
{
  return 0;
}

- (void)getHearstOwnershipStatus:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__CSAudioRouteChangeMonitorImplWatch_getHearstOwnershipStatus___block_invoke;
    block[3] = &unk_1E687EE50;
    v8 = v4;
    dispatch_async(queue, block);

  }
}

- (int64_t)hearstOwnership
{
  return 0;
}

- (void)activeAudioRouteDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CSAudioRouteChangeMonitorImplWatch_activeAudioRouteDidChange___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[CSAudioRouteChangeMonitorImplWatch _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle", a3);
  -[CSAudioRouteChangeMonitorImplWatch _startObservingAudioRouteChange](self, "_startObservingAudioRouteChange");
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSAudioRouteChangeMonitorImplWatch _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AudioRouteChangeMonitor", buf, 0xCu);
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__CSAudioRouteChangeMonitorImplWatch__startMonitoringWithQueue___block_invoke;
  v5[3] = &unk_1E687EE78;
  v5[4] = self;
  -[CSAudioRouteChangeMonitorImplWatch _fetchHearstRouteStatusWithCompletion:](self, "_fetchHearstRouteStatusWithCompletion:", v5);
}

- (void)_startObservingAudioRouteChange
{
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (_QWORD *)MEMORY[0x1E0D47E50];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0D47E50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttribute:forKey:error:", v4, *MEMORY[0x1E0D48288], 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_activeAudioRouteDidChange_, *v3, v6);

}

- (void)_stopMonitoring
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSAudioRouteChangeMonitorImplWatch _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AudioRouteChangeMonitor", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_fetchHearstRouteStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 5;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForKey:", *MEMORY[0x1E0D48058]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D481C0]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D481F0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__CSAudioRouteChangeMonitorImplWatch__fetchHearstRouteStatusWithCompletion___block_invoke;
    v9[3] = &unk_1E687EEA0;
    v10 = v6;
    v12 = &v13;
    v11 = v4;
    -[CSAudioRouteChangeMonitor routeIsDoAPSupportedWithRouteUID:withCompletion:](self, "routeIsDoAPSupportedWithRouteUID:withCompletion:", v8, v9);

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, v14[3]);
  }

  _Block_object_dispose(&v13, 8);
}

- (void)_notifyHearstRouteStatus:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSAudioRouteChangeMonitorImplWatch _notifyHearstRouteStatus:]";
    v9 = 2050;
    v10 = a3;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Notifying Hearst Route State: %{public}ld", buf, 0x16u);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__CSAudioRouteChangeMonitorImplWatch__notifyHearstRouteStatus___block_invoke;
  v6[3] = &unk_1E6880FF8;
  v6[4] = self;
  v6[5] = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
}

- (void)_systemControllerDied:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSAudioRouteChangeMonitorImplWatch _systemControllerDied:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[CSAudioRouteChangeMonitorImplWatch _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle");
  -[CSAudioRouteChangeMonitorImplWatch _startObservingAudioRouteChange](self, "_startObservingAudioRouteChange");
  -[CSAudioRouteChangeMonitorImplWatch activeAudioRouteDidChange:](self, "activeAudioRouteDidChange:", 0);

}

- (void)_startObservingSystemControllerLifecycle
{
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)MEMORY[0x1E0D48208];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D48208], 0);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v9, *MEMORY[0x1E0D48288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *v4;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__systemControllerDied_, v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __63__CSAudioRouteChangeMonitorImplWatch__notifyHearstRouteStatus___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 40) - 1;
    if (v3 <= 4 && ((0x1Bu >> v3) & 1) != 0)
      objc_msgSend(v4, "CSAudioRouteChangeMonitor:didReceiveAudioRouteChangeEvent:", *(_QWORD *)(a1 + 32), qword_1B50D7508[v3]);
  }

}

uint64_t __76__CSAudioRouteChangeMonitorImplWatch__fetchHearstRouteStatusWithCompletion___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t result;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D48118]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D48130]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_7;
      v5 = 2;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;
  }
LABEL_7:
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[CSAudioRouteChangeMonitorImplWatch _fetchHearstRouteStatusWithCompletion:]_block_invoke";
    v11 = 1024;
    v12 = a2;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Current Picked route supportDoAP: %d", (uint8_t *)&v9, 0x12u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  return result;
}

uint64_t __64__CSAudioRouteChangeMonitorImplWatch__startMonitoringWithQueue___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 32) = a2;
  return result;
}

uint64_t __64__CSAudioRouteChangeMonitorImplWatch_activeAudioRouteDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSAudioRouteChangeMonitorImplWatch activeAudioRouteDidChange:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Received active route change notification", buf, 0xCu);
  }
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__CSAudioRouteChangeMonitorImplWatch_activeAudioRouteDidChange___block_invoke_2;
  v5[3] = &unk_1E687EE78;
  v5[4] = v3;
  return objc_msgSend(v3, "_fetchHearstRouteStatusWithCompletion:", v5);
}

uint64_t __64__CSAudioRouteChangeMonitorImplWatch_activeAudioRouteDidChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = a2;
  return objc_msgSend(*(id *)(a1 + 32), "_notifyHearstRouteStatus:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __63__CSAudioRouteChangeMonitorImplWatch_getHearstOwnershipStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__CSAudioRouteChangeMonitorImplWatch_getJarvisConnected___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__CSAudioRouteChangeMonitorImplWatch_hearstRouteStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

uint64_t __59__CSAudioRouteChangeMonitorImplWatch_getHearstRouteStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

@end
