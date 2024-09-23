@implementation COSManualFlowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSManualFlowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSManualFlowView"), CFSTR("_deviceNameTextField"), "UITextField");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSManualFlowView"), CFSTR("_btDataTextField"), "UITextField");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)COSManualFlowViewAccessibility;
  -[COSManualFlowViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[COSManualFlowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_deviceNameTextField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("DeviceNameField"));

  -[COSManualFlowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_btDataTextField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("BTDataField"));

}

- (COSManualFlowViewAccessibility)initWithFrame:(CGRect)a3
{
  COSManualFlowViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)COSManualFlowViewAccessibility;
  v3 = -[COSManualFlowViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[COSManualFlowViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
