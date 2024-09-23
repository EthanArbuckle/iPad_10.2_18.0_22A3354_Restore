@implementation DEBundle

+ (id)frameworkBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

+ (id)frameworkUserSettings
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.DialogEngine")))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.siri.DialogEngine"));
  }
  v5 = (void *)v4;

  return v5;
}

+ (id)frameworkInternalUserSettings
{
  void *v2;

  if (os_variant_has_internal_diagnostics())
  {
    +[DEBundle frameworkUserSettings](DEBundle, "frameworkUserSettings");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
