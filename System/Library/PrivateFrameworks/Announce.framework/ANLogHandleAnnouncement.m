@implementation ANLogHandleAnnouncement

void __ANLogHandleAnnouncement_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "Announcement");
  v1 = (void *)ANLogHandleAnnouncement_logger;
  ANLogHandleAnnouncement_logger = (uint64_t)v0;

}

@end
