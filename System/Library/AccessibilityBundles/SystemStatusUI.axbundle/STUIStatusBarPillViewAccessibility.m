@implementation STUIStatusBarPillViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarPillView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarPillView"), CFSTR("canBecomeFocused"), "B", 0);
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[STUIStatusBarPillViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  void *v2;
  BOOL v3;

  -[STUIStatusBarPillViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (id)accessibilityElements
{
  if (-[STUIStatusBarPillViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return 0;
  else
    return MEMORY[0x24BDBD1A8];
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v6;

  accessibilityLocalizedString(CFSTR("status.backgroundactivity.hint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXStatusBarItemHint(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarPillViewAccessibility;
  v3 = *MEMORY[0x24BEBB180] | -[STUIStatusBarPillViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0];
  AXStatusBarPillTimeView(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF7430];
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

- (BOOL)canBecomeFocused
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarPillViewAccessibility;
  if (-[STUIStatusBarPillViewAccessibility canBecomeFocused](&v6, sel_canBecomeFocused))
    return 1;
  -[STUIStatusBarPillViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") != 0;

  return v3;
}

@end
