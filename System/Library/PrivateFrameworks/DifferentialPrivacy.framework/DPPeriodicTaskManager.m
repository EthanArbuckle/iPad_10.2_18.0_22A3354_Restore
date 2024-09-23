@implementation DPPeriodicTaskManager

void __39___DPPeriodicTaskManager_registerTask___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  xpc_object_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _xpc_activity_s *v23;
  __int128 *v24;
  uint64_t v25;
  _QWORD v26[3];
  _QWORD v27[3];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  int v31;
  __int128 v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2)
    {
      *(_QWORD *)&v32 = 0;
      *((_QWORD *)&v32 + 1) = &v32;
      v33 = 0x2020000000;
      v34 = 0;
      v34 = xpc_activity_set_state(v3, 4);
      +[_DPLog framework](_DPLog, "framework");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(unsigned __int8 *)(*((_QWORD *)&v32 + 1) + 24);
        *(_DWORD *)buf = 138412546;
        v29 = v6;
        v30 = 1024;
        v31 = v7;
        _os_log_impl(&dword_1D3FAA000, v5, OS_LOG_TYPE_INFO, "Running activity %@, extended=%d", buf, 0x12u);

      }
      +[_DPCoreAnalyticsCollector sharedInstance](_DPCoreAnalyticsCollector, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = &unk_1E96FB058;
      v26[0] = CFSTR("duration");
      v26[1] = CFSTR("activityName");
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = CFSTR("activityState");
      v27[1] = v9;
      v27[2] = &unk_1E96FB070;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reportMetricsForEvent:withMetrics:", CFSTR("com.apple.DifferentialPrivacy.MaintenanceActivity"), v10);

      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "systemUptime");
      v13 = v12;

      objc_msgSend(*(id *)(a1 + 32), "queue");
      v14 = objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __39___DPPeriodicTaskManager_registerTask___block_invoke_48;
      v21[3] = &unk_1E95D9538;
      v22 = *(id *)(a1 + 32);
      v23 = v3;
      v24 = &v32;
      v25 = v13;
      dispatch_async(v14, v21);

      _Block_object_dispose(&v32, 8);
    }
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v32) = 138412290;
      *(_QWORD *)((char *)&v32 + 4) = v16;
      _os_log_impl(&dword_1D3FAA000, v15, OS_LOG_TYPE_INFO, "Checking-in activity %@", (uint8_t *)&v32, 0xCu);

    }
    v17 = xpc_activity_copy_criteria(v3);
    if (!v17
      || (objc_msgSend(*(id *)(a1 + 32), "executionCriteria"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = xpc_equal(v17, v18),
          v18,
          !v19))
    {
      objc_msgSend(*(id *)(a1 + 32), "executionCriteria");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_activity_set_criteria(v3, v20);

    }
  }

}

void __39___DPPeriodicTaskManager_registerTask___block_invoke_48(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[3];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  getpid();
  proc_set_cpumon_params();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "UTF8String");
  v3 = (void *)os_transaction_create();

  v4 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(*(id *)(a1 + 32), "handler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[2](v5, *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v4);
  getpid();
  proc_set_cpumon_defaults();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5);
    +[_DPLog framework](_DPLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 1024;
      v21 = v8;
      _os_log_impl(&dword_1D3FAA000, v6, OS_LOG_TYPE_INFO, "Done running activity %@, extended=%d", buf, 0x12u);

    }
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemUptime");
    v11 = v10;

    +[_DPCoreAnalyticsCollector sharedInstance](_DPCoreAnalyticsCollector, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 - *(double *)(a1 + 56), CFSTR("duration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    v16[1] = CFSTR("activityName");
    objc_msgSend(*(id *)(a1 + 32), "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = CFSTR("activityState");
    v17[1] = v14;
    v17[2] = &unk_1E96FB088;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportMetricsForEvent:withMetrics:", CFSTR("com.apple.DifferentialPrivacy.MaintenanceActivity"), v15);

  }
}

@end
