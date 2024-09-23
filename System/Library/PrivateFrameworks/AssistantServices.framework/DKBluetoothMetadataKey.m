@implementation DKBluetoothMetadataKey

Class __init_DKBluetoothMetadataKey_block_invoke()
{
  Class result;

  if (CoreDuetLibrary_sOnce != -1)
    dispatch_once(&CoreDuetLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("_DKBluetoothMetadataKey");
  class_DKBluetoothMetadataKey = (uint64_t)result;
  get_DKBluetoothMetadataKeyClass = (uint64_t (*)())_DKBluetoothMetadataKeyFunction;
  return result;
}

@end
