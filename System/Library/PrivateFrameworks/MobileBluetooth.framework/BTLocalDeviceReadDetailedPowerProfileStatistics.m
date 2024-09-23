@implementation BTLocalDeviceReadDetailedPowerProfileStatistics

void __BTLocalDeviceReadDetailedPowerProfileStatistics_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64;
  uint64_t v5;

  uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  v5 = *(_QWORD *)(a1 + 32);
  a1 += 32;
  *(_QWORD *)(*(_QWORD *)(v5 + 8) + 24) = uint64;
  **(_DWORD **)(a1 + 8) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsDurationTotal");
  **(_DWORD **)(a1 + 16) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsDurationActive");
  **(_DWORD **)(a1 + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsDurationIdle");
  **(_DWORD **)(a1 + 32) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsDurationSleep");
  **(_DWORD **)(a1 + 40) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsDisableCounter");
  **(_DWORD **)(a1 + 48) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsiPATxBT");
  **(_DWORD **)(a1 + 56) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsePATxBT");
  **(_DWORD **)(a1 + 64) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsiPATxLE");
  **(_DWORD **)(a1 + 72) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsePATxLE");
  **(_DWORD **)(a1 + 80) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsConnectedRxBT");
  **(_DWORD **)(a1 + 88) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsConnectedRxLE");
  **(_DWORD **)(a1 + 96) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsScanRxBT");
  **(_DWORD **)(a1 + 104) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsScanRxLE");
  **(_DWORD **)(a1 + 112) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsTotalPHYCal");
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTLocalDeviceReadDetailedPowerProfileStatistics_block_invoke_cold_1();
}

void __BTLocalDeviceReadDetailedPowerProfileStatistics_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "kCBMsgIdLocalDeviceReadDetailedPowerProfileStatisticsMsg reply result:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
