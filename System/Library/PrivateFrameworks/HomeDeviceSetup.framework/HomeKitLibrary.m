@implementation HomeKitLibrary

void *__HomeKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/HomeKit.framework/HomeKit", 2);
  HomeKitLibrary_sLib = (uint64_t)result;
  return result;
}

void *__HomeKitLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/HomeKit.framework/HomeKit", 2);
  HomeKitLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void *__HomeKitLibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/HomeKit.framework/HomeKit", 2);
  HomeKitLibrary_sLib_1 = (uint64_t)result;
  return result;
}

@end
