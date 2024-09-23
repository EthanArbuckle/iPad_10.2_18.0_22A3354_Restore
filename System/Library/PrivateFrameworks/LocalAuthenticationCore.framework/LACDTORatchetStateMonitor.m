@implementation LACDTORatchetStateMonitor

- (LACDTORatchetStateMonitor)initWithRatchetStateProvider:(id)a3 workQueue:(id)a4
{
  id v7;
  id v8;
  LACDTORatchetStateMonitor *v9;
  LACDTORatchetStateMonitor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTORatchetStateMonitor;
  v9 = -[LACDTORatchetStateMonitor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ratchetStateProvider, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (void)setRatchetState:(id)a3
{
  id v5;
  id *p_ratchetState;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  LACDTOEvent *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  p_ratchetState = (id *)&self->_ratchetState;
  if (-[LACDTORatchetState isEqual:](self->_ratchetState, "isEqual:", v5))
  {
    if (!-[LACTimer isRunning](self->_timer, "isRunning"))
      -[LACDTORatchetStateMonitor _scheduleNextStatusCheck](self, "_scheduleNextStatusCheck");
  }
  else
  {
    LACLogDTOState();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *p_ratchetState;
      v13 = 138543618;
      v14 = v8;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "Ratchet state changed from: %{public}@ to %{public}@", (uint8_t *)&v13, 0x16u);
    }

    v9 = *p_ratchetState;
    objc_storeStrong((id *)&self->_ratchetState, a3);
    v10 = objc_msgSend(v9, "rawValue");
    if (v10 != objc_msgSend(*p_ratchetState, "rawValue"))
    {
      v11 = -[LACDTOEvent initWithRawValue:value:]([LACDTOEvent alloc], "initWithRawValue:value:", 0, self->_ratchetState);
      -[LACDTORatchetStateMonitor eventBus](self, "eventBus");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dispatchEvent:sender:", v11, self);

    }
    -[LACDTORatchetStateMonitor _scheduleNextStatusCheck](self, "_scheduleNextStatusCheck");

  }
}

- (void)handleEvent:(id)a3 sender:(id)a4
{
  if (objc_msgSend(a3, "rawValue"))
    -[LACDTORatchetStateMonitor ratchetStateWithCompletion:](self, "ratchetStateWithCompletion:", &__block_literal_global_4);
}

- (void)policyController:(id)a3 didFinishPolicyEvaluation:(id)a4 result:(id)a5
{
  -[LACDTORatchetStateMonitor ratchetStateWithCompletion:](self, "ratchetStateWithCompletion:", &__block_literal_global_1, a4, a5);
}

- (void)ratchetStateWithCompletion:(id)a3
{
  id v4;
  LACDTORatchetStateProvider *ratchetStateProvider;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  ratchetStateProvider = self->_ratchetStateProvider;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__LACDTORatchetStateMonitor_ratchetStateWithCompletion___block_invoke;
  v7[3] = &unk_2510C0D48;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[LACDTORatchetStateProvider ratchetStateWithCompletion:](ratchetStateProvider, "ratchetStateWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __56__LACDTORatchetStateMonitor_ratchetStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5)
      objc_msgSend(WeakRetained, "setRatchetState:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)ratchetStateCompositeWithCompletion:(id)a3
{
  id v4;
  LACDTORatchetStateProvider *ratchetStateProvider;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  ratchetStateProvider = self->_ratchetStateProvider;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__LACDTORatchetStateMonitor_ratchetStateCompositeWithCompletion___block_invoke;
  v7[3] = &unk_2510C0D70;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[LACDTORatchetStateProvider ratchetStateCompositeWithCompletion:](ratchetStateProvider, "ratchetStateCompositeWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __65__LACDTORatchetStateMonitor_ratchetStateCompositeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v5)
    {
      objc_msgSend(v8, "ratchetState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setRatchetState:", v7);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_scheduleNextStatusCheck
{
  LACTimer *timer;
  LACTimer *v4;
  LACTimer *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  LACTimer *v10;
  OS_dispatch_queue *workQueue;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (-[LACTimer isRunning](self->_timer, "isRunning"))
  {
    -[LACTimer cancel](self->_timer, "cancel");
    timer = self->_timer;
    self->_timer = 0;

  }
  v4 = objc_alloc_init(LACTimer);
  v5 = self->_timer;
  self->_timer = v4;

  -[LACDTORatchetStateMonitor ratchetState](self, "ratchetState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectiveDuration");
  v8 = v7;

  LACLogDTOTimers();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = v8;
    _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "Schedule ratchet state check in %.2f", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v10 = self->_timer;
  workQueue = self->_workQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__LACDTORatchetStateMonitor__scheduleNextStatusCheck__block_invoke;
  v12[3] = &unk_2510C0EB0;
  objc_copyWeak(&v13, (id *)buf);
  -[LACTimer dispatchAfter:inQueue:block:](v10, "dispatchAfter:inQueue:block:", workQueue, v12, v8);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __53__LACDTORatchetStateMonitor__scheduleNextStatusCheck__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  LACLogDTOTimers();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2409DC000, v2, OS_LOG_TYPE_DEFAULT, "Performing ratchet state query", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "ratchetStateWithCompletion:", &__block_literal_global_5);

}

- (LACDTOEventBus)eventBus
{
  return self->eventBus;
}

- (void)setEventBus:(id)a3
{
  objc_storeStrong((id *)&self->eventBus, a3);
}

- (LACDTORatchetState)ratchetState
{
  return self->_ratchetState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratchetState, 0);
  objc_storeStrong((id *)&self->eventBus, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_ratchetStateProvider, 0);
}

@end
