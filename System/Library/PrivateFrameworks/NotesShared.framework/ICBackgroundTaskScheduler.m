@implementation ICBackgroundTaskScheduler

+ (ICBackgroundTaskScheduler)sharedScheduler
{
  if (sharedScheduler_onceToken != -1)
    dispatch_once(&sharedScheduler_onceToken, &__block_literal_global_46);
  return (ICBackgroundTaskScheduler *)(id)sharedScheduler_sharedScheduler;
}

void __44__ICBackgroundTaskScheduler_sharedScheduler__block_invoke()
{
  ICBackgroundTaskScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(ICBackgroundTaskScheduler);
  v1 = (void *)sharedScheduler_sharedScheduler;
  sharedScheduler_sharedScheduler = (uint64_t)v0;

}

- (ICBackgroundTaskScheduler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICBackgroundTaskScheduler;
  return -[ICBackgroundTaskScheduler init](&v3, sel_init);
}

- (void)registerTask:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "makeTaskRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92690], "sharedScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __42__ICBackgroundTaskScheduler_registerTask___block_invoke;
  v15 = &unk_1E76CD138;
  v7 = v5;
  v16 = v7;
  v8 = v3;
  v17 = v8;
  v9 = objc_msgSend(v6, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v7, 0, &v12);

  v10 = os_log_create("com.apple.notes", "BackgroundTask");
  v11 = v10;
  if ((_DWORD)v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ICBackgroundTaskScheduler registerTask:].cold.1();
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[ICBackgroundTaskScheduler registerTask:].cold.2();
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "didRegister:", v9, v12, v13, v14, v15, v16);

}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v3 = a2;
  objc_initWeak(&location, v3);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__ICBackgroundTaskScheduler_registerTask___block_invoke_2;
  v11[3] = &unk_1E76C91A0;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  objc_copyWeak(&v14, &location);
  v5 = objc_loadWeakRetained(&location);
  objc_msgSend(v5, "setExpirationHandler:", v11);

  v6 = os_log_create("com.apple.notes", "BackgroundTask");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __42__ICBackgroundTaskScheduler_registerTask___block_invoke_cold_1();

  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __42__ICBackgroundTaskScheduler_registerTask___block_invoke_9;
  v8[3] = &unk_1E76CD110;
  v7 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "runTaskWithCompletion:", v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  v2 = os_log_create("com.apple.notes", "BackgroundTask");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __42__ICBackgroundTaskScheduler_registerTask___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "handleTaskExpiration");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setTaskCompletedWithSuccess:", 1);

}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "BackgroundTask");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__ICBackgroundTaskScheduler_registerTask___block_invoke_9_cold_2();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = WeakRetained;
    v8 = 0;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __42__ICBackgroundTaskScheduler_registerTask___block_invoke_9_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = WeakRetained;
    v8 = 1;
  }
  objc_msgSend(WeakRetained, "setTaskCompletedWithSuccess:", v8);

}

- (void)scheduleTask:(Class)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a4;
  -[objc_class makeTaskRequest](a3, "makeTaskRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92690], "sharedScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke;
  v10[3] = &unk_1E76CD188;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "getPendingTaskRequestsWithCompletionHandler:", v10);

}

void __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void (*v15)(void);
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_2;
  v18[3] = &unk_1E76CD160;
  v4 = (id *)(a1 + 32);
  v19 = *(id *)(a1 + 32);
  objc_msgSend(a2, "ic_objectPassingTest:", v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C92690], "sharedScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *v4;
    v17 = 0;
    v10 = objc_msgSend(v8, "submitTaskRequest:error:", v9, &v17);
    v11 = v17;

    v12 = os_log_create("com.apple.notes", "BackgroundTask");
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_cold_1(v4, v13);

      v14 = *(_QWORD *)(a1 + 40);
      if (!v14)
        goto LABEL_16;
      v15 = *(void (**)(void))(v14 + 16);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_cold_2(v4, (uint64_t)v11, v13);

      v16 = *(_QWORD *)(a1 + 40);
      if (!v16)
        goto LABEL_16;
      v15 = *(void (**)(void))(v16 + 16);
    }
    v15();
LABEL_16:

    goto LABEL_17;
  }
  v6 = os_log_create("com.apple.notes", "BackgroundTask");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_cold_3(v4, v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, 1, 0);
LABEL_17:

}

uint64_t __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)registerTask:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Registered {id: %@}", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)registerTask:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1BD918000, v0, OS_LOG_TYPE_ERROR, "Failed registering {id: %@}", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Running {id: %@}", v2);
  OUTLINED_FUNCTION_1_0();
}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Expiring {id: %@}", v2);
  OUTLINED_FUNCTION_1_0();
}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Finished {id: %@}", v2);
  OUTLINED_FUNCTION_1_0();
}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke_9_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_7();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_10(&dword_1BD918000, v1, (uint64_t)v1, "Failed running {id: %@, error: %@}", v2);
  OUTLINED_FUNCTION_1_0();
}

void __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v4, "Scheduled {id: %@}", v5);

  OUTLINED_FUNCTION_4_0();
}

void __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v8 = 2112;
  v9 = a2;
  OUTLINED_FUNCTION_10(&dword_1BD918000, a3, v6, "Failed scheduling {id: %@, error: %@}", v7);

}

void __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_cold_3(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v4, "Already scheduled {id: %@}", v5);

  OUTLINED_FUNCTION_4_0();
}

@end
