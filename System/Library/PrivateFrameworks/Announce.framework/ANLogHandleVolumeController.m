@implementation ANLogHandleVolumeController

void __ANLogHandleVolumeController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "VolumeController");
  v1 = (void *)ANLogHandleVolumeController_logger;
  ANLogHandleVolumeController_logger = (uint64_t)v0;

}

@end
