@implementation UIMenuControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIMenuController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setMenuItems:(id)a3
{
  objc_super v3;
  id location[2];
  UIMenuControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIMenuControllerAccessibility;
  -[UIMenuControllerAccessibility setMenuItems:](&v3, sel_setMenuItems_, location[0]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(location, 0);
}

@end
