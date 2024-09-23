@implementation ETColorPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETColorPickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("ETColorPickerView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ETColorPickerView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETColorPickerView"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETColorPickerView"), CFSTR("showColorWheel"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETColorPickerView"), CFSTR("_paletteCircles"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETColorPickerView"), CFSTR("layoutPaletteCircles"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETColorPickerView"), CFSTR("initWithFrame: collapsedFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETColorPickerView"), CFSTR("_dismissAnimated: completion:"), "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETColorPickerView"), CFSTR("dismissAnimated: completion:"), "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETColorPickerView"), CFSTR("presentAnimated: completion:"), "v", "B", "@?", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ETColorPickerViewAccessibility;
  -[ETColorPickerViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[ETColorPickerViewAccessibility _accessibilitySetCenterCircleHint](self, "_accessibilitySetCenterCircleHint");
}

- (BOOL)isAccessibilityElement
{
  return -[ETColorPickerViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")) ^ 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  objc_opt_class();
  -[ETColorPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_selectedCircle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("backgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("people.color.picker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axColorStringForSpeaking");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)accessibilityPerformEscape
{
  int v3;

  v3 = -[ETColorPickerViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded"));
  if (v3)
    -[ETColorPickerViewAccessibility dismissAnimated:completion:](self, "dismissAnimated:completion:", 1, 0);
  return v3;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect result;

  if (-[ETColorPickerViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))
  {
    v15.receiver = self;
    v15.super_class = (Class)ETColorPickerViewAccessibility;
    -[ETColorPickerViewAccessibility accessibilityFrame](&v15, sel_accessibilityFrame);
    v7 = v6;
  }
  else
  {
    objc_opt_class();
    -[ETColorPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "bounds");
    v7 = v10;

    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;

    v3 = v7 * 0.5;
    v5 = v13 + v13;
    v4 = 0.0;
  }
  v14 = v7;
  result.size.height = v5;
  result.size.width = v14;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (ETColorPickerViewAccessibility)initWithFrame:(CGRect)a3 collapsedFrame:(CGRect)a4
{
  ETColorPickerViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ETColorPickerViewAccessibility;
  v4 = -[ETColorPickerViewAccessibility initWithFrame:collapsedFrame:](&v6, sel_initWithFrame_collapsedFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  -[ETColorPickerViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (void)presentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__ETColorPickerViewAccessibility_presentAnimated_completion___block_invoke;
  v10[3] = &unk_2501F5ED8;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  v8 = (void *)MEMORY[0x23490D5E4](v10);
  v9.receiver = self;
  v9.super_class = (Class)ETColorPickerViewAccessibility;
  -[ETColorPickerViewAccessibility presentAnimated:completion:](&v9, sel_presentAnimated_completion_, v4, v8);

}

void __61__ETColorPickerViewAccessibility_presentAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityLoadAccessibilityInformation");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__ETColorPickerViewAccessibility__dismissAnimated_completion___block_invoke;
  v10[3] = &unk_2501F5ED8;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  v8 = (void *)MEMORY[0x23490D5E4](v10);
  v9.receiver = self;
  v9.super_class = (Class)ETColorPickerViewAccessibility;
  -[ETColorPickerViewAccessibility _dismissAnimated:completion:](&v9, sel__dismissAnimated_completion_, v4, v8);

}

void __62__ETColorPickerViewAccessibility__dismissAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityLoadAccessibilityInformation");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)showColorWheel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ETColorPickerViewAccessibility;
  -[ETColorPickerViewAccessibility showColorWheel](&v2, sel_showColorWheel);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)layoutPaletteCircles
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ETColorPickerViewAccessibility;
  -[ETColorPickerViewAccessibility layoutPaletteCircles](&v3, sel_layoutPaletteCircles);
  -[ETColorPickerViewAccessibility _accessibilitySetCenterCircleHint](self, "_accessibilitySetCenterCircleHint");
}

- (void)_accessibilitySetCenterCircleHint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[ETColorPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_paletteCircles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("non.adjustable.color.circle.hint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityHint:", v6);

}

@end
