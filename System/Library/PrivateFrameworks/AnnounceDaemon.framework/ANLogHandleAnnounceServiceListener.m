@implementation ANLogHandleAnnounceServiceListener

void __ANLogHandleAnnounceServiceListener_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "AnnounceServiceListener");
  v1 = (void *)ANLogHandleAnnounceServiceListener_logger;
  ANLogHandleAnnounceServiceListener_logger = (uint64_t)v0;

}

@end
