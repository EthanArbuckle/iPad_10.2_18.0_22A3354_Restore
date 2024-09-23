@implementation LACLogSharedMode

void __LACLogSharedMode_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "SharedMode");
  v1 = (void *)LACLogSharedMode___logObj;
  LACLogSharedMode___logObj = (uint64_t)v0;

}

@end
