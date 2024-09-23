@implementation NSUserDefaults(MFUtilities)

+ (void)mf_setCompositionServicesPreferenceValue:()MFUtilities forKey:
{
  __CFString *v5;
  const __CFString *v6;
  id value;

  value = a3;
  v5 = a4;
  v6 = (const __CFString *)_CopyCompositionServicesDomain();
  if (v6)
  {
    CFPreferencesSetAppValue(v5, value, v6);
    CFPreferencesAppSynchronize(v6);
    CFRelease(v6);
  }

}

+ (CFPropertyListRef)mf_copyCompositionServicesPreferenceValueForKey:()MFUtilities
{
  __CFString *v3;
  const __CFString *v4;
  CFPropertyListRef v5;

  v3 = a3;
  v4 = (const __CFString *)_CopyCompositionServicesDomain();
  if (v4)
  {
    v5 = CFPreferencesCopyAppValue(v3, v4);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
