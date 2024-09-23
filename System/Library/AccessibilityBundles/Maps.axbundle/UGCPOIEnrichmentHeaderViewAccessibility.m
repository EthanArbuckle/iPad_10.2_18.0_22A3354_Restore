@implementation UGCPOIEnrichmentHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UGCPOIEnrichmentHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UGCPOIEnrichmentHeaderView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UGCPOIEnrichmentHeaderView"), CFSTR("_secondaryLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[UGCPOIEnrichmentHeaderViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel, _secondaryLabel"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0] | *MEMORY[0x24BDF7410];
}

@end
