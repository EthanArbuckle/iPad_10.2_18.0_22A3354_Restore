@implementation CMIOPreferences

CFDictionaryRef __CMIOPreferences_block_invoke()
{
  CFDictionaryRef result;

  result = CFPreferencesCopyMultiple(0, CFSTR("com.apple.cmio"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  CMIOPreferences::cmioPref = (uint64_t)result;
  return result;
}

@end
