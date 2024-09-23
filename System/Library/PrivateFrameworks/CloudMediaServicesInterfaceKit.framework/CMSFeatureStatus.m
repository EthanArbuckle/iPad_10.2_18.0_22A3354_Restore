@implementation CMSFeatureStatus

+ (BOOL)isBoltFeatureEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isBoldPlayFeatureEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMultiPlayerSupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE65580], "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiplayerHost");

  return v3;
}

+ (void)enableSiriOverrides:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setConfigOverrideWithValue:forKey:", CFSTR("true"), CFSTR("X-Dev-ConfigOverride-assistant.service.audio.siriKit.thirdPartyHomePod.enabled"));
  else
    objc_msgSend(v4, "removeConfigOverrideForKey:", CFSTR("X-Dev-ConfigOverride-assistant.service.audio.siriKit.thirdPartyHomePod.enabled"));

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronize");

}

+ (BOOL)isRadioSupportEnabled
{
  return _os_feature_enabled_impl();
}

@end
