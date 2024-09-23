@implementation VOTLogHandwriting

void __VOTLogHandwriting_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTHandwriting");
  v1 = (void *)VOTLogHandwriting___logObj;
  VOTLogHandwriting___logObj = (uint64_t)v0;

}

@end
