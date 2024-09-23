@implementation AMLogPresentation

void __AMLogPresentation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ambient.Ambient", "Presentation");
  v1 = (void *)AMLogPresentation___logObj;
  AMLogPresentation___logObj = (uint64_t)v0;

}

@end
