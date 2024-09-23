@implementation IXATestAppRelayLog

void __IXATestAppRelayLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.inputanalytics", "testAppRelay");
  v1 = (void *)IXATestAppRelayLog_log;
  IXATestAppRelayLog_log = (uint64_t)v0;

}

@end
