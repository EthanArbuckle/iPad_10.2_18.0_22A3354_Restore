@implementation ClientSessionLog

void __ClientSessionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CompanionServices", "ClientSession");
  v1 = (void *)ClientSessionLog_log;
  ClientSessionLog_log = (uint64_t)v0;

}

@end
