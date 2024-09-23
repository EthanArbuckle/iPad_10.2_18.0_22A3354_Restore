@implementation TPNewCandidatesCallback

void __TPNewCandidatesCallback_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int ErrorLogLevelForModule;
  uint64_t v4;
  NSObject *v5;
  int v6;
  void (*v7)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = CheckInHandleDebug();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_DWORD *)(a1 + 56);
        v9 = 136315906;
        v10 = v4;
        v11 = 2080;
        v12 = "TPNewCandidatesCallback_block_invoke";
        v13 = 1024;
        v14 = 4621;
        v15 = 1024;
        v16 = v6;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPNewCandidatesCallback: blob size: %d", (uint8_t *)&v9, 0x22u);
      }
    }
    v7 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 34344);
    if (v7)
      v7(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 60), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), *(unsigned __int16 *)(a1 + 64));
    v8 = *(void **)(a1 + 48);
    if (v8)
      free(v8);
    CheckOutHandleDebug();
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __TPNewCandidatesCallback_block_invoke_cold_1();
  }
}

void __TPNewCandidatesCallback_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v1, "SIP [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/SIP/Transport.c:%d: TPNewCandidatesCallback: CheckInHandle failed in the dispatched block", v2);
  OUTLINED_FUNCTION_3();
}

@end
