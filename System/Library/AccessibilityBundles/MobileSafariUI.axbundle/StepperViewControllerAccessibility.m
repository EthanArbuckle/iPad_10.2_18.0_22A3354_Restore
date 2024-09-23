@implementation StepperViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StepperViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("StepperViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("StepperViewController"), CFSTR("_buttonForStepperButton:"), "@", "q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StepperViewControllerAccessibility;
  -[StepperViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[StepperViewControllerAccessibility _axMarkupStepperButtons](self, "_axMarkupStepperButtons");
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StepperViewControllerAccessibility;
  -[StepperViewControllerAccessibility loadView](&v3, sel_loadView);
  -[StepperViewControllerAccessibility _axMarkupStepperButtons](self, "_axMarkupStepperButtons");
}

- (void)_axMarkupStepperButtons
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  StepperViewControllerAccessibility *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v3 = MEMORY[0x24BDAC760];
  v9 = MEMORY[0x24BDAC760];
  AXPerformSafeBlock();
  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8 = self;
  AXPerformSafeBlock();
  v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  accessibilityLocalizedString(CFSTR("decrease.font.size"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v6, v3, 3221225472, __61__StepperViewControllerAccessibility__axMarkupStepperButtons__block_invoke_2, &unk_25029F1E0, v8, &v11, v9, 3221225472, __61__StepperViewControllerAccessibility__axMarkupStepperButtons__block_invoke, &unk_25029F1E0, self, &v11);

  accessibilityLocalizedString(CFSTR("increase.font.size"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v7);

}

void __61__StepperViewControllerAccessibility__axMarkupStepperButtons__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_buttonForStepperButton:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__StepperViewControllerAccessibility__axMarkupStepperButtons__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_buttonForStepperButton:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
