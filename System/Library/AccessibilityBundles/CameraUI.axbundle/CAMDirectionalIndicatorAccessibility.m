@implementation CAMDirectionalIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDirectionalIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDirectionalIndicator"), CFSTR("direction"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDirectionalIndicator"), CFSTR("_updateArrowShapeAnimated:"), "v", "B", 0);

}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("camera.controls.button"));
}

- (int64_t)_accessibilityExpandedStatus
{
  int64_t result;
  objc_super v4;

  result = -[CAMDirectionalIndicatorAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("direction"));
  if (!result)
    return 2;
  if (result != 1)
  {
    v4.receiver = self;
    v4.super_class = (Class)CAMDirectionalIndicatorAccessibility;
    return -[CAMDirectionalIndicatorAccessibility _accessibilityExpandedStatus](&v4, sel__accessibilityExpandedStatus);
  }
  return result;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMDirectionalIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMDirectionalIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_updateArrowShapeAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMDirectionalIndicatorAccessibility;
  -[CAMDirectionalIndicatorAccessibility _updateArrowShapeAnimated:](&v4, sel__updateArrowShapeAnimated_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
}

@end
