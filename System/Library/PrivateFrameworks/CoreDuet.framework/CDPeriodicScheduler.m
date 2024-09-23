@implementation CDPeriodicScheduler

void __38___CDPeriodicScheduler_sharedInstance__block_invoke()
{
  _CDPeriodicScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(_CDPeriodicScheduler);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

void __36___CDPeriodicScheduler_registerJob___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id *v4;
  void *v5;
  void *v6;
  xpc_activity_state_t state;
  id v8;
  _xpc_activity_s *v9;
  _xpc_activity_s *v10;
  BOOL v11;
  _xpc_activity_s *v12;
  _BOOL4 should_defer;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  __int128 buf;
  uint64_t (*v39)(uint64_t);
  void *v40;
  id v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 32);
  objc_msgSend(v5, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*v4, "setActivity:", v3);
  state = xpc_activity_get_state(v3);
  if (!state)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __36___CDPeriodicScheduler_registerJob___block_invoke_cold_3((uint64_t)v4);
    v8 = xpc_activity_copy_criteria(v3);
    if (v8)
    {
      objc_msgSend(*v4, "executionCriteria");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = xpc_equal(v8, v16);

      if (v17)
        goto LABEL_27;
    }
    objc_msgSend(*v4, "executionCriteria");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_activity_set_criteria(v3, v15);
    goto LABEL_16;
  }
  if (state == 2)
  {
    objc_msgSend(*v4, "handler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v4, "activity");
    v9 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v8)
    {
      xpc_activity_set_completion_status();

      goto LABEL_27;
    }
    v11 = xpc_activity_set_state(v9, 4);

    if (!v11)
    {
      objc_msgSend(*v4, "activity");
      v12 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
      should_defer = xpc_activity_should_defer(v12);

      if (should_defer)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*v4, "jobName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v14;
          _os_log_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Warning: deferring activity '%@' before it started", (uint8_t *)&buf, 0xCu);

        }
        objc_msgSend(*v4, "activity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_activity_set_state((xpc_activity_t)v15, 3);
LABEL_16:

LABEL_27:
        goto LABEL_28;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        __36___CDPeriodicScheduler_registerJob___block_invoke_cold_2((uint64_t)v4);
      objc_msgSend(*v4, "activity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_activity_set_completion_status();

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __36___CDPeriodicScheduler_registerJob___block_invoke_cold_1((uint64_t)v4);
    v19 = MEMORY[0x1E0C809B0];
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __36___CDPeriodicScheduler_registerJob___block_invoke_60;
    v35 = &unk_1E26E3380;
    v8 = v8;
    v37 = v8;
    v36 = *v4;
    v20 = (void *)MEMORY[0x193FEEAF4](&v32);
    objc_msgSend(*v4, "queue", v32, v33, v34, v35);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _CDPeriodicSchedulerDefaultQueueName);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", dispatch_queue_get_label(v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqualToString:", v23);

    if (v24)
    {
      v25 = v20;
      v26 = v21;
      v27 = (void *)os_transaction_create();
      *(_QWORD *)&buf = v19;
      *((_QWORD *)&buf + 1) = 3221225472;
      v39 = __cd_dispatch_async_capture_tx_block_invoke_1;
      v40 = &unk_1E26E3380;
      v41 = v27;
      v42 = v25;
      v28 = v25;
      v29 = v27;
      dispatch_async(v26, &buf);

    }
    else
    {
      v30 = v21;
      v31 = v20;
      v29 = (id)os_transaction_create();
      dispatch_sync(v30, v31);

    }
    goto LABEL_27;
  }
LABEL_28:

}

void __36___CDPeriodicScheduler_registerJob___block_invoke_60(uint64_t a1)
{
  id *v2;
  void *v3;
  _xpc_activity_s *v4;
  xpc_activity_state_t state;
  _xpc_activity_s *v6;

  getpid();
  proc_set_cpumon_params();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  getpid();
  proc_set_cpumon_defaults();
  v3 = *(void **)(a1 + 32);
  v2 = (id *)(a1 + 32);
  if ((objc_msgSend(v3, "isHandlerAsynchronous") & 1) == 0)
  {
    objc_msgSend(*v2, "activity");
    v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
    state = xpc_activity_get_state(v4);

    if (state == 3)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        __36___CDPeriodicScheduler_registerJob___block_invoke_60_cold_1((uint64_t)v2);
    }
    else
    {
      objc_msgSend(*v2, "activity");
      v6 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
      xpc_activity_set_state(v6, 5);

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        __36___CDPeriodicScheduler_registerJob___block_invoke_60_cold_2((uint64_t)v2);
    }
  }
}

void __36___CDPeriodicScheduler_registerJob___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_3(a1), "jobName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v2, "Running activity %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __36___CDPeriodicScheduler_registerJob___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint8_t v2[24];

  objc_msgSend((id)OUTLINED_FUNCTION_3_3(a1), "jobName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Failed to set activity '%@' state to continue", v2, 0xCu);

  OUTLINED_FUNCTION_1();
}

void __36___CDPeriodicScheduler_registerJob___block_invoke_cold_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_3(a1), "jobName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v2, "Checking-in activity %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __36___CDPeriodicScheduler_registerJob___block_invoke_60_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_3(a1), "jobName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v2, "Deferring activity %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __36___CDPeriodicScheduler_registerJob___block_invoke_60_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_3(a1), "jobName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v2, "Done running activity %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

@end
