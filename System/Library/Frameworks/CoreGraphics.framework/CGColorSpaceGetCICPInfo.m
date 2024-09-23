@implementation CGColorSpaceGetCICPInfo

uint64_t (*__CGColorSpaceGetCICPInfo_block_invoke())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileGetCICPInfo");
  v1 = colorsync_smart_null_6743;
  if (result)
    v1 = result;
  CGColorSpaceGetCICPInfo_f = v1;
  return result;
}

@end
