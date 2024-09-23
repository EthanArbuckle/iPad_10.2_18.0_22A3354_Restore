@implementation UIFocusBehaviorTVAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFocusBehavior_TV");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFocusBehavior_TV"), CFSTR("showsFocusRingForItem:"), "B", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)showsFocusRingForItem:(id)a3
{
  char v4;
  objc_super v5;
  int v6;
  id v7;
  id v8;
  char v9;
  id location[2];
  UIFocusBehaviorTVAccessibility *v11;
  char v12;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_opt_class();
  v8 = (id)__UIAccessibilityCastAsClass();
  v7 = v8;
  objc_storeStrong(&v8, 0);
  v4 = objc_msgSend(v7, "_accessibilityDisplayFocusIndicatorForHoverTextView");

  if ((v4 & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v5.receiver = v11;
    v5.super_class = (Class)UIFocusBehaviorTVAccessibility;
    v12 = -[UIFocusBehaviorTVAccessibility showsFocusRingForItem:](&v5, sel_showsFocusRingForItem_, location[0]);
  }
  v6 = 1;
  objc_storeStrong(location, 0);
  return v12 & 1;
}

@end
