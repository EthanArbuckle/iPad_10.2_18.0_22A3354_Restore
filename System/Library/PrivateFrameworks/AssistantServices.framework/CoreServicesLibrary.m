@implementation CoreServicesLibrary

void *__CoreServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreServices.framework/CoreServices", 2);
  CoreServicesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
