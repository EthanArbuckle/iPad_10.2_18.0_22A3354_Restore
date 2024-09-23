@implementation BuddyExpressSetupFeatureCardPrimaryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BuddyExpressSetupFeatureCardPrimaryCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyExpressSetupFeatureCardPrimaryCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyExpressSetupFeatureCardPrimaryCell"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyExpressSetupFeatureCardPrimaryCell"), CFSTR("setExpanded:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyExpressSetupFeatureCardPrimaryCell"), CFSTR("isExpanded"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[BuddyExpressSetupFeatureCardPrimaryCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel, subtitleLabel"));
}

- (int64_t)_accessibilityExpandedStatus
{
  if (-[BuddyExpressSetupFeatureCardPrimaryCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))return 1;
  else
    return 2;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (void)setExpanded:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BuddyExpressSetupFeatureCardPrimaryCellAccessibility;
  -[BuddyExpressSetupFeatureCardPrimaryCellAccessibility setExpanded:](&v3, sel_setExpanded_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
