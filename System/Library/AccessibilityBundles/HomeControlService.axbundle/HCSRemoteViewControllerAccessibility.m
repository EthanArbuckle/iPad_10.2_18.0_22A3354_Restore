@implementation HCSRemoteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HCSRemoteViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HCSRemoteViewController"), CFSTR("willBeginTransition:forCompactModule:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HCSRemoteViewController"), CFSTR("dashboardNavigationView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUDashboardNavigationView"), CFSTR("headerTitleLabel"), "@", 0);

}

- (void)willBeginTransition:(BOOL)a3 forCompactModule:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HCSRemoteViewControllerAccessibility;
  -[HCSRemoteViewControllerAccessibility willBeginTransition:forCompactModule:](&v9, sel_willBeginTransition_forCompactModule_, a3, a4);
  if (v4)
  {
    -[HCSRemoteViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dashboardNavigationView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("headerTitleLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

void __77__HCSRemoteViewControllerAccessibility_willBeginTransition_forCompactModule___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 32));
}

@end
