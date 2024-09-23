@implementation VOTLogWebPageMovement

void __VOTLogWebPageMovement_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTWebPageMovement");
  v1 = (void *)VOTLogWebPageMovement___logObj;
  VOTLogWebPageMovement___logObj = (uint64_t)v0;

}

@end
