@implementation TelephonyPreferencesLibrary

void *__TelephonyPreferencesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/TelephonyPreferences.framework/TelephonyPreferences", 2);
  TelephonyPreferencesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
