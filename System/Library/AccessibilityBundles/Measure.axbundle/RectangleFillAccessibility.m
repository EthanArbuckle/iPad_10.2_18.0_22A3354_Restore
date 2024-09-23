@implementation RectangleFillAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.RectangleFill");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.RectangleFill"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.RectangleFill"), CFSTR("setState:"), "v", "q", 0);

}

- (void)setState:(int64_t)a3
{
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v5 = -[RectangleFillAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("state"));
  v9.receiver = self;
  v9.super_class = (Class)RectangleFillAccessibility;
  -[RectangleFillAccessibility setState:](&v9, sel_setState_, a3);
  if (v5 != a3)
  {
    switch(a3)
    {
      case 1:
        v6 = CFSTR("RECTANGLE_REMOVED");
        break;
      case 5:
        v6 = CFSTR("RECTANGLE_CONFIRMED");
        break;
      case 6:
        v6 = CFSTR("RECTANGLE_ADDED");
        break;
      default:
        return;
    }
    accessibilityLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      AXMeasureSpeakMeasurementAnnouncement(v7);

    }
  }
}

@end
