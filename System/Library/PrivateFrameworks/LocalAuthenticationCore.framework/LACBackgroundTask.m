@implementation LACBackgroundTask

- (LACBackgroundTask)initWithWorker:(id)a3
{
  return -[LACBackgroundTask initWithIdentifier:worker:](self, "initWithIdentifier:worker:", CFSTR("AnonymousTask"), a3);
}

- (LACBackgroundTask)initWithIdentifier:(id)a3 worker:(id)a4
{
  id v7;
  id v8;
  LACBackgroundTask *v9;
  void *v10;
  id worker;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  OS_dispatch_queue *innerQueue;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)LACBackgroundTask;
  v9 = -[LACBackgroundTask init](&v17, sel_init);
  if (v9)
  {
    v10 = _Block_copy(v8);
    worker = v9->_worker;
    v9->_worker = v10;

    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:](LACConcurrencyUtilities, "createUserInitiatedSerialQueueWithIdentifier:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    innerQueue = v9->_innerQueue;
    v9->_innerQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_replyQueue, v9->_innerQueue);
    v9->_isWorkerRunning = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
  }

  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  LACLogTask();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[LACSharedModeDataSourceFTRCAdapter dealloc].cold.1((uint64_t)self, v3);

  v4.receiver = self;
  v4.super_class = (Class)LACBackgroundTask;
  -[LACBackgroundTask dealloc](&v4, sel_dealloc);
}

- (id)runSynchronouslyWithTimeout:(double)a3
{
  dispatch_block_t v5;
  id v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  LACBackgroundTaskResult *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_2);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__LACBackgroundTask_runSynchronouslyWithTimeout___block_invoke_5;
  v14[3] = &unk_2510C12B8;
  v16 = &v17;
  v6 = v5;
  v15 = v6;
  -[LACBackgroundTask runWithTimeout:completion:](self, "runWithTimeout:completion:", v14, a3);
  v7 = dispatch_time(0, (uint64_t)((a3 + 0.05) * 1000000000.0));
  if (dispatch_block_wait(v6, v7))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sync request timed out after %.3f secs"), *(_QWORD *)&a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACBackgroundTaskErrorBuilder errorWithCode:debugDescription:](LACBackgroundTaskErrorBuilder, "errorWithCode:debugDescription:", 2, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[LACBackgroundTaskResult initWithError:]([LACBackgroundTaskResult alloc], "initWithError:", v9);
    v11 = (void *)v18[5];
    v18[5] = (uint64_t)v10;

  }
  v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __49__LACBackgroundTask_runSynchronouslyWithTimeout___block_invoke_5(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)runWithTimeout:(double)a3 completion:(id)a4
{
  -[LACBackgroundTask runWithTimeout:queue:completion:](self, "runWithTimeout:queue:completion:", self->_replyQueue, a4, a3);
}

- (void)runWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *innerQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  innerQueue = self->_innerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__LACBackgroundTask_runWithTimeout_queue_completion___block_invoke;
  block[3] = &unk_2510C12E0;
  objc_copyWeak(v16, &location);
  v16[1] = *(id *)&a3;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __53__LACBackgroundTask_runWithTimeout_queue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queuedRunWithTimeout:replyQueue:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
    WeakRetained = v3;
  }

}

- (void)_queuedRunWithTimeout:(double)a3 replyQueue:(id)a4 completion:(id)a5
{
  NSObject *v8;
  id v9;
  NSObject *replyQueue;
  OS_dispatch_queue *v11;
  void *v12;
  id currentHandler;
  _QWORD v14[5];
  id v15;

  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innerQueue);
  if (self->_currentHandler || self->_isWorkerRunning)
  {
    replyQueue = v8;
    if (!v8)
      replyQueue = self->_replyQueue;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __65__LACBackgroundTask__queuedRunWithTimeout_replyQueue_completion___block_invoke;
    v14[3] = &unk_2510C1308;
    v14[4] = self;
    v15 = v9;
    dispatch_async(replyQueue, v14);

  }
  else
  {
    v11 = (OS_dispatch_queue *)v8;
    if (!v8)
      v11 = self->_replyQueue;
    objc_storeStrong((id *)&self->_replyQueue, v11);
    v12 = _Block_copy(v9);
    currentHandler = self->_currentHandler;
    self->_currentHandler = v12;

    -[LACBackgroundTask _queuedStartWorkerWatchdogWithTimeout:](self, "_queuedStartWorkerWatchdogWithTimeout:", a3);
    -[LACBackgroundTask _queuedStartWorkerIfNeeded](self, "_queuedStartWorkerIfNeeded");
  }

}

void __65__LACBackgroundTask__queuedRunWithTimeout_replyQueue_completion___block_invoke(uint64_t a1)
{
  LACBackgroundTaskResult *v2;
  void *v3;
  LACBackgroundTaskResult *v4;
  NSObject *v5;

  v2 = [LACBackgroundTaskResult alloc];
  +[LACBackgroundTaskErrorBuilder errorWithCode:](LACBackgroundTaskErrorBuilder, "errorWithCode:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LACBackgroundTaskResult initWithError:](v2, "initWithError:", v3);

  LACLogTask();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __65__LACBackgroundTask__queuedRunWithTimeout_replyQueue_completion___block_invoke_cold_1(a1, (uint64_t)v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_queuedStartWorkerWatchdogWithTimeout:(double)a3
{
  LACTimer *watchdog;
  OS_dispatch_queue *innerQueue;
  _QWORD v7[4];
  id v8[2];
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_innerQueue);
  -[LACBackgroundTask _queuedStopWorkerWatchdog](self, "_queuedStopWorkerWatchdog");
  objc_initWeak(&location, self);
  watchdog = self->_watchdog;
  innerQueue = self->_innerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__LACBackgroundTask__queuedStartWorkerWatchdogWithTimeout___block_invoke;
  v7[3] = &unk_2510C1330;
  objc_copyWeak(v8, &location);
  v8[1] = *(id *)&a3;
  -[LACTimer dispatchAfter:inQueue:block:](watchdog, "dispatchAfter:inQueue:block:", innerQueue, v7, a3);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __59__LACBackgroundTask__queuedStartWorkerWatchdogWithTimeout___block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  void *v3;
  void *v4;
  LACBackgroundTaskResult *v5;
  dispatch_queue_t *v6;

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[1]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Request '%@' timed out after %.3f secs"), v6[7], *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACBackgroundTaskErrorBuilder errorWithCode:debugDescription:](LACBackgroundTaskErrorBuilder, "errorWithCode:debugDescription:", 2, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[LACBackgroundTaskResult initWithError:]([LACBackgroundTaskResult alloc], "initWithError:", v4);
    -[dispatch_queue_t _queuedCompleteTaskWithResult:](v6, "_queuedCompleteTaskWithResult:", v5);

    WeakRetained = v6;
  }

}

- (void)_queuedStopWorkerWatchdog
{
  LACTimer *watchdog;
  LACTimer *v4;
  LACTimer *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_innerQueue);
  watchdog = self->_watchdog;
  if (watchdog)
    -[LACTimer cancel](watchdog, "cancel");
  v4 = objc_alloc_init(LACTimer);
  v5 = self->_watchdog;
  self->_watchdog = v4;

}

- (void)_queuedStartWorkerIfNeeded
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2409DC000, a2, OS_LOG_TYPE_ERROR, "%{public}@ ignoring run request because is already running", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *((_QWORD *)WeakRetained + 3);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke_2;
    v5[3] = &unk_2510C1380;
    objc_copyWeak(&v6, v1);
    (*(void (**)(uint64_t, _QWORD *))(v4 + 16))(v4, v5);
    objc_destroyWeak(&v6);
  }

}

void __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke_3;
    v7[3] = &unk_2510C1358;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __47__LACBackgroundTask__queuedStartWorkerIfNeeded__block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_queuedCompleteTaskWithResult:", *(_QWORD *)(a1 + 40));
}

- (void)_queuedCompleteTaskWithResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_log_type_t v7;
  id currentHandler;
  void *v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  LACBackgroundTask *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innerQueue);
  LACLogTask();
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 16 * (v6 != 0);

  if (os_log_type_enabled(v5, v7))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_2409DC000, v5, v7, "%{public}@ finished run with result %{public}@", buf, 0x16u);
  }

  -[LACBackgroundTask _queuedStopWorkerWatchdog](self, "_queuedStopWorkerWatchdog");
  currentHandler = self->_currentHandler;
  if (currentHandler)
  {
    v9 = (void *)objc_msgSend(currentHandler, "copy");
    v10 = self->_currentHandler;
    self->_currentHandler = 0;

    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __51__LACBackgroundTask__queuedCompleteTaskWithResult___block_invoke;
    v17[3] = &unk_2510C13A8;
    v19 = v9;
    v18 = v4;
    v11 = v9;
    -[LACBackgroundTask _queuedRunInReplyQueue:](self, "_queuedRunInReplyQueue:", v17);

  }
  else
  {
    -[LACBackgroundTask delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (!v13)
    {
      objc_initWeak((id *)buf, self);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __51__LACBackgroundTask__queuedCompleteTaskWithResult___block_invoke_2;
      v14[3] = &unk_2510C0F70;
      objc_copyWeak(&v16, (id *)buf);
      v15 = v4;
      -[LACBackgroundTask _queuedRunInReplyQueue:](self, "_queuedRunInReplyQueue:", v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }

}

uint64_t __51__LACBackgroundTask__queuedCompleteTaskWithResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __51__LACBackgroundTask__queuedCompleteTaskWithResult___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "backgroundTask:didCompleteTaskWithResult:", v4, *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (void)_queuedRunInReplyQueue:(id)a3
{
  NSObject *innerQueue;
  OS_dispatch_queue *replyQueue;
  BOOL v6;
  void (**block)(void);

  innerQueue = self->_innerQueue;
  block = (void (**)(void))a3;
  dispatch_assert_queue_V2(innerQueue);
  replyQueue = self->_replyQueue;
  if (replyQueue)
    v6 = replyQueue == self->_innerQueue;
  else
    v6 = 1;
  if (v6)
    block[2]();
  else
    dispatch_async((dispatch_queue_t)replyQueue, block);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("identifier: %@"), self->_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("; "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (LACBackgroundTaskDelegate)delegate
{
  return (LACBackgroundTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong(&self->_currentHandler, 0);
  objc_storeStrong(&self->_worker, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_innerQueue, 0);
}

void __65__LACBackgroundTask__queuedRunWithTimeout_replyQueue_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_2409DC000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed with result %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
