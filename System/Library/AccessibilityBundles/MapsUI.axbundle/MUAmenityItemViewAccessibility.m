@implementation MUAmenityItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUAmenityItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUAmenityItemView"), CFSTR("_titleLabel"), "UIView<MULabelViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUAmenityItemView"), CFSTR("_imageView"), "UIImageView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[MUAmenityItemViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel"));
}

@end
