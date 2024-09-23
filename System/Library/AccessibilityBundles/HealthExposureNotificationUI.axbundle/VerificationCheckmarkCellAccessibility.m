@implementation VerificationCheckmarkCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExposureNotificationUI.VerificationCheckmarkCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExposureNotificationUI.VerificationCheckmarkCell"), CFSTR("isChecked"), "B", 0);
}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  int v2;
  uint64_t v3;

  v2 = -[VerificationCheckmarkCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isChecked"));
  v3 = *MEMORY[0x24BDF7400];
  if (!v2)
    v3 = 0;
  return v3 | *MEMORY[0x24BDF73B0];
}

@end
