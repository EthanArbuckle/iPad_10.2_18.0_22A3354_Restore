@implementation MRUVolumeStepperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUVolumeStepperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUVolumeStepperView"), CFSTR("decreaseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUVolumeStepperView"), CFSTR("increaseButton"), "@", 0);

}

- (MRUVolumeStepperViewAccessibility)initWithFrame:(CGRect)a3
{
  MRUVolumeStepperViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRUVolumeStepperViewAccessibility;
  v3 = -[MRUVolumeStepperViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MRUVolumeStepperViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUVolumeStepperViewAccessibility;
  -[MRUVolumeStepperViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("decrease.volume.stepper.label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVolumeStepperViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("decreaseButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

  accessibilityLocalizedString(CFSTR("increase.volume.stepper.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVolumeStepperViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("increaseButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

}

@end
