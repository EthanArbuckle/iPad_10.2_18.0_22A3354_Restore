@implementation UIButtonAccessibility__TelephonyUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIButtonAccessibility__TelephonyUI__UIKit;
  v3 = -[UIButtonAccessibility__TelephonyUI__UIKit isAccessibilityElement](&v9, sel_isAccessibilityElement);
  -[UIButtonAccessibility__TelephonyUI__UIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("IsTPButtonBarButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(v5, "currentImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v7 != 0;

    }
  }
  return v3;
}

@end
