@implementation ColorWheelPickerCircleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[ColorWheelPickerCircleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("digital.touch.picker.circle.identifier")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ColorWheelPickerCircleViewAccessibility;
    v4 = -[ColorWheelPickerCircleViewAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ColorWheelPickerCircleViewAccessibility;
  v3 = -[ColorWheelPickerCircleViewAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[ColorWheelPickerCircleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("digital.touch.picker.circle.identifier"));

  v6 = *MEMORY[0x24BDF73A0];
  if (!v5)
    v6 = 0;
  return v6 | v3;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[ColorWheelPickerCircleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("digital.touch.picker.circle.identifier"));

  if (v4)
  {
    -[ColorWheelPickerCircleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("backgroundColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axColorStringForSpeaking");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ColorWheelPickerCircleViewAccessibility;
    -[ColorWheelPickerCircleViewAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityPath
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[ColorWheelPickerCircleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("digital.touch.picker.circle.identifier"));

  if (v4)
  {
    -[ColorWheelPickerCircleViewAccessibility _accessibilityCirclePathBasedOnBoundsWidth](self, "_accessibilityCirclePathBasedOnBoundsWidth");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ColorWheelPickerCircleViewAccessibility;
    -[ColorWheelPickerCircleViewAccessibility accessibilityPath](&v7, sel_accessibilityPath);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)accessibilityIncrement
{
  void *v3;
  int v4;
  id v5;
  objc_super v6;

  -[ColorWheelPickerCircleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("digital.touch.picker.circle.identifier"));

  if (v4)
  {
    -[ColorWheelPickerCircleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_accessibilityIncrementColorPicker");

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ColorWheelPickerCircleViewAccessibility;
    -[ColorWheelPickerCircleViewAccessibility accessibilityIncrement](&v6, sel_accessibilityIncrement);
  }
}

- (void)accessibilityDecrement
{
  void *v3;
  int v4;
  id v5;
  objc_super v6;

  -[ColorWheelPickerCircleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("digital.touch.picker.circle.identifier"));

  if (v4)
  {
    -[ColorWheelPickerCircleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_accessibilityDecrementColorPicker");

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ColorWheelPickerCircleViewAccessibility;
    -[ColorWheelPickerCircleViewAccessibility accessibilityDecrement](&v6, sel_accessibilityDecrement);
  }
}

@end
