@implementation NUSharedLog

void __NUSharedLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.news", "NewsUI");
  v1 = (void *)NUSharedLog_result;
  NUSharedLog_result = (uint64_t)v0;

}

@end
