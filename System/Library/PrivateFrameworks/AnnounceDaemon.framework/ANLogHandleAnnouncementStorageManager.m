@implementation ANLogHandleAnnouncementStorageManager

void __ANLogHandleAnnouncementStorageManager_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "AnnouncementStorageManager");
  v1 = (void *)ANLogHandleAnnouncementStorageManager_logger;
  ANLogHandleAnnouncementStorageManager_logger = (uint64_t)v0;

}

@end
