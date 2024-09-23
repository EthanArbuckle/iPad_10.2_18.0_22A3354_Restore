@implementation SendUDPPacketCList

BOOL __SendUDPPacketCList_block_invoke(uint64_t a1, msghdr *a2)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  a2->msg_name = *(void **)(a1 + 48);
  a2->msg_namelen = *(_DWORD *)(a1 + 64);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sendmsg(**(_DWORD **)(a1 + 56), a2, 0);
  *(float *)(*(_QWORD *)(a1 + 56) + 608) = *(float *)(*(_QWORD *)(a1 + 56) + 608) + 1.0;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        __SendUDPPacketCList_block_invoke_cold_1(v5, v6);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *__error() | 0xC01A0000;
    *(float *)(*(_QWORD *)(a1 + 56) + 616) = *(float *)(*(_QWORD *)(a1 + 56) + 616) + 1.0;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v3 = micro();
    v4 = *(_QWORD *)(a1 + 56);
    *(double *)(v4 + 64) = v3;
    *(_QWORD *)(v4 + 584) += *(int *)(a1 + 68);
  }
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 0;
}

void __SendUDPPacketCList_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __error();
  v5 = 136315906;
  v6 = a1;
  v7 = 2080;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, a2, v4, " [%s] %s:%d sendmsg error: errno = %d", (uint8_t *)&v5);
  OUTLINED_FUNCTION_19();
}

@end
