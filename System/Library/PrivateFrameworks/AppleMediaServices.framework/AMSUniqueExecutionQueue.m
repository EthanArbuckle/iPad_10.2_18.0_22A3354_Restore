@implementation AMSUniqueExecutionQueue

- (AMSUniqueExecutionQueue)initWithBlock:(id)a3
{
  id v4;
  AMSUniqueExecutionQueue *v5;
  uint64_t v6;
  id block;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *completionCallbacksQueue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *executeBlockQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *executionPromiseAccessQueue;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSUniqueExecutionQueue;
  v5 = -[AMSUniqueExecutionQueue init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.AppleMediaServices.AMSUniqueExecutionQueue.completionCallbacks", v8);
    completionCallbacksQueue = v5->_completionCallbacksQueue;
    v5->_completionCallbacksQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.AppleMediaServices.AMSUniqueExecutionQueue.executeBlock", v11);
    executeBlockQueue = v5->_executeBlockQueue;
    v5->_executeBlockQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.AppleMediaServices.AMSUniqueExecutionQueue.executionPromise", v14);
    executionPromiseAccessQueue = v5->_executionPromiseAccessQueue;
    v5->_executionPromiseAccessQueue = (OS_dispatch_queue *)v15;

  }
  return v5;
}

- (void)addCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;
  _QWORD block[4];
  id v20;
  id v21;

  v4 = a3;
  AMSLogKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[AMSUniqueExecutionQueue executionPromiseAccessQueue](self, "executionPromiseAccessQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__AMSUniqueExecutionQueue_addCompletionBlock___block_invoke;
  v14[3] = &unk_1E2546658;
  objc_copyWeak(&v17, &location);
  v8 = v5;
  v15 = v8;
  v9 = v4;
  v16 = v9;
  v10 = v14;
  v11 = v6;
  AMSLogKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_8;
  block[3] = &unk_1E253DC28;
  v20 = v12;
  v21 = v10;
  v13 = v12;
  dispatch_async(v11, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __46__AMSUniqueExecutionQueue_addCompletionBlock___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void (**v15)(id, _QWORD, id);
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  NSObject *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  _BYTE buf[24];
  void *v33;
  id v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionPromise");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
    {
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = objc_loadWeakRetained(v2);
        v10 = objc_opt_class();
        v11 = a1[4];
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2048;
        v33 = v5;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] addCompletionBlock: - Block is already running. tag = %p", buf, 0x20u);

      }
    }
    else
    {
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = objc_loadWeakRetained(v2);
        v19 = objc_opt_class();
        v20 = a1[4];
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v20;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] addCompletionBlock: - Block isn't running.", buf, 0x16u);

      }
      objc_msgSend(v4, "_createExecutionPromise");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_beginExecutingBlockWithPromise:", v5);
    }
    objc_msgSend(v4, "completionCallbacksQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __46__AMSUniqueExecutionQueue_addCompletionBlock___block_invoke_3;
    v27[3] = &unk_1E2546630;
    v16 = v5;
    v28 = v16;
    objc_copyWeak(&v31, v2);
    v29 = a1[4];
    v30 = a1[5];
    v23 = v27;
    v24 = v21;
    AMSLogKey();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v22;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_8;
    v33 = &unk_1E253DC28;
    v34 = v25;
    v35 = v23;
    v26 = v25;
    dispatch_async(v24, buf);

    objc_destroyWeak(&v31);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = a1[4];
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "AMSUniqueExecutionQueue: [%{public}@] Someone is using AMSUniqueExecutionQueue without holding onto the object while it executes.", buf, 0xCu);
    }

    v15 = (void (**)(id, _QWORD, id))a1[5];
    AMSError(0, 0, 0, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v16);
  }

}

void __46__AMSUniqueExecutionQueue_addCompletionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__AMSUniqueExecutionQueue_addCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E2546608;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "addFinishBlock:", v3);

  objc_destroyWeak(&v6);
}

void __46__AMSUniqueExecutionQueue_addCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v10 = objc_opt_class();
    v11 = *(_QWORD *)(a1 + 32);
    AMSHashIfNeeded(v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] addCompletionBlock: - Finished. result = %{public}@ | error = %{public}@", (uint8_t *)&v14, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)addCompletionBlockForSubsequentExecution:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;
  _QWORD block[4];
  id v20;
  id v21;

  v4 = a3;
  AMSLogKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[AMSUniqueExecutionQueue executionPromiseAccessQueue](self, "executionPromiseAccessQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke;
  v14[3] = &unk_1E2546658;
  objc_copyWeak(&v17, &location);
  v8 = v5;
  v15 = v8;
  v9 = v4;
  v16 = v9;
  v10 = v14;
  v11 = v6;
  AMSLogKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_8;
  block[3] = &unk_1E253DC28;
  v20 = v12;
  v21 = v10;
  v13 = v12;
  dispatch_async(v11, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id *v14;
  id v15;
  id *v16;
  _QWORD *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  void (**v24)(id, _QWORD, id);
  NSObject *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  id v34;
  _QWORD v35[7];
  id v36;
  _QWORD v37[7];
  id v38;
  _BYTE buf[24];
  void *v40;
  id v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionPromise");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
    {
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = objc_loadWeakRetained(v2);
        v10 = objc_opt_class();
        v11 = a1[4];
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v11;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] addCompletionBlockForSubsequentExecution: - Block is already running.", buf, 0x16u);

      }
      objc_msgSend(v4, "completionCallbacksQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_7;
      v35[3] = &unk_1E2546630;
      v14 = (id *)v35;
      v15 = v5;
      v35[4] = v15;
      v16 = &v36;
      objc_copyWeak(&v36, v2);
      v35[5] = a1[4];
      v35[6] = a1[5];
      v17 = v35;
      v18 = v12;
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v13;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_8;
      v40 = &unk_1E253DC28;
      v41 = v19;
      v42 = v17;
      v20 = v19;
      dispatch_async(v18, buf);

    }
    else
    {
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v26 = objc_loadWeakRetained(v2);
        v27 = objc_opt_class();
        v28 = a1[4];
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v28;
        _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] addCompletionBlockForSubsequentExecution: - Block isn't running.", buf, 0x16u);

      }
      objc_msgSend(v4, "_createExecutionPromise");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_beginExecutingBlockWithPromise:", v29);
      objc_msgSend(v4, "completionCallbacksQueue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_6;
      v37[3] = &unk_1E2546630;
      v14 = (id *)v37;
      v15 = v29;
      v37[4] = v15;
      v16 = &v38;
      objc_copyWeak(&v38, v2);
      v37[5] = a1[4];
      v37[6] = a1[5];
      v32 = v37;
      v18 = v30;
      AMSLogKey();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v31;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_8;
      v40 = &unk_1E253DC28;
      v41 = v33;
      v42 = v32;
      v34 = v33;
      dispatch_async(v18, buf);

    }
    objc_destroyWeak(v16);

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = a1[4];
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v23;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "AMSUniqueExecutionQueue: [%{public}@] Someone is using AMSUniqueExecutionQueue without holding onto the object while it executes.", buf, 0xCu);
    }

    v24 = (void (**)(id, _QWORD, id))a1[5];
    AMSError(0, 0, 0, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v24[2](v24, 0, v15);
  }

}

void __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_2;
  v3[3] = &unk_1E2546608;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "addFinishBlock:", v3);

  objc_destroyWeak(&v6);
}

void __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v10 = objc_opt_class();
    v11 = *(_QWORD *)(a1 + 32);
    AMSHashIfNeeded(v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] addCompletionBlockForSubsequentExecution: - Finished. result = %{public}@ | error = %{public}@", (uint8_t *)&v14, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_7(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_2_8;
  v3[3] = &unk_1E2546608;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "addFinishBlock:", v3);

  objc_destroyWeak(&v6);
}

void __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_2_8(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = AMSSetLogKey(*(void **)(a1 + 32));
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = objc_loadWeakRetained(v2);
    v8 = objc_opt_class();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Previous execution finished. Queuing a new execution.", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(WeakRetained, "addCompletionBlock:", *(_QWORD *)(a1 + 40));

}

- (void)_beginExecutingBlockWithPromise:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;
  _QWORD block[4];
  id v21;
  id v22;

  v4 = a3;
  -[AMSUniqueExecutionQueue executeBlockQueue](self, "executeBlockQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[AMSUniqueExecutionQueue executeBlockQueue](self, "executeBlockQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__AMSUniqueExecutionQueue__beginExecutingBlockWithPromise___block_invoke;
  v15[3] = &unk_1E25400F0;
  objc_copyWeak(&v18, &location);
  v9 = v6;
  v16 = v9;
  v10 = v4;
  v17 = v10;
  v11 = v15;
  v12 = v7;
  AMSLogKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_8;
  block[3] = &unk_1E253DC28;
  v21 = v13;
  v22 = v11;
  v14 = v13;
  dispatch_async(v12, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __59__AMSUniqueExecutionQueue__beginExecutingBlockWithPromise___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (WeakRetained)
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = objc_opt_class();
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v23 = v6;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Executing block.", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "block");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v21 = 0;
    ((void (**)(_QWORD, id *))v8)[2](v8, &v21);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (uint64_t)v21;

    if (!(v9 | v10))
    {
      AMSError(0, 0, 0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(WeakRetained, "completionCallbacksQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__AMSUniqueExecutionQueue__beginExecutingBlockWithPromise___block_invoke_9;
    v17[3] = &unk_1E25414B8;
    v18 = *(id *)(a1 + 40);
    v19 = (id)v9;
    v20 = (id)v10;
    v12 = (id)v10;
    v13 = (id)v9;
    dispatch_async(v11, v17);

  }
  else
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "AMSUniqueExecutionQueue: [%{public}@] Someone is using AMSUniqueExecutionQueue without holding onto the object while it executes.", buf, 0xCu);
    }

    v16 = *(void **)(a1 + 40);
    AMSError(0, 0, 0, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "finishWithError:", v12);
  }

}

uint64_t __59__AMSUniqueExecutionQueue__beginExecutingBlockWithPromise___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_createExecutionPromise
{
  NSObject *v3;
  AMSMutablePromise *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  id location;

  -[AMSUniqueExecutionQueue executionPromiseAccessQueue](self, "executionPromiseAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(AMSMutablePromise);
  -[AMSUniqueExecutionQueue setExecutionPromise:](self, "setExecutionPromise:", v4);

  objc_initWeak(&location, self);
  -[AMSUniqueExecutionQueue executionPromise](self, "executionPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __50__AMSUniqueExecutionQueue__createExecutionPromise__block_invoke;
  v11 = &unk_1E2543308;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "addFinishBlock:", &v8);

  -[AMSUniqueExecutionQueue executionPromise](self, "executionPromise", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

void __50__AMSUniqueExecutionQueue__createExecutionPromise__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionPromiseAccessQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__AMSUniqueExecutionQueue__createExecutionPromise__block_invoke_11;
    v18[3] = &unk_1E253E9A0;
    objc_copyWeak(&v19, v7);
    v12 = v18;
    v13 = v10;
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_8;
    block[3] = &unk_1E253DC28;
    v21 = v14;
    v22 = v12;
    v15 = v14;
    dispatch_async(v13, block);

    objc_destroyWeak(&v19);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block[0]) = 0;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "AMSUniqueExecutionQueue: Someone is using AMSUniqueExecutionQueue without holding onto the object while it executes.", (uint8_t *)block, 2u);
    }

  }
}

void __50__AMSUniqueExecutionQueue__createExecutionPromise__block_invoke_11(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExecutionPromise:", 0);

}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_queue)completionCallbacksQueue
{
  return self->_completionCallbacksQueue;
}

- (void)setCompletionCallbacksQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionCallbacksQueue, a3);
}

- (OS_dispatch_queue)executeBlockQueue
{
  return self->_executeBlockQueue;
}

- (void)setExecuteBlockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_executeBlockQueue, a3);
}

- (AMSMutablePromise)executionPromise
{
  return self->_executionPromise;
}

- (void)setExecutionPromise:(id)a3
{
  objc_storeStrong((id *)&self->_executionPromise, a3);
}

- (OS_dispatch_queue)executionPromiseAccessQueue
{
  return self->_executionPromiseAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionPromiseAccessQueue, 0);
  objc_storeStrong((id *)&self->_executionPromise, 0);
  objc_storeStrong((id *)&self->_executeBlockQueue, 0);
  objc_storeStrong((id *)&self->_completionCallbacksQueue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
