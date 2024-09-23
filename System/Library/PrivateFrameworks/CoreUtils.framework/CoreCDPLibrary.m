@implementation CoreCDPLibrary

void *__CoreCDPLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreCDP.framework/CoreCDP", 2);
  CoreCDPLibrary_sLib = (uint64_t)result;
  return result;
}

@end
