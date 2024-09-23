@implementation AMUILogDataLayer

void __AMUILogDataLayer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ambient.AmbientUI", "DataLayer");
  v1 = (void *)AMUILogDataLayer___logObj;
  AMUILogDataLayer___logObj = (uint64_t)v0;

}

@end
