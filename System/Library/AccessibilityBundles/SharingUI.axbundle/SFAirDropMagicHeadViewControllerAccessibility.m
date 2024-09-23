@implementation SFAirDropMagicHeadViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFAirDropMagicHeadViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SFAirDropMagicHeadViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFAirDropMagicHeadViewController"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFAirDropMagicHeadViewController"), CFSTR("nameLabel2"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFAirDropMagicHeadViewController"), CFSTR("secondLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFAirDropMagicHeadViewController"), CFSTR("resetSecondLabel"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFAirDropMagicHeadViewController"), CFSTR("setSecondLabelText:withTextColor:animated:completion:"), "v", "@", "@", "B", "@?", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFAirDropMagicHeadViewControllerAccessibility;
  -[SFAirDropMagicHeadViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[SFAirDropMagicHeadViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("nameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[SFAirDropMagicHeadViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("nameLabel2"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

  -[SFAirDropMagicHeadViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("secondLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAirDropMagicHeadViewControllerAccessibility;
  -[SFAirDropMagicHeadViewControllerAccessibility loadView](&v3, sel_loadView);
  -[SFAirDropMagicHeadViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setSecondLabelText:(id)a3 withTextColor:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __102__SFAirDropMagicHeadViewControllerAccessibility_setSecondLabelText_withTextColor_animated_completion___block_invoke;
  v18[3] = &unk_250353708;
  v19 = v10;
  v20 = v11;
  v12 = v11;
  v13 = v10;
  v14 = a4;
  v15 = (void *)MEMORY[0x23491DA38](v18);
  v17.receiver = self;
  v17.super_class = (Class)SFAirDropMagicHeadViewControllerAccessibility;
  -[SFAirDropMagicHeadViewControllerAccessibility setSecondLabelText:withTextColor:animated:completion:](&v17, sel_setSecondLabelText_withTextColor_animated_completion_, v13, v14, v7, v15);

  -[SFAirDropMagicHeadViewControllerAccessibility _axWheelView](self, "_axWheelView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_axSetStatusText:", v13);

}

uint64_t __102__SFAirDropMagicHeadViewControllerAccessibility_setSecondLabelText_withTextColor_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)resetSecondLabel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFAirDropMagicHeadViewControllerAccessibility;
  -[SFAirDropMagicHeadViewControllerAccessibility resetSecondLabel](&v4, sel_resetSecondLabel);
  -[SFAirDropMagicHeadViewControllerAccessibility _axWheelView](self, "_axWheelView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axSetStatusText:", 0);

}

- (id)_axWheelView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SFAirDropMagicHeadViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("wheelView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
