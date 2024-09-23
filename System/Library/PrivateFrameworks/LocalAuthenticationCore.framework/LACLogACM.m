@implementation LACLogACM

void __LACLogACM_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "ACM");
  v1 = (void *)LACLogACM___logObj;
  LACLogACM___logObj = (uint64_t)v0;

}

@end
