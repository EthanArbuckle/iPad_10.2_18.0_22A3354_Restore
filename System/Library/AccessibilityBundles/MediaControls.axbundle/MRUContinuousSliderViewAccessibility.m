@implementation MRUContinuousSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUContinuousSliderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUVolumeViewController"), CFSTR("audioModuleController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUAudioModuleController"), CFSTR("volumeController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUSystemVolumeController"), CFSTR("outputDeviceRouteController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUSystemOutputDeviceRouteController"), CFSTR("isSplitRoute"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MRUContinuousSliderView"), CFSTR("UIView"));

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("volume.slider.label"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  -[MRUContinuousSliderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("superview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("audioModuleController.volumeController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("outputDeviceRouteController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "safeBoolForKey:", CFSTR("isSplitRoute")))
  {
    accessibilityLocalizedString(CFSTR("volume.slider.value"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MRUContinuousSliderViewAccessibility;
    -[MRUContinuousSliderViewAccessibility accessibilityValue](&v10, sel_accessibilityValue);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

@end
