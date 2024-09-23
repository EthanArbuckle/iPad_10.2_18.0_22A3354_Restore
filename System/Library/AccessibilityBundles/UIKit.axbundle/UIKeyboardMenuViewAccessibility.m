@implementation UIKeyboardMenuViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardMenuView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIKeyboardMenuView"), CFSTR("UIView"));
  objc_storeStrong(location, 0);
}

- (void)removeFromSuperview
{
  objc_super v2;
  SEL v3;
  UIKeyboardMenuViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardMenuViewAccessibility;
  -[UIKeyboardMenuViewAccessibility removeFromSuperview](&v2, sel_removeFromSuperview);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
