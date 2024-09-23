@implementation AMUILogProactive

void __AMUILogProactive_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ambient.AmbientUI", "Proactive");
  v1 = (void *)AMUILogProactive___logObj;
  AMUILogProactive___logObj = (uint64_t)v0;

}

@end
