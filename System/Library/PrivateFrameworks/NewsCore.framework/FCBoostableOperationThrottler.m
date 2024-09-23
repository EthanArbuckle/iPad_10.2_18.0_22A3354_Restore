@implementation FCBoostableOperationThrottler

void __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 32), "setWorkPending:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 32), "workPendingQualityOfService");
  v11[3] = v2;
  objc_msgSend(*(id *)(a1 + 32), "setWorkPendingQualityOfService:", -1);
  v3 = objc_msgSend(*(id *)(a1 + 32), "workPendingMergedData");
  v7[3] = v3;
  objc_msgSend(*(id *)(a1 + 32), "setWorkPendingMergedData:", 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke_2;
  v5[3] = &unk_1E464B940;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = &v6;
  v5[6] = &v10;
  FCPerformIfNonNil(WeakRetained, v5);

  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

void __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setMergedData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "operationThrottlerPerformOperation:", *(_QWORD *)(a1 + 32));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "serialWorkQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v4);

    objc_msgSend(v3, "operationThrottler:performAsyncOperationWithQualityOfService:completion:");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "serialWorkQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v5);

    objc_msgSend(v3, "operationThrottler:performAsyncOperationWithCompletion:", MEMORY[0x1E0C809B0], 3221225472, __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke_4, &unk_1E463AB18, *(_QWORD *)(a1 + 32));
  }

}

- (void)setMergedData:(unint64_t)a3
{
  self->_mergedData = a3;
}

- (void)tickleWithQualityOfService:(int64_t)a3 data:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id location;

  v8 = a5;
  os_unfair_lock_lock_with_options();
  if (-[FCBoostableOperationThrottler workPending](self, "workPending"))
  {
    -[FCBoostableOperationThrottler setWorkPendingQualityOfService:](self, "setWorkPendingQualityOfService:", FCHigherQualityOfService(-[FCBoostableOperationThrottler workPendingQualityOfService](self, "workPendingQualityOfService"), a3));
    -[FCBoostableOperationThrottler setWorkPendingMergedData:](self, "setWorkPendingMergedData:", -[FCBoostableOperationThrottler workPendingMergedData](self, "workPendingMergedData") | a4);
    os_unfair_lock_unlock(&self->_workPendingLock);
  }
  else
  {
    -[FCBoostableOperationThrottler setWorkPending:](self, "setWorkPending:", 1);
    -[FCBoostableOperationThrottler setWorkPendingQualityOfService:](self, "setWorkPendingQualityOfService:", FCHigherQualityOfService(-[FCBoostableOperationThrottler workPendingQualityOfService](self, "workPendingQualityOfService"), a3));
    -[FCBoostableOperationThrottler setWorkPendingMergedData:](self, "setWorkPendingMergedData:", -[FCBoostableOperationThrottler workPendingMergedData](self, "workPendingMergedData") | a4);
    os_unfair_lock_unlock(&self->_workPendingLock);
    -[FCBoostableOperationThrottler delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v9);

    -[FCBoostableOperationThrottler serialWorkQueue](self, "serialWorkQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke;
    v14[3] = &unk_1E464B968;
    v14[4] = self;
    objc_copyWeak(&v15, &location);
    FCDispatchAsyncWithQualityOfService(v10, a3, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  -[FCBoostableOperationThrottler serialWorkQueue](self, "serialWorkQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
    v13 = v8;
  else
    v13 = &__block_literal_global_195;
  FCDispatchAsyncWithQualityOfService(v11, a3, v13);

}

- (OS_dispatch_queue)serialWorkQueue
{
  return self->_serialWorkQueue;
}

- (int64_t)workPendingQualityOfService
{
  return self->_workPendingQualityOfService;
}

- (unint64_t)workPendingMergedData
{
  return self->_workPendingMergedData;
}

- (void)setWorkPendingQualityOfService:(int64_t)a3
{
  self->_workPendingQualityOfService = a3;
}

- (void)setWorkPendingMergedData:(unint64_t)a3
{
  self->_workPendingMergedData = a3;
}

- (void)setWorkPending:(BOOL)a3
{
  self->_workPending = a3;
}

- (BOOL)workPending
{
  return self->_workPending;
}

- (FCBoostableOperationThrottlerDelegate)delegate
{
  return (FCBoostableOperationThrottlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (FCBoostableOperationThrottler)initWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_queue_t v6;
  FCBoostableOperationThrottler *v7;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "delegate != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCBoostableOperationThrottler initWithDelegate:]";
    v12 = 2080;
    v13 = "FCOperationThrottler.m";
    v14 = 1024;
    v15 = 277;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("FCBoostableOperationThrottler.serial", v5);

  v7 = -[FCBoostableOperationThrottler initWithDelegate:queue:](self, "initWithDelegate:queue:", v4, v6);
  return v7;
}

- (FCBoostableOperationThrottler)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  FCBoostableOperationThrottler *v8;
  FCBoostableOperationThrottler *v9;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "delegate != nil");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCBoostableOperationThrottler initWithDelegate:queue:]";
    v16 = 2080;
    v17 = "FCOperationThrottler.m";
    v18 = 1024;
    v19 = 285;
    v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "queue != nil");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCBoostableOperationThrottler initWithDelegate:queue:]";
    v16 = 2080;
    v17 = "FCOperationThrottler.m";
    v18 = 1024;
    v19 = 286;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v13.receiver = self;
  v13.super_class = (Class)FCBoostableOperationThrottler;
  v8 = -[FCBoostableOperationThrottler init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v9->_workPendingLock._os_unfair_lock_opaque = 0;
    v9->_workPendingQualityOfService = -1;
    objc_storeStrong((id *)&v9->_serialWorkQueue, a4);
  }

  return v9;
}

- (unint64_t)mergedData
{
  return self->_mergedData;
}

- (void)tickleWithQualityOfService:(int64_t)a3 completion:(id)a4
{
  -[FCBoostableOperationThrottler tickleWithQualityOfService:data:completion:](self, "tickleWithQualityOfService:data:completion:", a3, 0, a4);
}

- (void)tickleWithQualityOfService:(int64_t)a3
{
  -[FCBoostableOperationThrottler tickleWithQualityOfService:completion:](self, "tickleWithQualityOfService:completion:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialWorkQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "serialWorkQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v1);

}

- (void)setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  FCBoostableOperationThrottler *v4;
  NSObject *v5;
  FCBoostableOperationThrottler *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_suspended != v3)
  {
    obj->_suspended = v3;
    -[FCBoostableOperationThrottler serialWorkQueue](obj, "serialWorkQueue");
    if (v3)
    {
      v5 = objc_claimAutoreleasedReturnValue();
      dispatch_suspend(v5);
    }
    else
    {
      v5 = objc_claimAutoreleasedReturnValue();
      dispatch_resume(v5);
    }

    v4 = obj;
  }
  objc_sync_exit(v4);

}

void __76__FCBoostableOperationThrottler_tickleWithQualityOfService_data_completion___block_invoke_4(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "serialWorkQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v1);

}

- (FCBoostableOperationThrottler)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCBoostableOperationThrottler init]";
    v9 = 2080;
    v10 = "FCOperationThrottler.m";
    v11 = 1024;
    v12 = 272;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCBoostableOperationThrottler init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)boostToQualityOfService:(int64_t)a3
{
  id v4;

  -[FCBoostableOperationThrottler serialWorkQueue](self, "serialWorkQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  FCDispatchAsyncWithQualityOfService(v4, a3, &__block_literal_global_123_0);

}

- (void)tickle
{
  -[FCBoostableOperationThrottler tickleWithCompletion:](self, "tickleWithCompletion:", 0);
}

- (void)tickleWithCompletion:(id)a3
{
  -[FCBoostableOperationThrottler tickleWithQualityOfService:completion:](self, "tickleWithQualityOfService:completion:", 9, a3);
}

- (BOOL)suspended
{
  FCBoostableOperationThrottler *v2;
  BOOL suspended;

  v2 = self;
  objc_sync_enter(v2);
  suspended = v2->_suspended;
  objc_sync_exit(v2);

  return suspended;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSerialWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialWorkQueue, a3);
}

- (os_unfair_lock_s)workPendingLock
{
  return self->_workPendingLock;
}

- (void)setWorkPendingLock:(os_unfair_lock_s)a3
{
  self->_workPendingLock = a3;
}

@end
