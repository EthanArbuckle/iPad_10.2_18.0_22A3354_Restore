@implementation VerificationSymptomDateEntryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExposureNotificationUI.VerificationSymptomDateEntryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExposureNotificationUI.VerificationSymptomDateEntryViewController"), CFSTR("updateSymptomsDateCell:"), "v", "@", 0);
}

- (void)updateSymptomsDateCell:(id)a3
{
  id v4;
  char v5;
  _QWORD v6[4];
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VerificationSymptomDateEntryViewControllerAccessibility;
  v4 = a3;
  -[VerificationSymptomDateEntryViewControllerAccessibility updateSymptomsDateCell:](&v8, sel_updateSymptomsDateCell_, v4);
  v5 = -[VerificationSymptomDateEntryViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("hasSymptoms"));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__VerificationSymptomDateEntryViewControllerAccessibility_updateSymptomsDateCell___block_invoke;
  v6[3] = &__block_descriptor_33_e5_Q8__0l;
  v7 = v5;
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", v6);

}

uint64_t __82__VerificationSymptomDateEntryViewControllerAccessibility_updateSymptomsDateCell___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 32))
    v1 = MEMORY[0x24BDF73E0];
  else
    v1 = MEMORY[0x24BDF73E8];
  return *(_QWORD *)v1;
}

@end
