@implementation AMUILogInfograph

void __AMUILogInfograph_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ambient.AmbientUI", "Infograph");
  v1 = (void *)AMUILogInfograph___logObj;
  AMUILogInfograph___logObj = (uint64_t)v0;

}

@end
