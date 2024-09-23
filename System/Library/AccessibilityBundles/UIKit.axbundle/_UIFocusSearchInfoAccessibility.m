@implementation _UIFocusSearchInfoAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFocusSearchInfo");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFocusSearchInfo"), CFSTR("shouldIncludeFocusItem:"), "B", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)shouldIncludeFocusItem:(id)a3
{
  char v4;
  char v5;
  id v6;
  id v7;
  char v8;
  objc_super v9;
  char v10;
  id location[2];
  _UIFocusSearchInfoAccessibility *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  v9.receiver = v12;
  v9.super_class = (Class)_UIFocusSearchInfoAccessibility;
  v10 = -[_UIFocusSearchInfoAccessibility shouldIncludeFocusItem:](&v9, sel_shouldIncludeFocusItem_, location[0]);
  v8 = 0;
  objc_opt_class();
  v7 = (id)__UIAccessibilityCastAsClass();
  v6 = v7;
  objc_storeStrong(&v7, 0);
  v5 = objc_msgSend(v6, "_accessibilityHandlesRemoteFocusMovement");

  if ((v5 & 1) != 0)
    v10 = 1;
  v4 = v10;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

@end
