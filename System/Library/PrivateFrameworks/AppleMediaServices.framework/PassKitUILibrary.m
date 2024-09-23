@implementation PassKitUILibrary

void *__PassKitUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/PassKitUI.framework/PassKitUI", 2);
  PassKitUILibrary_sLib = (uint64_t)result;
  return result;
}

void *__PassKitUILibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/PassKitUI.framework/PassKitUI", 2);
  PassKitUILibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
