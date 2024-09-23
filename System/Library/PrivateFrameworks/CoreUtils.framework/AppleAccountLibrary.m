@implementation AppleAccountLibrary

void *__AppleAccountLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleAccount.framework/AppleAccount", 2);
  AppleAccountLibrary_sLib = (uint64_t)result;
  return result;
}

void *__AppleAccountLibrary_block_invoke_8099()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleAccount.framework/AppleAccount", 2);
  AppleAccountLibrary_sLib_8100 = (uint64_t)result;
  return result;
}

@end
