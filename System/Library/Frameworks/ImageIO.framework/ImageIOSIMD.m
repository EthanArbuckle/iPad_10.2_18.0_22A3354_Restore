@implementation ImageIOSIMD

void __ImageIOSIMD_GetVectorLevel_block_invoke()
{
  if (ImageIOSIMD_GetHardwareVectorLevel::hardwarePredicate != -1)
    dispatch_once(&ImageIOSIMD_GetHardwareVectorLevel::hardwarePredicate, &__block_literal_global_12);
  vectorLevel = ImageIOSIMD_GetHardwareVectorLevel::hardwareLevel;
}

uint64_t __ImageIOSIMD_GetHardwareVectorLevel_block_invoke()
{
  uint64_t result;
  BOOL v1;
  uint64_t v2;
  size_t v3;
  int v4;

  v4 = 0;
  v3 = 4;
  result = sysctlbyname("hw.optional.FEAT_FP16", &v4, &v3, 0, 0);
  if (v4)
    v1 = (_DWORD)result == 0;
  else
    v1 = 0;
  v2 = 5;
  if (!v1)
    v2 = 1;
  ImageIOSIMD_GetHardwareVectorLevel::hardwareLevel = v2;
  return result;
}

@end
