@implementation LACLogBiometry

void __LACLogBiometry_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "Biometry");
  v1 = (void *)LACLogBiometry___logObj;
  LACLogBiometry___logObj = (uint64_t)v0;

}

@end
