@implementation IPDefaultLog

void ___IPDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.installprogress", "default");
  v1 = (void *)_IPDefaultLog_log;
  _IPDefaultLog_log = (uint64_t)v0;

}

@end
