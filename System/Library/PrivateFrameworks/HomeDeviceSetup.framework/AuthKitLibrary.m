@implementation AuthKitLibrary

void *__AuthKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit", 2);
  AuthKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
