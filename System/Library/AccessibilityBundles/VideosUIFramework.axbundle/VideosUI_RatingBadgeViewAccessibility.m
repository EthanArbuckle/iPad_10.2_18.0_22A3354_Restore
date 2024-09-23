@implementation VideosUI_RatingBadgeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.RatingBadgeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("VideosUI.RatingBadgeView"), CFSTR("UIView"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  -[VideosUI_RatingBadgeViewAccessibility safeSwiftCGFloatForKey:](self, "safeSwiftCGFloatForKey:", CFSTR("rating"));
  v3 = v2;
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("rating.stars"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_accessibilityUnfocusableViewCanBeFocusedForHoverText
{
  return 1;
}

- (BOOL)_accessibilityDisplayFocusIndicatorForHoverTextView
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  objc_super v4;

  if ((-[VideosUI_RatingBadgeViewAccessibility _accessibilityIsFocusForHoverTextRunningForFocusItem](self, "_accessibilityIsFocusForHoverTextRunningForFocusItem") & 1) != 0)return 1;
  v4.receiver = self;
  v4.super_class = (Class)VideosUI_RatingBadgeViewAccessibility;
  return -[VideosUI_RatingBadgeViewAccessibility canBecomeFocused](&v4, sel_canBecomeFocused);
}

@end
