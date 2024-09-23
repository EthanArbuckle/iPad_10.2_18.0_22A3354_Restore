@implementation HUQuickControlPushButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlPushButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlPushButtonView"), CFSTR("controlState"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlPushButtonView"), CFSTR("profile"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlViewProfile"), CFSTR("decorationIconDescriptor"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("HFIconDescriptor"), CFSTR("identifier"));

}

- (BOOL)_axIsOn
{
  return -[HUQuickControlPushButtonViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("controlState")) == 1;
}

- (id)_axIconIdentifier
{
  void *v2;
  void *v3;

  -[HUQuickControlPushButtonViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("profile.decorationIconDescriptor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axIsRotationDirectionToggle
{
  void *v2;
  char v3;

  -[HUQuickControlPushButtonViewAccessibility _axIconIdentifier](self, "_axIconIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "axContainsString:", CFSTR("HFImageIconIdentifierDecorationRotationDirection"));

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[HUQuickControlPushButtonViewAccessibility _axIconIdentifier](self, "_axIconIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLabelForIconIdentifier((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HUQuickControlPushButtonViewAccessibility;
    -[HUQuickControlPushButtonViewAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)accessibilityValue
{
  __CFString *v3;

  if (-[HUQuickControlPushButtonViewAccessibility _axIsRotationDirectionToggle](self, "_axIsRotationDirectionToggle"))
  {
    v3 = 0;
  }
  else if (-[HUQuickControlPushButtonViewAccessibility _axIsOn](self, "_axIsOn"))
  {
    v3 = CFSTR("1");
  }
  else
  {
    v3 = CFSTR("0");
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlPushButtonViewAccessibility;
  return *MEMORY[0x24BDF7428] | -[HUQuickControlPushButtonViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0];
}

@end
