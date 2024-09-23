@implementation FPCaptureLogsForOperation

void __FPCaptureLogsForOperation_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __FPCaptureLogsForOperation_block_invoke_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (v5)
  {
    __FPCaptureLogsForOperation_block_invoke_cold_2(v4, v6, v7, v8, v9, v10, v11, v12);
  }

}

void __FPCaptureLogsForOperation_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] Sent ABC report successfully", a5, a6, a7, a8, 0);
}

void __FPCaptureLogsForOperation_block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] ABC report got rejected", a5, a6, a7, a8, 0);
}

@end
