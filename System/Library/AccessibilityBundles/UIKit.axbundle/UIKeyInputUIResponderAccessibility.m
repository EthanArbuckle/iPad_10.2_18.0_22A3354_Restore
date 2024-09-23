@implementation UIKeyInputUIResponderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIResponder");
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
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  char v3;
  id v4;
  id v5;
  char v6;
  objc_super v7;
  unint64_t v8;
  SEL v9;
  UIKeyInputUIResponderAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = 0;
  v7.receiver = self;
  v7.super_class = (Class)UIKeyInputUIResponderAccessibility;
  v8 = -[UIKeyInputUIResponderAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  if ((-[NSObject __accessibilityRespondsToKeyInput](v10) & 1) == 0)
    return v8;
  v8 |= *MEMORY[0x24BEBB198] | *MEMORY[0x24BDFF000];
  v6 = 0;
  objc_opt_class();
  v5 = (id)__UIAccessibilityCastAsClass();
  v4 = v5;
  objc_storeStrong(&v5, 0);
  v3 = objc_msgSend(v4, "isFirstResponder");

  if ((v3 & 1) != 0)
    v8 |= *MEMORY[0x24BEBB128];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[UIKeyInputUIResponderAccessibility isSecureTextEntry](v10, "isSecureTextEntry") & 1) != 0)
  {
    v8 |= *MEMORY[0x24BEBB168];
  }
  return v8;
}

@end
