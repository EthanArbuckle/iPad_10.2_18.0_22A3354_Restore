@implementation AMSTask

- (id)performTaskWithPromiseBlock:(id)a3
{
  id v4;
  void *v5;
  AMSMutablePromise *v6;
  AMSMutablePromise *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  void *v15;
  void (**v16)(_QWORD);
  NSObject *v17;
  void *v18;
  id v19;
  void (**v20)(_QWORD);
  uint64_t aBlock;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  AMSTask *v27;
  AMSMutablePromise *v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[4];
  _QWORD block[4];
  id v33;
  id v34;

  v4 = a3;
  AMSLogKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  os_unfair_lock_lock_with_options();
  -[AMSTask promise](self, "promise");
  v6 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    os_unfair_lock_unlock(&self->_promiseAccessLock);
  }
  else
  {
    v7 = objc_alloc_init(AMSMutablePromise);
    -[AMSTask setPromise:](self, "setPromise:", v7);
    os_unfair_lock_unlock(&self->_promiseAccessLock);
    objc_msgSend((id)objc_opt_class(), "taskCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", self);

    v9 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __39__AMSTask_performTaskWithPromiseBlock___block_invoke;
    v25 = &unk_1E2546390;
    v30 = v31;
    v26 = v5;
    v27 = self;
    v6 = v7;
    v28 = v6;
    v29 = v4;
    v10 = (void (**)(_QWORD))_Block_copy(&aBlock);
    if (-[AMSTask runMode](self, "runMode") == 1)
    {
      v10[2](v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.AppleMediaServices.%@.performTask"), objc_opt_class(), aBlock, v23, v24, v25, v26, v27, v28);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = (const char *)objc_msgSend(v11, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = dispatch_queue_create(v12, v13);
      -[AMSTask setPerformTaskQueue:](self, "setPerformTaskQueue:", v14);

      -[AMSTask performTaskQueue](self, "performTaskQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v10;
      v17 = v15;
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __AMSDispatchAsync_block_invoke_7;
      block[3] = &unk_1E253DC28;
      v33 = v18;
      v34 = v16;
      v19 = v18;
      v20 = v16;
      dispatch_async(v17, block);

    }
  }
  _Block_object_dispose(v31, 8);

  return v6;
}

- (AMSMutablePromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
  objc_storeStrong((id *)&self->_promise, a3);
}

- (void)setPerformTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_performTaskQueue, a3);
}

- (int64_t)runMode
{
  return self->_runMode;
}

- (OS_dispatch_queue)performTaskQueue
{
  return self->_performTaskQueue;
}

void __20__AMSTask_taskCache__block_invoke()
{
  AMSThreadSafeSet *v0;
  void *v1;

  v0 = objc_alloc_init(AMSThreadSafeSet);
  v1 = (void *)qword_1ECEAD8C8;
  qword_1ECEAD8C8 = (uint64_t)v0;

}

- (BOOL)isCancelled
{
  os_unfair_lock_s *p_promiseAccessLock;
  void *v4;
  char v5;

  p_promiseAccessLock = &self->_promiseAccessLock;
  os_unfair_lock_lock_with_options();
  -[AMSTask promise](self, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCancelled");

  os_unfair_lock_unlock(p_promiseAccessLock);
  return v5;
}

- (AMSTask)init
{
  AMSTask *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSTask;
  result = -[AMSTask init](&v3, sel_init);
  if (result)
    result->_promiseAccessLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_performTaskQueue, 0);
}

+ (AMSThreadSafeSet)taskCache
{
  if (_MergedGlobals_145 != -1)
    dispatch_once(&_MergedGlobals_145, &__block_literal_global_125);
  return (AMSThreadSafeSet *)(id)qword_1ECEAD8C8;
}

void __39__AMSTask_performTaskWithPromiseBlock___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = AMSSetLogKey(*(void **)(a1 + 32));
  +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_enabled(v5);

  if (!v3)
  if (v6)
  {
    +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 40));

    if (!v7)
    +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();

    }
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138543362;
      v32 = objc_opt_class();
      _os_signpost_emit_with_name_impl(&dword_18C849000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Task", "%{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "activity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activate");

  objc_msgSend(*(id *)(a1 + 40), "activity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "completeAfter:", *(_QWORD *)(a1 + 48));

  +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_opt_class();
    AMSLogKey();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v19;
    v33 = 2114;
    v34 = v20;
    _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] === Starting ===", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.AppleMediaServices.%@"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSKeepAlive keepAliveWithName:style:](AMSKeepAlive, "keepAliveWithName:style:", v21, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, v23);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __39__AMSTask_performTaskWithPromiseBlock___block_invoke_10;
  v26[3] = &unk_1E2546368;
  v24 = *(_QWORD *)(a1 + 40);
  v29 = *(_QWORD *)(a1 + 64);
  v26[4] = v24;
  v27 = *(id *)(a1 + 48);
  objc_copyWeak(&v30, (id *)buf);
  v25 = v22;
  v28 = v25;
  objc_msgSend(v23, "addFinishBlock:", v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

}

- (BOOL)isFinished
{
  os_unfair_lock_s *p_promiseAccessLock;
  void *v4;
  char v5;

  p_promiseAccessLock = &self->_promiseAccessLock;
  os_unfair_lock_lock_with_options();
  -[AMSTask promise](self, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  os_unfair_lock_unlock(p_promiseAccessLock);
  return v5;
}

- (BOOL)isRunning
{
  os_unfair_lock_s *p_promiseAccessLock;
  void *v4;
  void *v5;
  int v6;

  p_promiseAccessLock = &self->_promiseAccessLock;
  os_unfair_lock_lock_with_options();
  -[AMSTask promise](self, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AMSTask promise](self, "promise");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFinished") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  os_unfair_lock_unlock(p_promiseAccessLock);
  return v6;
}

- (BOOL)cancel
{
  os_unfair_lock_s *p_promiseAccessLock;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  uint8_t v19[16];

  p_promiseAccessLock = &self->_promiseAccessLock;
  os_unfair_lock_lock(&self->_promiseAccessLock);
  +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_enabled(v6);

  if (!v4)
  if (v7)
  {
    +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_make_with_pointer(v10, self);

    if (!v8)
    +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();

    }
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_18C849000, v14, OS_SIGNPOST_EVENT, v11, "Task Cancel", "Cancelling task", v19, 2u);
    }

  }
  -[AMSTask promise](self, "promise");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "cancel");

  os_unfair_lock_unlock(p_promiseAccessLock);
  return v17;
}

- (id)performBinaryTaskWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__AMSTask_performBinaryTaskWithBlock___block_invoke;
  v9[3] = &unk_1E2546318;
  v10 = v4;
  v5 = v4;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "binaryPromiseAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __38__AMSTask_performBinaryTaskWithBlock___block_invoke(uint64_t a1)
{
  void *v1;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)performTaskWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__AMSTask_performTaskWithBlock___block_invoke;
  v8[3] = &unk_1E2546340;
  v9 = v4;
  v5 = v4;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __32__AMSTask_performTaskWithBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  if (v1)
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v1);
  else
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __39__AMSTask_performTaskWithPromiseBlock___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  os_signpost_id_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  os_signpost_id_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  os_signpost_id_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id WeakRetained;
  int v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a2)
  {
    v8 = (void *)v6;
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_enabled(v9);

    if (!v7)
    if (v10)
    {
      +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "OSLogObject");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "OSLogObject");
        v13 = objc_claimAutoreleasedReturnValue();

      }
      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        LOWORD(v39) = 0;
        _os_signpost_emit_with_name_impl(&dword_18C849000, v13, OS_SIGNPOST_INTERVAL_END, v21, "Task", "Finished", (uint8_t *)&v39, 2u);
      }

    }
    +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_opt_class();
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543618;
      v40 = v24;
      v41 = 2114;
      v42 = v25;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] === Finished ===", (uint8_t *)&v39, 0x16u);
LABEL_40:

    }
  }
  else
  {
    v14 = (void *)v6;
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_enabled(v15);

    if (!v7)
    if (v16)
    {
      +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "OSLogObject");
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "OSLogObject");
        v19 = objc_claimAutoreleasedReturnValue();

      }
      v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        AMSHashIfNeeded(v5);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543362;
        v40 = (uint64_t)v28;
        _os_signpost_emit_with_name_impl(&dword_18C849000, v19, OS_SIGNPOST_EVENT, v27, "Error occurred", "%{public}@", (uint8_t *)&v39, 0xCu);

      }
      +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "OSLogObject");
        v31 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "OSLogObject");
        v31 = objc_claimAutoreleasedReturnValue();

      }
      v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        LOWORD(v39) = 0;
        _os_signpost_emit_with_name_impl(&dword_18C849000, v31, OS_SIGNPOST_INTERVAL_END, v33, "Task", "Failed", (uint8_t *)&v39, 2u);
      }

    }
    +[AMSLogConfig sharedActionConfig](AMSLogConfig, "sharedActionConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_opt_class();
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v5);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543874;
      v40 = v34;
      v41 = 2114;
      v42 = v25;
      v43 = 2114;
      v44 = v35;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] === Failed === -> error = %{public}@", (uint8_t *)&v39, 0x20u);

      goto LABEL_40;
    }
  }

  objc_msgSend((id)objc_opt_class(), "taskCache");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *(void **)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v37, "finishWithPromise:", WeakRetained);

  objc_msgSend(v36, "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "invalidate");

}

- (void)setRunMode:(int64_t)a3
{
  self->_runMode = a3;
}

- (os_unfair_lock_s)promiseAccessLock
{
  return self->_promiseAccessLock;
}

- (void)setPromiseAccessLock:(os_unfair_lock_s)a3
{
  self->_promiseAccessLock = a3;
}

- (AMSMetricsActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

@end
