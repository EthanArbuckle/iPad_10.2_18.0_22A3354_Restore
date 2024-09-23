@implementation EDTaskScheduler

- (EDTaskScheduler)initWithExecutionQueue:(id)a3
{
  id v5;
  EDTaskScheduler *v6;
  EDTaskScheduler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDTaskScheduler;
  v6 = -[EDTaskScheduler init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_executionQueue, a3);
    *(_OWORD *)&v7->_maxBackOffInterval = xmmword_1D317A980;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[EDTaskScheduler _stopObservingNetworkReachability](self, "_stopObservingNetworkReachability");
  v3.receiver = self;
  v3.super_class = (Class)EDTaskScheduler;
  -[EDTaskScheduler dealloc](&v3, sel_dealloc);
}

- (void)scheduleTask:(id)a3 canceledCallback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[EDTaskScheduler executionQueue](self, "executionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__EDTaskScheduler_scheduleTask_canceledCallback___block_invoke;
  block[3] = &unk_1E94A1F90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __49__EDTaskScheduler_scheduleTask_canceledCallback___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "setBackOffInterval:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "_cancelTimer");
  objc_msgSend(*(id *)(a1 + 32), "setPendingWaitingForNetwork:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setWork:", 0);
  objc_msgSend(*(id *)(a1 + 32), "canceledCallback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "canceledCallback");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setCanceledCallback:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_doScheduleTask:canceledCallback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)rescheduleTask
{
  NSObject *v3;
  _QWORD block[5];

  -[EDTaskScheduler executionQueue](self, "executionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__EDTaskScheduler_rescheduleTask__block_invoke;
  block[3] = &unk_1E949AEB8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __33__EDTaskScheduler_rescheduleTask__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_cancelTimer");
  objc_msgSend(*(id *)(a1 + 32), "setPendingWaitingForNetwork:", 0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "task");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "canceledCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_doScheduleTask:canceledCallback:", v4, v3);

}

- (void)_doScheduleTask:(id)a3 canceledCallback:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  NSObject *v12;
  dispatch_source_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  -[EDTaskScheduler initialDelay](self, "initialDelay");
  v9 = v8;
  -[EDTaskScheduler timerSource](self, "timerSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[EDTaskScheduler _cancelTimer](self, "_cancelTimer");
    -[EDTaskScheduler _incrementBackoffInterval](self, "_incrementBackoffInterval");
    -[EDTaskScheduler backOffInterval](self, "backOffInterval");
    v9 = v11;
  }
  -[EDTaskScheduler executionQueue](self, "executionQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v12);
  -[EDTaskScheduler setTimerSource:](self, "setTimerSource:", v13);

  -[EDTaskScheduler setTask:](self, "setTask:", v6);
  -[EDTaskScheduler setCanceledCallback:](self, "setCanceledCallback:", v7);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __52__EDTaskScheduler__doScheduleTask_canceledCallback___block_invoke;
  v22 = &unk_1E949C258;
  objc_copyWeak(&v23, &location);
  -[EDTaskScheduler setWork:](self, "setWork:", &v19);
  -[EDTaskScheduler timerSource](self, "timerSource", v19, v20, v21, v22);
  v14 = objc_claimAutoreleasedReturnValue();
  -[EDTaskScheduler work](self, "work");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_source_set_event_handler(v14, v15);

  -[EDTaskScheduler timerSource](self, "timerSource");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v16);

  -[EDTaskScheduler timerSource](self, "timerSource");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
  dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __52__EDTaskScheduler__doScheduleTask_canceledCallback___block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "observeForNetworkReachability")
    && !objc_msgSend(WeakRetained, "isReachable"))
  {
    objc_msgSend(WeakRetained, "setPendingWaitingForNetwork:", 1);
  }
  else
  {
    objc_msgSend(WeakRetained, "canceledCallback");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1)
      objc_msgSend(WeakRetained, "setCanceledCallback:", 0);
    objc_msgSend(WeakRetained, "task");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
}

- (void)setObserveForNetworkReachability:(BOOL)a3
{
  if (self->_observeForNetworkReachability != a3)
  {
    self->_observeForNetworkReachability = a3;
    if (a3)
      -[EDTaskScheduler _startObservingNetworkReachability](self, "_startObservingNetworkReachability");
    else
      -[EDTaskScheduler _stopObservingNetworkReachability](self, "_stopObservingNetworkReachability");
  }
}

- (void)_startObservingNetworkReachability
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addNetworkReachableObserver:selector:", self, sel__reportReachabilityChange_);

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EDTaskScheduler setIsReachable:](self, "setIsReachable:", objc_msgSend(v4, "isNetworkReachable"));

}

- (void)_stopObservingNetworkReachability
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_reportReachabilityChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[EDTaskScheduler executionQueue](self, "executionQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__EDTaskScheduler__reportReachabilityChange___block_invoke;
  block[3] = &unk_1E949AEB8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __45__EDTaskScheduler__reportReachabilityChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void (**v4)(void);

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIsReachable:", objc_msgSend(v3, "isNetworkReachable"));

  objc_msgSend(*(id *)(a1 + 32), "timerSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 && objc_msgSend(*(id *)(a1 + 32), "isReachable"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "pendingWaitingForNetwork"))
    {
      objc_msgSend(*(id *)(a1 + 32), "work");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setPendingWaitingForNetwork:", 0);
      v4[2]();

    }
  }
}

- (void)_incrementBackoffInterval
{
  double backOffInterval;
  double v3;

  backOffInterval = self->_backOffInterval;
  v3 = 1.0;
  if (backOffInterval != 0.0)
    v3 = backOffInterval * self->_backoffMultiplier;
  self->_backOffInterval = v3;
  -[EDTaskScheduler maxBackOffInterval](self, "maxBackOffInterval");
}

- (void)_cancelTimer
{
  void *v3;
  NSObject *v4;

  -[EDTaskScheduler timerSource](self, "timerSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EDTaskScheduler timerSource](self, "timerSource");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[EDTaskScheduler setTimerSource:](self, "setTimerSource:", 0);
  }
}

- (double)initialDelay
{
  return self->_initialDelay;
}

- (void)setInitialDelay:(double)a3
{
  self->_initialDelay = a3;
}

- (double)maxBackOffInterval
{
  return self->_maxBackOffInterval;
}

- (void)setMaxBackOffInterval:(double)a3
{
  self->_maxBackOffInterval = a3;
}

- (double)backoffMultiplier
{
  return self->_backoffMultiplier;
}

- (void)setBackoffMultiplier:(double)a3
{
  self->_backoffMultiplier = a3;
}

- (BOOL)observeForNetworkReachability
{
  return self->_observeForNetworkReachability;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_timerSource, a3);
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_executionQueue, a3);
}

- (double)backOffInterval
{
  return self->_backOffInterval;
}

- (void)setBackOffInterval:(double)a3
{
  self->_backOffInterval = a3;
}

- (BOOL)isReachable
{
  return self->_isReachable;
}

- (void)setIsReachable:(BOOL)a3
{
  self->_isReachable = a3;
}

- (BOOL)pendingWaitingForNetwork
{
  return self->_pendingWaitingForNetwork;
}

- (void)setPendingWaitingForNetwork:(BOOL)a3
{
  self->_pendingWaitingForNetwork = a3;
}

- (id)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)canceledCallback
{
  return self->_canceledCallback;
}

- (void)setCanceledCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)work
{
  return self->_work;
}

- (void)setWork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_work, 0);
  objc_storeStrong(&self->_canceledCallback, 0);
  objc_storeStrong(&self->_task, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

@end
