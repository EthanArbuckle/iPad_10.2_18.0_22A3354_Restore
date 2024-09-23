@implementation ANLogHandleAccessory

void __ANLogHandleAccessory_Announce_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "Accessory_Announce");
  v1 = (void *)ANLogHandleAccessory_Announce_logger;
  ANLogHandleAccessory_Announce_logger = (uint64_t)v0;

}

@end
