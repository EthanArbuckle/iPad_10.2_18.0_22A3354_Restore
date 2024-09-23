@implementation STKInternalSettings

+ (NSUserDefaults)defaults
{
  if (defaults_onceToken[0] != -1)
    dispatch_once(defaults_onceToken, &__block_literal_global_1);
  return (NSUserDefaults *)(id)defaults_sDefaults;
}

void __31__STKInternalSettings_defaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.StickerKit.InternalSettings"));
  v1 = (void *)defaults_sDefaults;
  defaults_sDefaults = v0;

}

+ (id)settingsValueForKey:(id)a3
{
  NSString *v4;
  SEL v5;
  void *v6;

  objc_msgSend(a3, "stringByAppendingString:", CFSTR("SettingsValue"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = NSSelectorFromString(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "performSelector:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)runVGFRemoveBackground
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("runVGFRemoveBackground"), 1);
}

+ (BOOL)allowCachedGenmojiResults
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("allowCachedGenmojiResults"), 0);
}

+ (BOOL)autoPopulateDebugPrompts
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("autoPopulateDebugPrompts"), 0);
}

+ (BOOL)bypassPersonCheck
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("bypassPersonCheck"), 0);
}

+ (BOOL)showCamera
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("showCamera"), 0);
}

+ (id)runVGFRemoveBackgroundSettingsValue
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "runVGFRemoveBackground"));
}

+ (id)allowCachedGenmojiResultsSettingsValue
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "allowCachedGenmojiResults"));
}

+ (id)autoPopulateDebugPromptsSettingsValue
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "autoPopulateDebugPrompts"));
}

+ (id)bypassPersonCheckSettingsValue
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "bypassPersonCheck"));
}

+ (id)showCameraSettingsValue
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "showCamera"));
}

+ (id)defaultsKeyForKey:(id)a3
{
  return (id)objc_msgSend(CFSTR("com.apple.StickerKit.InternalSettings"), "stringByAppendingPathExtension:", a3);
}

+ (BOOL)BOOLForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "defaultsKeyForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    a4 = objc_msgSend(v8, "BOOLValue");

  return a4;
}

+ (double)floatForKey:(id)a3 withDefaultValue:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  float v9;

  objc_msgSend(a1, "defaultsKeyForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "floatValue");
    a4 = v9;
  }

  return a4;
}

@end
