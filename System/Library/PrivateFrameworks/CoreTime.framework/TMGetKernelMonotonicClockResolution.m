@implementation TMGetKernelMonotonicClockResolution

double __TMGetKernelMonotonicClockResolution_block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  u_int v9[2];
  size_t v10;
  unint64_t v11;
  int v12[8];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 8;
  v11 = 0;
  *(_QWORD *)v9 = 8;
  if (sysctlnametomib("kern.monotonicclock_rate_usecs", v12, (size_t *)v9))
  {
    v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v0)
      __TMGetKernelMonotonicClockResolution_block_invoke_cold_2(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  else if (sysctl(v12, v9[0], &v11, &v10, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __TMGetKernelMonotonicClockResolution_block_invoke_cold_1();
  }
  else
  {
    result = (double)v11 / 1000000.0;
    *(double *)&TMGetKernelMonotonicClockResolution_sInterval = result;
  }
  return result;
}

void __TMGetKernelMonotonicClockResolution_block_invoke_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  v0 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1B39B6000, MEMORY[0x1E0C81028], v1, "CoreTime: Error occurred %d %s\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __TMGetKernelMonotonicClockResolution_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B39B6000, MEMORY[0x1E0C81028], a3, "CoreTime: error occurred, no mib to monotonicclock_rate_usecs conversion\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
