@implementation VOTLogKeyboard

void __VOTLogKeyboard_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTKeyboard");
  v1 = (void *)VOTLogKeyboard___logObj;
  VOTLogKeyboard___logObj = (uint64_t)v0;

}

@end
