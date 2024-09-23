@implementation SBFluidSwitcherTouchPassThroughScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFluidSwitcherTouchPassThroughScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBFluidSwitcherTouchPassThroughScrollView"), CFSTR("UIScrollView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("_forwardsToParentScroller"), "B", 0);

}

- (id)focusGroupIdentifier
{
  objc_super v4;

  if ((-[SBFluidSwitcherTouchPassThroughScrollViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherTouchPassThroughScrollViewAccessibility;
  -[SBFluidSwitcherTouchPassThroughScrollViewAccessibility focusGroupIdentifier](&v4, sel_focusGroupIdentifier);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_forwardsToParentScroller
{
  objc_super v4;

  if ((-[SBFluidSwitcherTouchPassThroughScrollViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 1;
  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherTouchPassThroughScrollViewAccessibility;
  return -[SBFluidSwitcherTouchPassThroughScrollViewAccessibility _forwardsToParentScroller](&v4, sel__forwardsToParentScroller);
}

@end
