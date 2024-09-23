@implementation BKLogSystemShell

void __BKLogSystemShell_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "SystemShell");
  v1 = (void *)BKLogSystemShell___logObj;
  BKLogSystemShell___logObj = (uint64_t)v0;

}

@end
