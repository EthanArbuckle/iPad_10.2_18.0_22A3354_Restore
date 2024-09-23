@implementation TelephonyUtilitiesLibrary

void *__TelephonyUtilitiesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities", 2);
  TelephonyUtilitiesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
