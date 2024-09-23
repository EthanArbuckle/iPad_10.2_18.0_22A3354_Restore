@implementation NDSharedClientLog

void __NDSharedClientLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.newsd.client", "general");
  v1 = (void *)NDSharedClientLog_result;
  NDSharedClientLog_result = (uint64_t)v0;

}

@end
