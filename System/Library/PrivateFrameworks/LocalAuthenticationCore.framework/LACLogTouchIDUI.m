@implementation LACLogTouchIDUI

void __LACLogTouchIDUI_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "TouchIDUI");
  v1 = (void *)LACLogTouchIDUI___logObj;
  LACLogTouchIDUI___logObj = (uint64_t)v0;

}

@end
