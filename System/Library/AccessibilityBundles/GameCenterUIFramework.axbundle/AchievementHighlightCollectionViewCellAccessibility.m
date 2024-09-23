@implementation AchievementHighlightCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.AchievementHighlightCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementHighlightCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementHighlightCollectionViewCell"), CFSTR("accessibilitySubtitleLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[AchievementHighlightCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilitySubtitleLabel"));
}

@end
