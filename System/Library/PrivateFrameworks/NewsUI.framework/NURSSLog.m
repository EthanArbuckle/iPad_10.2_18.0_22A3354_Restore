@implementation NURSSLog

void __NURSSLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.news", "RSS");
  v1 = (void *)NURSSLog_result;
  NURSSLog_result = (uint64_t)v0;

}

@end
