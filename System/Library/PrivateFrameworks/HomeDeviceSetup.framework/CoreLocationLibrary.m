@implementation CoreLocationLibrary

void *__CoreLocationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 2);
  CoreLocationLibrary_sLib = (uint64_t)result;
  return result;
}

void *__CoreLocationLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 2);
  CoreLocationLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
