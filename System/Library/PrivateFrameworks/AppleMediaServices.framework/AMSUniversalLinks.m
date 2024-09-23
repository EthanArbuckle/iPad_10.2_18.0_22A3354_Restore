@implementation AMSUniversalLinks

+ (void)update
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  AMSUniversalLinks *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating Universal Links rules", buf, 0x16u);

  }
  v7 = objc_alloc_init(AMSUniversalLinks);
  -[AMSUniversalLinks updateUniversalLinks](v7, "updateUniversalLinks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __27__AMSUniversalLinks_update__block_invoke;
  v9[3] = &__block_descriptor_40_e51_v24__0__AMSUniversalLinksUpdateResult_8__NSError_16l;
  v9[4] = a1;
  objc_msgSend(v8, "addFinishBlock:", v9);

}

void __27__AMSUniversalLinks_update__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(a2, "success") & 1) == 0)
  {
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Universal Links rules update failed: %{public}@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (AMSUniversalLinks)init
{
  AMSUniversalLinks *v2;
  uint64_t v3;
  AMSUniversalLinksConnection *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUniversalLinks;
  v2 = -[AMSUniversalLinks init](&v6, sel_init);
  if (v2)
  {
    +[AMSUniversalLinks _connection](AMSUniversalLinks, "_connection");
    v3 = objc_claimAutoreleasedReturnValue();
    connection = v2->_connection;
    v2->_connection = (AMSUniversalLinksConnection *)v3;

  }
  return v2;
}

- (id)updateUniversalLinks
{
  AMSMutablePromise *v3;
  NSObject *v4;
  uint64_t v5;
  AMSMutablePromise *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  AMSMutablePromise *v10;
  AMSMutablePromise *v11;
  _QWORD v13[5];
  AMSMutablePromise *v14;
  _QWORD block[4];
  id v16;
  id v17;

  v3 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", 3.0);
  objc_msgSend((id)objc_opt_class(), "_privateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__AMSUniversalLinks_updateUniversalLinks__block_invoke;
  v13[3] = &unk_1E253E2B0;
  v13[4] = self;
  v6 = v3;
  v14 = v6;
  v7 = v13;
  AMSLogKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_9;
  block[3] = &unk_1E253DC28;
  v16 = v8;
  v17 = v7;
  v9 = v8;
  dispatch_async(v4, block);

  v10 = v14;
  v11 = v6;

  return v11;
}

void __41__AMSUniversalLinks_updateUniversalLinks__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__70;
  v10 = __Block_byref_object_dispose__70;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7[5], "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__AMSUniversalLinks_updateUniversalLinks__block_invoke_3;
  v3[3] = &unk_1E25466F0;
  v5 = &v6;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "updateWithCompletion:", v3);

  _Block_object_dispose(&v6, 8);
}

void __41__AMSUniversalLinks_updateUniversalLinks__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v8, "finishWithError:", v5);
  else
    objc_msgSend(v8, "finishWithResult:", v9);

}

+ (id)_privateQueue
{
  if (_MergedGlobals_149 != -1)
    dispatch_once(&_MergedGlobals_149, &__block_literal_global_130);
  return (id)qword_1ECEAD918;
}

void __34__AMSUniversalLinks__privateQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create_with_target_V2("com.apple.AMSUniversalLinks.queue", 0, v2);
  v1 = (void *)qword_1ECEAD918;
  qword_1ECEAD918 = (uint64_t)v0;

}

+ (id)_connection
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD block[4];
  id v18;
  id v19;

  objc_msgSend(a1, "_privateQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__70;
  v15 = __Block_byref_object_dispose__70;
  v3 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__AMSUniversalLinks__connection__block_invoke;
  v10[3] = &unk_1E253DDB8;
  v10[4] = &v11;
  v4 = v10;
  v5 = v2;
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke_2;
  block[3] = &unk_1E253DC28;
  v18 = v6;
  v19 = v4;
  v7 = v6;
  dispatch_sync(v5, block);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __32__AMSUniversalLinks__connection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  AMSUniversalLinksConnection *v5;
  uint64_t v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained(&_connection_connection_0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v5 = objc_alloc_init(AMSUniversalLinksConnection);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_storeWeak(&_connection_connection_0, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
}

- (AMSUniversalLinksConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
