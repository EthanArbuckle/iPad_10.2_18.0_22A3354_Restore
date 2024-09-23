@implementation EKDayOccurrenceResizeHandleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKDayOccurrenceResizeHandleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsStartHandle
{
  void *v2;
  char v3;

  -[EKDayOccurrenceResizeHandleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("StartHandle"));

  return v3;
}

- (BOOL)_axIsEndHandle
{
  void *v2;
  char v3;

  -[EKDayOccurrenceResizeHandleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("EndHandle"));

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  __CFString *v3;
  void *v4;

  if (-[EKDayOccurrenceResizeHandleViewAccessibility _axIsStartHandle](self, "_axIsStartHandle"))
  {
    v3 = CFSTR("resize.handle.start.label");
  }
  else
  {
    if (!-[EKDayOccurrenceResizeHandleViewAccessibility _axIsEndHandle](self, "_axIsEndHandle"))
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("resize.handle.end.label");
  }
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)accessibilityHint
{
  __CFString *v3;
  void *v4;

  if (-[EKDayOccurrenceResizeHandleViewAccessibility _axIsStartHandle](self, "_axIsStartHandle"))
  {
    v3 = CFSTR("resize.handle.start.hint");
  }
  else
  {
    if (!-[EKDayOccurrenceResizeHandleViewAccessibility _axIsEndHandle](self, "_axIsEndHandle"))
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("resize.handle.end.hint");
  }
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[EKDayOccurrenceResizeHandleViewAccessibility bounds](self, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGRectGetMidY(v11);
  -[EKDayOccurrenceResizeHandleViewAccessibility _axIsEndHandle](self, "_axIsEndHandle");
  UIAccessibilityPointForPoint();
  result.y = v8;
  result.x = v7;
  return result;
}

@end
