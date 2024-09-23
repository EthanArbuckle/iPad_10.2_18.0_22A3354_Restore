@implementation CFRunLoopWakeUp

void __CFRunLoopWakeUp_block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = _CFOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __CFRunLoopWakeUp_block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __CFRunLoopWakeUp_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_11(&dword_182A8C000, a1, a3, "Attempting to wake up main runloop, but the main thread as exited. This message will only log once. Break on _CFRunLoopError_MainThreadHasExited to debug.", a5, a6, a7, a8, 0);
}

@end
