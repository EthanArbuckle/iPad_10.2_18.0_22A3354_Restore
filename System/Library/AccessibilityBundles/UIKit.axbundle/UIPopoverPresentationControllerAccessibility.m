@implementation UIPopoverPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPopoverPresentationController");
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
  v3 = CFSTR("UIPopoverPresentationController");
  v4 = CFSTR("UIPresentationController");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPopoverPresentationController"), CFSTR("presentationTransitionWillBegin"), "v", 0);
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("preferredFocusedView"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("preferredFocusEnvironments"), v5, 0);
  objc_storeStrong(v7, obj);
}

- (id)preferredFocusedView
{
  id v3;
  id v4;
  char v5;
  objc_super v6;
  int v7;
  id v8;
  id v9;
  char v10;
  id v11[2];
  UIPopoverPresentationControllerAccessibility *v12;
  id v13;

  v12 = self;
  v11[1] = (id)a2;
  v10 = 0;
  objc_opt_class();
  v9 = (id)__UIAccessibilityCastAsClass();
  v8 = v9;
  objc_storeStrong(&v9, 0);
  v11[0] = v8;
  v4 = (id)objc_msgSend(v8, "presentedView");
  v5 = objc_msgSend(v4, "_accessibilityIsFKARunningForFocusItem");

  if ((v5 & 1) != 0)
  {
    v3 = (id)objc_msgSend(v11[0], "passthroughViews");
    v13 = (id)objc_msgSend(v3, "firstObject");

  }
  else
  {
    v6.receiver = v12;
    v6.super_class = (Class)UIPopoverPresentationControllerAccessibility;
    v13 = -[UIPopoverPresentationControllerAccessibility preferredFocusedView](&v6, sel_preferredFocusedView);
  }
  v7 = 1;
  objc_storeStrong(v11, 0);
  return v13;
}

- (id)preferredFocusEnvironments
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  objc_super v9;
  int v10;
  objc_super v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16[2];
  UIPopoverPresentationControllerAccessibility *v17;
  id v18;

  v17 = self;
  v16[1] = (id)a2;
  v15 = 0;
  objc_opt_class();
  v14 = (id)__UIAccessibilityCastAsClass();
  v13 = v14;
  objc_storeStrong(&v14, 0);
  v16[0] = v13;
  v7 = (id)objc_msgSend(v13, "presentedView");
  v8 = objc_msgSend(v7, "_accessibilityIsFKARunningForFocusItem");

  if ((v8 & 1) != 0)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = v12;
    v4 = (id)-[UIPopoverPresentationControllerAccessibility safeArrayForKey:](v17, "safeArrayForKey:", CFSTR("passthroughViews"));
    objc_msgSend(v3, "axSafelyAddObjectsFromArray:");

    v5 = v12;
    v11.receiver = v17;
    v11.super_class = (Class)UIPopoverPresentationControllerAccessibility;
    v6 = -[UIPopoverPresentationControllerAccessibility preferredFocusEnvironments](&v11, sel_preferredFocusEnvironments);
    objc_msgSend(v5, "axSafelyAddObjectsFromArray:");

    v18 = v12;
    v10 = 1;
    objc_storeStrong(&v12, 0);
  }
  else
  {
    v9.receiver = v17;
    v9.super_class = (Class)UIPopoverPresentationControllerAccessibility;
    v18 = -[UIPopoverPresentationControllerAccessibility preferredFocusEnvironments](&v9, sel_preferredFocusEnvironments);
    v10 = 1;
  }
  objc_storeStrong(v16, 0);
  return v18;
}

- (void)presentationTransitionWillBegin
{
  objc_super v2;
  SEL v3;
  UIPopoverPresentationControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIPopoverPresentationControllerAccessibility;
  -[UIPopoverPresentationControllerAccessibility presentationTransitionWillBegin](&v2, sel_presentationTransitionWillBegin);
}

@end
