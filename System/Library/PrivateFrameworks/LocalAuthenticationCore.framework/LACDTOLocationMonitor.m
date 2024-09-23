@implementation LACDTOLocationMonitor

- (LACDTOLocationMonitor)initWithLocationProvider:(id)a3 workQueue:(id)a4
{
  id v7;
  id v8;
  LACDTOLocationMonitor *v9;
  LACDTOLocationMonitor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOLocationMonitor;
  v9 = -[LACDTOLocationMonitor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationProvider, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (void)startMonitoringWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  LACTimer *v6;
  LACTimer *timer;
  NSObject *v8;
  LACTimer *v9;
  OS_dispatch_queue *workQueue;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  LACDTOLocationMonitor *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (-[LACTimer isRunning](self->_timer, "isRunning"))
  {
    LACLogDTOTimers();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[LACDTOLocationMonitor startMonitoringWithReason:].cold.1((uint64_t)self, v5);

  }
  else
  {
    v6 = objc_alloc_init(LACTimer);
    timer = self->_timer;
    self->_timer = v6;

    LACLogDTOTimers();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v14 = self;
      v15 = 2048;
      v16 = 0x4024000000000000;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ starting monitor with an interval of %.2f secs with reason: %{public}@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    workQueue = self->_workQueue;
    v9 = self->_timer;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__LACDTOLocationMonitor_startMonitoringWithReason___block_invoke;
    v11[3] = &unk_2510C0EB0;
    objc_copyWeak(&v12, (id *)buf);
    -[LACTimer dispatchAfter:inQueue:repeat:block:](v9, "dispatchAfter:inQueue:repeat:block:", workQueue, 1, v11, 10.0);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

void __51__LACDTOLocationMonitor_startMonitoringWithReason___block_invoke(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    LACLogDTOTimers();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = WeakRetained;
      _os_log_impl(&dword_2409DC000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ performing scheduled query", buf, 0xCu);
    }

    v4 = (void *)WeakRetained[1];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __51__LACDTOLocationMonitor_startMonitoringWithReason___block_invoke_1;
    v5[3] = &unk_2510C2658;
    objc_copyWeak(&v6, v1);
    objc_msgSend(v4, "checkIsInFamiliarLocationWithCompletion:", v5);
    objc_destroyWeak(&v6);
  }

}

void __51__LACDTOLocationMonitor_startMonitoringWithReason___block_invoke_1(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 4);
    objc_msgSend(v5, "locationMonitor:didReceiveLocationState:", v4, v6);

  }
}

- (void)stopMonitoringWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  LACTimer *timer;
  int v7;
  LACDTOLocationMonitor *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  LACLogDTOTimers();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping monitor with reason: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[LACTimer cancel](self->_timer, "cancel");
  timer = self->_timer;
  self->_timer = 0;

}

- (LACDTOLocationMonitorDelegate)delegate
{
  return (LACDTOLocationMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
}

- (void)startMonitoringWithReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2409DC000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ ignoring redundant request to start", (uint8_t *)&v2, 0xCu);
}

@end
