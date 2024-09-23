@implementation LACLogPasscodeService

void __LACLogPasscodeService_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "PasscodeService");
  v1 = (void *)LACLogPasscodeService___logObj;
  LACLogPasscodeService___logObj = (uint64_t)v0;

}

@end
