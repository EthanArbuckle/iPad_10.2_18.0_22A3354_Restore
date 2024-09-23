@implementation TimeDurationPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SleepHealthUI.TimeDurationPicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.TimeDurationPicker"), CFSTR("accessibilityDurationLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.TimeDurationPicker"), CFSTR("increase"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.TimeDurationPicker"), CFSTR("decrease"), "v", 0);

}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __53__TimeDurationPickerAccessibility_automationElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[TimeDurationPickerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDurationLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

@end
