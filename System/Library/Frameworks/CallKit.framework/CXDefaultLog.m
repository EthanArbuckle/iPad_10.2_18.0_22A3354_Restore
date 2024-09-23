@implementation CXDefaultLog

void __CXDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calls.callkit", "Default");
  v1 = (void *)CXDefaultLog_log;
  CXDefaultLog_log = (uint64_t)v0;

}

@end
