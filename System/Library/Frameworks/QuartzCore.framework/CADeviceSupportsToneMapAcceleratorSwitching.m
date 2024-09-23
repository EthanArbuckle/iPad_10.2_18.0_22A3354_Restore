@implementation CADeviceSupportsToneMapAcceleratorSwitching

uint64_t __CADeviceSupportsToneMapAcceleratorSwitching_block_invoke()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat[16];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keyExistsAndHasValidFormat = xmmword_18475F368;
  v2 = 802516499;
  if (MGIsDeviceOneOfType())
    CADeviceSupportsToneMapAcceleratorSwitching::accelerator_switching = 1;
  keyExistsAndHasValidFormat[0] = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("CAEnableToneMapAcceleratorSwitching"), CFSTR("com.apple.coreanimation"), keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat[0])
    CADeviceSupportsToneMapAcceleratorSwitching::accelerator_switching = (_DWORD)result != 0;
  return result;
}

@end
