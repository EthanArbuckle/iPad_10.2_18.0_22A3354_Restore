@implementation ANLogHandleTonePlayerService

void __ANLogHandleTonePlayerService_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "TonePlayerService");
  v1 = (void *)ANLogHandleTonePlayerService_logger;
  ANLogHandleTonePlayerService_logger = (uint64_t)v0;

}

@end
