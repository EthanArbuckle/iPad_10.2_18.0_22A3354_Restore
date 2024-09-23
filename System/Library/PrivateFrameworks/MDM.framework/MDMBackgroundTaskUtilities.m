@implementation MDMBackgroundTaskUtilities

+ (void)scheduleOneShotBackgroundTask:(id)a3 usingQueue:(id)a4 interval:(double)a5 gracePeriod:(double)a6 callback:(id)a7
{
  __CFString *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  char v24;
  __CFString *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint32_t v30;
  const __CFString *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v11 = (__CFString *)a3;
  v12 = a7;
  v13 = (void *)MEMORY[0x24BE0B728];
  v14 = a4;
  objc_msgSend(v13, "sharedScheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __101__MDMBackgroundTaskUtilities_scheduleOneShotBackgroundTask_usingQueue_interval_gracePeriod_callback___block_invoke;
  v33[3] = &unk_24EB680D0;
  v16 = v12;
  v34 = v16;
  v17 = objc_msgSend(v15, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v11, v14, v33);

  if ((v17 & 1) == 0)
  {
    v18 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v11;
      _os_log_impl(&dword_222CB9000, v18, OS_LOG_TYPE_ERROR, "DMCBackgroundActivityManager: Failed to register for task with name: %{public}@", buf, 0xCu);
    }
  }
  objc_msgSend(MEMORY[0x24BE0B728], "sharedScheduler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "taskRequestForIdentifier:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B710]), "initWithIdentifier:", v11);
    objc_msgSend(v22, "setRequiresNetworkConnectivity:", 1);
    objc_msgSend(v22, "setRequiresExternalPower:", 0);
    objc_msgSend(v22, "setScheduleAfter:", a5);
    objc_msgSend(v22, "setTrySchedulingBefore:", a5 + a6);
    objc_msgSend(MEMORY[0x24BE0B728], "sharedScheduler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v24 = objc_msgSend(v23, "submitTaskRequest:error:", v22, &v32);
    v25 = (__CFString *)v32;

    v26 = *(NSObject **)(DMCLogObjects() + 8);
    if ((v24 & 1) != 0)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v27 = "DMCBackgroundActivityManager: request submmited";
        v28 = v26;
        v29 = OS_LOG_TYPE_INFO;
        v30 = 2;
LABEL_14:
        _os_log_impl(&dword_222CB9000, v28, v29, v27, buf, v30);
      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v31 = CFSTR("Unknown");
      if (v25)
        v31 = v25;
      *(_DWORD *)buf = 138412290;
      v36 = v31;
      v27 = "DMCBackgroundActivityManager: Failed to submit task with error: %@";
      v28 = v26;
      v29 = OS_LOG_TYPE_ERROR;
      v30 = 12;
      goto LABEL_14;
    }

    goto LABEL_16;
  }
  v21 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v21, OS_LOG_TYPE_INFO, "DMCBackgroundActivityManager: Task has been submitted. Abort...", buf, 2u);
  }
LABEL_16:

}

void __101__MDMBackgroundTaskUtilities_scheduleOneShotBackgroundTask_usingQueue_interval_gracePeriod_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_INFO, "DMCBackgroundActivityManager: launchHandler called!", v5, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v3, "setTaskCompleted");

}

+ (void)cancelBackgroundTask:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE0B728], "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v4, "cancelTaskRequestWithIdentifier:error:", v3, &v7);
  v5 = v7;

  if (v5)
  {
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v9 = v3;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_ERROR, "DMCBackgroundActivityManager: Failed to cancel task (%{public}@) with error: %{public}@", buf, 0x16u);
    }
  }

}

@end
