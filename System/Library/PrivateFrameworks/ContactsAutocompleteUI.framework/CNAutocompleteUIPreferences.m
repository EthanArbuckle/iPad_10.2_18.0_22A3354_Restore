@implementation CNAutocompleteUIPreferences

+ (void)setCompositionServicesPreferenceValue:(id)a3 forKey:(id)a4
{
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  id value;

  value = a3;
  v5 = (__CFString *)a4;
  v6 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v6)
  {
    v7 = v6;
    CFPreferencesSetAppValue(v5, value, v6);
    CFPreferencesAppSynchronize(v7);
    CFRelease(v7);
  }

}

+ (id)copyCompositionServicesPreferenceValueForKey:(id)a3
{
  __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  CFPropertyListRef v6;

  v3 = (__CFString *)a3;
  v4 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v4)
  {
    v5 = v4;
    v6 = CFPreferencesCopyAppValue(v3, v4);
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return (id)v6;
}

@end
