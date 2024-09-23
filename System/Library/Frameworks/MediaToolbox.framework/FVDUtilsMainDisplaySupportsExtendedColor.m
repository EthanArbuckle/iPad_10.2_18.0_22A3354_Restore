@implementation FVDUtilsMainDisplaySupportsExtendedColor

uint64_t __FVDUtilsMainDisplaySupportsExtendedColor_block_invoke()
{
  uint64_t result;

  result = CelestialIsAppleTV();
  if (!(_DWORD)result)
  {
    result = MGGetBoolAnswer();
    FVDUtilsMainDisplaySupportsExtendedColor_result = result;
  }
  return result;
}

@end
