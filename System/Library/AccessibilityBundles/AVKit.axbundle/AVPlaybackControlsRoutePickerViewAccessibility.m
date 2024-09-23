@implementation AVPlaybackControlsRoutePickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVPlaybackControlsRoutePickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsRoutePickerView"), CFSTR("customButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsRoutePickerView"), CFSTR("_customButton"), "AVButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackControlsRoutePickerViewAccessibility;
  -[AVPlaybackControlsRoutePickerViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("airplay.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsRoutePickerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_customButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

}

- (id)customButton
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackControlsRoutePickerViewAccessibility;
  -[AVPlaybackControlsRoutePickerViewAccessibility customButton](&v5, sel_customButton);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsRoutePickerViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
