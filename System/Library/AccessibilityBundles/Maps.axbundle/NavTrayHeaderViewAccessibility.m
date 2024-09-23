@implementation NavTrayHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavTrayHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavTrayHeaderView"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NavTrayHeaderView"), CFSTR("_chevronImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavTrayHeaderView"), CFSTR("_updateContentAndReloadStackView:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NavTrayHeaderView"), CFSTR("_minimizedArrivalLabel"), "NavTrayStackedLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NavTrayHeaderView"), CFSTR("_timeLabel"), "NavTrayStackedLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NavTrayHeaderView"), CFSTR("_distanceLabel"), "NavTrayStackedLabel");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavTrayHeaderViewAccessibility;
  -[NavTrayHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[NavTrayHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_chevronImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDFEE60]);
    objc_msgSend(v4, "setIsAccessibilityElement:", 1);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __76__NavTrayHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v5[3] = &unk_250258E58;
    v5[4] = self;
    objc_msgSend(v4, "setAccessibilityLabelBlock:", v5);
  }

}

id __76__NavTrayHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("isExpanded")))
    return AXMapKitLocString(CFSTR("BUTTON_COLLAPSE"));
  else
    return AXMapKitLocString(CFSTR("BUTTON_EXPAND"));
}

- (void)_updateContentAndReloadStackView:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavTrayHeaderViewAccessibility;
  -[NavTrayHeaderViewAccessibility _updateContentAndReloadStackView:](&v7, sel__updateContentAndReloadStackView_, a3);
  -[NavTrayHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_minimizedArrivalLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilitySetIdentification:", CFSTR("ETA"));

  -[NavTrayHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_timeLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilitySetIdentification:", CFSTR("RemainingTime"));

  -[NavTrayHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_distanceLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilitySetIdentification:", CFSTR("RemainingDistance"));

}

@end
