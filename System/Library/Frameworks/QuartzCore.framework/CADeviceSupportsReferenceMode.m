@implementation CADeviceSupportsReferenceMode

uint64_t __CADeviceSupportsReferenceMode_block_invoke()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat[16];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keyExistsAndHasValidFormat = xmmword_18475F2F0;
  v2 = 460218192;
  if (MGIsDeviceOneOfType())
    CADeviceSupportsReferenceMode::supports_ref = 1;
  keyExistsAndHasValidFormat[0] = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("CAEnableDisplayReferenceMode"), CFSTR("com.apple.coreanimation"), keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat[0])
    CADeviceSupportsReferenceMode::supports_ref = (_DWORD)result != 0;
  return result;
}

@end
