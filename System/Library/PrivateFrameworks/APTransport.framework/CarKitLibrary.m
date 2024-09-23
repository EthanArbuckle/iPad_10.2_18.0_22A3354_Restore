@implementation CarKitLibrary

void *__CarKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CarKit.framework/CarKit", 2);
  CarKitLibrary_sLib = (uint64_t)result;
  return result;
}

void *__CarKitLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CarKit.framework/CarKit", 2);
  CarKitLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
