@implementation LACLogDTOLostMode

void __LACLogDTOLostMode_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "DTO_LostMode");
  v1 = (void *)LACLogDTOLostMode___logObj;
  LACLogDTOLostMode___logObj = (uint64_t)v0;

}

@end
