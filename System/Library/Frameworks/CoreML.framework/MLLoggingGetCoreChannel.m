@implementation MLLoggingGetCoreChannel

void __MLLoggingGetCoreChannel_block_invoke()
{
  os_log_t v0;
  void *v1;
  uint8_t v2[16];

  v0 = os_log_create("com.apple.coreml", "coreml");
  v1 = (void *)MLLoggingGetCoreChannel_coreChannel;
  MLLoggingGetCoreChannel_coreChannel = (uint64_t)v0;

  if (!MLLoggingGetCoreChannel_coreChannel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_19C486000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t coreChannel", v2, 2u);
  }
}

@end
