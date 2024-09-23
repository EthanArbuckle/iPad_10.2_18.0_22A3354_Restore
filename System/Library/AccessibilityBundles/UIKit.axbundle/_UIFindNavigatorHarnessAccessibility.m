@implementation _UIFindNavigatorHarnessAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFindNavigatorHarness");
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
  v3 = CFSTR("_UIFindNavigatorView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIFindNavigatorSearchTextField"), CFSTR("UISearchTextField"));
  v7 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFindNavigatorView"), CFSTR("searchTextField"), 0);
  v4 = "B";
  v6 = CFSTR("_UIFindNavigatorHarness");
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("endHoistingFindNavigator:"), v5, v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("hostView"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_findNavigatorView"), v7, 0);
  objc_storeStrong(v9, v8);
}

@end
