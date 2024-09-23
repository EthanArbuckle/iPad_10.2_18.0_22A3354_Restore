@implementation RoutePlanningOverviewViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RoutePlanningOverviewViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RoutePlanningOverviewViewController"), CFSTR("didTapGoButtonForRouteOverviewCell:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RoutePlanningOverviewViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ContaineeViewController"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("RoutePlanningOverviewViewController"), CFSTR("ContaineeViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("CardView"));

}

- (void)didTapGoButtonForRouteOverviewCell:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RoutePlanningOverviewViewControllerAccessibility;
  -[RoutePlanningOverviewViewControllerAccessibility didTapGoButtonForRouteOverviewCell:](&v3, sel_didTapGoButtonForRouteOverviewCell_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __87__RoutePlanningOverviewViewControllerAccessibility_didTapGoButtonForRouteOverviewCell___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RoutePlanningOverviewViewControllerAccessibility;
  -[RoutePlanningOverviewViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  -[RoutePlanningOverviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("collection.routes.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[RoutePlanningOverviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x2349135AC](CFSTR("CardView"));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __94__RoutePlanningOverviewViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v9[4] = v6;
  objc_msgSend(v5, "_accessibilityFindViewAncestor:startWithSelf:", v9, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("group.routeplanner.label"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

}

uint64_t __94__RoutePlanningOverviewViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
