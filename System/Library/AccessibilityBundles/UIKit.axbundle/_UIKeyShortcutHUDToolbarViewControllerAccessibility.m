@implementation _UIKeyShortcutHUDToolbarViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKeyShortcutHUDToolbarViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIKeyShortcutHUDToolbarViewController");
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("searchBar"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("searchButton"), v6, 0);
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("didCompleteSearchTransition"), 0);
  v5 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("setSearching:"), v4, "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIKeyShortcutHUDViewController"), CFSTR("isSearching"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIKeyShortcutHUDSearchBar"), CFSTR("searchTextField"), v6, 0);
  objc_storeStrong(v8, v7);
}

- (void)didCompleteSearchTransition
{
  UIAccessibilityNotifications notification;
  id v3;
  id v4;
  char v5;
  objc_super v6;
  SEL v7;
  _UIKeyShortcutHUDToolbarViewControllerAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDToolbarViewControllerAccessibility;
  -[_UIKeyShortcutHUDToolbarViewControllerAccessibility didCompleteSearchTransition](&v6, sel_didCompleteSearchTransition);
  v4 = (id)-[_UIKeyShortcutHUDToolbarViewControllerAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("delegate"));
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isSearching"));

  if ((v5 & 1) != 0)
  {
    notification = *MEMORY[0x24BDF72C8];
    v3 = (id)-[_UIKeyShortcutHUDToolbarViewControllerAccessibility safeValueForKeyPath:](v8, "safeValueForKeyPath:", CFSTR("searchBar.searchTextField"));
    UIAccessibilityPostNotification(notification, v3);

  }
}

- (void)setSearching:(BOOL)a3
{
  UIAccessibilityNotifications notification;
  id v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  _UIKeyShortcutHUDToolbarViewControllerAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyShortcutHUDToolbarViewControllerAccessibility;
  -[_UIKeyShortcutHUDToolbarViewControllerAccessibility setSearching:](&v5, sel_setSearching_, a3);
  if (!v6)
  {
    notification = *MEMORY[0x24BDF72C8];
    v4 = (id)-[_UIKeyShortcutHUDToolbarViewControllerAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("searchButton"));
    UIAccessibilityPostNotification(notification, v4);

  }
}

@end
