@implementation AMUIServicesLogGeneral

void __AMUIServicesLogGeneral_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ambient.AmbientUIServices", "General");
  v1 = (void *)AMUIServicesLogGeneral___logObj;
  AMUIServicesLogGeneral___logObj = (uint64_t)v0;

}

@end
