@implementation LACLogTests

void __LACLogTests_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "Tests");
  v1 = (void *)LACLogTests___logObj;
  LACLogTests___logObj = (uint64_t)v0;

}

@end
