@implementation VOTLogRotor

void __VOTLogRotor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTRotor");
  v1 = (void *)VOTLogRotor___logObj;
  VOTLogRotor___logObj = (uint64_t)v0;

}

@end
