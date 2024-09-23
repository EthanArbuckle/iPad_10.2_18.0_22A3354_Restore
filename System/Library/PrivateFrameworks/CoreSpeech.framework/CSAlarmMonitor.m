@implementation CSAlarmMonitor

- (CSAlarmMonitor)init
{
  CSAlarmMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSAlarmMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSAlarmMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_alarmFiringState = 0;
  }
  return v2;
}

- (void)initializeAlarmState
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  -[MTAlarmManager alarms](self->_alarmManager, "alarms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__CSAlarmMonitor_initializeAlarmState__block_invoke;
  v6[3] = &unk_1E7C281B8;
  v6[4] = self;
  objc_msgSend(v3, "addSuccessBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "addFailureBlock:", &__block_literal_global_6_872);

}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  MTAlarmManager *v8;
  MTAlarmManager *alarmManager;
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
    *(_QWORD *)((char *)&buf + 4) = "-[CSAlarmMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  -[CSAlarmMonitor _stopMonitoring](self, "_stopMonitoring");
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v6 = (void *)getMTAlarmManagerClass_softClass;
  v19 = getMTAlarmManagerClass_softClass;
  if (!getMTAlarmManagerClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v21 = __getMTAlarmManagerClass_block_invoke;
    v22 = &unk_1E7C287B8;
    v23 = &v16;
    __getMTAlarmManagerClass_block_invoke((uint64_t)&buf);
    v6 = (void *)v17[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v16, 8);
  v8 = (MTAlarmManager *)objc_alloc_init(v7);
  alarmManager = self->_alarmManager;
  self->_alarmManager = v8;

  -[MTAlarmManager checkIn](self->_alarmManager, "checkIn", v16);
  getMTAlarmManagerAlarmFired();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__alarmIsFiring_, v10, 0);

  }
  getMTAlarmManagerFiringAlarmDismissed();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__alarmDismissed_, v12, 0);

  }
  getMTAlarmManagerStateReset();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__alarmStateReset_, v14, 0);

  }
  self->_alarmFiringState = 0;

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
  MTAlarmManager *alarmManager;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[CSAlarmMonitor _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v11, 0xCu);
  }
  getMTAlarmManagerAlarmFired();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, v4, 0);

  }
  getMTAlarmManagerFiringAlarmDismissed();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, v6, 0);

  }
  getMTAlarmManagerStateReset();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, v8, 0);

  }
  alarmManager = self->_alarmManager;
  self->_alarmManager = 0;

  self->_alarmFiringState = 0;
}

- (void)_alarmIsFiring:(id)a3
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
    v8 = "-[CSAlarmMonitor _alarmIsFiring:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }
  if (self->_alarmFiringState != 1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__CSAlarmMonitor__alarmIsFiring___block_invoke;
    v6[3] = &unk_1E7C29250;
    v6[4] = self;
    -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
  }

}

- (void)_alarmDismissed:(id)a3
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
    v8 = "-[CSAlarmMonitor _alarmDismissed:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }
  if (self->_alarmFiringState != 2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__CSAlarmMonitor__alarmDismissed___block_invoke;
    v6[3] = &unk_1E7C29250;
    v6[4] = self;
    -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
  }

}

- (void)_alarmStateReset:(id)a3
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
    v8 = "-[CSAlarmMonitor _alarmStateReset:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }
  if (self->_alarmFiringState)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__CSAlarmMonitor__alarmStateReset___block_invoke;
    v6[3] = &unk_1E7C29250;
    v6[4] = self;
    -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
  }

}

- (void)_notifyObserver:(id)a3 alarmIsFiringState:(int64_t)a4
{
  id v6;

  v6 = a3;
  self->_alarmFiringState = a4;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSAlarmMonitor:didReceiveAlarmChanged:", self, a4);

}

- (int64_t)alarmState
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
  v5[2] = __28__CSAlarmMonitor_alarmState__block_invoke;
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
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __28__CSAlarmMonitor_alarmState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t __35__CSAlarmMonitor__alarmStateReset___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:alarmIsFiringState:", a2, 0);
}

uint64_t __34__CSAlarmMonitor__alarmDismissed___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:alarmIsFiringState:", a2, 2);
}

uint64_t __33__CSAlarmMonitor__alarmIsFiring___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:alarmIsFiringState:", a2, 1);
}

void __38__CSAlarmMonitor_initializeAlarmState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_log_t *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (os_log_t *)MEMORY[0x1E0D18F60];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSAlarmMonitor initializeAlarmState]_block_invoke";
    v27 = 2112;
    v28 = v3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Fetched alarm result = %@", buf, 0x16u);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEnabled")
          && (objc_msgSend(v10, "firedDate"), (v11 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "dismissedDate");
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
          {

LABEL_18:
            v16 = *v4;
            if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v26 = "-[CSAlarmMonitor initializeAlarmState]_block_invoke";
              v27 = 2112;
              v28 = v10;
              _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Alarm %@ is firing", buf, 0x16u);
            }
            LOBYTE(v7) = 1;
            goto LABEL_21;
          }
          v14 = (void *)v13;
          v15 = objc_msgSend(v12, "compare:", v13);

          if (v15 == 1)
            goto LABEL_18;
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_21:

  v17 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __38__CSAlarmMonitor_initializeAlarmState__block_invoke_2;
  v18[3] = &unk_1E7C27E50;
  v18[4] = v17;
  v19 = v7;
  objc_msgSend(v17, "enumerateObserversInQueue:", v18);

}

void __38__CSAlarmMonitor_initializeAlarmState__block_invoke_2(uint64_t a1, void *a2)
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
    v5 = "-[CSAlarmMonitor initializeAlarmState]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Fetching alarm error = %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __38__CSAlarmMonitor_initializeAlarmState__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1;
  else
    v2 = 2;
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:alarmIsFiringState:", a2, v2);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_880 != -1)
    dispatch_once(&sharedInstance_onceToken_880, &__block_literal_global_881);
  return (id)sharedInstance__sharedInstance_882;
}

void __32__CSAlarmMonitor_sharedInstance__block_invoke()
{
  CSAlarmMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSAlarmMonitor);
  v1 = (void *)sharedInstance__sharedInstance_882;
  sharedInstance__sharedInstance_882 = (uint64_t)v0;

}

@end
