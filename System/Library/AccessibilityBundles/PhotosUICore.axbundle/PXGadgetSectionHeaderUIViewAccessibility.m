@implementation PXGadgetSectionHeaderUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXGadgetSectionHeaderUIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGadgetSectionHeaderUIView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGadgetSectionHeaderUIView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGadgetSectionHeaderUIView"), CFSTR("accessoryButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGadgetSectionHeaderUIView"), CFSTR("headerModel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXGadgetSectionHeaderUIViewAccessibility;
  -[PXGadgetSectionHeaderUIViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF73C0];
  -[PXGadgetSectionHeaderUIViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", v3);

  -[PXGadgetSectionHeaderUIViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetSectionHeaderUIViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headerModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v6, "safeUnsignedIntegerForKey:", CFSTR("buttonType")))
  {
    case 1:
      v7 = &__block_literal_global_324;
      goto LABEL_7;
    case 2:
      v7 = &__block_literal_global_327;
      goto LABEL_7;
    case 3:
      v7 = &__block_literal_global_3;
      goto LABEL_7;
    case 4:
      v7 = &__block_literal_global_330;
      goto LABEL_7;
    case 5:
      v7 = &__block_literal_global_333;
LABEL_7:
      objc_msgSend(v5, "_setAccessibilityLabelBlock:", v7);
      break;
    case 6:
      objc_msgSend(v6, "safeValueForKey:", CFSTR("buttonTitle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAccessibilityLabel:", v8);

      break;
    default:
      break;
  }

}

id __86__PXGadgetSectionHeaderUIViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityPhotosUICoreLocalizedString(CFSTR("menu.button"));
}

id __86__PXGadgetSectionHeaderUIViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return accessibilityPhotosUICoreLocalizedString(CFSTR("see.all.button"));
}

id __86__PXGadgetSectionHeaderUIViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return accessibilityPhotosUICoreLocalizedString(CFSTR("share.button"));
}

id __86__PXGadgetSectionHeaderUIViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4()
{
  return accessibilityPhotosUICoreLocalizedString(CFSTR("dismiss.button"));
}

id __86__PXGadgetSectionHeaderUIViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5()
{
  return accessibilityPhotosUICoreLocalizedString(CFSTR("clear.button"));
}

- (PXGadgetSectionHeaderUIViewAccessibility)initWithFrame:(CGRect)a3
{
  PXGadgetSectionHeaderUIViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGadgetSectionHeaderUIViewAccessibility;
  v3 = -[PXGadgetSectionHeaderUIViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXGadgetSectionHeaderUIViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
