@implementation AMLogGeneral

void __AMLogGeneral_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ambient.Ambient", "General");
  v1 = (void *)AMLogGeneral___logObj;
  AMLogGeneral___logObj = (uint64_t)v0;

}

@end
