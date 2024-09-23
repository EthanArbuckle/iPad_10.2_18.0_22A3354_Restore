@implementation VOTLogLayoutChange

void __VOTLogLayoutChange_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTLayoutChange");
  v1 = (void *)VOTLogLayoutChange___logObj;
  VOTLogLayoutChange___logObj = (uint64_t)v0;

}

@end
