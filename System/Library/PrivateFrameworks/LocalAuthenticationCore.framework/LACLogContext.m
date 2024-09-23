@implementation LACLogContext

void __LACLogContext_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "Context");
  v1 = (void *)LACLogContext___logObj;
  LACLogContext___logObj = (uint64_t)v0;

}

@end
