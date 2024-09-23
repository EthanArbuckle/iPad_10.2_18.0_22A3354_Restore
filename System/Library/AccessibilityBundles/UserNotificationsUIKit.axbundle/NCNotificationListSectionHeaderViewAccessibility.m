@implementation NCNotificationListSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationListSectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListSectionHeaderView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListSectionHeaderView"), CFSTR("clearButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListSectionHeaderView"), CFSTR("collapseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListSectionHeaderView"), CFSTR("_configureClearButtonIfNecessary"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListSectionHeaderView"), CFSTR("_handleCollapseActionTriggered:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListSectionHeaderView"), CFSTR("_configureCollapseButtonIfNecessary"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NCNotificationListSectionHeaderViewAccessibility;
  -[NCNotificationListSectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  -[NCNotificationListSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("clearButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListSectionHeaderViewAccessibility axTitle](self, "axTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityValue:", v4);

  -[NCNotificationListSectionHeaderViewAccessibility axDigestCollapseButton](self, "axDigestCollapseButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __94__NCNotificationListSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v11[3] = &unk_2503BE080;
  v11[4] = self;
  objc_msgSend(v5, "_setAccessibilityLabelBlock:", v11);

  objc_initWeak(&location, self);
  -[NCNotificationListSectionHeaderViewAccessibility axDigestCollapseButton](self, "axDigestCollapseButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __94__NCNotificationListSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v8[3] = &unk_2503BE0A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "_setAccessibilityActivateBlock:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __94__NCNotificationListSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("collapse.digest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "axTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __94__NCNotificationListSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_destroyWeak(&v2);
  return 1;
}

void __94__NCNotificationListSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "axDigestCollapseButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleCollapseActionTriggered:", v1);

}

- (id)axDigestCollapseButton
{
  return (id)-[NCNotificationListSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collapseButton"));
}

- (id)axTitle
{
  return (id)-[NCNotificationListSectionHeaderViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
}

- (int64_t)_accessibilitySortPriority
{
  return 0;
}

- (void)_configureClearButtonIfNecessary
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListSectionHeaderViewAccessibility;
  -[NCNotificationListSectionHeaderViewAccessibility _configureClearButtonIfNecessary](&v3, sel__configureClearButtonIfNecessary);
  -[NCNotificationListSectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_configureCollapseButtonIfNecessary
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListSectionHeaderViewAccessibility;
  -[NCNotificationListSectionHeaderViewAccessibility _configureCollapseButtonIfNecessary](&v3, sel__configureCollapseButtonIfNecessary);
  -[NCNotificationListSectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
