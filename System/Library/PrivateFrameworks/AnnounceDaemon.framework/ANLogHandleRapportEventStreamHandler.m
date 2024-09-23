@implementation ANLogHandleRapportEventStreamHandler

void __ANLogHandleRapportEventStreamHandler_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "RapportEventStreamHandler");
  v1 = (void *)ANLogHandleRapportEventStreamHandler_logger;
  ANLogHandleRapportEventStreamHandler_logger = (uint64_t)v0;

}

@end
