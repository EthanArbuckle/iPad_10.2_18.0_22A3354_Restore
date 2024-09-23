@implementation SFStepperAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFStepper");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFStepper"), CFSTR("setText:forButton:"), "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFStepper"), CFSTR("trailingButton"), ");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFStepper"), CFSTR("leadingButton"), ");

}

- (id)accessibilityLabel
{
  return accessibilityMobileSafariLocalizedString(CFSTR("text.size"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (void)accessibilityIncrement
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SFStepperAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trailingButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendActionsForControlEvents:", 64);
}

- (void)accessibilityDecrement
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SFStepperAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leadingButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendActionsForControlEvents:", 64);
}

- (void)setText:(id)a3 forButton:(int64_t)a4
{
  if (a3)
    -[SFStepperAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", a3, a4);
}

@end
