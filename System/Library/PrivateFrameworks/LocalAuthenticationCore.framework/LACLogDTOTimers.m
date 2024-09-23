@implementation LACLogDTOTimers

void __LACLogDTOTimers_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "DTO_Timers");
  v1 = (void *)LACLogDTOTimers___logObj;
  LACLogDTOTimers___logObj = (uint64_t)v0;

}

@end
