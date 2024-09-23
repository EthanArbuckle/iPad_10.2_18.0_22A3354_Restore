@implementation TapToRadarKitLibrary

void *__TapToRadarKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/AppleInternal/Library/Frameworks/TapToRadarKit.framework/TapToRadarKit", 2);
  TapToRadarKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
