@implementation AXLogAssetDaemon

void __AXLogAssetDaemon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXAssetDaemon");
  v1 = (void *)AXLogAssetDaemon___logObj;
  AXLogAssetDaemon___logObj = (uint64_t)v0;

}

@end
