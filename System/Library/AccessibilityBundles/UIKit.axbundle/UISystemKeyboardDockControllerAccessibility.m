@implementation UISystemKeyboardDockControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISystemKeyboardDockController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const __CFString *v5;
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
  v4 = CFSTR("UISystemKeyboardDockController");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v3 = "UIKeyboardDockItem";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UISystemKeyboardDockController"), CFSTR("_globeDockItem"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UISystemKeyboardDockController"), CFSTR("_dictationRunningDockItem"), "UIKeyboardDockItem");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UISystemKeyboardDockController"), CFSTR("_dictationDockItem"), "UIKeyboardDockItem");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UISystemKeyboardDockController"), CFSTR("_keyboardDockItem"), "UIKeyboardDockItem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardDockItem"), CFSTR("button"), "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("loadView"), "v", 0);
  v5 = CFSTR("UIKeyboardImpl");
  v6 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("showsDedicatedEmojiKeyAlongsideGlobeButton"), v6, 0);
  objc_storeStrong(v8, v7);
}

- (uint64_t)_axShowsGlobeKeyAsEmoji
{
  int v2;
  id location[2];
  char v4;

  location[1] = a1;
  if (a1)
  {
    location[0] = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    LOBYTE(v2) = 0;
    if ((objc_msgSend(location[0], "safeBoolForKey:", CFSTR("globeKeyDisplaysAsEmojiKey")) & 1) != 0)
      v2 = objc_msgSend(location[0], "safeBoolForKey:", CFSTR("showsDedicatedEmojiKeyAlongsideGlobeButton")) ^ 1;
    v4 = v2 & 1;
    objc_storeStrong(location, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (void)_axUpdateGlobeKeyLabel
{
  id v1;
  char v2;
  id v3;
  char v4;
  id v5;

  if (a1)
  {
    v1 = (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("_globeDockItem"));
    v4 = 0;
    v2 = 0;
    if ((-[UISystemKeyboardDockControllerAccessibility _axShowsGlobeKeyAsEmoji](a1) & 1) != 0)
    {
      v5 = AXKBElementLocalizedForKeyboardLocale(CFSTR("global.keyboard.key.emoji"));
      v4 = 1;
      objc_msgSend(v1, "setAccessibilityLabel:", v5, v5);
    }
    else
    {
      v3 = accessibilityLocalizedString(CFSTR("global.keyboard.key"));
      v2 = 1;
      objc_msgSend(v1, "setAccessibilityLabel:", v3, v3);
    }
    if ((v2 & 1) != 0)

    if ((v4 & 1) != 0)
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  UISystemKeyboardDockControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISystemKeyboardDockControllerAccessibility;
  -[UISystemKeyboardDockControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[UISystemKeyboardDockControllerAccessibility _accessibilityMarkupDockItems](v4);
}

- (void)_accessibilityMarkupDockItems
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  int v15;
  int v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  id v21;
  void *v22;

  v22 = a1;
  if (a1)
  {
    -[UISystemKeyboardDockControllerAccessibility _axUpdateGlobeKeyLabel](v22);
    v21 = (id)objc_msgSend(v22, "safeValueForKey:", CFSTR("_globeDockItem"));
    v9 = accessibilityLocalizedString(CFSTR("globe.keyboard.key.hint"));
    objc_msgSend(v21, "setAccessibilityHint:");

    objc_initWeak(&location, v22);
    v10 = v21;
    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __76__UISystemKeyboardDockControllerAccessibility__accessibilityMarkupDockItems__block_invoke;
    v18 = &unk_24FF3DC00;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v10, "_setAccessibilityValueBlock:", &v14);
    v13 = (id)objc_msgSend(v22, "safeValueForKey:", CFSTR("_dictationRunningDockItem"));
    v8 = accessibilityLocalizedString(CFSTR("dictation.key"));
    objc_msgSend(v13, "setAccessibilityLabel:");

    v7 = accessibilityLocalizedString(CFSTR("dictation.running.key.value"));
    objc_msgSend(v13, "setAccessibilityValue:");

    objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("dictation"));
    v12 = (id)objc_msgSend(v22, "safeValueForKey:", CFSTR("_dictationDockItem"));
    v6 = accessibilityLocalizedString(CFSTR("dictation.key"));
    objc_msgSend(v12, "setAccessibilityLabel:");

    v5 = accessibilityLocalizedString(CFSTR("dictation.key.hint"));
    objc_msgSend(v12, "setAccessibilityHint:");

    objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("dictation"));
    v11 = (id)objc_msgSend(v22, "safeValueForKey:", CFSTR("_keyboardDockItem"));
    v4 = accessibilityLocalizedString(CFSTR("keyboardMinimized.tabButton"));
    objc_msgSend(v11, "setAccessibilityLabel:");

    v1 = (id)objc_msgSend(v21, "safeValueForKey:", CFSTR("button"));
    v2 = (id)objc_msgSend(v12, "safeValueForKey:", CFSTR("button"));
    v3 = (id)objc_msgSend(v11, "safeValueForKey:", CFSTR("button"));
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    objc_storeStrong(&v21, 0);
  }
}

id __76__UISystemKeyboardDockControllerAccessibility__accessibilityMarkupDockItems__block_invoke(uint64_t a1)
{
  BOOL KeyboardKeys;
  uint64_t v3;
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = -[UISystemKeyboardDockControllerAccessibility _axShowsGlobeKeyAsEmoji](WeakRetained);

  if ((v5 & 1) != 0)
    return 0;
  KeyboardKeys = UIAXRequiresTwoNextKeyboardKeys();
  v3 = 2;
  if (!KeyboardKeys)
    v3 = 0;
  return UIAXNextKeyboardValue(v3);
}

- (void)updateDockItemsVisibility
{
  objc_super v2;
  SEL v3;
  UISystemKeyboardDockControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISystemKeyboardDockControllerAccessibility;
  -[UISystemKeyboardDockControllerAccessibility updateDockItemsVisibility](&v2, sel_updateDockItemsVisibility);
  -[UISystemKeyboardDockControllerAccessibility _axUpdateGlobeKeyLabel](v4);
}

- (void)loadView
{
  objc_super v2;
  SEL v3;
  UISystemKeyboardDockControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISystemKeyboardDockControllerAccessibility;
  -[UISystemKeyboardDockControllerAccessibility loadView](&v2, sel_loadView);
  -[UISystemKeyboardDockControllerAccessibility _accessibilityMarkupDockItems](v4);
}

@end
