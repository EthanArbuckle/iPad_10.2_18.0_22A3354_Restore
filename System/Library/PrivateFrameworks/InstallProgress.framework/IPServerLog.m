@implementation IPServerLog

void ___IPServerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.installprogress", "server");
  v1 = (void *)_IPServerLog_log;
  _IPServerLog_log = (uint64_t)v0;

}

@end
