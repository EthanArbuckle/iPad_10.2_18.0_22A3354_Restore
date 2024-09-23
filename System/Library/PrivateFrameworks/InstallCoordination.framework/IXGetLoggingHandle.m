@implementation IXGetLoggingHandle

void __IXGetLoggingHandle_block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create(*(const char **)(a1 + 32), "framework");
  v2 = (void *)IXGetLoggingHandle_logHandle;
  IXGetLoggingHandle_logHandle = (uint64_t)v1;

}

@end
