@implementation LACLogKeybag

void __LACLogKeybag_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "Keybag");
  v1 = (void *)LACLogKeybag___logObj;
  LACLogKeybag___logObj = (uint64_t)v0;

}

@end
