@implementation CGCMSUtilsGetICCProfileInfo

uint64_t (*__CGCMSUtilsGetICCProfileInfo_block_invoke())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileGetMD5");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  CGCMSUtilsGetICCProfileInfo_f = (uint64_t (*)(_QWORD))v1;
  return result;
}

uint64_t (*__CGCMSUtilsGetICCProfileInfo_block_invoke_9())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileIsMatrixBased");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  CGCMSUtilsGetICCProfileInfo_f_42 = (uint64_t (*)(_QWORD))v1;
  return result;
}

uint64_t (*__CGCMSUtilsGetICCProfileInfo_block_invoke_7())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileContainsTag");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  CGCMSUtilsGetICCProfileInfo_f_32 = (uint64_t (*)(_QWORD, _QWORD))v1;
  return result;
}

uint64_t (*__CGCMSUtilsGetICCProfileInfo_block_invoke_6())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileIsWideGamut");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  CGCMSUtilsGetICCProfileInfo_f_27 = (uint64_t (*)(_QWORD))v1;
  return result;
}

uint64_t (*__CGCMSUtilsGetICCProfileInfo_block_invoke_5())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileIsMatrixBased");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  CGCMSUtilsGetICCProfileInfo_f_22 = (uint64_t (*)(_QWORD))v1;
  return result;
}

uint64_t (*__CGCMSUtilsGetICCProfileInfo_block_invoke_4())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileIsHLGBased");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  CGCMSUtilsGetICCProfileInfo_f_17 = (uint64_t (*)(_QWORD))v1;
  return result;
}

uint64_t (*__CGCMSUtilsGetICCProfileInfo_block_invoke_3())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileIsPQBased");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  CGCMSUtilsGetICCProfileInfo_f_12 = (uint64_t (*)(_QWORD))v1;
  return result;
}

uint64_t (*__CGCMSUtilsGetICCProfileInfo_block_invoke_2())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyHeader");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  CGCMSUtilsGetICCProfileInfo_f_7 = (uint64_t (*)(_QWORD))v1;
  return result;
}

uint64_t (*__CGCMSUtilsGetICCProfileInfo_block_invoke_8())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileIsMatrixBased");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  CGCMSUtilsGetICCProfileInfo_f_38 = (uint64_t (*)(_QWORD))v1;
  return result;
}

@end
