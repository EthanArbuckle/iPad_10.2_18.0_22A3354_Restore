@implementation EMLogBIMI

void __EMLogBIMI_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "BIMI");
  v1 = (void *)EMLogBIMI_os_log;
  EMLogBIMI_os_log = (uint64_t)v0;

}

@end
