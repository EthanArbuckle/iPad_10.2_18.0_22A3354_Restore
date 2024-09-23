@implementation BadgeParagraphViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.BadgeParagraphView");
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
  return (id)-[BadgeParagraphViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityParagraphLabel"));
}

@end
