@implementation FBKFileMatcherHelper

+ (id)additionalSysdiagnoseMatcherWithPlatform:(id)a3
{
  void *v4;
  void *v5;
  FBKMatcherPredicate *v6;

  objc_msgSend(a1, "fakeSysdiagnoseRequirementWithPlatform:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stubFilePredicateWithRequiresRemote:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FBKMatcherPredicate initWithFileMatcher:filePredicate:]([FBKMatcherPredicate alloc], "initWithFileMatcher:filePredicate:", v4, v5);
  -[FBKMatcherPredicate setIsAdditional:](v6, "setIsAdditional:", 1);

  return v6;
}

+ (id)stubFilePredicateWithRequiresRemote:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[FBKFilePredicate entity](FBKFilePredicate, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB698]), "initWithEntity:insertIntoManagedObjectContext:", v4, 0);
  objc_msgSend(v5, "setRequiresRemote:", v3);

  return v5;
}

+ (id)additionalDevicePlatforms
{
  return +[FBKDeviceManager supportedPlatforms](FBKDeviceManager, "supportedPlatforms");
}

+ (id)fakeSysdiagnoseRequirementWithPlatform:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  +[FBKFileMatcher entity](FBKFileMatcher, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB698]), "initWithEntity:insertIntoManagedObjectContext:", v4, 0);
  objc_msgSend(v5, "setDeBundleIdentifier:", CFSTR("com.apple.DiagnosticExtensions.sysdiagnose"));
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE2C9E8]) & 1) != 0)
  {
    v6 = CFSTR("HomePod sysdiagnose");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE2C9F8]) & 1) != 0)
  {
    v6 = CFSTR("tvOS sysdiagnose");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE2CA10]) & 1) != 0)
  {
    v6 = CFSTR("watchOS sysdiagnose");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE2CA18]) & 1) != 0)
  {
    v6 = CFSTR("iOS sysdiagnose");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE2C9F0]) & 1) != 0)
  {
    v6 = CFSTR("macOS sysdiagnose");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE2CA08]))
  {
    v6 = CFSTR("visionOS sysdiagnose");
  }
  else
  {
    v6 = CFSTR("Sysdiagnose");
  }
  objc_msgSend(v5, "setName:", v6);
  objc_msgSend(v5, "setInstructionsAsHTML:", &stru_24E15EAF8);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("^.*sysdiagnose.*\\.tar\\.gz$"), 0, 0);
  objc_msgSend(v5, "setRegularExpression:", v7);

  objc_msgSend(v5, "setPlatform:", v3);
  return v5;
}

@end
