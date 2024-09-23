@implementation CSChargingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSChargingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("_CSSingleBatteryChargingView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBUILegibilityLabel"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSChargingViewController"), CFSTR("_chargingView"), "CSBatteryChargingView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_CSSingleBatteryChargingView"), CFSTR("_chargePercentLabel"), "SBUILegibilityLabel");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSChargingViewControllerAccessibility;
  -[CSChargingViewControllerAccessibility viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[CSChargingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_chargingView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("CSBatteryChargingView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "accessibilityLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeakAndDoNotBeInterrupted();

    }
  }
}

@end
