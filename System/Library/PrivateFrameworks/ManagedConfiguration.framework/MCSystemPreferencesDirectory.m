@implementation MCSystemPreferencesDirectory

void __MCSystemPreferencesDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(CFSTR("/Library/Managed Preferences/mobile"), "copy");
  v1 = (void *)MCSystemPreferencesDirectory_str;
  MCSystemPreferencesDirectory_str = v0;

}

@end
