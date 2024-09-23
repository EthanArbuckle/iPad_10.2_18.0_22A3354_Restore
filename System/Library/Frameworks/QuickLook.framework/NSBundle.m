@implementation NSBundle

void __59__NSBundle__QLUtilities__mainBundleSupportsBackgroundAudio__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BEBE028]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = v4;
  if (v4)
  {
    v3 = objc_msgSend(v4, "containsObject:", *MEMORY[0x24BEBE020]);
    v2 = v4;
  }
  else
  {
    v3 = 0;
  }
  mainBundleSupportsBackgroundAudio__appsSupportsBackgroundAudio = v3;

}

void __59__NSBundle__QLUtilities__mainBundleRequiresStatusBarHidden__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x24BEBE758]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  mainBundleRequiresStatusBarHidden__appRequiresStatusBarHidden = objc_msgSend(v1, "BOOLValue");

}

void __56__NSBundle__QLUtilities__mainBundleSupportsPrintCommand__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BEBDFF8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");
  if (v2)
    LOBYTE(v2) = dyld_program_sdk_at_least();
  mainBundleSupportsPrintCommand__supportsPrintCommand = v2;

}

@end
