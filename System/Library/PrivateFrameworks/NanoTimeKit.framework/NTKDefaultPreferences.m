@implementation NTKDefaultPreferences

+ (BOOL)monitorColorBundleFolder
{
  __CFString *v2;
  void *v3;
  void *v4;
  char v5;

  NSStringFromSelector(a2);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)CFPreferencesCopyAppValue(v2, CFSTR("com.apple.NanoTimeKit"));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (BOOL)aegirShowAllOptions
{
  __CFString *v2;
  void *v3;
  void *v4;
  char v5;

  NSStringFromSelector(a2);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)CFPreferencesCopyAppValue(v2, CFSTR("com.apple.NanoTimeKit"));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

@end
