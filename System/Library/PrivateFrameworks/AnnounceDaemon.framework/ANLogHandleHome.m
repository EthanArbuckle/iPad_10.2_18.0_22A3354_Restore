@implementation ANLogHandleHome

void __ANLogHandleHome_Announce_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "Home_Announce");
  v1 = (void *)ANLogHandleHome_Announce_logger;
  ANLogHandleHome_Announce_logger = (uint64_t)v0;

}

@end
