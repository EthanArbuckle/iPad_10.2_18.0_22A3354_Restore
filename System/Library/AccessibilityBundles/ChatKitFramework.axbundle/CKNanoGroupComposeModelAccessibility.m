@implementation CKNanoGroupComposeModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNanoGroupComposeModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNanoGroupComposeModel"), CFSTR("transitionModelStateTo:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNanoGroupComposeModel"), CFSTR("disabledSendViewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNanoGroupComposeModel"), CFSTR("configureStickerViewModel"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNanoGroupComposeModel"), CFSTR("stickerViewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNanoGroupComposeModel"), CFSTR("sticker"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNanoGroupComposeModel"), CFSTR("waveFormViewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNanoGroupComposeModel"), CFSTR("configureWaveFormViewModel"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKNanoGroupComposeModelAccessibility;
  -[CKNanoGroupComposeModelAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CKNanoGroupComposeModelAccessibility _axAnnotateViewModels](self, "_axAnnotateViewModels");
}

- (void)transitionModelStateTo:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKNanoGroupComposeModelAccessibility;
  -[CKNanoGroupComposeModelAccessibility transitionModelStateTo:](&v4, sel_transitionModelStateTo_, a3);
  -[CKNanoGroupComposeModelAccessibility _axAnnotateViewModels](self, "_axAnnotateViewModels");
}

- (void)configureStickerViewModel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKNanoGroupComposeModelAccessibility;
  -[CKNanoGroupComposeModelAccessibility configureStickerViewModel](&v3, sel_configureStickerViewModel);
  -[CKNanoGroupComposeModelAccessibility _axAnnotateStickerViewModels](self, "_axAnnotateStickerViewModels");
}

- (void)configureWaveFormViewModel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKNanoGroupComposeModelAccessibility;
  -[CKNanoGroupComposeModelAccessibility configureWaveFormViewModel](&v3, sel_configureWaveFormViewModel);
  -[CKNanoGroupComposeModelAccessibility _axAnnotateWaveformViewModels](self, "_axAnnotateWaveformViewModels");
}

- (void)_axAnnotateViewModels
{
  id v2;

  -[CKNanoGroupComposeModelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("disabledSendViewModel"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityTraits:", *MEMORY[0x24BDF73E8]);

}

- (void)_axAnnotateStickerViewModels
{
  void *v3;
  void *v4;
  id v5;

  -[CKNanoGroupComposeModelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sticker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKNanoGroupComposeModelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stickerViewModel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v5);

  }
}

- (void)_axAnnotateWaveformViewModels
{
  void *v2;
  id v3;

  -[CKNanoGroupComposeModelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("waveFormViewModel"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("waveform.image"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

@end
