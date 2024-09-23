@implementation ATXAppDirectoryOverrideList

+ (id)iTunesOverridesFromMobileAsset
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("iTunes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;

  return v6;
}

+ (id)ScreenTimeOverridesFromMobileAsset
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ScreenTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;

  return v6;
}

@end
