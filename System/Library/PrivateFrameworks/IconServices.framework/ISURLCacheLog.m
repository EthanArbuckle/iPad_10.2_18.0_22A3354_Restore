@implementation ISURLCacheLog

void ___ISURLCacheLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iconservices", "url-cache");
  v1 = (void *)_ISURLCacheLog_log;
  _ISURLCacheLog_log = (uint64_t)v0;

}

@end
