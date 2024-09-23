@implementation UIProgressHUDAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIProgressHUD");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityBlocksInteraction
{
  id v3;
  int v4;
  char v5;
  id v6;
  id v7;
  id v8;
  char v9;
  SEL v10;
  UIProgressHUDAccessibility *v11;
  char v12;

  v11 = self;
  v10 = a2;
  v3 = (id)-[UIProgressHUDAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
  v5 = 0;
  LOBYTE(v4) = 0;
  if (v3)
  {
    v9 = 0;
    objc_opt_class();
    v8 = (id)__UIAccessibilityCastAsClass();
    v7 = v8;
    objc_storeStrong(&v8, 0);
    v6 = v7;
    v5 = 1;
    v4 = objc_msgSend(v7, "isUserInteractionEnabled") ^ 1;
  }
  v12 = v4 & 1;
  if ((v5 & 1) != 0)

  return v12 & 1;
}

- (void)showInView:(id)a3
{
  UIAccessibilityNotifications notification;
  id v4;
  objc_super v5;
  id location[2];
  UIProgressHUDAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIProgressHUDAccessibility;
  -[UIProgressHUDAccessibility showInView:](&v5, sel_showInView_, location[0]);
  notification = *MEMORY[0x24BEBAEA0];
  v4 = -[UIProgressHUDAccessibility accessibilityLabel](v7, "accessibilityLabel");
  UIAccessibilityPostNotification(notification, v4);

  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  id v3;
  id v4;

  v3 = (id)-[UIProgressHUDAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_progressMessage"));
  v4 = (id)objc_msgSend(v3, "accessibilityLabel");

  return v4;
}

@end
