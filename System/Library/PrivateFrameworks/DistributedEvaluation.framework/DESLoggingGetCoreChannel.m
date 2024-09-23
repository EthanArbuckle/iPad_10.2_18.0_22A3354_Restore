@implementation DESLoggingGetCoreChannel

void __DESLoggingGetCoreChannel_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MLRuntime", "MLRuntime");
  v1 = (void *)DESLoggingGetCoreChannel_coreChannel;
  DESLoggingGetCoreChannel_coreChannel = (uint64_t)v0;

  if (!DESLoggingGetCoreChannel_coreChannel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __DESLoggingGetCoreChannel_block_invoke_cold_1();
}

void __DESLoggingGetCoreChannel_block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1B96E5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t coreChannel", v0, 2u);
}

@end
