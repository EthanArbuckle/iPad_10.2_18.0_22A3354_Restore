@implementation BuddyExpressSetupFeatureCardCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BuddyExpressSetupFeatureCardCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyExpressSetupFeatureCardCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyExpressSetupFeatureCardCell"), CFSTR("stateLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyExpressSetupFeatureCardCell"), CFSTR("subtitleLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[BuddyExpressSetupFeatureCardCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel, stateLabel, subtitleLabel"));
}

@end
