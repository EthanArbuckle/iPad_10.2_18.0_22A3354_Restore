@implementation ANLogHandleBackgroundActivity

void __ANLogHandleBackgroundActivity_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "BackgroundActivity");
  v1 = (void *)ANLogHandleBackgroundActivity_logger;
  ANLogHandleBackgroundActivity_logger = (uint64_t)v0;

}

@end
