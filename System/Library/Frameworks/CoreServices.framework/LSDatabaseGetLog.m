@implementation LSDatabaseGetLog

void ___LSDatabaseGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.launchservices", "db");
  v1 = (void *)_LSDatabaseGetLog_result;
  _LSDatabaseGetLog_result = (uint64_t)v0;

}

@end
