@implementation KSTaskScheduler

void __34___KSTaskScheduler_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance__sharedManager;
  sharedInstance__sharedManager = v0;

}

void __33___KSTaskScheduler_registerTask___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  _xpc_activity_s *v13;
  id v14;
  _BYTE *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  _BYTE v22[24];
  BOOL v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2)
    {
      *(_QWORD *)v22 = 0;
      *(_QWORD *)&v22[8] = v22;
      *(_QWORD *)&v22[16] = 0x2020000000;
      v23 = 0;
      v23 = xpc_activity_set_state(v3, 4);
      KSCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(unsigned __int8 *)(*(_QWORD *)&v22[8] + 24);
        *(_DWORD *)buf = 136315650;
        v17 = "-[_KSTaskScheduler registerTask:]_block_invoke";
        v18 = 2112;
        v19 = v6;
        v20 = 1024;
        v21 = v7;
        _os_log_impl(&dword_21DFEB000, v5, OS_LOG_TYPE_INFO, "%s  Running activity %@, extended=%d", buf, 0x1Cu);

      }
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __33___KSTaskScheduler_registerTask___block_invoke_63;
      block[3] = &unk_24E2047B8;
      v13 = v3;
      v14 = *(id *)(a1 + 32);
      v15 = v22;
      dispatch_async(v8, block);

      _Block_object_dispose(v22, 8);
    }
  }
  else
  {
    KSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 136315394;
      *(_QWORD *)&v22[4] = "-[_KSTaskScheduler registerTask:]_block_invoke";
      *(_WORD *)&v22[12] = 2112;
      *(_QWORD *)&v22[14] = v10;
      _os_log_impl(&dword_21DFEB000, v9, OS_LOG_TYPE_INFO, "%s  Checking-in activity %@", v22, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "executionCriteria");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_activity_set_criteria(v3, v11);

  }
}

void __33___KSTaskScheduler_registerTask___block_invoke_63(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  double v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  _QWORD v14[4];
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  getpid();
  proc_set_cpumon_params();
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3);
    KSCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "name");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v17 = "-[_KSTaskScheduler registerTask:]_block_invoke";
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  xpc activity should be deffered, deffering %@", buf, 0x16u);

    }
  }
  else
  {
    v4 = dispatch_semaphore_create(0);
    v5 = (void *)os_transaction_create();
    v6 = (void *)MEMORY[0x2207A8B6C]();
    objc_msgSend(*(id *)(a1 + 40), "handler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __33___KSTaskScheduler_registerTask___block_invoke_65;
    v14[3] = &unk_24E204790;
    v2 = v4;
    v15 = v2;
    ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v14);

    objc_msgSend(*(id *)(a1 + 40), "maxRunTime");
    v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    if (dispatch_semaphore_wait(v2, v9))
    {
      KSCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __33___KSTaskScheduler_registerTask___block_invoke_63_cold_1(v10);

    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
      KSCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 40), "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        *(_DWORD *)buf = 136315650;
        v17 = "-[_KSTaskScheduler registerTask:]_block_invoke";
        v18 = 2112;
        v19 = v12;
        v20 = 1024;
        v21 = v13;
        _os_log_impl(&dword_21DFEB000, v11, OS_LOG_TYPE_INFO, "%s  Done running activity %@, extended=%d", buf, 0x1Cu);

      }
    }

    objc_autoreleasePoolPop(v6);
    getpid();
    proc_set_cpumon_defaults();
  }

}

intptr_t __33___KSTaskScheduler_registerTask___block_invoke_65(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __33___KSTaskScheduler_registerTask___block_invoke_63_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[_KSTaskScheduler registerTask:]_block_invoke_2";
  _os_log_error_impl(&dword_21DFEB000, log, OS_LOG_TYPE_ERROR, "%s  Scheduled sync task timed out", (uint8_t *)&v1, 0xCu);
}

@end
