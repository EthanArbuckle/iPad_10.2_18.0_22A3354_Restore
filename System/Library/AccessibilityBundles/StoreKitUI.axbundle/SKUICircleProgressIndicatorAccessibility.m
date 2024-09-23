@implementation SKUICircleProgressIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUICircleProgressIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  SKUICircleProgressIndicatorAccessibility *v5;
  BOOL v6;

  -[SKUICircleProgressIndicatorAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessoryView");
    v5 = (SKUICircleProgressIndicatorAccessibility *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != self;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)accessibilityLabel
{
  return accessibilitySKUILocalizedString(CFSTR("circle.progress.indicator"));
}

@end
