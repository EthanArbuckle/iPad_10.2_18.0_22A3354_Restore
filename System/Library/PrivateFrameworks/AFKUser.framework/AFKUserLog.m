@implementation AFKUserLog

void ___AFKUserLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.afk", "user");
  v1 = (void *)_AFKUserLog::log;
  _AFKUserLog::log = (uint64_t)v0;

}

@end
