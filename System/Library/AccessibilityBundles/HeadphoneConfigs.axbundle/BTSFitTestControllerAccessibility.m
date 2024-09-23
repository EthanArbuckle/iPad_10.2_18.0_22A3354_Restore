@implementation BTSFitTestControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BTSFitTestController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BTSFitTestController"), CFSTR("startFitTest"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BTSFitTestController"), CFSTR("inEarStatusChanged:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BTSFitTestController"), CFSTR("sealValueChanged:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BTSFitTestController"), CFSTR("_playButton"), "OBTrayButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BTSFitTestController"), CFSTR("_testActive"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BTSFitTestController"), CFSTR("_budsInEar"), "B");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("OBTrayButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBWelcomeController"), CFSTR("headerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBHeaderView"), CFSTR("headerLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("OBTemplateLabel"), CFSTR("UILabel"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BTSFitTestController"), CFSTR("_leftBudResultLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BTSFitTestController"), CFSTR("_rightBudResultLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BTSFitTestController"), CFSTR("_fitTestController"), "OBWelcomeController");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("OBWelcomeController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBWelcomeController"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BTSFitTestController"), CFSTR("currentDevice"), "BluetoothDevice");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  char v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)BTSFitTestControllerAccessibility;
  -[BTSFitTestControllerAccessibility _accessibilityLoadAccessibilityInformation](&v25, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  objc_opt_class();
  -[BTSFitTestControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_playButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[BTSFitTestControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_leftBudResultLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[BTSFitTestControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_rightBudResultLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[BTSFitTestControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_fitTestController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_opt_class();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __79__BTSFitTestControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v21[3] = &unk_25021E970;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", v21);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __79__BTSFitTestControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v19[3] = &unk_25021E998;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v19);
  objc_msgSend(v12, "setIsAccessibilityElement:", 1);
  objc_msgSend(v12, "setAccessibilityTraits:", *MEMORY[0x24BDF73C8]);
  objc_msgSend(v12, "_accessibilitySetUserDefinedMediaAnalysisOptions:", &unk_250220BC0);
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __79__BTSFitTestControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_239;
  v16[3] = &unk_25021E9C0;
  v16[4] = self;
  v14 = v6;
  v17 = v14;
  v15 = v8;
  v18 = v15;
  objc_msgSend(v12, "_setAccessibilityLabelBlock:", v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

uint64_t __79__BTSFitTestControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  int v3;
  uint64_t v4;

  v1 = *MEMORY[0x24BDF73B0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("_budsInEar"));

  v4 = *MEMORY[0x24BDF73E8];
  if (v3)
    v4 = 0;
  return v4 | v1;
}

id __79__BTSFitTestControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;

  objc_opt_class();
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_playButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(v5, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = (void *)v10;

    v9 = v13;
    goto LABEL_6;
  }
  accessibilityLocalizedStringForB298(CFSTR("fit.test.button.play"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained(v2);
  v12 = objc_msgSend(v11, "safeBoolForKey:", CFSTR("_testActive"));

  if (v12)
  {
    accessibilityLocalizedStringForB298(CFSTR("fit.test.button.in.progress"));
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v9;
}

id __79__BTSFitTestControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_239(id *a1)
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  objc_msgSend(a1[4], "safeValueForKey:", CFSTR("currentDevice"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v3, "productId");
  if ((_DWORD)v2 == 8210)
  {
    accessibilityLocalizedStringForB298(CFSTR("Beats494"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedStringForB298(CFSTR("left.airpod"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedStringForB298(CFSTR("right.airpod"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

- (void)updateFocus
{
  char v3;

  v3 = -[BTSFitTestControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_testActive"));
  if (!-[BTSFitTestControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_budsInEar"))
    || (v3 & 1) != 0)
  {
    -[BTSFitTestControllerAccessibility focusHeader](self, "focusHeader");
  }
  else
  {
    -[BTSFitTestControllerAccessibility focusPlayButton](self, "focusPlayButton");
  }
}

- (void)focusPlayButton
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[BTSFitTestControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_playButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v4);
}

- (void)focusHeader
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[BTSFitTestControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_fitTestController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("headerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("headerLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "accessibilityElementIsFocused"))
  {
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

  }
  else
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v5);
  }

}

- (void)viewWillAppear
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BTSFitTestControllerAccessibility;
  -[BTSFitTestControllerAccessibility viewWillAppear](&v3, sel_viewWillAppear);
  -[BTSFitTestControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)startFitTest
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BTSFitTestControllerAccessibility;
  -[BTSFitTestControllerAccessibility startFitTest](&v3, sel_startFitTest);
  -[BTSFitTestControllerAccessibility updateFocus](self, "updateFocus");
}

- (void)inEarStatusChanged:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BTSFitTestControllerAccessibility;
  -[BTSFitTestControllerAccessibility inEarStatusChanged:](&v4, sel_inEarStatusChanged_, a3);
  -[BTSFitTestControllerAccessibility updateFocus](self, "updateFocus");
}

- (void)sealValueChanged:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BTSFitTestControllerAccessibility;
  -[BTSFitTestControllerAccessibility sealValueChanged:](&v4, sel_sealValueChanged_, a3);
  -[BTSFitTestControllerAccessibility focusHeader](self, "focusHeader");
}

@end
