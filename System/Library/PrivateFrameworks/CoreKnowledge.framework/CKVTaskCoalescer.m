@implementation CKVTaskCoalescer

- (BOOL)_didIncomingTask:(id)a3 arriveInCoalescingWindowWithLastTask:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v6 = a4;
  objc_msgSend(a3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;
  objc_msgSend(v6, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "timeIntervalSince1970");
  v12 = v9 - v11;

  return v12 < self->_coalescenceInterval;
}

- (void)_beginTransaction
{
  CKVTaskCoalescer *v2;
  unsigned int transactionCounter;
  uint64_t v4;
  OS_os_transaction *transaction;
  NSObject *v6;
  NSString *managerName;
  OS_os_transaction *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  OS_os_transaction *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  transactionCounter = v2->_transactionCounter;
  v2->_transactionCounter = transactionCounter + 1;
  if (!transactionCounter)
  {
    v4 = os_transaction_create();
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v4;

    v6 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
    {
      managerName = v2->_managerName;
      v8 = v2->_transaction;
      v9 = 136315650;
      v10 = "-[CKVTaskCoalescer _beginTransaction]";
      v11 = 2112;
      v12 = managerName;
      v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_1A48B3000, v6, OS_LOG_TYPE_DEBUG, "%s (%@) Acquired OS transaction: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  objc_sync_exit(v2);

}

- (CKVTaskCoalescer)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CKVTaskCoalescer)initWithManagerName:(id)a3 coalescenceInterval:(double)a4 coalescenceDelay:(double)a5 dispatchQoS:(unsigned int)a6 settings:(id)a7
{
  id v12;
  id v13;
  CKVTaskCoalescer *v14;
  uint64_t v15;
  NSString *managerName;
  NSMutableDictionary *v17;
  NSMutableDictionary *taskRegistry;
  OS_os_transaction *transaction;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *taskRegistryQueue;
  NSObject *v24;
  NSObject *v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *taskExecutionQueue;
  CKVTaskCoalescer *v28;
  NSObject *v29;
  NSString *v30;
  const char *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSString *v35;
  const char *v36;
  void *v37;
  void *v38;
  objc_super v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  NSString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v40.receiver = self;
  v40.super_class = (Class)CKVTaskCoalescer;
  v14 = -[CKVTaskCoalescer init](&v40, sel_init);
  if (!v14)
    goto LABEL_7;
  v15 = objc_msgSend(v12, "copy");
  managerName = v14->_managerName;
  v14->_managerName = (NSString *)v15;

  if (!-[NSString length](v14->_managerName, "length"))
  {
    v29 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      v28 = 0;
      goto LABEL_18;
    }
    v30 = v14->_managerName;
    *(_DWORD *)buf = 136315394;
    v42 = "-[CKVTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:dispatchQoS:settings:]";
    v43 = 2112;
    v44 = v30;
    v31 = "%s Manager name must be nonempty. Received: %@";
LABEL_10:
    _os_log_error_impl(&dword_1A48B3000, v29, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
    goto LABEL_17;
  }
  atomic_store(0, &v14->_eventIdCounter);
  v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  taskRegistry = v14->_taskRegistry;
  v14->_taskRegistry = v17;

  transaction = v14->_transaction;
  v14->_transaction = 0;

  v14->_transactionCounter = 0;
  v14->_coalescenceInterval = a4;
  if (a4 <= 0.0)
  {
    v32 = (void *)CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v33 = (void *)MEMORY[0x1E0CB37E8];
    v34 = v32;
    objc_msgSend(v33, "numberWithDouble:", a4);
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v42 = "-[CKVTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:dispatchQoS:settings:]";
    v43 = 2112;
    v44 = v35;
    v36 = "%s Coalescence interval must be greater than 0. Received: %@";
LABEL_15:
    _os_log_error_impl(&dword_1A48B3000, v34, OS_LOG_TYPE_ERROR, v36, buf, 0x16u);

    goto LABEL_17;
  }
  v14->_coalescenceDelay = a5;
  if (a5 <= 0.0)
  {
    v37 = (void *)CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v38 = (void *)MEMORY[0x1E0CB37E8];
    v34 = v37;
    objc_msgSend(v38, "numberWithDouble:", a5);
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v42 = "-[CKVTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:dispatchQoS:settings:]";
    v43 = 2112;
    v44 = v35;
    v36 = "%s Coalescence delay must be greater than 0. Received: %@";
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v14->_settings, a7);
  if (!v14->_settings)
  {
    v29 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136315394;
    v42 = "-[CKVTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:dispatchQoS:settings:]";
    v43 = 2112;
    v44 = 0;
    v31 = "%s invalid settings: %@";
    goto LABEL_10;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v20, (dispatch_qos_class_t)a6, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = dispatch_queue_create("taskRegistryQueue", v21);
  taskRegistryQueue = v14->_taskRegistryQueue;
  v14->_taskRegistryQueue = (OS_dispatch_queue *)v22;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v24 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v24, (dispatch_qos_class_t)a6, 0);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = dispatch_queue_create("taskExecutionQueue", v25);
  taskExecutionQueue = v14->_taskExecutionQueue;
  v14->_taskExecutionQueue = (OS_dispatch_queue *)v26;

LABEL_7:
  v28 = v14;
LABEL_18:

  return v28;
}

- (void)submitTaskWithId:(unsigned __int16)a3 taskBlock:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int *p_eventIdCounter;
  unsigned int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *taskRegistryQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSString *managerName;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD aBlock[5];
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  NSString *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v6 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[CKVTaskCoalescer _beginTransaction](self, "_beginTransaction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  p_eventIdCounter = &self->_eventIdCounter;
  do
    v13 = __ldaxr(p_eventIdCounter);
  while (__stlxr(v13 + 1, p_eventIdCounter));
  objc_msgSend(v11, "numberWithUnsignedInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
  {
    managerName = self->_managerName;
    *(_DWORD *)buf = 136315906;
    v36 = "-[CKVTaskCoalescer submitTaskWithId:taskBlock:completion:]";
    v37 = 2112;
    v38 = managerName;
    v39 = 2112;
    v40 = v10;
    v41 = 2112;
    v42 = v14;
    _os_log_debug_impl(&dword_1A48B3000, v15, OS_LOG_TYPE_DEBUG, "%s (%@) Received task with taskId: %@ and eventId: %@", buf, 0x2Au);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CKVTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke;
  aBlock[3] = &unk_1E4D29500;
  aBlock[4] = self;
  v34 = v9;
  v18 = v9;
  v19 = _Block_copy(aBlock);
  taskRegistryQueue = self->_taskRegistryQueue;
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __58__CKVTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_2;
  v27[3] = &unk_1E4D28FD8;
  v27[4] = self;
  v28 = v10;
  v29 = v14;
  v30 = v16;
  v31 = v19;
  v32 = v8;
  v21 = v8;
  v22 = v16;
  v23 = v19;
  v24 = v14;
  v25 = v10;
  dispatch_async(taskRegistryQueue, v27);

}

- (void)_endTransaction
{
  CKVTaskCoalescer *v2;
  int v3;
  NSObject *v4;
  OS_os_transaction *v5;
  NSString *managerName;
  OS_os_transaction *transaction;
  int v8;
  const char *v9;
  __int16 v10;
  NSString *v11;
  __int16 v12;
  OS_os_transaction *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_transactionCounter - 1;
  v2->_transactionCounter = v3;
  if (!v3)
  {
    v4 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
    {
      managerName = v2->_managerName;
      transaction = v2->_transaction;
      v8 = 136315650;
      v9 = "-[CKVTaskCoalescer _endTransaction]";
      v10 = 2112;
      v11 = managerName;
      v12 = 2112;
      v13 = transaction;
      _os_log_debug_impl(&dword_1A48B3000, v4, OS_LOG_TYPE_DEBUG, "%s (%@) Releasing OS transaction: %@", (uint8_t *)&v8, 0x20u);
    }
    v5 = v2->_transaction;
    v2->_transaction = 0;

  }
  objc_sync_exit(v2);

}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_taskExecutionQueue, 0);
  objc_storeStrong((id *)&self->_taskRegistryQueue, 0);
  objc_storeStrong((id *)&self->_taskRegistry, 0);
  objc_storeStrong((id *)&self->_managerName, 0);
}

uint64_t __58__CKVTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_endTransaction");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __58__CKVTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  CKVCoalescedTask *v4;
  uint64_t v5;
  CKVCoalescedTask *v6;
  void *v7;
  void *v8;
  char v9;
  CKVCoalescedTask *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  NSObject *v16;
  CKVCoalescedTask *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  CKVCoalescedTask *v21;
  uint64_t v22;
  CKVCoalescedTask *v23;
  uint64_t v24;
  _QWORD block[4];
  CKVCoalescedTask *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  CKVCoalescedTask *v32;
  __int16 v33;
  CKVCoalescedTask *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isTaskCoalescenceDisabled");
  if (v2)
  {
    v3 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v4 = *(CKVCoalescedTask **)(a1 + 40);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(CKVCoalescedTask **)(a1 + 48);
      *(_DWORD *)buf = 136315906;
      v28 = "-[CKVTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke_2";
      v29 = 2112;
      v30 = v5;
      v31 = 2112;
      v32 = v4;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1A48B3000, v3, OS_LOG_TYPE_INFO, "%s (%@) Task coalescence is currently disabled (taskId: %@ eventId: %@)", buf, 0x2Au);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v2;
  else
    v9 = 1;
  if ((v9 & 1) != 0 || (objc_msgSend(v7, "isExecuted") & 1) != 0)
  {
    v10 = -[CKVCoalescedTask initWithTaskId:eventId:date:taskBlock:completionQueue:completion:]([CKVCoalescedTask alloc], "initWithTaskId:eventId:date:taskBlock:completionQueue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v10, *(_QWORD *)(a1 + 40));
    if ((v9 & 1) != 0
      || !objc_msgSend(*(id *)(a1 + 32), "_didIncomingTask:arriveInCoalescingWindowWithLastTask:", v10, v8))
    {
      v18 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
      {
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 136315650;
        v28 = "-[CKVTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke";
        v29 = 2112;
        v30 = v24;
        v31 = 2112;
        v32 = v10;
        _os_log_debug_impl(&dword_1A48B3000, v18, OS_LOG_TYPE_DEBUG, "%s (%@) Enqueueing incoming task for execution - %@", buf, 0x20u);
      }
      v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__CKVTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_38;
      block[3] = &unk_1E4D294D8;
      v26 = v10;
      dispatch_async(v19, block);

    }
    else
    {
      v11 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(v12 + 8);
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = *(double *)(v12 + 48);
        v16 = v11;
        objc_msgSend(v14, "numberWithDouble:", v15);
        v17 = (CKVCoalescedTask *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v28 = "-[CKVTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke";
        v29 = 2112;
        v30 = v13;
        v31 = 2112;
        v32 = v17;
        v33 = 2112;
        v34 = v10;
        _os_log_impl(&dword_1A48B3000, v16, OS_LOG_TYPE_INFO, "%s (%@) Delaying %@s before executing incoming task within coalescing window - (%@)", buf, 0x2Au);

      }
      -[CKVCoalescedTask executeAfterDelay:onQueue:](v10, "executeAfterDelay:onQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(double *)(*(_QWORD *)(a1 + 32) + 48));
    }

  }
  else
  {
    v20 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v21 = *(CKVCoalescedTask **)(a1 + 40);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v23 = *(CKVCoalescedTask **)(a1 + 48);
      *(_DWORD *)buf = 136316162;
      v28 = "-[CKVTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke";
      v29 = 2112;
      v30 = v22;
      v31 = 2112;
      v32 = v21;
      v33 = 2112;
      v34 = v23;
      v35 = 2112;
      v36 = v8;
      _os_log_impl(&dword_1A48B3000, v20, OS_LOG_TYPE_INFO, "%s (%@) Dropping incoming task (taskId: %@ eventId: %@) as a task with the same taskId is already enqueued and has not been executed: (%@)", buf, 0x34u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __58__CKVTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "execute");
}

@end
