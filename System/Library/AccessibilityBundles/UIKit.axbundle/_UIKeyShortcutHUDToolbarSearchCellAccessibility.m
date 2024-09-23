@implementation _UIKeyShortcutHUDToolbarSearchCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKeyShortcutHUDToolbarSearchCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIKeyShortcutHUDViewController");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIKeyShortcutHUDViewController"), CFSTR("isSearching"), "B", 0);
  objc_storeStrong(v5, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  objc_super v3;
  SEL v4;
  _UIKeyShortcutHUDToolbarSearchCellAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDToolbarSearchCellAccessibility;
  -[_UIKeyShortcutHUDToolbarSearchCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  v2 = (id)-[_UIKeyShortcutHUDToolbarSearchCellAccessibility _accessibilityDescendantOfType:](v5, "_accessibilityDescendantOfType:", objc_opt_class());
  objc_msgSend(v2, "setIsAccessibilityElement:", 0);
  objc_storeStrong(&v2, 0);
}

- (BOOL)isAccessibilityElement
{
  id v3;
  int v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = (id)-[_UIKeyShortcutHUDToolbarSearchCellAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_7, 0);
  v3 = (id)objc_msgSend(v5[0], "_accessibilityViewController");
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isSearching")) ^ 1;

  objc_storeStrong(v5, 0);
  return v4 & 1;
}

- (id)accessibilityLabel
{
  return (id)accessibilityUIKitLocalizedString();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
