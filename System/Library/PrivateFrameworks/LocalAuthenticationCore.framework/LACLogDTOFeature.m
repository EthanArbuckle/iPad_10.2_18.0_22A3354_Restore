@implementation LACLogDTOFeature

void __LACLogDTOFeature_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "DTO_Feature");
  v1 = (void *)LACLogDTOFeature___logObj;
  LACLogDTOFeature___logObj = (uint64_t)v0;

}

@end
