@implementation APDefaultAuthenticationLog

void __APDefaultAuthenticationLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.appprotection", "authentication");
  v1 = (void *)APDefaultAuthenticationLog_log;
  APDefaultAuthenticationLog_log = (uint64_t)v0;

}

@end
