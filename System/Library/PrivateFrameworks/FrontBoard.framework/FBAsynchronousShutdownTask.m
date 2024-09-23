@implementation FBAsynchronousShutdownTask

+ (void)waitForTasks
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_7(&dword_1A359A000, a2, v4, "Shutdown tasks timed out: %{public}@. Shutting down now.", (uint8_t *)&v5);

}

id __42__FBAsynchronousShutdownTask_waitForTasks__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(id *)(a2 + 8);
}

+ (void)startTaskWithName:(id)a3 timeout:(double)a4 workItem:(id)a5
{
  id v7;
  void *v8;
  FBAsynchronousShutdownTask *v9;
  NSObject *v10;
  NSString *name;
  dispatch_group_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  FBAsynchronousShutdownTask *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *SerialWithQoS;
  id v24;
  id v25;
  id v26;
  FBAsynchronousShutdownTask *v27;
  NSObject *v28;
  id v29;
  _QWORD block[4];
  id v31;
  FBAsynchronousShutdownTask *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  FBAsynchronousShutdownTask *v38;
  NSObject *v39;
  uint8_t buf[4];
  NSString *v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = (void *)objc_msgSend(a3, "copy");
  v9 = objc_alloc_init(FBAsynchronousShutdownTask);
  objc_storeStrong((id *)&v9->_name, v8);
  v9->_interval = a4;
  FBLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    name = v9->_name;
    *(_DWORD *)buf = 138543618;
    v41 = name;
    v42 = 2048;
    v43 = a4;
    _os_log_impl(&dword_1A359A000, v10, OS_LOG_TYPE_DEFAULT, "Starting shutdown task \"%{public}@\" with %.1fs timeout.", buf, 0x16u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  if (!__lock_group)
  {
    v12 = dispatch_group_create();
    v13 = (void *)__lock_group;
    __lock_group = (uint64_t)v12;

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = (void *)__lock_tasks;
    __lock_tasks = (uint64_t)v14;

  }
  objc_msgSend((id)__lock_tasks, "addObject:", v9);
  v16 = (id)__lock_group;
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
  dispatch_group_enter(v16);
  v17 = (void *)MEMORY[0x1E0D22F88];
  v18 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke;
  v37[3] = &unk_1E4A13B38;
  v19 = v9;
  v38 = v19;
  v39 = v16;
  v20 = v16;
  objc_msgSend(v17, "sentinelWithCompletion:", v37);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBSShutdownTask:%@"), v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  SerialWithQoS = (void *)BSDispatchQueueCreateSerialWithQoS();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_9;
  block[3] = &unk_1E4A13E88;
  v31 = SerialWithQoS;
  v32 = v19;
  v33 = v8;
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v35 = v21;
  v36 = v7;
  v24 = v21;
  v25 = v34;
  v26 = v8;
  v27 = v19;
  v28 = SerialWithQoS;
  v29 = v7;
  dispatch_async(v28, block);

}

void __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;

  if (objc_msgSend(a2, "isFailed"))
  {
    FBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_cold_1(a1, v3, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 72);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_2;
  v4[3] = &unk_1E4A13E60;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v3, v4);

}

void __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  objc_msgSend((id)__lock_tasks, "removeObject:", *(_QWORD *)(a1 + 32));
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
  FBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_2_cold_1(a1, v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
    v8 = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = -v7;
    _os_log_impl(&dword_1A359A000, v5, OS_LOG_TYPE_DEFAULT, "Shutdown task \"%{public}@\" complete after %.2fs", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 56), "signal");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

void __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_7(&dword_1A359A000, a2, a3, "Shutdown task \"%{public}@\" dropped completion handler on the floor.", (uint8_t *)&v4);
}

void __65__FBAsynchronousShutdownTask_startTaskWithName_timeout_workItem___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  double v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
  v7 = -v6;
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v5;
  v11 = 2048;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_1A359A000, a3, OS_LOG_TYPE_ERROR, "Shutdown task \"%{public}@\" failed after %.2fs with error: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
