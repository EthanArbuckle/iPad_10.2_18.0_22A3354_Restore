@implementation AMUILogGeneral

void __AMUILogGeneral_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ambient.AmbientUI", "General");
  v1 = (void *)AMUILogGeneral___logObj;
  AMUILogGeneral___logObj = (uint64_t)v0;

}

@end
