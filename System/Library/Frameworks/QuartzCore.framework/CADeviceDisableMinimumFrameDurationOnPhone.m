@implementation CADeviceDisableMinimumFrameDurationOnPhone

const __CFDictionary *__CADeviceDisableMinimumFrameDurationOnPhone_block_invoke()
{
  __CFBundle *MainBundle;
  const __CFDictionary *result;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetInfoDictionary(MainBundle);
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("CADisableMinimumFrameDurationOnPhone"));
    if (result)
    {
      result = (const __CFDictionary *)CA_CFBoolValue(result);
      CADeviceDisableMinimumFrameDurationOnPhone::disabled = (char)result;
    }
  }
  return result;
}

@end
