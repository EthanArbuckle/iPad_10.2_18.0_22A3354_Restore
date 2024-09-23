@implementation SBTelephonyManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBTelephonyManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)updateSpringBoard
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayedCallFromCalls:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBTelephonyManagerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("inCall"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE30]);
  v7.receiver = self;
  v7.super_class = (Class)SBTelephonyManagerAccessibility;
  -[SBTelephonyManagerAccessibility updateSpringBoard](&v7, sel_updateSpringBoard);

}

@end
