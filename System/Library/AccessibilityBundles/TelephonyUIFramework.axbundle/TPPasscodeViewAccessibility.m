@implementation TPPasscodeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPPasscodeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPPasscodeView"), CFSTR("passcodeMutableString"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("sim.pin.textfield"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("sim.pin.characterCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPasscodeViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("passcodeMutableString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB168] | *MEMORY[0x24BEBB128] | *MEMORY[0x24BEBB198];
}

@end
