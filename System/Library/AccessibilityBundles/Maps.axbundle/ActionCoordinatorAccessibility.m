@implementation ActionCoordinatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ActionCoordinator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ActionCoordinator"), CFSTR("presentRoutePlanningViewType:"), "v", "q", 0);
}

- (void)presentRoutePlanningViewType:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ActionCoordinatorAccessibility;
  -[ActionCoordinatorAccessibility presentRoutePlanningViewType:](&v3, sel_presentRoutePlanningViewType_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
