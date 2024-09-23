@implementation ATXRunningBoardAssertion

+ (void)performWorkWithFinishTaskAssertionName:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  char v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (performWorkWithFinishTaskAssertionName_block__onceToken != -1)
    dispatch_once(&performWorkWithFinishTaskAssertionName_block__onceToken, &__block_literal_global_11);
  v8 = objc_alloc(MEMORY[0x1E0D87C98]);
  v9 = performWorkWithFinishTaskAssertionName_block__target;
  v30[0] = performWorkWithFinishTaskAssertionName_block__attribute;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithExplanation:target:attributes:", v6, v9, v10);

  v25 = 0;
  v12 = objc_msgSend(v11, "acquireWithError:", &v25);
  v13 = v25;
  __atxlog_handle_default();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v27 = v16;
      v28 = 2048;
      v29 = a1;
      v17 = v16;
      _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@ %p] Acquired Process assertion", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    +[ATXRunningBoardAssertion performWorkWithFinishTaskAssertionName:block:].cold.2();
  }

  v7[2](v7);
  v24 = 0;
  v18 = objc_msgSend(v11, "invalidateSyncWithError:", &v24);
  v19 = v24;

  __atxlog_handle_default();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((v18 & 1) != 0)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      v28 = 2048;
      v29 = a1;
      v23 = v22;
      _os_log_impl(&dword_1A49EF000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@ %p] invalidated Process assertion", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    +[ATXRunningBoardAssertion performWorkWithFinishTaskAssertionName:block:].cold.1();
  }

}

void __73__ATXRunningBoardAssertion_performWorkWithFinishTaskAssertionName_block___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", getpid());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)performWorkWithFinishTaskAssertionName_block__target;
  performWorkWithFinishTaskAssertionName_block__target = v0;

  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskInterruptable"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)performWorkWithFinishTaskAssertionName_block__attribute;
  performWorkWithFinishTaskAssertionName_block__attribute = v2;

}

+ (void)performWorkWithFinishTaskAssertionName:block:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_9(v0);
  OUTLINED_FUNCTION_2_4(&dword_1A49EF000, v2, v3, "[%{public}@ %p] Failed to invalidate Process assertion with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_5();
}

+ (void)performWorkWithFinishTaskAssertionName:block:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_9(v0);
  OUTLINED_FUNCTION_2_4(&dword_1A49EF000, v2, v3, "[%{public}@ %p] Failed to acquire Process assertion with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_5();
}

@end
