@implementation BSWatchdog

- (BSWatchdog)initWithProvider:(id)a3 queue:(id)a4
{
  return -[BSWatchdog initWithProvider:queue:completion:](self, "initWithProvider:queue:completion:", a3, a4, 0);
}

- (void)_completeWatchdogAfterFiring:(void *)a1
{
  id *v3;
  id *v4;
  void (**v5)(id, _QWORD);
  id v6;
  id v7;
  id v8;
  id v9;
  id *v10;

  if (a1)
  {
    v3 = a1;
    v10 = v3;
    if (!*((_BYTE *)v3 + 25))
    {
      *((_BYTE *)v3 + 25) = 1;
      if ((a2 & 1) == 0)
      {
        objc_msgSend(v3, "_watchdogInvalidated");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10[4], "watchdogCancelled:");
      }
      v4 = v10;
      v5 = (void (**)(id, _QWORD))v10[2];
      if (v5)
      {
        v5[2](v5, a2);
        v6 = v10[2];
        v10[2] = 0;

        v4 = v10;
      }
      v7 = v4[4];
      v4[4] = 0;

      v8 = v10[5];
      v10[5] = 0;

      v3 = v10;
    }
    objc_msgSend(v3[1], "invalidate");
    v9 = v10[1];
    v10[1] = 0;

  }
}

- (void)start
{
  NSDate *v3;
  NSDate *startDate;
  double timeout;
  double v6;
  double v7;
  _QWORD v8[5];

  if (!self->_timer && !self->_invalidated && !self->_completed)
  {
    v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    startDate = self->_startDate;
    self->_startDate = v3;

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[BSWatchdogDelegate watchdogStarted:](self->_delegate, "watchdogStarted:", self);
    timeout = self->_timeout;
    if (timeout >= 1.0)
      v6 = self->_timeout;
    else
      v6 = 1.0;
    v7 = fmax(timeout + -1.0, 1.0);
    if (v6 <= v7)
      v7 = v6;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __33__BSWatchdog__startWatchdogTimer__block_invoke;
    v8[3] = &unk_1E1EBE890;
    v8[4] = self;
    -[BSWatchdog _setupTimerWithInterval:handler:]((uint64_t)self, v8, v7);
  }
}

- (void)_setupTimerWithInterval:(double)a3 handler:
{
  id v5;
  void *v6;
  BSAbsoluteMachTimer *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 8), "invalidate");
  v6 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;

  v7 = [BSAbsoluteMachTimer alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BSWatchdog:%@>"), *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BSAbsoluteMachTimer initWithIdentifier:](v7, "initWithIdentifier:", v8);
  v10 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v9;

  v11 = *(void **)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 56);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__BSWatchdog__setupTimerWithInterval_handler___block_invoke;
  v14[3] = &unk_1E1EBF458;
  v13 = v5;
  v15 = v13;
  objc_msgSend(v11, "scheduleWithFireInterval:leewayInterval:queue:handler:", v12, v14, a3, 0.0);

}

- (void)setDelegate:(id)a3
{
  BSWatchdogDelegate **p_delegate;
  BSWatchdogDelegate *delegate;
  BSWatchdogDelegate *v7;
  BSWatchdogDelegate *v8;

  v8 = (BSWatchdogDelegate *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  delegate = self->_delegate;
  p_delegate = &self->_delegate;
  v7 = v8;
  if (delegate != v8)
  {
    objc_storeStrong((id *)p_delegate, a3);
    v7 = v8;
  }

}

- (BSWatchdog)initWithProvider:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v10;
  id v11;
  id v12;
  BSWatchdog *v13;
  BSWatchdog *v14;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSWatchdog.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider"));

  }
  objc_msgSend(v10, "watchdogTimeout");
  v13 = -[BSWatchdog initWithTimeout:queue:completion:](self, "initWithTimeout:queue:completion:", v11, v12);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_provider, a3);

  return v14;
}

- (BSWatchdog)initWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  id v10;
  id v11;
  BSWatchdog *v12;
  BSWatchdog *v13;
  uint64_t v14;
  id completion;
  void *v17;

  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSWatchdog.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  }
  v12 = -[BSWatchdog init](self, "init");
  v13 = v12;
  if (v12)
  {
    v12->_timeout = a3;
    objc_storeStrong((id *)&v12->_queue, a4);
    v14 = objc_msgSend(v11, "copy");
    completion = v13->_completion;
    v13->_completion = (id)v14;

  }
  return v13;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[BSWatchdog _completeWatchdogAfterFiring:](self, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSWatchdog.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_invalidated"));

  }
  v5.receiver = self;
  v5.super_class = (Class)BSWatchdog;
  -[BSWatchdog dealloc](&v5, sel_dealloc);
}

- (BSWatchdog)initWithTimeout:(double)a3 queue:(id)a4
{
  return -[BSWatchdog initWithTimeout:queue:completion:](self, "initWithTimeout:queue:completion:", a4, 0, a3);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSWatchdog timeout](self, "timeout");
  v4 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("timeout"));
  if (self->_completed)
  {
    v5 = (id)objc_msgSend(v3, "appendObject:withName:", CFSTR("(completed)"), 0);
  }
  else
  {
    if (self->_provider)
    {
      +[BSDescriptionBuilder succinctDescriptionForObject:](BSDescriptionBuilder, "succinctDescriptionForObject:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("provider"));

    }
    if (self->_delegate)
    {
      +[BSDescriptionBuilder succinctDescriptionForObject:](BSDescriptionBuilder, "succinctDescriptionForObject:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("delegate"));

    }
  }
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __46__BSWatchdog__setupTimerWithInterval_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __33__BSWatchdog__startWatchdogTimer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __33__BSWatchdog__stageOneTimerFired__block_invoke;
    v2[3] = &unk_1E1EBE890;
    v2[4] = v1;
    -[BSWatchdog _setupTimerWithInterval:handler:](v1, v2, 1.0);
  }
}

void __33__BSWatchdog__stageOneTimerFired__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    *(_BYTE *)(v1 + 26) = 1;
    objc_msgSend((id)v1, "_watchdogTimerFired");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(v1 + 32), "watchdogFired:", v1);
    -[BSWatchdog _completeWatchdogAfterFiring:]((void *)v1, 1);
  }
}

- (BSWatchdogDelegate)delegate
{
  return self->_delegate;
}

- (BSWatchdogProviding)provider
{
  return self->_provider;
}

- (double)timeout
{
  return self->_timeout;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (BOOL)hasFired
{
  return self->_hasFired;
}

@end
