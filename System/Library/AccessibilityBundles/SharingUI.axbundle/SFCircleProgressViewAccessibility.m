@implementation SFCircleProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFCircleProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFCircleProgressView"), CFSTR("progress"), "d", 0);
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
  -[SFCircleProgressViewAccessibility bounds](self, "bounds");
  AX_CGRectGetCenter();
  v5 = v4;
  v7 = v6;
  -[SFCircleProgressViewAccessibility bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v5, v7, v8 * 0.5, 0.0, 360.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityConvertPathFunction();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("download.progress.indicator"));
}

- (id)accessibilityValue
{
  -[SFCircleProgressViewAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("progress"));
  return (id)AXFormatFloatWithPercentage();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7430];
}

@end
