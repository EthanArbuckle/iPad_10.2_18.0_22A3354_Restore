@implementation PXHighFidelityVideoOverlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXHighFidelityVideoOverlayButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXHighFidelityVideoOverlayButton"), CFSTR("_button"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXHighFidelityVideoOverlayButton"), CFSTR("initWithConfiguration:"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXHighFidelityVideoOverlayButtonAccessibility;
  -[PXHighFidelityVideoOverlayButtonAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PXHighFidelityVideoOverlayButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (PXHighFidelityVideoOverlayButtonAccessibility)initWithConfiguration:(id)a3
{
  PXHighFidelityVideoOverlayButtonAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXHighFidelityVideoOverlayButtonAccessibility;
  v3 = -[PXHighFidelityVideoOverlayButtonAccessibility initWithConfiguration:](&v5, sel_initWithConfiguration_, a3);
  -[PXHighFidelityVideoOverlayButtonAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

- (id)accessibilityLabel
{
  return accessibilityPhotosUICoreLocalizedString(CFSTR("memory.video.play"));
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  char v4;

  -[PXHighFidelityVideoOverlayButtonAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXHighFidelityVideoOverlayButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PXHighFidelityVideoOverlayButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
