@implementation AMLogMotion

void __AMLogMotion_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ambient.Ambient", "Motion");
  v1 = (void *)AMLogMotion___logObj;
  AMLogMotion___logObj = (uint64_t)v0;

}

@end
