@implementation ILDefaultLog

void __ILDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calls.identitylookup", "Default");
  v1 = (void *)ILDefaultLog_log;
  ILDefaultLog_log = (uint64_t)v0;

}

@end
