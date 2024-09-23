@implementation NTKUseComplicationSnapshotService

uint64_t __NTKUseComplicationSnapshotService_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  NTKUseComplicationSnapshotService___useComplicationSnapshotService = result;
  return result;
}

@end
