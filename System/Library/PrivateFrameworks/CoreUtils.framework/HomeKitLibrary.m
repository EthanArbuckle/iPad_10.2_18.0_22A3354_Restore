@implementation HomeKitLibrary

void *__HomeKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/HomeKit.framework/HomeKit", 2);
  HomeKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
