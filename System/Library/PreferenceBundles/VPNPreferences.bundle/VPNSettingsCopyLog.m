@implementation VPNSettingsCopyLog

void __VPNSettingsCopyLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkextension", "VPN Settings");
  v1 = (void *)VPNSettingsCopyLog_logger;
  VPNSettingsCopyLog_logger = (uint64_t)v0;

}

@end
