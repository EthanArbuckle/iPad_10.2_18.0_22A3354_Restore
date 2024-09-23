@implementation CFPrefsWritingToExternalAppCloudPreferencesEnabled

uint64_t ___CFPrefsWritingToExternalAppCloudPreferencesEnabled_block_invoke()
{
  const char *v0;
  uint64_t result;
  uint64_t CacheStringForBundleID;
  BOOL v3;

  v0 = _CFProcessPath();
  result = strcmp(v0, "/usr/bin/defaults");
  if ((_DWORD)result)
  {
    CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(CFSTR("kCFPreferencesCurrentApplication"));
    result = _CFPrefsGetCacheStringForBundleID(CFSTR("com.apple.Preferences"));
    v3 = CacheStringForBundleID == result;
  }
  else
  {
    v3 = 1;
  }
  _CFPrefsOverrideEnableWritingToExternalAppCloudPreferences = v3;
  return result;
}

@end
