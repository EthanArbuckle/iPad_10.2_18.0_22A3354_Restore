@implementation _UIDeepestPreferredEnvironmentSearchAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIDeepestPreferredEnvironmentSearch");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDeepestPreferredEnvironmentSearch"), CFSTR("_overridingPreferredFocusEnvironmentForPreferredEnvironment:visitedFocusEnvironments:"), "@", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)_overridingPreferredFocusEnvironmentForPreferredEnvironment:(id)a3 visitedFocusEnvironments:(id)a4
{
  id v4;
  id v5;
  int v8;
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  objc_super v14;
  id v15;
  id v16;
  id location[2];
  _UIDeepestPreferredEnvironmentSearchAccessibility *v18;
  id v19;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v14.receiver = v18;
  v14.super_class = (Class)_UIDeepestPreferredEnvironmentSearchAccessibility;
  v15 = -[_UIDeepestPreferredEnvironmentSearchAccessibility _overridingPreferredFocusEnvironmentForPreferredEnvironment:visitedFocusEnvironments:](&v14, sel__overridingPreferredFocusEnvironmentForPreferredEnvironment_visitedFocusEnvironments_, location[0], v16);
  v12 = 0;
  objc_opt_class();
  v11 = (id)__UIAccessibilityCastAsClass();
  v10 = v11;
  objc_storeStrong(&v11, 0);
  v13 = v10;
  if ((objc_msgSend(v10, "_accessibilityIsFKARunningForFocusItem") & 1) == 0)
    goto LABEL_9;
  v9 = (id)objc_msgSend(location[0], "parentFocusEnvironment");
  while (v9)
  {
    if (v9 == v15)
    {
      v19 = 0;
      v8 = 1;
      goto LABEL_8;
    }
    v4 = (id)objc_msgSend(v9, "parentFocusEnvironment");
    v5 = v9;
    v9 = v4;

  }
  v8 = 0;
LABEL_8:
  objc_storeStrong(&v9, 0);
  if (!v8)
LABEL_9:
    v19 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v19;
}

@end
