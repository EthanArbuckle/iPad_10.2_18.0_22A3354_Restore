@implementation CESRCoalescedTask

- (CESRCoalescedTask)initWithTaskId:(id)a3 eventId:(id)a4 date:(id)a5 taskBlock:(id)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CESRCoalescedTask *v20;
  CESRCoalescedTask *v21;
  uint64_t v22;
  id runBlock;
  id v25;
  objc_super v26;

  v25 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)CESRCoalescedTask;
  v20 = -[CESRCoalescedTask init](&v26, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_taskId, a3);
    objc_storeStrong((id *)&v21->_eventId, a4);
    objc_storeStrong((id *)&v21->_date, a5);
    -[CESRCoalescedTask _runBlockForTask:completionQueue:completion:](v21, "_runBlockForTask:completionQueue:completion:", v17, v18, v19);
    v22 = objc_claimAutoreleasedReturnValue();
    runBlock = v21->_runBlock;
    v21->_runBlock = (id)v22;

    atomic_store(0, (unsigned __int8 *)&v21->_executed);
  }

  return v21;
}

- (id)description
{
  void *v2;
  NSNumber *taskId;
  NSNumber *eventId;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  taskId = self->_taskId;
  eventId = self->_eventId;
  CESRISO8601StringForDate(self->_date);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("taskId: %@, eventId: %@, received: %@"), taskId, eventId, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_runBlockForTask:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  _QWORD block[4];
  id v22;
  id v23;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[CESRCoalescedTask description](self, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CESRCoalescedTask__runBlockForTask_completionQueue_completion___block_invoke;
  block[3] = &unk_1E67348F0;
  v22 = v11;
  v23 = v8;
  v13 = v8;
  v14 = v11;
  v15 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __65__CESRCoalescedTask__runBlockForTask_completionQueue_completion___block_invoke_4;
  v19[3] = &unk_1E67348F0;
  v19[4] = self;
  v20 = v9;
  v16 = v9;
  dispatch_block_notify(v15, v10, v19);

  v17 = _Block_copy(v15);
  return v17;
}

- (void)execute
{
  atomic_store(1u, (unsigned __int8 *)&self->_executed);
  (*((void (**)(void))self->_runBlock + 2))();
}

- (void)executeAfterDelay:(double)a3 onQueue:(id)a4
{
  int64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD block[5];

  v5 = (uint64_t)(a3 * 1000000000.0);
  v6 = a4;
  v7 = dispatch_time(0, v5);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CESRCoalescedTask_executeAfterDelay_onQueue___block_invoke;
  block[3] = &unk_1E6734990;
  block[4] = self;
  dispatch_after(v7, v6, block);

}

- (BOOL)isExecuted
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_executed);
  return v2 & 1;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong(&self->_runBlock, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
}

uint64_t __47__CESRCoalescedTask_executeAfterDelay_onQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "execute");
}

void __65__CESRCoalescedTask__runBlockForTask_completionQueue_completion___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 136315394;
    v8 = "-[CESRCoalescedTask _runBlockForTask:completionQueue:completion:]_block_invoke";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, "%s Executing task - (%@)", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 136315394;
    v8 = "-[CESRCoalescedTask _runBlockForTask:completionQueue:completion:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1B3E5F000, v5, OS_LOG_TYPE_INFO, "%s Finished executing task - (%@)", (uint8_t *)&v7, 0x16u);
  }
}

uint64_t __65__CESRCoalescedTask__runBlockForTask_completionQueue_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
