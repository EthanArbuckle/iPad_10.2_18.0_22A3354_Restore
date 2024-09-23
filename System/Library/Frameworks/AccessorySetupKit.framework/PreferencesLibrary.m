@implementation PreferencesLibrary

void *__PreferencesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Preferences.framework/Preferences", 2);
  PreferencesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
