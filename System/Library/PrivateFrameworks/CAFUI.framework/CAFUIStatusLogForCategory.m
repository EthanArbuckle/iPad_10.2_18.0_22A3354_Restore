@implementation CAFUIStatusLogForCategory

void __CAFUIStatusLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CAFUI.status", "Default");
  v1 = (void *)CAFUIStatusLogForCategory_logObjects_0;
  CAFUIStatusLogForCategory_logObjects_0 = (uint64_t)v0;

}

@end
