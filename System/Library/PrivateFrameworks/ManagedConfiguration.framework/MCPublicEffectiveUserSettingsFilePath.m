@implementation MCPublicEffectiveUserSettingsFilePath

void __MCPublicEffectiveUserSettingsFilePath_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  MCUserPublicInfoDirectory();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("PublicEffectiveUserSettings.plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)MCPublicEffectiveUserSettingsFilePath_str;
  MCPublicEffectiveUserSettingsFilePath_str = v1;

}

@end
