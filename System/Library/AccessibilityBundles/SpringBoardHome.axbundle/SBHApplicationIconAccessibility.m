@implementation SBHApplicationIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHApplicationIcon");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBHApplicationIcon"), CFSTR("SBIcon"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHApplicationIcon"), CFSTR("applicationPlaceholder"), "@", 0);

}

- (id)accessibilityLabel
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  -[SBHApplicationIconAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXSpokenName"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (AXDoesRequestingClientDeserveAutomation())
    {
      v3 = 0;
    }
    else
    {
      v4 = (void *)MEMORY[0x24BDC1538];
      -[SBHApplicationIconAccessibility _accessibilityBundleIdentifier](self, "_accessibilityBundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "applicationProxyForIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      AXSpokenNameLabelForBundleURL();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v3)
        v8 = v3;
      else
        v8 = &stru_250385500;
      -[SBHApplicationIconAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v8, CFSTR("AXSpokenName"));
    }
  }
  if (-[__CFString length](v3, "length"))
  {
    v9 = v3;
  }
  else
  {
    -[SBHApplicationIconAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("applicationPlaceholder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "accessibilityLabel");
    else
      -[SBHApplicationIconAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_axIconLabel"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHApplicationIconAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("applicationPlaceholder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "accessibilityValue");
  else
    -[SBHApplicationIconAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_axIconValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHApplicationIconAccessibility;
  return *MEMORY[0x24BEBB130] | -[SBHApplicationIconAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
