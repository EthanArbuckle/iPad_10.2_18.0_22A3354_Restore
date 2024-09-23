@implementation AVScrubberAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVScrubber");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVScrubber"), CFSTR("continueTrackingWithTouch:withEvent:"), "B", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISlider"), CFSTR("_accessibilityAnnounceNewValue"), "v", 0);

}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)AVScrubberAccessibility;
  -[AVScrubberAccessibility accessibilityFrame](&v6, sel_accessibilityFrame);
  if (v5 == 0.0)
    v5 = 5.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVScrubberAccessibility;
  v4 = -[AVScrubberAccessibility continueTrackingWithTouch:withEvent:](&v6, sel_continueTrackingWithTouch_withEvent_, a3, a4);
  AXPerformSafeBlock();
  return v4;
}

uint64_t __63__AVScrubberAccessibility_continueTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityAnnounceNewValue");
}

@end
