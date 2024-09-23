@implementation SUUICelestialFramework

void *__SUUICelestialFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Celestial.framework/Celestial", 1);
  SUUICelestialFramework_sHandle = (uint64_t)result;
  return result;
}

@end
