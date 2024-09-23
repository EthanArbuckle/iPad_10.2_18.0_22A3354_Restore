@implementation MessageProtectionLog

void __MessageProtectionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.messageprotection", "MessageProtection");
  v1 = (void *)MessageProtectionLog_log;
  MessageProtectionLog_log = (uint64_t)v0;

}

@end
