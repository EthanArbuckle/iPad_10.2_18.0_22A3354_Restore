@implementation IOHIDSessionClose

void __IOHIDSessionClose_block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = _IOHIDLogCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __IOHIDSessionClose_block_invoke_cold_1(v2);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __IOHIDSessionClose_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18AAAF000, log, OS_LOG_TYPE_DEBUG, "IOHIDSession close completed", v1, 2u);
}

@end
