@implementation ANLogHandleAnnounceReachabilityServiceListener

void __ANLogHandleAnnounceReachabilityServiceListener_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "AnnounceReachabilityServiceListener");
  v1 = (void *)ANLogHandleAnnounceReachabilityServiceListener_logger;
  ANLogHandleAnnounceReachabilityServiceListener_logger = (uint64_t)v0;

}

@end
