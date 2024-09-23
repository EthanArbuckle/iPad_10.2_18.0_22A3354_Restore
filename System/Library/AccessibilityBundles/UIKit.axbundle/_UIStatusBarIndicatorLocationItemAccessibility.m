@implementation _UIStatusBarIndicatorLocationItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarIndicatorLocationItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const char *v5;
  id obj;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIStatusBarIndicatorLocationItem");
  objc_msgSend(location[0], "validateClass:");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", CFSTR("_UIStatusBarIndicatorLocationItem"), CFSTR("prominentDisplayIdentifier"), 0);
  v4 = CFSTR("_UIStatusBarItem");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("previousType"), "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("displayItems"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarDisplayItem"), CFSTR("isEnabled"), "B", 0);
  objc_storeStrong(v7, obj);
}

- (id)accessibilityLabel
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *, void *, _BYTE *);
  void *v8;
  uint64_t *v9;
  id v10;
  id v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  char v18;
  int v19;
  SEL v20;
  _UIStatusBarIndicatorLocationItemAccessibility *v21;
  id v22;

  v21 = self;
  v20 = a2;
  v19 = -[_UIStatusBarIndicatorLocationItemAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("previousType"));
  v14 = 0;
  v15 = &v14;
  v16 = 0x20000000;
  v17 = 32;
  v18 = 0;
  v12 = 0;
  objc_opt_class();
  v3 = (id)-[_UIStatusBarIndicatorLocationItemAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("displayItems"));
  v11 = (id)__UIAccessibilityCastAsClass();

  v10 = v11;
  objc_storeStrong(&v11, 0);
  v13 = v10;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __68___UIStatusBarIndicatorLocationItemAccessibility_accessibilityLabel__block_invoke;
  v8 = &unk_24FF3DD00;
  v9 = &v14;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &v4);
  if ((v15[3] & 1) != 0)
  {
    v22 = accessibilityLocalizedString(CFSTR("status.location.prominent"));
  }
  else if (v19)
  {
    if (v19 == 1)
      v22 = accessibilityLocalizedString(CFSTR("status.location.geofence"));
    else
      v22 = 0;
  }
  else
  {
    v22 = accessibilityLocalizedString(CFSTR("status.location.icon"));
  }
  objc_storeStrong(&v13, 0);
  _Block_object_dispose(&v14, 8);
  return v22;
}

@end
