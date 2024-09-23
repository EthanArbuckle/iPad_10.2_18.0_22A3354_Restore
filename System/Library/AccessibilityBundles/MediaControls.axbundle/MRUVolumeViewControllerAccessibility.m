@implementation MRUVolumeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUVolumeViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MRUVolumeView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUVolumeViewController"), CFSTR("updatePrimarySliderVolumeValueAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MRUVolumeViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUVolumeView"), CFSTR("primarySlider"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MRUContinuousSliderView"), CFSTR("CCUIContinuousSliderView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIContinuousSliderView"), CFSTR("CCUIBaseSliderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIBaseSliderView"), CFSTR("value"), "f", 0);

}

- (void)updatePrimarySliderVolumeValueAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  float v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUVolumeViewControllerAccessibility;
  -[MRUVolumeViewControllerAccessibility updatePrimarySliderVolumeValueAnimated:](&v7, sel_updatePrimarySliderVolumeValueAnimated_, a3);
  -[MRUVolumeViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeUIViewForKey:", CFSTR("primarySlider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "safeFloatForKey:", CFSTR("value"));
    objc_msgSend(v5, "_axSetVolumeValue:", v6);
  }

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MRUVolumeViewControllerAccessibility;
  -[MRUVolumeViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

@end
