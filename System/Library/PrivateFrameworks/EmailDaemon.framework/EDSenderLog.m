@implementation EDSenderLog

void __EDSenderLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "Sender");
  v1 = (void *)EDSenderLog_log;
  EDSenderLog_log = (uint64_t)v0;

}

@end
