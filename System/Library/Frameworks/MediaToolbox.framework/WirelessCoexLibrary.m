@implementation WirelessCoexLibrary

void *__WirelessCoexLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/WirelessCoex.framework/WirelessCoex", 2);
  WirelessCoexLibrary_sLib = (uint64_t)result;
  return result;
}

@end
