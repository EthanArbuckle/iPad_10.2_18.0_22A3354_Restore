@implementation HKHRAFibBurdenDetermineIsFocusModeOn

void __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1D7781000, v4, OS_LOG_TYPE_DEFAULT, "[HKHRAFibBurdenDetermineIsFocusModeOn] User focus computed mode publisher finished with error: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D7781000, v6, OS_LOG_TYPE_DEFAULT, "[HKHRAFibBurdenDetermineIsFocusModeOn] No focus mode returned, possibly implying focus modes never used, sending off.", (uint8_t *)&v9, 2u);
    }

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = MEMORY[0x1E0C9AAA0];

  }
}

void __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke_192(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v7)
    {
      HKHRAFibBurdenLogForCategory(3);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke_192_cold_2(v3, v8);

    }
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "eventBody");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithBool:", -[NSObject isStarting](v6, "isStarting"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke_192_cold_1(v3, v6);
  }

}

void __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke_192_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(a1, "error"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1D7781000, a2, OS_LOG_TYPE_ERROR, "[HKHRAFibBurdenDetermineIsFocusModeOn] Received nil user focus computed mode with reason: %{public}@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_0_2();
}

void __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke_192_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_1D7781000, a2, OS_LOG_TYPE_DEBUG, "[HKHRAFibBurdenDetermineIsFocusModeOn] Received event: %{public}@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_0_2();
}

@end
