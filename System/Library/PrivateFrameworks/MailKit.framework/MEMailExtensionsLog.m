@implementation MEMailExtensionsLog

void __MEMailExtensionsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MailExtensions");
  v1 = (void *)MEMailExtensionsLog_os_log;
  MEMailExtensionsLog_os_log = (uint64_t)v0;

}

@end
