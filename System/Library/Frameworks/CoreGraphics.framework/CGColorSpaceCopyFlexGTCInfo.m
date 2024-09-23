@implementation CGColorSpaceCopyFlexGTCInfo

uint64_t (*__CGColorSpaceCopyFlexGTCInfo_block_invoke_2())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyFlexGTCInfo");
  v1 = colorsync_smart_null_6025;
  if (result)
    v1 = result;
  CGColorSpaceCopyFlexGTCInfo_f_41 = (uint64_t (*)(_QWORD))v1;
  return result;
}

uint64_t (*__CGColorSpaceCopyFlexGTCInfo_block_invoke())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileGetTypeID");
  v1 = colorsync_smart_null_6025;
  if (result)
    v1 = result;
  CGColorSpaceCopyFlexGTCInfo_f = v1;
  return result;
}

@end
