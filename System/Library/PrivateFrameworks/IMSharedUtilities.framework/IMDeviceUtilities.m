@implementation IMDeviceUtilities

+ (BOOL)supportsSharedWithYou
{
  return !+[IMDeviceUtilities deviceIsLockedDown](IMDeviceUtilities, "deviceIsLockedDown");
}

+ (BOOL)supportsFocus
{
  return !+[IMDeviceUtilities deviceIsLockedDown](IMDeviceUtilities, "deviceIsLockedDown");
}

+ (void)setSupportsiMessageJunk:(BOOL)a3
{
  IMSetDomainBoolForKey();
}

+ (BOOL)deviceIsLockedDown
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_msgSend(v2, "objectForKey:inDomain:", CFSTR("LDMGlobalEnabled"), *MEMORY[0x1E0CB2B58]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v3, "BOOLValue");
  else
    return 0;
}

+ (BOOL)IMSupportsASTC
{
  return 1;
}

+ (BOOL)IMDeviceIsChinaRegion
{
  if (qword_1ECFC6C98 != -1)
    dispatch_once(&qword_1ECFC6C98, &unk_1E3FB34E8);
  return byte_1EE503AF0;
}

+ (BOOL)IMDeviceIsGreenTea
{
  if (qword_1ECFC7100 != -1)
    dispatch_once(&qword_1ECFC7100, &unk_1E3FB4728);
  return byte_1EE503B58;
}

+ (BOOL)IMDeviceIsIndiaRegion
{
  if (qword_1EE503E60 != -1)
    dispatch_once(&qword_1EE503E60, &unk_1E3FB3EE8);
  return byte_1EE503E58;
}

+ (BOOL)IMDeviceRegionIsEligibleToBeForcedIntoFilteringUnknownSender
{
  return MEMORY[0x1E0DE7D20](IMDeviceUtilities, sel_IMDeviceIsGreenTea);
}

+ (BOOL)supportsDataDetectors
{
  return !+[IMDeviceUtilities deviceIsLockedDown](IMDeviceUtilities, "deviceIsLockedDown");
}

+ (BOOL)supportsBusinessChat
{
  return !+[IMDeviceUtilities deviceIsLockedDown](IMDeviceUtilities, "deviceIsLockedDown");
}

+ (BOOL)supportsSpotlight
{
  return !+[IMDeviceUtilities deviceIsLockedDown](IMDeviceUtilities, "deviceIsLockedDown");
}

+ (BOOL)supportsFaceTime
{
  return !+[IMDeviceUtilities deviceIsLockedDown](IMDeviceUtilities, "deviceIsLockedDown");
}

+ (BOOL)supportsNameAndPhoto
{
  return !+[IMDeviceUtilities deviceIsLockedDown](IMDeviceUtilities, "deviceIsLockedDown");
}

+ (BOOL)supportsScreenEffects
{
  return !+[IMDeviceUtilities deviceIsLockedDown](IMDeviceUtilities, "deviceIsLockedDown");
}

+ (BOOL)supportsiMessageJunk
{
  return IMGetDomainBoolForKey();
}

+ (BOOL)isInternalCarryDevice
{
  void *v2;
  char v3;

  if (!+[IMDeviceUtilities isInternalInstall](IMDeviceUtilities, "isInternalInstall"))
    return 0;
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("ExperimentGroup"), CFSTR("com.apple.da"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("carry"));
  if (v2)
    CFRelease(v2);
  return v3;
}

+ (BOOL)isSeedInstall
{
  return 0;
}

+ (BOOL)isInternalInstall
{
  return os_variant_has_internal_ui();
}

@end
