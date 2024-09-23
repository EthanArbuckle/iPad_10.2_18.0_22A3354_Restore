@implementation VCTransportStreamRunLoopVTPPerformReceive

uint64_t ___VCTransportStreamRunLoopVTPPerformReceive_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4)
{
  char *v6;
  uint64_t (*v7)(uint64_t);

  v6 = *(char **)(a1 + 32);
  if (__darwin_check_fd_set_overflow(a4, v6, 0))
  {
    if (((*(_DWORD *)&v6[((unint64_t)a4 >> 3) & 0x1FFFFFFFFFFFFFFCLL] >> a4) & 1) != 0)
    {
      v7 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
      if ((!v7 || (v7(a3) & 0x80000000) != 0) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          ___VCTransportStreamRunLoopVTPPerformReceive_block_invoke_cold_1();
      }
    }
  }
  return 0;
}

void ___VCTransportStreamRunLoopVTPPerformReceive_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "_VCTransportStreamRunLoopVTPPerformReceive_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Perform receive failed for tranportStream %p", v2, *(const char **)v3, (unint64_t)"_VCTransportStreamRunLoopVTPPerformReceive_block_invoke" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

@end
