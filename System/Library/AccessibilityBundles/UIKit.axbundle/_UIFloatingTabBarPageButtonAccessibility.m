@implementation _UIFloatingTabBarPageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFloatingTabBarPageButton");
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
  v3 = CFSTR("_UIFloatingTabBarPageButton");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFloatingTabBarPageButton"), CFSTR("direction"), "q", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  char v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  BOOL v13;
  id v14;
  id v15;
  char v16;
  id v17[2];
  _UIFloatingTabBarPageButtonAccessibility *v18;
  id v19;

  v18 = self;
  v17[1] = (id)a2;
  v16 = 0;
  objc_opt_class();
  v15 = (id)__UIAccessibilityCastAsClass();
  v14 = v15;
  objc_storeStrong(&v15, 0);
  v17[0] = v14;
  v13 = objc_msgSend(v14, "effectiveUserInterfaceLayoutDirection") == 1;
  if (-[_UIFloatingTabBarPageButtonAccessibility safeIntegerForKey:](v18, "safeIntegerForKey:", CFSTR("direction")))
  {
    v7 = 0;
    v5 = 0;
    if (v13)
    {
      v8 = accessibilityLocalizedString(CFSTR("previous.page"));
      v7 = 1;
      v3 = v8;
    }
    else
    {
      v6 = accessibilityLocalizedString(CFSTR("next.page"));
      v5 = 1;
      v3 = v6;
    }
    v19 = v3;
    if ((v5 & 1) != 0)

    if ((v7 & 1) != 0)
  }
  else
  {
    v11 = 0;
    v9 = 0;
    if (v13)
    {
      v12 = accessibilityLocalizedString(CFSTR("next.page"));
      v11 = 1;
      v2 = v12;
    }
    else
    {
      v10 = accessibilityLocalizedString(CFSTR("previous.page"));
      v9 = 1;
      v2 = v10;
    }
    v19 = v2;
    if ((v9 & 1) != 0)

    if ((v11 & 1) != 0)
  }
  objc_storeStrong(v17, 0);
  return v19;
}

@end
