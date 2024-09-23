@implementation UILabelAccessibility__GameCenterUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UILabel"), CFSTR("color"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIColor"), CFSTR("alpha"), "d", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  double v4;
  double v5;
  BOOL result;
  objc_super v7;

  -[UILabelAccessibility__GameCenterUI__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("color"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeCGFloatForKey:", CFSTR("alpha"));
  v5 = v4;

  v7.receiver = self;
  v7.super_class = (Class)UILabelAccessibility__GameCenterUI__UIKit;
  result = -[UILabelAccessibility__GameCenterUI__UIKit isAccessibilityElement](&v7, sel_isAccessibilityElement);
  if (v5 <= 0.0)
    return 0;
  return result;
}

@end
