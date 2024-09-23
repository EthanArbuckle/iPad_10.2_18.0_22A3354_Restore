@implementation EKDayAllDayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKDayAllDayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayAllDayView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayAllDayView"), CFSTR("_allDay"), "UILabel");

}

- (void)_axAnnotateAllDayLabel
{
  id v2;

  -[EKDayAllDayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_allDay"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySetIsSpeakThisElement:", 0);
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("AllDayLabel"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKDayAllDayViewAccessibility;
  -[EKDayAllDayViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[EKDayAllDayViewAccessibility _axAnnotateAllDayLabel](self, "_axAnnotateAllDayLabel");
}

- (EKDayAllDayViewAccessibility)initWithFrame:(CGRect)a3
{
  EKDayAllDayViewAccessibility *v3;
  EKDayAllDayViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKDayAllDayViewAccessibility;
  v3 = -[EKDayAllDayViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[EKDayAllDayViewAccessibility _axAnnotateAllDayLabel](v3, "_axAnnotateAllDayLabel");
  return v4;
}

@end
