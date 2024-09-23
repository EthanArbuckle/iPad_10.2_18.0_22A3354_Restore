@implementation LACLogDTOLocation

void __LACLogDTOLocation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "DTO_Location");
  v1 = (void *)LACLogDTOLocation___logObj;
  LACLogDTOLocation___logObj = (uint64_t)v0;

}

@end
