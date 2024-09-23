@implementation StandardLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.StandardLinkView");
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
  return (id)-[StandardLinkViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityDescriptionLabel, accessibilitySummaryLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StandardLinkViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[StandardLinkViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
