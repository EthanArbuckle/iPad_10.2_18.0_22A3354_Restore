@implementation SUTermsAndConditionsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUTermsAndConditionsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_termsAndConditionsControl
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUTermsAndConditionsViewAccessibility;
  -[SUTermsAndConditionsViewAccessibility _termsAndConditionsControl](&v6, sel__termsAndConditionsControl);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73D8] | v4);

  return v2;
}

@end
