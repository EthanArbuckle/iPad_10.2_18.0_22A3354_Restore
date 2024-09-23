@implementation HFDebugStateDumpManager

- (id)registerStateDumpHandler:(id)a3 withName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDebugStateDumpManager.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stateDumpHandler"));

  }
  v9 = (void *)objc_msgSend(v7, "copy");
  v10 = _Block_copy(v9);
  -[HFDebugStateDumpManager stateDumpHandlersByName](self, "stateDumpHandlersByName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v8);

  objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x1E0D51990];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__HFDebugStateDumpManager_registerStateDumpHandler_withName___block_invoke;
  v17[3] = &unk_1EA727A48;
  objc_copyWeak(&v19, &location);
  v13 = v8;
  v18 = v13;
  objc_msgSend(v12, "tokenWithCancelationBlock:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v14;
}

- (NSMutableDictionary)stateDumpHandlersByName
{
  return self->_stateDumpHandlersByName;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_268 != -1)
    dispatch_once(&_MergedGlobals_268, &__block_literal_global_3_9);
  return (id)qword_1ED379210;
}

void __41__HFDebugStateDumpManager_sharedInstance__block_invoke_2()
{
  HFDebugStateDumpManager *v0;
  void *v1;

  v0 = objc_alloc_init(HFDebugStateDumpManager);
  v1 = (void *)qword_1ED379210;
  qword_1ED379210 = (uint64_t)v0;

}

- (HFDebugStateDumpManager)init
{
  HFDebugStateDumpManager *v2;
  dispatch_queue_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HFDebugStateDumpManager;
  v2 = -[HFDebugStateDumpManager init](&v14, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Home.HFStateHandlerQueue", 0);
    -[HFDebugStateDumpManager setStateHandlerQueue:](v2, "setStateHandlerQueue:", v3);

    v4 = (void *)objc_opt_new();
    -[HFDebugStateDumpManager setStateDumpHandlersByName:](v2, "setStateDumpHandlersByName:", v4);

    objc_initWeak(&location, v2);
    v5 = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __31__HFDebugStateDumpManager_init__block_invoke;
    v11 = &unk_1EA727D48;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("com.apple.Home.logStateDump", &v2->_logStateDumpNotifyToken, v5, &v8);

    -[HFDebugStateDumpManager _listenForAttachmentRequestNotifications](v2, "_listenForAttachmentRequestNotifications", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setStateHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateHandlerQueue, a3);
}

- (void)setStateDumpHandlersByName:(id)a3
{
  objc_storeStrong((id *)&self->_stateDumpHandlersByName, a3);
}

- (void)_listenForAttachmentRequestNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleStateDumpRequest, CFSTR("HomeDiagnosticExtensionAttachmentRequestNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void __31__HFDebugStateDumpManager_init__block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "_performStateDump:", 1);

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  notify_cancel(-[HFDebugStateDumpManager logStateDumpNotifyToken](self, "logStateDumpNotifyToken"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)HFDebugStateDumpManager;
  -[HFDebugStateDumpManager dealloc](&v4, sel_dealloc);
}

void __61__HFDebugStateDumpManager_registerStateDumpHandler_withName___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stateDumpHandlersByName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (id)_performStateDump:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  HFDebugStateDumpManager *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = self;
    v12 = 2080;
    v13 = "-[HFDebugStateDumpManager _performStateDump:]";
    v14 = 1024;
    v15 = v3;
    v16 = 2048;
    v17 = objc_msgSend(v6, "hostProcess");
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) logToConsole = %{BOOL}d. Process = %lu", (uint8_t *)&v10, 0x26u);

  }
  -[HFDebugStateDumpManager stateDumpHandlersByName](self, "stateDumpHandlersByName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_dictionaryByMappingValues:", &__block_literal_global_19_2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && +[HFExecutionEnvironment isHomeRelatedProcess](HFExecutionEnvironment, "isHomeRelatedProcess"))
  {
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_21_9);
  }
  return v8;
}

id __45__HFDebugStateDumpManager__performStateDump___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;

  (*(void (**)(uint64_t))(a3 + 16))(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HFPrunePropertyList(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __45__HFDebugStateDumpManager__performStateDump___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  HFLogForCategory(0x40uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "State dump %@:", (uint8_t *)&v7, 0xCu);
  }

  _HFLogStateDumpNode(v5, &stru_1EA741FF8, 0);
}

- (void)_writeStateDump
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    HFLogForCategory(0x40uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v5;
      _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to write state dump from %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFDebugStateDumpManager stateDumpHandlersByName](self, "stateDumpHandlersByName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_dictionaryByMappingValues:", &__block_literal_global_27_6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v11, "setDateFormat:", CFSTR("MM-dd-yyyy_HH:mm:ss"));
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("home_state_dump_%@_%@.plist"), v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Caches/com.apple.home")) & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      v22 = 0;
      objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/Caches/com.apple.home"), 1, 0, &v22);
      v15 = v22;
      if (v15)
      {
        HFLogForCategory(0x40uLL);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v15;
          _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "State dump Directory Creation Error: %@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("/var/mobile/Library/Caches/com.apple.home"), 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathComponent:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v15;
    objc_msgSend(v8, "writeToURL:error:", v18, &v21);
    v19 = v21;

    if (v19)
    {
      HFLogForCategory(0x40uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v19;
        _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "State dump Write Error: %@", buf, 0xCu);
      }

    }
  }
}

id __42__HFDebugStateDumpManager__writeStateDump__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;

  (*(void (**)(uint64_t))(a3 + 16))(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HFPrunePropertyList(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (OS_dispatch_queue)stateHandlerQueue
{
  return self->_stateHandlerQueue;
}

- (int)logStateDumpNotifyToken
{
  return self->_logStateDumpNotifyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDumpHandlersByName, 0);
  objc_storeStrong((id *)&self->_stateHandlerQueue, 0);
}

@end
