@implementation HROnboardingAtrialFibrillationGateViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HROnboardingAtrialFibrillationGateViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HROnboardingAtrialFibrillationGateViewController"), CFSTR("diagnosisYesRow"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HROnboardingAtrialFibrillationGateViewController"), CFSTR("diagnosisNoRow"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HROnboardingAtrialFibrillationGateViewController"), CFSTR("_diagnosis"), "NSNumber");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HROnboardingAtrialFibrillationGateViewControllerAccessibility;
  -[HROnboardingAtrialFibrillationGateViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[HROnboardingAtrialFibrillationGateViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("diagnosisYesRow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewControllerAccessibility _axSetupSelectionRow:expectedResult:](self, "_axSetupSelectionRow:expectedResult:", v3, 1);

  -[HROnboardingAtrialFibrillationGateViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("diagnosisNoRow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationGateViewControllerAccessibility _axSetupSelectionRow:expectedResult:](self, "_axSetupSelectionRow:expectedResult:", v4, 0);

}

- (void)_axSetupSelectionRow:(id)a3 expectedResult:(BOOL)a4
{
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  _QWORD v11[4];
  id v12;
  id from;
  id location;

  v6 = a3;
  if (v6)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    objc_msgSend(v6, "setIsAccessibilityElement:", 1);
    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __101__HROnboardingAtrialFibrillationGateViewControllerAccessibility__axSetupSelectionRow_expectedResult___block_invoke;
    v11[3] = &unk_250230330;
    objc_copyWeak(&v12, &from);
    objc_msgSend(v6, "_setAccessibilityLabelBlock:", v11);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __101__HROnboardingAtrialFibrillationGateViewControllerAccessibility__axSetupSelectionRow_expectedResult___block_invoke_2;
    v8[3] = &unk_250230358;
    objc_copyWeak(&v9, &location);
    v10 = a4;
    objc_msgSend(v6, "_setAccessibilityTraitsBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

id __101__HROnboardingAtrialFibrillationGateViewControllerAccessibility__axSetupSelectionRow_expectedResult___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  UIAXStringForAllChildren();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __101__HROnboardingAtrialFibrillationGateViewControllerAccessibility__axSetupSelectionRow_expectedResult___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_diagnosis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF73B0];
  if (v4 && *(unsigned __int8 *)(a1 + 40) == objc_msgSend(v4, "BOOLValue"))
    v5 |= *MEMORY[0x24BDF7400];

  return v5;
}

@end
