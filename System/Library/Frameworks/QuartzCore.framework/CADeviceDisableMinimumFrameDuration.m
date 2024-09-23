@implementation CADeviceDisableMinimumFrameDuration

void __CADeviceDisableMinimumFrameDuration_block_invoke()
{
  __CFBundle *MainBundle;
  const __CFDictionary *InfoDictionary;
  const void *Value;
  BOOL v3;
  char v4;

  MainBundle = CFBundleGetMainBundle();
  InfoDictionary = CFBundleGetInfoDictionary(MainBundle);
  v3 = InfoDictionary
    && (Value = CFDictionaryGetValue(InfoDictionary, CFSTR("CADisableMinimumFrameDuration"))) != 0
    && CA_CFBoolValue(Value);
  if (CADeviceIsAppleBundle::once[0] != -1)
    dispatch_once(CADeviceIsAppleBundle::once, &__block_literal_global_254_9854);
  if (CADeviceIsAppleBundle::apple_bundle)
    v4 = 1;
  else
    v4 = v3;
  CADeviceDisableMinimumFrameDuration::disabled = v4;
}

@end
