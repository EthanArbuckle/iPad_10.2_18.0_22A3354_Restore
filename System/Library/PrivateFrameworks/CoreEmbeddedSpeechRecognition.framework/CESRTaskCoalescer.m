@implementation CESRTaskCoalescer

- (CESRTaskCoalescer)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CESRTaskCoalescer)initWithManagerName:(id)a3 coalescenceInterval:(double)a4 coalescenceDelay:(double)a5 executionQueue:(id)a6
{
  id v10;
  id v11;
  CESRTaskCoalescer *v12;
  uint64_t v13;
  NSString *managerName;
  NSMutableDictionary *v15;
  NSMutableDictionary *taskRegistry;
  OS_os_transaction *transaction;
  NSObject *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *taskRegistryQueue;
  CESRTaskCoalescer *v22;
  NSObject *v23;
  NSString *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSString *v28;
  const char *v29;
  void *v30;
  void *v32;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  NSString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v33.receiver = self;
  v33.super_class = (Class)CESRTaskCoalescer;
  v12 = -[CESRTaskCoalescer init](&v33, sel_init);
  if (!v12)
    goto LABEL_6;
  v13 = objc_msgSend(v10, "copy");
  managerName = v12->_managerName;
  v12->_managerName = (NSString *)v13;

  if (!-[NSString length](v12->_managerName, "length"))
  {
    v23 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v24 = v12->_managerName;
      *(_DWORD *)buf = 136315394;
      v35 = "-[CESRTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:executionQueue:]";
      v36 = 2112;
      v37 = v24;
      _os_log_error_impl(&dword_1B3E5F000, v23, OS_LOG_TYPE_ERROR, "%s Manager name must be nonempty. Received: %@", buf, 0x16u);
    }
    goto LABEL_12;
  }
  atomic_store(0, &v12->_eventIdCounter);
  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  taskRegistry = v12->_taskRegistry;
  v12->_taskRegistry = v15;

  transaction = v12->_transaction;
  v12->_transaction = 0;

  v12->_transactionCounter = 0;
  v12->_coalescenceInterval = a4;
  if (a4 <= 0.0)
  {
    v25 = (void *)*MEMORY[0x1E0CFE6C0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v22 = 0;
      goto LABEL_13;
    }
    v26 = (void *)MEMORY[0x1E0CB37E8];
    v27 = v25;
    objc_msgSend(v26, "numberWithDouble:", a4);
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v35 = "-[CESRTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:executionQueue:]";
    v36 = 2112;
    v37 = v28;
    v29 = "%s Coalescence interval must be greater than 0. Received: %@";
LABEL_15:
    _os_log_error_impl(&dword_1B3E5F000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0x16u);

    goto LABEL_12;
  }
  v12->_coalescenceDelay = a5;
  if (a5 <= 0.0)
  {
    v30 = (void *)*MEMORY[0x1E0CFE6C0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v32 = (void *)MEMORY[0x1E0CB37E8];
    v27 = v30;
    objc_msgSend(v32, "numberWithDouble:", a5);
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v35 = "-[CESRTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:executionQueue:]";
    v36 = 2112;
    v37 = v28;
    v29 = "%s Coalescence delay must be greater than 0. Received: %@";
    goto LABEL_15;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_DEFAULT, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = dispatch_queue_create("taskRegistryQueue", v19);
  taskRegistryQueue = v12->_taskRegistryQueue;
  v12->_taskRegistryQueue = (OS_dispatch_queue *)v20;

  objc_storeStrong((id *)&v12->_taskExecutionQueue, a6);
LABEL_6:
  v22 = v12;
LABEL_13:

  return v22;
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
  -[CESRTaskCoalescer _beginTransaction](self, "_beginTransaction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  p_eventIdCounter = &self->_eventIdCounter;
  do
    v13 = __ldaxr(p_eventIdCounter);
  while (__stlxr(v13 + 1, p_eventIdCounter));
  objc_msgSend(v11, "numberWithUnsignedInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
  {
    managerName = self->_managerName;
    *(_DWORD *)buf = 136315906;
    v36 = "-[CESRTaskCoalescer submitTaskWithId:taskBlock:completion:]";
    v37 = 2112;
    v38 = managerName;
    v39 = 2112;
    v40 = v10;
    v41 = 2112;
    v42 = v14;
    _os_log_debug_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_DEBUG, "%s (%@) Received task with taskId: %@ and eventId: %@", buf, 0x2Au);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__CESRTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke;
  aBlock[3] = &unk_1E67348F0;
  aBlock[4] = self;
  v34 = v9;
  v18 = v9;
  v19 = _Block_copy(aBlock);
  taskRegistryQueue = self->_taskRegistryQueue;
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __59__CESRTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_2;
  v27[3] = &unk_1E6733BE0;
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

- (void)wait
{
  dispatch_sync((dispatch_queue_t)self->_taskRegistryQueue, &__block_literal_global_237);
  dispatch_sync((dispatch_queue_t)self->_taskExecutionQueue, &__block_literal_global_49);
}

- (void)_beginTransaction
{
  CESRTaskCoalescer *v2;
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

    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      managerName = v2->_managerName;
      v8 = v2->_transaction;
      v9 = 136315650;
      v10 = "-[CESRTaskCoalescer _beginTransaction]";
      v11 = 2112;
      v12 = managerName;
      v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_DEBUG, "%s (%@) Acquired OS transaction: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  objc_sync_exit(v2);

}

- (void)_endTransaction
{
  CESRTaskCoalescer *v2;
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
    v4 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      managerName = v2->_managerName;
      transaction = v2->_transaction;
      v8 = 136315650;
      v9 = "-[CESRTaskCoalescer _endTransaction]";
      v10 = 2112;
      v11 = managerName;
      v12 = 2112;
      v13 = transaction;
      _os_log_debug_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_DEBUG, "%s (%@) Releasing OS transaction: %@", (uint8_t *)&v8, 0x20u);
    }
    v5 = v2->_transaction;
    v2->_transaction = 0;

  }
  objc_sync_exit(v2);

}

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

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_taskExecutionQueue, 0);
  objc_storeStrong((id *)&self->_taskRegistryQueue, 0);
  objc_storeStrong((id *)&self->_taskRegistry, 0);
  objc_storeStrong((id *)&self->_managerName, 0);
}

uint64_t __59__CESRTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_endTransaction");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __59__CESRTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_2(uint64_t a1)
{
  _BOOL4 v2;
  NSObject *v3;
  CESRCoalescedTask *v4;
  uint64_t v5;
  CESRCoalescedTask *v6;
  void *v7;
  void *v8;
  char v9;
  CESRCoalescedTask *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  NSObject *v16;
  CESRCoalescedTask *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  CESRCoalescedTask *v21;
  uint64_t v22;
  CESRCoalescedTask *v23;
  uint64_t v24;
  _QWORD block[4];
  CESRCoalescedTask *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  CESRCoalescedTask *v32;
  __int16 v33;
  CESRCoalescedTask *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = +[CESRTaskCoalescer isTaskCoalescenceDisabled](CESRTaskCoalescer, "isTaskCoalescenceDisabled");
  if (v2)
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v4 = *(CESRCoalescedTask **)(a1 + 40);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(CESRCoalescedTask **)(a1 + 48);
      *(_DWORD *)buf = 136315906;
      v28 = "-[CESRTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke_2";
      v29 = 2112;
      v30 = v5;
      v31 = 2112;
      v32 = v4;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, "%s (%@) Task coalescence is currently disabled (taskId: %@ eventId: %@)", buf, 0x2Au);
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
    v10 = -[CESRCoalescedTask initWithTaskId:eventId:date:taskBlock:completionQueue:completion:]([CESRCoalescedTask alloc], "initWithTaskId:eventId:date:taskBlock:completionQueue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v10, *(_QWORD *)(a1 + 40));
    if ((v9 & 1) != 0
      || !objc_msgSend(*(id *)(a1 + 32), "_didIncomingTask:arriveInCoalescingWindowWithLastTask:", v10, v8))
    {
      v18 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
      {
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 136315650;
        v28 = "-[CESRTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke";
        v29 = 2112;
        v30 = v24;
        v31 = 2112;
        v32 = v10;
        _os_log_debug_impl(&dword_1B3E5F000, v18, OS_LOG_TYPE_DEBUG, "%s (%@) Enqueueing incoming task for execution - %@", buf, 0x20u);
      }
      v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__CESRTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_48;
      block[3] = &unk_1E6734990;
      v26 = v10;
      dispatch_async(v19, block);

    }
    else
    {
      v11 = (void *)*MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(v12 + 8);
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = *(double *)(v12 + 48);
        v16 = v11;
        objc_msgSend(v14, "numberWithDouble:", v15);
        v17 = (CESRCoalescedTask *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v28 = "-[CESRTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke";
        v29 = 2112;
        v30 = v13;
        v31 = 2112;
        v32 = v17;
        v33 = 2112;
        v34 = v10;
        _os_log_impl(&dword_1B3E5F000, v16, OS_LOG_TYPE_INFO, "%s (%@) Delaying %@s before executing incoming task within coalescing window - (%@)", buf, 0x2Au);

      }
      -[CESRCoalescedTask executeAfterDelay:onQueue:](v10, "executeAfterDelay:onQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(double *)(*(_QWORD *)(a1 + 32) + 48));
    }

  }
  else
  {
    v20 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v21 = *(CESRCoalescedTask **)(a1 + 40);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v23 = *(CESRCoalescedTask **)(a1 + 48);
      *(_DWORD *)buf = 136316162;
      v28 = "-[CESRTaskCoalescer submitTaskWithId:taskBlock:completion:]_block_invoke";
      v29 = 2112;
      v30 = v22;
      v31 = 2112;
      v32 = v21;
      v33 = 2112;
      v34 = v23;
      v35 = 2112;
      v36 = v8;
      _os_log_impl(&dword_1B3E5F000, v20, OS_LOG_TYPE_INFO, "%s (%@) Dropping incoming task (taskId: %@ eventId: %@) as a task with the same taskId is already enqueued and has not been executed: (%@)", buf, 0x34u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __59__CESRTaskCoalescer_submitTaskWithId_taskBlock_completion___block_invoke_48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "execute");
}

+ (BOOL)isTaskCoalescenceDisabled
{
  char v2;
  void *v3;
  void *v4;

  if (+[CESRUtilities isCustomerInstall](CESRUtilities, "isCustomerInstall"))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Disable Coalescence"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v4, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

+ (void)setTaskCoalescenceDisabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("Enabling");
    if (v3)
      v5 = CFSTR("Disabling");
    v8 = 136315394;
    v9 = "+[CESRTaskCoalescer setTaskCoalescenceDisabled:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s %@ task coalescence.", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("Disable Coalescence"));

}

@end
