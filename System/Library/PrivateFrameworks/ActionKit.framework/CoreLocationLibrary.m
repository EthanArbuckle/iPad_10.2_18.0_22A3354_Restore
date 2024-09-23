@implementation CoreLocationLibrary

void *__CoreLocationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 2);
  CoreLocationLibrary_sLib = (uint64_t)result;
  return result;
}

void *__CoreLocationLibrary_block_invoke_44730()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 2);
  CoreLocationLibrary_sLib_44732 = (uint64_t)result;
  return result;
}

@end
