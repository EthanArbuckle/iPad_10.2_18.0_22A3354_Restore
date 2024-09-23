@implementation DeveloperLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.DeveloperLinkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.DeveloperLinkView"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.DeveloperLinkView"), CFSTR("accessibilityTitleLabel"), "@", 0);

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
