@implementation EXDiscoveryLog

void ___EXDiscoveryLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.extensionkit", "discovery");
  v1 = (void *)_EXDiscoveryLog_log;
  _EXDiscoveryLog_log = (uint64_t)v0;

}

@end
