@implementation MKApplicationStateMonitor

- (void)startObserving
{
  unint64_t observerCount;
  NSObject *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  _BYTE v34[18];
  __int16 v35;
  __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  observerCount = self->_observerCount;
  self->_observerCount = observerCount + 1;
  MKGetApplicationStateMonitorLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self->_observerCount;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v34 = v5;
    _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_DEBUG, "Observer count increased to %lu", buf, 0xCu);
  }

  if (!observerCount)
  {
    if (self->_forceRunningBoardServicesMonitoring)
      goto LABEL_5;
    if (_shouldUseUIApplicationState_once != -1)
      dispatch_once(&_shouldUseUIApplicationState_once, &__block_literal_global_86);
    if (!_shouldUseUIApplicationState_value)
    {
LABEL_5:
      v6 = getpid();
      objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v7, &v32);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v32;
      objc_msgSend(v8, "currentState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "taskState");

      -[MKApplicationStateMonitor _setupProcessMonitorWithIdentifier:interestedPid:](self, "_setupProcessMonitorWithIdentifier:interestedPid:", v7, v6);
      MKGetApplicationStateMonitorLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "bundle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v34 = v6;
        *(_WORD *)&v34[4] = 2114;
        *(_QWORD *)&v34[6] = v14;
        _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_INFO, "Will start monitoring using RunningBoardServices (pid:%{public}d -> %{public}@)", buf, 0x12u);

      }
      v15 = -[MKApplicationStateMonitor _applicationStateIsForegroundForTaskState:](self, "_applicationStateIsForegroundForTaskState:", v11);
      self->_inBackground = !v15;
      self->_active = v15;
      -[MKApplicationStateMonitor _stringForTaskState:](self, "_stringForTaskState:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MKGetApplicationStateMonitorLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        if (self->_inBackground)
          v18 = CFSTR("YES");
        else
          v18 = CFSTR("NO");
        v19 = v18;
        if (self->_active)
          v20 = CFSTR("YES");
        else
          v20 = CFSTR("NO");
        v21 = v20;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v34 = v16;
        *(_WORD *)&v34[8] = 2112;
        *(_QWORD *)&v34[10] = v19;
        v35 = 2112;
        v36 = v21;
        _os_log_impl(&dword_18B0B0000, v17, OS_LOG_TYPE_INFO, "Initial monitoring state (state:%@, inBackground:%@, active:%@)", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      self->_inBackground = objc_msgSend(v22, "applicationState") == 2;

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      self->_active = objc_msgSend(v23, "applicationState") == 0;

      MKGetApplicationStateMonitorLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        if (self->_inBackground)
          v25 = CFSTR("YES");
        else
          v25 = CFSTR("NO");
        v26 = v25;
        if (self->_active)
          v27 = CFSTR("YES");
        else
          v27 = CFSTR("NO");
        v28 = v27;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v34 = v26;
        *(_WORD *)&v34[8] = 2112;
        *(_QWORD *)&v34[10] = v28;
        _os_log_impl(&dword_18B0B0000, v24, OS_LOG_TYPE_INFO, "Will start monitoring using UIApplicationState with initial state (inBackground:%@, active:%@)", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObserver:selector:name:object:", self, sel__enterBackground, *MEMORY[0x1E0CEB288], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObserver:selector:name:object:", self, sel__exitBackground, *MEMORY[0x1E0CEB350], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObserver:selector:name:object:", self, sel__becomeActive, *MEMORY[0x1E0CEB270], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__resignActive, *MEMORY[0x1E0CEB358], 0);
    }

  }
}

+ (id)sharedInstance
{
  if (qword_1ECE2DD40 != -1)
    dispatch_once(&qword_1ECE2DD40, &__block_literal_global_8_0);
  return (id)_MergedGlobals_164;
}

- (BOOL)isActive
{
  return self->_active;
}

void __43__MKApplicationStateMonitor_sharedInstance__block_invoke()
{
  MKApplicationStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(MKApplicationStateMonitor);
  v1 = (void *)_MergedGlobals_164;
  _MergedGlobals_164 = (uint64_t)v0;

}

- (MKApplicationStateMonitor)init
{
  MKApplicationStateMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKApplicationStateMonitor;
  result = -[MKApplicationStateMonitor init](&v3, sel_init);
  if (result)
    result->_isVisible = 1;
  return result;
}

- (BOOL)isInBackground
{
  return self->_inBackground;
}

- (void)_becomeActive
{
  _BOOL4 active;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  active = self->_active;
  MKGetApplicationStateMonitorLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (active)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "Asked to become active, but currently active", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "Will become active", v6, 2u);
    }

    self->_active = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v4, "postNotificationName:object:", CFSTR("MKApplicationStateDidBecomeActiveNotification"), self);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MKApplicationStateMonitor;
  -[MKApplicationStateMonitor dealloc](&v3, sel_dealloc);
}

- (void)setForceRunningBoardServicesMonitoring:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  MKGetApplicationStateMonitorLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v7 = v6;
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "setForceRunningBoardServicesMonitoring:%@", (uint8_t *)&v8, 0xCu);

  }
  self->_forceRunningBoardServicesMonitoring = v3;
}

- (BOOL)_applicationStateIsForegroundForTaskState:(unsigned __int8)a3
{
  if (a3 == 3)
    return 0;
  if (a3 == 4)
    return self->_isVisible;
  return 1;
}

- (void)_enterBackground
{
  _BOOL4 inBackground;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  inBackground = self->_inBackground;
  MKGetApplicationStateMonitorLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (inBackground)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "Asked to enter background, but currently background", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "Will enter background", v6, 2u);
    }

    self->_inBackground = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v4, "postNotificationName:object:", CFSTR("MKApplicationStateDidEnterBackgroundNotification"), self);
  }

}

- (void)_exitBackground
{
  _BOOL4 inBackground;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  inBackground = self->_inBackground;
  MKGetApplicationStateMonitorLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (inBackground)
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "Will exit background", v6, 2u);
    }

    self->_inBackground = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v4, "postNotificationName:object:", CFSTR("MKApplicationStateWillEnterForegroundNotification"), self);
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "Asked to exit background, but not currently background", buf, 2u);
  }

}

- (void)_resignActive
{
  _BOOL4 active;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  active = self->_active;
  MKGetApplicationStateMonitorLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (active)
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "Will resign active", v7, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("MKApplicationStateWillResignActiveNotification"), self);

    self->_active = 0;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "Asked to resign active, but not currently active", buf, 2u);
    }

  }
}

- (void)_setupProcessMonitorWithIdentifier:(id)a3 interestedPid:(int)a4
{
  id v6;
  void *v7;
  id v8;
  RBSProcessMonitor *v9;
  RBSProcessMonitor *processMonitor;
  _QWORD v11[4];
  id v12;
  MKApplicationStateMonitor *v13;
  id v14;
  int v15;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0D87D90];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__MKApplicationStateMonitor__setupProcessMonitorWithIdentifier_interestedPid___block_invoke;
  v11[3] = &unk_1E20DEC40;
  v8 = v6;
  v12 = v8;
  objc_copyWeak(&v14, &location);
  v13 = self;
  v15 = a4;
  objc_msgSend(v7, "monitorWithConfiguration:", v11);
  v9 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
  processMonitor = self->_processMonitor;
  self->_processMonitor = v9;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __78__MKApplicationStateMonitor__setupProcessMonitorWithIdentifier_interestedPid___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  int v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndowmentNamespaces:", &unk_1E215A138);
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentifier:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStateDescriptor:", v4);
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v6);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__MKApplicationStateMonitor__setupProcessMonitorWithIdentifier_interestedPid___block_invoke_2;
  v7[3] = &unk_1E20DEC18;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v7[4] = *(_QWORD *)(a1 + 40);
  v9 = *(_DWORD *)(a1 + 56);
  objc_msgSend(v3, "setUpdateHandler:", v7);
  objc_destroyWeak(&v8);

}

void __78__MKApplicationStateMonitor__setupProcessMonitorWithIdentifier_interestedPid___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _BYTE *WeakRetained;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v9, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endowmentNamespaces");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "containsObject:", CFSTR("com.apple.frontboard.visibility"));
    v14 = *(id *)(a1 + 32);
    objc_sync_enter(v14);
    if (WeakRetained[18] == v13)
    {
      objc_sync_exit(v14);

    }
    else
    {
      MKGetApplicationStateMonitorLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        if (WeakRetained[18])
          v16 = CFSTR("YES");
        else
          v16 = CFSTR("NO");
        v17 = v16;
        v18 = CFSTR("NO");
        if (v13)
          v18 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v20 = v17;
        v22 = v17;
        v23 = 2112;
        v24 = v18;
        v19 = v24;
        _os_log_impl(&dword_18B0B0000, v15, OS_LOG_TYPE_INFO, "RunningBoardServices visibility changed from %@ to %@", buf, 0x16u);

      }
      WeakRetained[18] = v13;
      objc_sync_exit(v14);

      objc_msgSend(WeakRetained, "_handleApplicationStateChangeForMonitor:handle:update:interestedPid:", v7, v8, v9, *(unsigned int *)(a1 + 48));
    }

  }
}

- (void)_handleApplicationStateChangeForMonitor:(id)a3 handle:(id)a4 update:(id)a5 interestedPid:(int)a6
{
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  BOOL v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  int v22;
  _QWORD v23[5];
  BOOL v24;
  BOOL v25;
  uint8_t buf[4];
  _BYTE v27[10];
  __CFString *v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = objc_msgSend(a4, "pid");
  if (v10 == a6)
  {
    objc_msgSend(v9, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "taskState");

    v13 = -[MKApplicationStateMonitor isInBackground](self, "isInBackground");
    v14 = !v13;
    v15 = -[MKApplicationStateMonitor _applicationStateIsForegroundForTaskState:](self, "_applicationStateIsForegroundForTaskState:", v12);
    -[MKApplicationStateMonitor _stringForTaskState:](self, "_stringForTaskState:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    MKGetApplicationStateMonitorLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      if (v13)
        v18 = CFSTR("NO");
      else
        v18 = CFSTR("YES");
      v19 = v18;
      if (v15)
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      v21 = v20;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v27 = v16;
      *(_WORD *)&v27[8] = 2112;
      v28 = v19;
      v29 = 2112;
      v30 = v21;
      _os_log_impl(&dword_18B0B0000, v17, OS_LOG_TYPE_INFO, "(state:%@, wasInForeground:%@, isInForeground:%@)", buf, 0x20u);

    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __97__MKApplicationStateMonitor__handleApplicationStateChangeForMonitor_handle_update_interestedPid___block_invoke;
    v23[3] = &unk_1E20DB5B0;
    v24 = v14;
    v25 = v15;
    v23[4] = self;
    -[MKApplicationStateMonitor _performSynchronouslyOnMainQueue:](self, "_performSynchronouslyOnMainQueue:", v23);
  }
  else
  {
    v22 = v10;
    MKGetApplicationStateMonitorLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v27 = v22;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = a6;
      _os_log_impl(&dword_18B0B0000, v16, OS_LOG_TYPE_DEBUG, "Received update for process we don't care about, ignoring (pid:%d, interested in %d)", buf, 0xEu);
    }
  }

}

uint64_t __97__MKApplicationStateMonitor__handleApplicationStateChangeForMonitor_handle_update_interestedPid___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 40))
  {
    if (!*(_BYTE *)(result + 41))
    {
      objc_msgSend(*(id *)(result + 32), "_resignActive");
      return objc_msgSend(*(id *)(v1 + 32), "_enterBackground");
    }
  }
  else if (*(_BYTE *)(result + 41))
  {
    objc_msgSend(*(id *)(result + 32), "_exitBackground");
    return objc_msgSend(*(id *)(v1 + 32), "_becomeActive");
  }
  return result;
}

- (void)_performSynchronouslyOnMainQueue:(id)a3
{
  void (**v3)(void);
  _QWORD block[4];
  void (**v5)(void);

  v3 = (void (**)(void))a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v3[2]();
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MKApplicationStateMonitor__performSynchronouslyOnMainQueue___block_invoke;
    block[3] = &unk_1E20D7EF8;
    v5 = v3;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __62__MKApplicationStateMonitor__performSynchronouslyOnMainQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopObserving
{
  unint64_t observerCount;
  unint64_t v4;
  NSObject *processMonitor;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  observerCount = self->_observerCount;
  if (observerCount)
  {
    v4 = observerCount - 1;
    self->_observerCount = v4;
    if (v4)
    {
      MKGetApplicationStateMonitorLog();
      processMonitor = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(processMonitor, OS_LOG_TYPE_DEBUG))
      {
        v6 = self->_observerCount;
        v12 = 134217984;
        v13 = v6;
        _os_log_impl(&dword_18B0B0000, processMonitor, OS_LOG_TYPE_DEBUG, "Observer count dropped to %lu", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      if (self->_forceRunningBoardServicesMonitoring)
        goto LABEL_6;
      if (_shouldUseUIApplicationState_once != -1)
        dispatch_once(&_shouldUseUIApplicationState_once, &__block_literal_global_86);
      if (!_shouldUseUIApplicationState_value)
      {
LABEL_6:
        MKGetApplicationStateMonitorLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_INFO, "Will stop monitoring RunningBoardServices", (uint8_t *)&v12, 2u);
        }

        -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
        processMonitor = self->_processMonitor;
        self->_processMonitor = 0;
      }
      else
      {
        MKGetApplicationStateMonitorLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_INFO, "Will stop monitoring UIApplicationState", (uint8_t *)&v12, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB288], 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB350], 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB270], 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        processMonitor = objc_claimAutoreleasedReturnValue();
        -[NSObject removeObserver:name:object:](processMonitor, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB358], 0);
      }
    }

  }
}

- (id)_stringForTaskState:(unsigned __int8)a3
{
  __CFString *v4;
  id result;
  __CFString *v6;

  v4 = 0;
  switch(a3)
  {
    case 0u:
      v4 = CFSTR("unknown");
      goto LABEL_3;
    case 1u:
      result = CFSTR("terminated");
      break;
    case 3u:
      result = CFSTR("background (task suspended)");
      break;
    case 4u:
      if (self->_isVisible)
        v6 = CFSTR("foreground (running)");
      else
        v6 = CFSTR("background (running)");
      result = v6;
      break;
    default:
LABEL_3:
      result = v4;
      break;
  }
  return result;
}

- (BOOL)forceRunningBoardServicesMonitoring
{
  return self->_forceRunningBoardServicesMonitoring;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMonitor, 0);
}

@end
