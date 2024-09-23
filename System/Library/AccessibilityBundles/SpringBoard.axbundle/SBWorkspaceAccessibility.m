@implementation SBWorkspaceAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBWorkspace");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)transactionDidComplete:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBWorkspaceAccessibility;
  -[SBWorkspaceAccessibility transactionDidComplete:](&v3, sel_transactionDidComplete_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], (id)*MEMORY[0x24BDFEF20]);
}

@end
