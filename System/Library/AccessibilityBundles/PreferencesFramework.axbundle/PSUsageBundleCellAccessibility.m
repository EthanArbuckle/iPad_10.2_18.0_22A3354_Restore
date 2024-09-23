@implementation PSUsageBundleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSUsageBundleCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSUsageBundleCellAccessibility;
  -[PSUsageBundleCellAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v3, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D68]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple.Music"));

    if ((_DWORD)v5)
    {
      accessibilityLocalizedString(CFSTR("usage.category.music"));
      v8 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v8;
    }

  }
  return v2;
}

@end
