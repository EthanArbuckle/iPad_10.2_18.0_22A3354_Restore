@implementation APDefaultFrameworkLog

void __APDefaultFrameworkLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.appprotection", "framework");
  v1 = (void *)APDefaultFrameworkLog_log;
  APDefaultFrameworkLog_log = (uint64_t)v0;

}

@end
