@implementation ProximityControlLibrary

void *__ProximityControlLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ProximityControl.framework/ProximityControl", 2);
  ProximityControlLibrary_sLib = (uint64_t)result;
  return result;
}

@end
