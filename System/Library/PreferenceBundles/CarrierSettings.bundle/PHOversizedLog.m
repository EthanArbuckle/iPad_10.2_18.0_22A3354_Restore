@implementation PHOversizedLog

void __PHOversizedLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calls.mobilephone", "Oversized");
  v1 = (void *)PHOversizedLog_PHOversizedLog;
  PHOversizedLog_PHOversizedLog = (uint64_t)v0;

}

@end
