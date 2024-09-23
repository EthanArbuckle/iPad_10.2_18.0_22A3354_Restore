@implementation WorldClockPreferences

- (id)lastModified
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)CitiesLastModifiedKey, CFSTR("com.apple.mobiletimer"));
}

- (BOOL)cityDataNeedsUpdate
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)CFPreferencesCopyAppValue((CFStringRef)LatestUpdateVersion, CFSTR("com.apple.mobiletimer"));
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operatingSystemVersionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqualToString:", v4) ^ 1;

  return v5;
}

- (id)cities
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)CitiesKey, CFSTR("com.apple.mobiletimer"));
}

- (BOOL)defaultCitiesAdded
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)DefaultCityAddedKey, CFSTR("com.apple.mobiletimer"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (id)defaultsKeys
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CitiesKey;
  v3[1] = CitiesLastModifiedKey;
  v3[2] = DefaultCityAddedKey;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastModified:(id)a3
{
  CFPreferencesSetAppValue((CFStringRef)CitiesLastModifiedKey, a3, CFSTR("com.apple.mobiletimer"));
}

- (void)setCities:(id)a3
{
  CFPreferencesSetAppValue((CFStringRef)CitiesKey, a3, CFSTR("com.apple.mobiletimer"));
}

- (void)setDefaultCitiesAdded:(BOOL)a3
{
  CFPreferencesSetAppValue((CFStringRef)DefaultCityAddedKey, (CFPropertyListRef)*MEMORY[0x1E0C9AE50], CFSTR("com.apple.mobiletimer"));
}

- (BOOL)synchronize
{
  return CFPreferencesAppSynchronize(CFSTR("com.apple.mobiletimer")) != 0;
}

- (void)cityDataUpdated
{
  void *v2;
  void *value;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operatingSystemVersionString");
  value = (void *)objc_claimAutoreleasedReturnValue();

  CFPreferencesSetAppValue((CFStringRef)LatestUpdateVersion, value, CFSTR("com.apple.mobiletimer"));
}

- (void)clearOutCityUpdatePref
{
  CFPreferencesSetAppValue((CFStringRef)LatestUpdateVersion, 0, CFSTR("com.apple.mobiletimer"));
}

@end
