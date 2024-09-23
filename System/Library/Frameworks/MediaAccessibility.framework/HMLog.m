@implementation HMLog

void __HMLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXHapticMusic");
  v1 = (void *)HMLog__HMLog;
  HMLog__HMLog = (uint64_t)v0;

}

@end
