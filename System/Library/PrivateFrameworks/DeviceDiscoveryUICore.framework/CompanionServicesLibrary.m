@implementation CompanionServicesLibrary

void *__CompanionServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CompanionServices.framework/CompanionServices", 2);
  CompanionServicesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
