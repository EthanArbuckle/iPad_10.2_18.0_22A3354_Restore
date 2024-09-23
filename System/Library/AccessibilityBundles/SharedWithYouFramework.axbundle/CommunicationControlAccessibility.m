@implementation CommunicationControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SharedWithYou.CommunicationControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("SharedWithYou.CommunicationControl"), CFSTR("label"), "@");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CommunicationControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  int v3;
  uint64_t v4;
  unint64_t v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");
  v4 = *MEMORY[0x24BDF73E8];
  if (v3)
    v4 = 0;
  v5 = v4 | *MEMORY[0x24BDF73B0];

  return v5;
}

@end
