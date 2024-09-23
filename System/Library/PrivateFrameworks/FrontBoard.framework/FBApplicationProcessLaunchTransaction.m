@implementation FBApplicationProcessLaunchTransaction

- (void)_begin
{
  void *v3;
  void (**executionContextProvider)(void);
  FBProcessExecutionContext *v5;
  FBProcessExecutionContext *executionContext;
  id v7;
  FBWaitForProcessDeathTransaction *v8;
  FBWaitForProcessDeathTransaction *deathTransaction;
  objc_super v10;

  -[FBProcessManager processForIdentity:](self->_processManager, "processForIdentity:", self->_identity);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBApplicationProcessLaunchTransaction addMilestone:](self, "addMilestone:", CFSTR("processWillBeginLaunching"));
  if (objc_msgSend(v3, "isPendingExit"))
  {
    if (-[FBApplicationProcessLaunchTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      -[FBApplicationProcessLaunchTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Process is pending exit. Waiting for it to die..."));
    executionContextProvider = (void (**)(void))self->_executionContextProvider;
    if (executionContextProvider)
    {
      executionContextProvider[2]();
      v5 = (FBProcessExecutionContext *)objc_claimAutoreleasedReturnValue();
      executionContext = self->_executionContext;
      self->_executionContext = v5;

      v7 = self->_executionContextProvider;
      self->_executionContextProvider = 0;

    }
    v8 = -[FBWaitForProcessDeathTransaction initWithProcess:]([FBWaitForProcessDeathTransaction alloc], "initWithProcess:", v3);
    deathTransaction = self->_deathTransaction;
    self->_deathTransaction = v8;

    -[FBApplicationProcessLaunchTransaction addChildTransaction:](self, "addChildTransaction:", self->_deathTransaction);
  }
  else
  {
    -[FBApplicationProcessLaunchTransaction _queue_launchProcess:](self, "_queue_launchProcess:", v3);
  }
  v10.receiver = self;
  v10.super_class = (Class)FBApplicationProcessLaunchTransaction;
  -[FBApplicationProcessLaunchTransaction _begin](&v10, sel__begin);

}

- (void)_queue_launchProcess:(id)a3
{
  id v4;
  void *v5;
  FBProcessExecutionContext *v6;
  void (**executionContextProvider)(void);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  FBProcessExecutionContext *executionContext;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  FBApplicationProcessLaunchTransaction *v20;
  id v21;
  _QWORD v22[5];

  v4 = a3;
  if (self->_process)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_process == ((void *)0)"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationProcessLaunchTransaction _queue_launchProcess:].cold.2();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_19;
  }
  v5 = v4;
  if (!v4)
  {
    v6 = self->_executionContext;
    if (!v6)
    {
      executionContextProvider = (void (**)(void))self->_executionContextProvider;
      if (!executionContextProvider
        || (executionContextProvider[2](),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v6 = (FBProcessExecutionContext *)objc_msgSend(v8, "copy"),
            v8,
            !v6))
      {
        v6 = objc_alloc_init(FBProcessExecutionContext);
      }
    }
    -[FBProcessExecutionContext setIdentity:](v6, "setIdentity:", self->_identity);
    -[FBProcessExecutionContext completion](v6, "completion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_3;
    v19 = &unk_1E4A14628;
    v20 = self;
    v10 = v9;
    v21 = v10;
    -[FBProcessExecutionContext setCompletion:](v6, "setCompletion:", &v16);
    -[FBProcessManager _createProcessFutureWithExecutionContext:error:](self->_processManager, "_createProcessFutureWithExecutionContext:error:", v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("legacy transaction does not support launching process identity: %@"), self->_identity, v16, v17, v18, v19, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationProcessLaunchTransaction _queue_launchProcess:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_19:
    JUMPOUT(0x1A35A5AACLL);
  }
  -[FBApplicationProcessLaunchTransaction _queue_processWillLaunch:](self, "_queue_processWillLaunch:", v4);
  if (objc_msgSend(v5, "finishedLaunching"))
  {
    -[FBApplicationProcessLaunchTransaction _queue_finishProcessLaunch:](self, "_queue_finishProcessLaunch:", 1);
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke;
    v22[3] = &unk_1E4A11FA8;
    v22[4] = self;
    objc_msgSend(v5, "_executeBlockAfterLaunchCompletes:", v22);
  }
LABEL_12:
  executionContext = self->_executionContext;
  self->_executionContext = 0;

  v13 = self->_executionContextProvider;
  self->_executionContextProvider = 0;

}

- (void)_queue_processWillLaunch:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v5 = a3;
  if (self->_process)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_process == ((void *)0)"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationProcessLaunchTransaction _queue_processWillLaunch:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v7 = v5;
    if (v5)
    {
      objc_storeStrong((id *)&self->_process, a3);
      -[FBApplicationProcessLaunchTransaction addMilestone:](self, "addMilestone:", CFSTR("processDidFinishLaunching"));
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __66__FBApplicationProcessLaunchTransaction__queue_processWillLaunch___block_invoke;
      v8[3] = &unk_1E4A12348;
      v8[4] = self;
      objc_msgSend(v7, "_executeBlockAsCurrentProcess:", v8);
      -[FBApplicationProcessLaunchTransaction satisfyMilestone:](self, "satisfyMilestone:", CFSTR("processWillBeginLaunching"));
    }
    else
    {
      -[FBApplicationProcessLaunchTransaction _failWithReason:description:](self, "_failWithReason:description:", CFSTR("process launch failed"), CFSTR("Unable to create process."));
    }

  }
}

- (void)_queue_finishProcessLaunch:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  _QWORD v7[5];

  v3 = a3;
  if (-[BSAtomicSignal hasBeenSignalled](self->_interruptedOrComplete, "hasBeenSignalled"))
  {
    if (-[FBApplicationProcessLaunchTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      -[FBApplicationProcessLaunchTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Ignoring launched process since we were already interrupted or completed."));
  }
  else if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__FBApplicationProcessLaunchTransaction__queue_finishProcessLaunch___block_invoke;
    v7[3] = &unk_1E4A14650;
    v7[4] = self;
    -[FBApplicationProcessLaunchTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v7);
    -[FBApplicationProcessLaunchTransaction satisfyMilestone:](self, "satisfyMilestone:", CFSTR("processDidFinishLaunching"));
  }
  else
  {
    -[FBProcess exitContext](self->_process, "exitContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createError");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[FBApplicationProcessLaunchTransaction _failWithReason:description:precipitatingError:](self, "_failWithReason:description:precipitatingError:", CFSTR("process launch failed"), CFSTR("Process failed to launch."), v6);
  }
}

uint64_t __66__FBApplicationProcessLaunchTransaction__queue_processWillLaunch___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__FBApplicationProcessLaunchTransaction__queue_processWillLaunch___block_invoke_2;
  v3[3] = &unk_1E4A14650;
  v3[4] = v1;
  return objc_msgSend(v1, "_enumerateObserversWithBlock:", v3);
}

void __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_2;
  v5[3] = &unk_1E4A12730;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(v4, v5);

}

void __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_5(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_6;
  v5[3] = &unk_1E4A12730;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(v4, v5);

}

void __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD block[5];
  id v13;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "hasBeenSignalled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_4;
    block[3] = &unk_1E4A11FD0;
    block[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v13 = v9;
    dispatch_async(v7, block);

    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_5;
    v11[3] = &unk_1E4A11FA8;
    v11[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "_executeBlockAfterLaunchCompletes:", v11);

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

uint64_t __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_finishProcessLaunch:", *(unsigned __int8 *)(a1 + 40));
}

void __66__FBApplicationProcessLaunchTransaction__queue_processWillLaunch___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transaction:willLaunchProcess:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));

}

- (FBProcess)process
{
  return self->_process;
}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBApplicationProcessLaunchTransaction;
  -[FBApplicationProcessLaunchTransaction removeObserver:](&v3, sel_removeObserver_, a3);
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBApplicationProcessLaunchTransaction;
  -[FBApplicationProcessLaunchTransaction addObserver:](&v3, sel_addObserver_, a3);
}

- (FBApplicationProcessLaunchTransaction)initWithProcessIdentity:(id)a3 executionContextProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  FBApplicationProcessLaunchTransaction *v9;
  uint64_t v10;
  FBProcessManager *processManager;
  uint64_t v12;
  RBSProcessIdentity *identity;
  uint64_t v14;
  id executionContextProvider;
  uint64_t v16;
  BSAtomicSignal *interruptedOrComplete;
  FBApplicationProcessLaunchTransaction *result;
  void *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    v20.receiver = self;
    v20.super_class = (Class)FBApplicationProcessLaunchTransaction;
    v9 = -[FBTransaction init](&v20, sel_init);
    if (v9)
    {
      +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
      v10 = objc_claimAutoreleasedReturnValue();
      processManager = v9->_processManager;
      v9->_processManager = (FBProcessManager *)v10;

      v12 = objc_msgSend(v6, "copy");
      identity = v9->_identity;
      v9->_identity = (RBSProcessIdentity *)v12;

      v14 = objc_msgSend(v8, "copy");
      executionContextProvider = v9->_executionContextProvider;
      v9->_executionContextProvider = (id)v14;

      v16 = objc_opt_new();
      interruptedOrComplete = v9->_interruptedOrComplete;
      v9->_interruptedOrComplete = (BSAtomicSignal *)v16;

    }
    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identity"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationProcessLaunchTransaction initWithProcessIdentity:executionContextProvider:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    result = (FBApplicationProcessLaunchTransaction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_willComplete
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBApplicationProcessLaunchTransaction;
  -[FBApplicationProcessLaunchTransaction _willComplete](&v3, sel__willComplete);
  -[BSAtomicSignal signal](self->_interruptedOrComplete, "signal");
}

void __68__FBApplicationProcessLaunchTransaction__queue_finishProcessLaunch___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transaction:didLaunchProcess:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));

}

- (void)_didComplete
{
  id executionContextProvider;
  objc_super v4;

  -[BSAtomicSignal signal](self->_interruptedOrComplete, "signal");
  executionContextProvider = self->_executionContextProvider;
  self->_executionContextProvider = 0;

  v4.receiver = self;
  v4.super_class = (Class)FBApplicationProcessLaunchTransaction;
  -[FBApplicationProcessLaunchTransaction _didComplete](&v4, sel__didComplete);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptedOrComplete, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_deathTransaction, 0);
  objc_storeStrong(&self->_executionContextProvider, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_processManager, 0);
}

uint64_t __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processWillLaunch:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_finishProcessLaunch:", *(unsigned __int8 *)(a1 + 40));
}

- (FBApplicationProcessLaunchTransaction)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBApplicationProcessLaunchTransaction *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBApplicationProcessLaunchTransaction *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on FBApplicationProcessLaunchTransaction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBApplicationProcessLaunchTransaction.m");
    v17 = 1024;
    v18 = 47;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBApplicationProcessLaunchTransaction *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBApplicationProcessLaunchTransaction)initWithApplicationProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FBApplicationProcessLaunchTransaction *v7;
  FBApplicationProcessLaunchTransaction *result;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FBApplicationProcessLaunchTransaction initWithProcessIdentity:executionContextProvider:](self, "initWithProcessIdentity:executionContextProvider:", v6, 0);

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("process"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationProcessLaunchTransaction initWithApplicationProcess:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (FBApplicationProcessLaunchTransaction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBApplicationProcessLaunchTransaction)initWithApplicationBundleID:(id)a3 executionContextProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  FBApplicationProcessLaunchTransaction *v10;
  FBApplicationProcessLaunchTransaction *result;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0D87D80], "identityForEmbeddedApplicationIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FBApplicationProcessLaunchTransaction initWithProcessIdentity:executionContextProvider:](self, "initWithProcessIdentity:executionContextProvider:", v9, v8);

    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("bundleID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationProcessLaunchTransaction initWithApplicationBundleID:executionContextProvider:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    result = (FBApplicationProcessLaunchTransaction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)add:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBApplicationProcessLaunchTransaction;
  -[FBApplicationProcessLaunchTransaction addObserver:](&v3, sel_addObserver_, a3);
}

- (void)remove:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBApplicationProcessLaunchTransaction;
  -[FBApplicationProcessLaunchTransaction removeObserver:](&v3, sel_removeObserver_, a3);
}

- (BOOL)failedLaunch
{
  return -[FBProcess pid](self->_process, "pid") < 1;
}

- (BOOL)exited
{
  return !-[FBProcess isRunning](self->_process, "isRunning");
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_willInterruptWithReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBApplicationProcessLaunchTransaction;
  -[FBApplicationProcessLaunchTransaction _willInterruptWithReason:](&v4, sel__willInterruptWithReason_, a3);
  -[BSAtomicSignal signal](self->_interruptedOrComplete, "signal");
}

- (void)_willFailWithReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBApplicationProcessLaunchTransaction;
  -[FBApplicationProcessLaunchTransaction _willFailWithReason:](&v4, sel__willFailWithReason_, a3);
  -[BSAtomicSignal signal](self->_interruptedOrComplete, "signal");
}

- (void)_childTransactionDidComplete:(id)a3
{
  FBWaitForProcessDeathTransaction *v4;
  FBWaitForProcessDeathTransaction *v5;
  FBWaitForProcessDeathTransaction *deathTransaction;
  objc_super v7;

  v4 = (FBWaitForProcessDeathTransaction *)a3;
  v5 = v4;
  if (self->_deathTransaction == v4)
  {
    if ((-[FBWaitForProcessDeathTransaction isFailed](v4, "isFailed") & 1) == 0
      && (-[FBWaitForProcessDeathTransaction isInterrupted](v5, "isInterrupted") & 1) == 0)
    {
      if (-[FBApplicationProcessLaunchTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
        -[FBApplicationProcessLaunchTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Process officially exited. Attempting relaunch..."));
      -[FBApplicationProcessLaunchTransaction _queue_launchProcess:](self, "_queue_launchProcess:", 0);
    }
    deathTransaction = self->_deathTransaction;
    self->_deathTransaction = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)FBApplicationProcessLaunchTransaction;
  -[FBApplicationProcessLaunchTransaction _childTransactionDidComplete:](&v7, sel__childTransactionDidComplete_, v5);

}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  return self->_deathTransaction == a3;
}

- (id)_customizedDescriptionProperties
{
  void *v3;
  void *v4;
  FBProcess *process;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_process)
    process = self->_process;
  else
    process = (FBProcess *)CFSTR("(none)");
  objc_msgSend(v3, "setObject:forKey:", process, CFSTR("Process"));
  return v4;
}

- (void)_queue_noteExited
{
  if ((-[FBApplicationProcessLaunchTransaction isComplete](self, "isComplete") & 1) == 0)
    -[FBApplicationProcessLaunchTransaction _failWithReason:description:](self, "_failWithReason:description:", CFSTR("process launch failed"), CFSTR("Process exited"));
}

- (void)initWithApplicationProcess:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithApplicationBundleID:executionContextProvider:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithProcessIdentity:executionContextProvider:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_launchProcess:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_launchProcess:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_processWillLaunch:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
