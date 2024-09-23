@implementation BKSSystemShellService

- (BKSSystemShellService)initWithConfigurator:(id)a3
{
  void (**v4)(id, _QWORD);
  BKSSystemShellService *v5;
  BKSSystemShellService *v6;
  uint64_t v7;
  id watchdogPingBlock;
  double idleSleepInterval;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  objc_class *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[5];
  id v38;
  id location;
  uint8_t v40[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  BKSSystemShellService *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  __int128 buf;
  void (*v53)(uint64_t, void *);
  void *v54;
  NSObject *v55;
  id v56;
  id v57;
  BKSSystemShellService *v58;
  double v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v36.receiver = self;
  v36.super_class = (Class)BKSSystemShellService;
  v5 = -[BKSSystemShellService init](&v36, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_calloutQueue, MEMORY[0x1E0C80D38]);
    v6->_waitForDataMigration = 1;
    v7 = objc_msgSend(&__block_literal_global_7142, "copy");
    watchdogPingBlock = v6->_watchdogPingBlock;
    v6->_watchdogPingBlock = (id)v7;

    v6->_idleSleepInterval = 3.0;
    ((void (**)(id, BKSSystemShellService *))v4)[2](v4, v6);
    v6->_configurationFinished = 1;
    idleSleepInterval = v6->_idleSleepInterval;
    BKLogSystemShell();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = idleSleepInterval;
      _os_log_impl(&dword_18A0F0000, v10, OS_LOG_TYPE_DEFAULT, "activate (idle interval %g)", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundlePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bs_jobLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03458], "endpointForMachName:service:instance:", CFSTR("com.apple.backboard.system-app-server"), CFSTR("Shell"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0D03448];
      v18 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v53 = __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke;
      v54 = &unk_1E1EA0F38;
      v55 = v13;
      v56 = v12;
      v19 = v15;
      v59 = idleSleepInterval;
      v57 = v19;
      v58 = v6;
      objc_msgSend(v17, "connectionWithEndpoint:clientContextBuilder:", v16, &buf);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_storeStrong((id *)&v6->_connection, v20);
        objc_initWeak(&location, v6);
        v37[0] = v18;
        v37[1] = 3221225472;
        v37[2] = __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke_95;
        v37[3] = &unk_1E1EA0FA8;
        v37[4] = v6;
        objc_copyWeak(&v38, &location);
        objc_msgSend(v20, "configureConnection:", v37);
        BKLogSystemShell();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v40 = 0;
          _os_log_debug_impl(&dword_18A0F0000, v21, OS_LOG_TYPE_DEBUG, "activating connection to server", v40, 2u);
        }

        objc_msgSend(v20, "activate");
        BKLogSystemShell();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v20, "remoteTarget");
          v28 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v40 = 138543362;
          v41 = v28;
          v35 = (void *)v28;
          _os_log_debug_impl(&dword_18A0F0000, v22, OS_LOG_TYPE_DEBUG, "server remote target %{public}@", v40, 0xCu);

        }
        objc_msgSend(v20, "remoteTarget");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23 == 0;

        if (v24)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we must have a remote target"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = MEMORY[0x1E0C81028];
          v31 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__activateServerConnectionWithIdleSleepInterval_);
            v32 = (id)objc_claimAutoreleasedReturnValue();
            v33 = (objc_class *)objc_opt_class();
            NSStringFromClass(v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v40 = 138544642;
            v41 = (uint64_t)v32;
            v42 = 2114;
            v43 = v34;
            v44 = 2048;
            v45 = v6;
            v46 = 2114;
            v47 = CFSTR("BKSSystemShellService.m");
            v48 = 1024;
            v49 = 361;
            v50 = 2114;
            v51 = v29;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v40, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A133F3CLL);
        }
        BKSDisplayServicesStart();
        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
      }
      else
      {
        BKLogSystemShell();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v40 = 0;
          _os_log_error_impl(&dword_18A0F0000, v26, OS_LOG_TYPE_ERROR, "cannot get connection for service", v40, 2u);
        }

      }
      v25 = v55;
    }
    else
    {
      BKLogSystemShell();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_18A0F0000, v25, OS_LOG_TYPE_ERROR, "BKSSystemShellService: cannot get endpoint for mach service", (uint8_t *)&buf, 2u);
      }
    }

  }
  return v6;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setCalloutQueue:(id)a3
{
  OS_dispatch_queue *v5;
  OS_dispatch_queue *calloutQueue;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BKSSystemShellService *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (OS_dispatch_queue *)a3;
  if (self->_configurationFinished)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot modify config after init"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138544642;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      v15 = 2048;
      v16 = self;
      v17 = 2114;
      v18 = CFSTR("BKSSystemShellService.m");
      v19 = 1024;
      v20 = 98;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1340D4);
  }
  calloutQueue = self->_calloutQueue;
  self->_calloutQueue = v5;

}

- (double)idleSleepInterval
{
  return self->_idleSleepInterval;
}

- (void)setIdleSleepInterval:(double)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSSystemShellService *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_configurationFinished)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot modify config after init"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138544642;
      v10 = v6;
      v11 = 2114;
      v12 = v8;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("BKSSystemShellService.m");
      v17 = 1024;
      v18 = 107;
      v19 = 2114;
      v20 = v5;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A134230);
  }
  self->_idleSleepInterval = a3;
}

- (BOOL)waitForDataMigration
{
  return self->_waitForDataMigration;
}

- (void)setWaitForDataMigration:(BOOL)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSSystemShellService *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_configurationFinished)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot modify config after init"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138544642;
      v10 = v6;
      v11 = 2114;
      v12 = v8;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("BKSSystemShellService.m");
      v17 = 1024;
      v18 = 116;
      v19 = 2114;
      v20 = v5;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13438CLL);
  }
  self->_waitForDataMigration = a3;
}

- (id)collectiveWatchdogPingBlock
{
  return (id)MEMORY[0x18D768B28](self->_watchdogPingBlock, a2);
}

- (void)setCollectiveWatchdogPingBlock:(id)a3
{
  id v5;
  void *v6;
  id watchdogPingBlock;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  BKSSystemShellService *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_configurationFinished)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot modify config after init"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      v19 = 2114;
      v20 = CFSTR("BKSSystemShellService.m");
      v21 = 1024;
      v22 = 125;
      v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A134510);
  }
  v12 = v5;
  v6 = (void *)objc_msgSend(v5, "copy");
  watchdogPingBlock = self->_watchdogPingBlock;
  self->_watchdogPingBlock = v6;

}

- (void)start
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSSystemShellService *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (atomic_load((unint64_t *)&self->_checkInStatus))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("you already invoked -start"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138544642;
      v10 = v6;
      v11 = 2114;
      v12 = v8;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("BKSSystemShellService.m");
      v17 = 1024;
      v18 = 133;
      v19 = 2114;
      v20 = v5;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A134680);
  }
  -[BKSSystemShellService _setCheckInStatus:]((uint64_t)self, 1);
  -[BKSSystemShellService _checkInWithServerForReason:waitForDataMigration:]((uint64_t)self, CFSTR("first"), self->_waitForDataMigration);
}

- (void)didFinishLaunching
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  BKSSystemShellService *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = atomic_load((unint64_t *)&self->_checkInStatus);
  if (v4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("you need to invoke -start first"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544642;
      v16 = v8;
      v17 = 2114;
      v18 = v10;
      v19 = 2048;
      v20 = self;
      v21 = 2114;
      v22 = CFSTR("BKSSystemShellService.m");
      v23 = 1024;
      v24 = 141;
      v25 = 2114;
      v26 = v7;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v15, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13483CLL);
  }
  v5 = atomic_load((unint64_t *)&self->_checkInStatus);
  if (v5 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("you already invoked -didFinishLaunching"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544642;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      v19 = 2048;
      v20 = self;
      v21 = 2114;
      v22 = CFSTR("BKSSystemShellService.m");
      v23 = 1024;
      v24 = 142;
      v25 = 2114;
      v26 = v11;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v15, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A134928);
  }
  -[BKSSystemShellService _setCheckInStatus:]((uint64_t)self, 3);
  BKLogSystemShell();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_DEFAULT, "didFinishLaunching", (uint8_t *)&v15, 2u);
  }

  -[BKSSystemShellService _tellServerWeFinishedLaunching]((uint64_t)self);
}

- (void)restartWithOptions:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  BKLogSystemShell();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BKSRestartActionOptionsDescription(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_DEFAULT, "restartWithOptions: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  -[BKSSystemShellService _server]((id *)&self->super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "restartWithOptions:", v8);

}

- (void)setIndependentWatchdogEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  BKLogSystemShell();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_DEFAULT, "setIndependentWatchdogEnabled: %{BOOL}u", (uint8_t *)v8, 8u);
  }

  -[BKSSystemShellService _server]((id *)&self->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWatchdogMonitoringEnabled:", v7);

}

- (BOOL)collectiveWatchdogPing
{
  NSObject *v3;
  uint64_t v4;
  uint64_t (**watchdogPingBlock)(void);
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  BKLogSystemShell();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_DEFAULT, "collectiveWatchdogPing", buf, 2u);
  }

  v4 = atomic_load((unint64_t *)&self->_checkInStatus);
  if (v4 < 2)
    return 1;
  watchdogPingBlock = (uint64_t (**)(void))self->_watchdogPingBlock;
  if (watchdogPingBlock)
    return watchdogPingBlock[2]();
  BKLogSystemShell();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_ERROR, "collectiveWatchdogPing -- did someone forgot to set a ping block?", v8, 2u);
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_watchdogPingBlock, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)_server
{
  if (a1)
  {
    objc_msgSend(a1[1], "remoteTarget");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_setCheckInStatus:(uint64_t)a1
{
  int64_t v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = atomic_load((unint64_t *)(a1 + 48));
    if (v4 > a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot go backwards"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setCheckInStatus_);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138544642;
        v13 = v9;
        v14 = 2114;
        v15 = v11;
        v16 = 2048;
        v17 = a1;
        v18 = 2114;
        v19 = CFSTR("BKSSystemShellService.m");
        v20 = 1024;
        v21 = 227;
        v22 = 2114;
        v23 = v8;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A134E20);
    }
    v5 = atomic_load((unint64_t *)(a1 + 48));
    if (v5 != a2)
    {
      atomic_store(a2, (unint64_t *)(a1 + 48));
      BKLogSystemShell();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromBKSSystemShellCheckInStatus(a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v7;
        _os_log_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_DEFAULT, "checkin %{public}@", (uint8_t *)&v12, 0xCu);

      }
    }
  }
}

- (void)_tellServerWeFinishedLaunching
{
  id v1;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "remoteTarget");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "finishedLaunching");

  }
}

- (void)_checkInWithServerForReason:(int)a3 waitForDataMigration:
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD v28[5];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    BKLogSystemShell();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = v5;
      v31 = 1024;
      LODWORD(v32) = a3;
      _os_log_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_DEFAULT, "checkIn(%{public}@): (waits for migration:%{BOOL}u)", buf, 0x12u);
    }

    v7 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __74__BKSSystemShellService__checkInWithServerForReason_waitForDataMigration___block_invoke;
    v25[3] = &unk_1E1EA0E90;
    v26 = v5;
    v27 = a1;
    v8 = (void *)MEMORY[0x18D768B28](v25);
    v9 = v8;
    if (a3)
    {
      v10 = v8;
      objc_msgSend(MEMORY[0x1E0D03458], "endpointForMachName:service:instance:", CFSTR("com.apple.backboard.system-app-server"), CFSTR("DataMigrationCheckIn"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = v12;
          v28[0] = v7;
          v28[1] = 3221225472;
          v28[2] = __57__BKSSystemShellService__checkInWaitingForDataMigration___block_invoke;
          v28[3] = &unk_1E1EA1868;
          v28[4] = a1;
          -[NSObject configureConnection:](v12, "configureConnection:", v28);
          BKLogSystemShell();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_18A0F0000, v14, OS_LOG_TYPE_DEBUG, "_checkInWaitingForDataMigration: activating connection to server", buf, 2u);
          }

          -[NSObject activate](v13, "activate");
          BKLogSystemShell();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject remoteTarget](v13, "remoteTarget");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v30 = v20;
            _os_log_debug_impl(&dword_18A0F0000, v15, OS_LOG_TYPE_DEBUG, "_checkInWaitingForDataMigration: server remote target %{public}@", buf, 0xCu);

          }
          -[NSObject remoteTarget](v13, "remoteTarget");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we must have a remote target"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel__checkInWaitingForDataMigration_);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (objc_class *)objc_opt_class();
              NSStringFromClass(v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v30 = v22;
              v31 = 2114;
              v32 = v24;
              v33 = 2048;
              v34 = a1;
              v35 = 2114;
              v36 = CFSTR("BKSSystemShellService.m");
              v37 = 1024;
              v38 = 286;
              v39 = 2114;
              v40 = v21;
              _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x18A1352FCLL);
          }
          -[NSObject remoteTarget](v13, "remoteTarget");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "checkInAfterDataMigrationUsingCompletionBlock:", v10);

          -[NSObject invalidate](v13, "invalidate");
        }
        else
        {
          BKLogSystemShell();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_18A0F0000, v19, OS_LOG_TYPE_ERROR, "_checkInWaitingForDataMigration: cannot get connection for data migration checkin service", buf, 2u);
          }

          v13 = 0;
        }
      }
      else
      {
        BKLogSystemShell();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18A0F0000, v13, OS_LOG_TYPE_ERROR, "_checkInWaitingForDataMigration: cannot get endpoint for data migration checkin service", buf, 2u);
        }
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 8), "remoteTarget");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "checkInBypassingDataMigrationUsingCompletionBlock:", v9);

    }
  }

}

void __74__BKSSystemShellService__checkInWithServerForReason_waitForDataMigration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BKLogSystemShell();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v8;
      v11 = 2114;
      v12 = v3;
      _os_log_error_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_ERROR, "checkIn(%{public}@): exiting due to XPC error: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (*(_QWORD *)(a1 + 40))
      exit(0);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_DEFAULT, "checkIn(%{public}@): complete", (uint8_t *)&v9, 0xCu);
    }

    v7 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 48));
    if (v7 <= 1)
      -[BKSSystemShellService _setCheckInStatus:](*(_QWORD *)(a1 + 40), 2);
  }

}

void __57__BKSSystemShellService__checkInWaitingForDataMigration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = a2;
  BKLogSystemShell();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_debug_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEBUG, "_checkInWaitingForDataMigration: configured client service", v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF66320);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF66380);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("DataMigrationCheckIn"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServer:", v6);
  objc_msgSend(v7, "setClient:", v5);
  objc_msgSend(v3, "setInterface:", v7);
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v8);

  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_84);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_86);

}

void __57__BKSSystemShellService__checkInWaitingForDataMigration___block_invoke_85()
{
  NSObject *v0;
  uint8_t v1[16];

  BKLogSystemShell();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_18A0F0000, v0, OS_LOG_TYPE_ERROR, "_checkInWaitingForDataMigration: data migration checkin service invalidated", v1, 2u);
  }

}

void __57__BKSSystemShellService__checkInWaitingForDataMigration___block_invoke_82()
{
  NSObject *v0;
  uint8_t v1[16];

  BKLogSystemShell();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_18A0F0000, v0, OS_LOG_TYPE_ERROR, "_checkInWaitingForDataMigration: data migration checkin service interrupted", v1, 2u);
  }

}

void __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "encodeObject:forKey:", v3, CFSTR("bundleID"));
  objc_msgSend(v4, "encodeObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("bundlePath"));
  objc_msgSend(v4, "encodeObject:forKey:", *(_QWORD *)(a1 + 48), CFSTR("jobLabel"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("idleInterval"), *(double *)(a1 + 64));
  objc_msgSend(v4, "encodeInt64:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 40) == 0, CFSTR("watchdogType"));

}

void __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke_95(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v3 = a2;
  BKLogSystemShell();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEBUG, "configured client service", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF615E8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF663E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("Shell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServer:", v6);
  objc_msgSend(v7, "setClient:", v5);
  objc_msgSend(v3, "setInterface:", v7);
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v8);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke_105;
  v9[3] = &unk_1E1EA0F60;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_107_7152);
  objc_destroyWeak(&v10);

}

void __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  unsigned __int8 *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BKLogSystemShell();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_ERROR, "shell service interruption -- attempting to reconnect", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (unsigned __int8 *)WeakRetained;
  if (WeakRetained)
  {
    v7 = atomic_load((unint64_t *)WeakRetained + 6);
    objc_msgSend(v3, "activate");
    v8 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromBKSSystemShellCheckInStatus(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("reconnect[%@]"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    BKLogSystemShell();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_18A0F0000, v11, OS_LOG_TYPE_DEFAULT, "_%{public}@", buf, 0xCu);
    }

    switch(v7)
    {
      case 3uLL:
        -[BKSSystemShellService _checkInWithServerForReason:waitForDataMigration:]((uint64_t)v6, v10, 0);
        -[BKSSystemShellService _tellServerWeFinishedLaunching]((uint64_t)v6);
        break;
      case 2uLL:
        v13 = (uint64_t)v6;
        v14 = v10;
        v12 = 0;
        goto LABEL_12;
      case 1uLL:
        v12 = v6[32];
        v13 = (uint64_t)v6;
        v14 = v10;
LABEL_12:
        -[BKSSystemShellService _checkInWithServerForReason:waitForDataMigration:](v13, v14, v12);
        break;
    }

  }
}

void __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke_106(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  BKLogSystemShell();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_ERROR, "shell service invalidation -- I'm out", v4, 2u);
  }

  exit(0);
}

uint64_t __46__BKSSystemShellService_initWithConfigurator___block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  BKLogSystemShell();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_18A0F0000, v0, OS_LOG_TYPE_DEFAULT, "watchdog ping received", v2, 2u);
  }

  return 1;
}

@end
