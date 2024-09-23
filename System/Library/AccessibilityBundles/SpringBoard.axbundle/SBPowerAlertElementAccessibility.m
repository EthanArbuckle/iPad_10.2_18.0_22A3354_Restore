@implementation SBPowerAlertElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBPowerAlertElement");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBPowerAlertElement"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("SBSystemApertureContextProviding"), CFSTR("preferredAlertingDuration:"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SBPowerAlertElement"), CFSTR("SBSystemApertureContextProviding"));

}

- (double)preferredAlertingDuration:(double)a3
{
  double v3;
  double v4;
  BOOL IsVoiceOverRunning;
  double result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPowerAlertElementAccessibility;
  -[SBPowerAlertElementAccessibility preferredAlertingDuration:](&v7, sel_preferredAlertingDuration_, a3);
  v4 = v3;
  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  result = 15.0;
  if (!IsVoiceOverRunning || v4 >= 15.0)
    return v4;
  return result;
}

@end
