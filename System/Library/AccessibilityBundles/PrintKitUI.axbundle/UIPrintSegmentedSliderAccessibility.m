@implementation UIPrintSegmentedSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPrintSegmentedSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UIPrintSegmentedSlider"), CFSTR("UISlider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPrintSegmentedSlider"), CFSTR("numberOfTicks"), "Q", 0);

}

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = a3;
  -[UIPrintSegmentedSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("minimumValue"));
  v6 = v5;
  -[UIPrintSegmentedSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("maximumValue"));
  v8 = v7;
  -[UIPrintSegmentedSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  v10 = v9;
  v11 = (v8 - v6)
      / (double)(unint64_t)-[UIPrintSegmentedSliderAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("numberOfTicks"));
  if (!v3)
    v11 = -v11;
  v12 = v10 + v11;
  if (v12 >= v6 && vabdd_f64(v12, v6) >= 0.001)
  {
    if (v12 > v8)
      return v8;
    v6 = v12;
    if (vabdd_f64(v12, v8) < 0.001)
      return v8;
  }
  return v6;
}

@end
