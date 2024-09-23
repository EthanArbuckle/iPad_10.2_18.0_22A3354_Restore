@implementation APUIDefaultFrameworkLog

void __APUIDefaultFrameworkLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.appprotection", "frameworkUI");
  v1 = (void *)APUIDefaultFrameworkLog_log;
  APUIDefaultFrameworkLog_log = (uint64_t)v0;

}

@end
