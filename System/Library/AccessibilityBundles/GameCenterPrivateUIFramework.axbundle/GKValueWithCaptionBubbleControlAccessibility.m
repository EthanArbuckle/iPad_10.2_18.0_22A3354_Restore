@implementation GKValueWithCaptionBubbleControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKValueWithCaptionBubbleControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKValueWithCaptionBubbleControl"), CFSTR("captionText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKValueWithCaptionBubbleControl"), CFSTR("valueText"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[GKValueWithCaptionBubbleControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("captionText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKValueWithCaptionBubbleControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("valueText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityPath
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v8;
  double v9;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  -[GKValueWithCaptionBubbleControlAccessibility accessibilityFrame](self, "accessibilityFrame");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  MidY = CGRectGetMidY(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v8 = CGRectGetWidth(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v9 = CGRectGetHeight(v14);
  if (v8 >= v9)
    v9 = v8;
  return (id)objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v9 * 0.5, 0.0, 6.28318531);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;

  if (!-[GKValueWithCaptionBubbleControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_accessibilityViewIsVisible")))return 0;
  -[GKValueWithCaptionBubbleControlAccessibility accessibilityLabel](self, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

@end
