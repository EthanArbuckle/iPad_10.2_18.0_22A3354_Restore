@implementation CarPlayServicesLibrary

void *__CarPlayServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CarPlayServices.framework/CarPlayServices", 2);
  CarPlayServicesLibrary_sLib = (uint64_t)result;
  return result;
}

void *__CarPlayServicesLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CarPlayServices.framework/CarPlayServices", 2);
  CarPlayServicesLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
