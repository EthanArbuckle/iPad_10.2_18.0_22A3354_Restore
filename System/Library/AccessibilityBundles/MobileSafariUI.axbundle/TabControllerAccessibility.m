@implementation TabControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TabController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabController"), CFSTR("currentTabs"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabController"), CFSTR("setActiveTabDocument:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabController"), CFSTR("activeTabDocument"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabController"), CFSTR("moveTab:overTab:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TabDocument"), CFSTR("_tabBarItem"), "TabBarItem");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabBarItem"), CFSTR("layoutInfo"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabBarItemLayoutInfo"), CFSTR("tabBarItemView"), "@", 0);

}

- (void)moveTab:(id)a3 overTab:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  -[TabControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("currentTabs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v6);
  v10 = objc_msgSend(v8, "indexOfObject:", v7);
  v24.receiver = self;
  v24.super_class = (Class)TabControllerAccessibility;
  -[TabControllerAccessibility moveTab:overTab:](&v24, sel_moveTab_overTab_, v6, v7);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL && v9 != v10)
  {
    v13 = CFSTR("moved.after.tab");
    if (v9 > v10)
      v13 = CFSTR("moved.before.tab");
    v14 = v13;
    objc_msgSend(v6, "safeValueForKey:", CFSTR("title"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("title"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "length"))
    {
      v17 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10 + 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringFromNumber:numberStyle:", v18, 6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      accessibilityLocalizedString(CFSTR("tab.position"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AXCFormattedString();
      v21 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v21;
    }
    accessibilityLocalizedString(v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AXCFormattedString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v22) = *MEMORY[0x24BDF71E8];
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v23);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v22, (id)*MEMORY[0x24BDFEE28]);

  }
}

- (id)_axTabBarItemViewForTabDocument:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "safeValueForKey:", CFSTR("_tabBarItem"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("layoutInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("tabBarItemView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
