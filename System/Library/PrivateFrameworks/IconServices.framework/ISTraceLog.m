@implementation ISTraceLog

void ___ISTraceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iconservices", "trace");
  v1 = (void *)_ISTraceLog_log;
  _ISTraceLog_log = (uint64_t)v0;

}

@end
