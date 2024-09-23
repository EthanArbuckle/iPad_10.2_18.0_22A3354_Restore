@implementation FCUIActivityControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FCUIActivityControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCUIActivityControl"), CFSTR("_activityTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCUIActivityControl"), CFSTR("_detailLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCUIActivityControl"), CFSTR("_optionsButton"), "FCUIOptionsControl");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("FCUIActivityControl"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FCUIActivityControl"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCUIActivityControl"), CFSTR("_menuView"), "FCUIActivityControlMenuView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FCUIActivityControlMenuView"), CFSTR("menuItemElements"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCUIActivityControlMenuView"), CFSTR("_footerView"), "_FCUIActivityControlMenuFooterView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FCUIActivityControl"), CFSTR("optionsAction"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FCUIOptionsControl"), CFSTR("controlType"), "q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[FCUIActivityControlAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_activityTitleLabel, _detailLabel"));
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[FCUIActivityControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("selected"));
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (id)accessibilityCustomActions
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;

  if (-[FCUIActivityControlAccessibility _accessibilityIsExpanded](self, "_accessibilityIsExpanded"))
    v3 = CFSTR("collapse.options.menu");
  else
    v3 = CFSTR("show.more.options");
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUIActivityControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_optionsButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("controlType"));

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = objc_alloc(MEMORY[0x24BDF6788]);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__FCUIActivityControlAccessibility_accessibilityCustomActions__block_invoke;
    v11[3] = &unk_250210BB0;
    objc_copyWeak(&v12, &location);
    v7 = (void *)objc_msgSend(v8, "initWithName:actionHandler:", v4, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __62__FCUIActivityControlAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("optionsAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v3;
  v4 = v3;
  AXPerformSafeBlock();
  v5 = objc_loadWeakRetained(v1);
  v6 = objc_msgSend(v5, "_accessibilityIsExpanded");
  v7 = objc_loadWeakRetained(v1);
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "_accessibilityMenuItemElements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v8);
  return 1;
}

uint64_t __62__FCUIActivityControlAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithSender:target:", 0, 0);
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FCUIActivityControlAccessibility _accessibilityIsExpanded](self, "_accessibilityIsExpanded"))
  {
    -[FCUIActivityControlAccessibility _accessibilityMenuItemElements](self, "_accessibilityMenuItemElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

    -[FCUIActivityControlAccessibility _accessibilityMenuView](self, "_accessibilityMenuView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_footerView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "axSafelyAddObject:", v6);
  }
  return v3;
}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[FCUIActivityControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_optionsButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_accessibilityIsExpanded
{
  return -[FCUIActivityControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded"));
}

- (id)_accessibilityMenuItemElements
{
  void *v2;
  void *v3;

  -[FCUIActivityControlAccessibility _accessibilityMenuView](self, "_accessibilityMenuView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("menuItemElements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityMenuView
{
  return (id)-[FCUIActivityControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_menuView"));
}

@end
