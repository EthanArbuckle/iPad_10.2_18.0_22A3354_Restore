@implementation CADeviceUseCIF10

uint64_t __CADeviceUseCIF10_block_invoke()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  result = MGGetBoolAnswer();
  CADeviceUseCIF10::enable_cif10 = result;
  if ((_DWORD)result)
  {
    keyExistsAndHasValidFormat = 0;
    result = CFPreferencesGetAppBooleanValue(CFSTR("CAEnableDeepFramebuffer"), (CFStringRef)*MEMORY[0x1E0C9B248], &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      CADeviceUseCIF10::enable_cif10 = (_DWORD)result != 0;
  }
  return result;
}

@end
