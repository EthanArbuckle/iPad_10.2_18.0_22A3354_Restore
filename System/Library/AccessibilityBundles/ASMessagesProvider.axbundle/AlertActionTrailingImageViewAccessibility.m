@implementation AlertActionTrailingImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.AlertActionTrailingImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.AlertActionTrailingImageView"), CFSTR("accessibilityAlertActionLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[AlertActionTrailingImageViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityAlertActionLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AlertActionTrailingImageViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[AlertActionTrailingImageViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
