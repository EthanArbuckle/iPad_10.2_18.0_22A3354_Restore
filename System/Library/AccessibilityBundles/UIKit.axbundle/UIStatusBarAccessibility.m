@implementation UIStatusBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  id v5;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UIStatusBar");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIStatusBar"), CFSTR("_adjustDoubleHeightTextVisibility"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_finishedSettingStyleWithOldHeight: newHeight: animation:"), v3, "d", "d", "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_setDoubleHeightStatusString:"), v3, "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_shouldSeekHigherPriorityTouchTarget"), "B", 0);
  objc_storeStrong(v6, v5);
}

- (unint64_t)_accessibilityAutomationType
{
  return 25;
}

- (BOOL)accessibilityPerformEscape
{
  id v3;
  id v4;
  id v5;
  void *v6;
  UIAccessibilityNotifications notification;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15[3];
  char v16;

  v15[2] = self;
  v15[1] = (id)a2;
  v14 = 0;
  objc_opt_class();
  v10 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("_systemNavigationAction"));
  v13 = (id)__UIAccessibilityCastAsClass();

  v12 = v13;
  objc_storeStrong(&v13, 0);
  v15[0] = v12;
  if ((objc_msgSend(v12, "canSendResponse") & 1) != 0)
  {
    v3 = v15[0];
    v4 = (id)objc_msgSend(MEMORY[0x24BE0BD90], "response");
    objc_msgSend(v3, "sendResponse:");

    v11 = (id)accessibilityUIKitLocalizedString();
    notification = *MEMORY[0x24BDF71E8];
    v6 = (void *)MEMORY[0x24BDD17C8];
    v5 = v11;
    v9 = (id)objc_msgSend(v15[0], "titleForDestination:", 0);
    v8 = (id)objc_msgSend(v6, "stringWithFormat:", v5, v9);
    UIAccessibilityPostNotification(notification, v8);

    v16 = 1;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    v16 = 0;
  }
  objc_storeStrong(v15, 0);
  return v16 & 1;
}

- (BOOL)_accessibilityOverridesInvisibility
{
  return 1;
}

- (BOOL)_accessibilityAlwaysOrderedFirst
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)_setDoubleHeightStatusString:(id)a3
{
  id v3;
  objc_super v4;
  id v5;
  id location[2];
  UIStatusBarAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)-[UIStatusBarAccessibility safeValueForKey:](v7, "safeValueForKey:");
  v4.receiver = v7;
  v4.super_class = (Class)UIStatusBarAccessibility;
  -[UIStatusBarAccessibility _setDoubleHeightStatusString:](&v4, sel__setDoubleHeightStatusString_, location[0]);
  v3 = (id)-[UIStatusBarAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_doubleHeightLabel"));
  if (v3)
    objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("doubleHeightLabel"));
  objc_msgSend(v3, "_accessibilitySetOverridesInvisibility:", 1);
  if (v5 != v3)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_adjustDoubleHeightTextVisibility
{
  double v2;
  double v3;
  double v4;
  id v5;
  id v6;
  double v7;
  id v8;
  id v9;
  char v10;
  id v11;
  objc_super v12;
  id v13;
  id v14;
  char v15;
  double v16;
  SEL v17;
  UIStatusBarAccessibility *v18;

  v18 = self;
  v17 = a2;
  v16 = 0.0;
  v15 = 0;
  objc_opt_class();
  v6 = (id)-[UIStatusBarAccessibility safeValueForKey:](v18, "safeValueForKey:", CFSTR("_doubleHeightLabel"));
  v14 = (id)__UIAccessibilityCastAsClass();

  v13 = v14;
  objc_storeStrong(&v14, 0);
  objc_msgSend(v13, "alpha");
  v4 = v2;

  v16 = v4;
  v12.receiver = v18;
  v12.super_class = (Class)UIStatusBarAccessibility;
  -[UIStatusBarAccessibility _adjustDoubleHeightTextVisibility](&v12, sel__adjustDoubleHeightTextVisibility);
  v10 = 0;
  objc_opt_class();
  v5 = (id)-[UIStatusBarAccessibility safeValueForKey:](v18, "safeValueForKey:", CFSTR("_doubleHeightLabel"));
  v9 = (id)__UIAccessibilityCastAsClass();

  v8 = v9;
  objc_storeStrong(&v9, 0);
  v11 = v8;
  objc_msgSend(v8, "alpha");
  v7 = v3;
  objc_msgSend(v11, "_accessibilitySetOverridesInvisibility:", 1);
  if (v16 != v7)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(&v11, 0);
}

- (void)_finishedSettingStyleWithOldHeight:(double)a3 newHeight:(double)a4 animation:(int)a5
{
  double v5;
  objc_super v6;
  BOOL v7;
  double v8;
  unsigned int v9;
  double v10;
  double v11;
  SEL v12;
  UIStatusBarAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = a4;
  v9 = a5;
  -[UIStatusBarAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("currentHeight"));
  v8 = v5;
  v7 = v5 != v10;
  v6.receiver = v13;
  v6.super_class = (Class)UIStatusBarAccessibility;
  -[UIStatusBarAccessibility _finishedSettingStyleWithOldHeight:newHeight:animation:](&v6, sel__finishedSettingStyleWithOldHeight_newHeight_animation_, v9, v11, v10);
  if (v7)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)_shouldSeekHigherPriorityTouchTarget
{
  objc_super v3;
  SEL v4;
  UIStatusBarAccessibility *v5;

  v5 = self;
  v4 = a2;
  if (UIAccessibilityIsVoiceOverRunning())
    return 0;
  v3.receiver = v5;
  v3.super_class = (Class)UIStatusBarAccessibility;
  return -[UIStatusBarAccessibility _shouldSeekHigherPriorityTouchTarget](&v3, sel__shouldSeekHigherPriorityTouchTarget);
}

uint64_t __71___UIStatusBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isEnabled")) ^ 1;

  return v3 & 1;
}

void __71___UIStatusBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id *v12;
  id *v13;

  v13 = a1;
  v12 = a1;
  v11 = 0;
  v11 = objc_msgSend(a1[4], "safeIntegerForKey:", CFSTR("enabilityStatus"));
  v10 = 0;
  if (v11 == 2)
  {
    v9 = (id)objc_msgSend(a1[5], "safeValueForKey:", CFSTR("currentAggregatedData"));
    v8 = (id)objc_msgSend(a1[4], "safeValueForKeyPath:", CFSTR("currentPlacementState.region.overriddenStyleAttributes"));
    v7 = (id)objc_msgSend(a1[5], "safeValueForKey:", CFSTR("styleAttributes"));
    v6 = (id)objc_msgSend(v7, "styleAttributesWithOverrides:", v8);
    v1 = (id)objc_msgSend(a1[4], "_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", v9, v6, MEMORY[0x24BDBD1C8]);
    v2 = v10;
    v10 = v1;

    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  else if (v11 == 3)
  {
    v3 = (id)objc_msgSend(a1[4], "_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", 0, 0, MEMORY[0x24BDBD1C0]);
    v4 = v10;
    v10 = v3;

  }
  if (v10)
    objc_msgSend(a1[6], "_accessibilitySetRetainedValue:forKey:", v10, CFSTR("AccessibilityStatusBarUpdateData"));
  objc_storeStrong(&v10, 0);
}

BOOL __59___UIStatusBarAccessibility__prepareVisualProviderIfNeeded__block_invoke(uint64_t a1)
{
  int v2;
  id WeakRetained;
  char v5;
  id v6;
  BOOL v7;

  if (AXRequestingClient() == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 0;
    if ((objc_msgSend(WeakRetained, "_axElementWithinFocused") & 1) != 0)
    {
      v2 = 0;
    }
    else
    {
      v6 = objc_loadWeakRetained((id *)(a1 + 32));
      v5 = 1;
      v2 = (-[_UIStatusBarAccessibility _axGetIsHitTesting]((uint64_t)v6) ^ 1) & 1;
    }
    v7 = v2 != 0;
    if ((v5 & 1) != 0)

  }
  else
  {
    return 0;
  }
  return v7;
}

BOOL __52___UIStatusBarAccessibility__axElementWithinFocused__block_invoke(id *a1, void *a2)
{
  BOOL v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = location[0] == a1[4];
  objc_storeStrong(location, 0);
  return v4;
}

@end
