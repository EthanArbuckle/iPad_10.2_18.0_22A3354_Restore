@implementation NTKPlayStartupSound

uint64_t __NTKPlayStartupSound_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v3;
  Boolean keyExistsAndHasValidFormat;

  result = NTKInternalBuild(a1, a2);
  if ((_DWORD)result)
  {
    NTKPlayStartupSound_playStartupSound = CFPreferencesGetAppBooleanValue(CFSTR("PlayStartupSound"), CFSTR("com.apple.NanoTimeKit.face"), 0) != 0;
    keyExistsAndHasValidFormat = 0;
    result = CFPreferencesGetAppIntegerValue(CFSTR("StartupSoundID"), CFSTR("com.apple.NanoTimeKit.face"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v3 = result;
    else
      v3 = 1487;
    NTKPlayStartupSound_systemSoundID = v3;
  }
  return result;
}

@end
