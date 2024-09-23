@implementation _UIFocusScrollManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFocusScrollManager");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFocusScrollManager"), CFSTR("animateOffsetOfEnvironmentScrollableContainer:toShowFocusItem:"), "v", "@", "@", 0);
  objc_storeStrong(v4, obj);
}

- (void)animateOffsetOfEnvironmentScrollableContainer:(id)a3 toShowFocusItem:(id)a4
{
  char v4;
  objc_super v6;
  int v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id location[2];
  _UIFocusScrollManagerAccessibility *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0;
  objc_opt_class();
  v9 = (id)__UIAccessibilityCastAsClass();
  v8 = v9;
  objc_storeStrong(&v9, 0);
  v4 = objc_msgSend(v8, "_accessibilityIsFKARunningForFocusItem");

  if ((v4 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v6.receiver = v13;
    v6.super_class = (Class)_UIFocusScrollManagerAccessibility;
    -[_UIFocusScrollManagerAccessibility animateOffsetOfEnvironmentScrollableContainer:toShowFocusItem:](&v6, sel_animateOffsetOfEnvironmentScrollableContainer_toShowFocusItem_, location[0], v11);
    v7 = 0;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

@end
