@implementation MeasureUIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.ViewController"), CFSTR("accessibilityEditView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.EditView"), CFSTR("didTapEditButton"), "v", 0);

}

- (int64_t)_accessibilityOrientationForCompareGeometry
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activeInterfaceOrientation");

  return v3;
}

- (BOOL)accessibilityPerformMagicTap
{
  int IsMeasuring;

  IsMeasuring = AXMeasureIsMeasuring();
  if (IsMeasuring)
    AXPerformSafeBlock();
  return IsMeasuring;
}

void __65__MeasureUIApplicationAccessibility_accessibilityPerformMagicTap__block_invoke()
{
  void *v0;
  id v1;

  AXMeasureViewController();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("accessibilityEditView"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "didTapEditButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MeasureUIApplicationAccessibility;
  -[MeasureUIApplicationAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  v2 = AXMeasureAccessibilityStateObserver();
}

@end
