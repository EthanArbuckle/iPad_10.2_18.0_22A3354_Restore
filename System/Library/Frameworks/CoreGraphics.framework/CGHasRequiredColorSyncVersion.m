@implementation CGHasRequiredColorSyncVersion

uint64_t (*__CGHasRequiredColorSyncVersion_block_invoke_2())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncPrivateAPIVersion");
  v1 = colorsync_smart_null_15638;
  if (result)
    v1 = result;
  CGHasRequiredColorSyncVersion_f_15 = v1;
  return result;
}

uint64_t (*__CGHasRequiredColorSyncVersion_block_invoke())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncAPIVersion");
  v1 = colorsync_smart_null_15638;
  if (result)
    v1 = result;
  CGHasRequiredColorSyncVersion_f = v1;
  return result;
}

@end
