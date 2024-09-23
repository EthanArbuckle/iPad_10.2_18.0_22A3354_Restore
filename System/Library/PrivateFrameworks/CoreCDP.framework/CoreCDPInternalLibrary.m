@implementation CoreCDPInternalLibrary

void *__CoreCDPInternalLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreCDPInternal.framework/CoreCDPInternal", 2);
  CoreCDPInternalLibrary_sLib = (uint64_t)result;
  return result;
}

@end
