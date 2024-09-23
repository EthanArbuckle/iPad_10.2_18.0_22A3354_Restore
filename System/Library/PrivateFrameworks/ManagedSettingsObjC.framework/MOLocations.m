@implementation MOLocations

+ (NSURL)effectiveSettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effectiveSettingsDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("EffectiveSettings.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (id)effectiveSettingsDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "sharedDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.ManagedSettings"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedDirectory
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile"), 1);
}

@end
