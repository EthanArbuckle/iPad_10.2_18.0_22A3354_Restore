@implementation ANLogHandleTonePlayerServiceListener

void __ANLogHandleTonePlayerServiceListener_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "TonePlayerServiceListener");
  v1 = (void *)ANLogHandleTonePlayerServiceListener_logger;
  ANLogHandleTonePlayerServiceListener_logger = (uint64_t)v0;

}

@end
