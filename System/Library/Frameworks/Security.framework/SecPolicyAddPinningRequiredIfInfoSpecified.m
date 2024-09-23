@implementation SecPolicyAddPinningRequiredIfInfoSpecified

CFTypeID __SecPolicyAddPinningRequiredIfInfoSpecified_block_invoke()
{
  CFTypeID result;
  const __CFBoolean *v1;
  CFTypeID v2;

  result = (CFTypeID)CFBundleGetMainBundle();
  if (result)
  {
    result = (CFTypeID)CFBundleGetInfoDictionary((CFBundleRef)result);
    if (result)
    {
      result = (CFTypeID)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("SecTrustPinningRequired"));
      if (result)
      {
        v1 = (const __CFBoolean *)result;
        v2 = CFGetTypeID((CFTypeRef)result);
        result = CFBooleanGetTypeID();
        if (v2 == result)
        {
          result = CFBooleanGetValue(v1);
          if ((_DWORD)result)
            SecPolicyAddPinningRequiredIfInfoSpecified_hasPinningRequiredKey = 1;
        }
      }
      SecPolicyAddPinningRequiredIfInfoSpecified_result = 1;
    }
  }
  return result;
}

@end
