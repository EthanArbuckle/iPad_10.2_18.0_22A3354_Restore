@implementation PrivateBrowsingObfuscationWindow

+ (id)showPrivateBrowsingObfuscationWindowForApplicationWindow:(id)a3
{
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  PrivateBrowsingObfuscationWindow *v8;
  void *v9;
  PrivateBrowsingObfuscationWindow *v10;

  v3 = (void *)MEMORY[0x1E0DC3CF8];
  v4 = a3;
  if (_SFDeviceIsPad())
    v5 = CFSTR("LaunchPrivateBrowsing-iPad");
  else
    v5 = CFSTR("LaunchPrivateBrowsing");
  objc_msgSend(v3, "storyboardWithName:bundle:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instantiateInitialViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [PrivateBrowsingObfuscationWindow alloc];
  objc_msgSend(v4, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PrivateBrowsingObfuscationWindow initWithWindowScene:](v8, "initWithWindowScene:", v9);
  -[PrivateBrowsingObfuscationWindow setRootViewController:](v10, "setRootViewController:", v7);
  -[PrivateBrowsingObfuscationWindow setWindowLevel:](v10, "setWindowLevel:", *MEMORY[0x1E0DC53C0] + -1.0);
  -[PrivateBrowsingObfuscationWindow makeKeyAndVisible](v10, "makeKeyAndVisible");

  return v10;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

@end
