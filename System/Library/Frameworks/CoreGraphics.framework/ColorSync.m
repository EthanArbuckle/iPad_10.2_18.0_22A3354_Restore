@implementation ColorSync

uint64_t (*__create_colorspace_with_ColorSync_profile_block_invoke_3())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyData");
  v1 = colorsync_smart_null_6743;
  if (result)
    v1 = result;
  create_colorspace_with_ColorSync_profile_f_181 = (uint64_t (*)(_QWORD, _QWORD))v1;
  return result;
}

uint64_t (*__create_colorspace_with_ColorSync_profile_block_invoke_2())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileVerify");
  v1 = colorsync_smart_null_6743;
  if (result)
    v1 = result;
  create_colorspace_with_ColorSync_profile_f_177 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))v1;
  return result;
}

uint64_t (*__create_colorspace_with_ColorSync_profile_block_invoke())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileGetTypeID");
  v1 = colorsync_smart_null_6743;
  if (result)
    v1 = result;
  create_colorspace_with_ColorSync_profile_f = v1;
  return result;
}

@end
