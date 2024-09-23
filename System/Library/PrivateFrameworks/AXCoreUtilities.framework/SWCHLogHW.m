@implementation SWCHLogHW

void __SWCHLogHW_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "SWCHHW");
  v1 = (void *)SWCHLogHW___logObj;
  SWCHLogHW___logObj = (uint64_t)v0;

}

@end
