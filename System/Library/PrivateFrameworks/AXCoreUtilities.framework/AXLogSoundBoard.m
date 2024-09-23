@implementation AXLogSoundBoard

void __AXLogSoundBoard_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXSoundBoard");
  v1 = (void *)AXLogSoundBoard___logObj;
  AXLogSoundBoard___logObj = (uint64_t)v0;

}

@end
