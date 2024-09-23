@implementation AMUILogWidgets

void __AMUILogWidgets_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ambient.AmbientUI", "Widgets");
  v1 = (void *)AMUILogWidgets___logObj;
  AMUILogWidgets___logObj = (uint64_t)v0;

}

@end
