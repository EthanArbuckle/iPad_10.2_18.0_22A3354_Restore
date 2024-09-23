@implementation CADeviceSupportsAndromeda

uint64_t __CADeviceSupportsAndromeda_block_invoke()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  CADeviceSupportsAndromeda::supports_andromeda = MGGetBoolAnswer();
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("CAEnableAndromeda"), (CFStringRef)*MEMORY[0x1E0C9B248], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    CADeviceSupportsAndromeda::supports_andromeda = (_DWORD)result != 0;
  return result;
}

@end
