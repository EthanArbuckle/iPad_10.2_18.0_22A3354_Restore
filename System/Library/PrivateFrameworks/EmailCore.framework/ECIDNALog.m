@implementation ECIDNALog

void __ECIDNALog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "ECIDNA");
  v1 = (void *)ECIDNALog_log;
  ECIDNALog_log = (uint64_t)v0;

}

@end
