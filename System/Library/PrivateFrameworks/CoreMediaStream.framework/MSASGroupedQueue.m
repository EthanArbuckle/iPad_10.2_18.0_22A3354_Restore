@implementation MSASGroupedQueue

- (MSASGroupedQueue)init
{
  char *v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSASGroupedQueue;
  v2 = -[MSASGroupedQueue init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MSASGroupedQueue work queue", 0);
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    v5 = dispatch_queue_create("MSASGroupedQueue member queue", MEMORY[0x1E0C80D50]);
    v6 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v5;

    *((_DWORD *)v2 + 3) = 20;
    *(_OWORD *)(v2 + 40) = xmmword_1D3F4E220;
  }
  return (MSASGroupedQueue *)v2;
}

- (void)setModel:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  objc_storeWeak((id *)&self->_model, a3);
  if (-[MSASGroupedQueue hasEnqueuedItems](self, "hasEnqueuedItems"))
  {
    -[MSASGroupedQueue assertBusyAssertion](self, "assertBusyAssertion");
    -[MSASGroupedQueue workQueue](self, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__MSASGroupedQueue_setModel___block_invoke;
    block[3] = &unk_1E95BCED0;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

- (int)maxGroupedCallbackEventBatchCount
{
  MSASGroupedQueue *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MSASGroupedQueue memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MSASGroupedQueue_maxGroupedCallbackEventBatchCount__block_invoke;
  v5[3] = &unk_1E95BCEF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

- (void)setMaxGroupedCallbackEventBatchCount:(int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  -[MSASGroupedQueue memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__MSASGroupedQueue_setMaxGroupedCallbackEventBatchCount___block_invoke;
  v6[3] = &unk_1E95BCF20;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_async(v5, v6);

}

- (double)maxGroupedCallbackEventStaleness
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MSASGroupedQueue memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__MSASGroupedQueue_maxGroupedCallbackEventStaleness__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setMaxGroupedCallbackEventStaleness:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[MSASGroupedQueue memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__MSASGroupedQueue_setMaxGroupedCallbackEventStaleness___block_invoke;
  v6[3] = &unk_1E95BCF48;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_barrier_async(v5, v6);

}

- (double)maxGroupedCallbackEventIdleInterval
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MSASGroupedQueue memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__MSASGroupedQueue_maxGroupedCallbackEventIdleInterval__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setMaxGroupedCallbackEventIdleInterval:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[MSASGroupedQueue memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__MSASGroupedQueue_setMaxGroupedCallbackEventIdleInterval___block_invoke;
  v6[3] = &unk_1E95BCF48;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_barrier_async(v5, v6);

}

- (void)assertBusyAssertion
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASGroupedQueue workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MSASGroupedQueue_assertBusyAssertion__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)deassertBusyAssertion
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASGroupedQueue workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MSASGroupedQueue_deassertBusyAssertion__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)workQueueAssertBusyAssertion
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASGroupedQueue memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MSASGroupedQueue_workQueueAssertBusyAssertion__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

- (void)workQueueDeassertBusyAssertion
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASGroupedQueue memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MSASGroupedQueue_workQueueDeassertBusyAssertion__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

- (BOOL)isAssertingBusyAssertion
{
  MSASGroupedQueue *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MSASGroupedQueue memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__MSASGroupedQueue_isAssertingBusyAssertion__block_invoke;
  v5[3] = &unk_1E95BCEF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)memberQueueIsAssertingBusyAssertion
{
  return self->_isAssertingBusyAssertion;
}

- (void)memberQueueSetIsAssertingBusyAssertion:(BOOL)a3
{
  self->_isAssertingBusyAssertion = a3;
}

- (void)shutDownFlush:(BOOL)a3 completionBlock:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;
  uint8_t buf[4];
  MSASGroupedQueue *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Shutting down.", buf, 0xCu);
  }
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MSASGroupedQueue_shutDownFlush_completionBlock___block_invoke;
  block[3] = &unk_1E95BCF70;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)flushQueueCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  MSASGroupedQueue *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v10 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Flushing queue.", buf, 0xCu);
  }
  -[MSASGroupedQueue assertBusyAssertion](self, "assertBusyAssertion");
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__MSASGroupedQueue_flushQueueCompletionBlock___block_invoke;
  v7[3] = &unk_1E95BCF98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)hasEnqueuedItems
{
  return 0;
}

- (void)workQueueRestartIdleTimer
{
  void *v3;
  void *v4;
  MSTimerGate *v5;
  double v6;
  dispatch_time_t v7;
  NSObject *v8;
  MSTimerGate *v9;
  _QWORD v10[4];
  MSTimerGate *v11;
  MSASGroupedQueue *v12;
  uint8_t buf[4];
  MSASGroupedQueue *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Restarting idle timer.", buf, 0xCu);
  }
  -[MSASGroupedQueue idleTimerGate](self, "idleTimerGate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MSASGroupedQueue idleTimerGate](self, "idleTimerGate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disable");

  }
  v5 = objc_alloc_init(MSTimerGate);
  -[MSASGroupedQueue setIdleTimerGate:](self, "setIdleTimerGate:", v5);
  -[MSASGroupedQueue maxGroupedCallbackEventIdleInterval](self, "maxGroupedCallbackEventIdleInterval");
  v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__MSASGroupedQueue_workQueueRestartIdleTimer__block_invoke;
  v10[3] = &unk_1E95BCFC0;
  v11 = v5;
  v12 = self;
  v9 = v5;
  dispatch_after(v7, v8, v10);

}

- (void)workQueueClearIdleTimer
{
  void *v3;
  void *v4;

  -[MSASGroupedQueue idleTimerGate](self, "idleTimerGate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MSASGroupedQueue idleTimerGate](self, "idleTimerGate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disable");

    -[MSASGroupedQueue setIdleTimerGate:](self, "setIdleTimerGate:", 0);
  }
}

- (void)workQueueRestartStalenessTimer
{
  void *v3;
  void *v4;
  MSTimerGate *v5;
  double v6;
  dispatch_time_t v7;
  NSObject *v8;
  MSTimerGate *v9;
  _QWORD v10[4];
  MSTimerGate *v11;
  MSASGroupedQueue *v12;
  uint8_t buf[4];
  MSASGroupedQueue *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Restarting staleness timer.", buf, 0xCu);
  }
  -[MSASGroupedQueue stalenessTimerGate](self, "stalenessTimerGate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MSASGroupedQueue stalenessTimerGate](self, "stalenessTimerGate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disable");

  }
  v5 = objc_alloc_init(MSTimerGate);
  -[MSASGroupedQueue setStalenessTimerGate:](self, "setStalenessTimerGate:", v5);
  -[MSASGroupedQueue maxGroupedCallbackEventStaleness](self, "maxGroupedCallbackEventStaleness");
  v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  -[MSASGroupedQueue workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__MSASGroupedQueue_workQueueRestartStalenessTimer__block_invoke;
  v10[3] = &unk_1E95BCFC0;
  v11 = v5;
  v12 = self;
  v9 = v5;
  dispatch_after(v7, v8, v10);

}

- (void)workQueueClearStalenessTimer
{
  void *v3;
  void *v4;

  -[MSASGroupedQueue stalenessTimerGate](self, "stalenessTimerGate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MSASGroupedQueue stalenessTimerGate](self, "stalenessTimerGate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disable");

    -[MSASGroupedQueue setStalenessTimerGate:](self, "setStalenessTimerGate:", 0);
  }
}

- (void)workQueueDidEnqueueFirstItem
{
  int v3;
  MSASGroupedQueue *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (-[MSASGroupedQueue isShuttingDown](self, "isShuttingDown"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v3 = 138543362;
      v4 = self;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Not enqueueing first item because we're shutting down.", (uint8_t *)&v3, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v3 = 138543362;
      v4 = self;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueueing first item.", (uint8_t *)&v3, 0xCu);
    }
    -[MSASGroupedQueue workQueueAssertBusyAssertion](self, "workQueueAssertBusyAssertion");
    -[MSASGroupedQueue workQueueRestartStalenessTimer](self, "workQueueRestartStalenessTimer");
  }
}

- (void)workQueueDidEnqueueSubsequentItem
{
  int v3;
  MSASGroupedQueue *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (-[MSASGroupedQueue isShuttingDown](self, "isShuttingDown"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v3 = 138543362;
      v4 = self;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Not enqueueing subsequent item because we're shutting down.", (uint8_t *)&v3, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v3 = 138543362;
      v4 = self;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueueing subsequent item.", (uint8_t *)&v3, 0xCu);
    }
    -[MSASGroupedQueue workQueueRestartIdleTimer](self, "workQueueRestartIdleTimer");
  }
}

- (MSASServerSideModel)model
{
  return (MSASServerSideModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (MSTimerGate)idleTimerGate
{
  return self->_idleTimerGate;
}

- (void)setIdleTimerGate:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerGate, a3);
}

- (MSTimerGate)stalenessTimerGate
{
  return self->_stalenessTimerGate;
}

- (void)setStalenessTimerGate:(id)a3
{
  objc_storeStrong((id *)&self->_stalenessTimerGate, a3);
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (void)setIsShuttingDown:(BOOL)a3
{
  self->_isShuttingDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stalenessTimerGate, 0);
  objc_storeStrong((id *)&self->_idleTimerGate, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_model);
}

uint64_t __50__MSASGroupedQueue_workQueueRestartStalenessTimer__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "enabled");
  if ((_DWORD)result)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = 138543362;
      v5 = v3;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Staleness timer fired.", (uint8_t *)&v4, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "assertBusyAssertion");
    objc_msgSend(*(id *)(a1 + 40), "workQueueFlushQueue");
    return objc_msgSend(*(id *)(a1 + 40), "deassertBusyAssertion");
  }
  return result;
}

uint64_t __45__MSASGroupedQueue_workQueueRestartIdleTimer__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "enabled");
  if ((_DWORD)result)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = 138543362;
      v5 = v3;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Idle timer fired.", (uint8_t *)&v4, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "assertBusyAssertion");
    objc_msgSend(*(id *)(a1 + 40), "workQueueFlushQueue");
    return objc_msgSend(*(id *)(a1 + 40), "deassertBusyAssertion");
  }
  return result;
}

uint64_t __46__MSASGroupedQueue_flushQueueCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "workQueueClearIdleTimer");
  objc_msgSend(*(id *)(a1 + 32), "workQueueClearStalenessTimer");
  objc_msgSend(*(id *)(a1 + 32), "workQueueFlushQueue");
  objc_msgSend(*(id *)(a1 + 32), "deassertBusyAssertion");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __50__MSASGroupedQueue_shutDownFlush_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsShuttingDown:", 1);
  objc_msgSend(*(id *)(a1 + 32), "workQueueClearIdleTimer");
  objc_msgSend(*(id *)(a1 + 32), "workQueueClearStalenessTimer");
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "workQueueFlushQueue");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __44__MSASGroupedQueue_isAssertingBusyAssertion__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "memberQueueIsAssertingBusyAssertion");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __50__MSASGroupedQueue_workQueueDeassertBusyAssertion__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "memberQueueIsAssertingBusyAssertion"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = 138543362;
      v5 = v3;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Deasserting busy assertion.", (uint8_t *)&v4, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "memberQueueSetIsAssertingBusyAssertion:", 0);
    objc_msgSend(*(id *)(a1 + 32), "model");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "releaseBusy");

  }
}

void __48__MSASGroupedQueue_workQueueAssertBusyAssertion__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "memberQueueIsAssertingBusyAssertion") & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = 138543362;
      v5 = v3;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Asserting busy assertion.", (uint8_t *)&v4, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "memberQueueSetIsAssertingBusyAssertion:", 1);
    objc_msgSend(*(id *)(a1 + 32), "model");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "retainBusy");

  }
}

uint64_t __41__MSASGroupedQueue_deassertBusyAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueDeassertBusyAssertion");
}

uint64_t __39__MSASGroupedQueue_assertBusyAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueAssertBusyAssertion");
}

double __59__MSASGroupedQueue_setMaxGroupedCallbackEventIdleInterval___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

double __55__MSASGroupedQueue_maxGroupedCallbackEventIdleInterval__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 40);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

double __56__MSASGroupedQueue_setMaxGroupedCallbackEventStaleness___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 48) = result;
  return result;
}

double __52__MSASGroupedQueue_maxGroupedCallbackEventStaleness__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 48);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __57__MSASGroupedQueue_setMaxGroupedCallbackEventBatchCount___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 12) = *(_DWORD *)(result + 40);
  return result;
}

uint64_t __53__MSASGroupedQueue_maxGroupedCallbackEventBatchCount__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 12);
  return result;
}

uint64_t __29__MSASGroupedQueue_setModel___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "workQueueFlushQueue");
  return objc_msgSend(*(id *)(a1 + 32), "deassertBusyAssertion");
}

@end
