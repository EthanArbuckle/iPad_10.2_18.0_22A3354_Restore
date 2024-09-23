@implementation ECNetworkAllowedLog

void __ECNetworkAllowedLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "ECNetworkAllowed");
  v1 = (void *)ECNetworkAllowedLog_log;
  ECNetworkAllowedLog_log = (uint64_t)v0;

}

@end
