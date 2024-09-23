@implementation LSGetDMFPolicyNoCache

void ___LSGetDMFPolicyNoCache_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  LaunchServices::DMFSupport *v7;
  LaunchServices::DMFSupport *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    LaunchServices::DMFSupport::getLog(v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      ___LSGetDMFPolicyNoCache_block_invoke_cold_1(a1, (uint64_t)v8, v9);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

void ___LSGetDMFPolicyNoCache_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138478083;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Error requesting DMF policy for bundle ID %{private}@: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
