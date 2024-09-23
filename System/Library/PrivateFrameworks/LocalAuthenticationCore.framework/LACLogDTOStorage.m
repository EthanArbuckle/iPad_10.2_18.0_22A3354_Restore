@implementation LACLogDTOStorage

void __LACLogDTOStorage_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "DTO_Storage");
  v1 = (void *)LACLogDTOStorage___logObj;
  LACLogDTOStorage___logObj = (uint64_t)v0;

}

@end
