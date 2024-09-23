@implementation NTKUpNextDemoTimeoutDuration

CFIndex __NTKUpNextDemoTimeoutDuration_block_invoke()
{
  CFIndex result;
  uint64_t v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(CFSTR("UpNextTimeoutDuration"), CFSTR("com.apple.NanoTimeKit.face"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = result;
  else
    v1 = 0;
  NTKUpNextDemoTimeoutDuration_defaultTimeout = v1;
  return result;
}

@end
