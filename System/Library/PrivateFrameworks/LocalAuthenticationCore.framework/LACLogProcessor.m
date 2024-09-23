@implementation LACLogProcessor

void __LACLogProcessor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "Processor");
  v1 = (void *)LACLogProcessor___logObj;
  LACLogProcessor___logObj = (uint64_t)v0;

}

@end
