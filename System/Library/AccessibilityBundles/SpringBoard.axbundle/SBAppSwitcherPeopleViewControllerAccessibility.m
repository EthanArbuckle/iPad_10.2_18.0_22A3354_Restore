@implementation SBAppSwitcherPeopleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppSwitcherPeopleViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppSwitcherPeopleViewController"), CFSTR("tappedExpandCollapseForItem:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppSwitcherPeopleScrollView"), CFSTR("expandedItemWrapper"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBAppSwitcherPeopleViewController"), CFSTR("_peopleScrollView"), "SBAppSwitcherPeopleScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBAppSwitcherPeopleScrollView"), CFSTR("_wrappersToViews"), "NSDictionary");

}

- (void)tappedExpandCollapseForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  UIAccessibilityNotifications v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  char v16;

  v4 = a3;
  v16 = 0;
  -[SBAppSwitcherPeopleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_peopleScrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("expandedItemWrapper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8)
  {
    v9 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("people.picker.items.collapsed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v9, v10);
  }
  else
  {
    objc_opt_class();
    -[SBAppSwitcherPeopleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_peopleScrollView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeValueForKey:", CFSTR("_wrappersToViews"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("SBAppSwitcherPeopleContactActionView")));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v14);

  }
  v15.receiver = self;
  v15.super_class = (Class)SBAppSwitcherPeopleViewControllerAccessibility;
  -[SBAppSwitcherPeopleViewControllerAccessibility tappedExpandCollapseForItem:](&v15, sel_tappedExpandCollapseForItem_, v4);

}

@end
