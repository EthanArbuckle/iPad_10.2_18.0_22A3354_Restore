@implementation TPRemoveIPPort

void __TPRemoveIPPort_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(_QWORD, _QWORD, uint64_t, _QWORD);

  v2 = CheckInHandleDebug();
  if (v2)
  {
    v3 = *(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(v2 + 34360);
    if (v3)
      v3(*(_QWORD *)(v2 + 34376), *(unsigned int *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24, *(unsigned int *)(a1 + 52));
    CheckOutHandleDebug();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __TPRemoveIPPort_block_invoke_cold_1();
  }
}

void __TPRemoveIPPort_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v1, "SIP [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/SIP/Transport.c:%d: TPRemoveIPPort: CheckInHandle failed in the dispatched block", v2);
  OUTLINED_FUNCTION_3();
}

@end
