@implementation ExpandableTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.ExpandableTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ExpandableTextView"), CFSTR("accessibilityTextLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[ExpandableTextViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTextLabel"));
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end
