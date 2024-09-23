@implementation SIBullseyeNoForceUnigramsDefault

uint64_t __SIBullseyeNoForceUnigramsDefault_block_invoke()
{
  const __CFString *v0;
  uint64_t result;
  BOOL v2;
  char v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v0 = (const __CFString *)*MEMORY[0x1E0C9B248];
  CFPreferencesAddSuitePreferencesToApp((CFStringRef)*MEMORY[0x1E0C9B248], CFSTR("com.apple.spotlightui"));
  result = CFPreferencesGetAppBooleanValue(CFSTR("SIBullseyeNoForceUnigrams"), v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v2 = (_DWORD)result == 0;
  else
    v2 = 1;
  v3 = !v2;
  SIBullseyeNoForceUnigramsDefault_sUnigrams = v3;
  return result;
}

@end
