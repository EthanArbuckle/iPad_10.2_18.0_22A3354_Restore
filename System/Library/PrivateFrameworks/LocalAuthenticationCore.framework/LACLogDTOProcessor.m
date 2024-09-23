@implementation LACLogDTOProcessor

void __LACLogDTOProcessor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "DTO_Processor");
  v1 = (void *)LACLogDTOProcessor___logObj;
  LACLogDTOProcessor___logObj = (uint64_t)v0;

}

@end
