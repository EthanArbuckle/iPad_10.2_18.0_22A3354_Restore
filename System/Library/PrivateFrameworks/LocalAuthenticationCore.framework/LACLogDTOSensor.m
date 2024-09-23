@implementation LACLogDTOSensor

void __LACLogDTOSensor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "DTO_Sensor");
  v1 = (void *)LACLogDTOSensor___logObj;
  LACLogDTOSensor___logObj = (uint64_t)v0;

}

@end
