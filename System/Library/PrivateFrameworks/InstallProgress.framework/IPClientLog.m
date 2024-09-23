@implementation IPClientLog

void ___IPClientLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.installprogress", "client");
  v1 = (void *)_IPClientLog_log;
  _IPClientLog_log = (uint64_t)v0;

}

@end
