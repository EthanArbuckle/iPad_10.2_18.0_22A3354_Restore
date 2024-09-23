@implementation LNDebouncer

- (LNDebouncer)initWithDelay:(double)a3 maxDelay:(double)a4 queue:(id)a5 block:(id)a6
{
  id v12;
  id v13;
  LNDebouncer *v14;
  LNDebouncer *v15;
  void *v16;
  id block;
  void *v18;
  LNWatchdogTimer *v19;
  LNWatchdogTimer *timer;
  LNWatchdogTimer *v21;
  LNWatchdogTimer *longTimer;
  LNDebouncer *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD aBlock[4];
  id v30;
  id location;
  objc_super v32;

  v12 = a5;
  v13 = a6;
  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDebouncer.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delay >= 0"));

  }
  if (a4 >= 0.0)
  {
    if (v12)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDebouncer.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v13)
      goto LABEL_6;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDebouncer.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maxDelay >= 0"));

  if (!v12)
    goto LABEL_10;
LABEL_5:
  if (v13)
    goto LABEL_6;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDebouncer.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_6:
  v32.receiver = self;
  v32.super_class = (Class)LNDebouncer;
  v14 = -[LNDebouncer init](&v32, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    v15->_maxDelay = a4;
    v16 = _Block_copy(v13);
    block = v15->_block;
    v15->_block = v16;

    v15->_delay = a3;
    objc_initWeak(&location, v15);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__LNDebouncer_initWithDelay_maxDelay_queue_block___block_invoke;
    aBlock[3] = &unk_1E45DDEF8;
    objc_copyWeak(&v30, &location);
    v18 = _Block_copy(aBlock);
    v19 = -[LNWatchdogTimer initWithTimeoutInterval:singleUse:timeoutHandler:]([LNWatchdogTimer alloc], "initWithTimeoutInterval:singleUse:timeoutHandler:", 0, v18, v15->_delay);
    timer = v15->_timer;
    v15->_timer = v19;

    v21 = -[LNWatchdogTimer initWithTimeoutInterval:singleUse:timeoutHandler:]([LNWatchdogTimer alloc], "initWithTimeoutInterval:singleUse:timeoutHandler:", 0, v18, v15->_maxDelay);
    longTimer = v15->_longTimer;
    v15->_longTimer = v21;

    v23 = v15;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)trigger
{
  -[LNWatchdogTimer reset](self->_timer, "reset");
  if (-[LNWatchdogTimer isStopped](self->_longTimer, "isStopped"))
    -[LNWatchdogTimer reset](self->_longTimer, "reset");
}

- (double)delay
{
  return self->_delay;
}

- (double)maxDelay
{
  return self->_maxDelay;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)block
{
  return self->_block;
}

- (LNWatchdogTimer)timer
{
  return self->_timer;
}

- (LNWatchdogTimer)longTimer
{
  return self->_longTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __50__LNDebouncer_initWithDelay_maxDelay_queue_block___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[6], "stop");
  objc_msgSend(WeakRetained[5], "stop");
  (*((void (**)(void))WeakRetained[4] + 2))();

}

@end
