@implementation MediaControlsRelativeVolumeStepperAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsRelativeVolumeStepper");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsRelativeVolumeStepper"), CFSTR("increaseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsRelativeVolumeStepper"), CFSTR("decreaseButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MediaControlsRelativeVolumeStepperAccessibility;
  -[MediaControlsRelativeVolumeStepperAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[MediaControlsRelativeVolumeStepperAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("increaseButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("increase.volume.stepper.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[MediaControlsRelativeVolumeStepperAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("decreaseButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("decrease.volume.stepper.label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

@end
