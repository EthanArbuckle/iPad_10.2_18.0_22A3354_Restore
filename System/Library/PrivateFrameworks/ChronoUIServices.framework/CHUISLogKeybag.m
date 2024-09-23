@implementation CHUISLogKeybag

void __CHUISLogKeybag_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.chrono", "Keybag");
  v1 = (void *)CHUISLogKeybag___logObj;
  CHUISLogKeybag___logObj = (uint64_t)v0;

}

@end
