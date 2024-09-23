@implementation LACLogDTOEvent

void __LACLogDTOEvent_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "DTO_Event");
  v1 = (void *)LACLogDTOEvent___logObj;
  LACLogDTOEvent___logObj = (uint64_t)v0;

}

@end
