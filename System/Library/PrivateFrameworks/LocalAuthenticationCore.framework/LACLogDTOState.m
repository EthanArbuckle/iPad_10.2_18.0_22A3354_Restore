@implementation LACLogDTOState

void __LACLogDTOState_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "DTO_State");
  v1 = (void *)LACLogDTOState___logObj;
  LACLogDTOState___logObj = (uint64_t)v0;

}

@end
