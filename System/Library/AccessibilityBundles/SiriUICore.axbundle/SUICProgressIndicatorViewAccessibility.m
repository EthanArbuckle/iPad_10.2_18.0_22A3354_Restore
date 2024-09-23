@implementation SUICProgressIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUICProgressIndicatorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUICProgressIndicatorView"), CFSTR("isSpinning"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUICProgressIndicatorView"), CFSTR("isCheckmarkVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUICProgressIndicatorView"), CFSTR("isArrowVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUICProgressIndicatorView"), CFSTR("progressValue"), "d", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("progress.indicator.label"));
}

- (id)accessibilityValue
{
  __CFString *v3;
  void *v4;
  double v6;
  objc_super v8;

  if (-[SUICProgressIndicatorViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSpinning")))
  {
    v3 = CFSTR("progress.indicator.value.indeterminate");
LABEL_7:
    accessibilityLocalizedString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (-[SUICProgressIndicatorViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isCheckmarkVisible")))
  {
    v3 = CFSTR("progress.indicator.value.finished");
    goto LABEL_7;
  }
  if (-[SUICProgressIndicatorViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isArrowVisible")))
  {
    v3 = CFSTR("progress.indicator.value.idle");
    goto LABEL_7;
  }
  -[SUICProgressIndicatorViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("progressValue"));
  if (v6 <= 0.0 || v6 > 1.0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SUICProgressIndicatorViewAccessibility;
    -[SUICProgressIndicatorViewAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXFormatFloatWithPercentage();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
