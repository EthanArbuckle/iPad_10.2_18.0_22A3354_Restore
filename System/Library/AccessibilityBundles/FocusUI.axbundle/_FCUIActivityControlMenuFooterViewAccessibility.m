@implementation _FCUIActivityControlMenuFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_FCUIActivityControlMenuFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("_FCUIActivityControlMenuFooterView"), CFSTR("_footerLabel"), "UILabel");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[_FCUIActivityControlMenuFooterViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_footerLabel"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
