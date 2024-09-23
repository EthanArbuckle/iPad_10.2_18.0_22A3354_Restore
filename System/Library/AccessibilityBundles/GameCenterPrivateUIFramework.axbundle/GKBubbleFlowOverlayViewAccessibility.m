@implementation GKBubbleFlowOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKBubbleFlowOverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

@end
