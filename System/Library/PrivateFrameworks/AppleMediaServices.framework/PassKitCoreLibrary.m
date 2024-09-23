@implementation PassKitCoreLibrary

void *__PassKitCoreLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/PassKitCore.framework/PassKitCore", 2);
  PassKitCoreLibrary_sLib = (uint64_t)result;
  return result;
}

void *__PassKitCoreLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/PassKitCore.framework/PassKitCore", 2);
  PassKitCoreLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void *__PassKitCoreLibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/PassKitCore.framework/PassKitCore", 2);
  PassKitCoreLibrary_sLib_1 = (uint64_t)result;
  return result;
}

@end
