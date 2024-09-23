@implementation IOHIDServiceHandleCancelTimerTimeout

void ____IOHIDServiceHandleCancelTimerTimeout_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  if ((IOHIDServiceFilterGetStateMask(a2) & 3) == 1)
  {
    v4 = _IOHIDLogCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      ____IOHIDServiceHandleCancelTimerTimeout_block_invoke_cold_1(a2, a1, v4);
  }
}

void ____IOHIDServiceHandleCancelTimerTimeout_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_fault_impl(&dword_18AAAF000, log, OS_LOG_TYPE_FAULT, "Service filter %@ never called cancel handler for service %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
