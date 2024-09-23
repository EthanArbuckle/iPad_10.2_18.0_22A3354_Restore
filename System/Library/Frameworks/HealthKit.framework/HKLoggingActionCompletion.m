@implementation HKLoggingActionCompletion

void ___HKLoggingActionCompletion_block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = a1[4];
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[5];
      v8 = a1[7];
      v9 = 138543618;
      v10 = v7;
      v11 = 2082;
      v12 = v8;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}s: Succeeded", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    ___HKLoggingActionCompletion_block_invoke_cold_1();
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void ___HKLoggingActionCompletion_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_4(&dword_19A0E6000, v0, v1, "%{public}@: %{public}s: Failed: %{public}@");
}

@end
