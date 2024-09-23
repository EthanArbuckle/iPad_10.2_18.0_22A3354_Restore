@implementation CGImageIsOptimizedForSharing

uint64_t (*__CGImageIsOptimizedForSharing_block_invoke_3())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileContainsTag");
  v1 = colorsync_smart_null_4674;
  if (result)
    v1 = result;
  CGImageIsOptimizedForSharing_f_38 = (uint64_t (*)(_QWORD, _QWORD))v1;
  return result;
}

uint64_t (*__CGImageIsOptimizedForSharing_block_invoke_2())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCreate");
  v1 = colorsync_smart_null_4674;
  if (result)
    v1 = result;
  CGImageIsOptimizedForSharing_f = (uint64_t (*)(_QWORD, _QWORD))v1;
  return result;
}

CGColorSpaceRef __CGImageIsOptimizedForSharing_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName(CFSTR("kCGColorSpaceSRGB"));
  CGImageIsOptimizedForSharing_sRGB = (uint64_t)result;
  return result;
}

@end
