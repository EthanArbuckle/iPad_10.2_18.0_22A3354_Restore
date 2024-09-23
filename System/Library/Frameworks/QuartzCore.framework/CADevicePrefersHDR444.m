@implementation CADevicePrefersHDR444

uint64_t __CADevicePrefersHDR444_block_invoke()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  CADevicePrefersHDR444::b = 1;
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("CAPrefersHDR444"), CFSTR("com.apple.coreanimation"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    CADevicePrefersHDR444::b = (_DWORD)result != 0;
  return result;
}

@end
