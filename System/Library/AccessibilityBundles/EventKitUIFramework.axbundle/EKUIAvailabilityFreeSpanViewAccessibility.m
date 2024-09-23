@implementation EKUIAvailabilityFreeSpanViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKUIAvailabilityFreeSpanView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIAvailabilityFreeSpanView"), CFSTR("startDate"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[EKUIAvailabilityFreeSpanViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("startDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXDateStringForFormat();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("free.span.select.hint"));
}

- (CGPoint)accessibilityActivationPoint
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  double MinY;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[EKUIAvailabilityFreeSpanViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MinX = CGRectGetMinX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MinY = CGRectGetMinY(v11);
  v8 = MinX;
  result.y = MinY;
  result.x = v8;
  return result;
}

@end
