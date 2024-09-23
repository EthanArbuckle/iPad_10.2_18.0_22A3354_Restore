@implementation FCUIActivityControlMenuItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FCUIActivityControlMenuItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCUIActivityControlMenuItemView"), CFSTR("_activationDescriptionLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCUIActivityControlMenuItemView"), CFSTR("_activationDetailsLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FCUIActivityControlMenuItemView"), CFSTR("isSelected"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[FCUIActivityControlMenuItemViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_activationDescriptionLabel, _activationDetailsLabel"));
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[FCUIActivityControlMenuItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

@end
