@implementation STWebService

+ (id)newServiceInterface
{
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255013B88);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newDelegateInterface
{
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25500E650);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (NSString)clientBundleIdentifier
{
  void *v2;
  void *v3;
  __CFBundle *MainBundle;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    MainBundle = CFBundleGetMainBundle();
    CFBundleGetIdentifier(MainBundle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "processName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("com.apple.ScreenTime.ScreenTimeWebExtension."), "stringByAppendingString:", v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (NSString *)v3;
}

+ (NSURL)clientBundleURL
{
  void *v2;
  void *v3;
  __CFBundle *MainBundle;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    MainBundle = CFBundleGetMainBundle();
    CFBundleCopyBundleURL(MainBundle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)v3;
}

@end
