@implementation AuthKitLibrary

void *__AuthKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit", 2);
  AuthKitLibrary_sLib = (uint64_t)result;
  return result;
}

void *__AuthKitLibrary_block_invoke_8088()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit", 2);
  AuthKitLibrary_sLib_8089 = (uint64_t)result;
  return result;
}

@end
