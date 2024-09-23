@implementation ProximityLibrary

void *__ProximityLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Proximity.framework/Proximity", 2);
  ProximityLibrary_sLib = (uint64_t)result;
  return result;
}

@end
