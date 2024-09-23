@implementation PedestrianARArrowGuidanceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PedestrianARArrowGuidanceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PedestrianARArrowGuidanceView"), CFSTR("_instructionLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PedestrianARArrowGuidanceView"), CFSTR("_dynamicArrowImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PedestrianARArrowGuidanceView"), CFSTR("_dynamicArrowAngle"), "d");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PedestrianARArrowGuidanceViewAccessibility;
  return *MEMORY[0x24BDF7430] | -[PedestrianARArrowGuidanceViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityValue
{
  void *v3;
  char v4;
  __CFString *v5;
  double v6;
  __CFString *v7;

  -[PedestrianARArrowGuidanceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_dynamicArrowImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) != 0)
  {
    v5 = &stru_25025B660;
  }
  else
  {
    -[PedestrianARArrowGuidanceViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("_dynamicArrowAngle"));
    if (v6 >= 180.0)
      v7 = CFSTR("LEFT");
    else
      v7 = CFSTR("RIGHT");
    AXMapsLocString(v7);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  char v4;
  __CFString *v5;
  void *v6;

  -[PedestrianARArrowGuidanceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_dynamicArrowImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) != 0)
  {
    v5 = &stru_25025B660;
  }
  else
  {
    -[PedestrianARArrowGuidanceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_instructionLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
