@implementation CelestialLibrary

void *__CelestialLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Celestial.framework/Celestial", 2);
  CelestialLibrary_sLib = (uint64_t)result;
  return result;
}

@end
