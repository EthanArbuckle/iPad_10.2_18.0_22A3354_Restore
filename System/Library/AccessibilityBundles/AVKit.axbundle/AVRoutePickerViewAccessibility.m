@implementation AVRoutePickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVRoutePickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVRoutePickerView"), CFSTR("_routePickerButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVRoutePickerView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVRoutePickerView"), CFSTR("initWithCoder:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVRoutePickerView"), CFSTR("delegate"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVRoutePickerViewAccessibility;
  -[AVRoutePickerViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[AVRoutePickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_routePickerButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("route.picker.button.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (AVRoutePickerViewAccessibility)initWithFrame:(CGRect)a3
{
  AVRoutePickerViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVRoutePickerViewAccessibility;
  v3 = -[AVRoutePickerViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AVRoutePickerViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (AVRoutePickerViewAccessibility)initWithCoder:(id)a3
{
  AVRoutePickerViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVRoutePickerViewAccessibility;
  v3 = -[AVRoutePickerViewAccessibility initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[AVRoutePickerViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
