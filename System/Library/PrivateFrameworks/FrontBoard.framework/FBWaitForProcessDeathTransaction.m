@implementation FBWaitForProcessDeathTransaction

- (FBWaitForProcessDeathTransaction)initWithProcess:(id)a3
{
  return -[FBWaitForProcessDeathTransaction initWithProcess:timeout:](self, "initWithProcess:timeout:", a3, -1.0);
}

- (FBWaitForProcessDeathTransaction)initWithProcess:(id)a3 timeout:(double)a4
{
  id v7;
  FBWaitForProcessDeathTransaction *v8;
  FBWaitForProcessDeathTransaction *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBWaitForProcessDeathTransaction;
  v8 = -[FBTransaction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_process, a3);
    v9->_timeout = a4;
  }

  return v9;
}

- (void)_begin
{
  void *v3;
  FBProcess *v4;
  FBProcess *process;
  BSAbsoluteMachTimer *v6;
  BSAbsoluteMachTimer *timer;
  BSAbsoluteMachTimer *v8;
  double timeout;
  void *v10;
  objc_super v11;
  _QWORD v12[5];

  if (self->_process)
  {
    +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", self);
    objc_msgSend(v3, "processForPID:", -[FBProcess pid](self->_process, "pid"));
    v4 = (FBProcess *)objc_claimAutoreleasedReturnValue();
    process = self->_process;

    if (v4 == process)
    {
      -[FBWaitForProcessDeathTransaction addMilestone:](self, "addMilestone:", CFSTR("FBProcessDidExitMilestone"));
      if (self->_timeout > 0.0)
      {
        v6 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D22F50]), "initWithIdentifier:", CFSTR("FBWaitForProcessDeathTransaction-watchdog"));
        timer = self->_timer;
        self->_timer = v6;

        v8 = self->_timer;
        timeout = self->_timeout;
        -[FBWaitForProcessDeathTransaction queue](self, "queue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __42__FBWaitForProcessDeathTransaction__begin__block_invoke;
        v12[3] = &unk_1E4A13C80;
        v12[4] = self;
        -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v8, "scheduleWithFireInterval:leewayInterval:queue:handler:", v10, v12, timeout, 1.0);

      }
      v11.receiver = self;
      v11.super_class = (Class)FBWaitForProcessDeathTransaction;
      -[FBWaitForProcessDeathTransaction _begin](&v11, sel__begin);
    }
    else
    {
      objc_msgSend(v3, "removeObserver:", self);
    }

  }
}

uint64_t __42__FBWaitForProcessDeathTransaction__begin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_failForTimeoutWithDescription:", CFSTR("process didn't exit in time"));
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_didComplete
{
  void *v3;
  objc_super v4;

  +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[BSAbsoluteMachTimer invalidate](self->_timer, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)FBWaitForProcessDeathTransaction;
  -[FBWaitForProcessDeathTransaction _didComplete](&v4, sel__didComplete);
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

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[FBWaitForProcessDeathTransaction queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__FBWaitForProcessDeathTransaction_processManager_didRemoveProcess___block_invoke;
  v8[3] = &unk_1E4A11FD0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __68__FBWaitForProcessDeathTransaction_processManager_didRemoveProcess___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__FBWaitForProcessDeathTransaction_processManager_didRemoveProcess___block_invoke_2;
  v5[3] = &unk_1E4A13CA8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "evaluateMilestone:withEvaluator:", CFSTR("FBProcessDidExitMilestone"), v5);

}

BOOL __68__FBWaitForProcessDeathTransaction_processManager_didRemoveProcess___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152);
}

- (FBProcess)process
{
  return self->_process;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end
