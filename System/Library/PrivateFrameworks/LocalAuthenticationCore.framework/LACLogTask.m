@implementation LACLogTask

void __LACLogTask_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "Task");
  v1 = (void *)LACLogTask___logObj;
  LACLogTask___logObj = (uint64_t)v0;

}

@end
