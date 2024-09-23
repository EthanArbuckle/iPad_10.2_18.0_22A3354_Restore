@implementation UIKitButtonBaseAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUI.UIKitButtonBase");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SwiftUI.UIKitButtonBase"), CFSTR("UIButton"));
}

- (BOOL)canBecomeFocused
{
  objc_super v4;

  if (-[UIKitButtonBaseAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))return -[UIKitButtonBaseAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  v4.receiver = self;
  v4.super_class = (Class)UIKitButtonBaseAccessibility;
  return -[UIKitButtonBaseAccessibility canBecomeFocused](&v4, sel_canBecomeFocused);
}

@end
