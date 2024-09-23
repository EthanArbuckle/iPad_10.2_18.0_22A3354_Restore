@implementation PassKitLibrary

void *__PassKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/PassKit.framework/PassKit", 2);
  PassKitLibrary_sLib = (uint64_t)result;
  return result;
}

void *__PassKitLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/PassKit.framework/PassKit", 2);
  PassKitLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void *__PassKitLibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/PassKit.framework/PassKit", 2);
  PassKitLibrary_sLib_1 = (uint64_t)result;
  return result;
}

void *__PassKitLibrary_block_invoke_2()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/PassKit.framework/PassKit", 2);
  PassKitLibrary_sLib_2 = (uint64_t)result;
  return result;
}

@end
