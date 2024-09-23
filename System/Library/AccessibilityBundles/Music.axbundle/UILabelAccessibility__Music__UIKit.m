@implementation UILabelAccessibility__Music__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  objc_super v6;

  -[UILabelAccessibility__Music__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXUIButtonLabelEmptyLabel"));

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)UILabelAccessibility__Music__UIKit;
  return -[UILabelAccessibility__Music__UIKit isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

@end
