@implementation MTATimerButtonsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTATimerButtonsController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerButtonsController"), CFSTR("initWithTarget:"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerButtonsController"), CFSTR("setState:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTATimerButtonsController"), CFSTR("_cancelButton"), "MTACircleButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTATimerButtonsController"), CFSTR("_state"), "Q");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTATimerButtonsControllerAccessibility;
  -[MTATimerButtonsControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MTATimerButtonsControllerAccessibility _updateCancelButtonState](self, "_updateCancelButtonState");
}

- (MTATimerButtonsControllerAccessibility)initWithTarget:(id)a3
{
  MTATimerButtonsControllerAccessibility *v3;
  MTATimerButtonsControllerAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTATimerButtonsControllerAccessibility;
  v3 = -[MTATimerButtonsControllerAccessibility initWithTarget:](&v6, sel_initWithTarget_, a3);
  v4 = v3;
  if (v3)
    -[MTATimerButtonsControllerAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (void)setState:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTATimerButtonsControllerAccessibility;
  -[MTATimerButtonsControllerAccessibility setState:](&v4, sel_setState_, a3);
  -[MTATimerButtonsControllerAccessibility _updateCancelButtonState](self, "_updateCancelButtonState");
}

- (void)_updateCancelButtonState
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  -[MTATimerButtonsControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cancelButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MTATimerButtonsControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_state"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    v7 = *MEMORY[0x24BDF73E8];
    if (v6 != 1)
      v7 = 0;
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v7);
  }

}

@end
