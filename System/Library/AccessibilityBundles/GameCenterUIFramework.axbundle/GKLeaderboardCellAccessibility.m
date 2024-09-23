@implementation GKLeaderboardCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKLeaderboardCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKLeaderboardCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKLeaderboardCell"), CFSTR("countLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[GKLeaderboardCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel, countLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKLeaderboardCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[GKLeaderboardCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
