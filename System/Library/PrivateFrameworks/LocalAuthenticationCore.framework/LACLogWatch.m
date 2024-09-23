@implementation LACLogWatch

void __LACLogWatch_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "Watch");
  v1 = (void *)LACLogWatch___logObj;
  LACLogWatch___logObj = (uint64_t)v0;

}

@end
