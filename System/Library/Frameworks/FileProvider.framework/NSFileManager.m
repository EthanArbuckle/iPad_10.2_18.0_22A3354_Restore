@implementation NSFileManager

void __71__NSFileManager_FPAdditions__fp_trashItemAtURL_resultingItemURL_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v6 == 0;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __69__NSFileManager_FPAdditions__fp_putBackURLForTrashedItemAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __59__NSFileManager_FPAdditions__fp_setPutBackInfoOnItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __59__NSFileManager_FPAdditions__fp_setPutBackInfoOnItemAtURL___block_invoke_cold_1(a1, (uint64_t)v3, v4);

}

void __59__NSFileManager_FPAdditions__fp_setPutBackInfoOnItemAtURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  _BOOL4 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 1024;
  v7 = a2 != 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished setting put back URL for item %@ success: %{BOOL}d", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_3();
}

@end
