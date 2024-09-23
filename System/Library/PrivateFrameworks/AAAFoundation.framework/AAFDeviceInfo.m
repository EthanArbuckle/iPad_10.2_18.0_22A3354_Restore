@implementation AAFDeviceInfo

+ (BOOL)deviceIsAudioAccessory
{
  if (deviceIsAudioAccessory_onceToken != -1)
    dispatch_once(&deviceIsAudioAccessory_onceToken, &__block_literal_global_4);
  return deviceIsAudioAccessory_result;
}

uint64_t __39__AAFDeviceInfo_deviceIsAudioAccessory__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  deviceIsAudioAccessory_result = (_DWORD)result == 7;
  return result;
}

+ (BOOL)deviceIsiPad
{
  if (deviceIsiPad_onceToken != -1)
    dispatch_once(&deviceIsiPad_onceToken, &__block_literal_global_10);
  return deviceIsiPad_result;
}

uint64_t __29__AAFDeviceInfo_deviceIsiPad__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  deviceIsiPad_result = (_DWORD)result == 3;
  return result;
}

+ (BOOL)isDeviceUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

+ (BOOL)isVirtualMachine
{
  if (isVirtualMachine_onceToken != -1)
    dispatch_once(&isVirtualMachine_onceToken, &__block_literal_global_11);
  return isVirtualMachine_result;
}

uint64_t __33__AAFDeviceInfo_isVirtualMachine__block_invoke()
{
  uint64_t result;
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  result = sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0);
  if (!(_DWORD)result)
    isVirtualMachine_result = v2 != 0;
  return result;
}

+ (id)localSecretType
{
  void *v2;
  const __CFString *v3;

  if (!objc_msgSend(a1, "_hasLocalSecret"))
    return CFSTR("None");
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "unlockScreenType"))
    v3 = CFSTR("Password");
  else
    v3 = CFSTR("Passcode");

  return (id)v3;
}

+ (BOOL)_hasLocalSecret
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

@end
