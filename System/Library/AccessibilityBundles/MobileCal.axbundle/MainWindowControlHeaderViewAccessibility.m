@implementation MainWindowControlHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MainWindowControlHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowControlHeaderView"), CFSTR("_calendarBarButton"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowControlHeaderView"), CFSTR("_newEventBarButton"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowControlHeaderView"), CFSTR("_inboxBarButton"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowControlHeaderView"), CFSTR("_badgedCalendarBarButton"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowControlHeaderView"), CFSTR("_badgedInboxBarButton"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowControlHeaderView"), CFSTR("_inboxCount"), "Q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MainWindowControlHeaderView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MainWindowControlHeaderViewAccessibility;
  -[MainWindowControlHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[MainWindowControlHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("calendarBarButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("navigationbar.calendar.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[MainWindowControlHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("newEventBarButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("navigationbar.plus.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[MainWindowControlHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("inboxBarButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("navigationbar.inbox.button"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  -[MainWindowControlHeaderViewAccessibility _accessibilitySetupBadgedButtonsLabelsValues](self, "_accessibilitySetupBadgedButtonsLabelsValues");
}

- (MainWindowControlHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  MainWindowControlHeaderViewAccessibility *v3;
  MainWindowControlHeaderViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MainWindowControlHeaderViewAccessibility;
  v3 = -[MainWindowControlHeaderViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MainWindowControlHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (void)updateToolbarItems
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MainWindowControlHeaderViewAccessibility;
  -[MainWindowControlHeaderViewAccessibility updateToolbarItems](&v3, sel_updateToolbarItems);
  -[MainWindowControlHeaderViewAccessibility _accessibilitySetupBadgedButtonsLabelsValues](self, "_accessibilitySetupBadgedButtonsLabelsValues");
}

- (void)_accessibilitySetupBadgedButtonsLabelsValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[MainWindowControlHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_badgedCalendarBarButton"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("navigationbar.calendar.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v3);

  accessibilityLocalizedString(CFSTR("navigationbar.calendar.badgedbutton.value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityValue:", v4);

  -[MainWindowControlHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_badgedInboxBarButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("navigationbar.inbox.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  v7 = -[MainWindowControlHeaderViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_inboxCount"));
  v8 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("items.format"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityValue:", v10);

}

@end
