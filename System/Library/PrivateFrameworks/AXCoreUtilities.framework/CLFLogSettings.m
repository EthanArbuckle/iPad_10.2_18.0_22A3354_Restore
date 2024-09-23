@implementation CLFLogSettings

void __CLFLogSettings_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "CLFSettings");
  v1 = (void *)CLFLogSettings___logObj;
  CLFLogSettings___logObj = (uint64_t)v0;

}

@end
