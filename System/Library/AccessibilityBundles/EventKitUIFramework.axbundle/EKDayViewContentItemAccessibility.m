@implementation EKDayViewContentItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKDayViewContentItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayViewContentItem"), CFSTR("setUnPinnedViewFrame:"), "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayViewContentItem"), CFSTR("unPinnedViewFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayViewContentItem"), CFSTR("view"), "@", 0);

}

- (void)_axAnnotateOccurrenceView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGRect v7;

  -[EKDayViewContentItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("unPinnedViewFrame"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "CGRectValue");
    if (!CGRectIsNull(v7))
    {
      objc_opt_class();
      -[EKDayViewContentItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsSafeCategory();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "_axSetRealFrameInSuperview:", v4);
    }
  }

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKDayViewContentItemAccessibility;
  -[EKDayViewContentItemAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[EKDayViewContentItemAccessibility _axAnnotateOccurrenceView](self, "_axAnnotateOccurrenceView");
}

- (void)setUnPinnedViewFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKDayViewContentItemAccessibility;
  -[EKDayViewContentItemAccessibility setUnPinnedViewFrame:](&v4, sel_setUnPinnedViewFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[EKDayViewContentItemAccessibility _axAnnotateOccurrenceView](self, "_axAnnotateOccurrenceView");
}

@end
