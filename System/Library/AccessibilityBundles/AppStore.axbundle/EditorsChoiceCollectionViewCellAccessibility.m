@implementation EditorsChoiceCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.EditorsChoiceCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.EditorsChoiceCollectionViewCell"), CFSTR("accessibilityBadgeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.EditorsChoiceCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.EditorsChoiceCollectionViewCell"), CFSTR("accessibilityTextLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.EditorsChoiceCollectionViewCell"), CFSTR("accessibilityShowsBadge"), "B", 0);

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
