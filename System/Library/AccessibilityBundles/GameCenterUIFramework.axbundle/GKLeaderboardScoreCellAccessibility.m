@implementation GKLeaderboardScoreCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKLeaderboardScoreCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKLeaderboardScoreCell"), CFSTR("rankLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKLeaderboardScoreCell"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKLeaderboardScoreCell"), CFSTR("scoreLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[GKLeaderboardScoreCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("rankLabel, nameLabel, scoreLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKLeaderboardScoreCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[GKLeaderboardScoreCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
