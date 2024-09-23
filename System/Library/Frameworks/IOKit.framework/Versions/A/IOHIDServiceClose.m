@implementation IOHIDServiceClose

void ___IOHIDServiceClose_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  v2 = _IOHIDLogCategory(6u);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    ___IOHIDServiceClose_block_invoke_cold_1();
  v3 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v3 + 224) |= 4u;
  if (*(_QWORD *)(v3 + 248))
  {
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(v3 + 248));
    v3 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v3 + 256))
  {
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(v3 + 256));
    v3 = *(_QWORD *)(a1 + 32);
  }
  CFRelease((CFTypeRef)v3);
}

void ___IOHIDServiceClose_block_invoke_cold_1()
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
  OUTLINED_FUNCTION_5(&dword_18AAAF000, v0, v1, "0x%llx: close completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
