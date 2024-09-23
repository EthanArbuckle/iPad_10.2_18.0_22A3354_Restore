@implementation AMLogRedMode

void __AMLogRedMode_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ambient.Ambient", "RedMode");
  v1 = (void *)AMLogRedMode___logObj;
  AMLogRedMode___logObj = (uint64_t)v0;

}

@end
