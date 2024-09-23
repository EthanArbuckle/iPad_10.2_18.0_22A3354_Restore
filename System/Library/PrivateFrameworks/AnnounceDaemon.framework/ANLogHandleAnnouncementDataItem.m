@implementation ANLogHandleAnnouncementDataItem

void __ANLogHandleAnnouncementDataItem_AudioProcessing_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "AnnouncementDataItem_AudioProcessing");
  v1 = (void *)ANLogHandleAnnouncementDataItem_AudioProcessing_logger;
  ANLogHandleAnnouncementDataItem_AudioProcessing_logger = (uint64_t)v0;

}

@end
