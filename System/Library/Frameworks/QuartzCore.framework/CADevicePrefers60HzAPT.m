@implementation CADevicePrefers60HzAPT

const __CFDictionary *__CADevicePrefers60HzAPT_block_invoke()
{
  __CFBundle *MainBundle;
  const __CFDictionary *result;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetInfoDictionary(MainBundle);
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("CAEnableVariableFrameDuration"));
    if (result)
    {
      result = (const __CFDictionary *)CA_CFBoolValue(result);
      CADevicePrefers60HzAPT::enabled = (char)result;
    }
  }
  return result;
}

@end
