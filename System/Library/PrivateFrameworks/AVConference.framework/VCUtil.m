@implementation VCUtil

void ___VCUtil_GenerateTailspin_block_invoke(uint64_t a1)
{
  _BOOL4 Tailspin;
  int ErrorLogLevelForModule;
  unsigned int *v4;
  unsigned int v5;

  Tailspin = VCTailspinUtil_GenerateTailspin(*(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  close(*(_DWORD *)(a1 + 56));
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (Tailspin)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        ___VCUtil_GenerateTailspin_block_invoke_cold_1();
    }
    VRLogfileZipOnly(*(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCUtil_GenerateTailspin_block_invoke_cold_2();
  }
  v4 = *(unsigned int **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void ___VCUtil_GenerateStackshot_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 32;
  if ((WriteStackshotReport_stdc() & 1) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCUtil_GenerateStackshot_block_invoke_cold_1();
  }
  free(*(void **)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 24));
}

void ___VCUtil_GenerateSpindump_block_invoke(uint64_t a1)
{
  pid_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  unsigned int *v7;
  unsigned int v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BYTE *v16;
  __int16 v17;
  pid_t v18;
  __int16 v19;
  char *v20;
  char __str[1024];
  char __b[1024];
  _BYTE buffer[3];
  _BYTE v24[1029];

  *(_QWORD *)&v24[1021] = *MEMORY[0x1E0C80C00];
  v2 = getpid();
  bzero(v24, 0x3FDuLL);
  memset(buffer, 63, sizeof(buffer));
  proc_name(v2, buffer, 0x400u);
  v3 = dispatch_semaphore_create(0);
  dispatch_retain(v3);
  memset(__b, 170, sizeof(__b));
  snprintf(__b, 0x400uLL, "AVConference PID:%d", v2);
  memset(__str, 170, sizeof(__str));
  snprintf(__str, 0x400uLL, "%s", *(const char **)(a1 + 40));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v10 = v4;
      v11 = 2080;
      v12 = "_VCUtil_GenerateSpindump_block_invoke";
      v13 = 1024;
      v14 = 1667;
      v15 = 2080;
      v16 = buffer;
      v17 = 1024;
      v18 = v2;
      v19 = 2080;
      v20 = __b;
      _os_log_error_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_ERROR, " [%s] %s:%d ##### Triggering a spindump on %s (PID:%d) signatureCString=%s", buf, 0x36u);
    }
  }
  SPGenerateSpindump();
  v6 = dispatch_time(0, 165000000000);
  dispatch_semaphore_wait(v3, v6);
  v7 = *(unsigned int **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (v3)
    dispatch_release(v3);
}

void ___VCUtil_GenerateSpindump_block_invoke_113(uint64_t a1, int a2, const char *a3)
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "_VCUtil_GenerateSpindump_block_invoke";
      v12 = 1024;
      v13 = 1670;
      v14 = 1024;
      v15 = a2;
      v16 = 2080;
      v17 = a3;
      _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d ##### spindump (error=%d) written to file \"%s\", (uint8_t *)&v8, 0x2Cu);
    }
  }
  VRLogfileZipOnly(a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t ___VCUtil_DiagnosticsAtomicSharedInstance_block_invoke(uint64_t result)
{
  **(_DWORD **)(result + 32) = 0;
  return result;
}

void ___VCUtil_GenerateTailspin_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_10_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_8_8();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d ##### Finished dumping tailspin to file \"%s\", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void ___VCUtil_GenerateTailspin_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_10_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_8_8();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d ##### Failed to dump tailspin to file \"%s\", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void ___VCUtil_GenerateStackshot_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_8_8();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d ##### WriteStackshotReport_stdc failed.  No stackshot generated for reason=%s", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
