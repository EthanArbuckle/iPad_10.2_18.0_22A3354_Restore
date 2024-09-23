@implementation WirelessProximityLibrary

void *__WirelessProximityLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/WirelessProximity.framework/WirelessProximity", 2);
  WirelessProximityLibrary_sLib = (uint64_t)result;
  return result;
}

@end
