@implementation BadgeParagraphViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BridgeStoreExtension.BadgeParagraphView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.BadgeParagraphView"), CFSTR("accessibilityParagraphLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[BadgeParagraphViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityParagraphLabel"));
}

@end
