@implementation AXUIDaemonApplication

+ (BOOL)usesScenes
{
  void *v3;
  char v4;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D10780], "sharedSystemShellSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isClarityBoardEnabled");

  return v4;
}

+ (BOOL)_isUIKitSystemProcess
{
  return 1;
}

+ (BOOL)_suppressesTextEffectsWindow
{
  return 1;
}

+ (BOOL)_isSystemUIService
{
  return objc_msgSend(a1, "usesScenes") ^ 1;
}

+ (id)_systemUIServiceClientSettings
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3A20], "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "preferredWindowLevel");
  objc_msgSend(v2, "setPreferredLevel:");
  return v2;
}

+ (id)_systemUIServiceIdentifier
{
  void *v2;
  void *v3;

  if ((objc_msgSend(a1, "usesScenes") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (BOOL)_shouldAllowKeyboardArbiter
{
  return 0;
}

- (int64_t)_frontMostAppOrientation
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("_interfaceOrientation"));

  return v3;
}

+ (double)preferredWindowLevel
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0.0;
}

@end
