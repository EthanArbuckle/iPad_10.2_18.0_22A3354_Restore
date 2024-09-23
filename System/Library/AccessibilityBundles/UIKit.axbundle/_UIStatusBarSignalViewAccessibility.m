@implementation _UIStatusBarSignalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarSignalView");
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
  v3 = CFSTR("_UIStatusBarSignalView");
  v4 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("numberOfBars"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("numberOfActiveBars"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)isAccessibilityElement
{
  return -[_UIStatusBarSignalViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible", a2, self) & 1;
}

- (id)accessibilityValue
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  void *v12;
  id v13;
  objc_super v14;
  id location;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19[2];
  _UIStatusBarSignalViewAccessibility *v20;

  v20 = self;
  v19[1] = (id)a2;
  v19[0] = 0;
  v18 = -[_UIStatusBarSignalViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("signalMode"));
  if (v18)
  {
    if (v18 == 1)
    {
      v4 = accessibilityLocalizedString(CFSTR("status.signal.searching"));
      v5 = v19[0];
      v19[0] = v4;

    }
    else if (v18 == 2)
    {
      v17 = -[_UIStatusBarSignalViewAccessibility safeIntegerForKey:](v20, "safeIntegerForKey:", CFSTR("numberOfBars"));
      v16 = -[_UIStatusBarSignalViewAccessibility safeIntegerForKey:](v20, "safeIntegerForKey:", CFSTR("numberOfActiveBars"));
      location = (id)-[_UIStatusBarSignalViewAccessibility _accessibilityValueForKey:](v20, "_accessibilityValueForKey:", CFSTR("AccessibilityStatusBarSignalViewLabelKey"));
      if (location)
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        v13 = accessibilityLocalizedString(location);
        v6 = (id)objc_msgSend(v12, "localizedStringWithFormat:", v16, v17);
        v7 = v19[0];
        v19[0] = v6;

      }
      objc_storeStrong(&location, 0);
    }
    else
    {
      v14.receiver = v20;
      v14.super_class = (Class)_UIStatusBarSignalViewAccessibility;
      v8 = -[_UIStatusBarSignalViewAccessibility accessibilityLabel](&v14, sel_accessibilityLabel);
      v9 = v19[0];
      v19[0] = v8;

    }
  }
  else
  {
    v2 = accessibilityLocalizedString(CFSTR("status.signal.no.signal"));
    v3 = v19[0];
    v19[0] = v2;

  }
  v11 = v19[0];
  objc_storeStrong(v19, 0);
  return v11;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  _UIStatusBarSignalViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarSignalViewAccessibility;
  return -[_UIStatusBarSignalViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180] | *MEMORY[0x24BEBB0F8];
}

- (id)accessibilityHint
{
  return AXStatusBarItemHint(self);
}

@end
