@implementation FPIsFileProviderBookmark

intptr_t __FPIsFileProviderBookmark_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 != 0;
  if (a3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __FPIsFileProviderBookmark_block_invoke_cold_1(a1, v4);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __FPIsFileProviderBookmark_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "fp_scopeDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v4, "[DEBUG] Failed to determine whether URL %@ is managed by a file provider", v5);

  OUTLINED_FUNCTION_6_1();
}

@end
