@implementation LACLogPreboard

void __LACLogPreboard_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "Preboard");
  v1 = (void *)LACLogPreboard___logObj;
  LACLogPreboard___logObj = (uint64_t)v0;

}

@end
