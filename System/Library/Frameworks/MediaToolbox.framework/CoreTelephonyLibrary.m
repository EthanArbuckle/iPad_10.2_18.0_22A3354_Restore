@implementation CoreTelephonyLibrary

void *__CoreTelephonyLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", 2);
  CoreTelephonyLibrary_sLib = (uint64_t)result;
  return result;
}

@end
