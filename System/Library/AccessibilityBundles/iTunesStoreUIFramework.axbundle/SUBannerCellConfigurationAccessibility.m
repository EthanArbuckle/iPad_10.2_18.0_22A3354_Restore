@implementation SUBannerCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUBannerCellConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityTableViewCellText
{
  void *v2;
  void *v3;
  int v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("AppStore"));

  if (v4)
    v5 = CFSTR("featured.app");
  else
    v5 = CFSTR("featured.album");
  accessibilityLocalizedString(v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityLanguage
{
  return (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("_accessibilityContentLanguage"));
}

@end
