@implementation IOHIDServiceUnscheduleAsync

void ___IOHIDServiceUnscheduleAsync_block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___IOHIDServiceUnscheduleAsync_block_invoke_65(uint64_t a1)
{
  NSObject *v2;

  v2 = _IOHIDLogCategory(6u);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    ___IOHIDServiceUnscheduleAsync_block_invoke_65_cold_1();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___IOHIDServiceUnscheduleAsync_block_invoke_67(uint64_t a1)
{
  NSObject *v2;

  v2 = _IOHIDLogCategory(6u);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    ___IOHIDServiceUnscheduleAsync_block_invoke_67_cold_1();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___IOHIDServiceUnscheduleAsync_block_invoke_65_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5(&dword_18AAAF000, v0, v1, "0x%llx: unschedule from dispatch queue completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___IOHIDServiceUnscheduleAsync_block_invoke_67_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5(&dword_18AAAF000, v0, v1, "0x%llx: unschedule from runloop completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
