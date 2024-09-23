@implementation ProductNoRatingsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.ProductNoRatingsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.ProductNoRatingsView"), CFSTR("accessibilityStatusLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[ProductNoRatingsViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityStatusLabel"));
}

@end
