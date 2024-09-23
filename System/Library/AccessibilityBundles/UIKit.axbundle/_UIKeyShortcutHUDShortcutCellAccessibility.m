@implementation _UIKeyShortcutHUDShortcutCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKeyShortcutHUDShortcutCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const char *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("_UIKeyShortcutHUDShortcutCell");
  v3 = CFSTR("UICollectionViewCell");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v7 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewCell"), CFSTR("contentConfiguration"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("shortcutInputAccessoryView"), v7, 0);
  v5 = CFSTR("UIListContentConfiguration");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("secondaryText"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIKeyShortcutHUDShortcutInputAccessoryView"), CFSTR("shortcutInputView"), v7, 0);
  v6 = CFSTR("_UIKeyShortcutHUDShortcutInputView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("inputLabel"), v7, 0);
  objc_storeStrong(v9, v8);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12[2];
  _UIKeyShortcutHUDShortcutCellAccessibility *v13;

  v13 = self;
  v12[1] = (id)a2;
  v12[0] = (id)-[_UIKeyShortcutHUDShortcutCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentConfiguration"));
  v11 = (id)objc_msgSend(v12[0], "safeStringForKey:", CFSTR("text"));
  v10 = (id)objc_msgSend(v12[0], "safeStringForKey:", CFSTR("secondaryText"));
  v9 = (id)-[_UIKeyShortcutHUDShortcutCellAccessibility safeValueForKeyPath:](v13, "safeValueForKeyPath:", CFSTR("shortcutInputAccessoryView.shortcutInputView"));
  v3 = (id)objc_msgSend(v9, "safeValueForKey:", CFSTR("modifiersLabel"));
  v8 = (id)objc_msgSend(v3, "accessibilityLabel");

  v5 = (id)objc_msgSend(v9, "safeValueForKey:", CFSTR("inputLabel"));
  v4 = (id)objc_msgSend(v5, "accessibilityLabel");
  v7 = (id)objc_msgSend(v4, "lowercaseString");

  v6 = (id)__UIAXStringForVariables();
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
