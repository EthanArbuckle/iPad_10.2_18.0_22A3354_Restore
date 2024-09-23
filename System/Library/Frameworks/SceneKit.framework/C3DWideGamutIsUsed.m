@implementation C3DWideGamutIsUsed

uint64_t __C3DWideGamutIsUsed_block_invoke()
{
  char v0;
  BOOL Bool;
  char IsSet;
  uint64_t result;
  char v4;

  if (C3DWasLinkedBeforeMajorOSYear2019())
  {
    v0 = C3DWasLinkedBeforeMajorOSYear2016();
    C3DWideGamutIsUsed_useWideGamut = v0 ^ 1;
    if ((v0 & 1) != 0)
      goto LABEL_13;
    Bool = C3DPreferencesGetBool(7);
    C3DWideGamutIsUsed_useWideGamut = !Bool;
    if (Bool)
      goto LABEL_13;
    IsSet = C3DGetInfoPlistFlagIsSet((uint64_t)CFSTR("SCNDisableWideGamut"), 0);
    result = 0;
    C3DWideGamutIsUsed_useWideGamut = IsSet ^ 1;
    if ((IsSet & 1) != 0)
      goto LABEL_14;
    goto LABEL_9;
  }
  C3DWideGamutIsUsed_useWideGamut = 0;
  C3DWideGamutIsUsed_useWideGamut = C3DPreferencesGetBool(8);
  if ((C3DWideGamutIsUsed_useWideGamut & 1) != 0)
  {
    C3DWideGamutIsUsed_useWideGamut = 1;
    goto LABEL_9;
  }
  v4 = C3DGetInfoPlistFlagIsSet((uint64_t)CFSTR("SCNEnableWideGamut"), 0);
  result = 0;
  C3DWideGamutIsUsed_useWideGamut = v4;
  if ((v4 & 1) != 0)
  {
LABEL_9:
    if (C3DMetalIsSupported_onceToken != -1)
      dispatch_once(&C3DMetalIsSupported_onceToken, &__block_literal_global_50);
    C3DWideGamutIsUsed_useWideGamut = C3DMetalIsSupported_supported;
    if (C3DMetalIsSupported_supported)
    {
      result = MGGetBoolAnswer();
      goto LABEL_14;
    }
LABEL_13:
    result = 0;
  }
LABEL_14:
  C3DWideGamutIsUsed_useWideGamut = result;
  return result;
}

@end
