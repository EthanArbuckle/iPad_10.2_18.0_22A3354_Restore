@implementation C3DGetColorMatchingComputeKernelParameters

uint64_t __C3DGetColorMatchingComputeKernelParameters_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v15;
  uint64_t *v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t v19[4];
  _DWORD v20[7];

  *(_QWORD *)&v20[5] = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(*(_QWORD *)(a2 + 52) + 8 * *a5);
  if (a4 >= 2)
  {
    v9 = a4 - 1;
    v10 = a5 + 1;
    do
    {
      v11 = *v10++;
      if (*(_QWORD *)(*(_QWORD *)(a2 + 52) + 8 * v11) != v8)
      {
        v12 = scn_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          __C3DGetColorMatchingComputeKernelParameters_block_invoke_cold_3(v19, v20, v12);
      }
      --v9;
    }
    while (v9);
  }
  v13 = CGColorTRCGetGammaID();
  if (v13 == 7)
    return 1;
  v15 = v13;
  CGColorTRCGetFunction();
  if (!a3)
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v15;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 32) = 1;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 36) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 44) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 48) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 52) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 56) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 60) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 64) = 0;
    return 1;
  }
  v17 = *(_QWORD *)(a2 + 4);
  v16 = (uint64_t *)(a2 + 4);
  if (v17 - 1 == a3)
  {
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v15;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 34) = 1;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 128) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 132) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 136) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 140) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 144) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 148) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 152) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 156) = 0;
    return 1;
  }
  v18 = scn_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    __C3DGetColorMatchingComputeKernelParameters_block_invoke_cold_1(a3, v16, v18);
  return 0;
}

BOOL __C3DGetColorMatchingComputeKernelParameters_block_invoke_21(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v16[2];

  v2 = a2 + 36;
  v3 = *(_QWORD *)(a2 + 36);
  if (v3 == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 33) = 1;
    memset(v16, 0, 24);
    CGColorMatrixGetMatrix();
    v5 = 0u;
    DWORD1(v5) = 0;
    DWORD2(v5) = 0;
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 80) = v5;
    v6 = *(_OWORD *)((char *)v16 + 4);
    DWORD1(v6) = 0;
    DWORD2(v6) = 0;
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96) = v6;
    v7 = *(_OWORD *)((char *)v16 + 8);
    DWORD1(v7) = 0;
    DWORD2(v7) = 0;
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112) = v7;
  }
  else
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __C3DGetColorMatchingComputeKernelParameters_block_invoke_21_cold_1(v2, v8, v9, v10, v11, v12, v13, v14);
  }
  return v3 == 1;
}

uint64_t __C3DGetColorMatchingComputeKernelParameters_block_invoke_24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = scn_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __C3DGetColorMatchingComputeKernelParameters_block_invoke_24_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  return 0;
}

void __C3DGetColorMatchingComputeKernelParameters_block_invoke_cold_1(int a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4[0] = 67109376;
  v4[1] = a1;
  v5 = 1024;
  v6 = v3;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Unsupported conversion info - stage %d of %d will be ignored!", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_1();
}

void __C3DGetColorMatchingComputeKernelParameters_block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: Unsupported conversion info - unsupported TRC type %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __C3DGetColorMatchingComputeKernelParameters_block_invoke_cold_3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "trcOther == trc";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Unsupported conversion info - different TRCs for input components", a1);
}

void __C3DGetColorMatchingComputeKernelParameters_block_invoke_21_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Error: Unsupported conversion info - %d color matrices", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __C3DGetColorMatchingComputeKernelParameters_block_invoke_24_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Unsupported conversion info - NxMLUTs not supported", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
