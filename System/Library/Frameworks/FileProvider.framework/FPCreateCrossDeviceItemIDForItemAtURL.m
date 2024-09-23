@implementation FPCreateCrossDeviceItemIDForItemAtURL

intptr_t __FPCreateCrossDeviceItemIDForItemAtURL_block_invoke(uint64_t a1, void *a2, const void *a3)
{
  NSObject *v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (a3)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __FPCreateCrossDeviceItemIDForItemAtURL_block_invoke_cold_1();

    if (*(_QWORD *)(a1 + 48))
    {
      CFRetain(a3);
      **(_QWORD **)(a1 + 48) = a3;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __FPCreateCrossDeviceItemIDForItemAtURL_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_23_0();
  objc_msgSend((id)OUTLINED_FUNCTION_15_2(v0, v1), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_8_2(&dword_1A0A34000, v3, v4, "[ERROR] %s: %s error: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_11_1();
}

@end
