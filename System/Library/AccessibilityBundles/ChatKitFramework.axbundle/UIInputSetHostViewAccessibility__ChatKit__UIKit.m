@implementation UIInputSetHostViewAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIInputSetHostView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CKKeyboardContentViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInputWindowController"), CFSTR("inputViewSet"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInputViewSet"), CFSTR("inputView"), "@", 0);

}

- (unint64_t)_accessibilityScannerGroupTraits
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIInputSetHostViewAccessibility__ChatKit__UIKit;
  v2 = -[UIInputSetHostViewAccessibility__ChatKit__UIKit _accessibilityScannerGroupTraits](&v10, sel__accessibilityScannerGroupTraits);
  if ((v2 & 1) != 0)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_rootInputWindowController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "safeValueForKey:", CFSTR("inputViewSet"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("inputView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_accessibilityViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("CKKeyboardContentViewController"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v2 &= ~1uLL;

  }
  return v2;
}

@end
