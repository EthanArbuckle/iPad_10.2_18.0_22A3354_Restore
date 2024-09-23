@implementation CGColorSpaceCreateCopyWithNativeGamma

uint64_t (*__CGColorSpaceCreateCopyWithNativeGamma_block_invoke())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyData");
  v1 = colorsync_smart_null_20884;
  if (result)
    v1 = result;
  CGColorSpaceCreateCopyWithNativeGamma_f = (uint64_t (*)(_QWORD, _QWORD))v1;
  return result;
}

@end
