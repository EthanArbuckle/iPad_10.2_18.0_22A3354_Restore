@implementation _CDPaths

+ (id)eventPlistPath
{
  return (id)objc_msgSend(a1, "bundlePathForResource:ofType:", CFSTR("com.apple.coreduet.systemevents"), CFSTR("plist"));
}

+ (id)knowledgeDirectory
{
  return CFSTR("/var/mobile/Library/CoreDuet/Knowledge/");
}

+ (id)peopleDirectory
{
  return CFSTR("/var/mobile/Library/CoreDuet/People/");
}

+ (id)bundlePathForResource:(id)a3 ofType:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "bundleForClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathForResource:ofType:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)bundleBuiltInPlugInsPath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "builtInPlugInsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)simulatorSystemPathFor:(id)a3 withEnvVar:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3898];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingString:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)simulatorHomePathFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  NSHomeDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)simulatorSharedPathFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("/tmp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", CFSTR("Developer/CoreSimulator/Shared/data"));
  if (v3 && objc_msgSend(v3, "length"))
    objc_msgSend(v4, "addObject:", v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)otaSleepPath
{
  return CFSTR("/var/mobile/Library/CoreDuet/CoreDuetSleepConfig.bundle");
}

+ (id)defaultSleepPath
{
  return CFSTR("/System/Library/CoreDuet/CoreDuetSleepConfig.bundle");
}

+ (id)systemCachesDirectory
{
  return CFSTR("/var/mobile/Library/CoreDuet/Caches/");
}

+ (id)modelDirectory
{
  return CFSTR("/var/mobile/Library/CoreDuet/Models/");
}

+ (id)userKnowledgeDirectory
{
  return +[_CDPaths knowledgeDirectory](_CDPaths, "knowledgeDirectory");
}

+ (id)policiesConfigPath
{
  return CFSTR("/System/Library/DuetKnowledgeBase/Events/com.apple.coreduet.interaction.policies.plist");
}

+ (id)monitorBundlePath
{
  return CFSTR("/System/Library/DuetKnowledgeBase/Monitors");
}

+ (id)knowledgeTestDirectory
{
  return CFSTR("/var/tmp/knowledgeTest");
}

+ (id)DKKnowledgeTestDirectoryString
{
  return +[_CDPaths knowledgeTestDirectory](_CDPaths, "knowledgeTestDirectory");
}

+ (id)interactionTestDirectory
{
  return CFSTR("/var/tmp/interactionStoreTest-");
}

+ (id)interactionCopyDirectory
{
  return CFSTR("/var/tmp/interactionTestAnonCopy");
}

+ (id)defaultSessionPathForDataCollection
{
  return CFSTR("/var/mobile/Library/CoreDuet/DataCollection/session.archive");
}

+ (id)defaultDirectoryPathForDataCollection
{
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("CoreDuet/DataCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
