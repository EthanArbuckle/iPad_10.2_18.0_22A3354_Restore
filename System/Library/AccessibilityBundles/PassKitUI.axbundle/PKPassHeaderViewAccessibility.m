@implementation PKPassHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassHeaderView"), CFSTR("_title"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassHeaderView"), CFSTR("_subtitle"), "UILabel");

}

- (id)accessibilityLabel
{
  return (id)-[PKPassHeaderViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_title, _subtitle"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
