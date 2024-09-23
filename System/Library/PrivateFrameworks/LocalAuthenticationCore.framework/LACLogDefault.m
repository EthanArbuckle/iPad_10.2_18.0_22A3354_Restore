@implementation LACLogDefault

void __LACLogDefault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "Default");
  v1 = (void *)LACLogDefault___logObj;
  LACLogDefault___logObj = (uint64_t)v0;

}

@end
