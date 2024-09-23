@implementation DSRestrictionStore

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSRestrictionStore");
    v3 = (void *)DSLog_1;
    DSLog_1 = (uint64_t)v2;

  }
}

+ (BOOL)isAppRemovalRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppRemovalAllowed") ^ 1;

  return v3;
}

+ (BOOL)isPermissionRestricted:(id)a3
{
  __CFString *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  char v7;

  v3 = (__CFString *)a3;
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("DSLocationAlways")) & 1) != 0
    || -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("DSLocationWhenInUse")))
  {
    v5 = CFSTR("location");
  }
  else
  {
    if (!-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("DSContacts")))
    {
      v6 = v4;
      v5 = v3;
      goto LABEL_5;
    }
    v5 = (const __CFString *)*MEMORY[0x24BEB3830];
  }
  v6 = v4;
LABEL_5:
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7;
}

+ (BOOL)isSourceRestricted:(id)a3
{
  __CFString *v3;
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;

  v3 = (__CFString *)a3;
  if (CFSTR("com.apple.DigitalSeparation.Photos") == v3
    && (objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63AA8]),
        v4,
        v5 == 2))
  {
    v6 = 1;
  }
  else if (CFSTR("com.apple.DigitalSeparation.FindMy") == v3)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63928]) == 2)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63930]) == 2;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isPasscodeModificationRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeModificationAllowed") ^ 1;

  return v3;
}

+ (BOOL)isFingerprintModificationRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFingerprintModificationAllowed") ^ 1;

  return v3;
}

+ (BOOL)isPrivateRelayRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudPrivateRelayAllowed") ^ 1;

  return v3;
}

+ (BOOL)hasRestriction
{
  return (objc_msgSend(a1, "isSourceRestricted:", CFSTR("com.apple.DigitalSeparation.FindMy")) & 1) != 0
      || +[DSRestrictionStore isSourceRestricted:](DSRestrictionStore, "isSourceRestricted:", CFSTR("com.apple.DigitalSeparation.Photos"))|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", CFSTR("location"))|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x24BEB3830])|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x24BEB3840])|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x24BEB38E8])
      || +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x24BEB38D8])|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x24BEB3838])|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x24BEB38C0])|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x24BEB38B8])|| +[DSRestrictionStore isPasscodeModificationRestricted](DSRestrictionStore, "isPasscodeModificationRestricted")|| +[DSRestrictionStore isFingerprintModificationRestricted](
           DSRestrictionStore,
           "isFingerprintModificationRestricted")
      || +[DSRestrictionStore isAppRemovalRestricted](DSRestrictionStore, "isAppRemovalRestricted")
      || +[DSRestrictionStore isPrivateRelayRestricted](DSRestrictionStore, "isPrivateRelayRestricted");
}

@end
