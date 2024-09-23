@implementation EditorsChoiceCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.EditorsChoiceCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  const __CFString *v3;

  if (-[EditorsChoiceCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityShowsBadge")))v3 = CFSTR("accessibilityBadgeView, accessibilityTitleLabel, accessibilityTextLabel");
  else
    v3 = CFSTR("accessibilityTitleLabel, accessibilityTextLabel");
  -[EditorsChoiceCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
