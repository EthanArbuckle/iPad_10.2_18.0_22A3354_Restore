@implementation HULegibilityLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HULegibilityLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  objc_super v4;

  if ((-[HULegibilityLabelAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", AXHomeUIUseAccessibilityFrameForHitTest) & 1) != 0)return 1;
  v4.receiver = self;
  v4.super_class = (Class)HULegibilityLabelAccessibility;
  return -[HULegibilityLabelAccessibility _accessibilityUseAccessibilityFrameForHittest](&v4, sel__accessibilityUseAccessibilityFrameForHittest);
}

@end
