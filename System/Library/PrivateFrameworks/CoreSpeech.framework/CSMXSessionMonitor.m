@implementation CSMXSessionMonitor

- (CSMXSessionMonitor)init
{
  CSMXSessionMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSMXSessionMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSMXSessionMonitorQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[CSMXSessionMonitor _startMonitoringWithQueue:]";
    _os_log_debug_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  -[CSMXSessionMonitor _startObservingAVSystemControllerLifecycle](self, "_startObservingAVSystemControllerLifecycle");
  -[CSMXSessionMonitor _startObservingSomeClientIsActive](self, "_startObservingSomeClientIsActive");
  -[CSMXSessionMonitor _querySomeClientIsActive](self, "_querySomeClientIsActive");
}

- (void)_stopMonitoring
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[CSMXSessionMonitor _stopMonitoring]";
    _os_log_debug_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)_startObservingAVSystemControllerLifecycle
{
  void *v3;
  _QWORD *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)MEMORY[0x1E0D48200];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D48200], v6);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttribute:forKey:error:", v5, *MEMORY[0x1E0D48280], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__systemControllerDied_, *v4, v6);

}

- (void)_startObservingSomeClientIsActive
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_QWORD *)MEMORY[0x1E0D48228];
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D48228], v3);
  v7[0] = *v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttribute:forKey:error:", v6, *MEMORY[0x1E0D48280], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleSomeClientIsActiveDidChangeNotification_, *v5, v3);

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
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315394;
    v7 = "-[CSMXSessionMonitor _systemControllerDied:]";
    v8 = 2114;
    v9 = v4;
    _os_log_debug_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEBUG, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[CSMXSessionMonitor _startObservingAVSystemControllerLifecycle](self, "_startObservingAVSystemControllerLifecycle");
  -[CSMXSessionMonitor _startObservingSomeClientIsActive](self, "_startObservingSomeClientIsActive");
  -[CSMXSessionMonitor _handleSomeClientIsActiveDidChangeNotification:](self, "_handleSomeClientIsActiveDidChangeNotification:", 0);

}

- (void)_handleSomeClientIsActiveDidChangeNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSMXSessionMonitor *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__CSMXSessionMonitor__handleSomeClientIsActiveDidChangeNotification___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_querySomeClientIsActive
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CSMXSessionMonitor__querySomeClientIsActive__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __46__CSMXSessionMonitor__querySomeClientIsActive__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D47F58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeForKey:", *MEMORY[0x1E0D47F60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "-[CSMXSessionMonitor _querySomeClientIsActive]_block_invoke";
      v14 = 2112;
      v15 = v3;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s CurrentlyActiveCategory: %@. CurrentlyActiveMode: %@", buf, 0x20u);
    }
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__CSMXSessionMonitor__querySomeClientIsActive__block_invoke_13;
    v9[3] = &unk_1E7C26CB8;
    v10 = v3;
    v11 = v5;
    objc_msgSend(v8, "enumerateObserversInQueue:", v9);

  }
}

void __46__CSMXSessionMonitor__querySomeClientIsActive__block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *MEMORY[0x1E0D49528];
    v8[0] = *MEMORY[0x1E0D494F8];
    v8[1] = v4;
    v5 = *(_QWORD *)(a1 + 40);
    v9[0] = *(_QWORD *)(a1 + 32);
    v9[1] = v5;
    v6 = *MEMORY[0x1E0D49880];
    v8[2] = *MEMORY[0x1E0D49E20];
    v8[3] = v6;
    v9[2] = &unk_1E7C63BD8;
    v9[3] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mxSessionMonitorSomeClientWentActive:", v7);

  }
}

void __69__CSMXSessionMonitor__handleSomeClientIsActiveDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSMXSessionMonitor _handleSomeClientIsActiveDidChangeNotification:]_block_invoke";
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s handleSomeClientIsActiveDidChangeNotification = %{public}@", buf, 0x16u);
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__CSMXSessionMonitor__handleSomeClientIsActiveDidChangeNotification___block_invoke_9;
  v5[3] = &unk_1E7C29250;
  v4 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateObserversInQueue:", v5);

}

void __69__CSMXSessionMonitor__handleSomeClientIsActiveDidChangeNotification___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v3, "userInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mxSessionMonitorSomeClientWentActive:", v4);

    }
    else
    {
      objc_msgSend(v5, "mxSessionMonitorSomeClientWentActive:", 0);
    }
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_17134 != -1)
    dispatch_once(&sharedInstance_onceToken_17134, &__block_literal_global_17135);
  return (id)sharedInstance_sharedInstance_17136;
}

+ (id)GetCurrentlyActiveSessionCategory
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D47F58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)GetCurrentlyActiveSessionMode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D47F60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __36__CSMXSessionMonitor_sharedInstance__block_invoke()
{
  CSMXSessionMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSMXSessionMonitor);
  v1 = (void *)sharedInstance_sharedInstance_17136;
  sharedInstance_sharedInstance_17136 = (uint64_t)v0;

}

@end
