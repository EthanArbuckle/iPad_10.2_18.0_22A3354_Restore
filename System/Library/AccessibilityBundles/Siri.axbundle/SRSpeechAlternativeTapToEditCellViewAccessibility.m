@implementation SRSpeechAlternativeTapToEditCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SRSpeechAlternativeTapToEditCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SRSpeechAlternativeTapToEditCellView"), CFSTR("init"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SRSpeechAlternativeTapToEditCellView"), CFSTR("_tapToEditLabel"), "UILabel");

}

- (void)_axAnnotateTapToEditLabel
{
  id v2;

  -[SRSpeechAlternativeTapToEditCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tapToEditLabel"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SRSpeechAlternativeTapToEditCellViewAccessibility;
  -[SRSpeechAlternativeTapToEditCellViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SRSpeechAlternativeTapToEditCellViewAccessibility _axAnnotateTapToEditLabel](self, "_axAnnotateTapToEditLabel");
}

- (SRSpeechAlternativeTapToEditCellViewAccessibility)init
{
  SRSpeechAlternativeTapToEditCellViewAccessibility *v2;
  SRSpeechAlternativeTapToEditCellViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SRSpeechAlternativeTapToEditCellViewAccessibility;
  v2 = -[SRSpeechAlternativeTapToEditCellViewAccessibility init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SRSpeechAlternativeTapToEditCellViewAccessibility _axAnnotateTapToEditLabel](v2, "_axAnnotateTapToEditLabel");
  return v3;
}

@end
