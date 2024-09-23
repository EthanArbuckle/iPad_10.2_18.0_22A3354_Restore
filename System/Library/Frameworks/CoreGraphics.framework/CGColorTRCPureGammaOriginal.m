@implementation CGColorTRCPureGammaOriginal

uint64_t (*__CGColorTRCPureGammaOriginal_block_invoke())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncPureGammaOriginalTRC");
  v1 = colorsync_smart_null_746;
  if (result)
    v1 = result;
  CGColorTRCPureGammaOriginal_f = (uint64_t (*)(_QWORD))v1;
  return result;
}

@end
