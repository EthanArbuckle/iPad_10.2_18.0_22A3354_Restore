@implementation SecOTRGetDefaultsWriteSeconds

CFIndex __SecOTRGetDefaultsWriteSeconds_block_invoke()
{
  CFIndex result;
  uint64_t v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(CFSTR("OTR"), CFSTR("com.apple.security"), &keyExistsAndHasValidFormat);
  v1 = 900;
  if (keyExistsAndHasValidFormat)
    v1 = result;
  SecOTRGetDefaultsWriteSeconds_seconds = v1;
  return result;
}

@end
