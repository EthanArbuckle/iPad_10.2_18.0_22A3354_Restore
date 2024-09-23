@implementation C3DExecuteIncrementalProgressBlock

void __C3DExecuteIncrementalProgressBlock_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (v2 != objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress"))
    {
      v3 = scn_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
        C3DExecuteIncrementalProgressBlock_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "resignCurrent");
  objc_msgSend(*(id *)(a1 + 32), "fractionCompleted");
  if (v11 > 1.0)
  {
    v12 = scn_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      C3DExecuteIncrementalProgressBlock_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  if (++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > *(_DWORD *)(a1 + 48))
  {
    v20 = scn_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      __C3DExecuteIncrementalProgressBlock_block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
  }
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < *(_DWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", 1);
}

void __C3DExecuteIncrementalProgressBlock_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. To many calls to the unitCompletedBlock", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
