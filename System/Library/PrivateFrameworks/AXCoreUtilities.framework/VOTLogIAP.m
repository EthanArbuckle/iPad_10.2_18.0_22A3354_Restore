@implementation VOTLogIAP

void __VOTLogIAP_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTIAP");
  v1 = (void *)VOTLogIAP___logObj;
  VOTLogIAP___logObj = (uint64_t)v0;

}

@end
