@implementation SBDeleteNonAppIconAlertItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDeleteNonAppIconAlertItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDeleteNonAppIconAlertItemAccessibility;
  -[SBDeleteNonAppIconAlertItemAccessibility configure:requirePasscodeForActions:](&v5, sel_configure_requirePasscodeForActions_, a3, a4);
  -[SBDeleteNonAppIconAlertItemAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", &unk_2503817E0, *MEMORY[0x24BEBB2F0]);
}

@end
