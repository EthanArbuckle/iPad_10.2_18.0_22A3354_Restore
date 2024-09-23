@implementation CSTimerMonitor

- (CSTimerMonitor)init
{
  CSTimerMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSTimerMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSTimerMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_timerFiringState = 0;
  }
  return v2;
}

- (void)initializeTimerState
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  -[MTTimerManager timers](self->_timerManager, "timers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__CSTimerMonitor_initializeTimerState__block_invoke;
  v6[3] = &unk_1E7C281B8;
  v6[4] = self;
  objc_msgSend(v3, "addSuccessBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "addFailureBlock:", &__block_literal_global_6);

}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  MTTimerManager *v8;
  MTTimerManager *timerManager;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 buf;
  void (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSTimerMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  -[CSTimerMonitor _stopMonitoring](self, "_stopMonitoring");
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v6 = (void *)getMTTimerManagerClass_softClass;
  v19 = getMTTimerManagerClass_softClass;
  if (!getMTTimerManagerClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v21 = __getMTTimerManagerClass_block_invoke;
    v22 = &unk_1E7C287B8;
    v23 = &v16;
    __getMTTimerManagerClass_block_invoke((uint64_t)&buf);
    v6 = (void *)v17[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v16, 8);
  v8 = (MTTimerManager *)objc_alloc_init(v7);
  timerManager = self->_timerManager;
  self->_timerManager = v8;

  -[MTTimerManager checkIn](self->_timerManager, "checkIn", v16);
  getMTTimerManagerTimerFired();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__timerIsFiring_, v10, 0);

  }
  getMTTimerManagerFiringTimerDismissed();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__timerDismissed_, v12, 0);

  }
  getMTTimerManagerStateReset();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__timerStateReset_, v14, 0);

  }
  self->_timerFiringState = 0;

}

- (void)_stopMonitoring
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MTTimerManager *timerManager;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[CSTimerMonitor _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v11, 0xCu);
  }
  getMTTimerManagerTimerFired();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, v4, 0);

  }
  getMTTimerManagerFiringTimerDismissed();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, v6, 0);

  }
  getMTTimerManagerStateReset();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, v8, 0);

  }
  timerManager = self->_timerManager;
  self->_timerManager = 0;

  self->_timerFiringState = 0;
}

- (BOOL)_isSleepTimer:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v5 = (_QWORD *)getMTTimerManagerTimersKeySymbolLoc_ptr;
  v24 = getMTTimerManagerTimersKeySymbolLoc_ptr;
  if (!getMTTimerManagerTimersKeySymbolLoc_ptr)
  {
    v6 = MobileTimerLibrary();
    v5 = dlsym(v6, "MTTimerManagerTimersKey");
    v22[3] = (uint64_t)v5;
    getMTTimerManagerTimersKeySymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v21, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMTTimerManagerTimersKey(void)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("CSTimerMonitor.m"), 25, CFSTR("%s"), dlerror());

    __break(1u);
  }
  objc_msgSend(v4, "objectForKey:", *v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "sound");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "interruptAudio");

        if ((v13 & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_14:

  return v9;
}

- (void)_timerIsFiring:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSTimerMonitor _timerIsFiring:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }
  if (!-[CSTimerMonitor _isSleepTimer:](self, "_isSleepTimer:", v4) && self->_timerFiringState != 1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__CSTimerMonitor__timerIsFiring___block_invoke;
    v6[3] = &unk_1E7C29250;
    v6[4] = self;
    -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
  }

}

- (void)_timerDismissed:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSTimerMonitor _timerDismissed:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }
  if (self->_timerFiringState != 2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__CSTimerMonitor__timerDismissed___block_invoke;
    v6[3] = &unk_1E7C29250;
    v6[4] = self;
    -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
  }

}

- (void)_timerStateReset:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSTimerMonitor _timerStateReset:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }
  if (self->_timerFiringState)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__CSTimerMonitor__timerStateReset___block_invoke;
    v6[3] = &unk_1E7C29250;
    v6[4] = self;
    -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
  }

}

- (void)_notifyObserver:(id)a3 timerIsFiringState:(int64_t)a4
{
  id v6;

  v6 = a3;
  self->_timerFiringState = a4;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSTimerMonitor:didReceiveTimerChanged:", self, a4);

}

- (int64_t)timerState
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
  v5[2] = __28__CSTimerMonitor_timerState__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __28__CSTimerMonitor_timerState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t __35__CSTimerMonitor__timerStateReset___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:timerIsFiringState:", a2, 0);
}

uint64_t __34__CSTimerMonitor__timerDismissed___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:timerIsFiringState:", a2, 2);
}

uint64_t __33__CSTimerMonitor__timerIsFiring___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:timerIsFiringState:", a2, 1);
}

void __38__CSTimerMonitor_initializeTimerState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[CSTimerMonitor initializeTimerState]_block_invoke";
    v25 = 2112;
    v26 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Fetched timer result = %@", buf, 0x16u);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "firedDate");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v9, "dismissedDate");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
          {

LABEL_17:
            LOBYTE(v6) = 1;
            goto LABEL_18;
          }
          v13 = (void *)v12;
          v14 = objc_msgSend(v11, "compare:", v12);

          if (v14 == 1)
            goto LABEL_17;
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_18:

  v15 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __38__CSTimerMonitor_initializeTimerState__block_invoke_2;
  v16[3] = &unk_1E7C27E50;
  v16[4] = v15;
  v17 = v6;
  objc_msgSend(v15, "enumerateObserversInQueue:", v16);

}

void __38__CSTimerMonitor_initializeTimerState__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[CSTimerMonitor initializeTimerState]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Fetching timer error = %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __38__CSTimerMonitor_initializeTimerState__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1;
  else
    v2 = 2;
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:timerIsFiringState:", a2, v2);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_822 != -1)
    dispatch_once(&sharedInstance_onceToken_822, &__block_literal_global_823);
  return (id)sharedInstance__sharedInstance_824;
}

void __32__CSTimerMonitor_sharedInstance__block_invoke()
{
  CSTimerMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSTimerMonitor);
  v1 = (void *)sharedInstance__sharedInstance_824;
  sharedInstance__sharedInstance_824 = (uint64_t)v0;

}

@end
