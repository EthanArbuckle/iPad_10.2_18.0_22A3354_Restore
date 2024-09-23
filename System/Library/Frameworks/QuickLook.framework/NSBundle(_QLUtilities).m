@implementation NSBundle(_QLUtilities)

+ (uint64_t)mainBundleSupportsBackgroundAudio
{
  if (mainBundleSupportsBackgroundAudio_onceToken != -1)
    dispatch_once(&mainBundleSupportsBackgroundAudio_onceToken, &__block_literal_global_9);
  return mainBundleSupportsBackgroundAudio__appsSupportsBackgroundAudio;
}

+ (uint64_t)mainBundleRequiresStatusBarHidden
{
  if (mainBundleRequiresStatusBarHidden_onceToken != -1)
    dispatch_once(&mainBundleRequiresStatusBarHidden_onceToken, &__block_literal_global_1);
  return mainBundleRequiresStatusBarHidden__appRequiresStatusBarHidden;
}

+ (uint64_t)mainBundleSupportsPrintCommand
{
  if (mainBundleSupportsPrintCommand_onceToken != -1)
    dispatch_once(&mainBundleSupportsPrintCommand_onceToken, &__block_literal_global_2);
  return mainBundleSupportsPrintCommand__supportsPrintCommand;
}

- (id)ql_applicationName
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(a1, "localizedInfoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x24BDBD1D0];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBD1D0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(a1, "infoDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        objc_msgSend(a1, "localizedInfoDictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *MEMORY[0x24BDBD298];
        objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDBD298]);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v3)
        {
          objc_msgSend(a1, "infoDictionary");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", v8);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }

  return v3;
}

@end
