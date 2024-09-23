@implementation LACLogDTOClient

void __LACLogDTOClient_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "DTO_Client");
  v1 = (void *)LACLogDTOClient___logObj;
  LACLogDTOClient___logObj = (uint64_t)v0;

}

@end
