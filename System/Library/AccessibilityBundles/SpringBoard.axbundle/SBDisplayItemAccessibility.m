@implementation SBDisplayItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDisplayItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDisplayItem"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("applicationWithBundleIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  -[SBDisplayItemAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayItemAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXSpokenName"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXSpokenNameLabelForBundleURL();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      AXSBApplicationControllerSharedInstance();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applicationWithBundleIdentifier:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "safeStringForKey:", CFSTR("displayName"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    if (v4)
      v9 = v4;
    else
      v9 = &stru_25036C388;
    -[SBDisplayItemAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("AXSpokenName"));
  }

  return v4;
}

@end
