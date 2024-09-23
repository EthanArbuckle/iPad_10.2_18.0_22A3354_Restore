@implementation AssertionServicesLibrary

void *__AssertionServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AssertionServices.framework/AssertionServices", 2);
  AssertionServicesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
