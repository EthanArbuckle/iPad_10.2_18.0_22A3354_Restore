@implementation AuthKitUILibrary

void *__AuthKitUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AuthKitUI.framework/AuthKitUI", 2);
  AuthKitUILibrary_sLib = (uint64_t)result;
  return result;
}

@end
