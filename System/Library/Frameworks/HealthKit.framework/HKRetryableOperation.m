@implementation HKRetryableOperation

- (HKRetryableOperation)initWithQueue:(id)a3 retryCount:(int)a4
{
  id v7;
  HKRetryableOperation *v8;
  HKRetryableOperation *v9;
  NSMutableArray *v10;
  NSMutableArray *pendingOperations;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKRetryableOperation;
  v8 = -[HKRetryableOperation init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v9->_retryCount = a4;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingOperations = v9->_pendingOperations;
    v9->_pendingOperations = v10;

  }
  return v9;
}

- (void)_queue_performRetryableOperation:(id)a3 completion:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  +[HKPendingOperationRecord pendingOperation:completion:](HKPendingOperationRecord, "pendingOperation:completion:", v8, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = -[NSMutableArray count](self->_pendingOperations, "count");
  -[NSMutableArray addObject:](self->_pendingOperations, "addObject:", v10);
  if (!v9)
    -[HKRetryableOperation _queue_performPendingOperation:](self, "_queue_performPendingOperation:", v10);

}

- (void)_queue_performPendingOperation:(id)a3
{
  id v4;
  _QWORD *v5;
  void (*v6)(_QWORD *, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  HKRetryableOperation *v10;

  v4 = a3;
  objc_msgSend(v4, "operationHandler");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HKRetryableOperation__queue_performPendingOperation___block_invoke;
  v8[3] = &unk_1E37EA5F8;
  v9 = v4;
  v10 = self;
  v6 = (void (*)(_QWORD *, _QWORD *))v5[2];
  v7 = v4;
  v6(v5, v8);

}

void __55__HKRetryableOperation__queue_performPendingOperation___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  char v16;
  char v17;

  v7 = a4;
  v8 = objc_msgSend(*(id *)(a1 + 32), "errorCount");
  v10 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = *(NSObject **)(v9 + 8);
  if (v8 >= *(_QWORD *)(v9 + 16))
    a3 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_2;
  v13[3] = &unk_1E37EA5D0;
  v16 = a2;
  v13[4] = v9;
  v14 = v10;
  v15 = v7;
  v17 = a3;
  v12 = v7;
  dispatch_async(v11, v13);

}

void __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  char v20;
  _QWORD block[4];
  id v22;
  id v23;
  char v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    _HKInitializeLogging();
    v2 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v26 = v3;
      _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Retryable operation finished successfully.", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
    v4 = *(void **)(a1 + 40);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_25;
    block[3] = &unk_1E37EA5A8;
    v22 = v4;
    v24 = *(_BYTE *)(a1 + 56);
    v23 = *(id *)(a1 + 48);
    dispatch_async(v5, block);

    v6 = v22;
LABEL_5:

    goto LABEL_10;
  }
  v7 = *(unsigned __int8 *)(a1 + 57);
  _HKInitializeLogging();
  v8 = HKLogDataCollection;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(v10 + 16);
      *(_DWORD *)buf = 138543618;
      v26 = v10;
      v27 = 2048;
      v28 = v11;
      _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Retryable operation reached maximum retry count of %lu.", buf, 0x16u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
    v12 = *(void **)(a1 + 40);
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_27;
    v17 = &unk_1E37EA5A8;
    v18 = v12;
    v20 = *(_BYTE *)(a1 + 56);
    v19 = *(id *)(a1 + 48);
    dispatch_async(v13, &v14);

    v6 = v18;
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR))
    __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_2_cold_1(a1, v8);
  objc_msgSend(*(id *)(a1 + 40), "setErrorCount:", objc_msgSend(*(id *)(a1 + 40), "errorCount") + 1);
LABEL_10:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "firstObject", v14, v15, v16, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "_queue_performPendingOperation:", v9);

}

void __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_25(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_27(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (NSMutableArray)pendingOperations
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__HKRetryableOperation_pendingOperations__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableArray *)v3;
}

void __41__HKRetryableOperation_pendingOperations__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __55__HKRetryableOperation__queue_performPendingOperation___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138543618;
  v5 = v2;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Retryable operation failed but will be retried: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
