@implementation SBUIPasscodeLockNumberPadAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIPasscodeLockNumberPad");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeLockNumberPad"), CFSTR("_configureAdditionalButtons"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPasscodeLockNumberPad"), CFSTR("_cancelButton"), "SBUIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPasscodeLockNumberPad"), CFSTR("_backspaceButton"), "SBUIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPasscodeLockNumberPad"), CFSTR("_emergencyCallButton"), "SBUIButton");

}

- (BOOL)_accessibilityIsSoftwareKeyboardMimic
{
  return 1;
}

- (void)_configureAdditionalButtons
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUIPasscodeLockNumberPadAccessibility;
  -[SBUIPasscodeLockNumberPadAccessibility _configureAdditionalButtons](&v7, sel__configureAdditionalButtons);
  -[SBUIPasscodeLockNumberPadAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cancelButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDF73B0];
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

  -[SBUIPasscodeLockNumberPadAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backspaceButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73D0] | v4);

  -[SBUIPasscodeLockNumberPadAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_emergencyCallButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityTraits:", v4);

}

@end
