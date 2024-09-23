@implementation MUPunchoutViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPunchoutView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPunchoutView"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPunchoutViewModel"), CFSTR("punchoutText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MUPunchoutViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("punchoutText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
