@implementation SBSwitchAppSystemGestureWorkspaceTransactionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSwitchAppSystemGestureWorkspaceTransaction");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)swipeTransactionFinishedAnimating:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSwitchAppSystemGestureWorkspaceTransactionAccessibility;
  -[SBSwitchAppSystemGestureWorkspaceTransactionAccessibility swipeTransactionFinishedAnimating:](&v3, sel_swipeTransactionFinishedAnimating_, a3);
}

@end
