@implementation LACLogDTOEnvironment

void __LACLogDTOEnvironment_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "DTO_Environment");
  v1 = (void *)LACLogDTOEnvironment___logObj;
  LACLogDTOEnvironment___logObj = (uint64_t)v0;

}

@end
