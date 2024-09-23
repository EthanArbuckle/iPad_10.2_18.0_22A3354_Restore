@implementation NTKVictoryAppLauncher

+ (id)complication
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C94148], "legacyComplicationDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKRemoteComplication complicationWithClientIdentifier:appBundleIdentifier:complicationDescriptor:](NTKRemoteComplication, "complicationWithClientIdentifier:appBundleIdentifier:complicationDescriptor:", CFSTR("com.nike.nikeplus-gps.watchkitapp.watchkitextension"), CFSTR("com.nike.nikeplus-gps.watchkitapp"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)prelaunchApplicationIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.nike.nikeplus-gps.watchkitapp"));
}

@end
