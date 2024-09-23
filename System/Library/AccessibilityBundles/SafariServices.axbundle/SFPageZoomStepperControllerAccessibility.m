@implementation SFPageZoomStepperControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFPageZoomStepperController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFPageZoomStepperController"), CFSTR("_stepper"), "<_SFSettingsAlertStepperConfiguration>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFPageZoomStepperController"), CFSTR("_percentFormatter"), "NSNumberFormatter");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFPageZoomStepperController"), CFSTR("prepareStepper:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFPageZoomStepperController"), CFSTR("_updateButtonsEnabledOnMainQueueWithZoomFactor:"), "v", "d", 0);

}

- (void)prepareStepper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFPageZoomStepperControllerAccessibility;
  -[SFPageZoomStepperControllerAccessibility prepareStepper:](&v8, sel_prepareStepper_, a3);
  accessibilitySafariServicesLocalizedString(CFSTR("page.zoom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPageZoomStepperControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_stepper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

  -[SFPageZoomStepperControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_stepper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__SFPageZoomStepperControllerAccessibility_prepareStepper___block_invoke;
  v7[3] = &unk_25032D5C8;
  v7[4] = self;
  objc_msgSend(v6, "_setAccessibilityCustomActionsBlock:", v7);

}

id __59__SFPageZoomStepperControllerAccessibility_prepareStepper___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilitySafariServicesLocalizedString(CFSTR("reset.action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__SFPageZoomStepperControllerAccessibility_prepareStepper___block_invoke_2;
  v7[3] = &unk_25032D5A0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v4 = (void *)objc_msgSend(v2, "initWithName:actionHandler:", v3, v7);
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __59__SFPageZoomStepperControllerAccessibility_prepareStepper___block_invoke_2()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __59__SFPageZoomStepperControllerAccessibility_prepareStepper___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetValue:", 0);
}

- (void)_updateButtonsEnabledOnMainQueueWithZoomFactor:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFPageZoomStepperControllerAccessibility;
  -[SFPageZoomStepperControllerAccessibility _updateButtonsEnabledOnMainQueueWithZoomFactor:](&v10, sel__updateButtonsEnabledOnMainQueueWithZoomFactor_);
  objc_opt_class();
  -[SFPageZoomStepperControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_percentFormatter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPageZoomStepperControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_stepper"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityValue:", v8);

}

@end
