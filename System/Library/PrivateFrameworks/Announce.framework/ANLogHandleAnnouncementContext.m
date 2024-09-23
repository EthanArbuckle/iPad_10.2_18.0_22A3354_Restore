@implementation ANLogHandleAnnouncementContext

void __ANLogHandleAnnouncementContext_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "AnnouncementContext");
  v1 = (void *)ANLogHandleAnnouncementContext_logger;
  ANLogHandleAnnouncementContext_logger = (uint64_t)v0;

}

@end
