@implementation SiriInCallSettingConfig

+ (id)localizationKey
{
  return CFSTR("SIRI_IN_CALL");
}

+ (BOOL)enabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "siriInCallEnabled");

  return v3;
}

+ (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSiriInCallEnabled:", v3);

}

@end
