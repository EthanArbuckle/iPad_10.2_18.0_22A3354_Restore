@implementation AchievementsLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.AchievementsLinkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementsLinkView"), CFSTR("accessibilityTitleLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[AchievementsLinkViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AchievementsLinkViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[AchievementsLinkViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
