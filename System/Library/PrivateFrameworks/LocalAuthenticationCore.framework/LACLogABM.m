@implementation LACLogABM

void __LACLogABM_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "ABM");
  v1 = (void *)LACLogABM___logObj;
  LACLogABM___logObj = (uint64_t)v0;

}

@end
