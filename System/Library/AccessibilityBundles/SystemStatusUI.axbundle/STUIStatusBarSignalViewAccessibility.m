@implementation STUIStatusBarSignalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarSignalView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarSignalView"), CFSTR("signalMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarSignalView"), CFSTR("numberOfBars"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarSignalView"), CFSTR("numberOfActiveBars"), "q", 0);

}

- (id)accessibilityValue
{
  uint64_t v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = -[STUIStatusBarSignalViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("signalMode"));
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      v4 = CFSTR("status.signal.searching");
    }
    else
    {
      if (v3)
      {
        v14.receiver = self;
        v14.super_class = (Class)STUIStatusBarSignalViewAccessibility;
        -[STUIStatusBarSignalViewAccessibility accessibilityLabel](&v14, sel_accessibilityLabel);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        return v12;
      }
      v4 = CFSTR("status.signal.no.signal");
    }
    accessibilityLocalizedString(v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    return v12;
  }
  v5 = -[STUIStatusBarSignalViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("numberOfBars"));
  v6 = -[STUIStatusBarSignalViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("numberOfActiveBars"));
  -[STUIStatusBarSignalViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AccessibilityStatusBarSignalViewLabelKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v6, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarSignalViewAccessibility;
  return *MEMORY[0x24BEBB180] | -[STUIStatusBarSignalViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB0F8];
}

@end
