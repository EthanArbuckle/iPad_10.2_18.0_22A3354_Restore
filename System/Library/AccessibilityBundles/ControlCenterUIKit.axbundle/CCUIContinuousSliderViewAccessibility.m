@implementation CCUIContinuousSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIContinuousSliderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIContinuousSliderView"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIBaseSliderView"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIBaseSliderView"), CFSTR("value"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIBaseSliderView"), CFSTR("setValue:animated:"), "v", "f", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIBaseSliderView"), CFSTR("setValue:"), "v", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIContinuousSliderView"), CFSTR("_continuousSliderCornerRadius"), "d");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIContinuousSliderView"), CFSTR("UIView"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIContinuousSliderViewAccessibility;
  -[CCUIContinuousSliderViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CCUIContinuousSliderViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  -[CCUIContinuousSliderViewAccessibility _axSetVolumeValue:](self, "_axSetVolumeValue:");
}

- (id)accessibilityValue
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;

  -[CCUIContinuousSliderViewAccessibility _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CCUIContinuousSliderViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
    -[CCUIContinuousSliderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("superview"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x23490BE4C](CFSTR("MRUVolumeView"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      -[CCUIContinuousSliderViewAccessibility _axVolumeValue](self, "_axVolumeValue");
    AXFormatFloatWithPercentage();
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v5;

  return v8;
}

- (id)accessibilityPath
{
  void *v2;
  CCUIContinuousSliderViewAccessibility *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIBezierPath *v13;
  void *v14;

  v2 = (void *)MEMORY[0x24BDF6870];
  v3 = self;
  -[CCUIContinuousSliderViewAccessibility bounds](v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CCUIContinuousSliderViewAccessibility safeCGFloatForKey:](v3, "safeCGFloatForKey:", CFSTR("_continuousSliderCornerRadius"));
  objc_msgSend(v2, "_bezierPathWithPillRect:cornerRadius:", v5, v7, v9, v11, v12);
  v13 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityConvertPathToScreenCoordinates(v13, (UIView *)v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)accessibilityIncrement
{
  -[CCUIContinuousSliderViewAccessibility _accessibilityAdjustSliderValueInForwardDirection:](self, "_accessibilityAdjustSliderValueInForwardDirection:", 1);
}

- (void)accessibilityDecrement
{
  -[CCUIContinuousSliderViewAccessibility _accessibilityAdjustSliderValueInForwardDirection:](self, "_accessibilityAdjustSliderValueInForwardDirection:", 0);
}

- (double)_axVolumeValue
{
  double result;

  __UIAccessibilityGetAssociatedCGFloat();
  return result;
}

- (void)_axSetVolumeValue:(double)a3
{
  __UIAccessibilitySetAssociatedCGFloat();
}

- (void)_accessibilityAdjustSliderValueInForwardDirection:(BOOL)a3
{
  -[CCUIContinuousSliderViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  AXPerformSafeBlock();
}

void __91__CCUIContinuousSliderViewAccessibility__accessibilityAdjustSliderValueInForwardDirection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  double v5;
  uint64_t v6;
  double v7;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("superview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490BE4C](CFSTR("MRUVolumeView"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = *(double *)(a1 + 40);
    *(float *)&v5 = v5;
    objc_msgSend(*(id *)(a1 + 32), "setValue:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_axSetVolumeValue:", *(double *)(a1 + 40));
    v6 = 4096;
  }
  else
  {
    objc_msgSend(v2, "sendActionsForControlEvents:", 0x10000);
    v7 = *(double *)(a1 + 40);
    *(float *)&v7 = v7;
    objc_msgSend(*(id *)(a1 + 32), "setValue:animated:", 0, v7);
    v6 = 0x40000;
  }
  objc_msgSend(v2, "sendActionsForControlEvents:", v6);

}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIContinuousSliderViewAccessibility;
  return *MEMORY[0x24BDF7430] | -[CCUIContinuousSliderViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)_accessibilityIsVerticalAdjustableElement
{
  return 1;
}

@end
