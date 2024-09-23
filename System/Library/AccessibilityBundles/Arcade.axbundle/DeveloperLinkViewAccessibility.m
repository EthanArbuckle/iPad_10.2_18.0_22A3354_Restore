@implementation DeveloperLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.DeveloperLinkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[DeveloperLinkViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilitySubtitleLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DeveloperLinkViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[DeveloperLinkViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
