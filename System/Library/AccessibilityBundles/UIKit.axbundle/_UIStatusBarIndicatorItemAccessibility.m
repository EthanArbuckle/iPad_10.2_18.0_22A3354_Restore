@implementation _UIStatusBarIndicatorItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarIndicatorItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorQuietModeItem"));
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorStudentItem"));
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorRotationLockItem"));
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorAirplaneModeItem"));
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorTTYItem"));
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorAssistantItem"));
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorVPNItem"));
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorLiquidDetectionItem"));
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorAirPlayItem"));
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorCarPlayItem"));
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorAlarmItem"));
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorLocationItem"));
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarIndicatorSatelliteItem"));
  v3 = CFSTR("_UIStatusBarItem");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIStatusBarIndicatorItem"));
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarItem"), CFSTR("displayItems"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarDisplayItem"), CFSTR("view"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)_axLabelKeyForClassNameDict
{
  if (a1)
    return &unk_24FF85E88;
  else
    return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  id (*v13)(id *);
  void *v14;
  id v15;
  id from;
  id v17;
  _QWORD __b[8];
  id v19;
  id v20;
  id v21;
  char v22;
  id v23;
  objc_super v24;
  SEL v25;
  _UIStatusBarIndicatorItemAccessibility *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v26 = self;
  v25 = a2;
  v24.receiver = self;
  v24.super_class = (Class)_UIStatusBarIndicatorItemAccessibility;
  -[_UIStatusBarIndicatorItemAccessibility _accessibilityLoadAccessibilityInformation](&v24, sel__accessibilityLoadAccessibilityInformation);
  v22 = 0;
  objc_opt_class();
  v9 = (id)-[_UIStatusBarIndicatorItemAccessibility safeValueForKey:](v26, "safeValueForKey:", CFSTR("displayItems"));
  v21 = (id)__UIAccessibilityCastAsClass();

  v20 = v21;
  objc_storeStrong(&v21, 0);
  v23 = v20;
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(v20, "allValues");
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
  if (v8)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v19 = *(id *)(__b[1] + 8 * v5);
      v17 = (id)objc_msgSend(v19, "safeValueForKey:", CFSTR("view"));
      objc_msgSend(v17, "setIsAccessibilityElement:", 1);
      objc_initWeak(&from, v26);
      v2 = v17;
      v10 = MEMORY[0x24BDAC760];
      v11 = -1073741824;
      v12 = 0;
      v13 = __84___UIStatusBarIndicatorItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
      v14 = &unk_24FF3DC00;
      objc_copyWeak(&v15, &from);
      objc_msgSend(v2, "_setAccessibilityLabelBlock:", &v10);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&from);
      objc_storeStrong(&v17, 0);
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
        if (!v6)
          break;
      }
    }
  }

  objc_storeStrong(&v23, 0);
}

- (_UIStatusBarIndicatorItemAccessibility)init
{
  _UIStatusBarIndicatorItemAccessibility *v3;
  objc_super v4;
  SEL v5;
  _UIStatusBarIndicatorItemAccessibility *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarIndicatorItemAccessibility;
  v6 = -[_UIStatusBarIndicatorItemAccessibility init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    -[_UIStatusBarIndicatorItemAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

@end
