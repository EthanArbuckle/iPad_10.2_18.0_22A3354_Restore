@implementation SKUIOnboardingProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIOnboardingProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIOnboardingProgressView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIOnboardingProgressView"), CFSTR("progress"), "d", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityPath
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDF6870];
  -[SKUIOnboardingProgressViewAccessibility bounds](self, "bounds");
  AX_CGRectGetCenter();
  v5 = v4;
  v7 = v6;
  -[SKUIOnboardingProgressViewAccessibility bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v5, v7, v8 * 0.5, 0.0, 360.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityConvertPathFunction();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SKUIOnboardingProgressViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  double v2;
  void *v3;

  -[SKUIOnboardingProgressViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("progress"));
  if (v2 <= 0.0)
  {
    v3 = 0;
  }
  else
  {
    AXFormatFloatWithPercentage();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
