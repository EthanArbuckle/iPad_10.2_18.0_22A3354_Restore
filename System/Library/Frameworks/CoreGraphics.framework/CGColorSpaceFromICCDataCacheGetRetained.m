@implementation CGColorSpaceFromICCDataCacheGetRetained

uint64_t (*__CGColorSpaceFromICCDataCacheGetRetained_block_invoke_3())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileGetMD5");
  v1 = colorsync_smart_null_15295;
  if (result)
    v1 = result;
  CGColorSpaceFromICCDataCacheGetRetained_f_8 = (uint64_t (*)(_QWORD))v1;
  return result;
}

uint64_t (*__CGColorSpaceFromICCDataCacheGetRetained_block_invoke_2())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileVerify");
  v1 = colorsync_smart_null_15295;
  if (result)
    v1 = result;
  CGColorSpaceFromICCDataCacheGetRetained_f_3 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))v1;
  return result;
}

uint64_t (*__CGColorSpaceFromICCDataCacheGetRetained_block_invoke())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCreate");
  v1 = colorsync_smart_null_15295;
  if (result)
    v1 = result;
  CGColorSpaceFromICCDataCacheGetRetained_f = (uint64_t (*)(_QWORD, _QWORD))v1;
  return result;
}

@end
