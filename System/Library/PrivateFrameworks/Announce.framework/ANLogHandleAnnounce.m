@implementation ANLogHandleAnnounce

void __ANLogHandleAnnounce_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "Announce");
  v1 = (void *)ANLogHandleAnnounce_logger;
  ANLogHandleAnnounce_logger = (uint64_t)v0;

}

@end
