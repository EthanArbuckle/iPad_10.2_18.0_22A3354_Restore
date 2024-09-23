@implementation _UIKeyShortcutHUDMenuViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKeyShortcutHUDMenuViewController");
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIKeyShortcutHUDMenuViewController"), CFSTR("_collectionView"), "UICollectionView");
  objc_storeStrong(location, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  _UIKeyShortcutHUDMenuViewControllerAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDMenuViewControllerAccessibility;
  -[_UIKeyShortcutHUDMenuViewControllerAccessibility viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  UIAccessibilityNotifications notification;
  id v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  _UIKeyShortcutHUDMenuViewControllerAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyShortcutHUDMenuViewControllerAccessibility;
  -[_UIKeyShortcutHUDMenuViewControllerAccessibility viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[_UIKeyShortcutHUDMenuViewControllerAccessibility _accessibilityLoadAccessibilityInformation](v8, "_accessibilityLoadAccessibilityInformation");
  notification = *MEMORY[0x24BDF7328];
  v4 = (id)-[_UIKeyShortcutHUDMenuViewControllerAccessibility safeUIViewForKey:](v8, "safeUIViewForKey:", CFSTR("_collectionView"));
  UIAccessibilityPostNotification(notification, v4);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  char v5;
  id v6;
  objc_super v7;
  SEL v8;
  _UIKeyShortcutHUDMenuViewControllerAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyShortcutHUDMenuViewControllerAccessibility;
  -[_UIKeyShortcutHUDMenuViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  v5 = 0;
  v2 = (id)-[_UIKeyShortcutHUDMenuViewControllerAccessibility safeUIViewForKey:](v9, "safeUIViewForKey:", CFSTR("_collectionView"));
  v4 = (id)__UIAccessibilitySafeClass();

  v3 = v4;
  objc_storeStrong(&v4, 0);
  v6 = v3;
  objc_msgSend(v3, "setAccessibilityComparatorForSorting:", &__block_literal_global_6);
  objc_storeStrong(&v6, 0);
}

@end
