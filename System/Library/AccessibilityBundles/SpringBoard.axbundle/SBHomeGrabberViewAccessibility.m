@implementation SBHomeGrabberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHomeGrabberView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBHomeGrabberView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBHomeGrabberView"), CFSTR("_touchState"), "q");

}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73E0];
  v3 = -[SBHomeGrabberViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_touchState"));
  v4 = *MEMORY[0x24BDF73E8];
  if (v3 != 1)
    v4 = 0;
  return v4 | v2;
}

@end
