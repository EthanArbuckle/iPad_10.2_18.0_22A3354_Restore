@implementation SBRestartManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBRestartManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRestartManager"), CFSTR("rebootWithContext:"), "v", "@", 0);
}

- (void)rebootWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  accessibilityLocalizedString(CFSTR("shutting.down.format"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", v5, v8);

    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)SBRestartManagerAccessibility;
  -[SBRestartManagerAccessibility rebootWithContext:](&v10, sel_rebootWithContext_, v4);

}

@end
